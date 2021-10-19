Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB512C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Oct 2021 14:56:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6C8B613A1
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Oct 2021 14:56:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhJSO7E (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Oct 2021 10:59:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21725 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229641AbhJSO7E (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Oct 2021 10:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634655411;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OBmpX0iW/CRhRFEp9uYQsaSMgyDiFRAV+89olCeMNzQ=;
        b=YGsPoRYZ2vOCBKGTOOVwwVTV6uNFPYroF/998V4J0uaWYS14pZlazEjCbUSa58UFKZWp0P
        PDauWO+puHOEKRLr6qub87LCU6FX2HaJjVTH6ET1Xpb/x+oiEOgKkwk+cNwoPpMzyC6B8b
        mCFCJvlif3N/3QHxbxEXYWsrUnYuwBk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-pVLSaFTlONelTOv_44RNWw-1; Tue, 19 Oct 2021 10:56:50 -0400
X-MC-Unique: pVLSaFTlONelTOv_44RNWw-1
Received: by mail-ed1-f71.google.com with SMTP id r25-20020a05640216d900b003dca3501ab4so1415500edx.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Oct 2021 07:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OBmpX0iW/CRhRFEp9uYQsaSMgyDiFRAV+89olCeMNzQ=;
        b=rvL3gPPhpBNeOaqErEoms3nM9dT/nCpbFrjT6cMffcOJFICCMbi0AQhPZn6AR+lp5S
         KP3u7mLjuq7v7E4QXCQ7NSZrTcxFFvfbxbyx2sLo9WqjIoUQQjJSixJt/U2tgNVuf3WW
         wj+vk/lFz5QZpvkOtVuJAEa56FrQfovH0Z3CCetmaVr9mUOhRDXzZLrr785yjb2xIcWV
         /jJm8wnylHTy/0nUbS+fq+L80/2xHRDTO8sCsJtojn0yh20iKkckcxUOt426lldmze2C
         BRFGypRFgE0VTjnKFtSquDHWYS8FfZZm0SLiNT2LeXU56Ko1Bx7UihjUZOzocQndSUBV
         QX0w==
X-Gm-Message-State: AOAM531/4l3OXmRkddpcmVHF+YhXlSnJ11IssppfPNgt7PDNvtM0uC56
        Ouy1zI9IQZM4YurPXoCq7CJWxKljOMV0abdQHxvXc+Bd6PHOAQ/zwtyC0bEq5/zEZ6uXxp4nH4+
        SgWEzwFG+fZWO1RqYnufdtMZsKaiwVc6JCQ==
X-Received: by 2002:a17:906:a1c1:: with SMTP id bx1mr37889349ejb.447.1634655408766;
        Tue, 19 Oct 2021 07:56:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0nnLTuU3+onl11l2kVenp5svRoJZ++/IJFJSR5Mpc5PW9Y/sfPaVT+pWQqzOVFiOleUA5LA==
X-Received: by 2002:a17:906:a1c1:: with SMTP id bx1mr37889322ejb.447.1634655408571;
        Tue, 19 Oct 2021 07:56:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t19sm10427623ejb.115.2021.10.19.07.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 07:56:48 -0700 (PDT)
Message-ID: <9e22cbe0-1cca-13d7-7c34-79ba73c795e1@redhat.com>
Date:   Tue, 19 Oct 2021 16:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 4/7] surface: surface3-wmi: Use ACPI_COMPANION()
 directly
Content-Language: en-US
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux ACPI <linux-acpi@vger.kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <4369779.LvFx2qVVIh@kreacher> <3414042.iIbC2pHGDl@kreacher>
 <12896717.uLZWGnKmhe@kreacher>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <12896717.uLZWGnKmhe@kreacher>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/13/21 18:10, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> The ACPI_HANDLE() macro is a wrapper arond the ACPI_COMPANION()
> macro and the ACPI handle produced by the former comes from the
> ACPI device object produced by the latter, so it is way more
> straightforward to evaluate the latter directly instead of passing
> the handle produced by the former to acpi_bus_get_device().
> 
> Modify s3_wmi_check_platform_device() accordingly (no intentional
> functional impact).
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

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
> 
> v1 -> v2:
>    * Resend with a different From and S-o-b address and with R-by from
>      Maximilian.  No other changes.
> 
> ---
>  drivers/platform/surface/surface3-wmi.c |    9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> Index: linux-pm/drivers/platform/surface/surface3-wmi.c
> ===================================================================
> --- linux-pm.orig/drivers/platform/surface/surface3-wmi.c
> +++ linux-pm/drivers/platform/surface/surface3-wmi.c
> @@ -139,13 +139,12 @@ static acpi_status s3_wmi_attach_spi_dev
>  
>  static int s3_wmi_check_platform_device(struct device *dev, void *data)
>  {
> -	struct acpi_device *adev, *ts_adev = NULL;
> -	acpi_handle handle;
> +	struct acpi_device *adev = ACPI_COMPANION(dev);
> +	struct acpi_device *ts_adev = NULL;
>  	acpi_status status;
>  
>  	/* ignore non ACPI devices */
> -	handle = ACPI_HANDLE(dev);
> -	if (!handle || acpi_bus_get_device(handle, &adev))
> +	if (!adev)
>  		return 0;
>  
>  	/* check for LID ACPI switch */
> @@ -159,7 +158,7 @@ static int s3_wmi_check_platform_device(
>  	    strlen(SPI_CTL_OBJ_NAME)))
>  		return 0;
>  
> -	status = acpi_walk_namespace(ACPI_TYPE_DEVICE, handle, 1,
> +	status = acpi_walk_namespace(ACPI_TYPE_DEVICE, adev->handle, 1,
>  				     s3_wmi_attach_spi_device, NULL,
>  				     &ts_adev, NULL);
>  	if (ACPI_FAILURE(status))
> 
> 
> 

