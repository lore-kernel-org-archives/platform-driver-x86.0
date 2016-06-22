From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 0/4] dell-wmi: Changes in WMI event code handling
Date: Wed, 22 Jun 2016 12:30:28 +0200
Message-ID: <20160622103028.GB29844@pali>
References: <1466020153-10877-1-git-send-email-pali.rohar@gmail.com>
 <20160621180617.GD3685@f23x64.localdomain>
 <e3fabd2ab50d46389400cfb8900bad4d@ausx13mpc120.AMER.DELL.COM>
 <201606212029.28029@pali>
 <284b4ec68aae43e6ab6a257574d5b58a@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <284b4ec68aae43e6ab6a257574d5b58a@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario_Limonciello@Dell.com
Cc: dvhart@infradead.org, gabriele.mzt@gmail.com, luto@kernel.org, alex.hung@canonical.com, mjg59@srcf.ucam.org, kernel@kempniu.pl, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 21 June 2016 18:37:19 Mario_Limonciello@Dell.com wrote:
> > -----Original Message-----
> > From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
> > Sent: Tuesday, June 21, 2016 1:29 PM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; gabriele.mzt@gmail.com; luto@kernel.org;
> > alex.hung@canonical.com; mjg59@srcf.ucam.org; kernel@kempniu.pl;
> > platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 0/4] dell-wmi: Changes in WMI event code han=
dling
> >=20
> > On Tuesday 21 June 2016 20:16:09 Mario_Limonciello@dell.com wrote:
> > > > -----Original Message-----
> > > > From: Darren Hart [mailto:dvhart@infradead.org]
> > > > Sent: Tuesday, June 21, 2016 1:06 PM
> > > > To: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > > > Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>; Andy Lutomirski
> > > > <luto@kernel.org>; Alex Hung <alex.hung@canonical.com>; Matthew
> > > > Garrett <mjg59@srcf.ucam.org>; Micha=C5=82 K=C4=99pie=C5=84 <ke=
rnel@kempniu.pl>;
> > > > Limonciello, Mario <Mario_Limonciello@Dell.com>; platform-drive=
r-
> > > > x86@vger.kernel.org; linux-kernel@vger.kernel.org
> > > > Subject: Re: [PATCH v3 0/4] dell-wmi: Changes in WMI event code
> > > > handling
> > > >
> > > > On Thu, Jun 16, 2016 at 09:33:02AM +0200, Pali Roh=C3=A1r wrote=
:
> > > > > On Wednesday 15 June 2016 20:19:58 Darren Hart wrote:
> > > > > > On Wed, Jun 15, 2016 at 09:49:09PM +0200, Pali Roh=C3=A1r w=
rote:
> > > > > > > First patch describe problem about 0xe045 code. Second an=
d
> > > > > > > third are
> > > >
> > > > just
> > > >
> > > > > > > cosmetic and last rework code which processing WMI events=
=2E It
> > > > > > > should
> > > >
> > > > be
> > > >
> > > > > > > properly tested on more Dell machines, to check that
> > > > > > > everything is still working correctly.
> > > > > >
> > > > > > Is this "should be properly tested on more Dell machines" s=
till
> > > > > > the case?
> > > >
> > > > Are
> > > >
> > > > > > you ready for this to go into linux-next?
> > > > >
> > > > > Series should be OK, but I would like to see if someone else =
test
> > > > > this series... Gabriele, Alex or Andy? Do you have time?
> > > >
> > > > Tested on a Dell XPS 13 2016 (9350). All hotkeys appear to work
> > > > without warning
> > > > messages. I didn't get anything out of Fn-F8 which has a pictur=
e of
> > > > a laptop and
> > > > white screen behind it. Not sure what that is supposed to do - =
if
> > > > it was meant to blank the screen, it did not, perhaps it is mea=
nt
> > > > to toggle screen outputs... will test that when I have access t=
o
> > > > an external display.
> > >
> > > That key is meant to toggle screen outputs.  I believe it's still
> > > done by the EC emitting <super> + p.  If your WM doesn't recogniz=
e
> > > that, it won't do much, but you can see in xev the key combinatio=
ns.
> >=20
> > I still do not understand this stupidity, pressing *one* key cause
> > emitting two keys to OS and then OS needs to handle combinations of=
 keys
> > and acts on it correctly.... (like windows manager)
> >=20
> > Is there some way to disable this insane nonsense activity of BIOS,
> > firmware or whatever it is doing in HW to send *one* key scancode w=
hen
> > pressing *one* key?
> >=20
>=20
> I talked to the EC team about this a while back when it was first imp=
lemented.
> That's not possible without _OSI detection of Linux.  _OSI detection =
could be=20
> used to relay to the EC to behave differently, but otherwise the EC w=
ill have=20
> no idea what OS it's on for which way to behave.

ACPI code should not behave differently for different operating systems=
=2E
If there is bug in kernel, report bug to kernel, subtree maintainer for
fixing it. And not doing workaround and hacks in ACPI.

In this case there could be (standardized) ACPI function for turning of=
f
this nonsense functionality and supported kernel could call it.

Is not there such ACPI function? Or Dell specific SMBIOS call?

> I don't remember all the history behind the switch over from a single=
 scan code=20
> To <super> + P, but I think it's along the lines of Windows 8/Windows=
 10 allow
> you to iterate the display selection menu based upon holding super an=
d pressing
> P multiple times and waiting for you to stop. =20

Windows systems doing stupid things and fixing their bugs in ACPI is
wrong. It broke for example this key on all other systems (Linux too).

> Sending a single scan code will change displays immediately, so havin=
g the=20
> EC send super+p unifies the behavior of fn-f8 and super+p.

And due to this OS/kernel cannot distinguish between Fn-F8 and Super+p
keys...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
