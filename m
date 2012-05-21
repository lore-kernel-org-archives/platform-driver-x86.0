From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH] asus-wmi: control backlight power through WMI, not ACPI
Date: Mon, 21 May 2012 08:56:21 +0800
Message-ID: <1337561781.1503.7.camel@rui.sh.intel.com>
References: <1337161162-27792-1-git-send-email-acelan.kao@canonical.com>
	 <CAHR064jGFxZtOYJDNu1qOsyxrxBJ-ckqzotgKrZvLLyQvJ81Rg@mail.gmail.com>
	 <CAMz9Wg8pibKD0GfaAXUbRLxAkGu=j-0WOKzTqvNBrFSmQVnXnw@mail.gmail.com>
	 <CAHR064jg9_L-hduKtdmTxzJzcSXAdw_K2bUPTUqp=uWd92Df3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:32359 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752848Ab2EUAzD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 May 2012 20:55:03 -0400
In-Reply-To: <CAHR064jg9_L-hduKtdmTxzJzcSXAdw_K2bUPTUqp=uWd92Df3A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: AceLan Kao <acelan.kao@canonical.com>, platform-driver-x86@vger.kernel.org, Len Brown <len.brown@intel.com>

On =E4=BA=94, 2012-05-18 at 09:53 +0200, Corentin Chary wrote:
> Len, Zhang, you may have an advice on that:
> - vendor backlight interface provides a working "power" file
> - generic backlight interface does not
> - hardware send a notification when the user press the LCD toogle key
>=20
> Solutions:
> - Use acpi_video=3Dvendor by default (adding a blacklist in ACPI code=
)

yes, I agree.

> - Handle the key in the driver instead of letting userspace do it

well, I don't know.
when using acpi_video=3Dvendor, what action is taken in userspace after
pressing the key?

thanks,
rui

> - Another idea ?
>=20
> > Userspace app, such as gnome-settings-daemon, will use
> > /sys/class/backlight/acpi_video0
> > as it's first choice if there is one.
> > But ACPI function to toggle the backlight power is not working, and
> > from our BIOS engineer,
> > ACPI doesn't define the backlight power section, but ASUS WMI does.
> > So, I think it would have less problem to turn on/off backlight pow=
er
> > through WMI.
>=20
> Ok. So the vendor backlight provides features that the generic
> backlight does not.
>=20
>=20
> > And, yes, calling asus_wmi_backlight_init() is not a good idea here=
=2E
> > We have to record the backlight power status by ourselves if we did=
n't call it.
> > Let me show you another version of patch later.
>=20
> That's a solution yes. Another one could be to force
> acpi_backlight=3Dvendor for these well known laptop, but I don't know=
 if
> this will be accepted by ACPI maintainers. So let's start with a
> simpler patch as you proposed (handling via backlight if registered,
> or recording the status ourselve if it's not the case, but please add
> a comment explaining why it's done this way).
>=20
> >> What does the key do exactly without driver ? Does it just send a
> >> notification or does it also poke the hardware ?
> > It's a WMI event notify, and will be mapped to the key shown below
> >        { KE_KEY, 0xe9, { KEY_BRIGHTNESS_ZERO } },
> > Just a notification.
>=20
> KEY_DISPLAY_TOGGLE is the key to power up/down an LCD screen. Looks
> better than KEY_BRIGHTNESS_ZERO that may only put the brughtness to
> zero. But I'm not sure how these keys are handled by userspace.
>=20
