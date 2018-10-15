package com.example.asus.testkotlin

import android.os.AsyncTask
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.EditText
import kotlinx.android.synthetic.main.activity_crud.*
import org.apache.http.client.methods.HttpGet
import org.apache.http.entity.StringEntity
import org.apache.http.impl.client.DefaultHttpClient
import org.json.JSONObject
import java.io.BufferedReader
import java.io.IOException
import java.io.InputStream
import java.io.InputStreamReader

class CRUD : AppCompatActivity() {

     var id : String = ""
     var name : String = ""
     var hasil : String = ""
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_crud)
        id =  editText.text.toString()
        name = editText2.text.toString()//textView2.toString() //findViewById<EditText>( R.id.editText2).toString()

    }

    public fun btnSimpan (v : View)
    {
        id =  editText.text.toString()
        name = editText2.text.toString()
        HttpAsyncTaskPost().execute("http://10.0.2.2:8070/maps/tambah.php?id=$id&name=$name")
    }
    public fun btnHapus (v : View)
    {
        id =  editText.text.toString()
        name = editText2.text.toString()
        HttpAsyncTaskPost().execute("http://10.0.2.2:8070/maps/hapus.php?id=$id&name=$name")
    }
    public fun btnUpdate(v : View)
    {
        id =  editText.text.toString()
        name = editText2.text.toString()
        HttpAsyncTaskPost().execute("http://10.0.2.2:8070/maps/update.php?id=$id&name=$name")
    }

    fun POST(url: String, id: String, name : String): String {
        var inputStream: InputStream? = null
        var result = ""
        try {

            // 1. create HttpClient
            val httpclient = DefaultHttpClient()

            // 2. make POST request to the given URL
            val httpGet = HttpGet(url)

            var json = ""

            // 3. build jsonObject
            val jsonObject = JSONObject()
            jsonObject.accumulate("username", id)
            jsonObject.accumulate("name", name)
            //jsonObject.accumulate("latitude", loc.getLatitude())
            // jsonObject.accumulate("updatestatus", loc.getUpdate())


            // 4. convert JSONObject to JSON to String
            json = jsonObject.toString()

            // 5. set json to StringEntity
            val se = StringEntity(json)

            // 6. set httpPost Entity
            //httpGet.sesetEntity(se)

            // 7. Set some headers to inform server about the type of the content
            httpGet.setHeader("Accept", "application/json")
            httpGet.setHeader("Content-type", "application/json")

            // 8. Execute POST request to the given URL
            val httpResponse = httpclient.execute(httpGet)

            // 9. receive response as inputStream
            inputStream = httpResponse.getEntity().getContent()

            // 10. convert inputstream to string
            if (inputStream != null)
            {
                //result = inputStream.bufferedReader().use(BufferedReader::readText)
                result = convertInputStreamToString(inputStream)
                //Toast.makeText(getBaseContext(), ""+result, Toast.LENGTH_LONG).show()
            }

            else
            {
                result = "Did not work!"
            }

            hasil = result

        } catch (e: Exception) {
            Log.d("InputStream", e.localizedMessage)
        }

        // 11. return result
        return result
    }

    @Throws(IOException::class)
    private fun convertInputStreamToString(inputStream: InputStream): String {


        BufferedReader(InputStreamReader(inputStream)).use {
            val response = StringBuffer()

            var inputLine = it.readLine()
            while (inputLine != null) {
                response.append(inputLine)
                inputLine = it.readLine()
            }
            val result = response.toString()
            return result
        }
    }



    private inner class HttpAsyncTaskPost : AsyncTask<String, Void, String>() {
        override fun doInBackground(vararg urls: String): String {
            return POST(urls[0], id,name)
        }

        override fun onPostExecute(result: String) {
            //Toast.makeText(applicationContext, "User : $userid, Lat : $lat, Long : $lng", Toast.LENGTH_SHORT).show()
            //Toast.makeText(getBaseContext(), ""+hasil, Toast.LENGTH_LONG).show();

        }
    }
}
