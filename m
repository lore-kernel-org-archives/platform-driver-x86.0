From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 1/7] platform/x86: fujitsu-laptop: Define constants for
 FUNC operations
Date: Mon, 5 Mar 2018 09:19:24 +1030
Message-ID: <20180304224924.GA29081@marvin.atrad.com.au>
References: <20180227211539.5708-1-kernel@kempniu.pl>
 <20180227211539.5708-2-kernel@kempniu.pl>
 <CAHp75VdDQ1xAYcXEN04kSug2sgi-G8+7PBEOC8MJSBw7gSCyRQ@mail.gmail.com>
 <20180304050813.GA3129@marvin.atrad.com.au>
 <20180304194426.GA1428@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180304194426.GA1428@kmp-mobile.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Mar 04, 2018 at 08:44:26PM +0100, Micha?? K??pie?? wrote:
> > On Wed, Feb 28, 2018 at 06:08:52PM +0200, Andy Shevchenko wrote:
> > > And plain 0 doesn't look right in this concept (something like (0 <<
> > > 0) would probably do it).
> > 
> > Given that all other definitions are in terms of BIT(), to my eye "(0 << 0)"
> > looks as much out of place as plain "0".  However, if the convention in this
> > case would be to use the former then I have no objections.  I presume the
> > "(0 << 0)" idea comes from the fact that BIT() ultimately expands to some
> > form of shift.
> 
> Yes, I would guess so.  The syntax suggested by Andy looked odd and
> superfluous to me at first, but grepping the tree for this construct
> seems to suggest that it is a pretty common thing.  So no problem, I
> will tweak this in v2.  I understand I should apply the same concept in
> these cases:
> 
> +/* Constants related to FUNC_BACKLIGHT */
> +#define FEAT_BACKLIGHT_POWER		BIT(2)
> +#define STATE_BACKLIGHT_OFF		(BIT(0) | BIT(1))
> +#define STATE_BACKLIGHT_ON		0
> 
> +#define FEAT_RADIO_LED			BIT(5)
> +#define STATE_RADIO_LED_OFF		0
> +#define STATE_RADIO_LED_ON		BIT(5)
> 
> Right?

I suspect so.

Regards
  jonathan
