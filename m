From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch 1/2] thinkpad_acpi: signedness bugs getting current_mode
Date: Sat, 14 Mar 2015 14:06:12 -0700
Message-ID: <20150314210612.GA26465@fury.dvhart.com>
References: <20150311093450.GA3564@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:37004 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752043AbbCNVG2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 Mar 2015 17:06:28 -0400
Content-Disposition: inline
In-Reply-To: <20150311093450.GA3564@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Bastien Nocera <hadess@hadess.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Rafael Wysocki <rjw@rjwysocki.net>, "H. Peter Anvin" <hpa@zytor.com>

On Wed, Mar 11, 2015 at 12:34:50PM +0300, Dan Carpenter wrote:
> This needs to be signed for the error handling to work.  Valid modes are
> small positive integers.
> 
> Fixes: b790ceeb0fd9 ('thinkpad_acpi: Add adaptive_kbd_mode sysfs attr')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Question for HPA, Rafael, and Stephen,

I recall discussion at Kernel Summit 2014 about not rebasing or merging patches
when sending to Linus, that he'd prefer to see the history. I recall Stephen
mentioning something similar for linux-next.

That said, I've seen varying behavior among maintainers with respect to fixes
like this one from Dan. This patch fixes a patch that currently only exists in
my for-next and Stephen's linux-next trees.

What is the preference. Do I just queue it up to for-next as is (this is what
I've done for now), or do I roll it into the referred patch causing the error
and credit Dan with the fixup?

Left to my own devices I would prefer not to introduce bugs into the kernel
history if I can help it. That said, I don't want to make extra work for Stephen
or Linus.

What's the prefered best practice here?

> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 56eaddc..024861d 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -2938,7 +2938,7 @@ static ssize_t adaptive_kbd_mode_show(struct device *dev,
>  			   struct device_attribute *attr,
>  			   char *buf)
>  {
> -	u32 current_mode;
> +	int current_mode;
>  
>  	current_mode = adaptive_keyboard_get_mode();
>  	if (current_mode < 0)
> @@ -3621,7 +3621,7 @@ static int adaptive_keyboard_get_next_mode(int mode)
>  
>  static bool adaptive_keyboard_hotkey_notify_hotkey(unsigned int scancode)
>  {
> -	u32 current_mode = 0;
> +	int current_mode = 0;
>  	int new_mode = 0;
>  	int keycode;
>  
> 

-- 
Darren Hart
Intel Open Source Technology Center
