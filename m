From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 0/6] platform/x86: intel_cht_int33fe: clean up series
Date: Thu, 16 Apr 2020 18:21:15 +0300
Message-ID: <CAHp75Vf6MT1AFacUkRUP3760nv=3V5kzF2AHWJG64tr5yZ2=dg@mail.gmail.com>
References: <20200408160905.12101-1-andriy.shevchenko@linux.intel.com>
 <20200416141730.GE185537@smile.fi.intel.com> <CAJZ5v0ihzD4knW=pKFmcsW0Q9c5rfyJMFh2ChiePe5SWO6G_TQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <CAJZ5v0ihzD4knW=pKFmcsW0Q9c5rfyJMFh2ChiePe5SWO6G_TQ@mail.gmail.com>
Sender: linux-acpi-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 16, 2020 at 6:05 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Thu, Apr 16, 2020 at 4:17 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Wed, Apr 08, 2020 at 07:09:00PM +0300, Andy Shevchenko wrote:
> > > When I started looking into the intel_cht_int33fe driver for an example of use
> > > software node API, I have noticed that it's hard to get and code a bit messy.
> > > Here is a clean up, main part of which is to introduce node groups and API to
> > > register and unregister them. This and some pre-existing APIs can be used in
> > > the driver.
> > >
> > > So, because of cross-subsystem nature of this series, I may recommend to create
> > > myself the immutable branch which can be pulled to Rafael's and Greg's trees
> > > respectively. I'm also open for other proposals how to proceed.
> >
> > Greg, Rafael,
> > any suggestion how to proceed with this series?
> >
> > (It has been reviewed and tested).
>
> You can merge them through platform/x86 as far as I'm concerned, or
> please let me know if you want me to pick them up.

Works for me, but I would like to ask for formal Ack tag.
Thanks!

-- 
With Best Regards,
Andy Shevchenko
