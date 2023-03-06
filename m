Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37AEC6FA9E
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Mar 2023 01:26:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjCFB0g (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Mar 2023 20:26:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjCFB0f (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Mar 2023 20:26:35 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D416F97A
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Mar 2023 17:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1678065991; i=w_armin@gmx.de;
        bh=DBnCY2yUl5KJg9vIjeL2K/W/T4xRiV1vJKeMbcvvqhA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=fvIAYcD77GOItmAto7MZei8bppgqCs5pC7z/yJoVyf0BDyGu0OfU+/hIDK+2Ighvq
         PpOeqcOnsVIqTeec7GpFenwD/meNaj2nfsZcr1uwSl2IMYFuzdOwaTjXLhylMfjaQE
         c1rXS19dGqAwbGwlclpMDw6dRLnlilseMKS60iMp3J+gbb8nji/trjqtE5TVm/ZfGR
         zFwiPg1IKVI/2TVQFj02nPqiMK4hlEtfhXsiRmYHgPPVssUz82DZQFujw+/Uof8fI/
         wg7iQkd/Bgo6unoDXqg4WuDFZ3untFm0jB/ZKvwotLWcPxh2BaWxJE/MNgSy2yrKpA
         qOvK1ysjoEFag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWics-1q5yxD07YW-00X54f; Mon, 06
 Mar 2023 02:26:31 +0100
Subject: Re: ideapad_laptop tablet mode toggle detection
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
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <2181c5de-44d6-aebd-52ba-63d9fabd620c@gmx.de>
Date:   Mon, 6 Mar 2023 02:26:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAG4kvq9QzoXcwTxTFzoQeQDnMEHfWCG4JmLgQ-sMn_WjX-mVJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:BNXk7SNcdkJEaMQaF7W9X1XyyUTD4fWUkUsCR4T39svJevqUe5w
 IXyFMNQJqJvTlj3LCDwiUbNcvp1rJUhhOcWwT6vHv7vi4uPf4O+BUQ9wd67qAc6VhnqMLNc
 pdDrjSENc8CGVD3xKxwe9iL1TX64Q8J4yOlQiLtCthU/+rL0uNnkDCOkMSkno+aba9zgQbG
 V7T8l69D3yduKRlmbqUgg==
UI-OutboundReport: notjunk:1;M01:P0:fTKj6Rcf+6U=;xRoZkI3yA2692tXR5HHbz+5CUPZ
 b+cEu4uC80jDAFrDh7gAov3sACF2fKtiO6s2bRG3F5FWrjOLPyGbnAOQP/b270gD3WB43a/H3
 itCQgGJcZ1s1aT5zG/qhFQru7Dk+PpAOOSXIufjNbh3Gjp72hkCsRZmzHXWyJVk7IXS1zgYR8
 a9zbwFVNZR5ogbP+UlORPYhvwG46grRaKXU2x/1qxEX7M1T2sywVap07jWXmWJ5Oz3itMhiTM
 9K58k8BQo0kmebJU2WgNxlR8D6nZUjBgFhHq50uYrP71o2gaa+POvCIRzSQmNkJVaoKNJgiDK
 CkiXszXn0EsSP5o91i1/riqhZQfBC0aTdSL1++kf1fJqK89fWS2s6l+pG+iBjs+Bwb0goGXgt
 E94eY9l+5eTGbay6VCxPXZwel0b5xIoxuWDwhK3NNac4d1Dlxy3nUXs6s+lqi/8q1QYny3Jbe
 RXbPhB57P555whUDOXGWQi+tCnslpodEsvSzfM5I2vL8TX71q7hxS9tSJmJL5/k6r5ttxLsxd
 cgLIulq4rAtyRKVgCjKbTMtMcrKM/OV5mQzEEEtrZcELIKJSmaraj3SvV/s7FtzMkcY6V6pF6
 nTsoyYPYwT3heZFNoFot0G8lSQm1MvCG9Z7QAnEwETZJ+V6bc3jqyDEL0n6E447kAD/dXuo9D
 cfVOuR5bXJR8kyJH9cXg7WgDUKOR24xJDHm17jV3RBWAmRZZgZZIaIoj9En0xmWFx8WRpM93s
 cGKwRh+ie7b2EiBASvXzuyFWavLnRhirkU2nPQ1mJZ1/FA1OoJN2uoRGOceRz/8znlfDgGjXq
 TG/4MSwL5tmxqzU0PcPqmp5QGOrFGv4qaM1FtdYSe/+j4a9rPl4IqZB4+8HrXUVnJLOkczDf4
 brFjmWxj7cXyjxerjxaqrTckYcxQzzYtzi7oVNr+jU/Yx89PQXmqbzzwoFqc3LUxunDTzCEZQ
 gCBvAjcceWwYtwi6mctD1qMwiXU=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am 05.03.23 um 23:59 schrieb Andrew Kallmeyer:

> On Sun, Mar 5, 2023 at 1:40=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote=
:
>> Hi,
>>
>> could it be that bit 5 is set to disable the touchpad when the device s=
witches
>> to tablet mode? I suspect that the query handler does the following:
>> 1. Notify VPC0 to disable the touchpad.
>> 2. Notify ACPI WMI, which does submit the necessary scancode for switch=
ing to tablet mode.
> I think you're right about this notification being for the touchpad,
> although at least on my machine
> there is no other touchpad switch. So this is identical for my machine
> specifically. In this function
> from the decompiled ACPI dump you can see VCP0 and WM00 notified:
>
> Method (_Q44, 0, NotSerialized)  // _Qxx: EC Query, xx=3D0x00-0xFF
> {
>     P80B =3D 0x44
>     Notify (VPC0, 0x80) // Status Change
>     WEID =3D 0xF4
>     Notify (WM00, 0x80) // Status Change
> }
>
> This WM00 device sounds like the WMI you're talking about, however I'm
> getting those errors
> about this device not existing in journalctl still. I was asking
> before about how to create this
> missing device but it's not clear to me if that is possible.
>
> kernel: ACPI BIOS Error (bug): Could not resolve symbol
> [\_SB.PC00.LPCB.EC0._Q44.WM00], AE_NOT_FOUND
>
> I searched in my .dsl files from the acpidump and wasn't able to find
> any of the 3 ideapad_wmi_ids
> listed in the driver. Maybe you have an idea of how to interface with
> this missing WM00 object though.

I was combing through the ACPI DSDT table inside the acpidump you provided=
,
and i found serveral PNP0C14 devices, which hold WMI methods, events and d=
ata.

The WMI GUIDs are encoded inside the associated _WDG buffers, you should t=
herefore
only grep for parts of the GUIDs.
For example: GUID 06129D99-6083-4164-81AD-F092F9D773A6 -> grep "0xF0, 0x92=
"

When feeding the content of the buffers named WQxx to the bmfdec utility, =
i was able
to extract a description of each WMI object.

On of which (WMIY) is handling the "Lenovo Yoga Mode", which seems to hand=
le the tablet
mode transitions. The MOF data is:

[WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Leno=
vo Yoga Mode Change Event"), guid("{06129D99-6083-4164-81AD-F092F9D773A6}"=
)]
class LENOVO_GSENSOR_EVENT : WMIEvent {
   [key, read] string InstanceName;
   [read] boolean Active;
   [WmiDataId(1), read, Description("Lenovo Yoga Mode Change Event")] uint=
32 ModeDataVal;
};

[WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENO=
VO_GSENSOR_DATA class"), guid("{09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C}")]
class LENOVO_GSENSOR_DATA {
   [key, read] string InstanceName;
   [read] boolean Active;

   [WmiMethodId(1), Implemented, Description("Mode Data")] void GetUsageMo=
de([out, Description("Mode Data")] uint32 Data);
   [WmiMethodId(2), Implemented, Description("Get Xaxis Value")] void GetX=
axisValue([out, Description("Get Xaxis Value")] uint32 Data);
   [WmiMethodId(3), Implemented, Description("Get Yaxis Value")] void GetY=
axisValue([out, Description("Get Yaxis Value")] uint32 Data);
   [WmiMethodId(4), Implemented, Description("Get Zaxis Value")] void GetZ=
axisValue([out, Description("Get Zaxis Value")] uint32 Data);
   [WmiMethodId(5), Implemented, Description("Base to Ground")] void GetAn=
gle4Value([out, Description("Base to Ground")] uint32 Data);
   [WmiMethodId(6), Implemented, Description("Screen to Ground")] void Get=
Angle5Value([out, Description("Screen to Ground")] uint32 Data);
   [WmiMethodId(7), Implemented, Description("Screen to Base")] void GetAn=
gle6Value([out, Description("Screen to Base")] uint32 Data);
};

While looking at _WED (used to get ModeDataVal) and WMAB (handles method c=
alls on LENOVO_GSENSOR_DATA),
i assume that  only the first method (GetUsageMode) is implemented, and th=
at ModeDataVal is used to tell
which value of LENOVO_GSENSOR_DATA has changed (hardwired to 1 on your dev=
ice).

Maybe you can write a wmi driver which handles both WMI objects, so that y=
ou can find out what the values
returned by GetUsageMode mean. With a bit of luck, you can use this to imp=
lement tablet mode toggle detection.

BTW, what is the name of your notebook model?

Armin Wolf

>> Could you provide the output of "acpidump"? Because i suspect that the =
virtual key handling
>> is done using ACPI WMI, as many modern devices are using this approach.=
 In this case, you
>> could experiment with ideapad_wmi_notify(), and maybe take a look at id=
eapad_wmi_ids[].
>>
>> Armin Wolf
> Here is the raw acpidump output: https://la.ask.systems/temp/acpidump.ou=
t
>
> - Andrew
