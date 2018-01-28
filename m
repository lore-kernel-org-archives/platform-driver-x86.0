From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: Dell Vostro 3360 multimedia keys
Date: Sat, 27 Jan 2018 20:39:15 -0800
Message-ID: <CAKdAkRQa1tZXMxg=8WX4kfFk_p+5kDakVRJDyB_r4ri3qG5eCg@mail.gmail.com>
References: <5089742.2pBsoxBtzf@natalenko.name> <1716681.OUoELY8X92@natalenko.name>
 <201711211936.25184@pali> <1629929.m6cr89zbSo@natalenko.name> <20180127140557.xa3bdoouk5whhtbx@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vk0-f51.google.com ([209.85.213.51]:34154 "EHLO
        mail-vk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751783AbeA1EjQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 Jan 2018 23:39:16 -0500
In-Reply-To: <20180127140557.xa3bdoouk5whhtbx@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>, Mario Limonciello <mario_limonciello@dell.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Sat, Jan 27, 2018 at 6:05 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> On Tuesday 21 November 2017 19:58:24 Oleksandr Natalenko wrote:
>>
>> Just to note what I did. Here is my custom /etc/udev/hwdb.d/90-dell-
>> vostro-3360.hwdb:
>>
>> =3D=3D=3D
>> evdev:atkbd:dmi:bvnDellInc.:bvrA18:bd09/25/2013:svnDellInc.:pnVostro3360=
:pvr:rvnDellInc.:rn0F5DWF:rvrA00:cvnDellInc.:ct8:cvr0.1:
>>   KEYBOARD_KEY_60=3Dprog4
>> =3D=3D=3D
>>
>> Here is how this key press is being detected by evtest via atkbd:
>>
>> =3D=3D=3D
>> Event: time 1511289883.083968, type 4 (EV_MSC), code 4 (MSC_SCAN), value=
 60
>> Event: time 1511289883.083968, type 1 (EV_KEY), code 203 (KEY_PROG4), va=
lue 2
>> Event: time 1511289883.083968, -------------- SYN_REPORT ------------
>> =3D=3D=3D
>
> So, it is working fine and there is no problem in kernel.
>
>> But xev shows nothing when I press this key. Am I doing something wrong?
>
> This is bug in X Server or so. You would need to remap keycode to
> something different as a workaround for X Server.

No, I do not think so. Value 2 means that the key is repeated, most
likely because the firmware did not bother to generate a "release"
event for this key. You also need to adjust "force_release" but
changing your hwdb entry slightly:

KEYBOARD_KEY_60=3D!prog4

(note ! before the keycode name).

X implements its own autorepeat handling and ignores kernel key events
with value of 2.

Thanks.

--=20
Dmitry
