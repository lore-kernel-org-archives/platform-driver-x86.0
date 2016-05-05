From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] sony-laptop: Avoid oops on module unload for older
 laptops
Date: Thu, 5 May 2016 16:22:04 -0700
Message-ID: <20160505232204.GF2113@f23x64.localdomain>
References: <56EFB466.60008@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38610 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754684AbcEEXWH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 5 May 2016 19:22:07 -0400
Content-Disposition: inline
In-Reply-To: <56EFB466.60008@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lawrence Yiu <lawyiu.dev@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, malattia@linux.it

On Mon, Mar 21, 2016 at 01:44:22AM -0700, Lawrence Yiu wrote:
> Older VAIO laptops without the SN00 ACPI method will have the "handles"
> variable unset. Return early from sony_nc_function_cleanup when "handles"
> is null.
> 

Hi Lawrence,

Please include all maintainers listed by get_maintainer.pl. My scripts collect
those that apply to the tree where I'm not Cc'd, but the ones that land in the
Inbox take priority.

> Signed-off-by: Lawrence Yiu <lawyiu.dev@gmail.com>
> ---
>  drivers/platform/x86/sony-laptop.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index e9caa34..1dba359 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -1446,6 +1446,9 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
>  {
>  	unsigned int i, result, bitmask, handle;
>  
> +	if (!handles)
> +		return;

Hrm... the cleanup logic in this driver definitely has something to be desired.
sony_nc_handles_cleanup is called at the end of this function, and it checks for
handles != NULL.... and this is called from too many places.

So, this driver needs some cleanup - but I'm taking this patch as is for an
immediately "fix". Thank you for submitting.

> +
>  	/* get enabled events and disable them */
>  	sony_nc_int_call(sony_nc_acpi_handle, "SN01", NULL, &bitmask);
>  	sony_nc_int_call(sony_nc_acpi_handle, "SN03", &bitmask, &result);
> -- 
> 2.5.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Darren Hart
Intel Open Source Technology Center
