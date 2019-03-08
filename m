From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] x86: apuv2: remove unused variable
Date: Fri, 8 Mar 2019 10:11:37 +0100
Message-ID: <CACRpkdZmNbPcSQXU6mosQJk1j9k+vQfJbs2KUZcXTUo172_cCQ@mail.gmail.com>
References: <20190304200918.1444050-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304200918.1444050-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 4, 2019 at 9:09 PM Arnd Bergmann <arnd@arndb.de> wrote:

> The driver was newly introduced but the version that got merged
> produces a harmless compiler warning:
>
> drivers/platform/x86/pcengines-apuv2.c: In function 'apu_board_init':
> drivers/platform/x86/pcengines-apuv2.c:211:6: error: unused variable 'rc' [-Werror=unused-variable]
>
> Remove the evidently useless variable.
>
> Fixes: f8eb0235f659 ("x86: pcengines apuv2 gpio/leds/keys platform driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

As Torvalds did not yet pull the GPIO tree (maybe because of this
and other bugs, who knows) I applied this to my GPIO tree for
now.

Yours,
Linus Walleij
