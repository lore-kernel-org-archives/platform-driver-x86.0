From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4 00/14] software node: add support for reference properties
Date: Thu, 3 Oct 2019 10:39:24 +0200
Message-ID: <CAJZ5v0jF5vafYFSJ=p3ew_tCbj1T1zRznZDoPTL47Pdj9-rrCg@mail.gmail.com>
References: <20190911051231.148032-1-dmitry.torokhov@gmail.com> <20191003003227.GA246700@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003003227.GA246700@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 3, 2019 at 2:32 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Rafael,
>
> On Tue, Sep 10, 2019 at 10:12:17PM -0700, Dmitry Torokhov wrote:
> > These series implement "references" properties for software nodes as true
> > properties, instead of managing them completely separately.
> >
> > The first 10 patches are generic cleanups and consolidation and unification
> > of the existing code; patch #11 implements PROPERTY_EMTRY_REF() and friends;
> > patch #12 converts the user of references to the property syntax, and patch
> > #13 removes the remains of references as entities that are managed
> > separately.
>
> Now that merge window is over could you please take a look at the
> series?

I will.

It would help to resend the whole series with a CC to linux-acpi, though.

Thanks!
