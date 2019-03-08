From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 1/3] x86: apuv2: remove unused variable
Date: Fri, 8 Mar 2019 11:42:02 +0100
Message-ID: <fbc13c2b-1c9d-54d7-e29b-c279a5a42e33@metux.net>
References: <20190304200918.1444050-1-arnd@arndb.de>
 <CACRpkdZmNbPcSQXU6mosQJk1j9k+vQfJbs2KUZcXTUo172_cCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZmNbPcSQXU6mosQJk1j9k+vQfJbs2KUZcXTUo172_cCQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 08.03.19 10:11, Linus Walleij wrote:

> As Torvalds did not yet pull the GPIO tree (maybe because of this
> and other bugs, who knows) I applied this to my GPIO tree for
> now.

Great. I actually like it better this way, so his pull will be clean
and consistent.

Did you also apply the kconfig fixes ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
