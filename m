From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH] asus-wmi: control backlight power through WMI, not ACPI
Date: Mon, 21 May 2012 09:02:20 +0200
Message-ID: <CAHR064hftZpN2q5nGbW4jkrgeB5fmeU2rxWbAGJrzr3ManHYKg@mail.gmail.com>
References: <1337161162-27792-1-git-send-email-acelan.kao@canonical.com>
	<CAHR064jGFxZtOYJDNu1qOsyxrxBJ-ckqzotgKrZvLLyQvJ81Rg@mail.gmail.com>
	<CAMz9Wg8pibKD0GfaAXUbRLxAkGu=j-0WOKzTqvNBrFSmQVnXnw@mail.gmail.com>
	<CAHR064jg9_L-hduKtdmTxzJzcSXAdw_K2bUPTUqp=uWd92Df3A@mail.gmail.com>
	<1337561781.1503.7.camel@rui.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:42919 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752284Ab2EUHCV convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 May 2012 03:02:21 -0400
Received: by bkcji2 with SMTP id ji2so3627131bkc.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 May 2012 00:02:20 -0700 (PDT)
In-Reply-To: <1337561781.1503.7.camel@rui.sh.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Zhang Rui <rui.zhang@intel.com>
Cc: AceLan Kao <acelan.kao@canonical.com>, platform-driver-x86@vger.kernel.org, Len Brown <len.brown@intel.com>

On Mon, May 21, 2012 at 2:56 AM, Zhang Rui <rui.zhang@intel.com> wrote:
> On =E4=BA=94, 2012-05-18 at 09:53 +0200, Corentin Chary wrote:
>> Len, Zhang, you may have an advice on that:
>> - vendor backlight interface provides a working "power" file
>> - generic backlight interface does not
>> - hardware send a notification when the user press the LCD toogle ke=
y
>>
>> Solutions:
>> - Use acpi_video=3Dvendor by default (adding a blacklist in ACPI cod=
e)
>
> yes, I agree.

Got a patch comming for that, will let drivers tell video_detect.c
that vendor backlights should be prioritized, thus making
acpi_video_register() works correctly when called later, and allowing
to put the blacklist outside of video_detect.c.

>
>> - Handle the key in the driver instead of letting userspace do it
>
> well, I don't know.
> when using acpi_video=3Dvendor, what action is taken in userspace aft=
er
> pressing the key?

Currently probably nothing in most case (except by gnome maybe ?). But
what should be done is updating the
/sys/class/backlight/asus-wmi/power file.

--=20
Corentin Chary
http://xf.iksaif.net
