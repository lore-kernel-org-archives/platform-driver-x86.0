From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH][V2] intel-hid: remove duplicated
 acpi_remove_notify_handler and extra indents
Date: Tue, 28 Jun 2016 22:07:32 -0700
Message-ID: <20160629050732.GK3837@f23x64.localdomain>
References: <1467171675-32174-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45143 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750790AbcF2FIg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jun 2016 01:08:36 -0400
Content-Disposition: inline
In-Reply-To: <1467171675-32174-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Wed, Jun 29, 2016 at 11:41:15AM +0800, Alex Hung wrote:
> Two lines are indented incorrectly and is fixed. The second call to 
> acpi_remove_notify_handler does not result in panic or generate error
> messages, but it is unnecessary and the function returns with an error.
> 
> Signed-off-by: Alex Hung <alex.hung@canonical.com>

Thank you Alex, queued to testing for 4.8.

> ---
>  drivers/platform/x86/intel-hid.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
> index a818db6..ed58742 100644
> --- a/drivers/platform/x86/intel-hid.c
> +++ b/drivers/platform/x86/intel-hid.c
> @@ -122,8 +122,8 @@ static int intel_hid_input_setup(struct platform_device *device)
>  	return 0;
>  
>  err_free_device:
> -		input_free_device(priv->input_dev);
> -		return ret;
> +	input_free_device(priv->input_dev);
> +	return ret;
>  }
>  
>  static void intel_hid_input_destroy(struct platform_device *device)
> @@ -224,7 +224,6 @@ static int intel_hid_remove(struct platform_device *device)
>  	acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY, notify_handler);
>  	intel_hid_input_destroy(device);
>  	intel_hid_set_enable(&device->dev, 0);
> -	acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY, notify_handler);
>  
>  	/*
>  	 * Even if we failed to shut off the event stream, we can still
> -- 
> 2.7.4
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
