From: Herton Ronaldo Krzesinski <herton.krzesinski@canonical.com>
Subject: Re: [PATCH 20/23] topstar-laptop: Convert remaining printk to
 pr_info
Date: Tue, 29 Mar 2011 20:44:22 -0300
Message-ID: <20110329234421.GC1910@herton-IdeaPad-Y430>
References: <cover.1301436234.git.joe@perches.com>
 <a96da1fe175d7dc123f12433e30df14c60a67ce2.1301436234.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:59727 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751360Ab1C2Xo3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Mar 2011 19:44:29 -0400
Content-Disposition: inline
In-Reply-To: <a96da1fe175d7dc123f12433e30df14c60a67ce2.1301436234.git.joe@perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Matthew Garrett <mjg@redhat.com>, Herton Ronaldo Krzesinski <herton@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 29, 2011 at 03:21:51PM -0700, Joe Perches wrote:
> To be similar to all other uses.
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/platform/x86/topstar-laptop.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
> index 1d07d6d..4c20447 100644
> --- a/drivers/platform/x86/topstar-laptop.c
> +++ b/drivers/platform/x86/topstar-laptop.c
> @@ -194,7 +194,7 @@ static int __init topstar_laptop_init(void)
>  	if (ret < 0)
>  		return ret;
>  
> -	printk(KERN_INFO "Topstar Laptop ACPI extras driver loaded\n");
> +	pr_info("ACPI extras driver loaded\n");
>  
>  	return 0;
>  }
> -- 
> 1.7.4.2.g597a6.dirty
> 

Acked-by: Herton Ronaldo Krzesinski <herton.krzesinski@canonical.com>

-- 
[]'s
Herton
