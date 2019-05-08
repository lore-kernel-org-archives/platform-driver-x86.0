From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: pmc_atom: Add Lex 3I380D industrial PC to
 critclk_systems DMI table
Date: Wed, 8 May 2019 16:23:56 -0700
Message-ID: <20190508232356.GA33357@wrath>
References: <20190429150135.15070-1-hdegoede@redhat.com>
 <CAHp75VeE=88mCcgVx3Y3PQJPQ819Z7=3s=jRGz1y=t09phk=rA@mail.gmail.com>
 <085c5b6e-d220-ebd1-38d2-def7efca24b8@redhat.com>
 <CAHp75Vfe9uK_b_V+uG29wb1L6J7u1hpbU+P4beXso9KNPM+8Rg@mail.gmail.com>
 <568ba27d-a6a5-b158-bab1-f22cd8ccb34e@redhat.com>
 <155726027056.14659.1724431433952718602@swboyd.mtv.corp.google.com>
 <10c8864c-6ee7-4dfd-6274-b1996e767653@redhat.com>
 <CAHp75VdnxRQi3X6J9hLGUjGsOYTkjoPN5MakJc=mUSumoC+wag@mail.gmail.com>
 <e9c92d24-9044-c37d-3f18-4884d97047d5@redhat.com>
 <20190508225522.GA32286@wrath>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190508225522.GA32286@wrath>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Andy Shevchenko <andy@infradead.org>, Kai Heng Feng <kai.heng.feng@canonical.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Semyon Verchenko <semverchenko@factor-ts.ru>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, May 08, 2019 at 03:55:22PM -0700, Darren Hart wrote:
> On Wed, May 08, 2019 at 11:20:52AM +0200, Hans de Goede wrote:
> > Hi,
> > 
> > On 08-05-19 10:42, Andy Shevchenko wrote:
> > > On Wed, May 8, 2019 at 10:48 AM Hans de Goede <hdegoede@redhat.com> wrote:
> > > > On 07-05-19 22:17, Stephen Boyd wrote:
> > > > > Quoting Hans de Goede (2019-05-06 08:05:42)
> > > 
> > > > > I guess this is urgent?
> > > > 
> > > > Somewhat, getting this into e.g. rc2 would be fine too, waiting till 5.3
> > > > would be bad.
> > > 
> > > So, I can do it as a fixes for rc2, just ping me after merge window.
> > 
> > Ok, will do.
> 
> Andy, what is the issue here? If the dependency is in v5.1 we can do a "merge
> --ff-only v5.1" in our for-next branch in order to pull it in, that would be the
> same as an immutable branch basically.
> 

A simpler solution for this case would be to issue two PRs to Linus from two
different branches. Other subsystems send topic branches, so this isn't out of
the ordinary.

I have merged the two patches in question from Hans and Steffen to for-next-2.

We could send two PRs back to back, with a note to Linus why this is a bit
different than usual, and then come back together in our for-next and fixes
branches once both are merged and continue as usual.

Any concerns with this approach?

-- 
Darren Hart
VMware Open Source Technology Center
