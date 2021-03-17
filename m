Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3CBC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 17:50:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A91FD64EF9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 17:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbhCQRtw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Mar 2021 13:49:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52445 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232439AbhCQRtW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Mar 2021 13:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616003361;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/+ibb3Br4K61RTkghPv+0gtVahorbHjJekn7ZK14QjI=;
        b=SYVSwhTUOI16+o/2z8/xWM+UEUZnJ5/hvbcPUvC/H/XQ8l0I2O7kXIP1eDu4cDy8AZxRuT
        lIxQfTghhUvfZwfJrYJx0SAaBI92V8GqlGKpALyN5xHlGP7mtLnr9skONPji8bLpXUmxOI
        8kGWlyvt8qzaB7wDvJnu4rpqUmPBJYs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-27MyT2bZOuqMgJZY5jZJgA-1; Wed, 17 Mar 2021 13:49:18 -0400
X-MC-Unique: 27MyT2bZOuqMgJZY5jZJgA-1
Received: by mail-ed1-f70.google.com with SMTP id o15so19839407edv.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Mar 2021 10:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/+ibb3Br4K61RTkghPv+0gtVahorbHjJekn7ZK14QjI=;
        b=P8KGf7SMKWz3JObsqurOlv+riQDXivkC0yU378AQRvdH+H451yRV3zCUcMULXAlRSn
         HzPadpw9Qf15w1v7ERanZM1YOMMYAQkKqy2EO1jc4jirDzrFUbwCij0LK+1/Y3zITl5V
         GpPIV9U8RWskzkB5cttvbcVXtayV9e6zZ5lP/nYJQ/mg7B817YYzXVze7pOHxdKjCivI
         nv1v1nnqMxlcRK/cR0o5hWPeVRbbY8HumOjEfB3lj4uikz2NH4oNP/mLPZILnPigIUGr
         Gh162J90WHz74LpEWX8fdTQ/k+VDfumbVgNC3zXgUoKAJp6JxBf611mWknwfiwN2Nxg5
         mDuQ==
X-Gm-Message-State: AOAM5302GMTP1h5vzJNO1cVdnmLTu9CEI61l5LOwNNldmoK3NDO3t6pp
        nZgKhNBqxixr2mwl6W6RH/thPb8uHrt8eeIk1s/BDsbdRtxZ36PoyhVLwB4s4DKICOcK4dj+869
        MVsvAYVTuwuxscisRkzZWVFb/zFSLJyT/UA==
X-Received: by 2002:a05:6402:31a7:: with SMTP id dj7mr43645991edb.33.1616003356754;
        Wed, 17 Mar 2021 10:49:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR8fampzxEqdpvBY7gKviiN76BsjpAVvBgItH/BesZSGl36lmeZngX9SfAjECSbSJlEG9Lzg==
X-Received: by 2002:a05:6402:31a7:: with SMTP id dj7mr43645978edb.33.1616003356623;
        Wed, 17 Mar 2021 10:49:16 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r17sm13942325edx.1.2021.03.17.10.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 10:49:16 -0700 (PDT)
Subject: Re: [PATCH 0/2] power: supply: Add battery and AC drivers for Surface
 devices
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Sebastian Reichel <sre@kernel.org>
Cc:     linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210309000530.2165752-1-luzmaximilian@gmail.com>
 <edcbe108-8cd7-4034-222f-c8ce56918dee@redhat.com>
 <f124e477-2786-d842-5694-13aa4146ba34@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <efdf4d60-64e7-2dd8-5349-29725ec5cbea@redhat.com>
Date:   Wed, 17 Mar 2021 18:49:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f124e477-2786-d842-5694-13aa4146ba34@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/17/21 6:47 PM, Maximilian Luz wrote:
> On 3/17/21 6:39 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 3/9/21 1:05 AM, Maximilian Luz wrote:
>>> This series provides battery and AC drivers for Microsoft Surface
>>> devices, where this information is provided via an embedded controller
>>> (the Surface System Aggregator Module, SSAM) instead of the usual ACPI
>>> interface.
>>>
>>> Specifically, 7th generation Surface devices, i.e. Surface Pro 7,
>>> Surface Book 3, Surface Laptop 3, as well as the Surface Laptop Go use
>>> this new interface.
>>>
>>> Note: This series depends on the
>>>
>>>      platform/surface: Add Surface Aggregator device registry
>>>
>>> series. More specifically patch
>>>
>>>      platform/surface: Set up Surface Aggregator device registry
>>>
>>> The full series has been merged into the for-next branch of the
>>> platform-drivers-x86 tree [1]. The commit in question can be found at
>>> [2].
>>>
>>> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next
>>> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=for-next&id=fc622b3d36e6d91330fb21506b9ad1e3206a4dde
>>
>> Sebastian, I guess you want a pull-req from an immutable branch from me for
>> that dependend commit and then you will merge these 2 patches ?
>>
>> Maximillian, this only needs that commit right, or would it be better if
>> I send Sebastian a pull-req for a branch with the entire series?
> 
> The entire series would be better, I think.
> 
> Strictly speaking, it only requires the mentioned commit to compile
> successfully, but if anyone would want to test this they'd need the full
> series (or at least the battery/power subsystem commit) due to the
> device instantiation.

Ack, I think the whole series makes the most sense too, so I will
prepare a pull-req for that.

> Same reasoning applies to the HID series.

Ack.

Regards,

Hans

