From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: Re: [PATCH] Remove ambiguous logging for
 "Unsupported brightness interface"
Date: Sat, 30 Jan 2016 17:49:59 -0200
Message-ID: <20160130194958.GB2468@khazad-dum.debian.net>
References: <CANpvso5_jzOgRv25isy0x6HJcTgKP4dabSH-_a5fM-uihdAUYw@mail.gmail.com>
	<1453937211.10099.31.camel@perches.com>
	<20160130122045.GA14919@khazad-dum.debian.net>
	<CANpvso5wg_Zz7VSRDeKamx0XCCcjr3y+i2UKNFLe+BZEofEG_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CANpvso5wg_Zz7VSRDeKamx0XCCcjr3y+i2UKNFLe+BZEofEG_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Eric Curtin <ericcurtin17-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Kernel development list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, 30 Jan 2016, Eric Curtin wrote:
> "Unsupported brightness interface" message gets logged on
>  machines that are well supported.
> 
> Signed-off-by: Eric Curtin <ericcurtin17-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index a268a7a..e305ab5 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6653,18 +6653,16 @@ static void __init
> tpacpi_detect_brightness_capabilities(void)
>         switch (b) {
>         case 16:
>                 bright_maxlvl = 15;
> -               pr_info("detected a 16-level brightness capable ThinkPad\n");
>                 break;
>         case 8:
>         case 0:
>                 bright_maxlvl = 7;
> -               pr_info("detected a 8-level brightness capable ThinkPad\n");
>                 break;
>         default:
> -               pr_info("Unsupported brightness interface\n");
>                 tp_features.bright_unkfw = 1;
>                 bright_maxlvl = b - 1;
>         }
> +       pr_debug("detected %u brightness levels\n", bright_maxlvl + 1);
>  }
> 
>  static int __init brightness_init(struct ibm_init_struct *iibm)

Acked-by: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

------------------------------------------------------------------------------
Site24x7 APM Insight: Get Deep Visibility into Application Performance
APM + Mobile APM + RUM: Monitor 3 App instances at just $35/Month
Monitor end-to-end web transactions and take corrective actions now
Troubleshoot faster and improve end-user experience. Signup Now!
http://pubads.g.doubleclick.net/gampad/clk?id=267308311&iu=/4140
