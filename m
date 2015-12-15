From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] Keyboard backlight control for some Vaio Fit models
Date: Tue, 15 Dec 2015 10:01:28 -0800
Message-ID: <20151215180128.GQ11972@malice.jf.intel.com>
References: <1450156352-16240-1-git-send-email-malattia@linux.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:58000 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753528AbbLOSBa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 15 Dec 2015 13:01:30 -0500
Content-Disposition: inline
In-Reply-To: <1450156352-16240-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org, Dominik Matta <dominik@matta.sk>

On Mon, Dec 14, 2015 at 09:12:32PM -0800, Mattia Dongili wrote:
> SVF1521P6EW, SVF1521DCXW, SVF13N1L2ES and likely most SVF*.
> do not expose separate timeout controls in auto mode.
> 
> Signed-off-by: Dominik Matta <dominik@matta.sk>
> Signed-off-by: Mattia Dongili <malattia@linux.it>
> ---
>  drivers/platform/x86/sony-laptop.c | 65 ++++++++++++++++++++++++++------------
>  1 file changed, 45 insertions(+), 20 deletions(-)
> 

Thanks Mattia,

The changes look fine.

At some point we should address some of the style inconsistencies with this
driver, but to nitpic on them for this patch wouldn't be productive. I've merged
this patch - please consider the following for future work with the goal toward
making the kernel code as consistent as possible to aid in legibility and
maintainability.

> @@ -1877,6 +1880,8 @@ static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
>  		unsigned int handle)
>  {
>  	int result;
> +	int probe_base = 0;
> +	int ctl_base = 0;
>  	int ret = 0;

This isn't in CodingStyle, but is enforced by several maintainers and something
I'm trying to standardize on within platform/drivers/x86.

Please declare variables in decreasing line length in the absence of
dependencies. Also called "Reverse Christmas Tree Order".

So the above would become:

int probe_base = 0;
int ctl_base = 0;
int ret = 0;
int result;

Some maintainers prefer merging like types, especially with similar purpose. I'm
ambivalent on this.

>  
>  	if (kbdbl_ctl) {
> @@ -1885,11 +1890,25 @@ static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
>  		return -EBUSY;
>  	}
>  
> -	/* verify the kbd backlight presence, these handles are not used for
> -	 * keyboard backlight only
> +	/* verify the kbd backlight presence, some of these handles are not used
> +	 * for keyboard backlight only
>  	 */

Comment blocks should start with a blank line:

/*
 * This is the first line.
 * This is the second.
 */

And should use standard sentence capitalization.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
