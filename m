From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 05/14] software node: clean up
 property_copy_string_array()
Date: Wed, 16 Oct 2019 10:53:00 +0300
Message-ID: <20191016075300.GO32742@smile.fi.intel.com>
References: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
 <20191011230721.206646-6-dmitry.torokhov@gmail.com>
 <20191015120726.GG32742@smile.fi.intel.com>
 <20191015181211.GD105649@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191015181211.GD105649@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 15, 2019 at 11:12:11AM -0700, Dmitry Torokhov wrote:
> On Tue, Oct 15, 2019 at 03:07:26PM +0300, Andy Shevchenko wrote:
> > On Fri, Oct 11, 2019 at 04:07:12PM -0700, Dmitry Torokhov wrote:
> > > Because property_copy_string_array() stores the newly allocated pointer in the
> > > destination property, we have an awkward code in property_entry_copy_data()
> > > where we fetch the new pointer from dst.
> > 
> > I don't see a problem in this function.
> > 
> > Rather 'awkward code' is a result of use property_set_pointer() which relies on
> > data type.
> 
> No, the awkwardness is that we set the pointer once in
> property_copy_string_array(), then fetch it in
> property_entry_copy_data() only to set it again via
> property_set_pointer().

Yes, since property_set_pointer is called independently
on the type of the value.


> This is confising and awkward and I believe it
> is cleaner for property_copy_string_array() to give a pointer to a copy
> of a string array, and then property_entry_copy_data() use it when
> handling the destination structure.

We probably need a 3rd opinion here.

-- 
With Best Regards,
Andy Shevchenko
