From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform: x86: pcengines-apuv2: detect apuv4 board
Date: Mon, 25 Nov 2019 13:15:16 +0200
Message-ID: <CAHp75Vfh5PhGDFCZ0RZuvYwT_4A3nnfJhqnhThEXr=Dq6ie7ZA@mail.gmail.com>
References: <20191121155743.28755-1-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191121155743.28755-1-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 21, 2019 at 5:58 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> GPIO stuff on APUv4 seems to be the same as on APUv2, so we just
> need to match on DMI data.
>
> Fixes: f8eb0235f65989fc5521c40c78d1261e7f25cdbe

The Fixes tag format is wrong.
You are not first time contributor...

Also the question why do you have it here? Do we have any regression
(something worked and stopped working)?

-- 
With Best Regards,
Andy Shevchenko
