From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: Dell Vostro 3360 multimedia keys
Date: Mon, 27 Nov 2017 19:32:20 +0100
Message-ID: <9065116.JHLBT2mDoC@natalenko.name>
References: <5089742.2pBsoxBtzf@natalenko.name> <201711211936.25184@pali> <a5ae5f51b4a14acab4239354f4ff812a@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a5ae5f51b4a14acab4239354f4ff812a@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: pali.rohar@gmail.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, mjg59@srcf.ucam.org, dvhart@infradead.org, andy@infradead.org, dmitry.torokhov@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

Hello.

On pond=C4=9Bl=C3=AD 27. listopadu 2017 17:56:07 CET Mario.Limonciello@dell=
=2Ecom wrote:
> > /* snip */
> > Looks like that Dell Vostro 3360 have this meaning for multimedia keys:
> >=20
> > first key: Mobility Center
> > second key: Dell Support Center
> > third key: Dell Instant Launch Manager
> >=20
> > (same as other Vostro laptops)
>=20
>=20
> As I can tell the "Instant Launch" key is supposed to be emitted
> both via WMI and scan code both.
>=20
> Can you please check SMBIOS table 0xb1 offset 0x08?  This is the misc
> BIOS flags table.  It's been used for a few other drivers for other
> purposes
> too.  I expect that bit 1 should be set.  This should indicate
> that the system supports instant launch manager button.  You can use that
> to key off of for deviating behavior.

Is this correct:

[~]$ sudo dmidecode -t 0xb1       =20
# dmidecode 3.1
Getting SMBIOS data from sysfs.
SMBIOS 2.7 present.

Handle 0x003C, DMI type 177, 12 bytes
OEM-specific Type
        Header and Data:
                B1 0C 3C 00 1A 0E 00 00 01 00 00 00

?

>=20
> As for why these two keys (first and second) seem to emit the same code,
> keep in mind that these were machines from around the era of Windows Vist=
a.
> Microsoft had allowed applications to register tiles in the "mobility
> center".=20
> Dell had an application at that time (Quickset) that would receive the WMI
> events and register tiles in the mobility center.  So the application cou=
ld
> then
> know to open up mobility center applet when it needed to from WMI
> request or to launch another application if it needed to.
>=20
> This has all obviously changed with newer versions of Windows.
>=20
> I would recommend to have a separate function in dell-wmi driver for when=
=20
> you see instant launch key in misc flags table and to allow looking at=20
> extended buffer for these behaviors.
>=20
>=20
> >=20
> > But do not know what KEY_* are used on other Vostro laptops for those
> > keys. It would be great to use same KEY_*...
>=20
>=20
> These first two aren't intended to be generally mapped (as I described
> above).
> I think for Linux you can map them if you desire by my above
> description.=20
> /* snip */
