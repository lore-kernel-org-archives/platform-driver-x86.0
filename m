Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19A9C001E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 12 Aug 2023 17:55:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbjHLRy4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 12 Aug 2023 13:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbjHLRyz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 12 Aug 2023 13:54:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D134110E5
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Aug 2023 10:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691862849;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y6JMIceaTcnICqNcbaFYg3o1RLYMTBxxd2akh5qJtnM=;
        b=dMnUdFKOgYEGTYeFib9y33Gx2qe2ZR37Njt3KVvcVkV/eqoqiSHYL4pzUq1PHJn9ttTUXT
        Mbwe2sUw0K/qlowBcXL413ww+GbmaXoZ7/ArxgI4KiiCXKAICMF21d2qBHHMEjZaIEDX7A
        BC2L3vwveLFIWbiwjiPA/dznCIBygBs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-btvuceNIML6dzNhq5ps6UA-1; Sat, 12 Aug 2023 13:54:08 -0400
X-MC-Unique: btvuceNIML6dzNhq5ps6UA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a34a0b75eso184147766b.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Aug 2023 10:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691862847; x=1692467647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6JMIceaTcnICqNcbaFYg3o1RLYMTBxxd2akh5qJtnM=;
        b=G6VJbDg4+bp8YyRfL/831ORptdQCysqjHssVdXpPgIYyaLno6zCTpFWEb4XhV7NOPZ
         Hf2T60tM8pb6pZhc3CtM9iKf5EtSwB08JbwoBJzvwpoXHyR1EB6lmUhB47FzqSvgWdmr
         LyYxgTk6t18jZRFk61Yz0OG7sK3F1uNEw5gVV7YZczyUEB7kWRd6pbzYkL0ShoGLTsWi
         0P/n9AHJlnH940+yv5lDPbQJepjTX6ov43jOKykn3CNqY1bwBGjLtI0vYUYi7bpjW6Dy
         a1S8QeWEfykh9EkG09TXRGIVQP7espOsZc0cNPKNxBqYa8HxfBgkq/5VuoaiU/eusAgn
         rsvg==
X-Gm-Message-State: AOJu0YxeaTN3djjojGxLKwgRzMK53PBuv/mr32XgoEWUEa0VkvOm5svj
        asG3tatxUWsAGfLdNhE8B4Fk+Xpkfnel1l6EG9i5WkP0nYPHQqP3ziZcxVsD6O+OK+2Gc9CcjK5
        7PhX7Mouk5d5YioiSEehmszGxNL8kDTNsJQ==
X-Received: by 2002:a17:907:7886:b0:993:d7ff:afe7 with SMTP id ku6-20020a170907788600b00993d7ffafe7mr4652265ejc.13.1691862847518;
        Sat, 12 Aug 2023 10:54:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQBNa70+l4NheelS7z+OH5oUQe1f9+CSNWCNqySt7M+NRNof703pKOFK8hUlUiKsSuE2hE4A==
X-Received: by 2002:a17:907:7886:b0:993:d7ff:afe7 with SMTP id ku6-20020a170907788600b00993d7ffafe7mr4652252ejc.13.1691862847224;
        Sat, 12 Aug 2023 10:54:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o12-20020a17090608cc00b00993004239a4sm3674515eje.215.2023.08.12.10.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Aug 2023 10:54:06 -0700 (PDT)
Message-ID: <bc324146-2ab3-9457-587c-89a3bcda7960@redhat.com>
Date:   Sat, 12 Aug 2023 19:54:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform/x86: lenovo-ymc: Only bind on machines with a
 convertible DMI chassis-type
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org, Gergo Koteles <soyer@irl.hu>,
        =?UTF-8?Q?Andr=c3=a9_Apitzsch?= <git@apitzsch.eu>,
        stable@vger.kernel.org
References: <20230812144818.383230-1-hdegoede@redhat.com>
 <CAG4kvq8O1em-DJa6JucOtym-kNxPuGUa+zK8R8PqYPEu2nHBiw@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAG4kvq8O1em-DJa6JucOtym-kNxPuGUa+zK8R8PqYPEu2nHBiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/12/23 19:25, Andrew Kallmeyer wrote:
> On Sat, Aug 12, 2023 at 7:48 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The lenovo-ymc driver is causing the keyboard + touchpad to stop working
>> on some regular laptop models such as the Lenovo ThinkBook 13s G2 ITL 20V9.
>>
>> The problem is that there are YMC WMI GUID methods in the ACPI tables
>> of these laptops, despite them not being Yogas and lenovo-ymc loading
>> causes libinput to see a SW_TABLET_MODE switch with state 1.
>>
>> This in turn causes libinput to ignore events from the builtin keyboard
>> and touchpad, since it filters those out for a Yoga in tablet mode.
>>
>> Similar issues with false-positive SW_TABLET_MODE=1 reporting have
>> been seen with the intel-hid driver.
>>
>> Copy the intel-hid driver approach to fix this and only bind to the WMI
>> device on machines where the DMI chassis-type indicates the machine
>> is a convertible.
>>
>> Add a 'force' module parameter to allow overriding the chassis-type check
>> so that users can easily test if the YMC interface works on models which
>> report an unexpected chassis-type.
>>
>> Fixes: e82882cdd241 ("platform/x86: Add driver for Yoga Tablet Mode switch")
>> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2229373
>> Cc: Gergo Koteles <soyer@irl.hu>
>> Cc: Andrew Kallmeyer <kallmeyeras@gmail.com>
>> Cc: André Apitzsch <git@apitzsch.eu>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Too bad that this caused problems for some people. Thank you for
> getting it fixed Hans!
> 
> While I had trouble applying this patch as is (maybe the code has
> changed a bit since my patch), I was able to manually add these lines
> and test this fix on my laptop (Yoga 7 14AIL7). The new device was
> found and everything worked as expected.
> 
> Tested-by: Andrew Kallmeyer <kallmeyeras@gmail.com>

Great, thank you for the quick test.

Regards,

Hans



