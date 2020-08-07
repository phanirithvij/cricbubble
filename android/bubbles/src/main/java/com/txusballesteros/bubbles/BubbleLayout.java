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

import android.animation.Animator;
import android.animation.AnimatorInflater;
import android.animation.AnimatorSet;
import android.content.Context;
import android.graphics.Point;
import android.os.Handler;
import android.os.Looper;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;

import java.util.ArrayList;

public class BubbleLayout extends BubbleBaseLayout {
    private float initialTouchX;
    private float initialTouchY;
    private int initialX;
    private int initialY;
    private OnBubbleRemoveListener onBubbleRemoveListener;
    private OnBubbleClickListener onBubbleClickListener;
    private static final int TOUCH_TIME_THRESHOLD = 150;
    private long lastTouchDown;
    private MoveAnimator animator;
    private int width;
    private int height;
<<<<<<< HEAD
    float prevX;
    float prevY;
=======
    private float prevX;
    private float prevY;
>>>>>>> d9c3756cf9990639d55e4de8ff81c2cb2d26bd61
    private float prevRawX;
    private float prevRawY;
    private WindowManager windowManager;
    private boolean shouldStickToWall = true;

    public void setOnBubbleRemoveListener(OnBubbleRemoveListener listener) {
        onBubbleRemoveListener = listener;
    }

    public void setOnBubbleClickListener(OnBubbleClickListener listener) {
        onBubbleClickListener = listener;
    }

    public BubbleLayout(Context context) {
        super(context);
        animator = new MoveAnimator();
        windowManager = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
        initializeView();
    }

    public BubbleLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        animator = new MoveAnimator();
        windowManager = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
        initializeView();
    }

    public BubbleLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        animator = new MoveAnimator();
        windowManager = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
        initializeView();
    }

    public void setShouldStickToWall(boolean shouldStick) {
        this.shouldStickToWall = shouldStick;
    }

    void notifyBubbleRemoved() {
        if (onBubbleRemoveListener != null) {
            onBubbleRemoveListener.onBubbleRemoved(this);
        }
    }

    private void initializeView() {
        setClickable(true);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        playAnimation();
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (event != null) {
<<<<<<< HEAD
//            Log.d("BubbleLayout", event.toString());
=======
            Log.d("BubbleLayout", event.toString());
>>>>>>> d9c3756cf9990639d55e4de8ff81c2cb2d26bd61
            switch (event.getAction()) {
                case MotionEvent.ACTION_DOWN:
                    initialX = getViewParams().x;
                    initialY = getViewParams().y;
                    initialTouchX = event.getRawX();
                    initialTouchY = event.getRawY();
                    playAnimationClickDown();
                    lastTouchDown = System.currentTimeMillis();
                    updateSize();
                    animator.stop();
                    break;
                case MotionEvent.ACTION_MOVE:
                    int x = initialX + (int) (event.getRawX() - initialTouchX);
                    int y = initialY + (int) (event.getRawY() - initialTouchY);
                    if (getLayoutCoordinator() != null) {
                        // Fixes the flicker bug in trash layout
                        // Update the coords only if magnetism not applied
                        if (!getLayoutCoordinator().trashView.magnetismApplied) {
                            getViewParams().x = x;
                            getViewParams().y = y;
                        } else {
                            // If magnetism is applied prevent moving for small mouse move deltas
                            float dx = (prevRawX - event.getRawX());
                            float dy = (prevRawY - event.getRawY());
                            if (dx * dx + dy * dy > 2) {
                                getViewParams().x = x;
                                getViewParams().y = y;
                            }
                        }
                    }
                    getWindowManager().updateViewLayout(this, getViewParams());
                    if (getLayoutCoordinator() != null) {
<<<<<<< HEAD
                        // Fixes the toggle bug
                        // Makes sure the events have different touch position
=======
>>>>>>> d9c3756cf9990639d55e4de8ff81c2cb2d26bd61
                        float dx = (prevRawX - event.getRawX());
                        float dy = (prevRawY - event.getRawY());
                        if (dx * dx + dy * dy > 2) {
                            getLayoutCoordinator().notifyBubblePositionChanged(this, x, y);
<<<<<<< HEAD
                            // TODO preview enter and hide animations need to two add animation xml files
=======
//                        TODO bug fix click to toggle not working
>>>>>>> d9c3756cf9990639d55e4de8ff81c2cb2d26bd61
                            getLayoutCoordinator().hidePreview();
                        }
                    }
                    break;
                case MotionEvent.ACTION_UP:
                    goToWall();
                    if (getLayoutCoordinator() != null) {
                        getLayoutCoordinator().notifyBubbleRelease(this);
                        playAnimationClickUp();
                    }
                    if (System.currentTimeMillis() - lastTouchDown < TOUCH_TIME_THRESHOLD) {
                        if (onBubbleClickListener != null) {
                            onBubbleClickListener.onBubbleClick(this);
                            if (getLayoutCoordinator() != null) {
                                getLayoutCoordinator().notifyPreviewVisibilityListener();
                                moveUponPreview();
                            }
                        }
                    }
                    // TODO Action up indicates a click (?)
                    performClick();
                    break;
            }
            prevRawX = event.getRawX();
            prevRawY = event.getRawY();
        }
        performClick();
        return super.onTouchEvent(event);
    }

    @Override
    public boolean performClick() {
        Log.d("BubblesLayout", "Perform Click");
        return super.performClick();
    }

    private void playAnimation() {
        if (!isInEditMode()) {
            AnimatorSet animator = (AnimatorSet) AnimatorInflater
                    .loadAnimator(getContext(), R.animator.bubble_shown_animator);
            animator.setTarget(this);
            animator.start();

            // TODO stick to wall as well
            animator.addListener(new Animator.AnimatorListener() {
                @Override
                public void onAnimationStart(Animator animation) {
                }

                // if done start the stick to wall animation
                @Override
                public void onAnimationEnd(Animator animation) {
                    goToWall();
                }

                @Override
                public void onAnimationCancel(Animator animation) {
                }

                @Override
                public void onAnimationRepeat(Animator animation) {
                }
            });
        }
    }

    private void playAnimationClickDown() {
        if (!isInEditMode()) {
            AnimatorSet animator = (AnimatorSet) AnimatorInflater
                    .loadAnimator(getContext(), R.animator.bubble_down_click_animator);
            animator.setTarget(this);
            animator.start();
        }
    }

    private void playAnimationClickUp() {
        if (!isInEditMode()) {
            AnimatorSet animator = (AnimatorSet) AnimatorInflater
                    .loadAnimator(getContext(), R.animator.bubble_up_click_animator);
            animator.setTarget(this);
            animator.start();
        }
    }

    private void updateSize() {
        DisplayMetrics metrics = new DisplayMetrics();
        windowManager.getDefaultDisplay().getMetrics(metrics);
        Display display = getWindowManager().getDefaultDisplay();
        Point size = new Point();
        display.getSize(size);
        width = (size.x - this.getWidth());
        height = (size.y - this.getHeight());
    }

    public interface OnBubbleRemoveListener {
        void onBubbleRemoved(BubbleLayout bubble);
    }

    public interface OnBubbleClickListener {
        void onBubbleClick(BubbleLayout bubble);
    }

    public void goToWall() {
        if (shouldStickToWall) {
            int middle = width / 2;
            float nearestXWall = getViewParams().x >= middle ? width : 0;
            animator.start(nearestXWall, getViewParams().y);
        }
    }

    public void moveUponPreview() {
        int middleY = height / 2;
        int middleX = width / 2;
        int visibility = getLayoutCoordinator().getPreViewVisibility();
        float nearestW;
        float nearestFC;
        // View.VISIBLE because we are calling this function after calling toggleVisibility
        if (visibility == View.VISIBLE) {
            prevX = getViewParams().x;
            prevY = getViewParams().y;
<<<<<<< HEAD
            nearestFC = getViewParams().y >= middleY ? height - 20 : 20;
            nearestW = prevX;
            if (shouldStickToWall) {
                nearestW = getViewParams().x >= middleX ? width : 0;
            }
=======
            nearestFC = getViewParams().y >= middleY ? height-20 : 20;
            nearestW = getViewParams().x >= middleX ? width : 0;
>>>>>>> d9c3756cf9990639d55e4de8ff81c2cb2d26bd61
            animator.start(nearestW, nearestFC);
        } else {
            animator.start(prevX, prevY);
        }
    }

    private void move(float deltaX, float deltaY) {
        getViewParams().x += deltaX;
        getViewParams().y += deltaY;
        windowManager.updateViewLayout(this, getViewParams());
    }


    class MoveAnimator implements Runnable {
        private Handler handler = new Handler(Looper.getMainLooper());
        private float destinationX;
        private float destinationY;
        private long startingTime;
        private ArrayList<MoveAnimatorListener> mlisteners;

        private void start(float x, float y) {
            safeInit();
            this.destinationX = x;
            this.destinationY = y;
            startingTime = System.currentTimeMillis();
            for (int i = 0; i < mlisteners.size(); i++) {
                mlisteners.get(i).onAnimationStart(this);
            }
            handler.post(this);
        }

        private void safeInit() {
            if (mlisteners == null) {
                mlisteners = new ArrayList<>();
            }
        }

        void addListener(MoveAnimatorListener listener) {
            safeInit();
            mlisteners.add(listener);
        }

        @Override
        public void run() {
            if (getRootView() != null && getRootView().getParent() != null) {
                float progress = Math.min(1, (System.currentTimeMillis() - startingTime) / 400f);
                float deltaX = (destinationX - getViewParams().x) * progress;
                float deltaY = (destinationY - getViewParams().y) * progress;
                move(deltaX, deltaY);
                if (progress < 1) {
                    handler.post(this);
                } else {
                    for (int i = 0; i < mlisteners.size(); i++) {
                        mlisteners.get(i).onAnimationEnd(this);
                    }
                }
            }
        }

        private void stop() {
            handler.removeCallbacks(this);
            removeAllListeners();
        }

        void removeAllListeners() {
            this.mlisteners.clear();
        }

        void removeListener(MoveAnimatorListener listener) {
            if (this.mlisteners.isEmpty()) return;

            this.mlisteners.remove(listener);
        }
    }
}


interface MoveAnimatorListener {
    void onAnimationEnd(BubbleLayout.MoveAnimator animation);

    void onAnimationStart(BubbleLayout.MoveAnimator animation);
}
