From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-wmi: filter buggy scan codes on ASUS Q500A
Date: Fri, 23 Sep 2016 17:09:37 -0700
Message-ID: <20160924000937.GD27846@f23x64.localdomain>
References: <20160804005052.GC36266@dtor-ws>
 <1473695297-10236-1-git-send-email-linux@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47087 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758021AbcIXAJp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Sep 2016 20:09:45 -0400
Content-Disposition: inline
In-Reply-To: <1473695297-10236-1-git-send-email-linux@rempel-privat.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: fixed-term.Oleksij.Rempel@de.bosch.com, Alex Henrie <alexhenrie24@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Sep 12, 2016 at 05:48:17PM +0200, Oleksij Rempel wrote:
> Some revision of ASUS Q500A series have keyboard related
> issue which is reproducible only if Windows with installed ASUS
> tools was ever started.
> In this case the Linux side will have blocked keyboard or
> report wrong or incomplete hotkey events.
> To make Linux work properly again complete power down
> (unplug power supply and remove battery) should be made.
> 
> Linux/atkbd after clean start will get fallowing code on VOLUME_UP
> key: {0xe0, 0x30, 0xe0, 0xb0}. After Windows, same key will generate this
> codes: {0xe1, 0x23, 0xe0, 0x30, 0xe0, 0xb0}. As result atkdb will
> be confused by buggy codes.
> 
> This patch is filtering this buggy code out.
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=119391

First of all - wow - what a bunch of work. Nice job tracking this all down.

A couple of minor nits below, which I've taken care of.

Queued to testing.

> 
> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
> Cc: Alex Henrie <alexhenrie24@gmail.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Corentin Chary <corentin.chary@gmail.com>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: acpi4asus-user@lists.sourceforge.net
> Cc: platform-driver-x86@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 45 ++++++++++++++++++++++++++++++++++++++
>  drivers/platform/x86/asus-wmi.h    |  4 ++++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index adecc1c..787da83 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -27,6 +27,7 @@
>  #include <linux/input/sparse-keymap.h>
>  #include <linux/fb.h>
>  #include <linux/dmi.h>
> +#include <linux/i8042.h>
>  
>  #include "asus-wmi.h"
>  
> @@ -55,10 +56,35 @@ MODULE_PARM_DESC(wapf, "WAPF value");
>  
>  static struct quirk_entry *quirks;
>  
> +static bool asus_q500a_i8042_filter(unsigned char data, unsigned char str,
> +			      struct serio *port)
> +{
> +	static bool extended;
> +	bool ret = false;
> +
> +

Just one empty line is plenty

> +	if (str & I8042_STR_AUXDATA)
> +		return false;
> +
> +	if (unlikely(data == 0xe1)) {
> +		extended = true;
> +		ret = true;
> +	} else if (unlikely(extended)) {
> +		extended = false;
> +		ret = true;
> +	}
> +
> +	return ret;
> +}
> +
>  static struct quirk_entry quirk_asus_unknown = {
>  	.wapf = 0,
>  };
>  
> +static struct quirk_entry quirk_asus_q500a = {
> +	.i8042_filter = asus_q500a_i8042_filter,
> +};
> +
>  /*
>   * For those machines that need software to control bt/wifi status
>   * and can't adjust brightness through ACPI interface
> @@ -96,6 +122,15 @@ static int dmi_matched(const struct dmi_system_id *dmi)
>  static const struct dmi_system_id asus_quirks[] = {
>  	{
>  		.callback = dmi_matched,
> +		.ident = "ASUSTeK COMPUTER INC. Q500A",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Q500A"),
> +		},
> +		.driver_data = &quirk_asus_q500a,
> +	},
> +	{
> +		.callback = dmi_matched,
>  		.ident = "ASUSTeK COMPUTER INC. U32U",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer Inc."),
> @@ -356,6 +391,8 @@ static const struct dmi_system_id asus_quirks[] = {
>  
>  static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
>  {
> +	int ret;
> +
>  	quirks = &quirk_asus_unknown;
>  	dmi_check_system(asus_quirks);
>  
> @@ -367,6 +404,14 @@ static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
>  		quirks->wapf = wapf;
>  	else
>  		wapf = quirks->wapf;
> +
> +	if (quirks->i8042_filter) {
> +		ret = i8042_install_filter(quirks->i8042_filter);
> +		if (ret) {
> +			pr_warn("Unable to install key filter\n");
> +		}

No braces for a single line block

> +		pr_info("Using i8042 filter function for receiving events\n");

Well, then again, a return in the above block would make more sense.

		pr_warn
		return
	}
	pr_info

I've taken the liberty of making this change.... mostly to speed things a long
since I've neglected this patch for so long! Apologies. This is queued to
testing, let me know if you have any concerns. It'll hit linux-next this
weekend.

> +	}
>  }
>  
>  static const struct key_entry asus_nb_wmi_keymap[] = {
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
> index 5de1df5..dd2e6cc 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -28,6 +28,7 @@
>  #define _ASUS_WMI_H_
>  
>  #include <linux/platform_device.h>
> +#include <linux/i8042.h>
>  
>  #define ASUS_WMI_KEY_IGNORE (-1)
>  #define ASUS_WMI_BRN_DOWN	0x20
> @@ -51,6 +52,9 @@ struct quirk_entry {
>  	 * and let the ACPI interrupt to send out the key event.
>  	 */
>  	int no_display_toggle;
> +
> +	bool (*i8042_filter)(unsigned char data, unsigned char str,
> +			     struct serio *serio);
>  };
>  
>  struct asus_wmi_driver {
> -- 
> 2.7.4
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
