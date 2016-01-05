From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/2] Asus Wireless Radio Control driver
Date: Tue, 5 Jan 2016 09:18:18 -0800
Message-ID: <20160105171818.GF4219@malice.jf.intel.com>
References: <1452000361-13640-1-git-send-email-jprvita@endlessm.com>
 <CAHp75VeFvqvWNcNtOLnzoxsW+MRk8G__QQjZ73H4S-vz9oR9og@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VeFvqvWNcNtOLnzoxsW+MRk8G__QQjZ73H4S-vz9oR9og@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 05, 2016 at 03:58:46PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 5, 2016 at 3:25 PM, Jo=E3o Paulo Rechi Vita <jprvita@gmai=
l.com> wrote:
> > This series implements the driver for the "Asus Wireless Radio Cont=
rol" device,
> > as named on the vendor website, which handles notifications from th=
e airplane
> > mode hotkey and drives the airplane mode indicator LED. This device=
 appears in
> > the DSDT as "ASHS".
> >
> > I decided to split the series and move the commits that drive the L=
ED to a
> > separate series, so this part can be merged without waiting for fee=
dback on the
> > new airplane mode RFKill LED trigger.
>=20
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>=20
> (I'm fine with current version but please take into consideration
> comments to the first patch, most important 'default m' thing)

Agreed on the 'default m' thing. Thank you for the review Andy.

--=20
Darren Hart
Intel Open Source Technology Center
