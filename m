From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH 04/10] WMI: do not leak memory in parse_wdg()
Date: Sun, 12 Sep 2010 18:29:55 +0100
Message-ID: <201009121829.56126.carlos@strangeworlds.co.uk>
References: <20100826071442.7976.93972.stgit@localhost.localdomain> <20100826071458.7976.98153.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:62444 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753283Ab0ILRa0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 12 Sep 2010 13:30:26 -0400
Received: by wwb13 with SMTP id 13so2775744wwb.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Sep 2010 10:30:25 -0700 (PDT)
In-Reply-To: <20100826071458.7976.98153.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

On Thursday 26 August 2010 08:14:58 Dmitry Torokhov wrote:
> If we _WDG returned object that is not buffer we were forgetting
> to free memory allocated for that object.
> 
> Signed-off-by: Dmitry Torokhov <dtor@mail.ru>

Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

> ---
> 
>  drivers/platform/x86/wmi.c |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 63ad45e..5abb2ad 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -837,8 +837,10 @@ static acpi_status parse_wdg(acpi_handle handle)
> 
>  	obj = (union acpi_object *) out.pointer;
> 
> -	if (obj->type != ACPI_TYPE_BUFFER)
> -		return AE_ERROR;
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		status = AE_ERROR;
> +		goto out_free_pointer;
> +	}
> 
>  	total = obj->buffer.length / sizeof(struct guid_block);

-- 
E-Mail: carlos@strangeworlds.co.uk
Web: strangeworlds.co.uk
GPG Key ID: 0x23EE722D
