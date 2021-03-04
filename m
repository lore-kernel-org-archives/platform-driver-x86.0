Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E20C433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 10:35:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 584CB64F2B
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 10:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238733AbhCDKej (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Mar 2021 05:34:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48014 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238761AbhCDKeU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 05:34:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614853974;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j4HejqSklJVsTg6CoS5a262cyIiutG4WLo+IYPXPQlM=;
        b=BCn//R1K40h+csBd4HfjhqzNJx3jnsZG+QXIiMEZdwrwURM/+CE259ZBEuhffivhlEaSeD
        TDaqxGcbNHVeseIYQYyMyGAQbv+2q92QzpqhYI49WcS3u8xyt/PaQrHgaLOQwit4vkaOdW
        eyRb+8oY0Cjd2bvCcrgE8kbX5kqLhvk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-WnCRo9_cMQOPZSeLVZVgQg-1; Thu, 04 Mar 2021 05:32:53 -0500
X-MC-Unique: WnCRo9_cMQOPZSeLVZVgQg-1
Received: by mail-ed1-f69.google.com with SMTP id p12so13827724edw.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 02:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j4HejqSklJVsTg6CoS5a262cyIiutG4WLo+IYPXPQlM=;
        b=VfmDr/WcqI7e/PJMffU9ctnF85ZKn7QkBKNQc4FtDENw8aW9LvxsMoPb1mVTdPbzbj
         xc54yEQArpikssU7xpfaN65EPWW1oE1kMo1hUNXXwmDYVhOHZu+LOV6jgaJU8JyXDjcR
         ceGrGVNN3SsqkRRhq95DrKC4TaQsaodhB34sSfAuZ/Ksb5UmQbRxvoI/N3U3aoPwX3na
         0E9C1zQbqZVKPexSK18KQiIbjvrzkx9YxPaL8AXhzUVTEw4S4QnuUHbwjhdspXKfMzuy
         mnxTk19amkVZHy3f+foMcNdIdxjOHqN7i/eKvINl/VvZBb0DpRm57uHyNCPrvWuZNToX
         0F4w==
X-Gm-Message-State: AOAM532ihfugG0YEV9kVtGF6EgnzQEoUjNj8oeAPeOqQhv8gppxt1eeR
        1WltKfKrmkxqFKxZK/zd615P4LDEFaLlPCtmSJOq71aBQA+crB/NpFnT3eCkoN7QCXGGpZX/Pio
        k/LOBjP3Ume6BhGZ3nqQcitNN0nh6Rsn+JU4AAA6EVA8wn4WjCqdEmiwnYP0O2G8PPshuH5odcR
        i8q4GMLCkxSQ==
X-Received: by 2002:a17:906:3856:: with SMTP id w22mr3453143ejc.77.1614853971738;
        Thu, 04 Mar 2021 02:32:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZ4Y0A5npyEaY4pIsteuD1SZEXJpJl/vC1pJxomhbebvFxorDFymHWPYwcpHBhl/Q+/ZgPZQ==
X-Received: by 2002:a17:906:3856:: with SMTP id w22mr3453125ejc.77.1614853971536;
        Thu, 04 Mar 2021 02:32:51 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id lm24sm17105739ejb.53.2021.03.04.02.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 02:32:51 -0800 (PST)
Subject: Re: [PATCH RFC platform-next 0/8] platform: mellanox: Introduce
 initial chassis management support for modular Ethernet system
To:     Vadim Pasternak <vadimp@nvidia.com>,
        "andy@infradead.org" <andy@infradead.org>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20210203173622.5845-1-vadimp@nvidia.com>
 <ed879d55-f034-04d4-7b6f-0a39da532381@redhat.com>
 <DM6PR12MB3898CB505B0FCDA1F56AD028AF889@DM6PR12MB3898.namprd12.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bca89ef3-0569-f503-5da3-b5f74c8152af@redhat.com>
Date:   Thu, 4 Mar 2021 11:32:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB3898CB505B0FCDA1F56AD028AF889@DM6PR12MB3898.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/15/21 4:01 PM, Vadim Pasternak wrote:
> Hi Hans,
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Monday, February 15, 2021 4:41 PM
>> To: Vadim Pasternak <vadimp@nvidia.com>; andy@infradead.org
>> Cc: platform-driver-x86@vger.kernel.org
>> Subject: Re: [PATCH RFC platform-next 0/8] platform: mellanox: Introduce
>> initial chassis management support for modular Ethernet system
>>
>> Hi Vadim,
>>
>> On 2/3/21 6:36 PM, Vadim Pasternak wrote:
>>> Add initial chassis management support for Nvidia modular Ethernet
>>> switch systems MSN4800, providing a high performance switching
>>> solution for Enterprise Data Centers (EDC) for building Ethernet based
>>> clusters, High-Performance Computing (HPC) and embedded environments.
>>>
>>> This system could be equipped with the different types of replaceable
>>> line cards and management board. The first system flavor will support
>>> the line card type MSN4800-C16 equipped with Lattice CPLD devices
>>> aimed for system and ASIC control, one Nvidia FPGA for gearboxes
>>> (PHYs) management, and four Nvidia gearboxes for the port control and
>>> with 16x100GbE QSFP28 ports and also with various devices for
>>> electrical control.
>>>
>>> The system is equipped with eight slots for line cards, four slots for
>>> power supplies and six slots for fans. It could be configured as fully
>>> populated or with even only one line card. The line cards are
>>> hot-pluggable.
>>> In the future when more line card flavors are to be available (for
>>> example line cards with 8x200Gb Eth port, with 4x400 Eth ports, or
>>> with some kind of smart cards for offloading purpose), any type of
>>> line card could be inserted at any slot.
>>>
>>> The system is based on Nvidia Spectrum-3 ASIC. The switch height is 4U
>>> and it fits standard rack size.
>>>
>>> The next coming  card generations are supposed to support:
>>> - Line cards with 8x200Gbe QSFP28 Ethernet ports.
>>> - Line cards with 4x400Gbe QSFP-DD Ethernet ports.
>>> - Smart cards equipped with Nvidia ARM CPU for offloading and for fast
>>>   access to the storage (EBoF).
>>> - Fabric cards for inter-connection.
>>
>> Is there a specific reason why this series is RFC?  Typically that indicates the
>> code is not yet ready for merging and normally the cover-letter indicates why
>> the series is RFC.
> 
> Sorry, I missed to mention the reason why this is RFC. I don't have
> real hardware yet, which is arriving in 1.5 month.
> Code has been tested on hardware simulation setup.

Ah I see, this not being tested on real hw is a good reason for the
series to be a RFC series :)

> My intention was to get some feedback, since the modular system with
> the replaceable line cards is something new in kernel.

So my main concern here would be any new userspace API being added.

AFAICT from quickly scanning all 8 patches all new userspace API
is sysfs based and it is being documented/specified in patches 3 + 8,
so I will reply to those separately.

Please let me know if I've missed any other new userspace API bits.

I'm less worried about the API's between various kernel parts since
we can always refactor those later.

Regards,

Hans




>>> Patch set contains:
>>> Patch #1 – adds new types for modular system support.
>>> Patch #2 - adds support for the modular system equipped with replicable
>>> 		line cards.
>>> Patches #3 & #8 – add documentation.
>>> Patches #4 & #6 - extend logic for hotplug devices operations for the
>>> 		modular system support.
>>> Patch #5 – extends number of hwmon attributes for mlxreg-io driver,
>>> 		since modular system introduces more attributes.
>>> Patches #7 - introduces initial support for Mellanox line card devices.
>>>
>>> Vadim Pasternak (8):
>>>   platform_data/mlxreg: Add new types to support for modular systems
>>>   platform/x86: mlx-platform: Add initial support for new modular system
>>>   Documentation/ABI: Add new attributes for mlxreg-io sysfs interfaces
>>>   platform/mellanox: mlxreg-hotplug: Extend logic for hotplug devices
>>>     operations
>>>   platform/mellanox: mlxreg-io: Extend number of hwmon attributes
>>>   platform/mellanox: mlxreg-hotplug: Add line card event callbacks
>>>     support for modular system
>>>   platform/mellanox: mlxreg-lc: Add initial support for Mellanox line
>>>     card devices
>>>   Documentation/ABI: Add new line card attributes for mlxreg-io sysfs
>>>     interfaces
>>>
>>>  Documentation/ABI/stable/sysfs-driver-mlxreg-io |  195 +++
>>>  drivers/platform/mellanox/Kconfig               |   12 +
>>>  drivers/platform/mellanox/Makefile              |    1 +
>>>  drivers/platform/mellanox/mlxreg-hotplug.c      |  120 +-
>>>  drivers/platform/mellanox/mlxreg-io.c           |    2 +-
>>>  drivers/platform/mellanox/mlxreg-lc.c           |  807 ++++++++++
>>>  drivers/platform/x86/mlx-platform.c             | 1817 ++++++++++++++++++++--
>> -
>>>  include/linux/platform_data/mlxreg.h            |   61 +
>>>  8 files changed, 2785 insertions(+), 230 deletions(-)  create mode
>>> 100644 drivers/platform/mellanox/mlxreg-lc.c
>>>
> 

