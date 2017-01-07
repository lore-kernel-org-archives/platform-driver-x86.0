From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: rework logolamp_set() to
 properly handle errors
Date: Sat, 7 Jan 2017 11:31:24 +1030
Message-ID: <20170107010124.GA4631@marvin.atrad.com.au>
References: <20170105131129.5750-1-kernel@kempniu.pl>
 <CAHp75VfGOW9sD-SLssDqvzbqEmw=21JPZAz_stgm2pRpm5GNrQ@mail.gmail.com>
 <20170106192431.GB756@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:59260 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1162087AbdAGBC1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Jan 2017 20:02:27 -0500
Content-Disposition: inline
In-Reply-To: <20170106192431.GB756@kmp-mobile.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jan 06, 2017 at 08:24:31PM +0100, Micha?? K??pie?? wrote:
> > On Thu, Jan 5, 2017 at 3:11 PM, Micha?? K??pie?? <kernel@kempniu.pl> wrote:
> > > Potential errors returned by some call_fext_func() calls inside
> > > logolamp_set() are currently ignored.  Rework logolamp_set() to properly
> > > handle them.  This causes one more call_fext_func() call to be made in
> > > the LED_OFF case, though one could argue that this is logically the
> > > right thing to do (even though the extra call is not needed to shut the
> > > LED off).
> > >
> > > Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>
> > > ---
> > > This is a follow-up to a recent patch, "platform/x86: fujitsu-laptop:
> > > use brightness_set_blocking for LED-setting callbacks" and thus needs
> > > the latter to be applied first (currently it is already applied in
> > > testing).
> > >
> > > Instead of sticking "if (ret < 0) return ret;" in two branches I decided
> > > to restructure logolamp_set() for improved clarity and also to make it
> > > resemble logolamp_get() a bit more.
> > >
> > >  drivers/platform/x86/fujitsu-laptop.c | 20 ++++++++++++--------
> > >  1 file changed, 12 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> > > index b725a907a91f..12f7a8346dd0 100644
> > > --- a/drivers/platform/x86/fujitsu-laptop.c
> > > +++ b/drivers/platform/x86/fujitsu-laptop.c
> > > @@ -271,15 +271,19 @@ static int call_fext_func(int cmd, int arg0, int arg1, int arg2)
> > >  static int logolamp_set(struct led_classdev *cdev,
> > >                                enum led_brightness brightness)
> > >  {
> > > -       if (brightness >= LED_FULL) {
> > > -               call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, FUNC_LED_ON);
> > > -               return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, FUNC_LED_ON);
> > > -       } else if (brightness >= LED_HALF) {
> > > -               call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, FUNC_LED_ON);
> > > -               return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, FUNC_LED_OFF);
> > > -       } else {
> > > -               return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, FUNC_LED_OFF);
> > 
> > > +       int ret, poweron = FUNC_LED_OFF, always = FUNC_LED_OFF;
> > > +
> > > +       if (brightness >= LED_HALF) {
> > > +               poweron = FUNC_LED_ON;
> > > +               if (brightness >= LED_FULL)
> > > +                       always = FUNC_LED_ON;
> > >         }
> > 
> > But if you set ON by default the above could be written like
> > 
> >     if (brightness < LED_FULL)
> >         always = FUNC_LED_OFF;
> > 
> >     if (brightness < LED_HALF)
> >         poweron = FUNC_LED_OFF;
> 
> Ah, neat, thanks.  Jonathan, assuming you also like this, I will later
> submit v2 using this approach.

Yes, I like this.  It does in fact make the intent clearer.

The subsequent suggestion to split the "int ret, poweron ..." line is also
worthwhile since it makes one less likely to miss the declaration of "ret" at
the start.

Regards
  jonathan
