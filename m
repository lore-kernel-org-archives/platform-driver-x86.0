From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform: x86: pcengines-apuv2: detect apuv4 board
Date: Sat, 7 Sep 2019 20:31:44 +0300
Message-ID: <CAHp75Vd_fW7Vb39u2efjt02+M50MDfvOJTrqkJ98CGwmSQORRw@mail.gmail.com>
References: <1566294992-703-1-git-send-email-info@metux.net>
 <CAHp75VfFf7y5iLHSgS+mXa4cE78BC=maF6PWtwEGfgyi2pXKCg@mail.gmail.com> <8e9ee2a1-3731-9427-bd04-2d4327913aa3@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8e9ee2a1-3731-9427-bd04-2d4327913aa3@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 28, 2019 at 2:37 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 22.08.19 21:47, Andy Shevchenko wrote:
>
> >> Fixes: f8eb0235f65989fc5521c40c78d1261e7f25cdbe
> >
> > Wrong format.
> >
> > W/o SoB tag I can't take it.
>
> What's the correct format (what command shall I use to
> create it correctly ?)

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Section 11

And for this one Fixes is not needed. The APUv4 never worked before, correct?


-- 
With Best Regards,
Andy Shevchenko
