From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2 1/3] software node: implement reference properties
Date: Sat, 7 Sep 2019 09:32:40 -0700
Message-ID: <20190907163240.GA27112@dtor-ws>
References: <20190906222611.223532-1-dmitry.torokhov@gmail.com>
 <20190907160819.GH2680@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190907160819.GH2680@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Sep 07, 2019 at 07:08:19PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 06, 2019 at 03:26:09PM -0700, Dmitry Torokhov wrote:
> > It is possible to store references to software nodes in the same fashion as
> > other static properties, so that users do not need to define separate
> > structures:
> > 
> > static const struct software_node gpio_bank_b_node = {
> > 	.name = "B",
> > };
> > 
> > static const struct property_entry simone_key_enter_props[] = {
> > 	PROPERTY_ENTRY_U32("linux,code", KEY_ENTER),
> > 	PROPERTY_ENTRY_STRING("label", "enter"),
> > 	PROPERTY_ENTRY_REF("gpios", &gpio_bank_b_node, 123, GPIO_ACTIVE_LOW),
> > 	{ }
> > };
> > 
> 
> Thanks for an update, my comments below.
> 
> > +	} else if (src->type == DEV_PROP_REF) {
> > +		/* All reference properties must be arrays */
> > +		return -EINVAL;
> 
> Hmm... What about to duplicate pointer under value union and use is_array to
> distinguish which one to use? Because...

Then we have to special-case copying this entry, similar to the pains we
are going with the strings.

> 
> 
> > @@ -240,6 +254,7 @@ struct property_entry {
> >  			const u32 *u32_data;
> >  			const u64 *u64_data;
> >  			const char * const *str;
> > +			const struct software_node_ref_args *ref;
> >  		} pointer;
> 
> > +#define PROPERTY_ENTRY_REF(_name_, _ref_, ...)				\
> > +(struct property_entry) {						\
> > +	.name = _name_,							\
> 
> > +	.length = sizeof(struct software_node_ref_args),		\
> 
> Is it correct?

Yes, we length is element size * number of elements.

> 
> > +	.type = DEV_PROP_REF,						\
> 
> > +	.is_array = true,						\
> 
> I really don't like this "cheating".

This is not cheating. Any single value can be represented as an array of
one element. Actually, the only reason we have this "is_array" business
is because for scalar values and short strings it is much cheaper to
store single value in-line instead of out of line + pointer, especially
on 64 bit arches.

If you want we can change is_array into is_inline.

Thanks.

-- 
Dmitry
