From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 04/11] usb: xhci: Add Intel cherrytrail extended cap /
 otg phy mux handling
Date: Tue, 19 Sep 2017 15:40:26 +0300
Message-ID: <59C1103A.9030509@linux.intel.com>
References: <20170905164221.11266-1-hdegoede@redhat.com>
 <20170905164221.11266-5-hdegoede@redhat.com>
 <59B14628.5030700@linux.intel.com>
 <40e23f9e-538f-088a-96a3-402818bcf3fb@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030507060800090906050103"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:49439 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751000AbdISMgr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Sep 2017 08:36:47 -0400
In-Reply-To: <40e23f9e-538f-088a-96a3-402818bcf3fb@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------030507060800090906050103
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

sorry about the long delay

On 07.09.2017 18:49, Hans de Goede wrote:
> Hi,
>
> On 07-09-17 15:14, Mathias Nyman wrote:
>> On 05.09.2017 19:42, Hans de Goede wrote:
>>> The Intel cherrytrail xhci controller has an extended cap mmio-range
>>> which contains registers to control the muxing to the xhci (host mode)
>>> or the dwc3 (device mode) and vbus-detection for the otg usb-phy.
>>>
>>> Having a mux driver included in the xhci code (or under drivers/usb/host)
>>> is not desirable. So this commit adds a simple handler for this extended
>>> capability, which creates a platform device with the caps mmio region as
>>> resource, this allows us to write a separate platform mux driver for the
>>> mux.
>>>
>> I think it would be better to have one place where we add handlers for
>> vendor specific extended capabilities.
>>
>> Something like xhci-vendor-ext-caps.c, or just xhci-ext-caps.c as
>> there's a xhci-ext-caps.h header already
>>
>> We could walk through the capability list once and add the needed handlers.
>> Something like:
>>
>> +int xhci_ext_cap_init(void __iomem *base)
>
> This will need to take a struct xhci_hcd *xhci param instead
> as some of the ext_cap handling (including the cht mux code)
> will need access to this.
>

yes, sample code added in second patch for reference/testing.

>
> So I see 2 options here (without making this function PCI specific)
> 1) Add an u32 product_id field to struct xhci_hcd; or
> 2) Use a quirk flag as my current code is doing.
>
> I'm fine with doing this either way, please let me know your preference.

Lets go with the quirk for now, I'll sort that out later

>
> Can you do a "git format-patch" of that and send it to me? If you
> can give me that + your preference for how to check if we're
> dealing with a cht xhci hcd in xhci_ext_cap_init I can do a v3
> with your suggestions applied.

Ended up modifying xhci_find_next_ext_cap() using id = 0 for
the next capability in list. Patch attached,

Second patch is just for reference how to use it.

Thanks
-Mathias



--------------030507060800090906050103
Content-Type: text/x-patch;
 name="0001-xhci-Add-option-to-get-next-extended-capability-in-l.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-xhci-Add-option-to-get-next-extended-capability-in-l.pa";
 filename*1="tch"

From d5f26c1595f211ea7d46fca91551f70d1207330d Mon Sep 17 00:00:00 2001
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Date: Tue, 19 Sep 2017 14:54:58 +0300
Subject: [PATCH 1/2] xhci: Add option to get next extended capability in list
 by passing id = 0

Modify xhci_find_next_ext_cap(base, offset, id) to return the next
capability offset if 0 is passed for id. Otherwise it will behave as
previously and return the offset of the next capability with matching id

capability id 0 is not used by xhci (reserved)

This is useful when we want to loop through all capabilities.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ext-caps.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ext-caps.h b/drivers/usb/host/xhci-ext-caps.h
index 28deea5..c1b4042 100644
--- a/drivers/usb/host/xhci-ext-caps.h
+++ b/drivers/usb/host/xhci-ext-caps.h
@@ -96,7 +96,8 @@
  * @base	PCI MMIO registers base address.
  * @start	address at which to start looking, (0 or HCC_PARAMS to start at
  *		beginning of list)
- * @id		Extended capability ID to search for.
+ * @id		Extended capability ID to search for, or 0 for the next
+ *		capability
  *
  * Returns the offset of the next matching extended capability structure.
  * Some capabilities can occur several times, e.g., the XHCI_EXT_CAPS_PROTOCOL,
@@ -122,7 +123,7 @@ static inline int xhci_find_next_ext_cap(void __iomem *base, u32 start, int id)
 		val = readl(base + offset);
 		if (val == ~0)
 			return 0;
-		if (XHCI_EXT_CAPS_ID(val) == id && offset != start)
+		if (offset != start && (id == 0 || XHCI_EXT_CAPS_ID(val) == id))
 			return offset;
 
 		next = XHCI_EXT_CAPS_NEXT(val);
-- 
1.9.1


--------------030507060800090906050103
Content-Type: text/x-patch;
 name="0002-xhci-test-xhci_find_next_ext_cap-with-0-id.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-xhci-test-xhci_find_next_ext_cap-with-0-id.patch"

From da44e961605d382829f90fdcfb90b61fa5ca9590 Mon Sep 17 00:00:00 2001
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Date: Tue, 19 Sep 2017 14:58:40 +0300
Subject: [PATCH 2/2] xhci: test xhci_find_next_ext_cap with 0 id

NOT for UPSTREAM, just testing/reference code

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ext-caps.h |  3 +++
 drivers/usb/host/xhci.c          | 30 ++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/usb/host/xhci-ext-caps.h b/drivers/usb/host/xhci-ext-caps.h
index c1b4042..7deb9e7 100644
--- a/drivers/usb/host/xhci-ext-caps.h
+++ b/drivers/usb/host/xhci-ext-caps.h
@@ -51,6 +51,9 @@
 #define XHCI_EXT_CAPS_ROUTE	5
 /* IDs 6-9 reserved */
 #define XHCI_EXT_CAPS_DEBUG	10
+/* IDs 192 - 255 vendor specific extensions */
+#define XHCI_EXT_CAPS_VENDOR_INTEL 192
+
 /* USB Legacy Support Capability - section 7.1.1 */
 #define XHCI_HC_BIOS_OWNED	(1 << 16)
 #define XHCI_HC_OS_OWNED	(1 << 24)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 870093a..99c804a 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4772,6 +4772,34 @@ static int xhci_get_frame(struct usb_hcd *hcd)
 	return readl(&xhci->run_regs->microframe_index) >> 3;
 }
 
+int xhci_ext_cap_init(struct xhci_hcd *xhci)
+{
+	void __iomem *base;
+	u32 cap_offset;
+	u32 val;
+
+	base = &xhci->cap_regs->hc_capbase;
+	cap_offset = xhci_find_next_ext_cap(base, 0, 0);
+
+	do {
+		val = readl(base + cap_offset);
+
+		switch (XHCI_EXT_CAPS_ID(val)) {
+		case XHCI_EXT_CAPS_VENDOR_INTEL:
+			printk(KERN_ERR "TEST EXT_CAPS_VENDOR_INTEL\n");
+			break;
+		default:
+			break;
+		}
+
+		printk(KERN_ERR "TEST EXT_CAP id %d\n", XHCI_EXT_CAPS_ID(val));
+
+		cap_offset = xhci_find_next_ext_cap(base, cap_offset, 0);
+	} while (cap_offset);
+
+	return 0;
+}
+
 int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 {
 	struct xhci_hcd		*xhci;
@@ -4886,6 +4914,8 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 		dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
 	}
 
+	xhci_ext_cap_init(xhci);
+
 	xhci_dbg(xhci, "Calling HCD init\n");
 	/* Initialize HCD and host controller data structures. */
 	retval = xhci_init(hcd);
-- 
1.9.1


--------------030507060800090906050103--
