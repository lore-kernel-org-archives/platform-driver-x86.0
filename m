Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435C4C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 09:10:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A4F760F9C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 09:10:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234155AbhG1JK1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Jul 2021 05:10:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52151 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231378AbhG1JK1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 05:10:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627463425;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zIVE6zqlAFnf5TgD5F5ZRXOVlE25qGQt6KHbh4ikc0M=;
        b=S5dvHJON7CMz0j8Ujnb7+8gVlefPpL79FUryn+j45EFhLPO7OyJThEAWp3MqEdyWaF8jXa
        JHojVP36ohli9vm9bv2DZGAZo+IFjnioFuya6gV8uHSk7lyFSEKBN5UYNUccpLsbEdB9lg
        US/btRsgFmad/cu/znTz7LlX7bQIf+k=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-LVQWP_xoMwiuIDlQ0a84gg-1; Wed, 28 Jul 2021 05:10:24 -0400
X-MC-Unique: LVQWP_xoMwiuIDlQ0a84gg-1
Received: by mail-ej1-f72.google.com with SMTP id g21-20020a1709061e15b029052292d7c3b4so596438ejj.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2021 02:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zIVE6zqlAFnf5TgD5F5ZRXOVlE25qGQt6KHbh4ikc0M=;
        b=TDlU3NOxQco7SCAndtoMzW1ZfX+SX3ZF64K4Pkvn88vsVR4La1uCy2qtqVUhY0oAaj
         4yEtc5mBwcXEb/Gdlc8N+4RHoSk8Dn88fQn4tmv8pQW3pQifkKMrW/McXJ4bkGsMRbh3
         +CWejYlcooM7kkZiZ9oOlxdd3fDIVQVylJjxgmxptwAs6tXrw+5HACGCR2Q7q3lPT52k
         B7zMTapKpMgq3EAYmaY42+GvluI048rl98mLQFCNuayXtZd8AHSyGsN5sLPVpgjeyqzY
         48EE57/DVIsSYV0OC8KtdA72gPP2JlxLpVT9C+nnKRmGbhmZs0ogw/NV4W6PVAKsgCdV
         1bTQ==
X-Gm-Message-State: AOAM5323FlCfsN2gpqnL7jsUTWgfCqY8a3nZzHny81LAT6nK9Ox0+qPq
        QJ/WGht9c5r0GxcfiGVRe/ZOnYhHXzCG8EaUi8GcO4Onyr3Dn6VyBVBBmBstH+vmr0x42DkjDE3
        xy6PVdDYh1JkLf0+44XgOL4pwgaA7zijDNEN7pKAnnBq7YAeNdZC7FIhqUrDgWGSE/haBmd3M3G
        1BMsdQFcEWTw==
X-Received: by 2002:a17:906:2547:: with SMTP id j7mr12542180ejb.491.1627463423119;
        Wed, 28 Jul 2021 02:10:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfOAqX4sUvZiXyEc3viUelpZYIe5hgv9UfRYjIObD/mH3YbzjOeJSn/2+bGjJA3sHP8RZ2ow==
X-Received: by 2002:a17:906:2547:: with SMTP id j7mr12542165ejb.491.1627463422923;
        Wed, 28 Jul 2021 02:10:22 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id cw9sm1780398ejc.59.2021.07.28.02.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 02:10:22 -0700 (PDT)
Subject: Re: [PATCH 1/2] acpi: Add acpi_init_properties to ACPI driver code
From:   Hans de Goede <hdegoede@redhat.com>
To:     Michael Bottini <michael.a.bottini@linux.intel.com>,
        rjw@rjwysocki.net, lenb@kernel.org, irenic.rajneesh@gmail.com,
        david.e.box@linux.intel.com, mgross@linux.intel.com
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20210723202157.2425-1-michael.a.bottini@linux.intel.com>
 <d8e4f0f3-7282-50d4-16ac-2f67b210373c@redhat.com>
Message-ID: <1fd1a48e-3756-e933-9038-cb3f3e247144@redhat.com>
Date:   Wed, 28 Jul 2021 11:10:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d8e4f0f3-7282-50d4-16ac-2f67b210373c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/28/21 11:08 AM, Hans de Goede wrote:
> Hi,
> 
> On 7/23/21 10:21 PM, Michael Bottini wrote:
>> Some products in the field, like Intel Rocket Lake systems, contain
>> AML code that can modify _DSD properties after they have been
>> evaluated by ACPI init code. Therefore, there is a need for drivers
>> to be able to reevaluate _DSDs so that the updated property values can
>> be read. Export acpi_init_properties() for this purpose.
>>
>> Signed-off-by: Michael Bottini <michael.a.bottini@linux.intel.com>
> 
> My first instinct here is this is a firmware bug and we should
> go out of our way here to not support this and to instead apply
> pressure on the vendor to get the firmware fixed.
> 
> Let me explain, the standard use of _DSD is to allow embedding
> open-firmware/devicetree style properties inside ACPI nodes.
> 
> devicetree files, unlike AML contain static information, which
> is parsed once and only once.
> 
> Allowing AML code to dynamically change _DSD results pretty
> much breaks this entire model.
> 
> So I might be shooting from the hip a bit here:
> "no, just no". IOW nack.

I should have read the rest of the thread first I guess.

I see that Andy and Rafael are saying the same thing.

So here we have 3 people who all 3 are somewhat experts in ACPI
saying no to this. So yes please talk to the BIOS team as you
indicated elsewhere in the thread.

Regards,

Hans




>> ---
>>  drivers/acpi/property.c | 1 +
>>  include/linux/acpi.h    | 6 ++++++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
>> index e312ebaed8db..2c1f8cf1a8f0 100644
>> --- a/drivers/acpi/property.c
>> +++ b/drivers/acpi/property.c
>> @@ -432,6 +432,7 @@ void acpi_init_properties(struct acpi_device *adev)
>>  	if (!adev->data.pointer)
>>  		acpi_extract_apple_properties(adev);
>>  }
>> +EXPORT_SYMBOL(acpi_init_properties);
>>  
>>  static void acpi_destroy_nondev_subnodes(struct list_head *list)
>>  {
>> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
>> index 72e4f7fd268c..57defc3bc9b9 100644
>> --- a/include/linux/acpi.h
>> +++ b/include/linux/acpi.h
>> @@ -716,6 +716,8 @@ static inline u64 acpi_arch_get_root_pointer(void)
>>  
>>  int acpi_get_local_address(acpi_handle handle, u32 *addr);
>>  
>> +void acpi_init_properties(struct acpi_device *adev);
>> +
>>  #else	/* !CONFIG_ACPI */
>>  
>>  #define acpi_disabled 1
>> @@ -976,6 +978,10 @@ static inline int acpi_get_local_address(acpi_handle handle, u32 *addr)
>>  	return -ENODEV;
>>  }
>>  
>> +static inline void acpi_init_properties(struct acpi_device *adev)
>> +{
>> +}
>> +
>>  #endif	/* !CONFIG_ACPI */
>>  
>>  #ifdef CONFIG_ACPI_HOTPLUG_IOAPIC
>>

