From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 1/3] software node: implement reference properties
Date: Fri, 6 Sep 2019 15:34:26 -0700
Message-ID: <20190906223426.GT187474@dtor-ws>
References: <20190906043809.18990-1-dmitry.torokhov@gmail.com>
 <20190906122743.GQ2680@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190906122743.GQ2680@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Sep 06, 2019 at 03:27:43PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 05, 2019 at 09:38:07PM -0700, Dmitry Torokhov wrote:
> > It is possible to store references to software nodes in the same fashion as
> > other static properties, so that users do not need to define separate
> > structures:
> > 
> > const struct software_node gpio_bank_b_node = {
> > 	.name = "B",
> > };
> 
> Why this can't be __initconst?

It may or it may not. I'll remove __inticonst from below as well to not
confuse things.

> 
> > const struct property_entry simone_key_enter_props[] __initconst = {
> > 	PROPERTY_ENTRY_U32("linux,code", KEY_ENTER),
> > 	PROPERTY_ENTRY_STRING("label", "enter"),
> > 	PROPERTY_ENTRY_REF("gpios", &gpio_bank_b_node, 123, GPIO_ACTIVE_LOW),
> > 	{ }
> > };
> 
> So it's basically mimics the concept of phandle, right?

Yes.

> 
> > +		ref_args = prop->is_array ?
> > +				&prop->pointer.ref[index] : &prop->value.ref;
> 
> Better to do if with explicit 'if ()' as it's done in the rest of the code.
> 
> 	if (prop->is_array)
> 		ref_args = ...;
> 	else
> 		ref_args = ...;

OK, it will be gone actually.

> 
> > -	DEV_PROP_MAX,
> > +	DEV_PROP_MAX
> 
> It seems it wasn't ever used, so, can be dropped completely.

OK.

> 
> > @@ -240,6 +255,7 @@ struct property_entry {
> >  			const u32 *u32_data;
> >  			const u64 *u64_data;
> >  			const char * const *str;
> > +			const struct software_node_ref_args *ref;
> >  		} pointer;
> >  		union {
> >  			u8 u8_data;
> > @@ -247,6 +263,7 @@ struct property_entry {
> >  			u32 u32_data;
> >  			u64 u64_data;
> >  			const char *str;
> > +			struct software_node_ref_args ref;
> 
> Hmm... This bumps the size of union a lot for each existing property_entry.
> Is there any other way? Maybe we can keep pointer and allocate memory for it
> when copying?

Right, I think we can always store references as arrays, even when we
only need single entry, thus we do not need to increase the size of the
structure.

I just posted v2 implementing that, please take another look.

Thanks.

-- 
Dmitry
