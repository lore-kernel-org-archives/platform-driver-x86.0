From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/1] thinkpad-acpi: Reduce screen brightness user visible
 noise.
Date: Mon, 15 Jun 2015 13:43:31 -0700
Message-ID: <20150615204331.GF83198@vmdeb7>
References: <20150614022755.GB26753@khazad-dum.debian.net>
 <1434382154-3046-1-git-send-email-cramm0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:34484 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752151AbbFOUne (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Jun 2015 16:43:34 -0400
Content-Disposition: inline
In-Reply-To: <1434382154-3046-1-git-send-email-cramm0@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ramiro Morales <cramm0@gmail.com>
Cc: hmh@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Mon, Jun 15, 2015 at 12:29:14PM -0300, Ramiro Morales wrote:
> Implement change in logging during screen brightness capabilities
> detection as suggested in
> https://www.mail-archive.com/ibm-acpi-devel%40lists.sourceforge.net/msg03484.html
> 

Summarize the rationale here, the change log needs to stand alone. You can
reference a link, but the justification cannot depend on it.

> Signed-off-by: Ramiro Morales <cramm0@gmail.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 28f3281..b48efc9 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6450,19 +6450,16 @@ static void __init tpacpi_detect_brightness_capabilities(void)
>  	switch (b) {
>  	case 16:
>  		bright_maxlvl = 15;
> -		pr_info("detected a 16-level brightness capable ThinkPad\n");
>  		break;
>  	case 8:
>  	case 0:
>  		bright_maxlvl = 7;
> -		pr_info("detected a 8-level brightness capable ThinkPad\n");
>  		break;
>  	default:
> -		pr_err("Unsupported brightness interface, "
> -		       "please contact %s\n", TPACPI_MAIL);
>  		tp_features.bright_unkfw = 1;
>  		bright_maxlvl = b - 1;
>  	}
> +	pr_debug("firmware reports %d brightness levels\n", bright_maxlvl);
>  }
>  
>  static int __init brightness_init(struct ibm_init_struct *iibm)
> @@ -6482,6 +6479,9 @@ static int __init brightness_init(struct ibm_init_struct *iibm)
>  
>  	/* if it is unknown, we don't handle it: it wouldn't be safe */
>  	if (tp_features.bright_unkfw)
> +		dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_BRGHT,
> +			   "Unsupported brightness mode, use acpi video "
> +			   "or gpu drivers");

Please run checkpatch on your patch (don't break quoted strings - it makes it
hard to find them with grep).

>  		return 1;
>  
>  	if (!brightness_enable) {
> -- 
> 1.9.1
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
