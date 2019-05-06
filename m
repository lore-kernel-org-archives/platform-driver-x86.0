From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/1] Add several Beckhoff Automation boards to
 critclk_systems DMI table
Date: Mon, 6 May 2019 15:40:02 +0300
Message-ID: <CAHp75Vc4xWbnGoaS8tRDV4_F-Qifh7K1hoFn0V-OObun2Sd0DA@mail.gmail.com>
References: <20190502130351.5341-1-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502130351.5341-1-linux-kernel-dev@beckhoff.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel-dev@beckhoff.com, Stephen Boyd <sboyd@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, May 2, 2019 at 4:04 PM <linux-kernel-dev@beckhoff.com> wrote:
>
> From: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
>
> There are several Beckhoff Automation industrial PC boards which use
> pmc_plt_clk* clocks for ethernet controllers. The patch adds affected boards
> to critclk_systems DMI table so the clocks are marked as CLK_CRITICAL and
> not turned off.
> This should be applied on top of another patch as both change
> the same table:
> [PATCH] platform/x86: pmc_atom: Add Lex 3I380D industrial PC to critclk_systems DMI table

Yes, that's why it either should go via CLK tree, or I need an
immutable tag or branch from them.
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> Steffen Dirkwinkel (1):
>   platform/x86: pmc_atom: Add several Beckhoff Automation boards to
>     critclk_systems DMI table
>
>  drivers/platform/x86/pmc_atom.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> --
> 2.21.0



-- 
With Best Regards,
Andy Shevchenko
