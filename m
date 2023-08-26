Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841B6C83F01
	for <platform-driver-x86@archiver.kernel.org>; Sat, 26 Aug 2023 10:10:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbjHZKKU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 26 Aug 2023 06:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232404AbjHZKKQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 26 Aug 2023 06:10:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786DE1BF2
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Aug 2023 03:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693044566;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dAkaA+AncOVwhdekXkUnuSCht94d3FshWqsBj1ltMo8=;
        b=Uysi2IXz3I7cLiPOjqNi7O+IQNN/n3W9dC0BIDfBVLr+7Z9rYUlFcLThIKmBXNjNDDIJxV
        ORECHQmEHMJwN6rb7IUXAFb5c6UXZnGSzX+rnYFEA1DQMJ/AKW3oyBKl8qi4Sttsm1PnrK
        mRV2eQ7bg18odJNtDHZs+NzVuM9Xj1Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-lj8rxmdoNiCWQTHmL2EwMw-1; Sat, 26 Aug 2023 06:09:19 -0400
X-MC-Unique: lj8rxmdoNiCWQTHmL2EwMw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-51bee352ffcso1481813a12.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Aug 2023 03:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693044558; x=1693649358;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dAkaA+AncOVwhdekXkUnuSCht94d3FshWqsBj1ltMo8=;
        b=fOAC2r/Sn3GA5XeVs8yNtD9ohCK5aA2jr+uUotGGydk9K+mytFanlI+0wUDtFfUmmg
         R1Pg8gzuJzCb8bMiP9v7iY3A6EA2gjIG3qPl+Oo1priF1oCCUvRwe7sXIvr5FXANHxqQ
         UTKrwW4FHgF3CK3NUiqAaqMlglJLqQzKpoSc+F9We/8I0GaukHquBoBsNuduUl0QS3N/
         q/4kq3Sb56wpOSXEIkqd7md75tF3zN0auLkoSwSR2Xvbmj+RqEWTNXBiygruw1O0T0fx
         gnsguJRgN76zAaTzRaJiT7HKsYP2fL39Za3I+u6OaZsU8hx2lOxVdhJ7u9uI8Tk7DWN+
         UC9w==
X-Gm-Message-State: AOJu0YyNogrme0pklDnszxI9VFtAhnga7ZAi5/pyvOsD+zWkWCkuvmwS
        anNfxnEPssQa63wfCoIPRjTSzz/nSMo1LuTjq8x1bGV+DPGqx0d3bVro9jazmngp8DmH7aGSoMu
        7JI0KoQF0iJJHCkbQlwM5e2oljoP/D3S7zg==
X-Received: by 2002:aa7:cd50:0:b0:525:4471:6b5d with SMTP id v16-20020aa7cd50000000b0052544716b5dmr15539027edw.19.1693044558775;
        Sat, 26 Aug 2023 03:09:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQtWqiv0wW4XL2klN5mZTWrqxxMPryC+Bn5krbgv30YaqVSV1tJrUGUUIiJAYfpVeGFnijFw==
X-Received: by 2002:aa7:cd50:0:b0:525:4471:6b5d with SMTP id v16-20020aa7cd50000000b0052544716b5dmr15539015edw.19.1693044558491;
        Sat, 26 Aug 2023 03:09:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l5-20020a056402124500b005222c6fb512sm1990989edw.1.2023.08.26.03.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 03:09:17 -0700 (PDT)
Message-ID: <613570c6-7f5d-778c-183a-4aeb967c69d8@redhat.com>
Date:   Sat, 26 Aug 2023 12:09:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: linux-next: Tree for Aug 23 (drivers/platform/x86/amd/pmc.c)
Content-Language: en-US, nl
To:     Randy Dunlap <rdunlap@infradead.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230823161428.3af51dee@canb.auug.org.au>
 <5181685c-29d8-22a4-a2d7-682f26e2e031@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5181685c-29d8-22a4-a2d7-682f26e2e031@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 8/24/23 04:06, Randy Dunlap wrote:
> 
> 
> On 8/22/23 23:14, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20230822:
>>
>> New tree: drm-ci
>>
> 
> on x86_64:
> # CONFIG_SUSPEND is not set
> # CONFIG_PM is not set
> 
> 
> ../drivers/platform/x86/amd/pmc.c:878:15: error: variable ‘amd_pmc_s2idle_dev_ops’ has initializer but incomplete type
>   878 | static struct acpi_s2idle_dev_ops amd_pmc_s2idle_dev_ops = {
>       |               ^~~~~~~~~~~~~~~~~~~
> ../drivers/platform/x86/amd/pmc.c:879:10: error: ‘struct acpi_s2idle_dev_ops’ has no member named ‘prepare’
>   879 |         .prepare = amd_pmc_s2idle_prepare,
>       |          ^~~~~~~
> ../drivers/platform/x86/amd/pmc.c:879:20: warning: excess elements in struct initializer
>   879 |         .prepare = amd_pmc_s2idle_prepare,
>       |                    ^~~~~~~~~~~~~~~~~~~~~~
> ../drivers/platform/x86/amd/pmc.c:879:20: note: (near initialization for ‘amd_pmc_s2idle_dev_ops’)
> ../drivers/platform/x86/amd/pmc.c:880:10: error: ‘struct acpi_s2idle_dev_ops’ has no member named ‘check’
>   880 |         .check = amd_pmc_s2idle_check,
>       |          ^~~~~
> ../drivers/platform/x86/amd/pmc.c:880:18: warning: excess elements in struct initializer
>   880 |         .check = amd_pmc_s2idle_check,
>       |                  ^~~~~~~~~~~~~~~~~~~~
> ../drivers/platform/x86/amd/pmc.c:880:18: note: (near initialization for ‘amd_pmc_s2idle_dev_ops’)
> ../drivers/platform/x86/amd/pmc.c:881:10: error: ‘struct acpi_s2idle_dev_ops’ has no member named ‘restore’
>   881 |         .restore = amd_pmc_s2idle_restore,
>       |          ^~~~~~~
> ../drivers/platform/x86/amd/pmc.c:881:20: warning: excess elements in struct initializer
>   881 |         .restore = amd_pmc_s2idle_restore,
>       |                    ^~~~~~~~~~~~~~~~~~~~~~
> ../drivers/platform/x86/amd/pmc.c:881:20: note: (near initialization for ‘amd_pmc_s2idle_dev_ops’)
>   CC [M]  drivers/staging/iio/impedance-analyzer/ad5933.o
> ../drivers/platform/x86/amd/pmc.c: In function ‘amd_pmc_probe’:
> ../drivers/platform/x86/amd/pmc.c:1070:23: error: implicit declaration of function ‘acpi_register_lps0_dev’; did you mean ‘acpi_register_gsi’? [-Werror=implicit-function-declaration]
>  1070 |                 err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
>       |                       ^~~~~~~~~~~~~~~~~~~~~~
>       |                       acpi_register_gsi
>   CC [M]  drivers/staging/rts5208/rtsx_scsi.o
> ../drivers/platform/x86/amd/pmc.c: In function ‘amd_pmc_remove’:
> ../drivers/platform/x86/amd/pmc.c:1091:17: error: implicit declaration of function ‘acpi_unregister_lps0_dev’; did you mean ‘acpi_unregister_gsi’? [-Werror=implicit-function-declaration]
>  1091 |                 acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>       |                 acpi_unregister_gsi
> ../drivers/platform/x86/amd/pmc.c: At top level:
> ../drivers/platform/x86/amd/pmc.c:878:35: error: storage size of ‘amd_pmc_s2idle_dev_ops’ isn’t known
>   878 | static struct acpi_s2idle_dev_ops amd_pmc_s2idle_dev_ops = {
>       |                                   ^~~~~~~~~~~~~~~~~~~~~~
> 
> 
> Full randconfig file is attached.

Shyam, can you look into fixing this please?

Regards,

Hans

