Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EDBC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 08:52:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B215611C4
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 08:52:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244584AbhKIIzn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Nov 2021 03:55:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244583AbhKIIzm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Nov 2021 03:55:42 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00678C061766
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 Nov 2021 00:52:56 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id i5so31690818wrb.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Nov 2021 00:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immu-ne.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aDt5AcmP+hGUAd+OlV839slvDoKlq8aR1W8+sUGr0nI=;
        b=FBlHTOEGhDtif7tYHfM+LX5hnH04gjJmUB/RpC3lMi745hSNHerVlwb9OPI3SxfnuQ
         dz3kgkgBQmsoYqbJDKX/ksYHE60q1fmfpqtkgqiMrXWT3Mo1HX2eVLE3jT3rvo5yVqu+
         u5kBpKS69OHDFdT2hSSBy8kTKe4u9L5Ym9hT8+6GmYHjisKPxeCsbRFS/6ilik2YZpsr
         np4ADMLRtjsBPL5v9fdZyfFlfjdj7rM5tBgVfhshlC9TvT/kx9aFsi1H62eRkBZlyzet
         EEQt07cKiZkKTNNJ5vGo0ET6QTyNLQ3164cp/MtPfMOUZ19obo65XP+YnJGudGarCl79
         UOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aDt5AcmP+hGUAd+OlV839slvDoKlq8aR1W8+sUGr0nI=;
        b=LmFMM6Osla3s8xV4oAAflnlVcu1tHyiv7xBQO47r76+YLiW5opxZxLU4ClNWGr7Sbt
         ldJLGqrDZlPJbNgYzs7nIP8ZAKSxnwdrh5dRLCO5enp6RTZtUk43nfolXXx5sBhUGJAA
         PcgG1mJHQ0Z+/uBwnL67GyioLRu+OI38SDY5W8y1TgHaz/78Am/IVtmMNnooRUgE84X/
         h75ZPDVgz08ZWjSM1j+MoZ+gd+H4UaHvFYAHZPZRYYYoe6dsUSEfzwpUXiygUo2EoDjZ
         pKt2e7TodFwkPKRaQ6IWEaCd1JhnkebAAc3GVJPXXVD5ShekbOEfOHmcnzzlOiLazCwc
         Qvpw==
X-Gm-Message-State: AOAM533oMCCmFuhd/ZSgUM7VMpa+lpBFMb46A4Yzl921XuBZn/c5DKkF
        eZbTcC0TtlGfBxmos5RTgc0Gmg==
X-Google-Smtp-Source: ABdhPJwiP+2iglFJrDNBGPH2koLqltR+Fjd1VahideDdfFo0Qehoa4YUZJSJfBOU2mfnSc5u5VXspg==
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr7131726wrs.272.1636447975481;
        Tue, 09 Nov 2021 00:52:55 -0800 (PST)
Received: from [192.168.1.158] ([45.138.42.234])
        by smtp.gmail.com with ESMTPSA id o8sm19374704wrm.67.2021.11.09.00.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 00:52:55 -0800 (PST)
Message-ID: <42cea157-55a2-bd12-335b-6348f0ff6525@immu.ne>
Date:   Tue, 9 Nov 2021 09:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] firmware: export x86_64 platform flash bios region via
 sysfs
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        philipp.deppenwiese@immu.ne, mauro.lima@eclypsium.com,
        hughsient@gmail.com, platform-driver-x86@vger.kernel.org
References: <20211109000130.42361-1-hans-gert.dahmen@immu.ne>
 <YYoSPjF3M05dR0PX@kroah.com>
From:   Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>
In-Reply-To: <YYoSPjF3M05dR0PX@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 09.11.21 07:16, Greg KH wrote:
> On Tue, Nov 09, 2021 at 01:01:30AM +0100, Hans-Gert Dahmen wrote:
>> Make the 16MiB long memory-mapped BIOS region of the platform SPI flash
>> on X86_64 system available via /sys/kernel/firmware/flash_mmap/bios_region
>> for pen-testing, security analysis and malware detection on kernels
>> which restrict module loading and/or access to /dev/mem.
> 
> That feels like a big security hole we would be opening up for no good
> reason.
> 
>> It will be used by the open source Converged Security Suite.
>> https://github.com/9elements/converged-security-suite
> 
> What is the reason for this, and what use is this new interface?
Because it is very hard to access the SPI flash to read the BIOS 
contents for (security) analysis and this works without the more complex 
and unfinished SPI drivers and it does so on a system where we may not 
access the full /dev/mem.

>> +static int __init flash_mmap_init(void)
>> +{
>> +	int ret;
>> +
>> +	pdev = platform_device_register_simple("flash_mmap", -1, NULL, 0);
>> +	if (IS_ERR(pdev))
>> +		return PTR_ERR(pdev);
>> +
>> +	ret = sysfs_create_group(&pdev->dev.kobj, &flash_mmap_group);
> 
> You just raced with userspace and lost  >
 > Please set the attribute to the platform driver before you create the
 > device.
 >

Sorry, but I went through tons of code and could not find a single 
instance where I can use a default group for creation without using a 
probe function that does the magic for me. Please help me find the 
correct way of doing this without manually creating and adding kobjects.

> Also, you just bound this driver to ANY platform that it was loaded on,
> with no actual detection of the hardware present, which feels like it
> could cause big problems on all platforms.  Please, if you really want
> to do this, restrict it to hardware that actually has the hardware you
> are wanting to access, not all machines in the world.

I ave already proven that it works on all x64 Intel platforms here [1]. 
It nearly impossible to prove for AMD b/c of the lack of documentation, 
but we tested it on several old Bulldozer system and so far the memory 
was always mapped. I feel that adding more hardware detection just adds 
complexity. Anyway, what do you suggest? Use CPUID to check if the 
vendor is AMD or Intel?

Hans-Gert Dahmen
