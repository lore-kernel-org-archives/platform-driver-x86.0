Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4BEC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Mar 2023 01:41:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjCFBlq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Mar 2023 20:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCFBlq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Mar 2023 20:41:46 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A194D113E0
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Mar 2023 17:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1678066901; i=w_armin@gmx.de;
        bh=A69KpS7qVqiRmUbZj+q85M8g1Gu/rBHOdNvAP9SebYo=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=BnOvaBVvhhM1aXD5qYzvY3ItNy5l9H6rR2yigx/iU92y1aStVPUgSAz9OfWjOkDTa
         cmgMwkea2j1M2iuGFkpS3k6Aga5k+w7N0IVghMRlCptRP+9i05BaHxifqMSbVYVZtI
         hTaqpgtELm97R0op8OcMbw6aZzqF5P6Geg28o23srjcF9SehW5zvVPhQ3kVdewM5oD
         D4CNz1kJvDesivwUNx1ws0Ol422dYimFl2pM0iwYKfLYmSSDJluAJp6aJk/vOyrDGd
         6wcUrdFFhDi8b51ghaygEMqOZRydQ46reST6rRSkGPP7mQj1Bb8C47LXr88VisHyOC
         7yE0Nba+Nsdew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtwUw-1qQxvF0PpE-00uMQT; Mon, 06
 Mar 2023 02:41:41 +0100
Subject: Re: ideapad_laptop tablet mode toggle detection
From:   Armin Wolf <W_Armin@gmx.de>
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>
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
Message-ID: <e00df016-5ff1-3e5a-cffc-ab79672a2d7f@gmx.de>
Date:   Mon, 6 Mar 2023 02:41:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2181c5de-44d6-aebd-52ba-63d9fabd620c@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:XxfDNqZNesO6r89oqT3Qtw/0ZTwOS1muJLF639uzgC49oDkG/ti
 ny1LFowAFrmmGzCdkjmkxWNpOsWVAvAc1PMx47STx5F7zQIQGHTl02mRv7a2ykt8oRnIhHg
 +44dWteEV9M5BEbq3p6z14QnpHWO19/P0Ldp4UyBxkDYU90GTCTrs9JYJgD2yAb2MVZXwqc
 lJ9Zncq8JoYCwokDb+TQw==
UI-OutboundReport: notjunk:1;M01:P0:zOj+bKbGLMY=;xkFM6XC4lYB2YrBGsFIMiAsXYA1
 RulEX8bQaNJtbdM6k7bUcNmukZ3OiU7quvP+Pw/WQ1O08GDMxKuDIDQY5GT11CvRHfVNaFQYR
 qEwayaR6/os0zNZNkPuebu+IFnY+pVva9S3+gpNh7W3Qljx9GgQH5XDaAE6miDiZ8NCkLdUhp
 S8i3ojdeyrApB/sF2lInIVsE72IoEEh/vHdHICWU3JlyYjoesnwB+cd4+RrKWH+mZGmryKuy/
 B3J0rdSywKrsK/MobZb7G8NYo59fBHKlOTAomeOCSM74Xmxr1XQvnKRXO4z0S0PBFryb1nGaA
 kjllHH/c4dbb4g9wlfhdqI3OZLnMhiv9sWQ1FAbEW4iGn9t2FYsVEKGyA4NQcKfmXL3MTgRIM
 jIAfglM/S3qY80NQN/o7csdi8htqmEuzKmFuuM6Z37AVv4jWjnwD0Tbdlk/iad9H+jIS6JsBX
 mjYPCGv2zJ5nYekJIvq+GNWeG4cGlKFOwNSBt1TDqzNIfktdcVXVx5lzzZr1H/jjgq1Oh0omT
 190uPS2hZ8RnPzKYpdc4ZYATDY3rbQaq8CGxUETmBKNZh/cgGPhOtQ1u/09XB7PPBoGSkL2/h
 zJXUlqonEDxenMXHm8npmH+pinc0ufWVDie8oFtWZiojbI8IYzPwggtLebZeoOW0L3mjzbMGO
 8yiQUFfjuqcuakRR9nbn7DE5CQSdQCU0/jDCLYONd9PU5wCBMpyt6m7jY/So9g8VeIW0gtXQt
 ZB9DQkjOtDZ4ClWuVFtHTtWIk/knCFyV1X7v0G/n98UJmAL7+xKWAOg4LmO9dkQDzQ4Qj72I9
 /D8yep1DF/IpNsmqASHubka4J0vgsYKRLR2UXLQc9/thBrUPXuLhgb6f4+1wfP7lAv2IQspVZ
 YMAq8pZY5OpJ6OMtvtv9zbNIOG9yJipIfd8vUza9j2KKeNX7paTssy4bVI5saUiakbE5xLkEk
 yOOo+JYPAClsX6F88PXc8YhC5nI=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am 06.03.23 um 02:26 schrieb Armin Wolf:

> Am 05.03.23 um 23:59 schrieb Andrew Kallmeyer:
>
>> On Sun, Mar 5, 2023 at 1:40=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>>> Hi,
>>>
>>> could it be that bit 5 is set to disable the touchpad when the
>>> device switches
>>> to tablet mode? I suspect that the query handler does the following:
>>> 1. Notify VPC0 to disable the touchpad.
>>> 2. Notify ACPI WMI, which does submit the necessary scancode for
>>> switching to tablet mode.
>> I think you're right about this notification being for the touchpad,
>> although at least on my machine
>> there is no other touchpad switch. So this is identical for my machine
>> specifically. In this function
>> from the decompiled ACPI dump you can see VCP0 and WM00 notified:
>>
>> Method (_Q44, 0, NotSerialized)=C2=A0 // _Qxx: EC Query, xx=3D0x00-0xFF
>> {
>> =C2=A0=C2=A0=C2=A0 P80B =3D 0x44
>> =C2=A0=C2=A0=C2=A0 Notify (VPC0, 0x80) // Status Change
>> =C2=A0=C2=A0=C2=A0 WEID =3D 0xF4
>> =C2=A0=C2=A0=C2=A0 Notify (WM00, 0x80) // Status Change
>> }
>>
>> This WM00 device sounds like the WMI you're talking about, however I'm
>> getting those errors
>> about this device not existing in journalctl still. I was asking
>> before about how to create this
>> missing device but it's not clear to me if that is possible.
>>
>> kernel: ACPI BIOS Error (bug): Could not resolve symbol
>> [\_SB.PC00.LPCB.EC0._Q44.WM00], AE_NOT_FOUND
>>
>> I searched in my .dsl files from the acpidump and wasn't able to find
>> any of the 3 ideapad_wmi_ids
>> listed in the driver. Maybe you have an idea of how to interface with
>> this missing WM00 object though.
>
> I was combing through the ACPI DSDT table inside the acpidump you
> provided,
> and i found serveral PNP0C14 devices, which hold WMI methods, events
> and data.
>
> The WMI GUIDs are encoded inside the associated _WDG buffers, you
> should therefore
> only grep for parts of the GUIDs.
> For example: GUID 06129D99-6083-4164-81AD-F092F9D773A6 -> grep "0xF0,
> 0x92"
>
> When feeding the content of the buffers named WQxx to the bmfdec
> utility, i was able
> to extract a description of each WMI object.
>
> On of which (WMIY) is handling the "Lenovo Yoga Mode", which seems to
> handle the tablet
> mode transitions. The MOF data is:
>
> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
> Description("Lenovo Yoga Mode Change Event"),
> guid("{06129D99-6083-4164-81AD-F092F9D773A6}")]
> class LENOVO_GSENSOR_EVENT : WMIEvent {
> =C2=A0 [key, read] string InstanceName;
> =C2=A0 [read] boolean Active;
> =C2=A0 [WmiDataId(1), read, Description("Lenovo Yoga Mode Change Event")=
]
> uint32 ModeDataVal;
> };
>
> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
> Description("LENOVO_GSENSOR_DATA class"),
> guid("{09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C}")]
> class LENOVO_GSENSOR_DATA {
> =C2=A0 [key, read] string InstanceName;
> =C2=A0 [read] boolean Active;
>
> =C2=A0 [WmiMethodId(1), Implemented, Description("Mode Data")] void
> GetUsageMode([out, Description("Mode Data")] uint32 Data);
> =C2=A0 [WmiMethodId(2), Implemented, Description("Get Xaxis Value")] voi=
d
> GetXaxisValue([out, Description("Get Xaxis Value")] uint32 Data);
> =C2=A0 [WmiMethodId(3), Implemented, Description("Get Yaxis Value")] voi=
d
> GetYaxisValue([out, Description("Get Yaxis Value")] uint32 Data);
> =C2=A0 [WmiMethodId(4), Implemented, Description("Get Zaxis Value")] voi=
d
> GetZaxisValue([out, Description("Get Zaxis Value")] uint32 Data);
> =C2=A0 [WmiMethodId(5), Implemented, Description("Base to Ground")] void
> GetAngle4Value([out, Description("Base to Ground")] uint32 Data);
> =C2=A0 [WmiMethodId(6), Implemented, Description("Screen to Ground")] vo=
id
> GetAngle5Value([out, Description("Screen to Ground")] uint32 Data);
> =C2=A0 [WmiMethodId(7), Implemented, Description("Screen to Base")] void
> GetAngle6Value([out, Description("Screen to Base")] uint32 Data);
> };
>
> While looking at _WED (used to get ModeDataVal) and WMAB (handles
> method calls on LENOVO_GSENSOR_DATA),
> i assume that=C2=A0 only the first method (GetUsageMode) is implemented,
> and that ModeDataVal is used to tell
> which value of LENOVO_GSENSOR_DATA has changed (hardwired to 1 on your
> device).
>
> Maybe you can write a wmi driver which handles both WMI objects, so
> that you can find out what the values
> returned by GetUsageMode mean. With a bit of luck, you can use this to
> implement tablet mode toggle detection.
>
> BTW, what is the name of your notebook model?
>
> Armin Wolf
>
Well, it turns out i totally forgot that there exists already a patch whic=
h adds support for this:
https://patchwork.kernel.org/project/platform-driver-x86/patch/20221004214=
332.35934-1-soyer@irl.hu/

Maybe you can get this patch into shape and submit it again?

Armin Wolf

>>> Could you provide the output of "acpidump"? Because i suspect that
>>> the virtual key handling
>>> is done using ACPI WMI, as many modern devices are using this
>>> approach. In this case, you
>>> could experiment with ideapad_wmi_notify(), and maybe take a look at
>>> ideapad_wmi_ids[].
>>>
>>> Armin Wolf
>> Here is the raw acpidump output:
>> https://la.ask.systems/temp/acpidump.out
>>
>> - Andrew
