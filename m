Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B06C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Oct 2021 14:57:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E407D60F22
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Oct 2021 14:57:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbhJSO7R (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Oct 2021 10:59:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59511 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231402AbhJSO7Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Oct 2021 10:59:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634655423;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S+NrsU0gaObw7QSCSHFIz2Urcvc9T1qjARe37K5Lbog=;
        b=bi5Kl/kGi0pOjVbP70ZfKuQf2l0jCVvyeW+uRYo4KC51TkBqwnDn3Lf4fPGk7lncUOwAh9
        p5ka6PYd/1Xgat6B26QNtyGoEj6Uo/cxS2fZk2p194QxUiUB8JXZFjKuv+8E+VV+Szi+Ai
        TOWWCTNvPMNDVSzX20Y4BDPDn4MoC4k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-OXJ3um1aOnS8zND5n6edMw-1; Tue, 19 Oct 2021 10:57:01 -0400
X-MC-Unique: OXJ3um1aOnS8zND5n6edMw-1
Received: by mail-ed1-f71.google.com with SMTP id v9-20020a50d849000000b003dcb31eabaaso156572edj.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Oct 2021 07:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=S+NrsU0gaObw7QSCSHFIz2Urcvc9T1qjARe37K5Lbog=;
        b=3xAxgSJpBMrBX8OQjLNJ48UoVhhyScBJsDhX/aMoaci68x0zX2QsL6nt7wvEzN4Eof
         yHP70UEF0PilP+OdFElIhqVBAGRAHKNBvL+qENb7UfZMWeor0SzGFILStu7S/5wtB+aM
         pzoW3Kwl1GvJGieHScnyEn2OPk0DIBPlBR/P3sNu78A2Tl7pwtbfid5u17SGTCaiesVe
         8xbsmccYLk/j7xzwi6d+9+cADhRNvcYphgWLndl/fr4n1/c0BMpjh/XNsOHnX5dPquye
         fnamKMmk9dhRYKLaC7KJcEXHtTcqdyA9gUOFjSOZ2Q8GAi+mL5l/+WeK76nuMvQ6Vdzr
         b7NA==
X-Gm-Message-State: AOAM532C9/103YPalO/YW2PBp5BpKsQ71ShwBc16JBhu9AqiaA0XD97n
        lrIIr4JjImaTlM0vVHdhfPwqA+JhYxw8aU1nop0ILgByvYJVy6IsBDT63Ap+xkVBJ8jSe8U9ewP
        LjNB9yKyKmlzJ6QN+dqcK7/bmc0Hmd5c+fA==
X-Received: by 2002:a50:da45:: with SMTP id a5mr25578154edk.306.1634655420733;
        Tue, 19 Oct 2021 07:57:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeI9lj1WH/w8Z2UVplul9Gb/rlnFrrof54n/CAJhnpMgWy208Hhp1lEF6v4i09Zs6SIOfjbA==
X-Received: by 2002:a50:da45:: with SMTP id a5mr25578125edk.306.1634655420533;
        Tue, 19 Oct 2021 07:57:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z4sm10406983ejw.46.2021.10.19.07.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 07:57:00 -0700 (PDT)
Message-ID: <9878301f-0080-7063-8a34-926b2d63524d@redhat.com>
Date:   Tue, 19 Oct 2021 16:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 5/7] surface: surface3_power: Drop redundant
 acpi_bus_get_device() call
Content-Language: en-US
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <4369779.LvFx2qVVIh@kreacher> <3089655.5fSG56mABF@kreacher>
 <2503491.Lt9SDvczpP@kreacher> <3160001.aeNJFYEL58@kreacher>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3160001.aeNJFYEL58@kreacher>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/13/21 18:12, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> If the ACPI companion of a given device is not present, the result
> of the ACPI_HANDLE() evaluation for it will be NULL, so calling
> acpi_bus_get_device() on ACPI_HANDLE() result in order to validate
> it is redundant.
> 
> Drop the redundant acpi_bus_get_device() call from mshw0011_notify()
> along with a local variable related to it.
> 
> No intentional functional impact.
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
> v2 -> v3:
>    * Resend with a different From and S-o-b address and with R-by from
>      Maximilian.  No other changes.
> 
> ---
>  drivers/platform/surface/surface3_power.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> Index: linux-pm/drivers/platform/surface/surface3_power.c
> ===================================================================
> --- linux-pm.orig/drivers/platform/surface/surface3_power.c
> +++ linux-pm/drivers/platform/surface/surface3_power.c
> @@ -159,12 +159,11 @@ mshw0011_notify(struct mshw0011_data *cd
>  		unsigned int *ret_value)
>  {
>  	union acpi_object *obj;
> -	struct acpi_device *adev;
>  	acpi_handle handle;
>  	unsigned int i;
>  
>  	handle = ACPI_HANDLE(&cdata->adp1->dev);
> -	if (!handle || acpi_bus_get_device(handle, &adev))
> +	if (!handle)
>  		return -ENODEV;
>  
>  	obj = acpi_evaluate_dsm_typed(handle, &mshw0011_guid, arg1, arg2, NULL,
> 
> 
> 

