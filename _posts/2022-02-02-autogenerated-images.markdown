## Creating images with Machine Learning

All that talk about auto-generated music [yesterday](/2022/02/01/sonic-pi.html) reminded me of
[*The Big Sleep*](https://colab.research.google.com/drive/1NCceX2mbiKOSlAd_o7IU7nA9UskKN5WR), an 
awesome [Colab notebook](https://colab.research.google.com/notebooks/intro.ipynb) illustrating
the use of OpenAI's [CLIP](https://github.com/openai/CLIP) to auto-generate images from a textual
prompt.

I went back to the Colab and was happy to see it was still mostly working, I had to simply adjust the version of `pytorch` to `1.10.1` to get it back to a working state. I played around with it
a bit since yesterday, and eventually got this interesting image for prompt "Bob Marley Jamming cartoon".

<p align="center">
  <img src="/images/jammin-with-bob.png" title="Image auto-generated using ML" width="" />
</p>

I did go a bit overboard, and eventually was throttled out of Colab resources for a day.

<p align="center">
  <img src="/images/colab-error.png" title="Colab throttled my usage" width="" />
</p>

This example is a really fun toy, but not as rewarding as coding music, since you have a lot less control over the process, and iteration time is just too slow. Anyway, it's a tangible example of the power of machine learning worth looking into a bit more. [This blog post](https://ml.berkeley.edu/blog/posts/clip-art/) expands on the AI generated art scene and the tech powering it.
