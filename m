From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: fix phantom kbd backlight on
 Inspiron 10xx
Date: Wed, 25 Sep 2019 10:21:49 +0200
Message-ID: <20190925082149.yjhmmb64i4h6sddi@pali>
References: <156824368856.28378.14511879419677114177@WARFSTATION>
 <20190912073358.n5bxqosowhky5uhb@pali>
 <156882055514.9370.16951540573597044820@WARFSTATION>
 <20190922134323.mowwoyeuqoalpwsg@pali>
 <baba1f72c68f4699955d2b7a52df65e1@AUSX13MPC105.AMER.DELL.COM>
 <CAHp75VfjhuFzTRg7X_ici6ACj54sQKH0mR8x9M-XAYk5cbTQ7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VfjhuFzTRg7X_ici6ACj54sQKH0mR8x9M-XAYk5cbTQ7g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mario Limonciello <Mario.Limonciello@dell.com>, Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wednesday 25 September 2019 11:07:35 Andy Shevchenko wrote:
> On Mon, Sep 23, 2019 at 4:24 PM <Mario.Limonciello@dell.com> wrote:
> > > From: Pali Rohár <pali.rohar@gmail.com>
> > > Sent: Sunday, September 22, 2019 8:43 AM
> > > To: Pacien TRAN-GIRARD
> > > Cc: Matthew Garrett; Darren Hart; Andy Shevchenko; platform-driver-
> > > x86@vger.kernel.org; linux-kernel@vger.kernel.org; Limonciello, Mario
> > > Subject: Re: [PATCH] platform/x86: dell-laptop: fix phantom kbd backlight on
> > > Inspiron 10xx
> 
> > > We need to wait what Mario wrote about this particular problem.
> > >
> >
> > I agree an Inspiron is unlikely to be updated 9 years later.  I think the right thing
> > to do in this instance is to blacklist this particular platform in kernel driver.
> 
> Does it mean you are okay with the proposed patch? Can you give your tag then?

I would rather use different name as kbd_phantom_backlight. E.g.
lbd_broken_backlight or something which indicates non-working / disabled
support.

Also in commit message is written that problem is with KBD_LED_OFF_TOKEN
and KBD_LED_ON_TOKEN tokens, but proposed patch does not blacklist these
tokens, but rather turn off whole kbd functionality. So proposed patch
does not patch commit message, nor explain it.

-- 
Pali Rohár
pali.rohar@gmail.com
