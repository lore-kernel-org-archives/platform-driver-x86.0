From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba_acpi: Change sci_open function return value
Date: Sun, 18 Jan 2015 10:28:53 -0800
Message-ID: <20150118182853.GC56582@vmdeb7>
References: <1421261972-3130-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39187 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751079AbbARS2z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 18 Jan 2015 13:28:55 -0500
Content-Disposition: inline
In-Reply-To: <1421261972-3130-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 14, 2015 at 11:59:32AM -0700, Azael Avalos wrote:
> Some Toshiba laptops have "poorly implemented" SCI calls on their
> BIOSes and are not checking for sci_{open, close} calls, therefore,
> the sci_open function is failing and making some of the supported
> features unavailable (kbd backlight, touchpad and illumination).
> 
> This patch changes the default return code of the sci_open function
> to return one instead of zero, making all those faulty laptops load
> all the supported features.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
>  drivers/platform/x86/toshiba_acpi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index fc34a71..71ac7c12 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -391,9 +391,10 @@ static int sci_open(struct toshiba_acpi_dev *dev)
>  		return 1;
>  	} else if (out[0] == TOS_NOT_PRESENT) {
>  		pr_info("Toshiba SCI is not present\n");
> +		return 0;
>  	}
>  
> -	return 0;
> +	return 1;

Which means there is really no point in continuing to check for
TOS_OPEN_SLOSE_OK or TOS_ALREADY_OPEN since we're going to return 1 anyway. The
only thing we care about now is TOS_NOT_PRESENT.

I appreciate coding to what it SHOULD be and then handling corner cases
separately, which is basically what this does. However, corner cases need to be
documented.

At the very least, please provide a comment block above return 1 explaining why
we are ignoring what the previous logic indicates should be a failure.

-- 
Darren Hart
Intel Open Source Technology Center
