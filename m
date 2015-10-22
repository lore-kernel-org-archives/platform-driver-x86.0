From: Darren Hart <dvhart@infradead.org>
Subject: Re: [Bug 105051] Radeon sets max_brightness to -1, breaking GNOME
 backlight control on Macbook Pro mid-2015 11,5
Date: Thu, 22 Oct 2015 11:36:52 +0200
Message-ID: <20151022093652.GA25192@malice.jf.intel.com>
References: <bug-105051-5380@https.bugzilla.kernel.org/>
 <bug-105051-5380-RlJ9dZd1ch@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bug-105051-5380-RlJ9dZd1ch@https.bugzilla.kernel.org/>
Sender: linux-kernel-owner@vger.kernel.org
To: Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>
Cc: platform-driver-x86@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Petri Hodju <petrihodju@yahoo.com>, Bjorn Helgaas <bhelgaas@google.com>
List-Id: platform-driver-x86.vger.kernel.org

Bruno, can you please have a look at the following regression attribute=
d to:

4eebd5a apple-gmux: lock iGP IO to protect from vgaarb changes
 2015-03-18 (7 months ago), Bruno Pr=E9mont <bonbons@linux-vserver.org>


On Thu, Oct 15, 2015 at 04:47:13AM +0000, bugzilla-daemon@bugzilla.kern=
el.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D105051
>=20
> Felipe Ortiz <fortizc@gmail.com> changed:
>=20
>            What    |Removed                     |Added
> ---------------------------------------------------------------------=
-------
>                  CC|                            |fortizc@gmail.com
>=20
> --- Comment #14 from Felipe Ortiz <fortizc@gmail.com> ---
> I can confirm the problem with 4eebd5a4e72697aac25a8a57d3f888a9d5f803=
70. I have
> a MPB 11,5 with AMD/Intel graphics. I recompile the module (a previou=
s version
> of 4eebd5a4e72697aac25a8a57d3f888a9d5f80370) and brightness adjusts i=
s working
> again.
>=20
> I see two problems:=20
>=20
> 1) If someone uses gpu-switch (https://github.com/0xbb/gpu-switch) wi=
th this
> bug screen seem not work, after severals reboots (with different kern=
els) I can
> access a terminal and execute gpu-switch -d and then screen seems wor=
k again.
>=20
> 2) If you use a Intel card (swiched with gpu-switch) the OSD (activat=
ed with
> functions keys) is so slow and chromium have the same problem (tempor=
ary fix is
> deactivate chromium hw acceleration) is this a intel driver bug?
>=20
> --=20
> You are receiving this mail because:
> You are on the CC list for the bug.
>=20

Thanks,

--=20
Darren Hart
Intel Open Source Technology Center
