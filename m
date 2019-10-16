From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 11/14] software node: move small properties inline
 when copying
Date: Wed, 16 Oct 2019 19:23:08 +0300
Message-ID: <20191016162308.GY32742@smile.fi.intel.com>
References: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
 <20191011230721.206646-12-dmitry.torokhov@gmail.com>
 <20191015122028.GI32742@smile.fi.intel.com>
 <20191015182553.GG105649@dtor-ws>
 <20191016074857.GN32742@smile.fi.intel.com>
 <20191016160126.GB35946@dtor-ws>
 <20191016161845.GX32742@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191016161845.GX32742@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 16, 2019 at 07:18:45PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 16, 2019 at 09:01:26AM -0700, Dmitry Torokhov wrote:
> > On Wed, Oct 16, 2019 at 10:48:57AM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 15, 2019 at 11:25:53AM -0700, Dmitry Torokhov wrote:
> 
> > > You store a value as union, but going to read as a member of union?
> > > I'm pretty sure it breaks standard rules.
> > 
> > No, I move the values _in place_ of the union, and the data is always
> > fetched via void pointers. And copying data via char * or memcpy() is
> > allowed even in C99 and C11.
> > 
> > But I am wondering why are we actually worrying about all of this? The
> > kernel is gnu89 and I think is going to stay this way because we use
> > initializers with a cast in a lot of places:
> > 
> > #define __RAW_SPIN_LOCK_UNLOCKED(lockname)      \
> >         (raw_spinlock_t) __RAW_SPIN_LOCK_INITIALIZER(lockname)
> > 
> > and C99 and gnu99 do not allow this. See
> > https://lore.kernel.org/lkml/20141019231031.GB9319@node.dhcp.inet.fi/
> 
> This is simple not a cast.

4.62 Compound literals in C99
ISO C99 supports compound literals. A compound literal looks like a cast
followed by an initializer. Its value is an object of the type specified in the
cast, containing the elements specified in the initializer. It is an lvalue.


-- 
With Best Regards,
Andy Shevchenko
