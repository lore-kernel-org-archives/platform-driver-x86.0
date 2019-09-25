From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v5 1/1] platform/x86/intel_cht_int33fe: Split code to USB
 Micro-B and Type-C variants
Date: Wed, 25 Sep 2019 19:27:12 +0300
Message-ID: <20190925162712.GA3653@jeknote.loshitsa1.net>
References: <20190920223356.6622-1-jekhor@gmail.com>
 <20190920223356.6622-2-jekhor@gmail.com>
 <1cca117d-1951-0335-1aef-ac994c3c757b@redhat.com>
 <CAHp75VcoS2OFr8kwM7vq0iCqf6BpyJ4SO7peAUHKxAXdgA7CMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VcoS2OFr8kwM7vq0iCqf6BpyJ4SO7peAUHKxAXdgA7CMA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 25, 2019 at 06:02:22PM +0300, Andy Shevchenko wrote:
> On Sat, Sep 21, 2019 at 9:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Hi,
> >
> > On 21-09-2019 00:33, Yauhen Kharuzhy wrote:
> > > Existing intel_cht_int33fe ACPI pseudo-device driver assumes that
> > > hardware has Type-C connector and register related devices described as
> > > I2C connections in the _CRS resource.
> > >
> > > There is at least one hardware (Lenovo Yoga Book YB1-91L/F) with Micro-B
> > > USB connector exists. It has INT33FE device in the DSDT table but
> > > there are only two I2C connection described: PMIC and BQ27452 battery
> > > fuel gauge.
> > >
> > > Splitting existing INT33FE driver allow to maintain code for USB Micro-B
> > > (or AB) connector variant separately and make it simpler.
> > >
> > > Split driver to intel_cht_int33fe_common.c and
> > > intel_cht_int33fe_{microb,typec}.c. Compile all this sources to one .ko
> > > module to make user experience easier.
> > >
> > > Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> >
> > This version still works for me on my typec device:
> >
> > Tested-by: Hans de Goede <hdegoede@redhat.com>
> >
> > The code also looks good to me:
> >
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> >
> 
> By some reason it doesn't apply.

I have checked, and have no issues when applying this patch to the current
torvalds/master and linux-next/master branches (351c8a09b00b and 9e88347dedd8
commit IDs).


-- 
Yauhen Kharuzhy
