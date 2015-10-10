From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] thinkpad_acpi: Add TP_HKEY_EV_SCREEN_FLIP (0x60c0) for
 Lenovo ThinkPad Yoga 12
Date: Sat, 10 Oct 2015 11:45:09 -0700
Message-ID: <20151010184509.GA27137@malice.jf.intel.com>
References: <c6aa1c8ded9833fe62619d00f459ae438b1e2f9c.1444502507.git.dvhart@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49801 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751354AbbJJSpK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 10 Oct 2015 14:45:10 -0400
Content-Disposition: inline
In-Reply-To: <c6aa1c8ded9833fe62619d00f459ae438b1e2f9c.1444502507.git.dvhart@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Sat, Oct 10, 2015 at 11:41:47AM -0700, Darren Hart wrote:
> From: Darren Hart <dvhart@infradead.org>
> 
> thinkpad_acpi reports "unhandled HKEY event 0x60c0" when switching
> between laptop and tent/tablet mode on the ThinkPad Yoga 12. This key is
> reported by atkbd serio0 as e058 and e059.
> 
> Add TP_HKEY_EV_SCREEN_FLIP to the list of ignored events and silence the
> warning.
> 
> Cleanup whitespace on preceeding line for TP_HKEY_EV_KEY_FN_ESC.
> 
> Signed-off-by: Darren Hart <dvhart@infradead.org>
> Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
> Cc: ibm-acpi-devel@lists.sourceforge.net

And Cc pdx86... oi. That's embarassing.

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 131dd74..d68143e 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -197,7 +197,8 @@ enum tpacpi_hkey_event_t {
>  	/* Key-related user-interface events */
>  	TP_HKEY_EV_KEY_NUMLOCK		= 0x6000, /* NumLock key pressed */
>  	TP_HKEY_EV_KEY_FN		= 0x6005, /* Fn key pressed? E420 */
> -	TP_HKEY_EV_KEY_FN_ESC           = 0x6060, /* Fn+Esc key pressed X240 */
> +	TP_HKEY_EV_KEY_FN_ESC		= 0x6060, /* Fn+Esc key pressed X240 */
> +	TP_HKEY_EV_SCREEN_FLIP		= 0x60c0, /* Screen flipped Yoga 12 */
>  
>  	/* Thermal events */
>  	TP_HKEY_EV_ALARM_BAT_HOT	= 0x6011, /* battery too hot */
> @@ -3849,7 +3850,9 @@ static bool hotkey_notify_6xxx(const u32 hkey,
>  		 * unplugging AC adapter, docking or undocking. */
>  
>  		/* fallthrough */
> -
> +	case TP_HKEY_EV_SCREEN_FLIP:
> +		/* Yoga 12: Screen toggled between laptop and tablet mode. */
> +		/* fallthrough */
>  	case TP_HKEY_EV_KEY_NUMLOCK:
>  	case TP_HKEY_EV_KEY_FN:
>  	case TP_HKEY_EV_KEY_FN_ESC:
> -- 
> 2.1.4
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
