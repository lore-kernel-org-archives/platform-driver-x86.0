From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v5 10/14] software node: rename is_array to is_inline
Date: Tue, 15 Oct 2019 11:22:06 -0700
Message-ID: <20191015182206.GF105649@dtor-ws>
References: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
 <20191011230721.206646-11-dmitry.torokhov@gmail.com>
 <20191014073720.GH32742@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191014073720.GH32742@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 14, 2019 at 10:37:20AM +0300, Andy Shevchenko wrote:
> On Fri, Oct 11, 2019 at 04:07:17PM -0700, Dmitry Torokhov wrote:
> > We do not need a special flag to know if we are dealing with an array,
> > as we can get that data from ratio between element length and the data
> > size, however we do need a flag to know whether the data is stored
> > directly inside property_entry or separately.
> 
> > -	if (prop->is_array)
> > +	if (!prop->is_inline)
> 
> > -	if (p->is_array) {
> > +	if (!p->is_inline) {
> 
> > -	if (src->is_array) {
> > +	if (!src->is_inline) {
> 
> May we have positive conditionals instead?

I was trying to limit the context churn. I can definitely change
property_get_pointer(), but the other 2 I think are better in the
current form.

> 
> > + * @is_inline: True when the property value is stored directly in
> 
> I think word 'directly' is superfluous here.
> Or, perhaps, 'stored directly' -> 'embedded'

I'm OK with "embedded".

> 
> > + *     &struct property_entry instance.
> 
> > + * @pointer: Pointer to the property when it is stored separately from
> > + *     the &struct property_entry instance.
> 
> 'separately from' -> 'outside' ?

Umm, I think I prefer "separately" actually.

> 
> > + * @value: Value of the property when it is stored inline.
> 
> 'stored inline' -> 'embedded in the &struct...' ?

I was trying to have a link "stored inline" -> "is_inline".

Do we want to change the flag to be "is_embedded"?

Thanks.

-- 
Dmitry
