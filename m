From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/3] software node: implement reference properties
Date: Mon, 9 Sep 2019 13:09:18 +0300
Message-ID: <20190909100918.GS2680@smile.fi.intel.com>
References: <20190906222611.223532-1-dmitry.torokhov@gmail.com>
 <20190907160819.GH2680@smile.fi.intel.com>
 <20190907163240.GA27112@dtor-ws>
 <20190907171251.GL2680@smile.fi.intel.com>
 <20190907173724.GA145199@dtor-ws>
 <20190907180348.GM2680@smile.fi.intel.com>
 <20190907182335.GB145199@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190907182335.GB145199@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Sep 07, 2019 at 11:23:35AM -0700, Dmitry Torokhov wrote:
> On Sat, Sep 07, 2019 at 09:03:48PM +0300, Andy Shevchenko wrote:
> > On Sat, Sep 07, 2019 at 10:37:24AM -0700, Dmitry Torokhov wrote:
> > > On Sat, Sep 07, 2019 at 08:12:51PM +0300, Andy Shevchenko wrote:
> > > > On Sat, Sep 07, 2019 at 09:32:40AM -0700, Dmitry Torokhov wrote:
> > > > > On Sat, Sep 07, 2019 at 07:08:19PM +0300, Andy Shevchenko wrote:
> > > > > > On Fri, Sep 06, 2019 at 03:26:09PM -0700, Dmitry Torokhov wrote:
> > > > 
> > > > > > > +	} else if (src->type == DEV_PROP_REF) {
> > > > > > > +		/* All reference properties must be arrays */
> > > > > > > +		return -EINVAL;
> > > > > > 
> > > > > > Hmm... What about to duplicate pointer under value union and use is_array to
> > > > > > distinguish which one to use? Because...
> > > > > 
> > > > > Then we have to special-case copying this entry, similar to the pains we
> > > > > are going with the strings.
> > > > 
> > > > I can't see it as a pain. Simple do the same kmemdup() for the case when
> > > > is_array = false and DEV_TYPE_REF?
> > > 
> > > And then you need to make sure it is freed on error paths and when we
> > > remove property entries. This requires more checks and code. In contrast
> > > we already know how to handle out of line objects of arbitrary size.
> > 
> > We can put it one level up to be a sibling to value / pointer unions.
> > In that case is_array can be anything (we just don't care).
> 
> I think it would be better if you sketched out your proposed data
> structure(s) so we are talking about the same things. But please note
> that when you are dealing with property arrays we need to keep the easy
> way of defining them, which means we should not be splitting individual
> entries.

This one:

        union {
                union {
                        const u8 *u8_data;
                        const u16 *u16_data;
                        const u32 *u32_data;
                        const u64 *u64_data;
                        const char * const *str;
                } pointer;
                union {
                        u8 u8_data;
                        u16 u16_data;
                        u32 u32_data;
                        u64 u64_data;
                        const char *str;
                } value;
		struct ... *ref;
        };

-- 
With Best Regards,
Andy Shevchenko
