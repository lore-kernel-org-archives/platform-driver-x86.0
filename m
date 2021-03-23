Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF26C433C1
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 19:41:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48396619C9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 19:41:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhCWTkq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Mar 2021 15:40:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23938 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230434AbhCWTkV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Mar 2021 15:40:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616528421;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gTg0YZwN5hFKhiavzk2/eEE2JZuUQxCKgti32JKf8OQ=;
        b=N6vrrA4dO0lzZe9fhzAqoNnE28R/Apn6CpWPnFhDeCyWgVrYxM4LoWYFyS8Pw3Ud+tFTZC
        lfJmnvdBhMHcKGZUSpuqevpwLZnFiDR1eERrBHPdjsIWVVEterEmmkiKIYfg9AErp9xIuW
        isBhfgvSeVdrHOkuVEwQujixR1fyyEw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-hPMjitRbMAm3GuP9WEhO6A-1; Tue, 23 Mar 2021 15:40:19 -0400
X-MC-Unique: hPMjitRbMAm3GuP9WEhO6A-1
Received: by mail-ed1-f71.google.com with SMTP id f9so1461838edd.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Mar 2021 12:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gTg0YZwN5hFKhiavzk2/eEE2JZuUQxCKgti32JKf8OQ=;
        b=DHQiah7G2hieIuzHbOx+zML8UKpDNgdynZYmRoEfpE8dAYOjugLSNp0LNwg3W13qU3
         N+t2aKJDMx1x4sqo14+2WlIR2Zf/D9uX/JH5LfyA856Z2mFsBeK+xXt9Mqe3lMsG5Bwf
         pYrZbWixRkA8r4kQwbvT4eMh5zQLs+Y1XG2SE0CMWmWy4DpRtb7pP/rqla7dRewAAuSG
         KSSgvFFAxsfscLZi6pRC5UbstsWn+RyV1PRUNqruXc3sOk7AT8xHrLKkQQObFEt3l/F2
         SDfvgHZ1n/SlVkVud1N5ART+n5KQiEn2HdpLkMgAHeDEE6OGCRXuHxWNwTLw9i4ViGVf
         ag4Q==
X-Gm-Message-State: AOAM531wbPRTQVbYhsE1Uqlz1sQ6UheeWr9yNMe/pyBjX3jFragsd1iz
        E6gNSkv2OBLv91nAVycjur1jRY9KY3CbZSLap/VXAT1jjAc9APb7WkexpgIyVV5xM5cJTj5P9cd
        mlLyxEnDHPM4IwNILiscwG1grqi8kx0+k1g==
X-Received: by 2002:a05:6402:110b:: with SMTP id u11mr6397938edv.356.1616528418168;
        Tue, 23 Mar 2021 12:40:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWHFAwTK7ag1Wvv7Id+c3/SYEgI+THVgdw8ygYHwpZENXbTKwxMbLV2w6ixKzeZOeLR4v7Vg==
X-Received: by 2002:a05:6402:110b:: with SMTP id u11mr6397924edv.356.1616528418074;
        Tue, 23 Mar 2021 12:40:18 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id m14sm13563701edr.13.2021.03.23.12.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 12:40:17 -0700 (PDT)
Subject: Re: [PATCH v5 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Perry Yuan <Perry.Yuan@dell.com>, pobrn@protonmail.com,
        oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com,
        mgross@linux.intel.com, Mario.Limonciello@dell.com
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        lgirdwood@gmail.com, platform-driver-x86@vger.kernel.org,
        broonie@kernel.org
References: <20210322093841.11840-1-Perry_Yuan@Dell.com>
 <a1fae1fc-2d4f-63e8-e0be-0f9c4c91640c@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c61b975a-a771-eb63-5232-2da184ca95fe@redhat.com>
Date:   Tue, 23 Mar 2021 20:40:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a1fae1fc-2d4f-63e8-e0be-0f9c4c91640c@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/23/21 7:57 PM, Pierre-Louis Bossart wrote:
> Minor comments below.

<snip<

>> +int __init dell_privacy_acpi_init(void)
> 
> is the __init necessary? You call this routine from another which already has this qualifier.

Yes this is necessary, all functions which are only used during module_load / from the
module's init function must be marked as __init so that the kernel can unload them
after module loading is done.

I do wonder if this one should not be static though (I've not looked at this patch in
detail yet).

> 
>> +{
>> +    int err;
>> +    struct platform_device *pdev;
>> +
>> +    if (!wmi_has_guid(DELL_PRIVACY_GUID))
>> +        return -ENODEV;
>> +
>> +    privacy_acpi = kzalloc(sizeof(*privacy_acpi), GFP_KERNEL);
>> +    if (!privacy_acpi)
>> +        return -ENOMEM;
>> +
>> +    err = platform_driver_register(&dell_privacy_platform_drv);
>> +    if (err)
>> +        goto pdrv_err;
>> +
>> +    pdev = platform_device_register_simple(
>> +            PRIVACY_PLATFORM_NAME, PLATFORM_DEVID_NONE, NULL, 0);
>> +    if (IS_ERR(pdev)) {
>> +        err = PTR_ERR(pdev);
>> +        goto pdev_err;
>> +    }
>> +
>> +    return 0;
>> +
>> +pdev_err:
>> +    platform_device_unregister(pdev);
>> +pdrv_err:
>> +    kfree(privacy_acpi);
>> +    return err;
>> +}
>> +
>> +void __exit dell_privacy_acpi_exit(void)
> 
> is the __exit required here?

Idem. Also static ?

Regards,

Hans



> 
>> +{
>> +    struct platform_device *pdev = to_platform_device(privacy_acpi->dev);
>> +
>> +    platform_device_unregister(pdev);
>> +    platform_driver_unregister(&dell_privacy_platform_drv);
>> +    kfree(privacy_acpi);
>> +}
>> +
>> +MODULE_AUTHOR("Perry Yuan <perry_yuan@dell.com>");
>> +MODULE_DESCRIPTION("DELL Privacy ACPI Driver");
>> +MODULE_LICENSE("GPL");
> 
> 

