From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] acer-wmi: setup accelerometer when machine has
 appropriate notify event
Date: Tue, 1 Nov 2016 10:28:51 -0700
Message-ID: <20161101172851.GA4494@f23x64.localdomain>
References: <1477974812-12657-1-git-send-email-jlee@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:53820 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751360AbcKAR1f (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Nov 2016 13:27:35 -0400
Content-Disposition: inline
In-Reply-To: <1477974812-12657-1-git-send-email-jlee@suse.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>

On Tue, Nov 01, 2016 at 12:33:32PM +0800, Lee, Chun-Yi wrote:
> The accelerometer event relies on on the ACERWMID_EVENT_GUID notify.
> So, this patch changes the codes to setup accelerometer input device
> when detected ACERWMID_EVENT_GUID. It avoids that the accel input
> device created on every acer machines.
> 
> In addition, patch adds a clearly parsing logic of accelerometer hid
> to acer_wmi_get_handle_cb callback function. It is positive matching
> the "SENR" name with "BST0001" device to avoid non-supported hardware.
> 
> Reported-by: Bjørn Mork <bjorn@mork.no>
> Tested-by: Bjørn Mork <bjorn@mork.no>
> Cc: Darren Hart <dvhart@infradead.org>
> Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
> ---
>  drivers/platform/x86/acer-wmi.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 79d64ea..3bb3162 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1808,11 +1808,24 @@ static int __init acer_wmi_enable_lm(void)
>  	return status;
>  }
>  
> +#define ACER_WMID_ACCEL_HID	"BST0001"
> +
>  static acpi_status __init acer_wmi_get_handle_cb(acpi_handle ah, u32 level,
>  						void *ctx, void **retval)
>  {
> +	struct acpi_device *dev;
> +
> +	if (strcmp(ctx, "SENR")) {
> +		if (acpi_bus_get_device(ah, &dev))
> +			return AE_OK;
> +		if (!strcmp(ACER_WMID_ACCEL_HID, acpi_device_hid(dev)))
> +			return AE_OK;
> +	} else
> +		return AE_OK;
> +
>  	*(acpi_handle *)retval = ah;
> -	return AE_OK;
> +
> +	return AE_CTRL_TERMINATE;

I don't understand this change. Previously, we assigned retval to ah and
returned AE_OK. Now, we either do not assign retval and still return AE_OK, or
we do assign it and then return AE_CTRL_TERMINATE....

I would have expected to see something more like:

	if (we should setup the accelerometer)
		reval = ah
		return AE_OK
	
	return AE_CTRL_TERMINATE

If I'm misunderstanding this, can you please try to explain - a comment in the
function would be useful.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
