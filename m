From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v10 13/15] platform/x86: wmi: create userspace interface
 for drivers
Date: Fri, 20 Oct 2017 14:15:00 +0000
Message-ID: <055f1a21ee964a439bee1110222e6774@ausx13mpc120.AMER.DELL.COM>
References: <cover.1508434513.git.mario.limonciello@dell.com>
 <175838453318108ae69be344c4d3a2b75c2edc69.1508434514.git.mario.limonciello@dell.com>
 <20171020132340.GC23973@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171020132340.GC23973@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: greg@kroah.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, gnomes@lxorguk.ukuu.org.uk
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Friday, October 20, 2017 8:24 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;=
 Andy
> Lutomirski <luto@kernel.org>; quasisec@google.com; pali.rohar@gmail.com;
> rjw@rjwysocki.net; mjg59@google.com; hch@lst.de; Alan Cox
> <gnomes@lxorguk.ukuu.org.uk>
> Subject: Re: [PATCH v10 13/15] platform/x86: wmi: create userspace interf=
ace for
> drivers
>=20
> On Thu, Oct 19, 2017 at 12:50:16PM -0500, Mario Limonciello wrote:
> > +#ifdef CONFIG_COMPAT
> > +	.compat_ioctl	=3D wmi_ioctl,
>=20
> Why do you still need a compat ioctl?

Being able to run 32 bit app on 64 bit kernel.
Removing the .compat_ioctl definition and they fail.

So do you mean specifically the #ifdef CONFIG_COMPAT?
I do see that compat_ioctl is declared without it in linux/fs.h, but I'll a=
dmit
I'm unsure what happens if the kernel is compiled without CONFIG_COMPAT
and you try to run 32 bit apps.  _Should_ that work?
