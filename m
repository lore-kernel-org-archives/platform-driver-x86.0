From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 05/11] mux: Add Intel Cherrytrail USB mux driver
Date: Mon, 4 Sep 2017 16:07:56 +0200
Message-ID: <70818328-5a80-abbc-2077-0ecac226951e@redhat.com>
References: <20170901214845.7153-1-hdegoede@redhat.com>
 <20170901214845.7153-6-hdegoede@redhat.com>
 <CAHp75VfEmHMTh_p==2_O6R4dqzUTDr9-qpQ2n9NQ77=teAkqRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfEmHMTh_p==2_O6R4dqzUTDr9-qpQ2n9NQ77=teAkqRg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, USB <linux-usb@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

Thank you for the reviews!

On 02-09-17 12:19, Andy Shevchenko wrote:
> On Sat, Sep 2, 2017 at 12:48 AM, Hans de Goede <hdegoede@redhat.com> wrote:
>> Intel Cherrytrail SoCs have an internal USB mux for muxing the otg-port
>> USB data lines between the xHCI host controller and the dwc3 gadget
>> controller. On some Cherrytrail systems this mux is controlled through
>> AML code reacting on a GPIO IRQ connected to the USB OTG id pin (through
>> an _AIE ACPI method) so things just work.
>>
>> But on other Cherrytrail systems we need to control the mux ourselves
>> this driver exports the mux through the mux subsys, so that other drivers
>> can control it if necessary.
>>
>> This driver also updates the vbus-valid reporting to the dwc3 gadget
>> controller, as this uses the same registers as the mux. This is needed
>> for gadget/device mode to work properly (even on systems which control
>> the mux from their AML code).
>>
>> Note this depends on the xhci driver registering a platform device
>> named "intel_cht_usb_mux", which has an IOMEM resource 0 which points
>> to the Intel Vendor Defined XHCI extended capabilities region.
> 
>> +static void intel_cht_usb_mux_set_sw_mode(struct intel_cht_usb_mux *mux)
>> +{
>> +       u32 data;
>> +
>> +       data = readl(mux->base + DUAL_ROLE_CFG0);
> 
>> +       if (!(data & SW_IDPIN_EN)) {
> 
> Do we need it? I think this kind of microoptimixzations not worth it
> for most cases.

Heh, Peter Rosin (the mux subsys maintainer) was actually asking if
we could even get rid of doing the read all the time. Lets discuss
this further in my reply to Peter's reply.

> 
>> +               data |= SW_IDPIN_EN;
>> +               writel(data, mux->base + DUAL_ROLE_CFG0);
>> +       }
>> +}
> 
>> +       /* In most case it takes about 600ms to finish mode switching */
>> +       timeout = jiffies + msecs_to_jiffies(DUAL_ROLE_CFG1_POLL_TIMEOUT);
>> +
>> +       /* Polling on CFG1 register to confirm mode switch.*/
> 
>> +       while (1) {
> 
> do {} while (time_before()); ?

That means having to have a second conditional after the
loop to detect we timed-out and do the dev_warn, I would prefer to keep
this as is.

Regards,

Hans


> 
>> +               data = readl(mux->base + DUAL_ROLE_CFG1);
>> +               if (!!(data & HOST_MODE) == host_mode)
>> +                       break;
>> +
>> +               /* Interval for polling is set to about 5 - 10 ms */
>> +               usleep_range(5000, 10000);
>> +
>> +               if (time_after(jiffies, timeout)) {
>> +                       dev_warn(&mux_ctrl->chip->dev,
>> +                                "Timeout waiting for mux to switch\n");
>> +                       break;
>> +               }
>> +       }
> 
> 
>> +static void intel_cht_usb_mux_vbus_work(struct work_struct *work)
>> +{
>> +       struct intel_cht_usb_mux *mux =
>> +               container_of(work, struct intel_cht_usb_mux, vbus_work);
>> +       bool vbus_present = false;
>> +       int i;
> 
> unsigned int i; ?
> 
>> +
>> +       for (i = 0; i < ARRAY_SIZE(vbus_cable_ids); i++) {
>> +               if (extcon_get_state(mux->vbus_extcon, vbus_cable_ids[i]) > 0) {
>> +                       vbus_present = true;
>> +                       break;
>> +               }
>> +       }
>> +
>> +       intel_cht_usb_mux_set_vbus_valid(mux, vbus_present);
>> +}
> 
>> +static int intel_cht_usb_mux_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct intel_cht_usb_mux *mux;
>> +       struct mux_chip *mux_chip;
>> +       struct resource *res;
>> +       resource_size_t size;
> 
>> +       int i, ret;
> 
> Ditto.
> 
>> +       for (i = 0 ; i < ARRAY_SIZE(vbus_providers); i++) {
>> +               if (!acpi_dev_present(vbus_providers[i].hid, NULL,
>> +                                     vbus_providers[i].hrv))
>> +                       continue;
> 
