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
import android.os.Build
import android.os.VibrationEffect
import android.os.Vibrator
import android.util.AttributeSet
import android.view.View

internal class BubbleTrashLayout : BubbleBaseLayout {
    @JvmField
    var magnetismApplied = false
    private var attachedToWindow = false
    private var isVibrateInThisSession = false

    constructor(context: Context?) : super(context)
    constructor(context: Context?, attrs: AttributeSet?) : super(context, attrs)
    constructor(context: Context?, attrs: AttributeSet?, defStyleAttr: Int) : super(context, attrs, defStyleAttr)

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
        attachedToWindow = true
    }

    override fun onDetachedFromWindow() {
        super.onDetachedFromWindow()
        attachedToWindow = false
    }

    override fun setVisibility(visibility: Int) {
        if (attachedToWindow) {
            if (visibility != getVisibility()) {
                if (visibility == View.VISIBLE) {
                    playAnimation(R.animator.bubble_trash_shown_animator)
                } else {
                    playAnimation(R.animator.bubble_trash_hide_animator)
                }
            }
        }
        super.setVisibility(visibility)
    }

    // TODO idea: Unrelated to this project
    //  instead of referencing commits and issues assign ids to a function or scope
    //  And ctrl + click to move to that line like linked bookmarks (?)
    fun applyMagnetism() {
        // Fixed: flicker on trash
        // Fixed In Action_MOVE of BubbleBaseLayout
        if (!magnetismApplied) {
            magnetismApplied = true
            playAnimation(R.animator.bubble_trash_shown_magnetism_animator)
        }
    }

    fun vibrate() {
        if (!isVibrateInThisSession) {
            val vibrator = context.getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                vibrator.vibrate(VibrationEffect.createOneShot(VIBRATION_DURATION_IN_MS.toLong(), VibrationEffect.DEFAULT_AMPLITUDE))
            } else {
                //deprecated in API 26
                @Suppress("DEPRECATION")
                vibrator.vibrate(VIBRATION_DURATION_IN_MS.toLong())
            }
            isVibrateInThisSession = true
        }
    }

    fun releaseMagnetism() {
        if (magnetismApplied) {
            magnetismApplied = false
            playAnimation(R.animator.bubble_trash_hide_magnetism_animator)
        }
        isVibrateInThisSession = false
    }

    private fun playAnimation(animationResourceId: Int) {
        if (!isInEditMode) {
            val animator = AnimatorInflater
                    .loadAnimator(context, animationResourceId) as AnimatorSet
            animator.setTarget(getChildAt(0))
            animator.start()
        }
    }

    companion object {
        const val VIBRATION_DURATION_IN_MS = 70
    }
}