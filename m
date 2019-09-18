From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v2 1/1] platform/x86/intel_cht_int33fe: Split code to USB
 TypeB and TypeC variants
Date: Wed, 18 Sep 2019 23:33:32 +0300
Message-ID: <20190918203332.GA4859@jeknote.loshitsa1.net>
References: <20190917194507.14771-1-jekhor@gmail.com>
 <20190917194507.14771-2-jekhor@gmail.com>
 <f578a65b-af02-5fe8-dd59-9918c000da64@redhat.com>
 <20190918114224.GA23318@jeknote.loshitsa1.net>
 <029c7865-b9b3-1e58-7092-6d8495de0116@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <029c7865-b9b3-1e58-7092-6d8495de0116@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 18, 2019 at 10:12:43PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 18-09-2019 13:42, Yauhen Kharuzhy wrote:
> > On Wed, Sep 18, 2019 at 11:20:21AM +0200, Hans de Goede wrote:
> > > Hi,
> > > 
> > > On 17-09-2019 21:45, Yauhen Kharuzhy wrote:
> > > > Existing intel_cht_int33fe ACPI pseudo-device driver assumes that
> > > > hardware has TypeC connector and register related devices described as
> > > > I2C connections in the _CRS resource.
> > > > 
> > > > There is at least one hardware (Lenovo Yoga Book YB1-91L/F) with micro
> > > > USB B connector exists. It has INT33FE device in the DSDT table but
> > > > there are only two I2C connection described: PMIC and BQ27452 battery
> > > > fuel gauge.
> > > > 
> > > > Splitting existing INT33FE driver allow to maintain code for USB type B
> > > > (AB) connector variant separately and make it simpler.
> > > > 
> > > > Split driver to intel_cht_int33fe_common.c and
> > > > intel_cht_int33fe_{typeb,typec}.c. Compile all this source to one .ko
> > > > module to make user experience easier.
> > > > 
> > > > Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> > > 
> > > Thank you for doing this, this version looks much better IMHO.
> > > 
> > > Note that this does not apply to Linus' current master, please
> > > rebase. Specifically this conflicts with this patch:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=78cd4bf53635d3aeb73435bc89eb6eb39450f315
> > > 
> > > Which just got merged. Instead of rebasing on Linus' master
> > > (which is always a bit adventurous to use during the merge window)
> > > you can also cherry-pick that single commit on top of v5.3
> > > and use that as a base.
> > > 
> > > Note that that patch makes changes to struct cht_int33fe_data
> > > specifically it drops the:
> > > 
> > > 	struct fwnode_handle *mux;
> > > 
> > > Member, so when rebasing you should drop that in the new
> > > version of the struct on common.h .
> > > 
> > > Besides that this need a rebase, overall this looks good, I have some
> > > small remarks inline:
> > 
> > Arghh.. OK, I have rebased the patch but at current torvalds kernel
> > i2c_acpi_new_device() fails with -EPROBE_DEFER at my hw, so I cannot check if it
> > is fully working. But I will resend patch anyway soon, this error should
> > not be related to the patch content.
> 
> Are you sure it is not working? -EPROBE_DEFER is normal(ish) it just means
> that the i2c-controller driver for the bus has not initialized yet.
> 
> If you are building the i2c_designware or acpi_lpss drivers as module, or if
> you are building the intel_cht_int33fe code into the kernel, then this
> is more or less expected to happen.

I would agree but i2cdetect/i2cget works for this bus as expected. I
remember that I met this bug at one of previous iterations, hm... As I remember
it was caused by this commit:
00500147cbd3fc51353d0d003eaa9d31c72c0d50 drivers: Introduce device lookup variants by ACPI_COMPANION device.

This needs to be investigated.

> You can do "ls /sys/bus/i2c/devices" to check if it did succeed on
> later re-probe attempts (the fuel-gauge device should be there if
> things succeeded).
> 
> And you should probably do one more version, suppressing the dev_err
> on -EPROBE_DEFER like e.g. this snippet from the typec code:

OK, -EPROBE_DEFER was unexpected here for me...

 

-- 
Yauhen Kharuzhy
