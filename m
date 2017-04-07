From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: update debug message
 logged by call_fext_func()
Date: Fri, 7 Apr 2017 21:10:19 +0930
Message-ID: <20170407114019.GA15240@marvin.atrad.com.au>
References: <20170406064610.13984-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:36970 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932247AbdDGLlP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Apr 2017 07:41:15 -0400
Content-Disposition: inline
In-Reply-To: <20170406064610.13984-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 06, 2017 at 08:46:10AM +0200, Micha?? K??pie?? wrote:
> Update debug message logged when the acpi_evaluate_integer() call inside
> call_fext_func() fails so that it covers a broader set of possible
> errors.
> 
> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>
> ---
> This patch is a follow-up to v1 of the call_fext_func() cleanup series
> and as such, it should be applied to for-next.
> 
>  drivers/platform/x86/fujitsu-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 26149f58dba7..928778ccc4c1 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -232,7 +232,7 @@ static int call_fext_func(int func, int op, int feature, int state)
>  	status = acpi_evaluate_integer(fujitsu_laptop->acpi_handle, "FUNC",
>  				       &arg_list, &value);
>  	if (ACPI_FAILURE(status)) {
> -		vdbg_printk(FUJLAPTOP_DBG_ERROR, "FUNC interface is not present\n");
> +		vdbg_printk(FUJLAPTOP_DBG_ERROR, "Failed to evaluate FUNC\n");
>  		return -ENODEV;
>  	}

As per discussions on the list, this change is fine, is consistent with the
generic nature of possible failure modes and makes sense in the context of
the other recent changes.

Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Regards
  jonathan
