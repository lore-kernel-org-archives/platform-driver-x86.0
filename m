From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH v2 1/3] platform: x86: dell-rbtn: Dell Airplane Mode Switch driver
Date: Sat, 02 May 2015 15:51:50 +0200
Message-ID: <10520902.uqZDZn6tkf@xps13>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com> <CAJ=jquYEEZ928A=eL158p38s4EEX32BZB5mOv5-841bRkKr_UQ@mail.gmail.com> <20150430074429.GT24346@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:36645 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751305AbbEBNvy convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 2 May 2015 09:51:54 -0400
In-Reply-To: <20150430074429.GT24346@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Alex Hung <alex.hung@canonical.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org

On Thursday 30 April 2015 09:44:29 Pali Roh=E1r wrote:
> On Thursday 30 April 2015 14:06:27 Alex Hung wrote:
> > Method ABRT is to be used by driver to disable BIOS handling of rad=
io
> > button. So the changes in behaviours observed by Gabriele is expect=
ed.
> > I have seen other systems behave the same way.
> >=20
>=20
> Right, that after that ARBT call operating system get full control ov=
er
> radio devices and ACPI/BIOS will not automatically enable/disable the=
m.
> I think this is OK.
>=20
> But for that we need also support for manually enable/disable radio
> devices and code for this support is missing. Or do DELLABCE/RBTN acp=
i
> devices somehow support enabling/disabling it via system/kernel reque=
st?
>=20
> > I do also see firmware only sends Notify(RBTN, 0x80) and no hard bl=
ock
> > whether ABRT(1) is called or not.  Thus keycode are the only option=
 on
> > those machines.
> >=20
>=20
> Key is ok, but we *must* have ability to hard block it via some
> ACPI/WMI/BIOS/FW/etc... call. Otherwise ARBT(1) is no go as users sho=
uld
> be able to enable/disable their radio devices (bluetooth for powersav=
e)
>=20
> > The idea to have an option (kernel parameter) for calling ABRT is
> > great. I can help verify on more machines. Is Gabriele's patch abov=
e a
> > final version that I should test?
> >=20
>=20
> No, I do not think so. This looks like hack or pure design. Kernel
> option could be there, but just for buggy BIOSes (and future changed
> design).
>=20
> But now it looks like for correct work is specifying that param
> required -- which is bad.
>=20
> Alex, can you ask Dell people how should system turn off e.g bluetoot=
h
> or wifi device if ARTB(1) is called and system/kernel (instead ACPI) =
is
> expected to turn off/on blueooth (and wifi) devices?

I completely forgot that libsmbios comes with smbios-wireless-ctl.
It allows me to control the hardware slider.

> I think that without this information (and working driver for it) we
> should not enable ARTB(1) or including this driver into kernel tree a=
s
> it will break some existing machines...

Alex, could you test smbios-wireless-ctl and see what it says about the
laptops with no hardware slider? For instance on mine it says:

Radio Status for WLAN:
        WLAN enabled at boot
        WLAN supported
        WLAN enabled
        WLAN installed
        WLAN boot-time wireless switch setting not present
        WLAN runtime switch control currently enabled
        Status Code: 0

You can find the utility here: http://linux.dell.com/git/libsmbios.git

The code to check for the presence of an hardware slider is even
already implemented in dell-laptop and works on my laptop, it says the
slider is present.


Pali, you have a Latitude, right? Is "whitelisted" true when you load
dell-laptop? I'm asking because when I load dell-laptop with
force_rfkill, my function key stops working. Radio devices get disabled
the moment dell-laptop is loaded and I must use smbios-wireless-ctl to
re-enable them. Once I re-enabled them, the function keys starts
working again.
I don't know exactly what happens on your laptop, but I was wondering
if dell-laptop is messing things up on your laptop too.
