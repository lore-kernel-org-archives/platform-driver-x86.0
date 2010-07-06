From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH] acer-wmi: fix memory leaks in WMID_set_capabilities and get_wmid_devices
Date: Tue, 6 Jul 2010 08:22:44 +0100
Message-ID: <201007060822.44702.carlos@strangeworlds.co.uk>
References: <1278384936.12801.17.camel@mola>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:50045 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751194Ab0GFHWz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 6 Jul 2010 03:22:55 -0400
In-Reply-To: <1278384936.12801.17.camel@mola>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Thomas Renninger <trenn@suse.de>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, platform-driver-x86@vger.kernel.org

On Tuesday 06 July 2010 03:55:36 Axel Lin wrote:
> When acpi_evaluate_object() is passed ACPI_ALLOCATE_BUFFER,
> the caller must kfree the returned buffer if AE_OK is returned.
> 
> The callers of wmi_query_block() pass ACPI_ALLOCATE_BUFFER,
> and thus must check its return value before accessing
> or kfree() on the buffer.
> 
> This patch adds a missing kfree(out.pointer) before exit
> WMID_set_capabilities() and get_wmid_devices().
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

> ---
>  drivers/platform/x86/acer-wmi.c |   10 +++++++---
>  1 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c
> b/drivers/platform/x86/acer-wmi.c index 1ea6c43..fe644c6 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -772,6 +772,7 @@ static acpi_status WMID_set_capabilities(void)
>  		obj->buffer.length == sizeof(u32)) {
>  		devices = *((u32 *) obj->buffer.pointer);
>  	} else {
> +		kfree(out.pointer);
>  		return AE_ERROR;
>  	}
> 
> @@ -788,6 +789,7 @@ static acpi_status WMID_set_capabilities(void)
>  	if (!(devices & 0x20))
>  		max_brightness = 0x9;
> 
> +	kfree(out.pointer);
>  	return status;
>  }
> 
> @@ -1095,6 +1097,7 @@ static u32 get_wmid_devices(void)
>  	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
>  	union acpi_object *obj;
>  	acpi_status status;
> +	u32 devices = 0;
> 
>  	status = wmi_query_block(WMID_GUID2, 1, &out);
>  	if (ACPI_FAILURE(status))
> @@ -1103,10 +1106,11 @@ static u32 get_wmid_devices(void)
>  	obj = (union acpi_object *) out.pointer;
>  	if (obj && obj->type == ACPI_TYPE_BUFFER &&
>  		obj->buffer.length == sizeof(u32)) {
> -		return *((u32 *) obj->buffer.pointer);
> -	} else {
> -		return 0;
> +		devices = *((u32 *) obj->buffer.pointer);
>  	}
> +
> +	kfree(out.pointer);
> +	return devices;
>  }
> 
>  /*

-- 
E-Mail: carlos@strangeworlds.co.uk
Web: strangeworlds.co.uk
GPG Key ID: 0x23EE722D
