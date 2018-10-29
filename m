From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: Re: [PATCH V3 1/5] pvpanic: move pvpanic to misc as common driver
Date: Mon, 29 Oct 2018 13:37:54 +0200
Message-ID: <CAHp75Vd1Fia3i7o1YX9y50EU7Se0vYH4OvUT7eO8cJnHk2mryw@mail.gmail.com>
References: <CAHp75Ve19dcQ3FtRa4BS_Y381g9TDvb2G-M8BNegFuUWA6wzAQ@mail.gmail.com>
 <201810291843424704356@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201810291843424704356@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 29, 2018 at 12:43 PM <peng.hao2@zte.com.cn> wrote:
>
> >On Mon, Oct 29, 2018 at 5:22 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
> >>
> >> move pvpanic.c from drivers/platform/x86 to drivers/misc.
> >> following patches will use pvpanic device in arm64.
> >>
> > Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> >> ---
> >>  drivers/misc/Kconfig           |   7 +++
> >>  drivers/misc/Makefile          |   1 +
> >>  drivers/misc/pvpanic.c         | 124 +++++++++++++++++++++++++++++++++++++++++
> >>  drivers/platform/Kconfig       |   3 +
> >>  drivers/platform/Makefile      |   1 +
> >>  drivers/platform/x86/Kconfig   |   8 ---
> >>  drivers/platform/x86/Makefile  |   1 -
> >>  drivers/platform/x86/pvpanic.c | 124 -----------------------------------------
> >
> >As I mentioned you better to use -C -M.
> >This is currently a bit hard to review.
>
> sorry, I don't understand what "-C -M" means.
> I should have asked you when you first mention it.

git format-patch -C -M ...

-- 
With Best Regards,
Andy Shevchenko
