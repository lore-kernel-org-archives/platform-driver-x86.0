From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-wmi: Ambient sensor toggle key
Date: Tue, 28 Jun 2016 11:18:41 -0700
Message-ID: <20160628181841.GI3837@f23x64.localdomain>
References: <9711814.jjoeah4X4e@nl-ubook>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39616 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752060AbcF1SSm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2016 14:18:42 -0400
Content-Disposition: inline
In-Reply-To: <9711814.jjoeah4X4e@nl-ubook>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Nick Leiten <nickleiten@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Sun, Jun 19, 2016 at 02:59:26PM +0300, Nick Leiten wrote:
> Hi, 
> here is little patch for Fn+A key assignment in asus-nb-wmi.c file so userspace can control ALS (ambient light sensor) on/off state.
> 
> As I can see mentions in Internet Asus makes 0x7a code in all their laptops to be assigned to Toggle ALS.
> Tested on Asus U38N.

Hi Nick,

Thanks for the patch. The change is good, and I'll merge it for 4.8.

In the future, a few things to keep in mind.

1) Always Cc all maintainers and lists from the get_maintainer.pl script.
2) Check your patch with checkpatch and correct any errors. I'll adjust the
longer than 80 chars this time as it's a trivial fix.
3) Read SubmittingPatches Section 1, 14) Canonical Patch Format and format your
commit message body accordingly. Look at previous patches for examples.

Thanks,

> 
> 
> Signed-off-by: Nick Leiten <nickleiten@gmail.com>
> 
> diff -Npru a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> --- linux-4.6-orig/drivers/platform/x86/asus-nb-wmi.c	2016-05-16 01:43:13.000000000 +0300
> +++ linux-4.6-diff/drivers/platform/x86/asus-nb-wmi.c	2016-06-06 07:00:27.000000000 +0300
> @@ -356,6 +356,7 @@ static const struct key_entry asus_nb_wm
>  	{ KE_KEY, 0x67, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV */
>  	{ KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
>  	{ KE_IGNORE, 0x6E, },  /* Low Battery notification */
> +	{ KE_KEY, 0x7a, { KEY_ALS_TOGGLE } }, /* Ambient Light Sensor Toggle, Fn+A*/
>  	{ KE_KEY, 0x7D, { KEY_BLUETOOTH } }, /* Bluetooth Enable */
>  	{ KE_KEY, 0x7E, { KEY_BLUETOOTH } }, /* Bluetooth Disable */
>  	{ KE_KEY, 0x82, { KEY_CAMERA } },
> 
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Darren Hart
Intel Open Source Technology Center
