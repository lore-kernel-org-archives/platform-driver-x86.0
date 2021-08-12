Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096CFC4338F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Aug 2021 15:27:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3BC6610A3
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Aug 2021 15:27:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236311AbhHLP2A (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Aug 2021 11:28:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36655 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238055AbhHLP17 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Aug 2021 11:27:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628782053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TA43mTMVbiIVQ6dhmdTyeMp0SQjli5MTAeYmJDtnicw=;
        b=BPrkcfqKeXlyf3EX8nPQ7RolHXPV7j5FAFKiPV0itaEs9NLZkO7RwN6y1j0gAQpA/Z0fiM
        5oO1C53tzuc38UUX+v7syIi5Kkl2wgEXKHhPIZbKWwrJh2P4No8sZckJJM/NTEqSCptfpc
        iaDcztX1nzQINjh4pH8Of5797Fwu9ks=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-KDb5O7VQMCydP-qEh7oq5g-1; Thu, 12 Aug 2021 11:27:31 -0400
X-MC-Unique: KDb5O7VQMCydP-qEh7oq5g-1
Received: by mail-ed1-f71.google.com with SMTP id y22-20020a0564023596b02903bd9452ad5cso3185822edc.20
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Aug 2021 08:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TA43mTMVbiIVQ6dhmdTyeMp0SQjli5MTAeYmJDtnicw=;
        b=JZ93BSNSRdBAcpGS2bU5T6iO6PZAv9FR/vEUBz5mJgadMMhqcP++UwNy6zt/JlILMU
         W7tJB/9orvvEuO3epYR09kvJzx7jy8e57GndtxTigw8O8MGRpRp2L3BHKrcFOxmVbnif
         r4piHHbjxS6AEgQ6Lx970irRD+G+k4+MKQA90JNmWCYZb9Qlu5NW6bvCiacNgt/U+JQ0
         xUW0b5E/pDynAQhMnkaq+9n5luYxBYqdn8sWSzX21yGfJ+hXIen+u81P8Pl8U6xllRoV
         khpIlZSBLNOjuNdVKhrU9tLEf4stHAdvm1BFm1XLN8FhOkMN4aW1sF8rCd9l5HYeVAPB
         TU1g==
X-Gm-Message-State: AOAM530TqYWSOenElVrdpnikpU/9b9efBSzT9QaZyQ814nztNTuodw/u
        +2dAZJnkl7fnAvenRHvUxAGIL4ABuOcnOvHVbhwyw6Sl8IolTHYus277i944TbRV1AqTmzdSC4O
        AKd5wQAdqxZpJDIqaa4Hyg6YE6fg00QzlpA==
X-Received: by 2002:a17:906:3699:: with SMTP id a25mr4172177ejc.452.1628782050588;
        Thu, 12 Aug 2021 08:27:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpILZdmucUro1fJ64BfQNPV6SuGjTwtVbrBbBvEFyx8GHmFvspoTgFJocAtBVCS59l9cOYWQ==
X-Received: by 2002:a17:906:3699:: with SMTP id a25mr4172160ejc.452.1628782050459;
        Thu, 12 Aug 2021 08:27:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h8sm1293286edv.30.2021.08.12.08.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 08:27:30 -0700 (PDT)
Subject: Re: [PATCH 1/4] i2c: acpi: Add an i2c_acpi_client_count() helper
 function
To:     Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
References: <20210803160044.158802-1-hdegoede@redhat.com>
 <20210803160044.158802-2-hdegoede@redhat.com> <YQlzzy933V9XMHqt@lahna>
 <9fbf0d6a-2df3-4765-ccf5-788b86994d71@redhat.com> <YRLlNh4MrHyVobvR@kunai>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8b624c87-21dd-e051-d3f5-400212ed590c@redhat.com>
Date:   Thu, 12 Aug 2021 17:27:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRLlNh4MrHyVobvR@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/10/21 10:44 PM, Wolfram Sang wrote:
> 
>>>> We have 3 files now which have the need to count the number of
>>>> I2cSerialBus resources in an ACPI-device's resource-list.
>>>>
>>>> Currently all implement their own helper function for this,
>>>> add a generic helper function to replace the 3 implementations.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>
>> Thank you, Wolfram are you also ok with me merging this
>> patch through the pdx86 tree?
> 
> Sure!
> 
> Acked-by: Wolfram Sang <wsa@kernel.org>

Thank you. I've added this series to my review-hans branch now.

I'll push it out to pdx86/for-next after some (build) testing.

Regards,

Hans

