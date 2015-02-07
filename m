From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] thinkpad_acpi: unhandled hkey event
Date: Fri, 6 Feb 2015 20:22:44 -0800
Message-ID: <20150207042244.GD20934@fury.dvhart.com>
References: <1422730323-14473-1-git-send-email-xnaveira@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57276 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751273AbbBGEXA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Feb 2015 23:23:00 -0500
Content-Disposition: inline
In-Reply-To: <1422730323-14473-1-git-send-email-xnaveira@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Xavier Naveira <xnaveira@gmail.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jan 31, 2015 at 07:52:03PM +0100, Xavier Naveira wrote:
> Pressing Fn+Esc in a Lenovo Thinkpad x240 to lock the Fn keys generates
> an unhandled hkey event
> 
> Signed-off-by: Xavier Naveira <xnaveira@gmail.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index c3d11fa..e61c43b 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -196,6 +196,7 @@ enum tpacpi_hkey_event_t {
>  	/* Key-related user-interface events */
>  	TP_HKEY_EV_KEY_NUMLOCK		= 0x6000, /* NumLock key pressed */
>  	TP_HKEY_EV_KEY_FN		= 0x6005, /* Fn key pressed? E420 */
> +	TP_HKEY_EV_KEY_FN_ESC           = 0x6060, /* Fn+Esc key pressed X240 */
>  
>  	/* Thermal events */
>  	TP_HKEY_EV_ALARM_BAT_HOT	= 0x6011, /* battery too hot */
> @@ -3717,6 +3718,12 @@ static bool hotkey_notify_6xxx(const u32 hkey,
>  		*send_acpi_ev = false;
>  		*ignore_acpi_ev = true;
>  		return true;
> +	case TP_HKEY_EV_KEY_FN_ESC:
> +		/* key press events, we just ignore them as long as the EC
> +		 * is still reporting them in the normal keyboard stream */
> +		*send_acpi_ev = false;
> +		*ignore_acpi_ev = true;
> +		return true;

No need to duplicate the logic here, just add TP_HKEY_EV_KEY_FN_ESC to the list
of fallthrough keys (right after TP_HKEY_EV_KEY_FN).

-- 
Darren Hart
Intel Open Source Technology Center
