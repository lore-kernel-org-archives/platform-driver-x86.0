From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/3] toshiba_acpi: Change error checking logic from TCI
 functions
Date: Sun, 28 Aug 2016 09:56:54 -0700
Message-ID: <20160828165654.GB96930@f23x64.localdomain>
References: <20160816180617.1743-1-coproscefalo@gmail.com>
 <20160816180617.1743-3-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49581 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755657AbcH1Q46 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 28 Aug 2016 12:56:58 -0400
Content-Disposition: inline
In-Reply-To: <20160816180617.1743-3-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 16, 2016 at 12:06:16PM -0600, Azael Avalos wrote:
> Currently the success/error checking logic is intermixed, making the
> code a bit cumbersome to understand.
> 
> This patch changes the affected functions to first check for errors
> and take appropriate actions, then check for the supported features.
> 
> This patch also separates the error check from the acpi_status and
> the tci_raw function call error check, as those two are completely
> unrelated and were nested in if/else statements.

Thanks, this is a good improvement. One questions below...

> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
>  drivers/platform/x86/toshiba_acpi.c | 222 ++++++++++++++++++++++--------------
>  1 file changed, 135 insertions(+), 87 deletions(-)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index c6fc5cc..2256cf5 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -476,10 +476,15 @@ static void toshiba_illumination_available(struct toshiba_acpi_dev *dev)
>  
>  	status = tci_raw(dev, in, out);
>  	sci_close(dev);
> -	if (ACPI_FAILURE(status))
> +	if (ACPI_FAILURE(status)) {
>  		pr_err("ACPI call to query Illumination support failed\n");
> -	else if (out[0] == TOS_SUCCESS)
> -		dev->illumination_supported = 1;
> +		return;
> +	}
> +
> +	if (out[0] != TOS_SUCCESS)

Does this condition not merit a pr_err message? It reads like an error...

There are several similar situations below which are equally silent. Is this a
deliberate decision?

-- 
Darren Hart
Intel Open Source Technology Center
