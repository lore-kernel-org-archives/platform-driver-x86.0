Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5320C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 09:58:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 848EA63227
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 09:58:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233434AbhKPKB1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Nov 2021 05:01:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42964 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233669AbhKPKBX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Nov 2021 05:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637056707;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8EtodayJLE45FsGNYLLJD7khRA7i5A+I61Un2fiL20w=;
        b=XIQxQ/AqBcilY09XRLsmY+n8twMUrvaXhzY60Jqh4bxi8VCTYTHh4GcIsVrW4+L1bdBFox
        MlBHgMvH0+28dCr8CuLUoQg4OrORFwsM8gouD2Y9ALsmH55W2oMfNocARWaBLswdgT+7Ss
        x8E0YsenjNRnKehN/3yTyrshglnYaRE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-_Iy-efM3MBOOtelhWAjQPA-1; Tue, 16 Nov 2021 04:58:25 -0500
X-MC-Unique: _Iy-efM3MBOOtelhWAjQPA-1
Received: by mail-ed1-f72.google.com with SMTP id n11-20020aa7c68b000000b003e7d68e9874so3442759edq.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Nov 2021 01:58:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8EtodayJLE45FsGNYLLJD7khRA7i5A+I61Un2fiL20w=;
        b=OyUAn4mxFpvS1I38StYndS21Snd6UBXoGXDK8hdQgYrUXeJRU9vSniYVmXcLp/wbwb
         2N/C8uPxmj5Q77CSXPlwgvmax4NdNa1/8n8zE0FI1/UvDhbazTXNjEkBi6nqXcpAzCtF
         L5vx6KI3DlPMVY4l+6N5KwH9lhLNJOyqOdoGtpABeIiZBs+D1NRg7PwHgZEBojIgI6Ot
         B1XczVJJ7UjcUXWlw0052oayuVq8LS1sCdo7A2K6yKWHTEeYwoVs2H34bdg9PaHOyj7B
         a5zFXigLp5MYQGExhk8EZW/F7VG9pe429BeRmRpqeQvhUOPysOLekdRosImcCLFp0oS0
         EKQA==
X-Gm-Message-State: AOAM5300BO7tzfme3MTKg/ZYbTzURcgWqkgr4l9Mf0pFi76mLy9b0m8v
        JrbqRLWf9F2CeYg3CwpLJI4Yy+3g3HeXfy4MWUig51uXJH16Gk6sO3Yq+7BG7OCFIh04OglGYWS
        lvbl7Cw2lVkbTOGThM+LY3ms3mNt7Ev9N8Q==
X-Received: by 2002:a05:6402:2693:: with SMTP id w19mr8298007edd.266.1637056704251;
        Tue, 16 Nov 2021 01:58:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhogYQpO4uRSA3tlOIkQf+tHbNpnLGzqS+aV8+dDAp3RJ5Pft68C+sHOhEp/JWx9+5RKV9Bw==
X-Received: by 2002:a05:6402:2693:: with SMTP id w19mr8297991edd.266.1637056704109;
        Tue, 16 Nov 2021 01:58:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s3sm7790359ejm.49.2021.11.16.01.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 01:58:23 -0800 (PST)
Message-ID: <a4ac11cb-432e-fba1-81af-0bccd30ebb86@redhat.com>
Date:   Tue, 16 Nov 2021 10:58:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] platform/x86: dell-wmi-descriptor: disable by default
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        Mark Gross <mgross@linux.intel.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com
Cc:     linux-kernel@vger.kernel.org
References: <20211113080551.61860-1-linux@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211113080551.61860-1-linux@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/13/21 09:05, Thomas Weißschuh wrote:
> dell-wmi-descriptor only provides symbols to other drivers.
> These drivers already select dell-wmi-descriptor when needed.
> 
> This fixes an issue where dell-wmi-descriptor is compiled as a module
> with localyesconfig on a non-Dell machine.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

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
>  drivers/platform/x86/dell/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index 821aba31821c..dbc71a936339 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -187,7 +187,7 @@ config DELL_WMI_AIO
>  
>  config DELL_WMI_DESCRIPTOR
>  	tristate
> -	default m
> +	default n
>  	depends on ACPI_WMI
>  
>  config DELL_WMI_LED
> 
> base-commit: 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f
> 

