From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH 02/10] WMI: free wmi blocks when parse_wdg() fails
Date: Sun, 12 Sep 2010 18:19:40 +0100
Message-ID: <201009121819.40762.carlos@strangeworlds.co.uk>
References: <20100826071442.7976.93972.stgit@localhost.localdomain> <20100826071447.7976.15612.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:57717 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752635Ab0ILRUJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 12 Sep 2010 13:20:09 -0400
Received: by wwb13 with SMTP id 13so2766097wwb.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Sep 2010 10:20:08 -0700 (PDT)
In-Reply-To: <20100826071447.7976.15612.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

On Thursday 26 August 2010 08:14:48 Dmitry Torokhov wrote:
> Signed-off-by: Dmitry Torokhov <dtor@mail.ru>

Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

> ---
> 
>  drivers/platform/x86/wmi.c |   25 +++++++++++++++----------
>  1 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 7a77f03..030d5f2 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -807,6 +807,16 @@ static bool guid_already_parsed(const char
> *guid_string) return false;
>  }
> 
> +static void free_wmi_blocks(void)
> +{
> +	struct wmi_block *wblock, *next;
> +
> +	list_for_each_entry_safe(wblock, next, &wmi_blocks.list, list) {
> +		list_del(&wblock->list);
> +		kfree(wblock);
> +	}
> +}
> +
>  /*
>   * Parse the _WDG method for the GUID data blocks
>   */
> @@ -865,7 +875,7 @@ static acpi_status parse_wdg(acpi_handle handle)
>  		wblock->handle = handle;
>  		if (debug_event) {
>  			wblock->handler = wmi_notify_debug;
> -			status = wmi_method_enable(wblock, 1);
> +			wmi_method_enable(wblock, 1);
>  		}
>  		list_add_tail(&wblock->list, &wmi_blocks.list);
>  	}
> @@ -875,6 +885,9 @@ out_free_gblock:
>  out_free_pointer:
>  	kfree(out.pointer);
> 
> +	if (ACPI_FAILURE(status))
> +		free_wmi_blocks();
> +
>  	return status;
>  }
> 
> @@ -1014,19 +1027,11 @@ static int __init acpi_wmi_init(void)
> 
>  static void __exit acpi_wmi_exit(void)
>  {
> -	struct list_head *p, *tmp;
> -	struct wmi_block *wblock;
> -
>  	wmi_class_exit();
> 
>  	acpi_bus_unregister_driver(&acpi_wmi_driver);
> 
> -	list_for_each_safe(p, tmp, &wmi_blocks.list) {
> -		wblock = list_entry(p, struct wmi_block, list);
> -
> -		list_del(p);
> -		kfree(wblock);
> -	}
> +	free_wmi_blocks();
> 
>  	printk(KERN_INFO PREFIX "Mapper unloaded\n");
>  }

-- 
E-Mail: carlos@strangeworlds.co.uk
Web: strangeworlds.co.uk
GPG Key ID: 0x23EE722D
