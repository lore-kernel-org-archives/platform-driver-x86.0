Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FCFC678D5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Mar 2023 10:13:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbjCHKNx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Mar 2023 05:13:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjCHKNx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Mar 2023 05:13:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D293A2ED70
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Mar 2023 02:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678270385;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=29NMcHWdvXW0QJrv4pHbWH5locxap9utA7Xopr2Fag0=;
        b=NG2bHfnS9FpQk5oLVjfxV+IfLz+dSejZXjrzL2tve1y6srxtgp/LnhC1iTV70+OWynSKCy
        wvf68EERz1pgD920mZjtYhO7AFuagKDA9UJ5wZTR46shgIRPAiO4DVWMacmnbu1K7KeuZS
        EQRW6cZNjVR+c+tv1irq4dpPVFXNU90=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-RFp1ekeKOSOpp2SXw6X5hQ-1; Wed, 08 Mar 2023 05:13:03 -0500
X-MC-Unique: RFp1ekeKOSOpp2SXw6X5hQ-1
Received: by mail-ed1-f71.google.com with SMTP id w7-20020a056402268700b004bbcdf3751bso22959305edd.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Mar 2023 02:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678270382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29NMcHWdvXW0QJrv4pHbWH5locxap9utA7Xopr2Fag0=;
        b=LZDBsDFzjl41OnAC/F33eyR+b0YjX5UeHQTIyNFbcu/xz+UZ4bdSyqcIhRire31Lcy
         xzixoWCRuz3V04c7ZYV+sDsRsbYGY1Ks6hU/8y66AA0sWPnFO1Zs1wWbQIzh/jkUHUOw
         xoau3a3Rij+0M3nR8om4vTp3WnQpaXO8UVTc68IaMT3TzcTSHKiCl25txN+JWYvTtBUN
         /bJOrf9AsFoU0fIxJQlIjApA6Ye4Ko8Av/aKgnpcQMzQQ8DInHEGtx99WEOW++X8xu9P
         CXAHwUQItdXoTBgctgfwthmqQdkToM/WmsNbiQYDQ3bDObn/VjHo+c5CU1Ma8yoQdrE3
         b9Rw==
X-Gm-Message-State: AO0yUKX23eXL71vtwFL9EpG6vrTojP4ulynAXhsJeCzgQev3FZ5IKcGh
        rCBoyMRVUesWC8+EXbJR+B3bPX8T/T8HgbyzIlhdR/a/zgjkzgcAfREDiUrPsrKhp9BuX0jRSQf
        G8S3e6+qSE00qUJxBx7QGxLuPn3URFwOXLQ==
X-Received: by 2002:a17:906:90c6:b0:8b1:3a91:73ec with SMTP id v6-20020a17090690c600b008b13a9173ecmr20146852ejw.68.1678270382662;
        Wed, 08 Mar 2023 02:13:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8YsfZwqWkykjK99nW/DRBlgh5JrQd6iQmYCTyymfqaA/VbUORGm8cwq9AXC/rE8iBU5X/apw==
X-Received: by 2002:a17:906:90c6:b0:8b1:3a91:73ec with SMTP id v6-20020a17090690c600b008b13a9173ecmr20146834ejw.68.1678270382300;
        Wed, 08 Mar 2023 02:13:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gw5-20020a170906f14500b008c1f68ba0e2sm7199112ejb.85.2023.03.08.02.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 02:13:01 -0800 (PST)
Message-ID: <b462fb52-5d58-1532-068b-804675f51dbf@redhat.com>
Date:   Wed, 8 Mar 2023 11:13:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: ideapad_laptop tablet mode toggle detection
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc:     Armin Wolf <W_Armin@gmx.de>, Gergo Koteles <soyer@irl.hu>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <CAG4kvq9US=-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgCDjdAkbg@mail.gmail.com>
 <CAG4kvq9-qGFNRP29i4jDPL6RVLwGG86wdtTR1+VWZWu5krfv2A@mail.gmail.com>
 <044d2716-2490-6600-33e2-ecf50f65a6e9@gmail.com>
 <2267dadd-f1a9-e064-6f3f-e3aea459cf5a@gmx.de>
 <CAG4kvq84Lso0x62AuZgRttcQFdKXAHpWWKB4n0ZMTgb9CZ=NCw@mail.gmail.com>
 <e95a38c0-15e0-92e2-97c0-4d09219158f5@gmx.de>
 <CAG4kvq9QzoXcwTxTFzoQeQDnMEHfWCG4JmLgQ-sMn_WjX-mVJw@mail.gmail.com>
 <2181c5de-44d6-aebd-52ba-63d9fabd620c@gmx.de>
 <e00df016-5ff1-3e5a-cffc-ab79672a2d7f@gmx.de>
 <24b85f3f-d973-09ef-218b-ad47d093f749@redhat.com>
 <CAG4kvq-8-J_0ugJe0ut2A2WB83Yeq-9KCCXQCM+MDn4C5CzgCg@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAG4kvq-8-J_0ugJe0ut2A2WB83Yeq-9KCCXQCM+MDn4C5CzgCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andrew,

On 3/8/23 06:14, Andrew Kallmeyer wrote:
> On Mon, Mar 6, 2023 at 12:38 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> Armin and Maximilian, thank you for helping Andrew with this.
>>
>> On 3/6/23 02:41, Armin Wolf wrote:
>>> Am 06.03.23 um 02:26 schrieb Armin Wolf:
>>>
>>>> Am 05.03.23 um 23:59 schrieb Andrew Kallmeyer:
>>>>
>>>>> On Sun, Mar 5, 2023 at 1:40 PM Armin Wolf <W_Armin@gmx.de> wrote:
>>>>>> Hi,
>>>>>>
>>>>>> could it be that bit 5 is set to disable the touchpad when the
>>>>>> device switches
>>>>>> to tablet mode? I suspect that the query handler does the following:
>>>>>> 1. Notify VPC0 to disable the touchpad.
>>>>>> 2. Notify ACPI WMI, which does submit the necessary scancode for
>>>>>> switching to tablet mode.
>>>>> I think you're right about this notification being for the touchpad,
>>>>> although at least on my machine
>>>>> there is no other touchpad switch. So this is identical for my machine
>>>>> specifically. In this function
>>>>> from the decompiled ACPI dump you can see VCP0 and WM00 notified:
>>>>>
>>>>> Method (_Q44, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
>>>>> {
>>>>>     P80B = 0x44
>>>>>     Notify (VPC0, 0x80) // Status Change
>>>>>     WEID = 0xF4
>>>>>     Notify (WM00, 0x80) // Status Change
>>>>> }
>>>>>
>>>>> This WM00 device sounds like the WMI you're talking about, however I'm
>>>>> getting those errors
>>>>> about this device not existing in journalctl still. I was asking
>>>>> before about how to create this
>>>>> missing device but it's not clear to me if that is possible.
>>>>>
>>>>> kernel: ACPI BIOS Error (bug): Could not resolve symbol
>>>>> [\_SB.PC00.LPCB.EC0._Q44.WM00], AE_NOT_FOUND
>>>>>
>>>>> I searched in my .dsl files from the acpidump and wasn't able to find
>>>>> any of the 3 ideapad_wmi_ids
>>>>> listed in the driver. Maybe you have an idea of how to interface with
>>>>> this missing WM00 object though.
>>>>
>>>> I was combing through the ACPI DSDT table inside the acpidump you
>>>> provided,
>>>> and i found serveral PNP0C14 devices, which hold WMI methods, events
>>>> and data.
>>>>
>>>> The WMI GUIDs are encoded inside the associated _WDG buffers, you
>>>> should therefore
>>>> only grep for parts of the GUIDs.
>>>> For example: GUID 06129D99-6083-4164-81AD-F092F9D773A6 -> grep "0xF0,
>>>> 0x92"
>>>>
>>>> When feeding the content of the buffers named WQxx to the bmfdec
>>>> utility, i was able
>>>> to extract a description of each WMI object.
>>>>
>>>> On of which (WMIY) is handling the "Lenovo Yoga Mode", which seems to
>>>> handle the tablet
>>>> mode transitions. The MOF data is:
>>>>
>>>> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
>>>> Description("Lenovo Yoga Mode Change Event"),
>>>> guid("{06129D99-6083-4164-81AD-F092F9D773A6}")]
>>>> class LENOVO_GSENSOR_EVENT : WMIEvent {
>>>>   [key, read] string InstanceName;
>>>>   [read] boolean Active;
>>>>   [WmiDataId(1), read, Description("Lenovo Yoga Mode Change Event")]
>>>> uint32 ModeDataVal;
>>>> };
>>>>
>>>> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
>>>> Description("LENOVO_GSENSOR_DATA class"),
>>>> guid("{09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C}")]
>>>> class LENOVO_GSENSOR_DATA {
>>>>   [key, read] string InstanceName;
>>>>   [read] boolean Active;
>>>>
>>>>   [WmiMethodId(1), Implemented, Description("Mode Data")] void
>>>> GetUsageMode([out, Description("Mode Data")] uint32 Data);
>>>>   [WmiMethodId(2), Implemented, Description("Get Xaxis Value")] void
>>>> GetXaxisValue([out, Description("Get Xaxis Value")] uint32 Data);
>>>>   [WmiMethodId(3), Implemented, Description("Get Yaxis Value")] void
>>>> GetYaxisValue([out, Description("Get Yaxis Value")] uint32 Data);
>>>>   [WmiMethodId(4), Implemented, Description("Get Zaxis Value")] void
>>>> GetZaxisValue([out, Description("Get Zaxis Value")] uint32 Data);
>>>>   [WmiMethodId(5), Implemented, Description("Base to Ground")] void
>>>> GetAngle4Value([out, Description("Base to Ground")] uint32 Data);
>>>>   [WmiMethodId(6), Implemented, Description("Screen to Ground")] void
>>>> GetAngle5Value([out, Description("Screen to Ground")] uint32 Data);
>>>>   [WmiMethodId(7), Implemented, Description("Screen to Base")] void
>>>> GetAngle6Value([out, Description("Screen to Base")] uint32 Data);
>>>> };
>>>>
>>>> While looking at _WED (used to get ModeDataVal) and WMAB (handles
>>>> method calls on LENOVO_GSENSOR_DATA),
>>>> i assume that  only the first method (GetUsageMode) is implemented,
>>>> and that ModeDataVal is used to tell
>>>> which value of LENOVO_GSENSOR_DATA has changed (hardwired to 1 on your
>>>> device).
>>>>
>>>> Maybe you can write a wmi driver which handles both WMI objects, so
>>>> that you can find out what the values
>>>> returned by GetUsageMode mean. With a bit of luck, you can use this to
>>>> implement tablet mode toggle detection.
>>>>
>>>> BTW, what is the name of your notebook model?
>>>>
>>>> Armin Wolf
>>>>
>>> Well, it turns out i totally forgot that there exists already a patch which adds support for this:
>>> https://patchwork.kernel.org/project/platform-driver-x86/patch/20221004214332.35934-1-soyer@irl.hu/
>>>
>>> Maybe you can get this patch into shape and submit it again?
>>
>> Yes if you can do that, then that would be great.
>>
>> The end result should really be a patch-series then with the first patch
>> being the prep patch introducing a new ideapad-laptop.h I suggested
>> during my review. This patch can have you as the author + your
>> Signed-off-by.
>>
>> The 2nd patch would then introduce a new version of Gergo's driver using
>> the helper functions introduced in the first patch.
>>
>> For this patch you want to keep Gergo as the author (1), and then add
>> yourself as co-author by using the following tags at the end of
>> the commit message:
>>
>> Co-developed-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
>> Signed-off-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
>>
>> Note do NOT add a Signed-off-by for Gergo, he clearly intended to
>> submit his code under the GPL (see the GPL copyright header in
>> the new file) so the Signed-off-by missing is fine. And you must
>> not add Signed-off-by-s for other people. A S-o-b must always
>> be given by the person themselves.
>>
>> Regards,
>>
>> Hans
>>
>> 1) git commit --author="..."
> 
> Hi, Hans, thanks for the great advice! I'm excited to see it's already
> so close to being done. I have compiled Gergo's module separately from
> the kernel tree and loaded it on my laptop and it works perfectly.
> 
> I will follow the review comments on the patch, getting it integrated
> with the existing module etc. I will also make sure to sign the
> commits as you advise.

Great, thank you for picking op Gergo's work on this!

> It will be good to have it working for
> everyone. This will be my first kernel patch; I have found the docs
> page on submitting a patch but let me know if there's anything I'm
> missing when I do it.

Unfortunately the kernel process is not very newcomer friendly,
so chances are you will make make some mistakes / miss some steps
with your first submission.

Note that that (making some mistakes) is totally fine, the best
advice I can give you is don't be afraid to make mistakes :)

If something needs to be fixed before the patches can be merged
I or another reviewer will gently point that out and you can
prepare a new version addressing any remarks.

The only other advise I have is try to use "git send-email"
to send out the patches, some people copy and paste them
into a regular email client to send them and most email
clients then mangle the patch (change whitespace, wrap
lines, etc.).

Regards,

Hans



