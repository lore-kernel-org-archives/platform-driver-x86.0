From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 09/15] fujitsu-laptop: Mark fujitsu_dmi_table[] DMI table
 as __initconst
Date: Thu, 17 Jul 2014 08:29:20 +0930
Message-ID: <20140716225920.GA29824@marvin.atrad.com.au>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
 <1405532597-28262-10-git-send-email-minipli@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:52780 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753104AbaGPXF1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 19:05:27 -0400
Content-Disposition: inline
In-Reply-To: <1405532597-28262-10-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mathias Krause <minipli@googlemail.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, jwoithe@just42.net

Looks fine to me.

Acked-by: Jonathan Woithe <jwoithe@just42.net>

On Wed, Jul 16, 2014 at 07:43:11PM +0200, Mathias Krause wrote:
> The DMI table is only ever used during initialization. Mark it as
> __initconst so its memory can be released afterwards -- roughly 1.5 kB.
> In turn, the callback functions can be marked with __init, too.
> 
> Signed-off-by: Mathias Krause <minipli@googlemail.com>
> Cc: Jonathan Woithe <jwoithe@just42.net>
> ---
>  drivers/platform/x86/fujitsu-laptop.c |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index e6f336270c..e9345f12ce 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -564,7 +564,7 @@ static struct platform_driver fujitsupf_driver = {
>  		   }
>  };
>  
> -static void dmi_check_cb_common(const struct dmi_system_id *id)
> +static void __init dmi_check_cb_common(const struct dmi_system_id *id)
>  {
>  	pr_info("Identified laptop model '%s'\n", id->ident);
>  	if (use_alt_lcd_levels == -1) {
> @@ -578,7 +578,7 @@ static void dmi_check_cb_common(const struct dmi_system_id *id)
>  	}
>  }
>  
> -static int dmi_check_cb_s6410(const struct dmi_system_id *id)
> +static int __init dmi_check_cb_s6410(const struct dmi_system_id *id)
>  {
>  	dmi_check_cb_common(id);
>  	fujitsu->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
> @@ -586,7 +586,7 @@ static int dmi_check_cb_s6410(const struct dmi_system_id *id)
>  	return 1;
>  }
>  
> -static int dmi_check_cb_s6420(const struct dmi_system_id *id)
> +static int __init dmi_check_cb_s6420(const struct dmi_system_id *id)
>  {
>  	dmi_check_cb_common(id);
>  	fujitsu->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
> @@ -594,7 +594,7 @@ static int dmi_check_cb_s6420(const struct dmi_system_id *id)
>  	return 1;
>  }
>  
> -static int dmi_check_cb_p8010(const struct dmi_system_id *id)
> +static int __init dmi_check_cb_p8010(const struct dmi_system_id *id)
>  {
>  	dmi_check_cb_common(id);
>  	fujitsu->keycode1 = KEY_HELP;	/* "Support" */
> @@ -603,7 +603,7 @@ static int dmi_check_cb_p8010(const struct dmi_system_id *id)
>  	return 1;
>  }
>  
> -static struct dmi_system_id fujitsu_dmi_table[] = {
> +static const struct dmi_system_id fujitsu_dmi_table[] __initconst = {
>  	{
>  	 .ident = "Fujitsu Siemens S6410",
>  	 .matches = {
> -- 
> 1.7.10.4
