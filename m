From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 2/4] toshiba_acpi: Remove "*not supported" feature
 prints
Date: Tue, 28 Jul 2015 20:50:10 -0700
Message-ID: <20150729035010.GD3171@vmdeb7>
References: <1438046548-3081-1-git-send-email-coproscefalo@gmail.com>
 <1438046548-3081-4-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:37126 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751010AbbG2FGv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jul 2015 01:06:51 -0400
Content-Disposition: inline
In-Reply-To: <1438046548-3081-4-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Azael,

On Mon, Jul 27, 2015 at 07:22:26PM -0600, Azael Avalos wrote:
> Currently the driver prints "*not supported" if any of the features
> queried are in fact not supported, let us print the available
> features instead.
> 
> This patch removes all instances pr_info printing "*not supported",
> and add a new function called "print_supported_features", which will
> print the available laptop features.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
>  drivers/platform/x86/toshiba_acpi.c | 69 +++++++++++++++++++++++--------------
>  1 file changed, 44 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index e164926..e24f0f5 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -477,13 +477,10 @@ static void toshiba_illumination_set(struct led_classdev *cdev,
>  	state = brightness ? 1 : 0;
>  	result = sci_write(dev, SCI_ILLUMINATION, state);
>  	sci_close(dev);
> -	if (result == TOS_FAILURE) {
> +	if (result == TOS_FAILURE)
>  		pr_err("ACPI call for illumination failed\n");
> +	else if (result == TOS_NOT_SUPPORTED)
>  		return;

And otherwise.... return. So this last if test doesn't do anything. If you feel
the context is relevant, consider just including it as a comment.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
