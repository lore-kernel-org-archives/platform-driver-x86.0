Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0949AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 20:31:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D412160FDA
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 20:31:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbhIBUcr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Sep 2021 16:32:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37102 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231770AbhIBUcq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Sep 2021 16:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630614707;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FJselQymZtoiN8KPjDP7eQkEdIYbiU3HTI05e3JEhPQ=;
        b=EEAJbF3JKRsetKUlNb2amgQqx+WPx5ZtGRsqGi2O3Y0bnPcjp7Yj0CA8o73DpTbB47+aiT
        FVoeiXactbU+/ZJ650lLVRxz5FeDKbMQITF/CUW9ywIOxNT3z3mn4rroHmruov1G7dsPuJ
        4tI+oSdrVo4/AuL3fMgNIGhNr+R4rHs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-6N45VxTrOwmzs7MkjSVH9w-1; Thu, 02 Sep 2021 16:31:46 -0400
X-MC-Unique: 6N45VxTrOwmzs7MkjSVH9w-1
Received: by mail-ej1-f72.google.com with SMTP id ne21-20020a1709077b95b029057eb61c6fdfso1557033ejc.22
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Sep 2021 13:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FJselQymZtoiN8KPjDP7eQkEdIYbiU3HTI05e3JEhPQ=;
        b=qESRclS9B38WO27VcdJsQIUjbHFGMhWTDpOc6ngxodt4kJD0V2xYBcVm2PMK+4K/mF
         hSKMILN3o83bH+G7LaHa0HE24O8QHG4c3nyQ5bk/atzClPutrcjG2x2Srx/qvn7921Jy
         wo/F7rKRIuvypnxjjHAtl6p2kB8OspKv4Vt99XV/K9lBHcZdvGm0gvXuPofpD1UkkVJN
         Ix9uhJRLh+JG7X0EyTgtJsMHsa6pOltZQg8z3/0/OpKEl0qciMFj31ooozOY03RwfP2b
         d7z6WzmmlmdPqZ9h3SZBh5T563X1IH7FD3iMotahZNLS3C/RzM1nE43CagLYtdoYu8vO
         OkKg==
X-Gm-Message-State: AOAM5329bO2UojtqO10shtsPqte6jCBJ77Ou0+CI2bN3NEGCTlBcgNvu
        XEB1mwC3z6RDktx68y+PrJPVzDg06nOH82Dp6lrYpZQTtJY6O/xi3JALff8ZMTTE2ICCdE+8wws
        /HuTGvxo7AtCql5nZR5wqSuAGanijAR2oGA==
X-Received: by 2002:a05:6402:358e:: with SMTP id y14mr195488edc.296.1630614705224;
        Thu, 02 Sep 2021 13:31:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/vO/kgh1ZHMy5KHyX9SwTgMO/Znc5RRhC3O9VsGSOvJN6rS1XUsoW8qjfjPk4YNUL9+wl+g==
X-Received: by 2002:a05:6402:358e:: with SMTP id y14mr195474edc.296.1630614705040;
        Thu, 02 Sep 2021 13:31:45 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id x15sm1591558ejv.95.2021.09.02.13.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Sep 2021 13:31:44 -0700 (PDT)
Subject: Re: [PATCH v4] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     Daniel Dadap <ddadap@nvidia.com>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
Cc:     platform-driver-x86@vger.kernel.org, andy.shevchenko@gmail.com,
        mario.limonciello@outlook.com, pobrn@protonmail.com,
        dvhart@infradead.org, Aaron Plattner <aplattner@nvidia.com>
References: <70b81e33-c769-4cb8-0bae-5ee10a209389@nvidia.com>
 <20210831224906.1072-1-ddadap@nvidia.com>
 <eb7d46e2-64a8-4eb7-a940-e130ddae8626@t-8ch.de>
 <ce05cf8a-9b1f-e3a5-33bb-4f997bc2bcec@nvidia.com>
 <cac5ceb8-86d3-4f67-bbac-fbaf191d5973@t-8ch.de>
 <784b322b-ab4b-0a9f-f6cd-df81ba2d2cb5@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f4802d28-3674-bbc3-0377-52d3d03af4fe@redhat.com>
Date:   Thu, 2 Sep 2021 22:31:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <784b322b-ab4b-0a9f-f6cd-df81ba2d2cb5@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/2/21 10:15 PM, Daniel Dadap wrote:
> 
> On 9/2/21 5:19 AM, Thomas Weißschuh wrote:
>> It seems that the encoding of the mail has been set as plain ASCII while it is
>> actually UTF-8.
>> Thunderbird is probly correctly inferring the actual encoding.
>> Normally git-format-patch would detect the Unicode characters and add a
>> matching content-type header to the patch.
>> But as these Unicode characters are added after format-patch has run it is now
>> git-send-emails task to add those headers again.
>>
>> In my version of git I get the following message from git-send-email:
>>
>>    The following files are 8bit, but do not declare a Content-Transfer-Encoding.
>>        0001-....patch
>>    Which 8bit encoding should I declare [UTF-8]?
>>
>> As this feature seems to be really old already it should be available.
>> Is your "git email-patch" using "git send-email"?
>> Do you have "sendemail.assume8bitEncoding" set in your git config?
>> (It should either not be set or to UTF-8.
> 
> 
> Ah. That's likely the problem. The actual patch and associated commit message don't contain any characters that require more than 7 bits to encode, but the eventually sent e-mail does, since I added the information about the review revisions. Presumably git send-email is evaluating the encoding before the edit stage, but not after. sendemail.assume8bitEncoding is unset in my git config; I'll explicitly set it to UTF-8.
> 
> 
>>>>> +    props.type = BACKLIGHT_PLATFORM;
>>>> Is this WMI method a standard interface?
>>>> If so, BACKLIGHT_FIRMWARE might actually fit better and still fulfill the
>>>> requirements.
>>>> The actual maintainers would know better than me, though.
>>> I'm not certain what you mean by standard. It's defined as part of system
>>> design guidelines that NVIDIA shares with OEMs, but I'm not sure if it's
>>> part of the ACPI spec. It is implemented by multiple notebook system
>>> vendors, hence naming the driver after the ACPI method rather than a
>>> particular vendor. Reading the documentation on the backlight driver types,
>>> it does seem that this may fall more under the purview of BACKLIGHT_FIRMWARE
>>> than BACKLIGHT_PLATFORM. I'll go ahead and retest with the driver registered
>>> as BACKLIGHT_FIRMWARE, but I'm sure it'll still work after inspecting the
>>> code for at least gnome-settings-daemon, which implements the policy
>>> recommended by Documentation/ABI/stable/sysfs-class-backlight.
>> I only went by the comment about "standard firmware interface" from
>> backlight.h.
>> This was mostly a pointer for you (and the pdx86 maintainers) to take a look
>> and decide.
> 
> 
> Got it. From my interpretation of linux/backlight.h and Documentation/ABI/stable/sysfs-class-backlight, I *think* BACKLIGHT_FIRMWARE is probably more appropriate, so I'll change it to that, unless a maintainer disagrees. Hans/Andy?

I agree that BACKLIGHT_FIRMWARE is more appropriate, that is the same
as what drivers/acpi/acpi_video.c uses and this is in essence operating
at the same level.

Regards,

Hans

