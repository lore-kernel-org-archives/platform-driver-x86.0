From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v1] x86/platform/mellanox: introduce support for Mellanox
 systems platform
Date: Tue, 13 Sep 2016 08:18:11 +0000
Message-ID: <AM5PR0501MB20979B6C5AC0F9E0AB55C01AA2FE0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <AM5PR0501MB2097F6324F291676415B3513A2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912074059.GA19325@kroah.com>
 <AM5PR0501MB2097A0B071880E64FB157816A2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912081712.GA27368@kroah.com>
 <AM5PR0501MB20970321C4308E2DB45D59D2A2FF0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160912083436.GA9490@kroah.com>
 <CAMuHMdWkgyyxTOanMZDEGSPLhkA2AgXbgikCi2jbwJvqQ5m--A@mail.gmail.com>
 <20160912102124.GA3809@kroah.com> <20160912110053.GA5463@gmail.com>
 <AM5PR0501MB20978EA0F1FF7A2E5162EC8FA2FE0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <20160913081212.GA15715@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-db5eur01on0075.outbound.protection.outlook.com ([104.47.2.75]:35684
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752217AbcIMIeT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Sep 2016 04:34:19 -0400
In-Reply-To: <20160913081212.GA15715@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ingo Molnar <mingo@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "davem@davemloft.net" <davem@davemloft.net>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>



> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Tuesday, September 13, 2016 11:12 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: Ingo Molnar <mingo@kernel.org>; Geert Uytterhoeven <geert@linux-
> m68k.org>; tglx@linutronix.de; mingo@redhat.com; hpa@zytor.com;
> davem@davemloft.net; akpm@linux-foundation.org; kvalo@codeaurora.org;
> mchehab@kernel.org; linux@roeck-us.net; x86@kernel.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnull=
i.us
> Subject: Re: [patch v1] x86/platform/mellanox: introduce support for Mell=
anox
> systems platform
>=20
> On Tue, Sep 13, 2016 at 07:27:20AM +0000, Vadim Pasternak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Ingo Molnar [mailto:mingo.kernel.org@gmail.com] On Behalf Of
> > > Ingo Molnar
> > > Sent: Monday, September 12, 2016 2:01 PM
> > > To: Greg KH <gregkh@linuxfoundation.org>
> > > Cc: Geert Uytterhoeven <geert@linux-m68k.org>; Vadim Pasternak
> > > <vadimp@mellanox.com>; tglx@linutronix.de; mingo@redhat.com;
> > > hpa@zytor.com; davem@davemloft.net; akpm@linux-foundation.org;
> > > kvalo@codeaurora.org; mchehab@kernel.org; linux@roeck-us.net;
> > > x86@kernel.org; linux-kernel@vger.kernel.org; platform-driver-
> > > x86@vger.kernel.org; jiri@resnulli.us
> > > Subject: Re: [patch v1] x86/platform/mellanox: introduce support for
> > > Mellanox systems platform
> > >
> > >
> > > * Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > > On Mon, Sep 12, 2016 at 11:14:26AM +0200, Geert Uytterhoeven wrote:
> > > > > On Mon, Sep 12, 2016 at 10:34 AM, Greg KH
> > > > > <gregkh@linuxfoundation.org>
> > > wrote:
> > > > > >> This is LPC to I2C bridge.
> > > > > >
> > > > > > "LPC"?
> > > > >
> > > > > https://en.wikipedia.org/wiki/Low_Pin_Count
> > > > >
> > > > > "Modern ISA"
> > > >
> > > > So my original point stands, 1990's technology being used for
> > > > brand new devices today, ugh :(
> > > >
> > > > Someone needs to go kick some hardware designers...
> > >
> > > In their defense, "this is a carbon copy of published 1990s
> > > technology" is a pretty good starting point for a defendant, in paten=
t
> litigation.
> > >
> >
> > I understood your comments regarding undiscoverable busses.
> > But we use LPC on all our x86 based systems.
> > I have to activate all platform related stuff from some place and we
> > don't support ACPI.
>=20
> x86 that doesn't support ACPI?  That's sad :(

Yes.
But we should make a decision for the coming platform - to provide ACPI sup=
port for board specific stuff, or equip the new systems with BMC (so we'll =
introduce all board related stuff through DTS).
But currently this is our reality. Me also sad.

>=20
> > Do you think it would be OK, if I'll remove all PCI related code, make
> > use of DMI and leave only platform activation code?
> > If yes, I'll re-work this driver and re-send it for your review.
>=20
> Yes, that sounds like a good start, let's see how the code looks after do=
ing that.

Sure. I'll do it.
Thank you very much for your comments.

Thanks,

Vadim
>=20
> thanks,
>=20
> greg k-h
