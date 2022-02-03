Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F5FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Feb 2022 10:40:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236370AbiBCKkU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Feb 2022 05:40:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48969 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234197AbiBCKkP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 05:40:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643884815;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iF9IVWvlzL/qClpscwHGHUc/fyfoMXfsUMhqjE8f3MA=;
        b=IDpJ2/XxSOtng9C7GqnBhisbUOBgiQzkehn+1CHQdzqu3OM1UbMPIbfcbmhwhqIo15vLjv
        Ouu5RLpHNPCWl7tD8LejBVIA5JUMNRKL5kSuV9CWjROa+fZJ853zmaJa0mgNzzCWu7dZdI
        ya+XaZu6MOyWcWyRSMlNFXp1I4OoeMY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-ltl0M42hNACXJsPtRWcoNw-1; Thu, 03 Feb 2022 05:40:12 -0500
X-MC-Unique: ltl0M42hNACXJsPtRWcoNw-1
Received: by mail-ed1-f71.google.com with SMTP id w3-20020a50c443000000b0040696821132so1208487edf.22
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Feb 2022 02:40:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iF9IVWvlzL/qClpscwHGHUc/fyfoMXfsUMhqjE8f3MA=;
        b=GJw+5YCMkdxdtEHFh+isAHUQGoeVfdKxUyaoAd2m3fj9cTxINvmoXt5M7FO0SK0Lqa
         e7L9rlU7ydLOOmH0XVHyo7+207L4QYVtOtSxX+nqy4JuYcF6y8E3pYi8sNO4uKm3d3Bz
         6jR2a9r3mhkSZwjvRh5J+ghmWi+W7kys67tEr2ds/3dQJIVA9EGJpOeObW9Smih8YLmx
         wdSS66dXI+rWVdDXdsUU9SHgDd2AjLLXc+sGQWYPHjpyIbejh+y98cu+jR/S1NNs7uCx
         A6kCXudAt+SsiYJFBgDcKV1NhFQn+cwEMnmb66/1kt2pxm2N8Yzoqg5gK+3KLz0yfdSJ
         uCJA==
X-Gm-Message-State: AOAM530dcRrwT2eVonzq8SBhUOXvoa9nzpVUlVcOn9F1bktpjUpNGiF2
        Dkx+Xw8Gc9tTw8OXv3BjCAXdP4lW/svsTpYRmAIjoZzHx87Iygr/y5GF+jPRKstKb2u4pHtON9I
        KjSodNyRa9Pfu305uYOY3wJFsVi88vx3yQw==
X-Received: by 2002:a17:907:d0d:: with SMTP id gn13mr29254571ejc.266.1643884811000;
        Thu, 03 Feb 2022 02:40:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw38e8yKQ+50WABfgP/CdNnYgCDcDWAlrfBiwh9rs0Aw8aLmugQyqOluCm0HXTr4XjDcT5YtQ==
X-Received: by 2002:a17:907:d0d:: with SMTP id gn13mr29254556ejc.266.1643884810787;
        Thu, 03 Feb 2022 02:40:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id f18sm16599860ejh.97.2022.02.03.02.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 02:40:10 -0800 (PST)
Message-ID: <11cec5e6-e3b9-ca5b-7b21-da9eff82c24e@redhat.com>
Date:   Thu, 3 Feb 2022 11:40:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform: surface: Replace acpi_bus_get_device()
Content-Language: en-US
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <markgross@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
References: <5805278.lOV4Wx5bFT@kreacher>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5805278.lOV4Wx5bFT@kreacher>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/26/22 20:41, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Replace acpi_bus_get_device() that is going to be dropped with
> acpi_fetch_acpi_dev().
> 
> No intentional functional impact.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/surface/surface3-wmi.c        |   12 ++++--------
>  drivers/platform/surface/surface_acpi_notify.c |    3 ++-
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 
> Index: linux-pm/drivers/platform/surface/surface3-wmi.c
> ===================================================================
> --- linux-pm.orig/drivers/platform/surface/surface3-wmi.c
> +++ linux-pm/drivers/platform/surface/surface3-wmi.c
> @@ -116,15 +116,11 @@ static acpi_status s3_wmi_attach_spi_dev
>  					    void *data,
>  					    void **return_value)
>  {
> -	struct acpi_device *adev, **ts_adev;
> +	struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
> +	struct acpi_device **ts_adev = data;
>  
> -	if (acpi_bus_get_device(handle, &adev))
> -		return AE_OK;
> -
> -	ts_adev = data;
> -
> -	if (strncmp(acpi_device_bid(adev), SPI_TS_OBJ_NAME,
> -	    strlen(SPI_TS_OBJ_NAME)))
> +	if (!adev || strncmp(acpi_device_bid(adev), SPI_TS_OBJ_NAME,
> +			     strlen(SPI_TS_OBJ_NAME)))
>  		return AE_OK;
>  
>  	if (*ts_adev) {
> Index: linux-pm/drivers/platform/surface/surface_acpi_notify.c
> ===================================================================
> --- linux-pm.orig/drivers/platform/surface/surface_acpi_notify.c
> +++ linux-pm/drivers/platform/surface/surface_acpi_notify.c
> @@ -770,7 +770,8 @@ static acpi_status san_consumer_setup(ac
>  		return AE_OK;
>  
>  	/* Ignore ACPI devices that are not present. */
> -	if (acpi_bus_get_device(handle, &adev) != 0)
> +	adev = acpi_fetch_acpi_dev(handle);
> +	if (!adev)
>  		return AE_OK;
>  
>  	san_consumer_dbg(&pdev->dev, handle, "creating device link\n");
> 
> 
> 

