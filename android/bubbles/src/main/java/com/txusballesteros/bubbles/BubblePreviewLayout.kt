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

import android.animation.AnimatorInflater
import android.animation.AnimatorSet
import android.content.Context
import android.util.AttributeSet
import android.util.Log
import android.view.MotionEvent
import android.view.View


internal class BubblePreviewLayout : BubbleBaseLayout {
    private var attachedToWindow = false

    constructor(context: Context?) : super(context)
    constructor(context: Context?, attrs: AttributeSet?) : super(context, attrs)
    constructor(context: Context?, attrs: AttributeSet?, defStyleAttr: Int) : super(context, attrs, defStyleAttr)

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
        attachedToWindow = true
    }

    override fun onInterceptTouchEvent(ev: MotionEvent?): Boolean {
        Log.d("PreviewIntercept", ev.toString())
        if (true) {
            return true
        }
        return super.onInterceptTouchEvent(ev)
    }


    override fun onDetachedFromWindow() {
        super.onDetachedFromWindow()
        attachedToWindow = false
    }

    fun toggleVisibility(callback: PreviewCallback?) {
        // So GONE vs INVISIBLE the difference https://stackoverflow.com/a/23211042/8608146
        // GONE will mean it's not there in the layout tree but invisible means it's just hidden
        // So GONE for our use case as we don't want the preview to interrupt touches while hidden
        if (visibility == View.VISIBLE) {
            visibility = View.GONE
            callback?.onHide()
        } else if (visibility == View.GONE) {
            visibility = View.VISIBLE
            callback?.onShow()
        }
    }

    override fun setVisibility(visibility: Int) {
        if (attachedToWindow) {
            if (visibility != getVisibility()) {
                if (visibility == View.VISIBLE) {
//                    Log.d("Ok", "Visible")
                    // todo show some animation for preview opening
                    playAnimation(R.animator.bubble_preview_shown_animator);
                } else {
                    playAnimation(R.animator.bubble_preview_hide_animator);
                    // todo show some animation for preview closing
//                    Log.d("Ok", "Not visible")
                }
            }
        }
        super.setVisibility(visibility)
    }

    private fun playAnimation(animationResourceId: Int) {
        if (!isInEditMode) {
            val animator = AnimatorInflater
                    .loadAnimator(context, animationResourceId) as AnimatorSet
            animator.setTarget(getChildAt(0))
            animator.start()
        }
    }
}