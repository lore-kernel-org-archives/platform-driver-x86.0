From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 2/5] toshiba_acpi: Remove "*not supported" feature
 prints
Date: Wed, 5 Aug 2015 02:38:00 -0700
Message-ID: <20150805093800.GA12131@vmdeb7>
References: <1438401496-27744-1-git-send-email-coproscefalo@gmail.com>
 <1438401496-27744-3-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438401496-27744-3-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jul 31, 2015 at 09:58:13PM -0600, Azael Avalos wrote:
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
>  drivers/platform/x86/toshiba_acpi.c | 72 +++++++++++++++++++++++--------------
>  1 file changed, 46 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index d983dc4..66b596a 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -459,7 +459,7 @@ static void toshiba_illumination_available(struct toshiba_acpi_dev *dev)
>  	if (ACPI_FAILURE(status))
>  		pr_err("ACPI call to query Illumination support failed\n");
>  	else if (out[0] == TOS_NOT_SUPPORTED)
> -		pr_info("Illumination device not available\n");
> +		return;
>  	else if (out[0] == TOS_SUCCESS)
>  		dev->illumination_supported = 1;
>  }
> @@ -483,7 +483,6 @@ static void toshiba_illumination_set(struct led_classdev *cdev,
>  		pr_err("ACPI call for illumination failed\n");
>  		return;
>  	} else if (result == TOS_NOT_SUPPORTED) {
> -		pr_info("Illumination not supported\n");
>  		return;
>  	}

I mentioned this in the previous review. For several of these, we have an if
statement that checks for a condition, and then returns, which is exactly what
would happen if we didn't have the if statement at all.

If the context is important, a comment should be sufficient. Is there a
compelling reason to add the redundant check?

-- 
Darren Hart
Intel Open Source Technology Center
