From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v4 00/14] software node: add support for reference
 properties
Date: Fri, 11 Oct 2019 16:25:26 -0700
Message-ID: <20191011232526.GL229325@dtor-ws>
References: <20190911051231.148032-1-dmitry.torokhov@gmail.com>
 <20191003003227.GA246700@dtor-ws>
 <CAJZ5v0jF5vafYFSJ=p3ew_tCbj1T1zRznZDoPTL47Pdj9-rrCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jF5vafYFSJ=p3ew_tCbj1T1zRznZDoPTL47Pdj9-rrCg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 03, 2019 at 10:39:24AM +0200, Rafael J. Wysocki wrote:
> On Thu, Oct 3, 2019 at 2:32 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Rafael,
> >
> > On Tue, Sep 10, 2019 at 10:12:17PM -0700, Dmitry Torokhov wrote:
> > > These series implement "references" properties for software nodes as true
> > > properties, instead of managing them completely separately.
> > >
> > > The first 10 patches are generic cleanups and consolidation and unification
> > > of the existing code; patch #11 implements PROPERTY_EMTRY_REF() and friends;
> > > patch #12 converts the user of references to the property syntax, and patch
> > > #13 removes the remains of references as entities that are managed
> > > separately.
> >
> > Now that merge window is over could you please take a look at the
> > series?
> 
> I will.
> 
> It would help to resend the whole series with a CC to linux-acpi, though.

Rebased to next-20191011 and sent to linux-acpi and others.

Thanks!

-- 
Dmitry
