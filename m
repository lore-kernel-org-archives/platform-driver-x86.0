From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH 05/10] WMI: fix potential NULL pointer dereference
Date: Sun, 12 Sep 2010 18:30:32 +0100
Message-ID: <201009121830.33300.carlos@strangeworlds.co.uk>
References: <20100826071442.7976.93972.stgit@localhost.localdomain> <20100826071503.7976.86482.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:55453 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751607Ab0ILRbC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 12 Sep 2010 13:31:02 -0400
Received: by wyf22 with SMTP id 22so5252083wyf.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Sep 2010 10:31:01 -0700 (PDT)
In-Reply-To: <20100826071503.7976.86482.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

On Thursday 26 August 2010 08:15:03 Dmitry Torokhov wrote:
> Signed-off-by: Dmitry Torokhov <dtor@mail.ru>

Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

> ---
> 
>  drivers/platform/x86/wmi.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 5abb2ad..4032fa4 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -836,6 +836,8 @@ static acpi_status parse_wdg(acpi_handle handle)
>  		return status;
> 
>  	obj = (union acpi_object *) out.pointer;
> +	if (!obj)
> +		return AE_ERROR;
> 
>  	if (obj->type != ACPI_TYPE_BUFFER) {
>  		status = AE_ERROR;

-- 
E-Mail: carlos@strangeworlds.co.uk
Web: strangeworlds.co.uk
GPG Key ID: 0x23EE722D
