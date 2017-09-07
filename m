From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 04/11] usb: xhci: Add Intel cherrytrail extended cap /
 otg phy mux handling
Date: Thu, 7 Sep 2017 16:14:16 +0300
Message-ID: <59B14628.5030700@linux.intel.com>
References: <20170905164221.11266-1-hdegoede@redhat.com>
 <20170905164221.11266-5-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170905164221.11266-5-hdegoede@redhat.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Hans de Goede <hdegoede@redhat.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On 05.09.2017 19:42, Hans de Goede wrote:
> The Intel cherrytrail xhci controller has an extended cap mmio-range
> which contains registers to control the muxing to the xhci (host mode)
> or the dwc3 (device mode) and vbus-detection for the otg usb-phy.
>
> Having a mux driver included in the xhci code (or under drivers/usb/host)
> is not desirable. So this commit adds a simple handler for this extended
> capability, which creates a platform device with the caps mmio region as
> resource, this allows us to write a separate platform mux driver for the
> mux.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> -Check xHCI controller PCI device-id instead of only checking for the
>   Intel Extended capability ID, as the Extended capability ID is used on
>   other model Intel xHCI controllers too
> ---
>   drivers/usb/host/Makefile            |  2 +-
>   drivers/usb/host/xhci-intel-quirks.c | 85 ++++++++++++++++++++++++++++++++++++
>   drivers/usb/host/xhci-pci.c          |  4 ++
>   drivers/usb/host/xhci.h              |  2 +
>   4 files changed, 92 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/usb/host/xhci-intel-quirks.c
>
> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> index cf2691fffcc0..441edf82eb1c 100644
> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile
> @@ -63,7 +63,7 @@ obj-$(CONFIG_USB_OHCI_HCD_DAVINCI)	+= ohci-da8xx.o
>   obj-$(CONFIG_USB_UHCI_HCD)	+= uhci-hcd.o
>   obj-$(CONFIG_USB_FHCI_HCD)	+= fhci.o
>   obj-$(CONFIG_USB_XHCI_HCD)	+= xhci-hcd.o
> -obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o
> +obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o xhci-intel-quirks.o
>   obj-$(CONFIG_USB_XHCI_PLATFORM) += xhci-plat-hcd.o
>   obj-$(CONFIG_USB_XHCI_MTK)	+= xhci-mtk.o
>   obj-$(CONFIG_USB_XHCI_TEGRA)	+= xhci-tegra.o
> diff --git a/drivers/usb/host/xhci-intel-quirks.c b/drivers/usb/host/xhci-intel-quirks.c
> new file mode 100644

I think it would be better to have one place where we add handlers for
vendor specific extended capabilities.

Something like xhci-vendor-ext-caps.c, or just xhci-ext-caps.c as
there's a xhci-ext-caps.h header already

We could walk through the capability list once and add the needed handlers.
Something like:

+int xhci_ext_cap_init(void __iomem *base)
+{
+        u32 val;
+       u32 cap_offset;
+
+        cap_offset = xhci_next_ext_cap(base, 0);
+
+        while (cap_offset) {
+                val = readl(base + cap_offset);
+
+                switch (XHCI_EXT_CAPS_ID(val)) {
+                case XHCI_EXT_CAPS_VENDOR_INTEL:
+                        /* check hw/id/something, and call what's needed */
+                        break;
+                case XHCI_EXT_CAPS_VENDOR_XYZ:
+                        /* do something */
+                        break;
+                default:
+                        break;
+                }
+
+               printk(KERN_ERR "MATTU EXT_CAP id %d\n", XHCI_EXT_CAPS_ID(val));
+
+               cap_offset = xhci_next_ext_cap(base, cap_offset);
+        }
+
+        return 0;
+}

xhci_next_ext_cap() doesn't exist anywhere else than my local sandbox branch yet.

> +
> +/* Extended capability IDs for Intel Vendor Defined */
> +#define XHCI_EXT_CAPS_INTEL_HOST_CAP	192

XHCI_EXT_CAPS_VENDOR_INTEL
and should be in xhci-ext-caps.h

> +
> +static void xhci_intel_unregister_pdev(void *arg)
> +{
> +	platform_device_unregister(arg);
> +}
> +
> +int xhci_create_intel_cht_mux_pdev(struct xhci_hcd *xhci)
> +{
> +	struct usb_hcd *hcd = xhci_to_hcd(xhci);
> +	struct device *dev = hcd->self.controller;
> +	struct platform_device *pdev;
> +	struct resource	res = { 0, };
> +	int ret, ext_offset;
> +
> +	ext_offset = xhci_find_next_ext_cap(&xhci->cap_regs->hc_capbase, 0,
> +					    XHCI_EXT_CAPS_INTEL_HOST_CAP);
> +	if (!ext_offset) {
> +		xhci_err(xhci, "couldn't find Intel ext caps\n");
> +		return -ENODEV;
> +	}
> +
> +	pdev = platform_device_alloc("intel_cht_usb_mux", PLATFORM_DEVID_NONE);
> +	if (!pdev) {
> +		xhci_err(xhci, "couldn't allocate intel_cht_usb_mux pdev\n");
> +		return -ENOMEM;
> +	}
> +
> +	res.start = hcd->rsrc_start + ext_offset;
> +	res.end	  = res.start + 0x3ff;
> +	res.name  = "intel_cht_usb_mux";
> +	res.flags = IORESOURCE_MEM;
> +
> +	ret = platform_device_add_resources(pdev, &res, 1);
> +	if (ret) {
> +		dev_err(dev, "couldn't add resources to intel_cht_usb_mux pdev\n");
> +		platform_device_put(pdev);
> +		return ret;
> +	}
> +
> +	pdev->dev.parent = dev;
> +
> +	ret = platform_device_add(pdev);
> +	if (ret) {
> +		dev_err(dev, "couldn't register intel_cht_usb_mux pdev\n");
> +		platform_device_put(pdev);
> +		return ret;
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, xhci_intel_unregister_pdev, pdev);
> +	if (ret) {
> +		dev_err(dev, "couldn't add unregister action for intel_cht_usb_mux pdev\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 8071c8fdd15e..b55c1e96abf0 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -188,6 +188,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>   	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
>   		 pdev->device == PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI) {
>   		xhci->quirks |= XHCI_SSIC_PORT_UNUSED;
> +		xhci->quirks |= XHCI_INTEL_CHT_USB_MUX;
>   	}
>   	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
>   	    (pdev->device == PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI ||
> @@ -328,6 +329,9 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>   	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
>   		xhci_pme_acpi_rtd3_enable(dev);
>
> +	if (xhci->quirks & XHCI_INTEL_CHT_USB_MUX)
> +		xhci_create_intel_cht_mux_pdev(xhci);
> +
>   	/* USB-2 and USB-3 roothubs initialized, allow runtime pm suspend */
>   	pm_runtime_put_noidle(&dev->dev);
>
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index e3e935291ed6..f722ee31e50d 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1821,6 +1821,7 @@ struct xhci_hcd {
>   #define XHCI_LIMIT_ENDPOINT_INTERVAL_7	(1 << 26)
>   #define XHCI_U2_DISABLE_WAKE	(1 << 27)
>   #define XHCI_ASMEDIA_MODIFY_FLOWCONTROL	(1 << 28)
> +#define XHCI_INTEL_CHT_USB_MUX	(1 << 29)

Everything you said about the quirk flags in v1 is true, and I hate to
make the bulk of xhci even more PCI dependent, but I'm running out of flag bits and
would like a better solution than the current quirk flags we have.

This isn't really your concern, this patch is just doing it the same way it has
always been done, but if you have a better idea I'm all ears.

-Mathias
