From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 5/5] dell-rbtn: Add a comment about the XPS 13 9350
Date: Fri, 26 Feb 2016 12:13:10 -0800
Message-ID: <20160226201310.GC20943@dvhart-mobl5.amr.corp.intel.com>
References: <cover.1455553470.git.luto@kernel.org>
 <17238db9f090e8b2c80756ccd4bcd8f4f1e3bfab.1455553470.git.luto@kernel.org>
 <20160217111634.GQ1476@pali>
 <56C47090.1050106@dell.com>
 <20160223120100.GN4606@pali>
 <CALCETrU98nEhLQSr7M+DsvD2Fgk5K0GFPFBoLE8_k-_ZRg72mA@mail.gmail.com>
 <20160225104528.GT4606@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:52175 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933580AbcBZUNT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 26 Feb 2016 15:13:19 -0500
Content-Disposition: inline
In-Reply-To: <20160225104528.GT4606@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Jon Eyolfson <jon@eyl.io>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>, Matthew Garrett <mjg59@srcf.ucam.org>

On Thu, Feb 25, 2016 at 11:45:28AM +0100, Pali Roh=E1r wrote:
> On Tuesday 23 February 2016 09:35:47 Andy Lutomirski wrote:
> > On Feb 23, 2016 4:01 AM, "Pali Roh=E1r" <pali.rohar@gmail.com> wrot=
e:
> > >
> > > On Wednesday 17 February 2016 07:07:28 Mario Limonciello wrote:
> > > >
> > > >
> > > > On 02/17/2016 05:16 AM, Pali Roh=E1r wrote:
> > > > > On Monday 15 February 2016 08:32:37 Andy Lutomirski wrote:
> > > > >> On the XPS 13 9350, the dell-rbtn mechanism has a new device=
 id, and
> > > > >> the DSDT turns it off if a new enough _OSI is supported.  Ad=
d a
> > > > >> comment about why we don't bother supporting it.
> > > > >>
> > > > >> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> > > > >> ---
> > > > >>  drivers/platform/x86/dell-rbtn.c | 15 +++++++++++++++
> > > > >>  1 file changed, 15 insertions(+)
> > > > >>

> > > Andy, can you look at it and try identify where is the problem?
> >=20
> > I think it's straightforward.  If we identify as Windows 7 and enab=
le
> > this driver then, when we press the wireless button, dell-rbtn
> > switches its state *and* NetworkManager gets KEY_RFKILL from intel-=
hid
> > and changes its state.  Then you can tell NetworkManager to turn wi=
fi
> > on using the menu, at which point dell-rbtn is off but NM's softwar=
e
> > state is on.  Then you press the button again, turning on dell-rbtn
> > but turning NM off again.  The result is that the last button press
> > direct work as expected.
> >=20
> > I haven't verified that this is actually what happens, but it's
> > certainly the case that a button that triggers a state toggle shoul=
d
> > only change the state by *one* mechanism.
> >=20
> > Presumably this works on Windows 7 because either there is no
> > equivalent of intel-hid or because the DSDT turns it off -- I haven=
't
> > checked which is the case.
> >=20
> > --Andy
>=20
> Understood, this is just big API mess in Dell APCI/EC/firmware and al=
so
> our kernel implementation in (dell-(laptop|wmi|rbtn)|intel-hid) drive=
rs
> is not ideal and clean...
>=20
> Darren, add my Acked-by also for this patch (if you already have not
> done it).

This is done and in next already.

>=20
> --=20
> Pali Roh=E1r
> pali.rohar@gmail.com
>=20

--=20
Darren Hart
Intel Open Source Technology Center
