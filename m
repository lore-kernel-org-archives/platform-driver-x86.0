Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43687C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Mar 2023 21:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjCEVkV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Mar 2023 16:40:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCEVkT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Mar 2023 16:40:19 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A4AFF33
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Mar 2023 13:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1678052414; i=w_armin@gmx.de;
        bh=mjeaDfOOz44oM6G7IGC6pRt27rFN9HlvQIlNnEVR4f4=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=my/0+azS9sugDFNeghy+4GiDoluyKFoh7EBlhpZOAGv/DGMv/NDiIqLo0XUYKfKWH
         o/+h5P5M1u96QcisYSKN3UDIbE+1b6jGMdW5wd+ZExPiSrSmi4ufgTkEfdbutRWA63
         SvpuNravlSq8/QKZ5j09etGQywH3VQLd9P4b4X3khpywIuC5ufERA4/SFODPoMCuZc
         mvW3MdQmAZ/o0DXGUMjRid4qRQjhLGL2+Q6kguKe/s8K6OvVuB6H0QfWBecxx/+WiZ
         4bQQGZ4xDzqtPEVgQP59MNB24KGAxKHuaBA7sXOel4+5W0K5RMGfVbAt/SYPEfuYCs
         CsdG9vaaBn6BA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6KYl-1qf6il0yOv-016h1h; Sun, 05
 Mar 2023 22:40:14 +0100
Subject: Re: ideapad_laptop tablet mode toggle detection
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <CAG4kvq9US=-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgCDjdAkbg@mail.gmail.com>
 <CAG4kvq9-qGFNRP29i4jDPL6RVLwGG86wdtTR1+VWZWu5krfv2A@mail.gmail.com>
 <044d2716-2490-6600-33e2-ecf50f65a6e9@gmail.com>
 <2267dadd-f1a9-e064-6f3f-e3aea459cf5a@gmx.de>
 <CAG4kvq84Lso0x62AuZgRttcQFdKXAHpWWKB4n0ZMTgb9CZ=NCw@mail.gmail.com>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <e95a38c0-15e0-92e2-97c0-4d09219158f5@gmx.de>
Date:   Sun, 5 Mar 2023 22:40:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAG4kvq84Lso0x62AuZgRttcQFdKXAHpWWKB4n0ZMTgb9CZ=NCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:xCZTL0mXDcirobikTJ3K8FZFACOo0HELTrWvyXY6N0muaiMD332
 4s2oYoYK5Zc0iXK/z0Zi5ziTntGDK1Tv9rpWkDvqDCKJTHYt3e2vNDoQmPcLOiqklnyYKhH
 sccMvU3CwDsN9xXGsV3Do/kInPu/oTkMdqk27doccobfYYG/bXrrU24860C0FIu1IfMl5WQ
 InMjR+vK5elm2/pHuc6SQ==
UI-OutboundReport: notjunk:1;M01:P0:634QUkkofX8=;s9+BBOt48InEGklz5JI7xolK7SZ
 8Q6hOkqE53IwyYVnO/OJN7umq24Y6OEpCU+YlWHJLzveDH27QWIF8tpG1MwFci7KjPGdDWAZU
 ouxDfB3fnIUOVRn43hgItJrZaR0ADliaHRBqOMU4WCIphIlHaGu0ZTBu1AR4qfWgwVRTxN59k
 oYpg+qPDgdGn9JszmVivCF89Ej2y2k3+OAgibQUbrDkej9FpsTFZ7uuJkkZXUcIULKUQ7WL6p
 l3HyO/d55mKG3gMXmjF9PZm3m3mYpEmFJEx+XBHgOEzG9iYkFWc45EyRPfss/SFi9CKE7QMtO
 xZsOyC6Dv1HkpZQ27kQkRsnLMfj9IFE7ADqGT5p3x1b26GG9f8CrO5VJ7Y6tlsJK0mnSQNSLX
 JS62Z8EXyfjynk28IVRowbX6fXfHCN2qWXpDEX8BI3SmuMwnz3WFds8Xc7Sgvrk5cfwBMm78/
 vR4g2heCb5qiZa85IGKb6bC6lHprU19xHMjk5ZCNUBUxjt2ilhJFIGuxujwHQOMJTlQ7AlGb2
 TrSvkmTNXwPseuJzuRPC8Cm8HAciexLHAZVqtdNjMoU9gk72rZ8ZqjpJE6NP6GLsdkYrwA2ca
 1miaXb9P4/fERoRECQOMVSek4MyfXUbCM5F07QBFyBqbhbcKWklKPBZciPP3KtDXX5YQyVV4p
 ebrBUoa4f5NRL4Eq2Hxyx3xav4n5EwJdLJyS9J/SO/rksqa6HgHZvF8UCxaLjdbclldCbyojv
 d/9hDi2VeDHsCPp8fCgT58qcTlceBoh9I3eypStWXtqKcNlmI5y9YWPGBSoypzMtj/JaT5EF0
 sATpVEw4ndpOiYK5qDNA8FB8NvKfVYEhM2T1htjC69vY3MY+R1Y7alun4cm/LEKCAUggjXZHW
 79CUYChUy4Ur5UQzo/6M+lRtBEc0mSdxH9dp9XNT1U2inAWlowVHGl/V7DDIKS5y3N32qsoTF
 zSFsvQ==
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am 05.03.23 um 06:42 schrieb Andrew Kallmeyer:

> On Sat, Mar 4, 2023 at 1:37=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote=
:
>> Hi,
>>
>> it seems that the VPC0 ACPI device is handled by the already mentioned =
ideapad-laptop driver,
>> you probably just have to add the necessary event codes to ideapad_keym=
ap[].
>>
>> Armin Wolf
>>
> I read into the ideapad-laptop code some more and found that the
> ideapad_acpi_notify function ends up being the exact same handler that
> I am installing in my test module. I copied over the read_ec_data code
> to read the same variable and found that the screen flip event I'm
> looking at is the bit 5 case which simply calls
> ideapad_sync_touchpad_state (which shows up on screen in my GNOME
> install). It seems this is not quite the P80B =3D 0x44 variable because
> the only bit 5 is set (possibly it's just the first 4?) but it looks
> to be enough to detect the screen flip.
>
> So it seems like I would want to add something to send the
> SW_TABLET_MODE input event there in that bit 5 case. Presumably this
> would be something like the tpacpi_input_send_tabletsw and
> hotkey_tablet_mode_notify_change function calls that are done in the
> thinkpad-acpi driver. Would that be a reasonable thing to add to the
> ideapad driver? I'm not sure how we would know about compatibility
> across the other ideapad laptops. It seems I could at least get this
> all working with my own module for myself for now at least (maybe a
> patch of the ideapad driver because reading that variable in my module
> prevents the original driver from reading it).
>
> I did also notice that bit 10 has a comment about a tablet mode
> switching signal being unreliable but on my machine bit 10 was not set
> for the tablet mode switch event when I checked with my test module.
>
> Thanks,
> Andrew Kallmeyer

Hi,

could it be that bit 5 is set to disable the touchpad when the device swit=
ches
to tablet mode? I suspect that the query handler does the following:
1. Notify VPC0 to disable the touchpad.
2. Notify ACPI WMI, which does submit the necessary scancode for switching=
 to tablet mode.

Could you provide the output of "acpidump"? Because i suspect that the vir=
tual key handling
is done using ACPI WMI, as many modern devices are using this approach. In=
 this case, you
could experiment with ideapad_wmi_notify(), and maybe take a look at ideap=
ad_wmi_ids[].

Armin Wolf

