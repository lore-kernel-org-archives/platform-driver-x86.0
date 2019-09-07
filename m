From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/3] software node: implement reference properties
Date: Sat, 7 Sep 2019 21:03:48 +0300
Message-ID: <20190907180348.GM2680@smile.fi.intel.com>
References: <20190906222611.223532-1-dmitry.torokhov@gmail.com>
 <20190907160819.GH2680@smile.fi.intel.com>
 <20190907163240.GA27112@dtor-ws>
 <20190907171251.GL2680@smile.fi.intel.com>
 <20190907173724.GA145199@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190907173724.GA145199@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Sep 07, 2019 at 10:37:24AM -0700, Dmitry Torokhov wrote:
> On Sat, Sep 07, 2019 at 08:12:51PM +0300, Andy Shevchenko wrote:
> > On Sat, Sep 07, 2019 at 09:32:40AM -0700, Dmitry Torokhov wrote:
> > > On Sat, Sep 07, 2019 at 07:08:19PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Sep 06, 2019 at 03:26:09PM -0700, Dmitry Torokhov wrote:
> > 
> > > > > +	} else if (src->type == DEV_PROP_REF) {
> > > > > +		/* All reference properties must be arrays */
> > > > > +		return -EINVAL;
> > > > 
> > > > Hmm... What about to duplicate pointer under value union and use is_array to
> > > > distinguish which one to use? Because...
> > > 
> > > Then we have to special-case copying this entry, similar to the pains we
> > > are going with the strings.
> > 
> > I can't see it as a pain. Simple do the same kmemdup() for the case when
> > is_array = false and DEV_TYPE_REF?
> 
> And then you need to make sure it is freed on error paths and when we
> remove property entries. This requires more checks and code. In contrast
> we already know how to handle out of line objects of arbitrary size.

We can put it one level up to be a sibling to value / pointer unions.
In that case is_array can be anything (we just don't care).

Actually strings aren't inlined.

> > By the way, don't we need to update property_entry_{get,set}_pointer()?
> 
> I do not see these, where are they?

swnode.c. I meant property_{get,set}_pointer().

> > > > > +	.is_array = true,						\
> > > > 
> > > > I really don't like this "cheating".
> > > 
> > > This is not cheating. Any single value can be represented as an array of
> > > one element. Actually, the only reason we have this "is_array" business
> > > is because for scalar values and short strings it is much cheaper to
> > > store single value in-line instead of out of line + pointer, especially
> > > on 64 bit arches.
> > 
> > Yes, and this is a lot of benefit!
> 
> Yes, nobody argues against it. Here however we are dealing with a larger
> structure. There is absolutely no benefit of trying to separate single
> value vs array here.

Thus, moving to upper layer makes more sense. Right?

> > > If you want we can change is_array into is_inline.
> > 
> > Nope, is_array is exactly what it tells us about the content. Its functional
> > load is to distinguish which union (value vs. pointer) we are using.
> 
> No, it signifies whether the value is stored within property entry or
> outside. I can fit probably 8 bytes arrays into property entry
> structure, in which case is_array will definitely not reflect the data
> type.

Nope, since strings are not inlined AFAICS.

> It is the type-specific accessors that know how to parse and fetch data
> from properties.

-- 
With Best Regards,
Andy Shevchenko
