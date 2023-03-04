Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00F4C64EC4
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Mar 2023 10:01:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjCDKBt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Mar 2023 05:01:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjCDKBt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Mar 2023 05:01:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0168E1EBE8
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Mar 2023 02:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677924063;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8fpGOb7uObDhao/SoIdmzVrccwTiQotLXVUMBKWcNz8=;
        b=KJ7YK3dBdN+JeyBsnSDagHlrmwaI3w5Sdd+cKoW4dmb1XfIS2QdUG8Y7T3jjx64I4cE188
        iYjRFqaDrfdXzHT2l5aricUmE1BPThOhLd5W7EKz6xm79Iia4vSPlpplTf6HR67GH0eMNa
        /lVQ0Ln8l4nNNqoWjik9FWjf8aTRgjE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-1kgAv9GSOZ-CA6hgLbNtcw-1; Sat, 04 Mar 2023 05:01:01 -0500
X-MC-Unique: 1kgAv9GSOZ-CA6hgLbNtcw-1
Received: by mail-ed1-f72.google.com with SMTP id q13-20020a5085cd000000b004af50de0bcfso7419570edh.15
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Mar 2023 02:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677924060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8fpGOb7uObDhao/SoIdmzVrccwTiQotLXVUMBKWcNz8=;
        b=WP6KiIfrrEsvgwbBZEYCSx0nhVZuL9tS1yrNwbN1kyf66PdHacyR/pzw9HhJExb4RO
         oEbaM+ovH1WD2Li3KnpnCDxR/tQGgoCRMVKUGO+xkZp1ZwpcyajKz/kJajq1SbnQA6Qk
         aRTKXPl7x+XCPYsHzdt8wM0EO4mvWKwQhee/Q9Q9jEKDaTA2uMykg/oBg4fmvEQ0zyQC
         09LSg2XnvEQZNwQEwozDqJuRNOVZPHwAnTBb0L663KQIyFcCVCqK6VOHq2PBDC2/Mqdj
         w4XuWOdUEkqf4Sk7cn3ysQFZffaVMa7VxhRrrqukKLmkugMVWK3r5yIN7NZ2w2tkvmYU
         PskQ==
X-Gm-Message-State: AO0yUKXj+YzjeHfvZF6hrsP11oCTfEE4diNnpYkdz3g0EOl0ep9UK5LU
        zdsXWXEeI0RRyK6aj4jYYGobQnDj8Eh0zrIK2aCsdxVI697q4onisXCZiHqGwn+0pxbD733eXxI
        csdN2ukvO+enl2ys857aNQxOQYdDTCssqcg==
X-Received: by 2002:a17:906:408f:b0:8b1:7968:7fb8 with SMTP id u15-20020a170906408f00b008b179687fb8mr5231774ejj.62.1677924060541;
        Sat, 04 Mar 2023 02:01:00 -0800 (PST)
X-Google-Smtp-Source: AK7set/IBBQx/bV7xYa/QBC3lLpzytxV8JzKcY4QIdUv8+MrBgUOe0ea0tsv9rxwav3Hw+xfNeXgkg==
X-Received: by 2002:a17:906:408f:b0:8b1:7968:7fb8 with SMTP id u15-20020a170906408f00b008b179687fb8mr5231759ejj.62.1677924060278;
        Sat, 04 Mar 2023 02:01:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n21-20020a17090625d500b00905a1abecbfsm1903094ejb.47.2023.03.04.02.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 02:00:59 -0800 (PST)
Message-ID: <68a17e4e-a9ee-fe8b-abcd-7ccb4932e72a@redhat.com>
Date:   Sat, 4 Mar 2023 11:00:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: Add intel_bytcrc_pwrsrc driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230303221928.285477-1-hdegoede@redhat.com>
 <CAHp75VfOUnVVr=_VcTch4-=KTv6v5yG3g+adgn2CtnjKCV0YYw@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfOUnVVr=_VcTch4-=KTv6v5yG3g+adgn2CtnjKCV0YYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/3/23 23:41, Andy Shevchenko wrote:
> On Sat, Mar 4, 2023 at 12:19 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Add a new driver for the power-, wake- and reset-source functionality
>> of the Bay Trail (BYT) version of the Crystal Cove PMIC.
>>
>> The main functionality here is detecting which power-sources (USB /
>> DC in / battery) are active. This is normally exposed to userspace as
>> a power_supply class charger device with an online sysfs attribute.
>>
>> But if a charger is online or not is already exposed on BYT-CRC devices
>> through either an ACPI AC power_supply device, or through a native driver
>> for the battery charger chip (e.g. a BQ24292i).
>>
>> So instead of adding duplicate info under the power_supply class this
>> driver exports the info through debugfs and likewise adds debugfs files
>> for the reset- and wake-source info / registers.
>>
>> Despite this driver only exporting debugfs bits it is still useful to
>> have this driver because it clears the wake- and reset-source registers
>> after reading them. Not clearing these can have undesirable side-effects.
> 
> Hmm... Why is the existing regmap debugfs not enough? OK, maybe adding
> something (clearing bits) to the actual CRC PMIC driver.
> (You also can add a write callback so regmap will provide the write
> access to the registers).

I did consider adding clearing the bits to the actual CRC PMIC driver,
but this seemed like a cleaner solution and it gives a much nicer
(debug) interface then raw register access.

Also after clearing the wake + reset reasons they are gone and cannot
be retreived using debugfs regmap accesses.

This driver caches the values before clearing them.

>> Specifically if the WAKESRC register contains 0x01 (wake by powerbutton)
>> on reboot then the firmware on some tablets turns the reboot into
>> a poweroff. I guess this may be necessary to make long power-presses turn
>> into a poweroff somehow?
> 
> Have not a doc at hand. Next week I will try to dig into it to see if
> there is anything regarding it.

Note this seems to be a thing on BYT tablets which shipped with Android
and lack an EC compared to other BYT tablets with an CRC PMIC. So I think
things have been hacked around a bit here to deal with the lack of an EC.

I doubt this will be in the official docs, with that said thank you for
the offer to look this up.

Note for later BYTCR (Cost Reduced) tablets not having an EC is normal,
but these are pre BYTCR Android tablets actually AFAICT and their
Windows counterparts (same motherboard with some different components
do have an EC).

Regards,

Hans



