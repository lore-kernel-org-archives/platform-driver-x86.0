From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 1/7] platform/x86: fujitsu-laptop: Define constants for
 FUNC operations
Date: Sun, 4 Mar 2018 20:44:26 +0100
Message-ID: <20180304194426.GA1428@kmp-mobile.hq.kempniu.pl>
References: <20180227211539.5708-1-kernel@kempniu.pl>
 <20180227211539.5708-2-kernel@kempniu.pl>
 <CAHp75VdDQ1xAYcXEN04kSug2sgi-G8+7PBEOC8MJSBw7gSCyRQ@mail.gmail.com>
 <20180304050813.GA3129@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180304050813.GA3129@marvin.atrad.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

> On Wed, Feb 28, 2018 at 06:08:52PM +0200, Andy Shevchenko wrote:
> > On Tue, Feb 27, 2018 at 11:15 PM, Micha?? K??pie?? <kernel@kempniu.pl> wrote:
> > > Various functions exposed by the firmware through the FUNC interface
> > > tend to use a consistent set of integers for denoting the type of
> > > operation to be performed for a specified feature.  Use named constants
> > > instead of integers in each call_fext_func() invocation in order to more
> > > clearly convey the intent of each call.
> > >
> > > Note that FUNC_FLAGS is a bit peculiar:
> > 
> > > +/* FUNC interface - operations */
> > > +#define OP_GET                         BIT(1)
> > > +#define OP_GET_CAPS                    0
> > > +#define OP_GET_EVENTS                  BIT(0)
> > > +#define OP_GET_EXT                     BIT(2)
> > > +#define OP_SET                         BIT(0)
> > > +#define OP_SET_EXT                     (BIT(2) | BIT(0))
> > 
> > Hmm... this looks unordered a bit.
> 
> It seems to be ordered alphabetically on the identifier.  Andy, is it
> preferred to order defines like this based on resolved numeric order?
 
Just to expand on what Jonathan wrote above: if you take a peek at the
end result of the patch series, you will notice a pattern: constants in
each section are ordered alphabetically by their name.  I wanted all
sections to be consistently ordered.  If you would rather have me order
things by the bit index, sure, no problem, just please note that the
order above is not accidental.

> There is a lack of apparent consistency in the numeric mapping; for example,
> OP_SET_EXT includes the OP_SET bit, but OP_GET_EXT does not include the
> OP_GET bit.  However, after inspecting the code I think this is simply
> reflecting what the hardware expects.

Exactly, I could not find any rule which would explain the way the
integers hardcoded into the various firmware functions could be mapped
to their purpose.  The whole point of this series is just to give
someone looking at the module code a quick hint about the purpose of
each call; with plain integers used instead of constants, these calls
look a bit too arbitrary for my taste.

> > And plain 0 doesn't look right in this concept (something like (0 <<
> > 0) would probably do it).
> 
> Given that all other definitions are in terms of BIT(), to my eye "(0 << 0)"
> looks as much out of place as plain "0".  However, if the convention in this
> case would be to use the former then I have no objections.  I presume the
> "(0 << 0)" idea comes from the fact that BIT() ultimately expands to some
> form of shift.

Yes, I would guess so.  The syntax suggested by Andy looked odd and
superfluous to me at first, but grepping the tree for this construct
seems to suggest that it is a pretty common thing.  So no problem, I
will tweak this in v2.  I understand I should apply the same concept in
these cases:

+/* Constants related to FUNC_BACKLIGHT */
+#define FEAT_BACKLIGHT_POWER		BIT(2)
+#define STATE_BACKLIGHT_OFF		(BIT(0) | BIT(1))
+#define STATE_BACKLIGHT_ON		0

+#define FEAT_RADIO_LED			BIT(5)
+#define STATE_RADIO_LED_OFF		0
+#define STATE_RADIO_LED_ON		BIT(5)

Right?

-- 
Best regards,
Michał Kępień
