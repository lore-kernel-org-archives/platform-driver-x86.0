From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v4 06/14] software node: get rid of property_set_pointer()
Date: Wed, 11 Sep 2019 01:37:25 -0700
Message-ID: <20190911083725.GF145199@dtor-ws>
References: <20190911051231.148032-1-dmitry.torokhov@gmail.com>
 <20190911051231.148032-7-dmitry.torokhov@gmail.com>
 <CAHp75Ve5NvhzOQ96OgbPh1LdsAtvk+A=aVu-oXKdhnB4PpL_og@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Ve5NvhzOQ96OgbPh1LdsAtvk+A=aVu-oXKdhnB4PpL_og@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 11, 2019 at 11:29:10AM +0300, Andy Shevchenko wrote:
> On Wed, Sep 11, 2019 at 8:15 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Instead of explicitly setting values of integer types when copying
> > property entries lets just copy entire value union when processing
> > non-array values.
> >
> > When handling array values assign the pointer there using the newly
> > introduced "raw" pointer union member. This allows us to remove
> > property_set_pointer().
> >
> > In property_get_pointer() we do not need to handle each data type
> > separately, we can simply return either the raw pointer or pointer to
> > values union.
> 
> Same as before, typechecking is good thing to have for my point of view.
> Others may have different opinions.

OK, I'll just point out that typechecking is a red herring here as
everything was and still is accessed through void pointers, and we
trusted the type set on property. Users of static properties should use
PROPERTY_ENTRY_XXX() for initialization and do not poke into struct
property_entry directly.

I suppose it is up to Rafael to decide here.

Thanks.

-- 
Dmitry
