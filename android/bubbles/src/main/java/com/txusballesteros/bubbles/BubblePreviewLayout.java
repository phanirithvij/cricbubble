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
package com.txusballesteros.bubbles;

import android.animation.AnimatorInflater;
import android.animation.AnimatorSet;
import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;

class BubblePreviewLayout extends BubbleBaseLayout {
    private boolean attachedToWindow = false;

    public BubblePreviewLayout(Context context) {
        super(context);
    }

    public BubblePreviewLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public BubblePreviewLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        attachedToWindow = true;
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        attachedToWindow = false;
    }

    public void toggleVisibility() {
        int visibility = this.getVisibility();
        // GONE OR INVISIBLE ????
        Log.d("BubblesPreviewLayout", Integer.toString(visibility));
        if (visibility == View.VISIBLE) {
            this.setVisibility(View.GONE);
        } else if (visibility == View.GONE) {
            this.setVisibility(View.VISIBLE);
        }
    }

    @Override
    public void setVisibility(int visibility) {
        if (attachedToWindow) {
            if (visibility != getVisibility()) {
                if (visibility == VISIBLE) {
                    Log.d("Ok", "Visible");
//                    todo show some animation for preview opening
//                    playAnimation(R.animator.bubble_trash_shown_animator);
                } else {
//                    todo show some animation for preview closing
//                    playAnimation(R.animator.bubble_trash_hide_animator);
                    Log.d("Ok", "Not visible");
                }
            }
        }
        super.setVisibility(visibility);
    }

    private void playAnimation(int animationResourceId) {
        if (!isInEditMode()) {
            AnimatorSet animator = (AnimatorSet) AnimatorInflater
                    .loadAnimator(getContext(), animationResourceId);
            animator.setTarget(getChildAt(0));
            animator.start();
        }
    }
}