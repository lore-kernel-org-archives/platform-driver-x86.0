From: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>
Subject: Re: [PATCH] compal-laptop/fujitsu-laptop/msi-laptop: make dmi_check_cb
Date: Mon, 5 Jul 2010 16:42:51 +0930 (CST)
Message-ID: <201007050712.o657CpjO028121@turbo.physics.adelaide.edu.au>
References: <1278061453.15256.1.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelphi.physics.adelaide.edu.au ([129.127.102.1]:33024 "EHLO
	adelphi.physics.adelaide.edu.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753494Ab0GEHQj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 5 Jul 2010 03:16:39 -0400
In-Reply-To: <1278061453.15256.1.camel@mola> from "Axel Lin" at Jul 02, 2010 05:04:13 PM
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Matthew Garrett <mjg@redhat.com>, Tim Gardner <tim.gardner@canonical.com>, Mario Limonciello <Mario_Limonciello@Dell.com>, Richard Purdie <rpurdie@linux.intel.com>, Michal Marek <mmarek@suse.cz>, Jonathan Woithe <jwoithe@physics.adelaide.edu.au>, Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Stefani Seibold <stefani@seibold.net>, Andi Kleen <ak@linux.intel.com>, Lennart Poettering <mzxreary@0pointer.de>, Lee Chun-Yi <jlee@novell.com>, platform-driver-x86@vger.kernel.org

Is there no possibility of some other matching function existing after ours
in the tree which might need to also be called?  If so, this change would
prevent that.

Regards
  jonathan

> dmi_check_system() walks the table running matching functions until someone
> returns non zero or we hit the end.
> 
> This patch makes dmi_check_cb to return 1 so dmi_check_system() return
> immediately when a match is found.
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> ---
>  drivers/platform/x86/compal-laptop.c  |    2 +-
>  drivers/platform/x86/fujitsu-laptop.c |    6 +++---
>  drivers/platform/x86/msi-laptop.c     |    2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
> index 71ff154..dc31a08 100644
> --- a/drivers/platform/x86/compal-laptop.c
> +++ b/drivers/platform/x86/compal-laptop.c
> @@ -190,7 +190,7 @@ static int dmi_check_cb(const struct dmi_system_id *id)
>  	printk(KERN_INFO "compal-laptop: Identified laptop model '%s'.\n",
>  		id->ident);
>  
> -	return 0;
> +	return 1;
>  }
>  
>  static struct dmi_system_id __initdata compal_dmi_table[] = {
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index dab1a0e..1859d7f 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -603,7 +603,7 @@ static int dmi_check_cb_s6410(const struct dmi_system_id *id)
>  	dmi_check_cb_common(id);
>  	fujitsu->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
>  	fujitsu->keycode2 = KEY_HELP;	/* "Mobility Center" */
> -	return 0;
> +	return 1;
>  }
>  
>  static int dmi_check_cb_s6420(const struct dmi_system_id *id)
> @@ -611,7 +611,7 @@ static int dmi_check_cb_s6420(const struct dmi_system_id *id)
>  	dmi_check_cb_common(id);
>  	fujitsu->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
>  	fujitsu->keycode2 = KEY_HELP;	/* "Mobility Center" */
> -	return 0;
> +	return 1;
>  }
>  
>  static int dmi_check_cb_p8010(const struct dmi_system_id *id)
> @@ -620,7 +620,7 @@ static int dmi_check_cb_p8010(const struct dmi_system_id *id)
>  	fujitsu->keycode1 = KEY_HELP;	/* "Support" */
>  	fujitsu->keycode3 = KEY_SWITCHVIDEOMODE;	/* "Presentation" */
>  	fujitsu->keycode4 = KEY_WWW;	/* "Internet" */
> -	return 0;
> +	return 1;
>  }
>  
>  static struct dmi_system_id fujitsu_dmi_table[] = {
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
> index afd762b..c67a74c 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -434,7 +434,7 @@ static int dmi_check_cb(const struct dmi_system_id *id)
>  {
>  	printk(KERN_INFO "msi-laptop: Identified laptop model '%s'.\n",
>  	       id->ident);
> -	return 0;
> +	return 1;
>  }
>  
>  static struct dmi_system_id __initdata msi_dmi_table[] = {
> -- 
> 1.5.4.3
> 
> 
> 


-- 
* Jonathan Woithe    jwoithe@physics.adelaide.edu.au                        *
*                    http://www.physics.adelaide.edu.au/~jwoithe            *
***-----------------------------------------------------------------------***
** "Time is an illusion; lunchtime doubly so"                              **
*  "...you wouldn't recognize a subtle plan if it painted itself purple and *
*   danced naked on a harpsichord singing 'subtle plans are here again'"    *
