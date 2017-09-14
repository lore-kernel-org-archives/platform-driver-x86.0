From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: keyboard backlight max_brightness bug on Dell Latitude E6410
Date: Thu, 14 Sep 2017 16:33:57 +0200
Message-ID: <CABFtUbQXBE+n+HV0cgMv0wLXuRkMqyp4J=Hf4BiBj8Hxc9eUaw@mail.gmail.com>
References: <20170914063515.669a95d04dbb6b53be537852cb8ecb8c.39d3e774b5.wbe@email22.secureserver.net>
 <20170914135420.GO32278@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:46166 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751255AbdINOd7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Sep 2017 10:33:59 -0400
In-Reply-To: <20170914135420.GO32278@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: "Gabriel M. Elder" <gabriel@tekgnowsys.com>, Darren Hart <dvhart@infradead.org>, andy@infradead.org, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2017-09-14 15:54 GMT+02:00 Pali Roh=C3=A1r <pali.rohar@gmail.com>:
> Adding Gabriele to thread, IIRC you have machine which uses
> "supported keyboard light brightness levels"
> Can you look at this bug, if your machine is affected by it too?

My keyboard has two brightness levels + off. The value of
max_brightness is 2, as expected.

Gabriele

Yes, my laptop uses "supported keyboard light brightness levels".
>
> Important parts in ouptput:
>
>> ... --info
>>  Supported Keyboard light brightness levels :  10
>
>> ... --get-status
>>  Current keyboard light level : 9
>
> Gabriel, can you play with this tool, which values can be set via
> --set-level=3D parameter? Is 10 accepted? --get-status can be used to
> check if value was accepted.
>
> On Thursday 14 September 2017 06:35:15 Gabriel M. Elder wrote:
>>
>> output from smbios-keyboard-ctl --info:
>>
>> Libsmbios version : 2.3.0
>> smbios-keyboard-ctl version : 2.3.0
>>
>>  Capabilities of KeyBoard Illumination on your system:
>> -------------------------------------------------------------------
>>  Supported USER Selectable Modes :
>>        Always OFF
>>        Auto: ALS- and input-activity-based On; input-activity based Off
>>        Auto: Input-activity-based On; input-activity based Off
>>
>>  Supported Keyboard illumination type :  Backlight
>>
>>  Supports Keyboard illumination on :
>>       Any Keystroke
>>       Touchpad activity
>>       Pointing stick
>>
>>  Can configure Keyboard illumination timeout unit in :
>>       Seconds
>>       Minutes
>>       Hours
>>
>>  Supported Keyboard light brightness levels :  10
>>
>>  Maximum acceptable seconds timeout value   :  255
>>
>>  Maximum acceptable minutes timeout value   :  255
>>
>>  Maximum acceptable hours timeout value     :  12
>>
>>  Maximum acceptable days timeout value      :  0
>>
>>
>> output from smbios-keyboard-ctl --get-status:
>>
>> Helper function to print current status of keyboard illumination
>>
>>  Current status of KeyBoard Illumination setting on your system:
>> -------------------------------------------------------------------
>>
>>  Configured mode state:
>>        Auto: Input-activity-based On; input-activity based Off
>>
>>  Your Keyboard will illumination on:
>>       Any Keystroke
>>       Touchpad activity
>>       Pointing stick
>>
>>  Keyboard illumination timeout has bee set at: 10  Seconds
>>
>>  Current setting of ALS value that turns the light on or off: 18
>>  Current ALS Reading : 16
>>  Current keyboard light level : 9
>>
>>
>> -------- Original Message --------
>> Subject: Re: keyboard backlight max_brightness bug on Dell Latitude
>> E6410
>> From: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>> Date: Thu, September 14, 2017 3:06 am
>> To: "Gabriel M. Elder" <gabriel@tekgnowsys.com>
>> Cc: dvhart@infradead.org, andy@infradead.org,
>> platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
>>
>> On Monday 11 September 2017 23:25:27 Gabriel M. Elder wrote:
>> > Hi all,
>> > Hans de Goede, one of the upower maintainers, suggested I alert you al=
l to this bug:
>> >
>> > https://bugs.freedesktop.org/show_bug.cgi?id=3D100041
>> >
>> > and the new one I filed via the kernel bugzilla:
>> >
>> > https://bugzilla.kernel.org/show_bug.cgi?id=3D196913
>> > "keyboard backlight max_brightness value outside allowable range on De=
ll Latitude E6410 laptop"
>> >
>> > Please check it out at your earliest convenience.
>> >
>> > thanks,
>> > - Gabriel</html>
>>
>> Hi Gabriel, please avoid sending such html emails to mailing list as it
>> is hard to read them and also you have a very big chance that email
>> would be eaten by spam filter or other developers would completely
>> ignore it...
>>
>> To debug your problem, can you run smbios-keyboard-ctl tool from the
>> libsmbios project? https://github.com/dell/libsmbios
>>
>> We would need output from --info parameter and also from --get-status.
>>
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com
