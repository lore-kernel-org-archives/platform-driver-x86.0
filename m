From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V3 3/3] platform/x86: Intel PMT Telemetry capability driver
Date: Tue, 14 Jul 2020 11:51:20 +0300
Message-ID: <CAHp75VeueLvou3SEtR=EcTi0x+0qpLz7_cvE2KBXHXa_crS8cA@mail.gmail.com>
References: <20200508021844.6911-1-david.e.box@linux.intel.com> <20200714062323.19990-4-david.e.box@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200714062323.19990-4-david.e.box@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jul 14, 2020 at 9:22 AM David E. Box
<david.e.box@linux.intel.com> wrote:
>
> PMT Telemetry is a capability of the Intel Platform Monitoring Technology.
> The Telemetry capability provides access to device telemetry metrics that
> provide hardware performance data to users from continuous, memory mapped,
> read-only register spaces.
>
> Register mappings are not provided by the driver. Instead, a GUID is read
> from a header for each endpoint. The GUID identifies the device and is to
> be used with an XML, provided by the vendor, to discover the available set
> of metrics and their register mapping.  This allows firmware updates to
> modify the register space without needing to update the driver every time
> with new mappings. Firmware writes a new GUID in this case to specify the
> new mapping.  Software tools with access to the associated XML file can
> then interpret the changes.
>
> This module manages access to all PMT Telemetry endpoints on a system,
> independent of the device exporting them. It creates a pmt_telemetry class
> to manage the devices. For each telemetry endpoint, sysfs files provide
> GUID and size information as well as a pointer to the parent device the
> telemetry came from. Software may discover the association between
> endpoints and devices by iterating through the list in sysfs, or by looking
> for the existence of the class folder under the device of interest.  A
> device node of the same name allows software to then map the telemetry
> space for direct access.
>
> This patch also creates an pci device id list for early telemetry hardware
> that requires workarounds for known issues.

Some more style issues, after addressing feel free to add
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>

Since you are submitting this the order of the above SoB chain is a
bit strange. I think something like

SoB: Alexander
Co-developed-by: Alexander
SoB: David

is expected (same for patch 2).

...

> +Contact:       David Box <david.e.box@linux.intel.com>
> +Description:
> +               The telem<x> directory contains files describing an instance of
> +               a PMT telemetry device that exposes hardware telemetry. Each
> +               telem<x> directory has an associated /dev/telem<x> node. This
> +               node may be opened and mapped to access the telemetry space of
> +               the device. The register layout of the telemetry space is
> +               determined from an XML file that matches the pci device id and

PCI

> +               guid for the device.

GUID

Same for all code where it appears.

...

> +       psize = (PFN_UP(entry->base_addr + entry->header.size) - pfn) *
> +               PAGE_SIZE;

I wouldn't mind having this on one line.

...

> +static ssize_t guid_show(struct device *dev, struct device_attribute *attr,
> +                        char *buf)

Ditto.

...

> +static ssize_t offset_show(struct device *dev, struct device_attribute *attr,
> +                          char *buf)

Ditto.

...

> +static bool pmt_telem_is_early_client_hw(struct device *dev)
> +{

> +       struct pci_dev *parent;
> +
> +       parent = to_pci_dev(dev->parent);

Can be one line.

> +       return !!pci_match_id(pmt_telem_early_client_pci_ids, parent);
> +}

...

> +               entry->header_res = platform_get_resource(pdev, IORESOURCE_MEM,
> +                                                         i);

One line, please.

-- 
With Best Regards,
Andy Shevchenko
