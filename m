From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v3 03/13] software node: get rid of property_set_pointer()
Date: Mon, 9 Sep 2019 06:48:07 -0700
Message-ID: <20190909134807.GD145199@dtor-ws>
References: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
 <20190909081557.93766-4-dmitry.torokhov@gmail.com>
 <20190909095505.GQ2680@smile.fi.intel.com>
 <20190909101555.GC145199@dtor-ws>
 <20190909113652.GX2680@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190909113652.GX2680@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 09, 2019 at 02:36:52PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 09, 2019 at 03:15:55AM -0700, Dmitry Torokhov wrote:
> > On Mon, Sep 09, 2019 at 12:55:05PM +0300, Andy Shevchenko wrote:
> > > On Mon, Sep 09, 2019 at 01:15:47AM -0700, Dmitry Torokhov wrote:
> > > > Instead of explicitly setting values of integer types when copying property
> > > > entries lets just copy entire value union when processing non-array values.
> > > > 
> > > > When handling array values assign the pointer there using the newly introduced
> > > > "raw" pointer union member. This allows us to remove property_set_pointer().
> > > 
> > > Is this reincarnation of 318a19718261?
> > > Have you read 63dcc7090137?
> > 
> > Okay, I think if I squash this and the followup patch to
> > property_get_data() then we'll only go through the "raw" pointer to get
> > to the non-inline data and therefore we will not have the union aliasing
> > issue.
> > 
> > The in-line values never change their type when storing/accessing.
> 
> It might work, though it prevents to do type checking at compile time. So,
> basically something like
> 
> 	struct obscure_things {
> 		u8 *prop_array_val;
> 		bla bla bla
> 	};
> 
> 	struct property_entry entry;
> 	struct obscure_things things;
> 	...
> 	entry.pointer.raw = &things;
> 
> which shouldn't be possible.

I think type checking is a red herring as we still can't validate the
type. I believe the answer here is to not allow external users to poke
in property_entry and use PROPERTY_ENTRY_XXX macros to construct
entires, as I have done for the Apple EFI driver.

> 
> I dunno what others think about your proposal.


Thanks.

-- 
Dmitry
