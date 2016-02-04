From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel]
 linux-4.4-rc8/drivers/platform/x86/thinkpad_acpi.c: 2 * bad shift ?
Date: Thu, 4 Feb 2016 14:28:50 -0200
Message-ID: <20160204162850.GA29602@khazad-dum.debian.net>
References: <DUB128-W24662478169DFCC5C275139CF20@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:45761 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S964869AbcBDQ2x (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 4 Feb 2016 11:28:53 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id A64682095C
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Feb 2016 11:28:52 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <DUB128-W24662478169DFCC5C275139CF20@phx.gbl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Binderman <dcb314@hotmail.com>
Cc: "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>, "ibm-acpi-devel@lists.sourceforge.net" <ibm-acpi-devel@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Mon, 04 Jan 2016, David Binderman wrote:
> 1.
>=20
> [linux-4.4-rc8/drivers/platform/x86/thinkpad_acpi.c:2297] -> [linux-4=
=2E4-rc8/drivers/platform/x86/thinkpad_acpi.c:3694]: (warning) Shifting=
 32-bit value by 51 bits is undefined behaviour. See condition at line =
3694.
>=20
> Source code at line 2297 is
>=20
> =A0=A0=A0 if (hotkey_user_mask & (1 << scancode))
>=20
> and at 3694 is
>=20
> =A0=A0=A0 if (scancode> 0 && scancode <=3D TPACPI_HOTKEY_MAP_LEN) {
>=20
> Maybe new code
>=20
> =A0=A0=A0 if (hotkey_user_mask & (1UL << scancode))
>=20
> is better.

You are correct that this is buggy.  Thank you for the report!

Scancodes 32 (0x20) and above were added to the keymap to support the
adaptative keyboard in the X1 carbon (which Lenovo has since abandoned)=
=2E
They are not present in the legacy firmware event mask (which is what t=
hat
shift addresses).

We could just always issue the hotkey event for these scan codes, and i=
f the
user doesn't want such an event, he can use the standard interfaces to =
set
the keycode in the keymap to KEY_RESERVED.

I will just read up a bit on the patches and ML discussions that result=
ed in
this change to check if there is a new firmware event mask we should be
checking, and prepare a fix.

I will need help from someone that has an adaptative keyboard to test t=
he
patches, though.

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
