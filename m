From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 06/14] software node: get rid of property_set_pointer()
Date: Tue, 15 Oct 2019 15:09:49 +0300
Message-ID: <20191015120949.GH32742@smile.fi.intel.com>
References: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
 <20191011230721.206646-7-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191011230721.206646-7-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Oct 11, 2019 at 04:07:13PM -0700, Dmitry Torokhov wrote:
> Instead of explicitly setting values of integer types when copying
> property entries lets just copy entire value union when processing
> non-array values.
> 
> For value arrays we no longer use union of pointers, but rather a single
> void pointer, which allows us to remove property_set_pointer().
> 
> In property_get_pointer() we do not need to handle each data type
> separately, we can simply return either the pointer or pointer to values
> union.
> 
> We are not losing anything from removing typed pointer union because the
> upper layers do their accesses through void pointers anyway, and we
> trust the "type" of the property when interpret the data. We rely on
> users of property entries on using PROPERTY_ENTRY_XXX() macros to
> properly initialize entries instead of poking in the instances directly.

I'm not sure about this change since the struct definition is still available
to use. If we would change it to be opaque pointer, it will be possible to get
rid of the type differentiation in cleaner way.

Anyway, perhaps somebody else can look at this.

-- 
With Best Regards,
Andy Shevchenko
