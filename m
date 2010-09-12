From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH 01/10] WMI: remove EC region handler when _WDG parsing fails
Date: Sun, 12 Sep 2010 18:14:36 +0100
Message-ID: <201009121814.37059.carlos@strangeworlds.co.uk>
References: <20100826071442.7976.93972.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:43767 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752635Ab0ILRPJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 12 Sep 2010 13:15:09 -0400
Received: by wyf22 with SMTP id 22so5240534wyf.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Sep 2010 10:15:07 -0700 (PDT)
In-Reply-To: <20100826071442.7976.93972.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

On Thursday 26 August 2010 08:14:42 Dmitry Torokhov wrote:
> Driver initialization was forgetting to remove EC address space handler
> in cases when parse_wdg() method failed.
> 
> Signed-off-by: Dmitry Torokhov <dtor@mail.ru>

Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

> ---
> 
>  drivers/platform/x86/wmi.c |    9 +++++++--
>  1 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index b2978a0..7a77f03 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -968,12 +968,17 @@ static int acpi_wmi_add(struct acpi_device *device)
>  						    ACPI_ADR_SPACE_EC,
>  						    &acpi_wmi_ec_space_handler,
>  						    NULL, NULL);
> -	if (ACPI_FAILURE(status))
> +	if (ACPI_FAILURE(status)) {
> +		printk(KERN_ERR PREFIX "Error installing EC region handler\n");
>  		return -ENODEV;
> +	}
> 
>  	status = parse_wdg(device->handle);
>  	if (ACPI_FAILURE(status)) {
> -		printk(KERN_ERR PREFIX "Error installing EC region handler\n");
> +		acpi_remove_address_space_handler(device->handle,
> +						  ACPI_ADR_SPACE_EC,
> +						  &acpi_wmi_ec_space_handler);
> +		printk(KERN_ERR PREFIX "Failed to parse WDG method\n");
>  		return -ENODEV;
>  	}

-- 
E-Mail: carlos@strangeworlds.co.uk
Web: strangeworlds.co.uk
GPG Key ID: 0x23EE722D
