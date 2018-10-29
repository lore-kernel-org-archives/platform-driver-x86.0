From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V3 1/5] pvpanic: move pvpanic to misc as common driver
Date: Mon, 29 Oct 2018 12:15:59 +0200
Message-ID: <CAHp75Ve19dcQ3FtRa4BS_Y381g9TDvb2G-M8BNegFuUWA6wzAQ@mail.gmail.com>
References: <1540812743-1825-1-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540812743-1825-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 29, 2018 at 5:22 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> move pvpanic.c from drivers/platform/x86 to drivers/misc.
> following patches will use pvpanic device in arm64.
>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  drivers/misc/Kconfig           |   7 +++
>  drivers/misc/Makefile          |   1 +
>  drivers/misc/pvpanic.c         | 124 +++++++++++++++++++++++++++++++++++++++++
>  drivers/platform/Kconfig       |   3 +
>  drivers/platform/Makefile      |   1 +
>  drivers/platform/x86/Kconfig   |   8 ---
>  drivers/platform/x86/Makefile  |   1 -
>  drivers/platform/x86/pvpanic.c | 124 -----------------------------------------

As I mentioned you better to use -C -M.
This is currently a bit hard to review.

-- 
With Best Regards,
Andy Shevchenko
