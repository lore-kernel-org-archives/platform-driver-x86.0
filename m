Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3F4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 13:53:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDB7860F13
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 13:53:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233414AbhIUNzD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Sep 2021 09:55:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56881 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233182AbhIUNzB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Sep 2021 09:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632232412;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D7IE7KNFggbomMYXz5N5l2eBzZ0CQn1xAcN+P6pnJ/o=;
        b=ZpFOzHSi9lg9xXF6+ogSHtFt5euoJLc9DKcWYGfjX/UESx3703O+Hw2cwCQeJ+GhMoUSTR
        fHc8ouLKFZtFo9W682XPlCr7huynzDTZmRdS78tJLByBtztn/Sn4JHGFO36lFK5EotzRVq
        H1XJyvI1YU+Co46CXpewOa7ZlqtqYhA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-j51HGieON8-uvY3Y-qVZ7A-1; Tue, 21 Sep 2021 09:53:31 -0400
X-MC-Unique: j51HGieON8-uvY3Y-qVZ7A-1
Received: by mail-ed1-f70.google.com with SMTP id 2-20020a508e02000000b003d871759f5dso5243962edw.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Sep 2021 06:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D7IE7KNFggbomMYXz5N5l2eBzZ0CQn1xAcN+P6pnJ/o=;
        b=4i4l9t+EV9mntOP6GGs/GmtceCrz8RaLriQrQDsP+FdSJgKLqcLSW/QxeW/d6B/6cP
         N2AKBlypxsz9fK+5QVtjWrATe+KdnSZ81BqPds9s50gkkNQ4xyWs7hCHk9khABxPbBSd
         oEj08GMPNwsC8eQs3h28XZYBfzp0f4rjPl33tEEIxR7Wectq1S9JBNYimRfvs55nG9A5
         XKk5H4q7WnbwIcHgKq3p5Rbq1cpMgc+RLGhwbw3Oj91/tosS6cVoahaDKcqV8N7m4tv4
         ZhD3r5XyuKpJBwvQRusYD7LqjMtBxl3m2vTUYj1mUwaj6KMUPneN5RrtBJaVFYnvuwtn
         seZQ==
X-Gm-Message-State: AOAM531QGidx+y0dwiFJok8fp/JJ7rYWTDkED4rXTQ+QmQ3kf30LzzNm
        h7clLNGg4fWv37VUPOwmY29jDGmqNxrm75DTE0lYwPU/h/SxibdgmevEpZxBsbwKxcBg/HOEITK
        cf5GMZFAw6pwXl5+41YCxMeKgF8RIl62IZg==
X-Received: by 2002:a17:906:4dd5:: with SMTP id f21mr34631093ejw.106.1632232410386;
        Tue, 21 Sep 2021 06:53:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzucp5w7X94JHa2sa4q8yUqg4OOCqMrmNpOURvQtBNUsGzKVz6WX5srcXEs2KJTK31l4ni9ZA==
X-Received: by 2002:a17:906:4dd5:: with SMTP id f21mr34631074ejw.106.1632232410212;
        Tue, 21 Sep 2021 06:53:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w13sm7342545ejc.100.2021.09.21.06.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 06:53:29 -0700 (PDT)
Subject: Re: [PATCH v6] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     Daniel Dadap <ddadap@nvidia.com>,
        platform-driver-x86@vger.kernel.org, mario.limonciello@outlook.com,
        pobrn@protonmail.com, andy.shevchenko@gmail.com,
        aplattner@nvidia.com,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
References: <e63904b7-105b-4401-bd40-82854b7d42d1@t-8ch.de>
 <20210903003838.15797-1-ddadap@nvidia.com>
 <11ffe8bc-b4ee-c451-9860-46997de8fe55@redhat.com>
 <20210920132911.cus27elz36dme63g@pali>
 <8b07125d-83b9-9de4-fd52-1cb01466364a@redhat.com>
 <20210920135106.y6mi57bcmurczmka@pali>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <57a958e2-93d7-3eea-ec7b-9496acd6aae5@redhat.com>
Date:   Tue, 21 Sep 2021 15:53:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210920135106.y6mi57bcmurczmka@pali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/20/21 3:51 PM, Pali Rohár wrote:
> On Monday 20 September 2021 15:33:20 Hans de Goede wrote:
>> Hi Pali,
>>
>> On 9/20/21 3:29 PM, Pali Rohár wrote:
>>> On Monday 13 September 2021 11:01:50 Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 9/3/21 2:38 AM, Daniel Dadap wrote:
>>>>> A number of upcoming notebook computer designs drive the internal
>>>>> display panel's backlight PWM through the Embedded Controller (EC).
>>>>> This EC-based backlight control can be plumbed through to an ACPI
>>>>> "WMAA" method interface, which in turn can be wrapped by WMI with
>>>>> the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.
>>>>>
>>>>> Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
>>>>> backlight class driver to control backlight levels on systems with
>>>>> EC-driven backlights.
>>>>>
>>>>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>>>>> Reviewed-By: Thomas Weißschuh <linux@weissschuh.net>
>>>>
>>>> Thank you for your patch, I've applied this patch to my review-hans 
>>>> branch:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>>>
>>>> Note it will show up in my review-hans branch once I've pushed my
>>>> local branch there, which might take a while.
>>>>
>>>> Once I've run some tests on this branch the patches there will be
>>>> added to the platform-drivers-x86/for-next branch and eventually
>>>> will be included in the pdx86 pull-request to Linus for the next
>>>> merge-window.
>>>
>>> Hello Hans!
>>>
>>> I would suggest to rename this driver and config option to not include
>>> -AA in its name. WMAA is just internal name of ACPI method, composed
>>> from two parts: "WM" and "AA". Second part "AA" is read from the _WDG
>>> where is the translation table from WMI GUID (in this case 603E9613...)
>>> to ACPI method name. "AA" is just autogenerated identifier by wmi
>>> compiler and because names are ASCII strings, I guess "AA" could mean
>>> the first (autogenerated) method. In the whole driver code you are not
>>> using AA function name, but directly WMI GUID, which also means that
>>> driver is prepared if vendor "recompiles" wmi code in acpi (and compiler
>>> generates another identifier, not AA). Also another argument is that
>>> there can be lot of other laptops which have WMAA ACPI method but they
>>> can have different API or do something totally different. So name WMAA
>>> is in this wmi context very misleading. Rather it should be named by
>>> vendor.
>>
>> Right, that is a very valid point. I should have spotted this myself.
>>
>> So what would be a better name wmi-nvidia-backlight.ko I guess ?
>> (and update the rest to match ?)
> 
> It looks like that no vendor driver starts with "wmi-" prefix. "-wmi"
> string is used as a suffix. So for consistency it would be better to
> choose "nvidia-backlight-wmi.ko".

Right, I should have checked first.

So I just checked and the standard pattern used is:
vendor_wmi_feature

So lets go with nvidia_wmi_backlight.ko

Daniel, can you prepare a patch on top of your merged patch to do
the rename of the Kconfig entry and the module-name please?

Regards,

Hans

