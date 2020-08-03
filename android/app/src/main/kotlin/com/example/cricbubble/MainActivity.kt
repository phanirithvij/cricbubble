package com.example.cricbubble

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.txusballesteros.bubbles.BubbleLayout
import com.txusballesteros.bubbles.BubblesManager
import de.hdodenhof.circleimageview.CircleImageView
import io.flutter.embedding.android.FlutterSurfaceView
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec


class MainActivity : AppCompatActivity() {
    private var flutterView: FlutterView? = null
    private var bubblesManager: BubblesManager? = null
    private var messageChannel: BasicMessageChannel<String>? = null

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

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d("MainActivity", "Hello fk world")

        val args = getArgsFromIntent(intent)
        if (flutterEngine == null) {
            flutterEngine = FlutterEngine(this, args)
            flutterEngine!!.dartExecutor.executeDartEntrypoint(
                    DartExecutor.DartEntrypoint.createDefault()
            )
        }

        setContentView(R.layout.app_layout)
        this.supportActionBar?.hide()

//        val root = findViewById<ConstraintLayout>(R.id.root_view)
//        val linear = root.findViewById<LinearLayout>(R.id.flutter_view_parent)

        initializeBubblesManager()

//        onFlutterViewInit(layout = linear)
        onFlutterViewInit()


        messageChannel = BasicMessageChannel<String>(flutterEngine!!.dartExecutor, CHANNEL, StringCodec.INSTANCE)
        messageChannel!!.setMessageHandler { _, reply ->
            addNewBubble()
            reply.reply("")
        }
    }

    private fun onFlutterViewInit() {
        // Initialize the flutterview
//        val bubbleView = LayoutInflater.from(this@MainActivity).inflate(R.layout.bubble_view, null) as BubbleLayout
//        val transparentFlutterView = bubbleView.findViewById<FlutterView>(R.id.flutter_view)
        val transparentFlutterView = FlutterView(applicationContext, FlutterSurfaceView(applicationContext))
//        val transparentFlutterView = FlutterView(applicationContext, FlutterTextureView(applicationContext))
        transparentFlutterView.id = R.id.flutter_view

//        // Add this view i.e. the newly created transparent flutterview to the R.layout.flutter_view
//        bubbleView.addView(transparentFlutterView)

        // Attach this newly created flutterview to the running instance of the engine
        transparentFlutterView.attachToFlutterEngine(flutterEngine!!)
        this.flutterView = transparentFlutterView
    }

    private fun addNewBubble() {
        // push to array
        // set random color and text based on the index
        val bubbleView = LayoutInflater.from(this@MainActivity).inflate(R.layout.bubble_view, null) as BubbleLayout
        bubbleView.setOnBubbleRemoveListener {
            Toast.makeText(applicationContext, "Closed !",
                    Toast.LENGTH_SHORT).show()
            // remove from array
        }
        bubbleView.setOnBubbleClickListener {
            val circle = CircleImageView(applicationContext)
            circle.borderColor = 0x000000
            circle.borderWidth = 32
            it.addView(circle)
//            it.addView(this.flutterView)
        }
        bubbleView.setShouldStickToWall(true)
        bubblesManager!!.addBubble(bubbleView, 60, 20)
    }

    private fun initializeBubblesManager() {
        bubblesManager = BubblesManager.Builder(this)
                .setTrashLayout(R.layout.bubble_trash_layout)
                .setPreviewLayout(R.layout.preview_layout)
                .setInitializationCallback { addNewBubble() }
                .build()
        bubblesManager!!.initialize()
    }

    override fun onResume() {
        super.onResume()
        flutterEngine!!.lifecycleChannel.appIsResumed()
    }

    override fun onPause() {
        super.onPause()
        flutterEngine!!.lifecycleChannel.appIsInactive()
    }

    override fun onStop() {
        super.onStop()
        flutterEngine!!.lifecycleChannel.appIsPaused()
    }

    override fun onDestroy() {
        flutterView?.detachFromFlutterEngine()
        bubblesManager?.recycle()
        super.onDestroy()
    }

    companion object {
        var flutterEngine: FlutterEngine? = null
        const val CHANNEL = "increment"
    }
}
