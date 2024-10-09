pragma yt.DockerImage = "docker.io/mpereskokova/demo_registry:0.0.0";
pragma yt.DefaultMemoryLimit = "30G";

$script = @@#py
from ollama import Client
import subprocess

def infer_llama(prompt):
    proc = subprocess.Popen(["/bin/ollama", "serve"], stdout=subprocess.DEVNULL)
    client = Client(host='http://localhost:11434')
    client.pull('llama3.1')
    response = client.chat(model='llama3.1', messages=[
        {
            'role': 'user',
            'content': str(prompt),
        },
    ])
    proc.kill()
    return response['message']['content']
@@;
$infer_llama = SystemPython3_11::infer_llama(Callable<(String?)->String>, $script);

select $infer_llama("Why is the sky blue?");
