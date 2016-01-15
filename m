From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] dell-wmi: Stop storing pointers to DMI tables
Date: Fri, 15 Jan 2016 14:27:19 +0100
Message-ID: <20160115142719.36eea015@endymion.delvare>
References: <119170b95d373bc943eb4f16818239bac9fa6c59.1451832667.git.luto@kernel.org>
	<CALCETrVZ23t8u34VtgC+VVQC4PQ0JAw2u27+W_MQiwS=BgMAXQ@mail.gmail.com>
	<20160112142538.GB11560@pali>
	<CALCETrWUJ+5DowyLFDp7N_iNLsday4uKX3iO3NMC8Pfqma=O7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CALCETrWUJ+5DowyLFDp7N_iNLsday4uKX3iO3NMC8Pfqma=O7w@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Andy Lutomirski <luto@amacapital.net>
Cc: Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Jean Delvare <jdelvare@suse.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy,

Sorry for the late reply.

On Wed, 13 Jan 2016 14:28:18 -0800, Andy Lutomirski wrote:
> [cc: Jean Delvare]
>=20
> On Tue, Jan 12, 2016 at 6:25 AM, Pali Roh=C3=A1r <pali.rohar@gmail.co=
m> wrote:
> > On Monday 11 January 2016 13:58:20 Andy Lutomirski wrote:
> >> On Sun, Jan 3, 2016 at 6:52 AM, Andy Lutomirski <luto@kernel.org> =
wrote:
> >> > The dmi_walk function maps the DMI table, walks it, and unmaps i=
t.
> >> > This means that the dell_bios_hotkey_table that find_hk_type sto=
res
> >> > points to unmapped memory by the time it gets read.
> >> >
> >> > I've been able to trigger crashes caused by the stale pointer a
> >> > couple of times, but never on a stock kernel.
> >> >
> >> > Fix it by generating the keymap in the dmi_walk callback instead=
 of
> >> > storing a pointer.
> >>
> >> Quick ping: has anyone had a chance to look at this?
> >
> > Hi Andy, I looked at this patch, but I think some people from -mm o=
r DMI
> > code should look at it as it is memory problem... We also has one i=
n
> > dell-laptop.ko (wrong API usage) and so -mm people could know it be=
tter.
>=20
> Let's ask:
>=20
> Jean, am I right that drivers must not store pointers to DMI tables
> that they find through dmi_walk?

Yes, you are right.

> Is there any alternative interface
> that could be used to get a longer-lived pointer to DMI tables, or
> should drivers just parse them and copy out any info needed from the
> dmi_walk callback?

There is no alternative for OEM type records. Drivers are indeed
expected to copy the information they need to their own buffers.

> There are at least two platform drivers (dell-wmi and dell-laptop)
> that don't play well with the current interface.  This patch is
> intended to fix one of them.

Couldn't see any problem with dell-laptop.

--=20
Jean Delvare
SUSE L3 Support
