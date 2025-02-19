<!DOCTYPE html>
<html>
  <head>
    <title>Joseph's Helm Charts</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/2.10.0/github-markdown.min.css" />
    <style>
      .markdown-body {
        box-sizing: border-box;
        min-width: 200px;
        margin: 0 auto;
        padding: 45px;
      }
    
      @media (max-width: 767px) {
        .markdown-body {
          padding: 15px;
        }
      }
      .clippy {
        margin-top: -3px;
        position: relative;
        top: 3px;
      }

      .snippet { position: relative; }
      .snippet:hover .btn, .snippet .btn:focus {
        opacity: 1;
      }
      .snippet .btn {
        -webkit-transition: opacity .3s ease-in-out;
        -o-transition: opacity .3s ease-in-out;
        transition: opacity .3s ease-in-out;
        opacity: 0;
        padding: 2px 6px;
        position: absolute;
        right: 4px;
        top: 4px;
      }
      .btn {
        position: relative;
        display: inline-block;
        padding: 6px 12px;
        font-size: 13px;
        font-weight: 700;
        line-height: 20px;
        color: #333;
        white-space: nowrap;
        vertical-align: middle;
        cursor: pointer;
        background-color: #eee;
        background-image: linear-gradient(#fcfcfc,#eee);
        border: 1px solid #d5d5d5;
        border-radius: 3px;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        -webkit-appearance: none;
      }

      .charts {
        display: flex;
        flex-wrap: wrap;
      }

      .chart {
        border-radius: 8px;
        overflow: hidden;
        border: 1px solid #d7d9dd;
        transition: transform .2s ease;
        background-color: #eaedef;
        width: 300px;
        margin: 0.5em;
      }
      
      .chart .icon {
        display: flex;
        justify-content: center;
        width: 100%;
        height: 110px;
        background-color: #fff;
        align-items: center;
      }
      .chart .icon img { 
        max-height: 80%;
      }
      .chart .body {
        position: relative;
        display: flex;
        justify-content: center;
        flex: 1;
        border-top: 1px solid #d7d9dd;
        padding: 0 1em;
        flex-direction: column;
        word-wrap: break-word;
        text-align: center;
      }
      .chart .body .info {
        word-wrap: break-word;
        text-align: center;
      }
      .chart .body .description {
        text-align: left;
      }
    </style>
    
  </head>

  <body>

    <section class="markdown-body">
      <h1>Helm Charts</h1>

      <h2>Usage</h2>

      <pre class="snippet" lang="no-highlight" style="padding: 0">
        <button class="btn" onclick="copyToClipboard(this)">
          <img class="clippy" src="/joseph-test-repo/charts/_images/clippy.svg" alt="Copy to clipboard" width="13">
        </button>
        <code id="helm-command">helm repo add sotojn https://joseph-test-organization.github.io/joseph-test-repo/charts</code>
      </pre>

      <script>
        function copyToClipboard(button) {
          // Get the text from the sibling <code> block
          const codeBlock = button.nextElementSibling;
          const textToCopy = codeBlock.textContent;

          // Copy the text to the clipboard
          navigator.clipboard.writeText(textToCopy).then(() => {
            // Provide visual feedback
            // alert('Copied to clipboard: ' + textToCopy);
          }).catch((err) => {
            // console.error('Failed to copy to clipboard:', err);
          });
        }
      </script>

      <p>Run the command above to add the repo to the helm cli client. This will contain all the charts listed under the <a href="#chart-1">Charts section</a> below. This can be validated by running the helm search command below:</p>
      <pre class="snippet" lang="no-highlight" style="padding: 0">
        <button class="btn" onclick="copyToClipboard(this)">
          <img class="clippy" src="/joseph-test-repo/charts/_images/clippy.svg" alt="Copy to clipboard" width="13">
        </button>
        <code id="helm-search-command">helm search repo sotojn --versions</code>
      </pre>

      <h2>Reference Links</h2>
      <p>
        <ul>
          <li><a href="https://github.com/joseph-test-organization/joseph-test-repo">Joseph Test Repo on GitHub</a></li>
        </ul>
      </p>

      <h2>Quickstart</h2>
      <p>Create a helmfile.yaml and paste this in it and save.</p>
      <pre class="snippet" lang="yaml" style="padding: 0">
        <button class="btn" onclick="copyToClipboard(this)">
          <img class="clippy" src="/joseph-test-repo/charts/_images/clippy.svg" alt="Copy to clipboard" width="13">
        </button>
        <code id="helm-search-command" class="yaml">
  repositories:
    - name: joseph-chat
      url: https://joseph-test-organization.github.io/joseph-test-repo/charts

  helmDefaults:
    wait: true

  releases:

    - name: joseph-chat
      namespace: dev
      version: 1.0.0
      chart: joseph-chat/joseph-chat-chart
      values:
        - image:
            tag: "1.0.0"
          service:
            type: NodePort
            nodePort: 30565
        </code>
      </pre>
      <p> Run helmfille sync to submit it to your cluster.

      <h2 id="chart-1">Charts</h2>

      <div class="charts">
			{{range $key, $chartEntry := .Entries }}
        {{ if not (index $chartEntry 0).Deprecated }}
          <div class="chart">
            <a href="{{ (index (index $chartEntry 0).Urls 0) }}" title="{{ (index (index $chartEntry 0).Urls 0) }}">
              <div class="icon">
                <img class="chart-item-logo" alt="{{ $key }}'s logo" src="/joseph-test-repo/charts/_images/{{ (index $chartEntry 0).Name }}.png">
              </div>
              <div class="body">
                <p class="info">
                  {{ (index $chartEntry 0).Name }}
                  ({{ (index $chartEntry 0).Version }}@{{ (index $chartEntry 0).AppVersion }})
                  <a href="https://github.com/joseph-test-organization/joseph-test-repo/pkgs/container/{{ $key }}">
                    <img src="/joseph-test-repo/charts/_images/GitHub-Mark-32px.png" alt="github link" style="height: 16px; width: 16px; vertical-align: middle;" />
                  </a>
                </p>
                <p class="description">
                  {{ (index $chartEntry 0).Description }}
                </p>
              </div>
            </a>
          </div>
        {{end}}
			{{end}}
      </div>
    </section>
		<time datetime="{{ .Generated.Format "2006-01-02T15:04:05" }}" pubdate id="generated">{{ .Generated.Format "Mon Jan 2 2006 03:04:05PM MST-07:00" }}</time>

    <script src="https://unpkg.com/clipboard@2/dist/clipboard.min.js"></script>
    <script>new ClipboardJS('.btn');</script>
  </body>
</html>
