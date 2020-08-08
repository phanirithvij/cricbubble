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

import android.app.Service
import android.content.Context
import android.content.Intent
import android.graphics.PixelFormat
import android.os.*
import android.view.Gravity
import android.view.LayoutInflater
import android.view.View
import android.view.WindowManager
import java.util.*

class BubblesService : Service() {
    private val binder = BubblesServiceBinder()
    private val bubbles: MutableList<BubbleLayout> = ArrayList()
    private lateinit var bubblesTrash: BubbleTrashLayout
    private lateinit var bubblePreview: BubblePreviewLayout
    private var windowManager: WindowManager? = null
    private lateinit var layoutCoordinator: BubblesLayoutCoordinator

    override fun onBind(intent: Intent): IBinder {
        return binder
    }

    override fun onUnbind(intent: Intent): Boolean {
        for (bubble in bubbles) {
            recycleBubble(bubble)
        }
        bubbles.clear()
        return super.onUnbind(intent)
    }

    private fun recycleBubble(bubble: BubbleLayout) {
        Handler(Looper.getMainLooper()).post {
            windowManager!!.removeView(bubble)
            for (cachedBubble in bubbles) {
                if (cachedBubble == bubble) {
                    bubble.notifyBubbleRemoved()
                    bubbles.remove(cachedBubble)
                    break
                }
            }
        }
    }

    private fun initWM(): WindowManager {
        if (windowManager == null) {
            windowManager = getSystemService(Context.WINDOW_SERVICE) as WindowManager
        }
        return windowManager!!
    }


    fun addBubble(bubble: BubbleLayout, x: Int, y: Int) {
        initWM()
        val layoutParams = buildLayoutParamsForBubble(x, y)
        bubble.windowManager = windowManager!!
        bubble.viewParams = layoutParams
        bubble.layoutCoordinator = layoutCoordinator
        bubbles.add(bubble)
        addViewToWindow(bubble)
        // TODO Initialize prev values to restore on initial toggle
        //  But this will restore to initial posititon instead of a roof or floor
        bubble.prevX = x.toFloat()
        bubble.prevY = y.toFloat()
    }

    fun addTrash(trashLayoutResourceId: Int) {
        if (trashLayoutResourceId != 0) {
            initWM()
            bubblesTrash = BubbleTrashLayout(this)
            bubblesTrash.windowManager = windowManager!!
            bubblesTrash.viewParams = buildLayoutParamsForTrash()
            bubblesTrash.visibility = View.GONE
            LayoutInflater.from(this).inflate(trashLayoutResourceId, bubblesTrash, true)
            addViewToWindow(bubblesTrash)
        } else {
            TODO("add in a default trash layout or disable trash functionality?")
        }
    }

    fun addPreview(previewId: Int) {
        if (previewId != 0) {
            initWM()
            bubblePreview = BubblePreviewLayout(this)
            bubblePreview.windowManager = windowManager!!
            bubblePreview.viewParams = buildLayoutParamsForPreview()
            bubblePreview.visibility = View.VISIBLE
            LayoutInflater.from(this).inflate(previewId, bubblePreview, true)
            addViewToWindow(bubblePreview)
        } else {
            TODO("add in a default preview layout or disable whole library functionality?")
        }
    }

    // Must be called after calling addPreview and addTrash
    fun initializeLayoutCoordinator() {
        initWM()
        layoutCoordinator = BubblesLayoutCoordinator.Builder(this)
                .setWindowManager(windowManager!!)
                .setTrashView(bubblesTrash)
                .setPreviewView(bubblePreview)
                .build()
    }

    private fun addViewToWindow(view: BubbleBaseLayout) {
        initWM()
        Handler(Looper.getMainLooper()).post { windowManager!!.addView(view, view.viewParams) }
    }

    private lateinit var params: WindowManager.LayoutParams
    private fun buildLayoutParamsForBubble(x: Int, y: Int): WindowManager.LayoutParams {
        params = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            WindowManager.LayoutParams(
                    WindowManager.LayoutParams.WRAP_CONTENT,
                    WindowManager.LayoutParams.WRAP_CONTENT,
                    WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
                    PixelFormat.TRANSLUCENT)
        } else {
            @Suppress("DEPRECATION")
            WindowManager.LayoutParams(
                    WindowManager.LayoutParams.WRAP_CONTENT,
                    WindowManager.LayoutParams.WRAP_CONTENT,
                    WindowManager.LayoutParams.TYPE_PHONE,
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
                    PixelFormat.TRANSPARENT)
        }
        params.gravity = Gravity.TOP or Gravity.START
        params.x = x
        params.y = y
        return params
    }

    private fun buildLayoutParamsForTrash(): WindowManager.LayoutParams {
        val x = 0
        val y = 0
        val params: WindowManager.LayoutParams = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            WindowManager.LayoutParams(
                    WindowManager.LayoutParams.MATCH_PARENT,
                    WindowManager.LayoutParams.MATCH_PARENT,
                    WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
                    PixelFormat.TRANSPARENT)
        } else {
            @Suppress("DEPRECATION")
            WindowManager.LayoutParams(
                    WindowManager.LayoutParams.MATCH_PARENT,
                    WindowManager.LayoutParams.MATCH_PARENT,
                    WindowManager.LayoutParams.TYPE_SYSTEM_OVERLAY,
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
                    PixelFormat.TRANSPARENT)
        }
        params.x = x
        params.y = y
        return params
    }

    private fun buildLayoutParamsForPreview(): WindowManager.LayoutParams {
        // TODO get screen dimens and place this accordingly
        val x = 100
        val y = 360
        params = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            WindowManager.LayoutParams(
                    WindowManager.LayoutParams.WRAP_CONTENT,
                    WindowManager.LayoutParams.WRAP_CONTENT,
                    WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
                    PixelFormat.TRANSLUCENT)
        } else {
            // TODO check for < O android versions
            @Suppress("DEPRECATION")
            WindowManager.LayoutParams(
                    WindowManager.LayoutParams.WRAP_CONTENT,
                    WindowManager.LayoutParams.WRAP_CONTENT,
                    WindowManager.LayoutParams.TYPE_PHONE,
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
                    PixelFormat.TRANSPARENT)
        }
        params.gravity = Gravity.TOP or Gravity.START
        params.x = x
        params.y = y
        return params
    }

    fun removeBubble(bubble: BubbleLayout) {
        recycleBubble(bubble)
    }

    internal inner class BubblesServiceBinder : Binder() {
        val service: BubblesService
            get() = this@BubblesService
    }
}