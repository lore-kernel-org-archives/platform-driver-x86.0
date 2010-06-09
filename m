From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [GIT PULL] x86 platform driver updates for 2.6.35-rc3
Date: Wed, 9 Jun 2010 09:31:18 -0700
Message-ID: <20100609093118.784f3683@virtuousgeek.org>
References: <20100608221901.GA25294@srcf.ucam.org>
	<alpine.LFD.2.00.1006081806040.4506@i5.linux-foundation.org>
	<20100608182456.3e681359@virtuousgeek.org>
	<alpine.LFD.2.00.1006081855170.4506@i5.linux-foundation.org>
	<AANLkTin45ibtZoThRwOG3eTjFmT0LJ4gKS-ExXqpKx2v@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTin45ibtZoThRwOG3eTjFmT0LJ4gKS-ExXqpKx2v@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Matthew Garrett <mjg59@srcf.ucam.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 9 Jun 2010 12:03:55 +1000
Dave Airlie <airlied@gmail.com> wrote:

> On Wed, Jun 9, 2010 at 11:57 AM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> >
> > On Tue, 8 Jun 2010, Jesse Barnes wrote:
> >>
> >> FWIW this is the "make ironlake go fast" driver. =C2=A0It interact=
s with the
> >> i915 driver to increase graphics performance significantly. =C2=A0=
But yeah,
> >> Matthew and I didn't get it integrated into his tree in time for t=
he
> >> merge window, so I understand if you don't want it right now.
> >
> > I'm not great at all the intel code-names. Is ironlake the expected=
-Q4
> > on-die GPU or the current one?
> >
> > Not that I'd prefer to pull it even if it's the current one, but if=
 it's
> > the next-gen one then we're in even less of a hurry, I think.
> >
>=20
> Its probably the one on your desk, its at least the one in the two
> laptops on mine.
>=20
> So definitely now-gen.

Right, Ironlake is the class of graphics chips found in Core i3/5/7
with HD graphics, which are shipping in volume now.

The IPS driver is mostly standalone, but it does make some calls into
the i915 driver to increase or decrease available graphics frequencies,
so it's not a clear cut case of a new driver and does introduce some
risk.

--=20
Jesse Barnes, Intel Open Source Technology Center
