From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] dell-wmi: Add events created by Dell Rugged 2-in-1s
Date: Tue, 26 Jul 2016 22:19:09 -0700
Message-ID: <20160727051909.GC75806@f23x64.localdomain>
References: <1469217684-6643-1-git-send-email-mario_limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:60011 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751317AbcG0FTL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Jul 2016 01:19:11 -0400
Content-Disposition: inline
In-Reply-To: <1469217684-6643-1-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>

On Fri, Jul 22, 2016 at 03:01:24PM -0500, Mario Limonciello wrote:
> The Dell Rugged 7202 has 3 programmable buttons (labeled P1, P2, P3)
> and a detachable magnetic keyboard/mouse.
> 
> Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>

+Pali

Pali, any concerns?

> ---
>  drivers/platform/x86/dell-wmi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index 15c6f11..6ba42d0 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -222,6 +222,16 @@ static const struct key_entry dell_wmi_extra_keymap[] __initconst = {
>  
>  	/* Stealth mode toggle */
>  	{ KE_IGNORE, 0x155, { KEY_RESERVED } },
> +
> +	/* Rugged magnetic keyboard/mouse events */
> +	{ KE_IGNORE, 0x156, { KEY_RESERVED } },
> +	{ KE_IGNORE, 0x157, { KEY_RESERVED } },
> +
> +	/* Rugged programmable (P1/P2/P3 keys) */
> +	{ KE_KEY, 0x850, { KEY_PROG1 } },
> +	{ KE_KEY, 0x851, { KEY_PROG2 } },
> +	{ KE_KEY, 0x852, { KEY_PROG3 } },
> +
>  };
>  
>  static struct input_dev *dell_wmi_input_dev;
> -- 
> 2.7.4
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
