From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 00/14] software node: add support for reference
 properties
Date: Wed, 16 Oct 2019 11:02:24 +0300
Message-ID: <20191016080224.GR32742@smile.fi.intel.com>
References: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
 <20191014073837.GI32742@smile.fi.intel.com>
 <20191014235747.GA105649@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191014235747.GA105649@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 14, 2019 at 04:57:47PM -0700, Dmitry Torokhov wrote:
> On Mon, Oct 14, 2019 at 10:38:37AM +0300, Andy Shevchenko wrote:
> > On Fri, Oct 11, 2019 at 04:07:07PM -0700, Dmitry Torokhov wrote:
> > > These series implement "references" properties for software nodes as true
> > > properties, instead of managing them completely separately.
> > > 
> > > The first 10 patches are generic cleanups and consolidation and
> > > unification of the existing code; patch #11 implements moving of small
> > > properties inline when copying property entries; patch #12 implements
> > > PROPERTY_ENTRY_REF() and friends; patch #13 converts the user of
> > > references to the property syntax, and patch #14 removes the remains of
> > > references as entities that are managed separately.
> > 
> > Can we get some test cases?
> 
> Something like this? (I'll beef it up if we decide KUnit is OK for
> this).

As a starter, yes.

-- 
With Best Regards,
Andy Shevchenko
