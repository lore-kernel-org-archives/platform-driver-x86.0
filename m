From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH] ideapad_laptop: add an event for mic mute hotkey
Date: Fri, 3 Jun 2016 16:33:34 +0800
Message-ID: <575140DE.1000504@canonical.com>
References: <1464593208-13190-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:48355 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751579AbcFCIdl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2016 04:33:41 -0400
In-Reply-To: <1464593208-13190-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>, dvhart@infradead.org, platform-driver-x86@vger.kernel.org

On 05/30/2016 03:26 PM, Alex Hung wrote:
> Newer ideapad supports new mic new hotkey, and it is implemented
> via ACPI interface.  This patch conver the mic mute event to
> a keycode KEY_MICMUTE
> 
> Signed-off-by: Alex Hung <alex.hung@canonical.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 4a23fbc..aa87a42 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -567,6 +567,7 @@ static void ideapad_sysfs_exit(struct ideapad_private *priv)
>  static const struct key_entry ideapad_keymap[] = {
>  	{ KE_KEY, 6,  { KEY_SWITCHVIDEOMODE } },
>  	{ KE_KEY, 7,  { KEY_CAMERA } },
> +	{ KE_KEY, 8,  { KEY_MICMUTE } },
>  	{ KE_KEY, 11, { KEY_F16 } },
>  	{ KE_KEY, 13, { KEY_WLAN } },
>  	{ KE_KEY, 16, { KEY_PROG1 } },
> @@ -809,6 +810,9 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>  				break;
>  			case 13:
>  			case 11:
> +			case 8:

fall through is easier to read

> +				ideapad_input_report(priv, vpc_bit);
> +				break;

so above two lines are not necessary.

>  			case 7:
>  			case 6:
>  				ideapad_input_report(priv, vpc_bit);
> 
