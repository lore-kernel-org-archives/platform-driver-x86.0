Return-Path: <SRS0=wg3L=EC=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12AFC388F9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Oct 2020 17:36:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ECD020878
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Oct 2020 17:36:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A/Lt2v9B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1820624AbgJ0Rgo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:36:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34177 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1760832AbgJ0Ogk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Oct 2020 10:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603809399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ug8vzX663gR3NE8oqRQHPCaGbnO8Nn0snBXYCYT+1IE=;
        b=A/Lt2v9BgRVEvmmUjQZWmZCoXItX8UxEfNgs3ubH+Q6JZlrz7sFhsdFwdDyUa5uMHj+fvO
        Pk0p8prwLUEP6n0R+OMpqvSzof42XYmWX0KakNauCiogiYzsT1Ra+VTALZfqChxKzLd6PA
        GTxf9baTQEf6iB8eiZGch8xKCeXY9DA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-f9c2qwexPUijtbnuRbrqKg-1; Tue, 27 Oct 2020 10:36:37 -0400
X-MC-Unique: f9c2qwexPUijtbnuRbrqKg-1
Received: by mail-ed1-f72.google.com with SMTP id a15so758130eda.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2020 07:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ug8vzX663gR3NE8oqRQHPCaGbnO8Nn0snBXYCYT+1IE=;
        b=ASQgWIAIm147agq8w1QQPG22IccIWtqHqwhXMtFwm1w5V05QTG17x+pDIxSU5BoBM/
         zX7YSy+3JlocoWnULxftnxSnVTJRRhzebEUSk4+hj8jxP9Kn19MRMl6FaqCJbdPG3rYH
         52VjxI+iJKsbcxwevFSDYY2QJf0mC0j0r9avC4fNs6+XyaiG2igYpJZTKsOnlpdqkatc
         o9vbRH4GBdvoNY4acpNcSzlvEaOpR/Z3tmZQ/UnZ714AQ0eFrI4u2RyUbXL8qBpITDCy
         qzepv3QZS0ADTcL+1Gb173UPMkYdpncLDOvhWbEIBmc4TND7RqTfN+m6GGrhfxq+VYmL
         ooJQ==
X-Gm-Message-State: AOAM531PoI+4HkXGM84gWhp0eV6leRdmHgM/HHZZR9ADvvq1EbjSOap4
        rxfyNCeqCrmGBGHWbOHn2HCFAy64xJHcJydNGht1KiAEJRGIvG4pnPAz5+oHGihAt93kzc22YFb
        ncZow77F2B39bhbUOT/sUdb8h1BH2onjcZg==
X-Received: by 2002:aa7:c815:: with SMTP id a21mr2531641edt.166.1603809395207;
        Tue, 27 Oct 2020 07:36:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaYi64qtz7uB4mxOVc/QA3cIK6821annqrLaJPpuMj3ZGZl0sXWYqOFXnLYNdfauqIPbwfnw==
X-Received: by 2002:aa7:c815:: with SMTP id a21mr2531620edt.166.1603809395007;
        Tue, 27 Oct 2020 07:36:35 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id dm8sm1121656edb.57.2020.10.27.07.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 07:36:34 -0700 (PDT)
Subject: Re: [PATCH] Revert "platform/x86: wmi: Destroy on cleanup rather than
 unregister"
To:     Yongxin Liu <yongxin.liu@windriver.com>, andy@infradead.org,
        dvhart@infradead.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     mario.limonciello@dell.com
References: <20191115052710.46880-1-yongxin.liu@windriver.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ee964f27-e038-931d-803a-dbcb9e0566dd@redhat.com>
Date:   Tue, 27 Oct 2020 15:36:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20191115052710.46880-1-yongxin.liu@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Quick self intro: I have take over drivers/platform/x86
maintainership from Andy; and I'm working my way through
the backlog of old patches in patchwork:
https://patchwork.kernel.org/project/platform-driver-x86/list/

On 11/15/19 6:27 AM, Yongxin Liu wrote:
> This reverts commit 7b11e8989618581bc0226ad313264cdc05d48d86.
> 
> Consider the following hardware setting.
> 
> |-PNP0C14:00
> |  |-- device #1
> |-PNP0C14:01
> |  |-- device #2
> 
> When unloading wmi driver module, device #2 will be first unregistered.
> But device_destroy() using MKDEV(0, 0) will locate PNP0C14:00 first
> and unregister it. This is incorrect. Should use device_unregister() to
> unregister the real parent device.
> 
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up there once I've pushed my local branch there,
which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/wmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 59e9aa0f9643..e16f660aa117 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -1347,7 +1347,7 @@ static int acpi_wmi_remove(struct platform_device *device)
>  	acpi_remove_address_space_handler(acpi_device->handle,
>  				ACPI_ADR_SPACE_EC, &acpi_wmi_ec_space_handler);
>  	wmi_free_devices(acpi_device);
> -	device_destroy(&wmi_bus_class, MKDEV(0, 0));
> +	device_unregister((struct device *)dev_get_drvdata(&device->dev));
>  
>  	return 0;
>  }
> @@ -1401,7 +1401,7 @@ static int acpi_wmi_probe(struct platform_device *device)
>  	return 0;
>  
>  err_remove_busdev:
> -	device_destroy(&wmi_bus_class, MKDEV(0, 0));
> +	device_unregister(wmi_bus_dev);
>  
>  err_remove_notify_handler:
>  	acpi_remove_notify_handler(acpi_device->handle, ACPI_DEVICE_NOTIFY,
> 

