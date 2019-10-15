From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v5 11/14] software node: move small properties inline
 when copying
Date: Tue, 15 Oct 2019 11:25:53 -0700
Message-ID: <20191015182553.GG105649@dtor-ws>
References: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
 <20191011230721.206646-12-dmitry.torokhov@gmail.com>
 <20191015122028.GI32742@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191015122028.GI32742@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 15, 2019 at 03:20:28PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 11, 2019 at 04:07:18PM -0700, Dmitry Torokhov wrote:
> > When copying/duplicating set of properties, move smaller properties that
> > were stored separately directly inside property entry structures. We can
> > move:
> > 
> > - up to 8 bytes from U8 arrays
> > - up to 4 words
> > - up to 2 double words
> > - one U64 value
> > - one or 2 strings.
> 
> Can you show where you extract such values?

the "value" union's largest member is u64, which is 8 bytes. Strings are
pointers, so on 32-bit arches you can stuff 2 pointers into 8 bytes,
while on 64-bits you have space for only one.

> 
> > +	if (!dst->is_inline && dst->length <= sizeof(dst->value)) {
> > +		/* We have an opportunity to move the data inline */
> > +		const void *tmp = dst->pointer;
> > +
> 
> > +		memcpy(&dst->value, tmp, dst->length);
> 
> ...because this is strange trick.

Not sure what is so strange about it. You just take data that is stored
separately and move it into the structure, provided that it is not too
big (i.e. it does not exceed sizeof(value union) size).

> 
> > +		dst->is_inline = true;
> > +
> > +		kfree(tmp);
> > +	}
> 

Thanks.

-- 
Dmitry
