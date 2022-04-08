Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE2DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  8 Apr 2022 15:04:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237366AbiDHPG6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 8 Apr 2022 11:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237365AbiDHPG5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Apr 2022 11:06:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 765DC1DEC36
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Apr 2022 08:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649430292;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2gfhpXIPo0MHSO3yQnrafgGGxLfNK3GosJdZ3cqXA5E=;
        b=dWwDnZsUxQ8WyF2D2UzmezcLwg9+T1w4BxwKWWMljjX4KlsqnlLfsKDEGM4fqb1tRHNIRb
        IA7JC3Lohnq8htJJeVwALdpKXvPumtvseJkWQDbsCHTANoXZnTGK+QnqJqpCIV8s7Yesxi
        7r8HJ0L2bTBTticqHTkfjlePBWc0M6Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-ZwHog79ONtu3ufHX5XCdMA-1; Fri, 08 Apr 2022 11:04:51 -0400
X-MC-Unique: ZwHog79ONtu3ufHX5XCdMA-1
Received: by mail-ed1-f70.google.com with SMTP id w8-20020a50d788000000b00418e6810364so4715726edi.13
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 Apr 2022 08:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2gfhpXIPo0MHSO3yQnrafgGGxLfNK3GosJdZ3cqXA5E=;
        b=m2XO+09R2TRmvQecQ/kvURFUDg7SDXSpuLQUVj1qqk5gz9nsCca/CKK9dSmk0qhTwM
         ZdOwv1DDQWR5wsRPYxjUBadNUPmWiDwosSl1IEPptw7TDF4ZOQ+tPwdmGZrDHB6xSGIc
         LRpCYytC4owvTFJLQHZwvhV3FHMn4rnmjyeCINRk/6yF9VqRJ9vXCszk+8YlC+pqFAdh
         hYS9122lY1RKQNGTcQ1Q48Tpj5sKD1xgffQDuqdLyYdWcKdFTKdD0eFtbz4xfxL5K0f5
         ijNN+49Rtjem4CygCHuoZQDWNjGyrYHR2MMn2DbJkCGAOh+qo21kW7JJR2wIpANY1GOL
         87UQ==
X-Gm-Message-State: AOAM530g+i4CapxxaYklnzglj1UnRlmOG4YkbWS8NNFohWSK0eMsIxi/
        zbPIxp7X7qxNMQJgxP7hzjTWmiRITC3GWoOy4U1n+kAug3F6/03PR1cFElaiMB4A+VrsI1gFzGy
        3AlSdO8nSiqFSmViVriK6fPeMDVp2vWpQgQ==
X-Received: by 2002:a17:907:1c1c:b0:6e4:e488:4e76 with SMTP id nc28-20020a1709071c1c00b006e4e4884e76mr18528435ejc.93.1649430289887;
        Fri, 08 Apr 2022 08:04:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+3Zw8PXj4MTX2uumOVUodGGd6kaSGcUFwA5fYIkaVfJTMXsHANVdv7GrQtQUXk4s+iiEccQ==
X-Received: by 2002:a17:907:1c1c:b0:6e4:e488:4e76 with SMTP id nc28-20020a1709071c1c00b006e4e4884e76mr18528401ejc.93.1649430289653;
        Fri, 08 Apr 2022 08:04:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a00:8801:7f46:c497:ac60:f6e7? (2001-1c00-2a00-8801-7f46-c497-ac60-f6e7.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a00:8801:7f46:c497:ac60:f6e7])
        by smtp.gmail.com with ESMTPSA id y14-20020a056402440e00b00416046b623csm11264276eda.2.2022.04.08.08.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 08:04:48 -0700 (PDT)
Message-ID: <97c135d6-1399-6a2e-f1f7-95fb85dbb14c@redhat.com>
Date:   Fri, 8 Apr 2022 17:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 5/6] Sure Admin Security Feature
Content-Language: en-US
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20220404203626.4311-1-jorge.lopez2@hp.com>
 <20220404203626.4311-6-jorge.lopez2@hp.com>
 <BL1PR12MB5157263F33A534E144618223E2E59@BL1PR12MB5157.namprd12.prod.outlook.com>
 <f346c8c9-d932-cfee-ad6c-0671461e78c1@redhat.com>
 <CAOOmCE_kg2KPwZHMfqwHMSmmd3Yh3eaMbgMwgdW65j1Nk1f=7w@mail.gmail.com>
 <BL1PR12MB515721B0E512879ECD8189B7E2E49@BL1PR12MB5157.namprd12.prod.outlook.com>
 <CAOOmCE8AB4P_w4jVcG=QDuocbHhVC4Rn2V3KiYL-yVMAPf7UzQ@mail.gmail.com>
 <e71159dc-aaab-00cd-9751-27454f46f804@redhat.com>
 <CAOOmCE9DLAhdB74n9vvQfGK1drs+Qs+HK-WBPQaLC_FP8+SZ=w@mail.gmail.com>
 <BL1PR12MB5157ADB72058C81354C97B36E2E99@BL1PR12MB5157.namprd12.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <BL1PR12MB5157ADB72058C81354C97B36E2E99@BL1PR12MB5157.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/8/22 16:54, Limonciello, Mario wrote:
> [Public]
> 
> 
> 
>> -----Original Message-----
>> From: Jorge Lopez <jorgealtxwork@gmail.com>
>> Sent: Friday, April 8, 2022 09:47
>> To: Hans de Goede <hdegoede@redhat.com>
>> Cc: Limonciello, Mario <Mario.Limonciello@amd.com>; platform-driver-
>> x86@vger.kernel.org
>> Subject: Re: [PATCH v1 5/6] Sure Admin Security Feature
>>
>> On Fri, Apr 8, 2022 at 4:21 AM Hans de Goede <hdegoede@redhat.com>
>> wrote:
>>>
>>> Hi Jorge,
>>>
>>> On 4/7/22 15:44, Jorge Lopez wrote:
>>>> Hans, Mario,
>>>>
>>>> The code links make references to code that implements the new
>>>> interfaces but there's
>>>> still code in the kernel that uses the old ones.
>>>
>>> I'm not sure what you mean with "uses the old ones" there never
>>> has been any kernel drivers for changing BIOS settings before
>>> the dell and lenovo drivers were merged.
>>
>> "uses the old ones" statement means that there are drivers on the tree
>> that change BIOS settings without having to convert to the new
>> standards.  hp-wmi remained unsupported for many years so I can
>> understand why the security features need to use the standardized API.
>>
>>>
>>> Sure there are generic mechanisms like chardev-s and ioctls which
>>> are used for a whole bunch of things. But AFAIK there never was
>>> an API specifically for changing BIOS settings before.
>>>
>>>> I do agree we should
>>>> be forward looking
>>>> and want to be good participants in the kernel development, but can't
>>>> let our immediate
>>>> business needs be impacted with opportunities to enhance the driver to
>>>> take advantage
>>>> of the latest kernel features.
>>>>
>>>> Rewriting those security features will impact customer business
>>>> datelines requiring
>>>> HP to provide private releases as the kernel version changes.   The
>>>> requested changes
>>>> will impact products in the market and HP ability to help customers to
>>>> migrate to Linux
>>>> from Windows products.
>>>
>>> This sounds like you are saying that you are already shipping
>>> a version of the driver with the non-standard API to customers.
>>> Shipping code to customers before even proposing it upstream is
>>> HP own choice and the results of that as such are HP's
>>> responsibility.
>>>
>> The products shipped to customers are Windows products and customers
>> are accustomed to how the data is reported and set.  The goal for the
>> new security features in Linux is to help those customers migrate to
>> Linux with little or no change to their scripts/tools.
> 
> I think if this is the situation then a userspace compatibility /conversion tool is
> your better answer than a large compatibility layer in debugfs.
> 
> From the customer perspective they just need to see that JSON file in/out, right?
> So you should be able to write a tool/script that parses all the attributes from
> sysfs in a high level language and puts them into a JSON payload for their scripts
> to work from.  Likewise it should be able to parse a JSON payload and deploy
> all of that stuff into the standard API.

Big +1 from me for this proposal, I agree that having some userspace tool
to work with Windows compatible json files would be best here.


> 
> You can also explain in your documentation associates with such a tool/script
> that it's using a standard API and if they want to use that API directly instead
> of your compatibility tool they're welcome to do so.
> 
>>
>>> You cannot just say we are already shipping this so we need
>>> the upstream kernel to support this non standard API, that is
>>> not how upstream kernel development works.
>>>
>>> I realize that HP is new to working directly with the upstream kernel
>>> community and I realize that being told that the API which you are
>>> already using cannot be used for upstreaming your driver is not what
>>> you want to hear.
>>>
>>> But that does not change that I cannot accept a driver which does not
>>> implement the standard API which the upstream kernel community has
>>> agreed upon for this functionality.
>>>
>>> Or as Mario very elegantly put it:
>>>
>>> 'Keep in mind that from an upstream kernel perspective this driver is
>> "new".
>>> There is no requirements from the upstream perspective to
>>> keep your old interfaces in place from when it was out of tree.'
>>>
>>>> It is because of the immediate business needs, avoiding impacting our
>>>> customers/products,
>>>> and rewriting  enhancements to the driver that I need to propose an
>>>> interim solution.
>>>>
>>>> My proposal is to introduce a read/write value accessible in the user
>>>> space to control how
>>>> the driver reports and handles BIOS settings and values.  The new
>>>> configuration features
>>>> will be gradually disabled  as they are converted to use the standardized
>> API.
>>>> It is like the configuration flag used to overcome the tablet detection
>> problem
>>>> introduced in the past.   The changes solely affect the HP WMI driver.
>>>> This option will help us
>>>> move forward for this release and give us time to make the necessary
>>>> changes to both
>>>> the driver and support applications.
>>>>
>>>> Please let me know if this is a viable interim solution.
>>>
>>> First of all to be very clear, any code going upstream must support
>>> the standard API:
>>>
>>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.k
>> ernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%
>> 2Ftree%2FDocumentation%2FABI%2Ftesting%2Fsysfs-class-firmware-
>> attributes&amp;data=04%7C01%7CMario.Limonciello%40amd.com%7Cb0dd9
>> 6dde69d48c4e60c08da196ea2e1%7C3dd8961fe4884e608e11a82d994e183d%7
>> C0%7C0%7C637850260243195656%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
>> MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300
>> 0&amp;sdata=HDIa3CmOAhty7ZtwAoKh5VveEGCC%2Fuq5E1rx0hWOHns%3
>> D&amp;reserved=0
>>>
>>> from day one. I'm not really enthusiastic about the concept of also
>>> supporting the API which you have been using out of tree so far, but
>>> I guess that Mario's suggestion to offer a Kconfig option which
>>> when enabled offers this API under debugfs might be an acceptible
>>> compromise. I would need to see the actual code for that though to
>>> see if this is acceptable.
>>>
>>> And there would need to be a clear cut-of date document after which
>>> the code to support the old API will be removed.
>>>
>>>> If it is not possible, I need to ask where the actual written
>>>> requirement is found so I can
>>>> include them in the business justification for changes and release
>>>> delays to management.
>>>
>>> I'm not sure if this is written down somewhere, but certainly
>>> you will agree that if you were submitting a driver for a soundcard
>>> that that should use the existing ALSA userspace API for sound so
>>> that it would just work with the existing userspace sound support.
>>>
>>> This is the same. If an existing standardized userspace API exists
>>> for a certain functionality then that userspace API _must_ be used,
>>> AFAIK this is not explictly written down anywhere because it is just
>>> very much common sense.
>>
>> I completely agree with your comments and request for the driver to
>> implement the standardized API.  hp-wmi remained unsupported for many
>> years so I can understand why the security features need to use the
>> standardized API.  I am having conversations with other teams on how
>> to move forward with the standard API and how the data is handled and
>> reported.   We will submit a new set of patches utilizing the new
>> standard at a later time.   Would it be accurate to state that any
>> extensions to the standardized API model are acceptable, Correct?
>>
> 
> That's correct.  Dell did the first driver, and then Lenovo did the second.
> The majority of the features from the Dell driver applied to the Lenovo one
> and any idiosyncrasies were introduced as new sysfs files or documented and
> agreed different behaviors of others.

Again +1 / I agree where possible please try to fit things in the standardized
API, but as you can see from both the Dell and Lenovo sections in the API docs,
vendor extensions are allowed.

Regards,

Hans

