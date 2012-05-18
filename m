From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH] asus-wmi: control backlight power through WMI, not ACPI
Date: Fri, 18 May 2012 09:53:09 +0200
Message-ID: <CAHR064jg9_L-hduKtdmTxzJzcSXAdw_K2bUPTUqp=uWd92Df3A@mail.gmail.com>
References: <1337161162-27792-1-git-send-email-acelan.kao@canonical.com>
	<CAHR064jGFxZtOYJDNu1qOsyxrxBJ-ckqzotgKrZvLLyQvJ81Rg@mail.gmail.com>
	<CAMz9Wg8pibKD0GfaAXUbRLxAkGu=j-0WOKzTqvNBrFSmQVnXnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:40142 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761196Ab2ERHxK convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 May 2012 03:53:10 -0400
Received: by mail-bk0-f46.google.com with SMTP id ji2so2120045bkc.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 May 2012 00:53:09 -0700 (PDT)
In-Reply-To: <CAMz9Wg8pibKD0GfaAXUbRLxAkGu=j-0WOKzTqvNBrFSmQVnXnw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Len Brown <len.brown@intel.com>

Len, Zhang, you may have an advice on that:
- vendor backlight interface provides a working "power" file
- generic backlight interface does not
- hardware send a notification when the user press the LCD toogle key

Solutions:
- Use acpi_video=3Dvendor by default (adding a blacklist in ACPI code)
- Handle the key in the driver instead of letting userspace do it
- Another idea ?

> Userspace app, such as gnome-settings-daemon, will use
> /sys/class/backlight/acpi_video0
> as it's first choice if there is one.
> But ACPI function to toggle the backlight power is not working, and
> from our BIOS engineer,
> ACPI doesn't define the backlight power section, but ASUS WMI does.
> So, I think it would have less problem to turn on/off backlight power
> through WMI.

Ok. So the vendor backlight provides features that the generic
backlight does not.


> And, yes, calling asus_wmi_backlight_init() is not a good idea here.
> We have to record the backlight power status by ourselves if we didn'=
t call it.
> Let me show you another version of patch later.

That's a solution yes. Another one could be to force
acpi_backlight=3Dvendor for these well known laptop, but I don't know i=
f
this will be accepted by ACPI maintainers. So let's start with a
simpler patch as you proposed (handling via backlight if registered,
or recording the status ourselve if it's not the case, but please add
a comment explaining why it's done this way).

>> What does the key do exactly without driver ? Does it just send a
>> notification or does it also poke the hardware ?
> It's a WMI event notify, and will be mapped to the key shown below
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0xe9, { KEY_BRIGHTNESS_ZERO } },
> Just a notification.

KEY_DISPLAY_TOGGLE is the key to power up/down an LCD screen. Looks
better than KEY_BRIGHTNESS_ZERO that may only put the brughtness to
zero. But I'm not sure how these keys are handled by userspace.

--=20
Corentin Chary
http://xf.iksaif.net
