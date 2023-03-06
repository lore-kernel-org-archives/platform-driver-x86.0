Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F03CC678D4
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Mar 2023 08:39:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjCFIjO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Mar 2023 03:39:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjCFIjN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Mar 2023 03:39:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400F31E9D2
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Mar 2023 00:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678091902;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D/ErqL72f14YDitUHvxwFai/ICLMREVgn4zb+gXcnVs=;
        b=BpYANTLCnAtErG3erpQe9+sfo1bIkIKTDtz3mGHz+hyZkwEXc7YRbhyObnM/HIxQX9mXW2
        lDXIUIszUFHCS6Xe1759cRZSOxx68Hj7Sx/GMeaD6Sv6qkLIKrXEY3V5oElgaXqPez60o8
        L/58Lu0ZwB02FdrvqWD8jaHJGRuWKBU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-dgS4HU5wOUq3J9Ms6khe8g-1; Mon, 06 Mar 2023 03:38:21 -0500
X-MC-Unique: dgS4HU5wOUq3J9Ms6khe8g-1
Received: by mail-ed1-f71.google.com with SMTP id c1-20020a0564021f8100b004acbe232c03so12497150edc.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Mar 2023 00:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678091900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/ErqL72f14YDitUHvxwFai/ICLMREVgn4zb+gXcnVs=;
        b=LxnhSdTzOiRhWVBMgMn6YuiQpQhTzRQHSNK0Sdhdpdc4GXxcfQO/tSw5cbYxHUR5Mo
         ETvAMCPaWI4nc2LNcqMZQ2ZGVCgl13vgmBv2rFrZZuEf2Sa5PLR99hJ1nGAx239IskAl
         fqc1X01U20ZCC8TBsb09ELTpe3ZhonRAMQ1NT7GURTAoc85Mxqb00tp8JtsiUPF3byqt
         HN3YXq9AAd0XsihoDWIyv1pyF4dKCAUKmxuYyjnvsQ9/K2tE8juIlWkO2XlZJPhoeG92
         NdL3OUmedmTV6F1NaMgL/AbE9dSVWTbk4+TSgyXUUL7kuGM1DhI/lLHQN3+ZIR8YadbR
         Oqew==
X-Gm-Message-State: AO0yUKWd+hd7MLFMJxfH3WRP+3vVl10Cl1kxbkNV8PAS2+5CDK/BybXy
        DUGnal/kcm0ThbQ1rbRxIRBhgePPownLkFBj5XhVg07AJeMt+Mc9vEft8QHNAinExXea4c/hLML
        FYo54wu8DSNsbqCGpG5tS1G6FbjGLqFz2A9OUXteSNg==
X-Received: by 2002:a05:6402:792:b0:49e:4786:a0e2 with SMTP id d18-20020a056402079200b0049e4786a0e2mr8760282edy.14.1678091900089;
        Mon, 06 Mar 2023 00:38:20 -0800 (PST)
X-Google-Smtp-Source: AK7set8dCJ1LNEx5THXQM3WhtJ78tHflt+w4XvcDjFOsJnU7s48iSpVrC3zmdiUAlER/A92XwVkuWg==
X-Received: by 2002:a05:6402:792:b0:49e:4786:a0e2 with SMTP id d18-20020a056402079200b0049e4786a0e2mr8760267edy.14.1678091899733;
        Mon, 06 Mar 2023 00:38:19 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id j19-20020a508a93000000b004c3e3a6136dsm4731997edj.21.2023.03.06.00.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 00:38:19 -0800 (PST)
Message-ID: <24b85f3f-d973-09ef-218b-ad47d093f749@redhat.com>
Date:   Mon, 6 Mar 2023 09:38:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: ideapad_laptop tablet mode toggle detection
To:     Armin Wolf <W_Armin@gmx.de>,
        Andrew Kallmeyer <kallmeyeras@gmail.com>,
        Gergo Koteles <soyer@irl.hu>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
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
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e00df016-5ff1-3e5a-cffc-ab79672a2d7f@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Armin and Maximilian, thank you for helping Andrew with this.

On 3/6/23 02:41, Armin Wolf wrote:
> Am 06.03.23 um 02:26 schrieb Armin Wolf:
> 
>> Am 05.03.23 um 23:59 schrieb Andrew Kallmeyer:
>>
>>> On Sun, Mar 5, 2023 at 1:40 PM Armin Wolf <W_Armin@gmx.de> wrote:
>>>> Hi,
>>>>
>>>> could it be that bit 5 is set to disable the touchpad when the
>>>> device switches
>>>> to tablet mode? I suspect that the query handler does the following:
>>>> 1. Notify VPC0 to disable the touchpad.
>>>> 2. Notify ACPI WMI, which does submit the necessary scancode for
>>>> switching to tablet mode.
>>> I think you're right about this notification being for the touchpad,
>>> although at least on my machine
>>> there is no other touchpad switch. So this is identical for my machine
>>> specifically. In this function
>>> from the decompiled ACPI dump you can see VCP0 and WM00 notified:
>>>
>>> Method (_Q44, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
>>> {
>>>     P80B = 0x44
>>>     Notify (VPC0, 0x80) // Status Change
>>>     WEID = 0xF4
>>>     Notify (WM00, 0x80) // Status Change
>>> }
>>>
>>> This WM00 device sounds like the WMI you're talking about, however I'm
>>> getting those errors
>>> about this device not existing in journalctl still. I was asking
>>> before about how to create this
>>> missing device but it's not clear to me if that is possible.
>>>
>>> kernel: ACPI BIOS Error (bug): Could not resolve symbol
>>> [\_SB.PC00.LPCB.EC0._Q44.WM00], AE_NOT_FOUND
>>>
>>> I searched in my .dsl files from the acpidump and wasn't able to find
>>> any of the 3 ideapad_wmi_ids
>>> listed in the driver. Maybe you have an idea of how to interface with
>>> this missing WM00 object though.
>>
>> I was combing through the ACPI DSDT table inside the acpidump you
>> provided,
>> and i found serveral PNP0C14 devices, which hold WMI methods, events
>> and data.
>>
>> The WMI GUIDs are encoded inside the associated _WDG buffers, you
>> should therefore
>> only grep for parts of the GUIDs.
>> For example: GUID 06129D99-6083-4164-81AD-F092F9D773A6 -> grep "0xF0,
>> 0x92"
>>
>> When feeding the content of the buffers named WQxx to the bmfdec
>> utility, i was able
>> to extract a description of each WMI object.
>>
>> On of which (WMIY) is handling the "Lenovo Yoga Mode", which seems to
>> handle the tablet
>> mode transitions. The MOF data is:
>>
>> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
>> Description("Lenovo Yoga Mode Change Event"),
>> guid("{06129D99-6083-4164-81AD-F092F9D773A6}")]
>> class LENOVO_GSENSOR_EVENT : WMIEvent {
>>   [key, read] string InstanceName;
>>   [read] boolean Active;
>>   [WmiDataId(1), read, Description("Lenovo Yoga Mode Change Event")]
>> uint32 ModeDataVal;
>> };
>>
>> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
>> Description("LENOVO_GSENSOR_DATA class"),
>> guid("{09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C}")]
>> class LENOVO_GSENSOR_DATA {
>>   [key, read] string InstanceName;
>>   [read] boolean Active;
>>
>>   [WmiMethodId(1), Implemented, Description("Mode Data")] void
>> GetUsageMode([out, Description("Mode Data")] uint32 Data);
>>   [WmiMethodId(2), Implemented, Description("Get Xaxis Value")] void
>> GetXaxisValue([out, Description("Get Xaxis Value")] uint32 Data);
>>   [WmiMethodId(3), Implemented, Description("Get Yaxis Value")] void
>> GetYaxisValue([out, Description("Get Yaxis Value")] uint32 Data);
>>   [WmiMethodId(4), Implemented, Description("Get Zaxis Value")] void
>> GetZaxisValue([out, Description("Get Zaxis Value")] uint32 Data);
>>   [WmiMethodId(5), Implemented, Description("Base to Ground")] void
>> GetAngle4Value([out, Description("Base to Ground")] uint32 Data);
>>   [WmiMethodId(6), Implemented, Description("Screen to Ground")] void
>> GetAngle5Value([out, Description("Screen to Ground")] uint32 Data);
>>   [WmiMethodId(7), Implemented, Description("Screen to Base")] void
>> GetAngle6Value([out, Description("Screen to Base")] uint32 Data);
>> };
>>
>> While looking at _WED (used to get ModeDataVal) and WMAB (handles
>> method calls on LENOVO_GSENSOR_DATA),
>> i assume that  only the first method (GetUsageMode) is implemented,
>> and that ModeDataVal is used to tell
>> which value of LENOVO_GSENSOR_DATA has changed (hardwired to 1 on your
>> device).
>>
>> Maybe you can write a wmi driver which handles both WMI objects, so
>> that you can find out what the values
>> returned by GetUsageMode mean. With a bit of luck, you can use this to
>> implement tablet mode toggle detection.
>>
>> BTW, what is the name of your notebook model?
>>
>> Armin Wolf
>>
> Well, it turns out i totally forgot that there exists already a patch which adds support for this:
> https://patchwork.kernel.org/project/platform-driver-x86/patch/20221004214332.35934-1-soyer@irl.hu/
> 
> Maybe you can get this patch into shape and submit it again?

Yes if you can do that, then that would be great.

The end result should really be a patch-series then with the first patch
being the prep patch introducing a new ideapad-laptop.h I suggested
during my review. This patch can have you as the author + your
Signed-off-by.

The 2nd patch would then introduce a new version of Gergo's driver using
the helper functions introduced in the first patch.

For this patch you want to keep Gergo as the author (1), and then add
yourself as co-author by using the following tags at the end of
the commit message:

Co-developed-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
Signed-off-by: Andrew Kallmeyer <kallmeyeras@gmail.com>

Note do NOT add a Signed-off-by for Gergo, he clearly intended to
submit his code under the GPL (see the GPL copyright header in
the new file) so the Signed-off-by missing is fine. And you must
not add Signed-off-by-s for other people. A S-o-b must always
be given by the person themselves.

Regards,

Hans

1) git commit --author="..."






> 
> Armin Wolf
> 
>>>> Could you provide the output of "acpidump"? Because i suspect that
>>>> the virtual key handling
>>>> is done using ACPI WMI, as many modern devices are using this
>>>> approach. In this case, you
>>>> could experiment with ideapad_wmi_notify(), and maybe take a look at
>>>> ideapad_wmi_ids[].
>>>>
>>>> Armin Wolf
>>> Here is the raw acpidump output:
>>> https://la.ask.systems/temp/acpidump.out
>>>
>>> - Andrew
> 

