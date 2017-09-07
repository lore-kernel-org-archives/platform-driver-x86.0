From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 04/11] usb: xhci: Add Intel cherrytrail extended cap /
 otg phy mux handling
Date: Thu, 7 Sep 2017 17:49:13 +0200
Message-ID: <40e23f9e-538f-088a-96a3-402818bcf3fb@redhat.com>
References: <20170905164221.11266-1-hdegoede@redhat.com>
 <20170905164221.11266-5-hdegoede@redhat.com>
 <59B14628.5030700@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59B14628.5030700-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 07-09-17 15:14, Mathias Nyman wrote:
> On 05.09.2017 19:42, Hans de Goede wrote:
>> The Intel cherrytrail xhci controller has an extended cap mmio-range
>> which contains registers to control the muxing to the xhci (host mode)
>> or the dwc3 (device mode) and vbus-detection for the otg usb-phy.
>>
>> Having a mux driver included in the xhci code (or under drivers/usb/host)
>> is not desirable. So this commit adds a simple handler for this extended
>> capability, which creates a platform device with the caps mmio region as
>> resource, this allows us to write a separate platform mux driver for the
>> mux.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>> Changes in v2:
>> -Check xHCI controller PCI device-id instead of only checking for the
>>   Intel Extended capability ID, as the Extended capability ID is used on
>>   other model Intel xHCI controllers too
>> ---
>>   drivers/usb/host/Makefile            |  2 +-
>>   drivers/usb/host/xhci-intel-quirks.c | 85 ++++++++++++++++++++++++++++++++++++
>>   drivers/usb/host/xhci-pci.c          |  4 ++
>>   drivers/usb/host/xhci.h              |  2 +
>>   4 files changed, 92 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/usb/host/xhci-intel-quirks.c
>>
>> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
>> index cf2691fffcc0..441edf82eb1c 100644
>> --- a/drivers/usb/host/Makefile
>> +++ b/drivers/usb/host/Makefile
>> @@ -63,7 +63,7 @@ obj-$(CONFIG_USB_OHCI_HCD_DAVINCI)    += ohci-da8xx.o
>>   obj-$(CONFIG_USB_UHCI_HCD)    += uhci-hcd.o
>>   obj-$(CONFIG_USB_FHCI_HCD)    += fhci.o
>>   obj-$(CONFIG_USB_XHCI_HCD)    += xhci-hcd.o
>> -obj-$(CONFIG_USB_XHCI_PCI)    += xhci-pci.o
>> +obj-$(CONFIG_USB_XHCI_PCI)    += xhci-pci.o xhci-intel-quirks.o
>>   obj-$(CONFIG_USB_XHCI_PLATFORM) += xhci-plat-hcd.o
>>   obj-$(CONFIG_USB_XHCI_MTK)    += xhci-mtk.o
>>   obj-$(CONFIG_USB_XHCI_TEGRA)    += xhci-tegra.o
>> diff --git a/drivers/usb/host/xhci-intel-quirks.c b/drivers/usb/host/xhci-intel-quirks.c
>> new file mode 100644
> 
> I think it would be better to have one place where we add handlers for
> vendor specific extended capabilities.
> 
> Something like xhci-vendor-ext-caps.c, or just xhci-ext-caps.c as
> there's a xhci-ext-caps.h header already
> 
> We could walk through the capability list once and add the needed handlers.
> Something like:
> 
> +int xhci_ext_cap_init(void __iomem *base)

This will need to take a struct xhci_hcd *xhci param instead
as some of the ext_cap handling (including the cht mux code)
will need access to this.

> +{
> +        u32 val;
> +       u32 cap_offset;
> +
> +        cap_offset = xhci_next_ext_cap(base, 0);
> +
> +        while (cap_offset) {
> +                val = readl(base + cap_offset);
> +
> +                switch (XHCI_EXT_CAPS_ID(val)) {
> +                case XHCI_EXT_CAPS_VENDOR_INTEL:
> +                        /* check hw/id/something, and call what's needed */

So I see 2 options here (without making this function PCI specific)
1) Add an u32 product_id field to struct xhci_hcd; or
2) Use a quirk flag as my current code is doing.

I'm fine with doing this either way, please let me know your preference.

> +                        break;
> +                case XHCI_EXT_CAPS_VENDOR_XYZ:
> +                        /* do something */
> +                        break;
> +                default:
> +                        break;
> +                }
> +
> +               printk(KERN_ERR "MATTU EXT_CAP id %d\n", XHCI_EXT_CAPS_ID(val));
> +
> +               cap_offset = xhci_next_ext_cap(base, cap_offset);
> +        }
> +
> +        return 0;
> +}
> 
> xhci_next_ext_cap() doesn't exist anywhere else than my local sandbox branch yet.

Can you do a "git format-patch" of that and send it to me? If you
can give me that + your preference for how to check if we're
dealing with a cht xhci hcd in xhci_ext_cap_init I can do a v3
with your suggestions applied.

> 
>> +
>> +/* Extended capability IDs for Intel Vendor Defined */
>> +#define XHCI_EXT_CAPS_INTEL_HOST_CAP    192
> 
> XHCI_EXT_CAPS_VENDOR_INTEL
> and should be in xhci-ext-caps.h

Ok.

Regards,

Hans


> 
>> +
>> +static void xhci_intel_unregister_pdev(void *arg)
>> +{
>> +    platform_device_unregister(arg);
>> +}
>> +
>> +int xhci_create_intel_cht_mux_pdev(struct xhci_hcd *xhci)
>> +{
>> +    struct usb_hcd *hcd = xhci_to_hcd(xhci);
>> +    struct device *dev = hcd->self.controller;
>> +    struct platform_device *pdev;
>> +    struct resource    res = { 0, };
>> +    int ret, ext_offset;
>> +
>> +    ext_offset = xhci_find_next_ext_cap(&xhci->cap_regs->hc_capbase, 0,
>> +                        XHCI_EXT_CAPS_INTEL_HOST_CAP);
>> +    if (!ext_offset) {
>> +        xhci_err(xhci, "couldn't find Intel ext caps\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    pdev = platform_device_alloc("intel_cht_usb_mux", PLATFORM_DEVID_NONE);
>> +    if (!pdev) {
>> +        xhci_err(xhci, "couldn't allocate intel_cht_usb_mux pdev\n");
>> +        return -ENOMEM;
>> +    }
>> +
>> +    res.start = hcd->rsrc_start + ext_offset;
>> +    res.end      = res.start + 0x3ff;
>> +    res.name  = "intel_cht_usb_mux";
>> +    res.flags = IORESOURCE_MEM;
>> +
>> +    ret = platform_device_add_resources(pdev, &res, 1);
>> +    if (ret) {
>> +        dev_err(dev, "couldn't add resources to intel_cht_usb_mux pdev\n");
>> +        platform_device_put(pdev);
>> +        return ret;
>> +    }
>> +
>> +    pdev->dev.parent = dev;
>> +
>> +    ret = platform_device_add(pdev);
>> +    if (ret) {
>> +        dev_err(dev, "couldn't register intel_cht_usb_mux pdev\n");
>> +        platform_device_put(pdev);
>> +        return ret;
>> +    }
>> +
>> +    ret = devm_add_action_or_reset(dev, xhci_intel_unregister_pdev, pdev);
>> +    if (ret) {
>> +        dev_err(dev, "couldn't add unregister action for intel_cht_usb_mux pdev\n");
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
>> index 8071c8fdd15e..b55c1e96abf0 100644
>> --- a/drivers/usb/host/xhci-pci.c
>> +++ b/drivers/usb/host/xhci-pci.c
>> @@ -188,6 +188,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>>       if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
>>            pdev->device == PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI) {
>>           xhci->quirks |= XHCI_SSIC_PORT_UNUSED;
>> +        xhci->quirks |= XHCI_INTEL_CHT_USB_MUX;
>>       }
>>       if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
>>           (pdev->device == PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI ||
>> @@ -328,6 +329,9 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>       if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
>>           xhci_pme_acpi_rtd3_enable(dev);
>>
>> +    if (xhci->quirks & XHCI_INTEL_CHT_USB_MUX)
>> +        xhci_create_intel_cht_mux_pdev(xhci);
>> +
>>       /* USB-2 and USB-3 roothubs initialized, allow runtime pm suspend */
>>       pm_runtime_put_noidle(&dev->dev);
>>
>> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
>> index e3e935291ed6..f722ee31e50d 100644
>> --- a/drivers/usb/host/xhci.h
>> +++ b/drivers/usb/host/xhci.h
>> @@ -1821,6 +1821,7 @@ struct xhci_hcd {
>>   #define XHCI_LIMIT_ENDPOINT_INTERVAL_7    (1 << 26)
>>   #define XHCI_U2_DISABLE_WAKE    (1 << 27)
>>   #define XHCI_ASMEDIA_MODIFY_FLOWCONTROL    (1 << 28)
>> +#define XHCI_INTEL_CHT_USB_MUX    (1 << 29)
> 
> Everything you said about the quirk flags in v1 is true, and I hate to
> make the bulk of xhci even more PCI dependent, but I'm running out of flag bits and
> would like a better solution than the current quirk flags we have.
> 
> This isn't really your concern, this patch is just doing it the same way it has
> always been done, but if you have a better idea I'm all ears.
> 
> -Mathias
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
