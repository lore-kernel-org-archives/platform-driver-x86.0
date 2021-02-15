Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DAEC433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 14:59:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1A7664EAA
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 14:59:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhBOO7F (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Feb 2021 09:59:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53350 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230306AbhBOO6L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Feb 2021 09:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613401004;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C7/6SkhZj68izBGsG8/2xbdZJ41s18nIem3iu9qGMRY=;
        b=ehjL7hdcqWzK6pSew7N3rtTQym3lfC2SFx+P2tKhLoYEVlu+0t1BmPFTFHG3x8wZfDWCbe
        dGDsb1s+InQ49UIjEKvlWQR4ariRXKfRYgJ09ya5lhNjgngNBxrfAES2ifJFggmMmgVmKu
        XPa+TfjJv52gUDmi8VK0XYCY2VkEQ1U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-r0Tfq85vNYGKx5WTa2aG6A-1; Mon, 15 Feb 2021 09:56:43 -0500
X-MC-Unique: r0Tfq85vNYGKx5WTa2aG6A-1
Received: by mail-ed1-f69.google.com with SMTP id u2so3562028edj.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2021 06:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C7/6SkhZj68izBGsG8/2xbdZJ41s18nIem3iu9qGMRY=;
        b=SLgyit+1ZW21j6g4HegsWsGHngPeg2kKG4LDOlBDR9D80QfstUl9dYWq7UCyd/6luu
         ZNuOs1aQULVSNL9wyTOC1qxqm45vCNFN2zH45PyOLxlWMXXVu4+PmIvWgZjdi3xNNUY9
         VGuiHpMQNkD3eLeLj8BC5mlTcGMZgddo1RWgvjuEmKYQsHUS12uAeA8aP06QQne0h08I
         WFRD0KZkZ7M4KQZALgZH145QRpLPLUmC+ho3G6olPZptiWteiqqsS3gNaws8sY3hRMJ6
         0w6O/cb86FMe5m489sqHP5rGwmzzyhRTlc3xKeCOINPBOwGVdSSMQ7c5rj7nBYS/E7q6
         10oA==
X-Gm-Message-State: AOAM532oqqkVPgfVkpVqpJ8nWFwT9ui2XKWQ3untK1xe2DQaK92hLrL8
        eISw/f9Gcem3T/oWT3P2m7OL/gis8Vm+TVHAbpRQ0dItOsGwGu7+p/eguVain/vE1qHuwswR7RE
        qnc2gyP7Jm0plc0InC5iHgk6GpPb9DOid5Q==
X-Received: by 2002:a05:6402:4391:: with SMTP id o17mr15955787edc.196.1613401001443;
        Mon, 15 Feb 2021 06:56:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx38aACQ1U8wXIdboC62So4saijuy0+ev58xJuDHDrRQG8u+e9kOHHOzX4gXPbl+KjSoRIXng==
X-Received: by 2002:a05:6402:4391:: with SMTP id o17mr15955778edc.196.1613401001326;
        Mon, 15 Feb 2021 06:56:41 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id o26sm2174323edr.16.2021.02.15.06.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 06:56:40 -0800 (PST)
Subject: Re: [PATCH v2 0/4] platform/surface: Add platform profile driver for
 Surface devices
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <mgross@linux.intel.com>,
        Len Brown <lenb@kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210211201703.658240-1-luzmaximilian@gmail.com>
 <898aa498-8256-d59f-9e72-0e1199b3a62a@redhat.com>
 <CAJZ5v0jGUgHsNaqLarf=YLwjtOe-mQB48LkOQLi7FcZyW1Qchg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1d4b3de2-6b05-ef17-2489-db8fb2dfd371@redhat.com>
Date:   Mon, 15 Feb 2021 15:56:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0jGUgHsNaqLarf=YLwjtOe-mQB48LkOQLi7FcZyW1Qchg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/15/21 3:54 PM, Rafael J. Wysocki wrote:
> On Mon, Feb 15, 2021 at 3:36 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 2/11/21 9:16 PM, Maximilian Luz wrote:
>>> This series adds a driver to provide platform profile support on 5th-
>>> and later generation Microsoft Surface devices with a Surface System
>>> Aggregator Module. On those devices, the platform profile can be used to
>>> influence cooling behavior and power consumption.
>>>
>>> To achieve this, a new platform profile is introduced: the
>>> 'balanced-performance' profile.
>>>
>>> In addition, a couple of fix-ups are performed:
>>> - Hide CONFIG_ACPI_PLATFORM_PROFILE and change drivers so that it is
>>>   selected instead of depended on.
>>> - Fix some references to documentation in a comment.
>>>
>>> Note: This series (or more specifically "platform/surface: Add platform
>>> profile driver") depends on the "platform/surface: Add Surface
>>> Aggregator device registry" series.
>>>
>>> Changes in v2:
>>>  - Introduce new 'balanced-performance' platform profile and change
>>>    profile mapping in driver.
>>>  - Perform some fix-ups for the ACPI platform profile implementation:
>>>    - Fix some references to documentation in a comment.
>>>    - Hide CONFIG_ACPI_PLATFORM_PROFILE
>>
>> Thanks, the entire series looks good to me, so for the series:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Rafael, can you (once 5.12-rc1 is out) pick 1-3/4 and then provide a
>> stable branch for me to merge?
> 
> Since [1-3/4] appear to be uncontroversial, so IMO it would be better
> to merge them during the merge window, so they are present in
> 5.12-rc1.
> 
> The extra stable branch wouldn't be necessary in that case.

That works for me, thanks.

Regards,

Hans



