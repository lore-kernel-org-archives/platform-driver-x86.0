From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 05/14] software node: clean up
 property_copy_string_array()
Date: Thu, 17 Oct 2019 10:02:47 +0300
Message-ID: <20191017070247.GA32742@smile.fi.intel.com>
References: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
 <20191011230721.206646-6-dmitry.torokhov@gmail.com>
 <20191015120726.GG32742@smile.fi.intel.com>
 <20191015181211.GD105649@dtor-ws>
 <20191016075300.GO32742@smile.fi.intel.com>
 <20191016170059.GE35946@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191016170059.GE35946@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 16, 2019 at 10:00:59AM -0700, Dmitry Torokhov wrote:
> On Wed, Oct 16, 2019 at 10:53:00AM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 15, 2019 at 11:12:11AM -0700, Dmitry Torokhov wrote:
> > > On Tue, Oct 15, 2019 at 03:07:26PM +0300, Andy Shevchenko wrote:

> > Yes, since property_set_pointer is called independently
> > on the type of the value.
> 
> We still call property_set_pointer() independently of the type of the
> value even with this patch. The point is that we do not set the pointer
> in property_copy_string_array(), so we only set the pointer once.
> 
> We used to have essentially for string arrays:
> 
> 	copy data
> 	set pointer in dst
> 	get pointer from dst
> 	set pointer in dst
> 
> With this patch we have:
> 
> 	copy data
> 	set pointer in dst

> > > This is confising and awkward and I believe it
> > > is cleaner for property_copy_string_array() to give a pointer to a copy
> > > of a string array, and then property_entry_copy_data() use it when
> > > handling the destination structure.
> > 
> > We probably need a 3rd opinion here.
> 
> I think I can still convince you ;)

Probably this is fine.

-- 
With Best Regards,
Andy Shevchenko
