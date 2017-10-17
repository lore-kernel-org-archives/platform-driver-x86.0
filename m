From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v8 00/15] Introduce support for Dell SMBIOS over WMI
Date: Tue, 17 Oct 2017 14:22:34 +0000
Message-ID: <cc9011d41c1846e49f073e0e8f127077@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507958847.git.mario.limonciello@dell.com>
 <20171016073307.ahdc6ogzytzwckpq@pali>
 <0aebeec94bad4ca9baae335ef9e591b8@ausx13mpc120.AMER.DELL.COM>
 <20171016133705.cf4f5jqgq4ebhfcj@pali>
 <a9a6d127cdc94f1ba40ce0d2dff78156@ausx13mpc120.AMER.DELL.COM>
 <20171016215647.GD14419@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171016215647.GD14419@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: pali.rohar@gmail.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com, gnomes@lxorguk.ukuu.org.uk
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Monday, October 16, 2017 4:57 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: pali.rohar@gmail.com; andy.shevchenko@gmail.com; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; luto@kernel.=
org;
> quasisec@google.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de;
> greg@kroah.com; gnomes@lxorguk.ukuu.org.uk
> Subject: Re: [PATCH v8 00/15] Introduce support for Dell SMBIOS over WMI
>=20
> On Mon, Oct 16, 2017 at 01:48:05PM +0000, Mario.Limonciello@dell.com wrot=
e:
> > > -----Original Message-----
> > > From: Pali Roh=E1r [mailto:pali.rohar@gmail.com]
> > > Sent: Monday, October 16, 2017 8:37 AM
> > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > > Cc: dvhart@infradead.org; andy.shevchenko@gmail.com; linux-
> > > kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
> luto@kernel.org;
> > > quasisec@google.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de;
> > > greg@kroah.com; gnomes@lxorguk.ukuu.org.uk
> > > Subject: Re: [PATCH v8 00/15] Introduce support for Dell SMBIOS over =
WMI
> > >
> > > On Monday 16 October 2017 13:23:04 Mario.Limonciello@dell.com wrote:
> > > > > -----Original Message-----
> > > > > From: Pali Roh=E1r [mailto:pali.rohar@gmail.com]
> > > > > Sent: Monday, October 16, 2017 2:33 AM
> > > > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > > > > Cc: dvhart@infradead.org; Andy Shevchenko
> <andy.shevchenko@gmail.com>;
> > > > > LKML <linux-kernel@vger.kernel.org>; platform-driver-
> x86@vger.kernel.org;
> > > Andy
> > > > > Lutomirski <luto@kernel.org>; quasisec@google.com; rjw@rjwysocki.=
net;
> > > > > mjg59@google.com; hch@lst.de; Greg KH <greg@kroah.com>; Alan Cox
> > > > > <gnomes@lxorguk.ukuu.org.uk>
> > > > > Subject: Re: [PATCH v8 00/15] Introduce support for Dell SMBIOS o=
ver WMI
> > > > >
> > > > > Hi! Just a small idea, what about including example userspace
> > > > > application which would use this new API? I think such applicatio=
n can
> > > > > be useful for documentation purpose to see how this new API shoul=
d be
> > > > > used. And in review process other people can point if there would=
 be
> > > > > some problems with usage.
> > > > >
> > > > > I do not know if it is requirement or not for introducing new ker=
nel
> > > > > API, but still example code is very useful for developers when th=
ey
> > > > > would start to use this new API and correctly.
> > > > >
> > > > > --
> > > > > Pali Roh=E1r
> > > > > pali.rohar@gmail.com
> > > >
> > > > Pali,
> > > >
> > > > I've produced a small sample application available here:
> > > > https://github.com/superm1/smbios-wmi-poc
> > >
> > > Simple one-file example application. Great!
> > >
> > > Darren, Greg, Mario, I think it would be better to have this example
> > > application in tools/ or in Documentation/... What do you think?
> > >
> > > Looking for examples on random github repos is harder and less offici=
al
> > > as part of linux source tree.
> > >
> >
> > If others also agree, I'm fine with including it with the kernel.
> > Please advise where it should be located.
> >
> > It was originally a POC made just for my own testing of this API.
> > I will probably need to clean it up a little though for wider distribut=
ion
> > to the kernel so I would prefer to send it in a follow up patch if no o=
ther
> > feedback requiring changes to this series as is.
> >
> > One possible issue is that it currently uses glib.  Is that OK?
>=20
> In my opinion, what is important is that there is an open-source
> userspace consumer of the interface. I don't think it needs to be in the
> kernel. If this was a more generic interface which could be tested on
> any hardware, then I think a selftests target would be sensible. As it
> is, this is a very specific use case, and a simple reference to the
> smbios-wmi-poc project URL in documentation someplace (or even in the
> dell-smbios driver comments) seems more than adequate to me.
>=20
To Pali's point I noticed stuff like this: https://github.com/torvalds/linu=
x/blob/master/tools/laptop/freefall/freefall.c
which shows how to use /dev/freefall.

I don't mind to switch my tool to drop glib and bring in kernel.
I'll plan to bring it in here in a separate patch:
tools/wmi/dell-smbios-example.c

kbuild test robot caught a few other missing includes for certain
situations, so I'll be making another change set for that anyway.

Thanks,
