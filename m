From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] WMI: fix the incorrect wmi device may be chosen from
 BIOS's notification if multiple wmi devices exist in a system.
Date: Sat, 28 Jul 2012 05:15:32 +0100
Message-ID: <20120728041532.GB31064@srcf.ucam.org>
References: <1342662201-29878-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:33294 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751138Ab2G1EPf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 28 Jul 2012 00:15:35 -0400
Content-Disposition: inline
In-Reply-To: <1342662201-29878-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Thu, Jul 19, 2012 at 09:43:21AM +0800, Alex Hung wrote:

> +static struct acpi_device *wmi_device;

If a machine exports multiple WMI interfaces then having a static 
acpi_device doesn't make sense here. Instead we probably need the API to 
take some sort of token (maybe just the wmi_device itself as an opaque 
blob) back to the calling driver and then have it use that whenever it 
makes a wmi call. There'd be some fixing up involved, but it should be 
mostly mechanical.

>  /*
>   * GUID parsing functions
>   */
> @@ -652,8 +654,9 @@ acpi_status wmi_get_event_data(u32 event, struct acpi_buffer *out)
>  
>  	list_for_each(p, &wmi_block_list) {
>  		wblock = list_entry(p, struct wmi_block, list);
> +		if (wmi_device != NULL && wmi_device->handle != wblock->handle)
> +			continue;
>  		gblock = &wblock->gblock;
> -
>  		if ((gblock->flags & ACPI_WMI_EVENT) &&
>  			(gblock->notify_id == event))
>  			return acpi_evaluate_object(wblock->handle, "_WED",
> @@ -900,6 +903,10 @@ static void acpi_wmi_notify(struct acpi_device *device, u32 event)
>  		wblock = list_entry(p, struct wmi_block, list);
>  		block = &wblock->gblock;
>  
> +		if (device->handle != wblock->handle)
> +			continue;
> +		wmi_device = device;
> +
>  		if ((block->flags & ACPI_WMI_EVENT) &&
>  			(block->notify_id == event)) {
>  			if (wblock->handler)
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
-- 
Matthew Garrett | mjg59@srcf.ucam.org
