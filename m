From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 04/11] usb: xhci: Add Intel cherrytrail extended cap / otg
 phy mux handling
Date: Tue, 5 Sep 2017 12:06:56 +0200
Message-ID: <609aa054-b79d-ae50-fb78-f644934c85c1@redhat.com>
References: <20170901214845.7153-1-hdegoede@redhat.com>
 <20170901214845.7153-5-hdegoede@redhat.com>
 <20170904073158.GA27353@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41210 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750709AbdIEKHB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Sep 2017 06:07:01 -0400
In-Reply-To: <20170904073158.GA27353@kuha.fi.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org

Hi,

On 04-09-17 09:31, Heikki Krogerus wrote:
> Hi,
> 
> On Fri, Sep 01, 2017 at 11:48:38PM +0200, Hans de Goede wrote:
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
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
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
>> @@ -63,7 +63,7 @@ obj-$(CONFIG_USB_OHCI_HCD_DAVINCI)	+= ohci-da8xx.o
>>   obj-$(CONFIG_USB_UHCI_HCD)	+= uhci-hcd.o
>>   obj-$(CONFIG_USB_FHCI_HCD)	+= fhci.o
>>   obj-$(CONFIG_USB_XHCI_HCD)	+= xhci-hcd.o
>> -obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o
>> +obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o xhci-intel-quirks.o
>>   obj-$(CONFIG_USB_XHCI_PLATFORM) += xhci-plat-hcd.o
>>   obj-$(CONFIG_USB_XHCI_MTK)	+= xhci-mtk.o
>>   obj-$(CONFIG_USB_XHCI_TEGRA)	+= xhci-tegra.o
>> diff --git a/drivers/usb/host/xhci-intel-quirks.c b/drivers/usb/host/xhci-intel-quirks.c
>> new file mode 100644
>> index 000000000000..819f5f9da9ee
>> --- /dev/null
>> +++ b/drivers/usb/host/xhci-intel-quirks.c
>> @@ -0,0 +1,85 @@
>> +/*
>> + * Intel Vendor Defined XHCI extended capability handling
>> + *
>> + * Copyright (c) 2016) Hans de Goede <hdegoede@redhat.com>
>> + *
>> + * Loosely based on android x86 kernel code which is:
>> + *
>> + * Copyright (C) 2014 Intel Corp.
>> + *
>> + * Author: Wu, Hao
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful, but
>> + * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
>> + * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
>> + * for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program;
>> + */
>> +
>> +#include <linux/platform_device.h>
>> +#include "xhci.h"
>> +
>> +/* Extended capability IDs for Intel Vendor Defined */
>> +#define XHCI_EXT_CAPS_INTEL_HOST_CAP	192
>> +
>> +static void xhci_intel_unregister_pdev(void *arg)
>> +{
>> +	platform_device_unregister(arg);
>> +}
>> +
>> +int xhci_create_intel_cht_mux_pdev(struct xhci_hcd *xhci)
>> +{
>> +	struct usb_hcd *hcd = xhci_to_hcd(xhci);
>> +	struct device *dev = hcd->self.controller;
>> +	struct platform_device *pdev;
>> +	struct resource	res = { 0, };
>> +	int ret, ext_offset;
>> +
>> +	ext_offset = xhci_find_next_ext_cap(&xhci->cap_regs->hc_capbase, 0,
>> +					    XHCI_EXT_CAPS_INTEL_HOST_CAP);
>> +	if (!ext_offset) {
>> +		xhci_err(xhci, "couldn't find Intel ext caps\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	pdev = platform_device_alloc("intel_cht_usb_mux", PLATFORM_DEVID_NONE);
>> +	if (!pdev) {
>> +		xhci_err(xhci, "couldn't allocate intel_cht_usb_mux pdev\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	res.start = hcd->rsrc_start + ext_offset;
>> +	res.end	  = res.start + 0x3ff;
>> +	res.name  = "intel_cht_usb_mux";
>> +	res.flags = IORESOURCE_MEM;
>> +
>> +	ret = platform_device_add_resources(pdev, &res, 1);
>> +	if (ret) {
>> +		dev_err(dev, "couldn't add resources to intel_cht_usb_mux pdev\n");
>> +		platform_device_put(pdev);
>> +		return ret;
>> +	}
> 
> Previously the problem with this was that since platform bus reserves
> the memory region, usb core fails to register the hcd, as it also
> wants to reserve the same memory region. So xhci with this failed to
> probe.
> 
> So has that been fixed? Does xhci really get registered with this?

This is not a problem if you set the xhci device as parent:

>> +	pdev->dev.parent = dev;

And yes both the xhci and the intel_cht_usb_mux devices get registered
and work fine:

[root@localhost ~]# cat /proc/iomem
<snip>
80000000-dfffffff : PCI Bus 0000:00
<snip>
   a1c00000-a1c0ffff : 0000:00:14.0
     a1c00000-a1c0ffff : xhci-hcd
       a1c08070-a1c0846f : intel_cht_usb_mux

[root@localhost ~]# lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 5000M
     |__ Port 4: Dev 2, If 0, Class=Mass Storage, Driver=uas, 5000M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/7p, 480M
     |__ Port 2: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M
     |__ Port 2: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid, 1.5M
     |__ Port 3: Dev 3, If 0, Class=Vendor Specific Class, Driver=btusb, 12M
     |__ Port 3: Dev 3, If 1, Class=Vendor Specific Class, Driver=btusb, 12M
     |__ Port 3: Dev 3, If 2, Class=Vendor Specific Class, Driver=btusb, 12M
     |__ Port 3: Dev 3, If 3, Class=Application Specific Interface, Driver=, 12M


>> +
>> +	ret = platform_device_add(pdev);
>> +	if (ret) {
>> +		dev_err(dev, "couldn't register intel_cht_usb_mux pdev\n");
>> +		platform_device_put(pdev);
>> +		return ret;
>> +	}
>> +
>> +	ret = devm_add_action_or_reset(dev, xhci_intel_unregister_pdev, pdev);
>> +	if (ret) {
>> +		dev_err(dev, "couldn't add unregister action for intel_cht_usb_mux pdev\n");
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
>> index 8071c8fdd15e..b55c1e96abf0 100644
>> --- a/drivers/usb/host/xhci-pci.c
>> +++ b/drivers/usb/host/xhci-pci.c
>> @@ -188,6 +188,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>>   	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
>>   		 pdev->device == PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI) {
>>   		xhci->quirks |= XHCI_SSIC_PORT_UNUSED;
>> +		xhci->quirks |= XHCI_INTEL_CHT_USB_MUX;
>>   	}
>>   	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
>>   	    (pdev->device == PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI ||
>> @@ -328,6 +329,9 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>   	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
>>   		xhci_pme_acpi_rtd3_enable(dev);
>>   
>> +	if (xhci->quirks & XHCI_INTEL_CHT_USB_MUX)
>> +		xhci_create_intel_cht_mux_pdev(xhci);
>> +
>>   	/* USB-2 and USB-3 roothubs initialized, allow runtime pm suspend */
>>   	pm_runtime_put_noidle(&dev->dev);
>>   
>> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
>> index e3e935291ed6..f722ee31e50d 100644
>> --- a/drivers/usb/host/xhci.h
>> +++ b/drivers/usb/host/xhci.h
>> @@ -1821,6 +1821,7 @@ struct xhci_hcd {
>>   #define XHCI_LIMIT_ENDPOINT_INTERVAL_7	(1 << 26)
>>   #define XHCI_U2_DISABLE_WAKE	(1 << 27)
>>   #define XHCI_ASMEDIA_MODIFY_FLOWCONTROL	(1 << 28)
>> +#define XHCI_INTEL_CHT_USB_MUX	(1 << 29)
> 
> Is that really necessary? Why not just register the platform device
> the moment we find match for the PCI device ID?

That is possible, but not how the rest of the xhci-pci.c code
works in general, all PCI-id checking is done in xhci_pci_quirks()
and that function only sets quirks flags otherwise and then those
quirks are handled in various other places such as probe() so
without adding this flag one would get a PCI-id check outside
of xhci_pci_quirks() or code which does more then just setting
a quirk flag inside of xhci_pci_quirks(), either of which deviates
from the current code-patterns for the xhci code.

Regards,

Hans



> 
> 
> Br,
> 
