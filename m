From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/1] toshiba_acpi: Add set_fan_status function
Date: Fri, 24 Jul 2015 15:45:35 -0700
Message-ID: <20150724224535.GA18926@vmdeb7>
References: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
 <1437615474-27936-3-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:41182 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752630AbbGXWpg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Jul 2015 18:45:36 -0400
Content-Disposition: inline
In-Reply-To: <1437615474-27936-3-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 22, 2015 at 07:37:48PM -0600, Azael Avalos wrote:
> This patch adds a new function named "set_fan_status" to complement
> its get* counterpart, as well as to avoid code duplication between
> "fan_proc_write" and "fan_store".

It also appears to change the error codes returned via sysfs?

Also adds some pr_ statements.

> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
>  drivers/platform/x86/toshiba_acpi.c | 55 ++++++++++++++++++++++++-------------
>  1 file changed, 36 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 6013a11..08fc867 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -1422,12 +1422,33 @@ static const struct file_operations video_proc_fops = {
>  	.write		= video_proc_write,
>  };
>  
> +/* Fan status */
>  static int get_fan_status(struct toshiba_acpi_dev *dev, u32 *status)
>  {
> -	u32 hci_result;
> +	u32 result = hci_read(dev, HCI_FAN, status);
>  
> -	hci_result = hci_read(dev, HCI_FAN, status);
> -	return hci_result == TOS_SUCCESS ? 0 : -EIO;
> +	if (result == TOS_FAILURE)
> +		pr_err("ACPI call to get Fan status failed\n");

s/Fan/fan/

Below too.

> +	else if (result == TOS_NOT_SUPPORTED)
> +		return -ENODEV;

This condition would have returned -EIO previously correct?

I agree this new one is the right change, but it does pose a risk to userspace.
There is a slim chance we will have to revert if someone complains and can't
work around it, so we need to be clear about this in the commit message at the
very least.
-- 
Darren Hart
Intel Open Source Technology Center
