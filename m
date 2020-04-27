From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: i2c-multi-instantiate: Add flag for
 passing fwnode
Date: Mon, 27 Apr 2020 16:18:28 +0300
Message-ID: <CAHp75VegakBqAzxn1e+MzF3EgB6fNya3L0eZHMh11yct6HHNKw@mail.gmail.com>
References: <20200426104713.216896-1-hdegoede@redhat.com> <20200426104713.216896-2-hdegoede@redhat.com>
 <CAHp75VdOd6C36oR7HAnqrKiinVBr4YcqqJ=dv3NpR3=Xp0QQ-Q@mail.gmail.com> <b5bdffb4-0af2-abb7-21f7-2f5da56d5dc6@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <b5bdffb4-0af2-abb7-21f7-2f5da56d5dc6@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 27, 2020 at 3:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 4/26/20 7:59 PM, Andy Shevchenko wrote:
> > On Sun, Apr 26, 2020 at 1:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> In some cases the driver for the i2c_client-s which i2c-multi-instantiate
> >> instantiates may need access some fields / methods from to the ACPI fwnode
> >> for which i2c_clients are being instantiated.
> >>
> >> An example of this are CPLM3218 ACPI device-s. These contain CPM0 and
> >> CPM1 packages with various information (e.g. register init values) which
> >> the driver needs.
> >>
> >> Passing the fwnode through the i2c_board_info struct also gives the
> >> i2c-core access to it, and if we do not pass an IRQ then the i2c-core
> >> will use the fwnode to get an IRQ, see i2c_acpi_get_irq().
> >
> > I'm wondering, can we rather do it in the same way like we do for
> > GPIO/APIC case here.
> > Introduce IRQ_RESOURCE_SHARED (or so) and
> >
> > case _SHARED:
> >   irq = i2c_acpi_get_irq();
> > ...
> >
> > ?
>
> I think you are miss-understanding the problem. The problem is not that
> we want to share the IRQ, the problem is that we want to pass the single
> IRQ in the resources to only 1 of the instantiated I2C-clients. But if we
> do not pass an IRQ (we leave it at 0) and we do pass the fwnode then
> i2c-core-base.c will see that there is an ACPI-node attached to the
> device and will call i2c_acpi_get_irq().

Do we know ahead which device should take IRQ resource and which should not?
Can we use current _NONE flag for them?

> So the solution is definitely not calling i2c_acpi_get_irq() inside
> i2c-multi-instantiate.c we want to avoid the i2c_acpi_get_irq(),
> leaving the other 2 clients for the BSG1160 device without an IRQ
> and thus avoiding the IRQ mismatch (it is a mismatch because the
> drivers do not set the shared flag; and that is ok, we do not want
> to share the IRQ, it is just for the accelerometer AFAIK).

> >> This is a problem when there is only an IRQ for 1 of the clients described
> >> in the ACPI device we are instantiating clients for. If we unconditionally
> >> pass the fwnode, then i2c_acpi_get_irq() will assign the same IRQ to all
> >> clients instantiated, leading to kernel-oopses like this (BSG1160 device):
> >>
> >> [   27.340557] genirq: Flags mismatch irq 76. 00002001 (bmc150_magn_event) vs. 00000001 (bmc150_accel_event)
> >> [   27.340567] Call Trace:
> >> ...
> >>
> >> So we cannot simply always pass the fwnode. This commit adds a PASS_FWNODE
> >> flag, which can be used to pass the fwnode in cases where we do not have
> >> the IRQ problem and the driver for the instantiated client(s) needs access
> >> to the fwnode.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>   drivers/platform/x86/i2c-multi-instantiate.c | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
> >> index 6acc8457866e..dcafb1a29d17 100644
> >> --- a/drivers/platform/x86/i2c-multi-instantiate.c
> >> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
> >> @@ -20,6 +20,8 @@
> >>   #define IRQ_RESOURCE_GPIO      1
> >>   #define IRQ_RESOURCE_APIC      2
> >>
> >> +#define PASS_FWNODE            BIT(2)
> >> +
> >>   struct i2c_inst_data {
> >>          const char *type;
> >>          unsigned int flags;
> >> @@ -93,6 +95,10 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
> >>                  snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev),
> >>                           inst_data[i].type, i);
> >>                  board_info.dev_name = name;
> >> +
> >> +               if (inst_data[i].flags & PASS_FWNODE)
> >> +                       board_info.fwnode = dev->fwnode;
> >> +
> >>                  switch (inst_data[i].flags & IRQ_RESOURCE_TYPE) {
> >>                  case IRQ_RESOURCE_GPIO:
> >>                          ret = acpi_dev_gpio_irq_get(adev, inst_data[i].irq_idx);
> >> --
> >> 2.26.0
> >>
> >
> >
>


-- 
With Best Regards,
Andy Shevchenko
