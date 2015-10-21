From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: don't yell on unsupported brightness
 interfaces
Date: Wed, 21 Oct 2015 12:33:52 -0200
Message-ID: <1445438032.750540.416379153.1ECC9658@webmail.messagingengine.com>
References: <1445424370-4725-1-git-send-email-dh.herrmann@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445424370-4725-1-git-send-email-dh.herrmann@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Herrmann <dh.herrmann@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 21, 2015, at 08:46, David Herrmann wrote:
> The thinkpad_acpi driver currently emits error messages on unsupported
> brightness interfaces, giving the impression that someone will implement
> those. However, this error is spit out on nearly every thinkpad in
> production since 2 years now. Furthermore, the backlight interfaces on
> those devices are supported by the i915 driver just fine.
> 
> Downgrade the error message to a normal pr_info() and stop telling people
> to report it to IBM.

IBM?  Those reports go directly to me.

> Signed-off-by: David Herrmann <dh.herrmann@gmail.com>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index 131dd74..0bed473 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6459,8 +6459,7 @@ static void __init
> tpacpi_detect_brightness_capabilities(void)
>  		pr_info("detected a 8-level brightness capable ThinkPad\n");
>  		break;
>  	default:
> -               pr_err("Unsupported brightness interface, "
> -                      "please contact %s\n", TPACPI_MAIL);
> +               pr_info("Unsupported brightness interface\n");
>  		tp_features.bright_unkfw = 1;
>  		bright_maxlvl = b - 1;
>  	}
> -- 
> 2.6.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe
> platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
