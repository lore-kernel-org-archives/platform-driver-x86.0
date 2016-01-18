From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 2/2] acer-wmi: Use acpi_dev_present()
Date: Mon, 18 Jan 2016 11:48:43 +0800
Message-ID: <20160118034843.GD9328@linux-rxt1.site>
References: <cover.1453060661.git.lukas@wunner.de>
 <0ba4ef20f869501875e0815f34e5defa70fe0a03.1453060661.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:43748 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751281AbcARDs7 (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Sun, 17 Jan 2016 22:48:59 -0500
Content-Disposition: inline
In-Reply-To: <0ba4ef20f869501875e0815f34e5defa70fe0a03.1453060661.git.lukas@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

Hi Lukas,

On Sun, Jan 17, 2016 at 09:49:41PM +0100, Lukas Wunner wrote:
> Use shiny new acpi_dev_present() and remove all the boilerplate
> to search for a particular ACPI device. No functional change.
> Cf. 2d12b6b381ba ("ACPI / utils: Add acpi_dev_present()").
> 
> Cc: Lee, Chun-Yi <jlee@suse.com>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Acked-by: Darren Hart <dvhart@linux.intel.com>

Reviewed-by: Lee, Chun-Yi <jlee@suse.com>

Thanks a lot!
Joey Lee

> ---
>  drivers/platform/x86/acer-wmi.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 1062fa4..3deadd5 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -793,15 +793,6 @@ static acpi_status __init AMW0_find_mailled(void)
>  	return AE_OK;
>  }
>  
> -static int AMW0_set_cap_acpi_check_device_found __initdata;
> -
> -static acpi_status __init AMW0_set_cap_acpi_check_device_cb(acpi_handle handle,
> -	u32 level, void *context, void **retval)
> -{
> -	AMW0_set_cap_acpi_check_device_found = 1;
> -	return AE_OK;
> -}
> -
>  static const struct acpi_device_id norfkill_ids[] __initconst = {
>  	{ "VPC2004", 0},
>  	{ "IBM0068", 0},
> @@ -816,9 +807,10 @@ static int __init AMW0_set_cap_acpi_check_device(void)
>  	const struct acpi_device_id *id;
>  
>  	for (id = norfkill_ids; id->id[0]; id++)
> -		acpi_get_devices(id->id, AMW0_set_cap_acpi_check_device_cb,
> -				NULL, NULL);
> -	return AMW0_set_cap_acpi_check_device_found;
> +		if (acpi_dev_present(id->id))
> +			return true;
> +
> +	return false;
>  }
>  
>  static acpi_status __init AMW0_set_capabilities(void)
> -- 
> 1.8.5.2 (Apple Git-48)
> 
