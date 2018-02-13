From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Support Lifebook U7x7
 hotkeys
Date: Tue, 13 Feb 2018 21:17:38 +1030
Message-ID: <20180213104738.GA4379@marvin.atrad.com.au>
References: <1518437331-25451-1-git-send-email-glogow@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:34300 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933865AbeBMKr5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Feb 2018 05:47:57 -0500
Content-Disposition: inline
In-Reply-To: <1518437331-25451-1-git-send-email-glogow@fbihome.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org

On Mon, Feb 12, 2018 at 01:08:51PM +0100, Jan-Marek Glogowski wrote:
> Generate input events for hotkeys present in Fujitsu Lifebook
> U727 and U757 laptops: Fn+F1 (KEY_MICMUTE) and Fn+F5
> (KEY_RFKILL).
> 
> Signed-off-by: Jan-Marek Glogowski <glogow@fbihome.de>

This patch does not cause any known regressions, and as per the original
discussion I am happy to see this pulled into mainline in order to properly
support these newer laptops in the short term.  In the meantime, Michel is
working on a more extensive patch which separates the handling of the two
different hotkey approaches.  This will give us a neater overall solution
but the ETA is unknown at this stage.

Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Regards
  jonathan

> ---
>  drivers/platform/x86/fujitsu-laptop.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 2cfbd3f..4294c64 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -455,7 +455,9 @@ static const struct key_entry keymap_default[] = {
>  	{ KE_KEY, KEY3_CODE, { KEY_PROG3 } },
>  	{ KE_KEY, KEY4_CODE, { KEY_PROG4 } },
>  	{ KE_KEY, KEY5_CODE, { KEY_RFKILL } },
> +	{ KE_KEY, BIT(5),    { KEY_RFKILL } },
>  	{ KE_KEY, BIT(26),   { KEY_TOUCHPAD_TOGGLE } },
> +	{ KE_KEY, BIT(29),   { KEY_MICMUTE } },
>  	{ KE_END, 0 }
>  };
>  
> @@ -899,7 +901,7 @@ static void acpi_fujitsu_laptop_release(struct acpi_device *device)
>  static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
>  {
>  	struct fujitsu_laptop *priv = acpi_driver_data(device);
> -	int scancode, i = 0;
> +	int scancode, i = 0, ret;
>  	unsigned int irb;
>  
>  	if (event != ACPI_FUJITSU_NOTIFY_CODE1) {
> @@ -930,9 +932,18 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
>  	 * E736/E746/E756), the touchpad toggle hotkey (Fn+F4) is
>  	 * handled in software; its state is queried using FUNC_FLAGS
>  	 */
> -	if ((priv->flags_supported & BIT(26)) &&
> -	    (call_fext_func(device, FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26)))
> -		sparse_keymap_report_event(priv->input, BIT(26), 1, true);
> +	if (priv->flags_supported & (BIT(5) | BIT(26) | BIT(29))) {
> +		ret = call_fext_func(device, FUNC_FLAGS, 0x1, 0x0, 0x0);
> +		if (ret & BIT(5))
> +			sparse_keymap_report_event(priv->input,
> +						   BIT(5), 1, true);
> +		if (ret & BIT(26))
> +			sparse_keymap_report_event(priv->input,
> +						   BIT(26), 1, true);
> +		if (ret & BIT(29))
> +			sparse_keymap_report_event(priv->input,
> +						   BIT(29), 1, true);
> +	}
>  }
>  
>  /* Initialization */
> -- 
> 2.1.4

-- 
