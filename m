From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v1] x86/platform/mellanox: introduce support for Mellanox
 systems platform
Date: Tue, 13 Sep 2016 07:27:20 +0000
Message-ID: <AM5PR0501MB20978EA0F1FF7A2E5162EC8FA2FE0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <AM5PR0501MB2097F4FF64CD69BD634B8CCEA2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912070457.GA4590@kroah.com>
 <AM5PR0501MB2097F6324F291676415B3513A2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912074059.GA19325@kroah.com>
 <AM5PR0501MB2097A0B071880E64FB157816A2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912081712.GA27368@kroah.com>
 <AM5PR0501MB20970321C4308E2DB45D59D2A2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912083436.GA9490@kroah.com>
 <CAMuHMdWkgyyxTOanMZDEGSPLhkA2AgXbgikCi2jbwJvqQ5m--A@mail.gmail.com>
 <20160912102124.GA3809@kroah.com> <20160912110053.GA5463@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160912110053.GA5463@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "davem@davemloft.net" <davem@davemloft.net>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Ingo Molnar [mailto:mingo.kernel.org@gmail.com] On Behalf Of Ingo
> Molnar
> Sent: Monday, September 12, 2016 2:01 PM
> To: Greg KH <gregkh@linuxfoundation.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>; Vadim Pasternak
> <vadimp@mellanox.com>; tglx@linutronix.de; mingo@redhat.com;
> hpa@zytor.com; davem@davemloft.net; akpm@linux-foundation.org;
> kvalo@codeaurora.org; mchehab@kernel.org; linux@roeck-us.net;
> x86@kernel.org; linux-kernel@vger.kernel.org; platform-driver-
> x86@vger.kernel.org; jiri@resnulli.us
> Subject: Re: [patch v1] x86/platform/mellanox: introduce support for Mell=
anox
> systems platform
>=20
>=20
> * Greg KH <gregkh@linuxfoundation.org> wrote:
>=20
> > On Mon, Sep 12, 2016 at 11:14:26AM +0200, Geert Uytterhoeven wrote:
> > > On Mon, Sep 12, 2016 at 10:34 AM, Greg KH <gregkh@linuxfoundation.org=
>
> wrote:
> > > >> This is LPC to I2C bridge.
> > > >
> > > > "LPC"?
> > >
> > > https://en.wikipedia.org/wiki/Low_Pin_Count
> > >
> > > "Modern ISA"
> >
> > So my original point stands, 1990's technology being used for brand
> > new devices today, ugh :(
> >
> > Someone needs to go kick some hardware designers...
>=20
> In their defense, "this is a carbon copy of published 1990s technology" i=
s a pretty
> good starting point for a defendant, in patent litigation.
>=20

I understood your comments regarding undiscoverable busses.
But we use LPC on all our x86 based systems.
I have to activate all platform related stuff from some place and we don't =
support ACPI.

Do you think it would be OK, if I'll remove all PCI related code, make use =
of DMI and leave only platform activation code?
If yes, I'll re-work this driver and re-send it for your review.

Thanks,
Vadim.




> Thanks,
>=20
> 	Ingo
