package com.example.cricbubble

import android.content.Intent
import android.content.res.Resources
import android.os.Bundle
import android.util.Log
import android.view.*
import android.widget.LinearLayout
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.txusballesteros.bubbles.BubbleLayout
import com.txusballesteros.bubbles.BubblesManager
import com.txusballesteros.bubbles.OnInitializedCallback
import com.txusballesteros.bubbles.PreviewCallback
import de.hdodenhof.circleimageview.CircleImageView
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec

class MainActivity : AppCompatActivity() {
    private var flutterView: FlutterView? = null
    private var flutterView2: FlutterView? = null
    private var bubblesManager: BubblesManager? = null
    private var messageChannel: BasicMessageChannel<String>? = null
    private var messageChannel2: BasicMessageChannel<String>? = null

    private fun getArgsFromIntent(intent: Intent): Array<String?>? {
        // Before adding more entries to this list, consider that arbitrary
        // Android applications can generate intents with extra data and that
        // there are many security-sensitive args in the binary.
        val args = ArrayList<String>()
        if (intent.getBooleanExtra("trace-startup", false)) {
            args.add("--trace-startup")
        }
        if (intent.getBooleanExtra("start-paused", false)) {
            args.add("--start-paused")
        }
        if (intent.getBooleanExtra("enable-dart-profiling", false)) {
            args.add("--enable-dart-profiling")
        }
        if (args.isNotEmpty()) {
            val argsArray = arrayOfNulls<String>(args.size)
            return args.toArray(argsArray)
        }
        return null
    }

    lateinit var circle: CircleImageView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val args = getArgsFromIntent(intent)
        if (flutterEngine == null) {
            flutterEngine = FlutterEngine(this, args)
            flutterEngine!!.dartExecutor.executeDartEntrypoint(
                    DartExecutor.DartEntrypoint.createDefault()
            )
        }
        if (flutterEngine2 == null) {
            flutterEngine2 = FlutterEngine(applicationContext, args)
            flutterEngine2!!.dartExecutor.executeDartEntrypoint(
                    DartExecutor.DartEntrypoint.createDefault()
            )
        }

        setContentView(R.layout.app_layout)
        this.supportActionBar?.hide()

        onFlutterViewInit()
        initializeBubblesManager()

        circle = CircleImageView(applicationContext)
        circle.borderColor = 0x000000
        circle.borderWidth = 32

        messageChannel = BasicMessageChannel<String>(flutterEngine!!.dartExecutor, CHANNEL, StringCodec.INSTANCE)
        messageChannel!!.setMessageHandler { _, reply ->
            addNewBubble()
            reply.reply("")
        }
        messageChannel2 = BasicMessageChannel<String>(flutterEngine2!!.dartExecutor, CHANNEL, StringCodec.INSTANCE)
        messageChannel2!!.setMessageHandler { s, reply ->
            when (s) {
                "addBubble" -> {
                    addNewBubble()
                    reply.reply("")
                }
                else -> {
                    reply.reply("failed")
                }
            }
        }
    }

    private fun onFlutterViewInit() {
        // Initialize the flutterview
        val transparentFlutterView = findViewById<FlutterView>(R.id.flutter_view)

//        Handler(Looper.getMainLooper()).post{ Log.d("MainLoop", "Main loop wow!") }
        val previewLayout = LayoutInflater.from(this@MainActivity).inflate(R.layout.preview_layout, null) as LinearLayout
        val transparentFlutterView2 = FlutterView(applicationContext)
//        val transparentFlutterView2 = FlutterView(applicationContext, FlutterSurfaceView(applicationContext, true))
        transparentFlutterView2.id = R.id.flutter_view2
        Log.d("MainActivity", "Are we null?")
        transparentFlutterView2.layoutParams = buildLayoutParamsForPreview()
        previewLayout.addView(transparentFlutterView2)
        Log.d("MainActivity", transparentFlutterView2.visibility.toString())
        Log.d("MainActivity", View.VISIBLE.toString())
//        val transparentFlutterView2 = previewLayout.findViewById<FlutterView>(R.id.flutter_view2)
//        Log.d("main", transparentFlutterView2.toString())
//        val transparentFlutterView = FlutterView(applicationContext, FlutterSurfaceView(applicationContext, true))
        // val transparentFlutterView = FlutterView(applicationContext, FlutterTextureView(applicationContext))
//        transparentFlutterView.id = R.id.flutter_view
        // Attach this newly created flutterview to the running instance of the engine
        transparentFlutterView.attachToFlutterEngine(flutterEngine!!)
        transparentFlutterView2.attachToFlutterEngine(flutterEngine2!!)

        this.flutterView = transparentFlutterView
        // TODO major blocker. Flutter is not rendering in previewLayout but works in bubbleLayout
        //  When added via bubble.addView()
        this.flutterView2 = transparentFlutterView2
    }


    private fun buildLayoutParamsForPreview(): WindowManager.LayoutParams {
        // TODO get screen dimens and place this accordingly
        val params = WindowManager.LayoutParams(
                WindowManager.LayoutParams.MATCH_PARENT,
                WindowManager.LayoutParams.MATCH_PARENT)
        params.gravity = Gravity.TOP or Gravity.START
        params.verticalWeight = 1f
        return params
    }

    private fun addNewBubble() {
        // TODO set random color and text based on the index
        // TODO fix this null warning
        val bubbleView = LayoutInflater.from(this@MainActivity).inflate(R.layout.bubble_view, null) as BubbleLayout
        bubbleView.setOnBubbleRemoveListener(object : BubbleLayout.OnBubbleRemoveListener {
            override fun onBubbleRemoved(bubble: BubbleLayout) {
                Toast.makeText(applicationContext, "Closed !",
                        Toast.LENGTH_SHORT).show()
                // remove from array
//                try {
//                    bubblesManager!!.recycle()
//                } catch (e: java.lang.IllegalArgumentException) {
//                    Log.e("MainActivity", "Cannot recycle again")
//                }
            }
        })
        bubbleView.setOnBubbleClickListener(object : BubbleLayout.OnBubbleClickListener {
            override fun onBubbleClick(bubble: BubbleLayout) {
                flutterView2!!.parent?.toString()?.let { Log.d("MainActivity", it) }
                if (flutterView2!!.parent is BubbleLayout) {
                    (flutterView2!!.parent as ViewGroup).removeView(flutterView2)
                    val previewLayout = LayoutInflater.from(this@MainActivity).inflate(R.layout.preview_layout, null) as LinearLayout
                    previewLayout.addView(flutterView2!!)
                    Log.d("MainActivity", previewLayout.toString())
                } else {
                    (flutterView2!!.parent as ViewGroup).removeView(flutterView2)
                    bubble.addView(flutterView2)
                }
            }
        })
        bubbleView.shouldStickToWall = true
        bubblesManager!!.addBubble(bubbleView, screenWidth(), 300)
    }

    private fun initializeBubblesManager() {
        bubblesManager = BubblesManager.Builder(this)
                // TODO must call both functions for now for the app to not crash
                .setTrashLayout(R.layout.bubble_trash_layout)
                .setPreviewLayout(R.layout.preview_layout)
                .setInitializationCallback(object : OnInitializedCallback {
                    override fun onInitialized() {
                        addNewBubble()
                    }
                })
                .setPreviewCallBack(object : PreviewCallback {
                    override fun onHide() {
                        flutterEngine2!!.lifecycleChannel.appIsPaused()
                    }

                    override fun onShow() {
                        flutterEngine2!!.lifecycleChannel.appIsResumed()
                    }
                })
                .build()
        bubblesManager!!.initialize()
    }

    override fun onResume() {
        super.onResume()
        flutterEngine!!.lifecycleChannel.appIsResumed()
        flutterEngine2!!.lifecycleChannel.appIsResumed()
    }

    override fun onPause() {
        super.onPause()
        flutterEngine!!.lifecycleChannel.appIsPaused()
        flutterEngine2!!.lifecycleChannel.appIsPaused()
    }

    override fun onStop() {
        super.onStop()
        flutterEngine!!.lifecycleChannel.appIsInactive()
        flutterEngine2!!.lifecycleChannel.appIsInactive()
    }

    override fun onDestroy() {
        flutterView?.detachFromFlutterEngine()
        flutterEngine?.destroy()
        flutterView2?.detachFromFlutterEngine()
        flutterEngine2?.destroy()
        bubblesManager?.recycle()
        super.onDestroy()
    }

    companion object {
        var flutterEngine: FlutterEngine? = null
        var flutterEngine2: FlutterEngine? = null
        const val CHANNEL = "increment"
    }

    private fun screenWidth(): Int {
        return Resources.getSystem().displayMetrics.widthPixels
    }

    private fun screenHeight(): Int {
        return Resources.getSystem().displayMetrics.heightPixels
    }
}
