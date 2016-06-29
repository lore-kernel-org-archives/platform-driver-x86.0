From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: Add IIO dependency to ACPI_TOSHIBA
Date: Tue, 28 Jun 2016 22:16:34 -0700
Message-ID: <20160629051634.GM3837@f23x64.localdomain>
References: <20160628195855.22199-1-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45320 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751126AbcF2FQh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jun 2016 01:16:37 -0400
Content-Disposition: inline
In-Reply-To: <20160628195855.22199-1-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jun 28, 2016 at 01:58:55PM -0600, Azael Avalos wrote:
> The toshiba_acpi driver added support to the accelerometer axis
> via the IIO subsystem, but failed to add the dependency to the
> Kconfig file, making the driver fail to compile if the IIO
> subsystem is not selected.
> 
> This patch adds a depedency to the IIO subsystem to the
> ACPI_TOSHIBA entry in Kconfig to avoid such build failure.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
> Darren, Jonathan:
>  I just received a few mails from the kbuild test robot informing
>  the build failure, as a fix for this I just added a hard dependency
>  to IIO, but maybe Jonathan can weigh in and provide me with a better
>  alternative (perhaps some ifdefs) as to the hard IIO dependency.

Don't you just love the giant kernel builder in the sky?

Rather than add this separately and leave a potential build failure in the
kernel, I'll add this line to:

toshiba_acpi: Add IIO interface for accelerometer axis data

> 
>  drivers/platform/x86/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index c06bb85..633fc5c 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -669,6 +669,7 @@ config ACPI_TOSHIBA
>  	depends on SERIO_I8042 || SERIO_I8042 = n
>  	depends on ACPI_VIDEO || ACPI_VIDEO = n
>  	depends on RFKILL || RFKILL = n
> +	depends on IIO
>  	select INPUT_POLLDEV
>  	select INPUT_SPARSEKMAP
>  	---help---
> -- 
> 2.8.4
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
