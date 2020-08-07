/*
 * Copyright Txus Ballesteros 2015 (@txusballesteros)
 *
 * This file is part of some open source application.
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 *
 * Contact: Txus Ballesteros <txus.ballesteros@gmail.com>
 */
package com.txusballesteros.bubbles

import android.animation.Animator
import android.animation.Animator.AnimatorListener
import android.animation.AnimatorInflater
import android.animation.AnimatorSet
import android.content.Context
import android.content.res.Resources
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.AttributeSet
import android.util.Log
import android.view.MotionEvent
import android.view.View
import android.view.WindowManager
import androidx.annotation.RequiresApi
import com.txusballesteros.bubbles.BubbleLayout.MoveAnimator
import java.util.*
import kotlin.math.min

class BubbleLayout : BubbleBaseLayout {
    private var initialTouchX = 0f
    private var initialTouchY = 0f
    private var initialX = 0
    private var initialY = 0
    private var onBubbleRemoveListener: OnBubbleRemoveListener? = null
    private var onBubbleClickListener: OnBubbleClickListener? = null
    private var lastTouchDown: Long = 0
    private var animator: MoveAnimator
    private var screenWidth = 0
    private var screenHeight = 0

    @JvmField
    var prevX = 0f

    @JvmField
    var prevY = 0f
    private var prevRawX = 0f
    private var prevRawY = 0f
    override var windowManager: WindowManager?
    var shouldStickToWall = true
    fun setOnBubbleRemoveListener(listener: OnBubbleRemoveListener?) {
        onBubbleRemoveListener = listener
    }

    fun setOnBubbleClickListener(listener: OnBubbleClickListener?) {
        onBubbleClickListener = listener
    }

    constructor(context: Context) : super(context) {
        animator = MoveAnimator()
        windowManager = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
        initializeView()
    }

    constructor(context: Context, attrs: AttributeSet?) : super(context, attrs) {
        animator = MoveAnimator()
        windowManager = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
        initializeView()
    }

    constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int) : super(context, attrs, defStyleAttr) {
        animator = MoveAnimator()
        windowManager = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
        initializeView()
    }

    fun notifyBubbleRemoved() {
        if (onBubbleRemoveListener != null) {
            onBubbleRemoveListener!!.onBubbleRemoved(this)
        }
    }

    private fun initializeView() {
        isClickable = true
    }

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
        playAnimation()
    }

    override fun onTouchEvent(event: MotionEvent): Boolean {
        when (event.action) {
            MotionEvent.ACTION_DOWN -> {
                initialX = viewParams!!.x
                initialY = viewParams!!.y
                initialTouchX = event.rawX
                initialTouchY = event.rawY
                playAnimationClickDown()
                lastTouchDown = System.currentTimeMillis()
                updateSize()
                animator.stop()
            }
            MotionEvent.ACTION_MOVE -> {
                val x = initialX + (event.rawX - initialTouchX).toInt()
                val y = initialY + (event.rawY - initialTouchY).toInt()
                if (layoutCoordinator != null) {
                    // Fixes the flicker bug in trash layout
                    // Update the coordinates only if magnetism not applied
                    if (!layoutCoordinator!!.trashView!!.magnetismApplied) {
                        viewParams!!.x = x
                        viewParams!!.y = y
                    } else {
                        // If magnetism is applied prevent moving for small mouse move deltas
                        val dx = prevRawX - event.rawX
                        val dy = prevRawY - event.rawY
                        if (dx * dx + dy * dy > 2) {
                            viewParams!!.x = x
                            viewParams!!.y = y
                        }
                    }
                }
                windowManager!!.updateViewLayout(this, viewParams)
                if (layoutCoordinator != null) {
                    // Fixes the toggle bug
                    // Makes sure the events have different touch position
                    val dx = prevRawX - event.rawX
                    val dy = prevRawY - event.rawY
                    if (dx * dx + dy * dy > 2) {
                        layoutCoordinator!!.notifyBubblePositionChanged(this, x, y)
                        // TODO preview enter and hide animations need to two add animation xml files
                        layoutCoordinator!!.hidePreview()
                    }
                }
            }
            MotionEvent.ACTION_UP -> {
                goToWall()
                if (layoutCoordinator != null) {
                    layoutCoordinator!!.notifyBubbleRelease(this)
                    playAnimationClickUp()
                }
                if (System.currentTimeMillis() - lastTouchDown < TOUCH_TIME_THRESHOLD) {
                    if (onBubbleClickListener != null) {
                        onBubbleClickListener!!.onBubbleClick(this)
                        if (layoutCoordinator != null) {
                            layoutCoordinator!!.notifyPreviewVisibilityListener()
                            moveUponPreview()
                        }
                    }
                }
                // TODO Action up indicates a click (?)
                performClick()
            }
        }
        prevRawX = event.rawX
        prevRawY = event.rawY
        return super.onTouchEvent(event)
    }

    override fun performClick(): Boolean {
        Log.d("BubblesLayout", "Perform Click")
        return super.performClick()
    }

    private fun playAnimation() {
        if (!isInEditMode) {
            // Must call this here to initialize width and height
            updateSize()
            val animator = AnimatorInflater
                    .loadAnimator(context, R.animator.bubble_shown_animator) as AnimatorSet
            animator.setTarget(this)
            // TODO stick to wall as well
            animator.addListener(object : AnimatorListener {
                override fun onAnimationStart(animation: Animator) {
                    Log.d("BubbleLayout", animation.isStarted.toString())
                    Log.d("BubbleLayout", "Start")
                }

                // if done start the stick to wall animation
                @RequiresApi(api = Build.VERSION_CODES.N)
                override fun onAnimationEnd(animation: Animator) {
                    Log.d("BubbleLayout", animation.totalDuration.toString())
                    Log.d("BubbleLayout", "End")
                    goToWall()
                }

                override fun onAnimationCancel(animation: Animator) {
                    Log.d("BubbleLayout", "Cancelled")
                }

                override fun onAnimationRepeat(animation: Animator) {
                    Log.d("BubbleLayout", animation.duration.toString())
                    Log.d("BubbleLayout", "repeat")
                }
            })
            animator.start()
        }
    }

    private fun playAnimationClickDown() {
        if (!isInEditMode) {
            val animator = AnimatorInflater
                    .loadAnimator(context, R.animator.bubble_down_click_animator) as AnimatorSet
            animator.setTarget(this)
            animator.start()
        }
    }

    private fun playAnimationClickUp() {
        if (!isInEditMode) {
            val animator = AnimatorInflater
                    .loadAnimator(context, R.animator.bubble_up_click_animator) as AnimatorSet
            animator.setTarget(this)
            animator.start()
        }
    }

    private fun updateSize() {
        val sw = Resources.getSystem().displayMetrics.widthPixels
        val sh = Resources.getSystem().displayMetrics.widthPixels
        screenWidth = sw - this.width
        screenHeight = sh - this.height
    }

    interface OnBubbleRemoveListener {
        fun onBubbleRemoved(bubble: BubbleLayout?)
    }

    interface OnBubbleClickListener {
        fun onBubbleClick(bubble: BubbleLayout?)
    }

    fun goToWall() {
        Log.d("BubblesLayout", "Should stick to wall??")
        Log.d("BubblesLayout", screenWidth.toString() + viewParams!!.x)
        if (shouldStickToWall) {
            val middle = screenWidth / 2
            val nearestXWall = if (viewParams!!.x >= middle) screenWidth.toFloat() else 0.toFloat()
            animator.start(nearestXWall, viewParams!!.y.toFloat())
            Log.d("BubblesLayout", nearestXWall.toString())
        }
    }

    fun moveUponPreview() {
        val middleY = screenHeight / 2
        val middleX = screenWidth / 2
        val visibility = layoutCoordinator!!.preViewVisibility
        var nearestW: Float
        val nearestFC: Float
        // View.VISIBLE because we are calling this function after calling toggleVisibility
        if (visibility == View.VISIBLE) {
            prevX = viewParams!!.x.toFloat()
            prevY = viewParams!!.y.toFloat()
            nearestFC = if (viewParams!!.y >= middleY) (screenHeight - 20).toFloat() else 20.toFloat()
            nearestW = prevX
            if (shouldStickToWall) {
                nearestW = if (viewParams!!.x >= middleX) screenWidth.toFloat() else 0.toFloat()
            }
            animator.start(nearestW, nearestFC)
        } else {
            animator.start(prevX, prevY)
        }
    }

    private fun move(deltaX: Float, deltaY: Float) {
        viewParams!!.x += deltaX.toInt()
        viewParams!!.y += deltaY.toInt()
        windowManager!!.updateViewLayout(this, viewParams)
    }

    internal inner class MoveAnimator : Runnable {
        private val handler = Handler(Looper.getMainLooper())
        private var destinationX = 0f
        private var destinationY = 0f
        private var startingTime: Long = 0
        private var mlisteners: ArrayList<MoveAnimatorListener>? = null
        fun start(x: Float, y: Float) {
            safeInit()
            destinationX = x
            destinationY = y
            startingTime = System.currentTimeMillis()
            for (i in mlisteners!!.indices) {
                mlisteners!![i].onAnimationStart(this)
            }
            handler.post(this)
        }

        private fun safeInit() {
            if (mlisteners == null) {
                mlisteners = ArrayList()
            }
        }

        fun addListener(listener: MoveAnimatorListener) {
            safeInit()
            mlisteners!!.add(listener)
        }

        override fun run() {
            if (rootView != null && rootView.parent != null) {
                val progress = min(1f, (System.currentTimeMillis() - startingTime) / 400f)
                val deltaX = (destinationX - viewParams!!.x) * progress
                val deltaY = (destinationY - viewParams!!.y) * progress
                move(deltaX, deltaY)
                if (progress < 1) {
                    handler.post(this)
                } else {
                    for (i in mlisteners!!.indices) {
                        mlisteners!![i].onAnimationEnd(this)
                    }
                }
            }
        }

        fun stop() {
            handler.removeCallbacks(this)
            removeAllListeners()
        }

        private fun removeAllListeners() {
            mlisteners!!.clear()
        }

        fun removeListener(listener: MoveAnimatorListener?) {
            if (mlisteners!!.isEmpty()) return
            mlisteners!!.remove(listener)
        }
    }

    companion object {
        private const val TOUCH_TIME_THRESHOLD = 150
    }
}

internal interface MoveAnimatorListener {
    fun onAnimationEnd(animation: MoveAnimator?)
    fun onAnimationStart(animation: MoveAnimator?)
}