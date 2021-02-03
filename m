Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CDDC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 12:13:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1284E64E46
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 12:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234373AbhBCMNP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 07:13:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59519 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234238AbhBCMNO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 07:13:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612354307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aowCP6kBTsA5t6ZpfLAfhl9/3ZTvn6bfJb4ffa7s2ac=;
        b=EbBepxe3styw/T4uVUmOP7n8o7465TCNXaMYKNHGySnojpka1x0e5mEwEzE3Nfj3e+PGVs
        oSo3l5mDPWOqVO5G3GWX0Z4l4Lr4Ps2SJV/xDQ06dspCVDpwTzICtwEN16gd3Bdbqj7DtK
        MDYTU5lRFbITduNF5p4ggSlLZ02VQqs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-bb_vzDKdMgOE1zcfc-mmQw-1; Wed, 03 Feb 2021 07:11:46 -0500
X-MC-Unique: bb_vzDKdMgOE1zcfc-mmQw-1
Received: by mail-ej1-f69.google.com with SMTP id yh28so2754756ejb.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Feb 2021 04:11:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aowCP6kBTsA5t6ZpfLAfhl9/3ZTvn6bfJb4ffa7s2ac=;
        b=V5UsEvJkrcDyX8OiAjBJ4vjsK/MOFXKN9WRgnv1e3P4iKyii1Jako1UZL1lWOK6jqk
         Ng72+O/Q39bFjNoAU1tW/KZMThy6zqXJvT1/x4167R5uKzzf/bg/uHDRE5Df3yYJTufx
         NRx+tXqAOe9cR/Ek30Zok7su2cj2qHCD6J5UM81Hq8S2KsGexBiFM5g2NxOOWbT3hXP1
         yeXTxFBeZ3A7JCKYHZDnNiO41gUvO4NuCos2XLXP9QW3QfD0KltVcVXqn+iknyBA9zUr
         +wQZ0FcInKckuJZYjVxaxYkWVBlWx5xQ6SUdvt9jBH9ivwoOQxKl6qSWuJoyKaJfxAcX
         iN8w==
X-Gm-Message-State: AOAM531iVOuUsy8DO8rBzDaNDiVijhrKFvyHRAaS+s7EcUP6kuY1C0Gf
        6wMj4jmH+vfEg3j+wDpZFBEb7AmIhwYP/glEX0G9Y2xQmAcadcZIWc7Ruau9TxrjaTAWSWjTbl8
        wT4o79Wc/LohyAzN0wMsOrWnS/d21pvKq4lQsrKQyfVzaK7fm7LdVlqbv1dMsp2b+mzwuHa/SVq
        Sha4R8WpiGSA==
X-Received: by 2002:a17:906:af41:: with SMTP id ly1mr2757733ejb.525.1612354304555;
        Wed, 03 Feb 2021 04:11:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3dwye1jHRwTwtZd1quBUHgWWAvPsFi6m1n31ipICxMtxNZb0gDGbG92RLF9P6bW3A2/fXYA==
X-Received: by 2002:a17:906:af41:: with SMTP id ly1mr2757712ejb.525.1612354304237;
        Wed, 03 Feb 2021 04:11:44 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id r16sm906204ejc.112.2021.02.03.04.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 04:11:43 -0800 (PST)
Subject: Re: [PATCH v1] platform/x86: Kconfig: Surround WMI drivers by 'if
 ACPI_WMI'
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20210126140052.3451769-1-andriy.shevchenko@linux.intel.com>
 <3578abae-bf14-c3fe-7726-25358e8993ea@redhat.com>
 <6b88be94-cc9c-e86c-82bc-f0d72e0c1c4f@redhat.com>
 <YBqJ7VmchoG6Kt8t@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c3fc4dfd-13b5-73c0-7d97-cdab0b61f170@redhat.com>
Date:   Wed, 3 Feb 2021 13:11:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YBqJ7VmchoG6Kt8t@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/3/21 12:33 PM, Andy Shevchenko wrote:
> On Wed, Feb 03, 2021 at 11:55:40AM +0100, Hans de Goede wrote:
>> On 2/3/21 11:48 AM, Hans de Goede wrote:
>>> On 1/26/21 3:00 PM, Andy Shevchenko wrote:
>>>> Surround WMI drivers by 'if ACPI_WMI' instead of depending
>>>> each of them separately.
>>>
>>> This does not cover all drivers which depend on ACPI_WMI; and in
>>> for-next there is a new UV_SYSFS Kconfig symbol in the middle of
>>> the block which you are surrounding with if ACPI_WMI .. endif
>>> and that new Kconfig symbol does not depend on ACPI_WMI.
>>>
>>> Admittedly I should have payed more attention when the UV_SYSFS
>>> symbol was merged, but atm there is no real ordering in the
>>> Kconfig symbols.
>>
>> Ok, so I just checked the Makefile and noticed that there is
>> an ordering there. But most people start with looking at Kconfig
>> when adding a new driver and the ordering is very much not clear
>> there. Also splitting the Intel bits in three groups does not
>> necessariyl help IMHO. E.g  CONFIG_INTEL_CHT_INT33FE is in the
>> generic Intel block but it is definitely PMIC related.
>>
>> And the WMI drivers are grouped, except that some of them
>> (Asus, Dell, EEEPC at least) are not in the group...
>>
>> So I still think just sorting the entire bups alphabetically
>> is better. We can then also add a comment at the top to please
>> keep things sorted alphabetically.
> 
> In long term I prefer split the entire folder to subfolders where you create
> a new Kconfig with a rules like alphabetical order or so.
> 
> Shuffling now Kconfig and Makefile w/o above doesn't bring a value in my
> opinion.

Ok, lets keep things as is for now then and hopefully in the future
someone will have some time to clean this up a bit.

Regards,

Hans

