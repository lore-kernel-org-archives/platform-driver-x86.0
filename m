From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v2 1/1] platform/x86/intel_cht_int33fe: Split code to USB
 TypeB and TypeC variants
Date: Wed, 18 Sep 2019 14:42:24 +0300
Message-ID: <20190918114224.GA23318@jeknote.loshitsa1.net>
References: <20190917194507.14771-1-jekhor@gmail.com>
 <20190917194507.14771-2-jekhor@gmail.com>
 <f578a65b-af02-5fe8-dd59-9918c000da64@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f578a65b-af02-5fe8-dd59-9918c000da64@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 18, 2019 at 11:20:21AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 17-09-2019 21:45, Yauhen Kharuzhy wrote:
> > Existing intel_cht_int33fe ACPI pseudo-device driver assumes that
> > hardware has TypeC connector and register related devices described as
> > I2C connections in the _CRS resource.
> > 
> > There is at least one hardware (Lenovo Yoga Book YB1-91L/F) with micro
> > USB B connector exists. It has INT33FE device in the DSDT table but
> > there are only two I2C connection described: PMIC and BQ27452 battery
> > fuel gauge.
> > 
> > Splitting existing INT33FE driver allow to maintain code for USB type B
> > (AB) connector variant separately and make it simpler.
> > 
> > Split driver to intel_cht_int33fe_common.c and
> > intel_cht_int33fe_{typeb,typec}.c. Compile all this source to one .ko
> > module to make user experience easier.
> > 
> > Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> 
> Thank you for doing this, this version looks much better IMHO.
> 
> Note that this does not apply to Linus' current master, please
> rebase. Specifically this conflicts with this patch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=78cd4bf53635d3aeb73435bc89eb6eb39450f315
> 
> Which just got merged. Instead of rebasing on Linus' master
> (which is always a bit adventurous to use during the merge window)
> you can also cherry-pick that single commit on top of v5.3
> and use that as a base.
> 
> Note that that patch makes changes to struct cht_int33fe_data
> specifically it drops the:
> 
> 	struct fwnode_handle *mux;
> 
> Member, so when rebasing you should drop that in the new
> version of the struct on common.h .
> 
> Besides that this need a rebase, overall this looks good, I have some
> small remarks inline:

Arghh.. OK, I have rebased the patch but at current torvalds kernel
i2c_acpi_new_device() fails with -EPROBE_DEFER at my hw, so I cannot check if it
is fully working. But I will resend patch anyway soon, this error should
not be related to the patch content.

> > +	data->hw_type = ret;
> > +	data->dev = dev;
> > +
> > +	switch (data->hw_type) {
> 
> I suggested adding hw_type to data so that it could be used to
> select the right remove function in cht_int33fe_remove(),
> since you are using a remove function pointer in data for this
> (which is fine), there is no reason to store hw_type in
> cht_int33fe_data anymore, please drop this and change the
> 
> 	switch (data->hw_type) {
> 
> to:
> 
> 	switch (ret) {

OK, sure

> 
> p.s.
> 
> I've done the rebase myself and I'm building a kernel with my re-based version of this
> patch to test it on a typec device. I will get back to you with the results
> (I expect things will just work, just making sure).
> 

-- 
Yauhen Kharuzhy
