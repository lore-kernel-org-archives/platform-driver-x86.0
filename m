From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH 3/3] platform/x86: dell-wmi: add keys to
 bios_to_linux_keycode
Date: Mon, 8 Jun 2020 20:58:38 +0000
Message-ID: <f7ab352f27954bbb88bafb41d6b17fe1@AUSX13MPC105.AMER.DELL.COM>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <13951508596a3f654c6d47f5380ddb4f38e2f6b5.1591584631.git.y.linux@paritcher.com>
 <20200608090017.4qgtbosz7oullex2@pali>
 <8baab72e3d2e407792c3ffa1d9fffba8@AUSX13MPC105.AMER.DELL.COM>
 <20200608204826.kb7x5mh6hzj2hxcz@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200608204826.kb7x5mh6hzj2hxcz@pali>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: pali@kernel.org
Cc: y.linux@paritcher.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
> owner@vger.kernel.org> On Behalf Of Pali Roh=E1r
> Sent: Monday, June 8, 2020 3:48 PM
> To: Limonciello, Mario
> Cc: y.linux@paritcher.com; linux-kernel@vger.kernel.org; platform-driver-
> x86@vger.kernel.org; mjg59@srcf.ucam.org
> Subject: Re: [PATCH 3/3] platform/x86: dell-wmi: add keys to
> bios_to_linux_keycode
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> On Monday 08 June 2020 15:46:44 Mario.Limonciello@dell.com wrote:
> > I would actually question if there is value to lines in dell-wmi.c like
> this:
> >
> > pr_info("Unknown WMI event type 0x%x\n", (int)buffer_entry[1]);
> >
> > and
> >
> > pr_info("Unknown key with type 0x%04x and code 0x%04x pressed\n", type,
> code);
> >
> > In both of those cases the information doesn't actually help the user, =
by
> default it's
> > ignored by the driver anyway.  It just notifies the user it's something
> the driver doesn't
> > comprehend.  I would think these are better suited to downgrade to debu=
g.
> And if
> > a key combination isn't doing something expected the user can use dyndb=
g
> to turn it
> > back on and can be debugged what should be populated or "explicitly"
> ignored.
>=20
> My motivation for these messages was to provide information to user that
> kernel received event, but was not able to process it as it do not
> understand it.
>=20
> It could help in situation when user press special key and nothing is
> delivered to userspace. But he could see that something happened in log.
>=20

But does a user know what to do with this information?  From time to time
coming to kernel mailing list, but that's it.

I think same person who would know to come to kernel mailing list for a key
not working can likely also hand turning on dyndbg to get the info.

> Similar message is also printed by PS/2 keyboard driver atkbd.c:
>=20
> 	case ATKBD_KEY_UNKNOWN:
> 		dev_warn(&serio->dev,
> 			 "Unknown key %s (%s set %d, code %#x on %s).\n",
> 			 atkbd->release ? "released" : "pressed",
> 			 atkbd->translated ? "translated" : "raw",
> 			 atkbd->set, code, serio->phys);
> 		dev_warn(&serio->dev,
> 			 "Use 'setkeycodes %s%02x <keycode>' to make it known.\n",
> 			 code & 0x80 ? "e0" : "", code & 0x7f);
> 		input_sync(dev);
> 		break;

I think the difference here is that user can actually do something from use=
rland
to do with `setkeycodes` for PS2.
