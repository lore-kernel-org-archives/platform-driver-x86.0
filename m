From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: BUG? Duplicate key code 0xe045 in dell-wmi.c
Date: Mon, 20 Jul 2015 16:51:00 +0200
Message-ID: <20150720145100.GI25910@pali>
References: <201507041834.03944@pali>
 <559C1CB1.4040509@dell.com>
 <20150707211848.GB20901@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150707211848.GB20901@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario_limonciello@dell.com>, Matthew Garrett <mjg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Len Brown <len.brown@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 07 July 2015 23:18:48 Pali Roh=C3=A1r wrote:
> On Tuesday 07 July 2015 13:38:41 Mario Limonciello wrote:
> >=20
> >=20
> > On 07/04/2015 11:34 AM, Pali Roh=C3=A1r wrote:
> > > Hello,
> > >
> > > I'm looking at dell-wmi.c driver and its history in git and I fou=
nd=20
> > > problem with handling WMI key code 0xe045. In current dell-wmi.c =
code is
> > >
> > > {KE_KEY, 0xe045, KEY_PROG1},
> > > {KE_IGNORE, 0xe045, KEY_NUMLOCK},
> > >
> > > I bet this is some copy-paste error as one code can be translated=
 only=20
> > > to one input key event.
> > >
> > > In git history I found that above change was added by commit:
> > >
> > > http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D5cab0098171712a9fd51399b06181c8dfdebe9c9
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > commit 5cab0098171712a9fd51399b06181c8dfdebe9c9
> > > Author: Mario Limonciello <mario_limonciello@dell.com>
> > > Date:   Wed Jun 10 19:40:47 2009 +0000
> > >
> > >     dell-wmi: add additional keyboard events
> > >    =20
> > >     Upcoming Dell hardware will send more keyboard events via WMI=
=2E  Add
> > >     support for them.
> > >    =20
> > >     Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
> > >     Signed-off-by: Matthew Garrett <mjg@redhat.com>
> > >     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> > >     Signed-off-by: Len Brown <len.brown@intel.com>
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > >
> > > Sending email to all signers of this commit. Problematic code is =
still=20
> > > in upstream kernel, so it needs to be fixed.
> > >
> > > Mario Limonciello: Do you know if code 0xe045 is some PROG1 or NU=
MLOCK?
> > >
> > Hi Pali,
> >=20
> > Yes this looks like a mistake and that the KEY_PROG1 item should ha=
ve
> > been removed in that patch.  It should be a notification (KEY_IGNOR=
E)
> > for numlock.
> >=20
> > Thanks,
>=20
> Hi, I looked into git history of dell-wmi more deeply... into first
> commit of dell-wmi.c source code. It is this one from year 2009:
>=20
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D0b3f6109f0c9ff926b5ffc80dc1cebb24f192b35
>=20
> Here Matthew Garrett says:
>=20
> ... send a generic input event when a button with a picture of a batt=
ery
> on it is pressed ...
>=20
> and adds code:
>=20
> +static struct key_entry dell_wmi_keymap[] =3D {
> +	{KE_KEY, 0xe045, KEY_PROG1},
> +	{KE_END, 0}
> +};
>=20
> So basically when "picture of a battery" is pressed WMI send event
> 0xe045 which is translated to KEY_PROG1.
>=20
> Matthew Garrett is original author of that code and I believe that on
> some his machine 0xe045 code from DELL WMI really could be sent when
> battery button is pressed.
>=20
> Mario, if you as Dell authority says that 0xe045 is sent when numlock=
 is
> pressed, it means either code 0xe045 is ambiguous :-( and has differe=
nt
> meaning for different machines or there is error in (your) documentat=
ion
> or bios... or Matthew cannot differ between picture of battery and
> picture of numlock on his dell machine :-)
>=20
> Matthew: If you still reading this email thread, do you know for whic=
h
> Dell machine did you write this dell-wmi.c driver originally?
>=20
> Mario: Do you know more about this problem?
>=20
>=20
> From function sparse_keymap_setup() called by dell-wmi.c this structu=
re:
>=20
>   {KE_KEY, 0xe045, KEY_PROG1},
>   {KE_IGNORE, 0xe045, KEY_NUMLOCK},
>=20
> is decoded that 0xe045 event is *not* ignored and reports KEY_PROG1 k=
ey.
>=20

Mario & Matthew: ping

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
