From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH 06/10] WMI: simplify handling of returned WMI blocks in parse_wdg()
Date: Sun, 12 Sep 2010 18:39:22 +0100
Message-ID: <201009121839.23222.carlos@strangeworlds.co.uk>
References: <20100826071442.7976.93972.stgit@localhost.localdomain> <20100826071509.7976.8827.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:47643 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751792Ab0ILRjx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 12 Sep 2010 13:39:53 -0400
Received: by wwb13 with SMTP id 13so2033127wwb.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Sep 2010 10:39:52 -0700 (PDT)
In-Reply-To: <20100826071509.7976.8827.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

On Thursday 26 August 2010 08:15:09 Dmitry Torokhov wrote:
> There is no reason why we allocate memory and copy data into an
> intermediate buffer, it is not like we are working with data coming
> from userspace.
> 
> Signed-off-by: Dmitry Torokhov <dtor@mail.ru>

Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

> ---
> 
>  drivers/platform/x86/wmi.c |   15 ++++-----------
>  1 files changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 4032fa4..e9064fb 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -487,7 +487,7 @@ const struct acpi_buffer *in)
>  }
>  EXPORT_SYMBOL_GPL(wmi_set_block);
> 
> -static void wmi_dump_wdg(struct guid_block *g)
> +static void wmi_dump_wdg(const struct guid_block *g)
>  {
>  	char guid_string[37];
> 
> @@ -824,7 +824,7 @@ static acpi_status parse_wdg(acpi_handle handle)
>  {
>  	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
>  	union acpi_object *obj;
> -	struct guid_block *gblock;
> +	const struct guid_block *gblock;
>  	struct wmi_block *wblock;
>  	char guid_string[37];
>  	acpi_status status;
> @@ -844,14 +844,9 @@ static acpi_status parse_wdg(acpi_handle handle)
>  		goto out_free_pointer;
>  	}
> 
> +	gblock = (const struct guid_block *)obj->buffer.pointer;
>  	total = obj->buffer.length / sizeof(struct guid_block);
> 
> -	gblock = kmemdup(obj->buffer.pointer, obj->buffer.length, GFP_KERNEL);
> -	if (!gblock) {
> -		status = AE_NO_MEMORY;
> -		goto out_free_pointer;
> -	}
> -
>  	for (i = 0; i < total; i++) {
>  		/*
>  		  Some WMI devices, like those for nVidia hooks, have a
> @@ -872,7 +867,7 @@ static acpi_status parse_wdg(acpi_handle handle)
>  		wblock = kzalloc(sizeof(struct wmi_block), GFP_KERNEL);
>  		if (!wblock) {
>  			status = AE_NO_MEMORY;
> -			goto out_free_gblock;
> +			goto out_free_pointer;
>  		}
> 
>  		wblock->gblock = gblock[i];
> @@ -884,8 +879,6 @@ static acpi_status parse_wdg(acpi_handle handle)
>  		list_add_tail(&wblock->list, &wmi_blocks.list);
>  	}
> 
> -out_free_gblock:
> -	kfree(gblock);
>  out_free_pointer:
>  	kfree(out.pointer);
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe
> platform-driver-x86" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
E-Mail: carlos@strangeworlds.co.uk
Web: strangeworlds.co.uk
GPG Key ID: 0x23EE722D
