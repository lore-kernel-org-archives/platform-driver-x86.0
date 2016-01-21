From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Thu, 21 Jan 2016 09:57:36 +0100
Message-ID: <20160121085736.GP7192@pali>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160111190411.GE10643@malice.jf.intel.com>
 <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
 <201601112103.01145@pali>
 <20160112215804.GA12869@amd>
 <20160113085455.GD11560@pali>
 <20160113190736.GD9821@amd>
 <20160113191030.GE9821@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:34286 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750878AbcAUI5j (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Jan 2016 03:57:39 -0500
Content-Disposition: inline
In-Reply-To: <20160113191030.GE9821@amd>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

On Wednesday 13 January 2016 20:10:30 Pavel Machek wrote:
> On Wed 2016-01-13 20:07:36, Pavel Machek wrote:
> > On Wed 2016-01-13 09:54:55, Pali Roh=C3=A1r wrote:
> > > On Tuesday 12 January 2016 22:58:04 Pavel Machek wrote:
> > > > Hi!
> > > >=20
>=20
> > > > Next question is.. apparently there are some keyboards that hav=
e
> > > > per-key RGB backlight... but maybe we can just call that "weird
> > > > enough" and ignore...
> > >=20
> > > First we need to defines stable kernel ABI for keyboard backlight=
=2E And I
> > > suggest to use existing convention used by upower/console-kit and=
 other
> > > userspace apps...
> >=20
> > Hmm... I'm not sure that can be done. What were the masks used by
> > upower again? Will upower write to all 6 leds if we present them?
>=20
> Got it...
>=20
> It has function up_kbd_backlight_find() which do:
>=20
>         /* find a led device that is a keyboard device */
> 	        while ((filename =3D g_dir_read_name (dir)) !=3D NULL) {
> 		                if (g_strstr_len (filename, -1, "kbd_backlight") !=3D=
 NULL) {
> 		                        dir_path =3D g_build_filename ("/sys/class/=
leds",
> 		                                                    filename,
> 								    	        NULL);
> 		                        break;
> 							=09
> That suggests that it stops at the first matching device. Adding new
> "virtual" led controlling 6 physical leds would be ugly. So... new
> interface should be done.
>=20
> 								Pavel

Yes, it would be ugly, but lp5523 is already ugly... it can accept
numeric value, trigger and also program in bytecode either via sysfs or
via request_firmware... Another virtual led control should not be
problem for this :-)

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
