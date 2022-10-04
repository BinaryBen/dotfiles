<!--

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the &quot;Software&quot;), to
deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER

-->

<template>
  <!-- s. https://vuetifyjs.com/ -->

  <v-container>
    <v-layout text-center wrap>
      <v-flex xs12>
        <div class="text-center">
          <v-menu offset-y>
            <template v-slot:activator="{ on }">
              <v-btn color="primary" dark v-on="on">Dropdown</v-btn>
            </template>
            <v-list>
              <v-list-item
                v-for="(item, index) in ['item 1', 'item 2', 'item 3']"
                :key="index"
                @click
              >
                <v-list-item-title>{{ item }}</v-list-item-title>
              </v-list-item>
            </v-list>
          </v-menu>
        </div>
      </v-flex>

      <v-flex xs12 mt-4>
        <pre text-left>{{ lastMessageFromExtension }}</pre>
      </v-flex>

      <v-flex xs12>
        <v-img :src="'https://cdn.vuetifyjs.com/images/logos/vuetify-logo-300.png'" class="my-3" contain height="200"></v-img>
      </v-flex>

      <v-flex mb-4>
        <h1 class="display-2 font-weight-bold mb-3">Welcome to Vuetify</h1>
        <p class="subheading font-weight-regular">
          For help and collaboration with other Vuetify developers,
          <br />please join our online
          <a
            href="https://community.vuetifyjs.com"
            target="_blank"
          >Discord Community</a>
        </p>
      </v-flex>

      <v-flex mb-5 xs12>
        <h2 class="headline font-weight-bold mb-3">What's next?</h2>

        <v-layout justify-center>
          <a
            v-for="(next, i) in whatsNext"
            :key="i"
            :href="next.href"
            class="subheading mx-3"
            target="_blank"
          >{{ next.text }}</a>
        </v-layout>
      </v-flex>

      <v-flex xs12 mb-5>
        <h2 class="headline font-weight-bold mb-3">Important Links</h2>

        <v-layout justify-center>
          <a
            v-for="(link, i) in importantLinks"
            :key="i"
            :href="link.href"
            class="subheading mx-3"
            target="_blank"
          >{{ link.text }}</a>
        </v-layout>
      </v-flex>

      <v-flex xs12 mb-5>
        <h2 class="headline font-weight-bold mb-3">Ecosystem</h2>

        <v-layout justify-center>
          <a
            v-for="(eco, i) in ecosystem"
            :key="i"
            :href="eco.href"
            class="subheading mx-3"
            target="_blank"
          >{{ eco.text }}</a>
        </v-layout>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>

// this is the custom object
// for the Vue instance
const PAGE = {
  data: function() {
    return {
      ecosystem: [
        {
          text: "vuetify-loader",
          href: "https://github.com/vuetifyjs/vuetify-loader"
        },
        {
          text: "github",
          href: "https://github.com/vuetifyjs/vuetify"
        },
        {
          text: "awesome-vuetify",
          href: "https://github.com/vuetifyjs/awesome-vuetify"
        }
      ],
      importantLinks: [
        {
          text: "Documentation",
          href: "https://vuetifyjs.com"
        },
        {
          text: "Chat",
          href: "https://community.vuetifyjs.com"
        },
        {
          text: "Made with Vuetify",
          href: "https://madewithvuejs.com/vuetify"
        },
        {
          text: "Twitter",
          href: "https://twitter.com/vuetifyjs"
        },
        {
          text: "Articles",
          href: "https://medium.com/vuetify"
        }
      ],
      lastMessageFromExtension: null,
      whatsNext: [
        {
          text: "Explore components",
          href: "https://vuetifyjs.com/components/api-explorer"
        },
        {
          text: "Select a layout",
          href: "https://vuetifyjs.com/layout/pre-defined"
        },
        {
          text: "Frequently Asked Questions",
          href:
            "https://vuetifyjs.com/getting-started/frequently-asked-questions"
        }
      ]
    };
  },

  methods: {
    /**
     * This is called, when a command
     * has been received from the app script.
     */
    $onCommand: function(command, data) {
      switch (command) {
        case "hello_back_from_extension":
          {
            // this has been send from
            // 'onEvent()' function
            // in 'index.js'

            this.lastMessageFromExtension =
              "From 'index.js':\n\n" + JSON.stringify(data, null, 2);
          }
          break;
      }
    }
  },

  mounted: function() {
    // send a message to
    // 'onEvent()' function
    // in 'index.js'
    this.$post("hello_from_webview_command", {
      message: "Hello, Echo!"
    });
  }
};

</script>

<style>

/** PUT your CSS style here **/

</style>
