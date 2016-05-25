From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/5] asus-wmi: Create quirk for airplane_mode LED
Date: Wed, 25 May 2016 14:24:15 -0700
Message-ID: <20160525212415.GF109010@f23x64.localdomain>
References: <1454951123-27470-1-git-send-email-jprvita@endlessm.com>
 <1454951123-27470-3-git-send-email-jprvita@endlessm.com>
 <CAHR064itbc5bWLxX3DyCMmQ3n1gq5SWFhSrBpDqTu=6VjUcsWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:51890 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750738AbcEYVYQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 May 2016 17:24:16 -0400
Content-Disposition: inline
In-Reply-To: <CAHR064itbc5bWLxX3DyCMmQ3n1gq5SWFhSrBpDqTu=6VjUcsWw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, LKML <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@endlessm.com>

On Wed, May 25, 2016 at 09:13:23AM +0200, Corentin Chary wrote:
> On Mon, Feb 8, 2016 at 6:05 PM, Jo=E3o Paulo Rechi Vita <jprvita@gmai=
l.com> wrote:
> > Some Asus laptops that have an "airplane mode" indicator LED, also =
have
> > the WMI WLAN user bit set, and the following bits in their DSDT:
> >
> > Scope (_SB)
> > {
> >   (...)
> >   Device (ATKD)
> >   {
> >     (...)
> >     Method (WMNB, 3, Serialized)
> >     {
> >       (...)
> >       If (LEqual (IIA0, 0x00010002))
> >       {
> >         OWGD (IIA1)
> >         Return (One)
> >       }
> >     }
> >   }
> > }
> >
> > So when asus-wmi uses ASUS_WMI_DEVID_WLAN_LED (0x00010002) to store=
 the
> > wlan state, it drives the airplane mode indicator LED (through the =
call
> > to OWGD) in an inverted fashion: the LED is ON when airplane mode i=
s OFF
> > (since wlan is ON), and vice-versa.
> >
> > This commit creates a quirk to not register a RFKill switch at all =
for
> > these laptops, to allow the asus-wireless driver to drive the airpl=
ane
> > mode LED correctly. It also adds a match to that quirk for the Asus
> > X555UB.
>=20
> This is really something that should get merged, multiple users are
> affected by this. I do not own any of these laptops, but would there
> be a way to detect this behavior instead of having static quircks ?

I believe this is all still blocked on the underlying RFKILL support. J=
o=E3o,
correct me if I'm mistaken.

--=20
Darren Hart
Intel Open Source Technology Center
