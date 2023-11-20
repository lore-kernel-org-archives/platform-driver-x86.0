Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD60C54E76
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Nov 2023 10:54:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232742AbjKTKyb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Nov 2023 05:54:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232940AbjKTKy1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 05:54:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA3CD9
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 02:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700477662;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2zUAf0kRwyhFacdVDNduqaFmW+J2nhNnMJ6K916lSRE=;
        b=YU6yOhgAuJfAKzFZ3ur2R+PWFkcwEVZKzx4pla4zdnIlKL6UegAdNoGegSXQyRaVTbrRB/
        29jQZmTzhuDy7RNuNi89WxeoEEZyQwDNbWz/AzwYNXgSJqNjPMpu1d3sEsJnJd0AKCmtww
        T4/CjrMWuQZmFYJ9mZxuk8s4Zg28U2U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-j81vGLwsNPOyNZHsYeKn_g-1; Mon, 20 Nov 2023 05:54:19 -0500
X-MC-Unique: j81vGLwsNPOyNZHsYeKn_g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9fa63374410so136617366b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 02:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700477658; x=1701082458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2zUAf0kRwyhFacdVDNduqaFmW+J2nhNnMJ6K916lSRE=;
        b=jxv1aU429gy9WSkgwLpQebHE6UBdSS0+nqVmJjK+LpER2DoiJ7R963IMu4E38k2AoJ
         dMQn81U3YNMG+lX++WZpAMc6e6lvvzGtcrIXKV+DF11B2eTa/7J0G/rJoK1VVtZGmQ5s
         mmfmtSr/t3oxs6DoQaBSdF5rivusrEjYmqOfdKkxbQqRkfdNMAXGGBQ11A4A7VUE2jTJ
         7qfvsPh4NlBpJiaaP0qCAm9TtYJNn7McI0i6LBU6VDcK8Mzw9+k8l+NaRHe0zEvXqA/p
         csmDWfeoRDEzftnTajpgEjZFZOeSrFvJ35CDzLmqsUcXLKwm4lN5qOM1EwCAQm93t6EX
         tL8Q==
X-Gm-Message-State: AOJu0YzLhRi/0upsCFBh2p2vjXO2iMJNXB0Hv9oO5eNqrKQiMnHWWtsp
        vaya8bOzdF2jc8J12JWNE6kvJe/7O7panUKsi2lv10dPM0BiL+0JEFru/LwbaQjaVXAsdlzM0oG
        imnTMmQ/xMOowAosgzqG9aECzuk27VlvoYQ==
X-Received: by 2002:a17:906:32c7:b0:9e7:3af8:1fd0 with SMTP id k7-20020a17090632c700b009e73af81fd0mr5202184ejk.76.1700477658011;
        Mon, 20 Nov 2023 02:54:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgoytvF8lwwp8rKx8884Oj65m/vmtmib1MiNPAMSTReWskVDTF1HFC8OJm9t7uAUXBc0cvnQ==
X-Received: by 2002:a17:906:32c7:b0:9e7:3af8:1fd0 with SMTP id k7-20020a17090632c700b009e73af81fd0mr5202175ejk.76.1700477657734;
        Mon, 20 Nov 2023 02:54:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id jx27-20020a170906ca5b00b009fda627abd9sm1262032ejb.79.2023.11.20.02.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 02:54:16 -0800 (PST)
Message-ID: <76d4f18e-a349-4337-a301-ffebb8f1c5e8@redhat.com>
Date:   Mon, 20 Nov 2023 11:54:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/9] Enable Wifi RFI interference mitigation feature
 support
Content-Language: en-US, nl
To:     "Ma, Jun" <majun@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
        amd-gfx@lists.freedesktop.org, lenb@kernel.org,
        johannes@sipsolutions.net, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        alexander.deucher@amd.com, Lijo.Lazar@amd.com,
        mario.limonciello@amd.com
Cc:     netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20231017025358.1773598-1-Jun.Ma2@amd.com>
 <5f85eb72-3f34-4006-85ca-2a2181113008@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5f85eb72-3f34-4006-85ca-2a2181113008@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/19/23 08:17, Ma, Jun wrote:
> ping...
> Any other comments?

Patches 1/9 and 2/9 look reasonable, once the questions about
use of the _DSM vs directly calling the WBRF ACPI method are
resolved I can merge patches 1/9 and 2/9 and create an immutable
feature branch based on 6.7-rc1 + these 2 patches.

I'll then also send a pull-request to the wifi /resp amdgpu
maintainers from this branch.

I see no acks / reviews from the wifi folks yet,
so once that immutable feature branch is ready the first
thing to do is try to get the wifi folks to review + merge WBRF
support.

Note I plan to not actually merge the feature branch
into for-next until the wifi folks are happy with the code.

This way if changes are necessary I can do a v2 feature branch
and the wifi folks can merge that instead.

Regards,

Hans




> On 10/17/2023 10:53 AM, Ma Jun wrote:
>> Due to electrical and mechanical constraints in certain platform designs there
>> may be likely interference of relatively high-powered harmonics of the (G-)DDR
>> memory clocks with local radio module frequency bands used by Wifi 6/6e/7. To
>> mitigate possible RFI interference we introuduced WBRF(Wifi Band RFI mitigation Feature).
>> Producers can advertise the frequencies in use and consumers can use this information
>> to avoid using these frequencies for sensitive features.
>>
>> The whole patch set is based on Linux 6.5.0. With some brief introductions
>> as below:
>> Patch1:      Document about WBRF
>> Patch2:      Core functionality setup for WBRF feature support
>> Patch3 - 4:  Bring WBRF support to wifi subsystem.
>> Patch5 - 9:  Bring WBRF support to AMD graphics driver.
>>
>> Evan Quan (7):
>>   cfg80211: expose nl80211_chan_width_to_mhz for wide sharing
>>   wifi: mac80211: Add support for WBRF features
>>   drm/amd/pm: update driver_if and ppsmc headers for coming wbrf feature
>>   drm/amd/pm: setup the framework to support Wifi RFI mitigation feature
>>   drm/amd/pm: add flood detection for wbrf events
>>   drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.0
>>   drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.7
>>
>> Ma Jun (2):
>>   Documentation/driver-api: Add document about WBRF mechanism
>>   platform/x86/amd: Add support for AMD ACPI based Wifi band RFI
>>     mitigation feature
>>
>>  Documentation/driver-api/wbrf.rst             |  71 +++
>>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  17 +
>>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 214 +++++++++
>>  drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  33 ++
>>  .../inc/pmfw_if/smu13_driver_if_v13_0_0.h     |  14 +-
>>  .../inc/pmfw_if/smu13_driver_if_v13_0_7.h     |  14 +-
>>  .../pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h  |   3 +-
>>  .../pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h  |   3 +-
>>  drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |   3 +-
>>  drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |   3 +
>>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |   9 +
>>  .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  |  60 +++
>>  .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  |  59 +++
>>  drivers/gpu/drm/amd/pm/swsmu/smu_internal.h   |   3 +
>>  drivers/platform/x86/amd/Kconfig              |  15 +
>>  drivers/platform/x86/amd/Makefile             |   1 +
>>  drivers/platform/x86/amd/wbrf.c               | 422 ++++++++++++++++++
>>  include/linux/acpi_amd_wbrf.h                 | 101 +++++
>>  include/linux/ieee80211.h                     |   1 +
>>  include/net/cfg80211.h                        |   8 +
>>  net/mac80211/Makefile                         |   2 +
>>  net/mac80211/chan.c                           |   9 +
>>  net/mac80211/ieee80211_i.h                    |   9 +
>>  net/mac80211/main.c                           |   2 +
>>  net/mac80211/wbrf.c                           | 105 +++++
>>  net/wireless/chan.c                           |   3 +-
>>  27 files changed, 1180 insertions(+), 6 deletions(-)
>>  create mode 100644 Documentation/driver-api/wbrf.rst
>>  create mode 100644 drivers/platform/x86/amd/wbrf.c
>>  create mode 100644 include/linux/acpi_amd_wbrf.h
>>  create mode 100644 net/mac80211/wbrf.c
>>
> 

