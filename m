From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/3] software node: implement reference properties
Date: Sat, 7 Sep 2019 19:08:19 +0300
Message-ID: <20190907160819.GH2680@smile.fi.intel.com>
References: <20190906222611.223532-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190906222611.223532-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Sep 06, 2019 at 03:26:09PM -0700, Dmitry Torokhov wrote:
> It is possible to store references to software nodes in the same fashion as
> other static properties, so that users do not need to define separate
> structures:
> 
> static const struct software_node gpio_bank_b_node = {
> 	.name = "B",
> };
> 
> static const struct property_entry simone_key_enter_props[] = {
> 	PROPERTY_ENTRY_U32("linux,code", KEY_ENTER),
> 	PROPERTY_ENTRY_STRING("label", "enter"),
> 	PROPERTY_ENTRY_REF("gpios", &gpio_bank_b_node, 123, GPIO_ACTIVE_LOW),
> 	{ }
> };
> 

Thanks for an update, my comments below.

> +	} else if (src->type == DEV_PROP_REF) {
> +		/* All reference properties must be arrays */
> +		return -EINVAL;

Hmm... What about to duplicate pointer under value union and use is_array to
distinguish which one to use? Because...


> @@ -240,6 +254,7 @@ struct property_entry {
>  			const u32 *u32_data;
>  			const u64 *u64_data;
>  			const char * const *str;
> +			const struct software_node_ref_args *ref;
>  		} pointer;

> +#define PROPERTY_ENTRY_REF(_name_, _ref_, ...)				\
> +(struct property_entry) {						\
> +	.name = _name_,							\

> +	.length = sizeof(struct software_node_ref_args),		\

Is it correct?

> +	.type = DEV_PROP_REF,						\

> +	.is_array = true,						\

I really don't like this "cheating".

> +	.type = DEV_PROP_REF,						\
> +	.pointer.ref = &(const struct software_node_ref_args) {		\
> +		.node = _ref_,						\

> +		.nargs = ARRAY_SIZE(((u64[]){ 0, ##__VA_ARGS__ })) - 1,	\

Seems like you can drop pair of parentheses.

> +		.args = { __VA_ARGS__ },				\
> +	},								\
> +}

-- 
With Best Regards,
Andy Shevchenko
