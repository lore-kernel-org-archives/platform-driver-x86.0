Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C5EC678DB
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Mar 2023 21:37:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjCDVhj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Mar 2023 16:37:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjCDVhi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Mar 2023 16:37:38 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1F91ABCA
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Mar 2023 13:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1677965854; i=w_armin@gmx.de;
        bh=ScUnnclH2PSVLd3HdrimBPfOlPG2JXeFMgQPeKPBq0Y=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=B3BY/OAx90cxj0j0vS9Duvpsm7HQStl3JUp2Wv0+Ftx540Zlz4PjLTnTMfn8JtMG/
         HjGcVElvAsMrysJgxZxtOmxodvkZbTlbRsvP9Ct1fz8uI7NXWO3Fb4BPrNlN1rZvmh
         LuCZ88+9DtsbhVbQkzPrfk0liX0QY9kaHWd8dfjqWycofMY3p06GQPwkWzzkbYNT3R
         igLmLs/R3vlNpO+9NJc3tJceamZ5hknwZVklr7vPMXCPHC+qgBl8wuKtEhEpU8YNoa
         kUceTXVrNaYgQ6H5wINX8JSrOvHNGE+8Nv82t0L0wAkQ/XpwOp1AEnNUy1jGQBltTR
         EBp3x+2nvEGZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26vB-1paURb244H-002Tf9; Sat, 04
 Mar 2023 22:37:34 +0100
Subject: Re: ideapad_laptop tablet mode toggle detection
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Andrew Kallmeyer <kallmeyeras@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <CAG4kvq9US=-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgCDjdAkbg@mail.gmail.com>
 <CAG4kvq9-qGFNRP29i4jDPL6RVLwGG86wdtTR1+VWZWu5krfv2A@mail.gmail.com>
 <044d2716-2490-6600-33e2-ecf50f65a6e9@gmail.com>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <2267dadd-f1a9-e064-6f3f-e3aea459cf5a@gmx.de>
Date:   Sat, 4 Mar 2023 22:37:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <044d2716-2490-6600-33e2-ecf50f65a6e9@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:WwR20UIXvgK8YGevna32MQ6nVO+nPIV8MVQ4eAJa+rp39X0SIwO
 Ic/E/HmVpcDTyFQomTlLajj47LPSpUbu7aknqGlC5QT/ieTFJzatqVcJBjlX/F+8Q+Op7/l
 VrjzRhR/0BIZMAtNp4Hv0kWrty4BD4Y/IbEBnPgVf/2mpENxef6RQ1ZiQwAusHF8m4pEniK
 RZ2u5wK0GcimGf/mIz4ng==
UI-OutboundReport: notjunk:1;M01:P0:quq8jMjUaH0=;KHO3fIhhmtG+vMiztZxdQ06osFn
 O5M74N+GYT/FRml0i7HE34GLYFXdRxPVpWOIPxWcqRgi3kWrc8tDTOvY3X0g4omi6Vtxb6dBG
 J/zW6iwXSoNPazfHHdXLZszAeoBjim2ikGcDMcfqvu0ilZe4RiqecWeHF6Nbbl4HOHX5WLmqk
 RDyJ9COqJV5LqRPcXk/f69eq4iQ4MI1vJsppBB2DfJP2NnuVRQH1xf1h6Ls9zTDEyhVkd4quU
 ai+rnnQsSKN8qBsASC9Xy5ETqyE2is38XL/3vIsJTla8EGIKVKM50LVnxH7ukqirDW+6pdbYb
 +vfWmPRUFZpOBMhLu58fWdZ/NXSbvPYtRVRQQq890uoXd9h96YfHnFC3y5bIMc2jAo3dxQRl+
 fkTQYn5EBAYYrOZBMilWY89uw3T2Etgy0Zr2u6/w84B48Mqemvz/yzDw3O6mrr8TulgjcT65j
 pp2jmX32ecfJqlscaHQ5ImXOSLGVjyJ8bBZB5dVvxqCcJKugnyFD+VLFwSeyR7J3A9+SSGaQu
 g05rVR0HMild5hj3giCvVESKE4JElsce7AQvHW2o3XTgtI2QCZ8c28XOaQHiUhZ3F10d4asDH
 EqJjvWuF0RtpOkjhw5k8PwUhcEO/8zkXrDg4TmEP/cnGnga7s8RcMMHvqUBHFJtSpDRYhtJ7o
 eNZGLwlRYxSUAzNDujIEBgX0Vt5GhUsbLVyVQ0EbuWF2cci5rEI49K0ZZn4YBdF6YQqkXWZot
 Wa0PQ4cN6TmGWXs9Pop+Ma+gH+adxIOx6e/U4ah7MHyA8o19J0rA/4ImyV38GDmUDdfWzkvKs
 ZYcf/3B6LcWl4GUWfHbaWf7YQSDI8tyTUWb0Gs3iMcVu0I29wuoK9CubEJVvM+npHXPH5jSDJ
 VZxrZGPMtHCqasugtZnAfOcIH089roJDHb5ps7pjp2mFsUzo2DH2QsxxnG5PIMSvwhHIm0eUk
 4aj85g==
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am 04.03.23 um 21:14 schrieb Maximilian Luz:

> Hi,
>
> On 3/4/23 06:46, Andrew Kallmeyer wrote:
>> I'm still wondering about that AE_NOT_FOUND error about the WM00
>> device> though. It seems that the ACPI expects the kernel to define
>> this WM00> device as an extension point. In the DSDT I found:> >
>> External (_SB_.WM00, DeviceObj)
> AFAIK this just means that it's external to this table (i.e. the DSDT I
> assume), not that the kernel needs to define it (I'm not sure if
> that's even an
> option in the ACPI spec or ACPICA). So it should be in some SSDT or
> the ACPI
> implementation is broken (unless defining devices from the kernel is
> really an
> option and I'm just misinformed).
>
>> Scope (\_SB.PC00.LPCB.EC0)
>> {
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 Method (_Q44, 0, NotSerialized)=C2=A0 // _Qxx:=
 EC Query, xx=3D0x00-0xFF
>> =C2=A0=C2=A0=C2=A0=C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 P80B =3D 0x44
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Notify (VPC0, 0x80) // Statu=
s Change
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WEID =3D 0xF4
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Notify (WM00, 0x80) // Statu=
s Change
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>> ...
>> =C2=A0=C2=A0=C2=A0=C2=A0 Device (VPC0)
>> =C2=A0=C2=A0=C2=A0=C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name (_HID, "VPC2004")=
=C2=A0 // _HID: Hardware ID
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name (_UID, Zero)=C2=
=A0 // _UID: Unique ID
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name (_VPC, 0x7C0DE114=
)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name (VPCD, Zero)
>>
>>
>> Additionally two other _Qxx methods (11 and 12) Notify the same
>> two devices. These other two are the brightness up and down keys.
>> The only difference is they set those two variables differently so I'll
>> have to read those variables as well to differentiate screen flips.
>> Right now my module actually detects both screen flips and
>> brightness key presses.
>
> I believe that makes sense, given the ACPI code.
>
>> I haven't been able to figure out how to create the WM00 device,
>> I'm not even sure that's a thing in ACPI. I also haven't seen how
>> to read those variables.
>
> You can use acpi_evaluate_object() and acpi_evaluate_object_typed()
> for that.
>
>> Is it okay to reuse the events sent to this
>> VPC0 device or am I intercepting the events from some other
>> functionality? Any pointers would be greatly appreciated.
>
> I guess that depends on the VPC0 device. If it doesn't have a driver
> already
> (which you can check by getting the HID of that device from the DSDT and
> grep-ing for it in the kernel source), you can write your own driver
> against
> it, install the notify-handler, and do basically whatever you want.
> You're not
> intercepting/blocking anything by that. If there already is a driver,
> you'll
> have to check what that does and if you can integrate your
> functionality there.
>
> Given it's a Lenovo device and there are some drivers here, maybe it's
> also
> some know interface/structure, but I guess Hans would know more about
> that than
> I do.
>
> Best regards,
> Max

Hi,

it seems that the VPC0 ACPI device is handled by the already mentioned ide=
apad-laptop driver,
you probably just have to add the necessary event codes to ideapad_keymap[=
].

Armin Wolf

