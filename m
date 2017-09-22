From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 06/14] xhci: Add option to get next extended capability in
 list by passing id = 0
Date: Fri, 22 Sep 2017 20:37:55 +0200
Message-ID: <20170922183803.10701-6-hdegoede@redhat.com>
References: <20170922183803.10701-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170922183803.10701-1-hdegoede@redhat.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Hans de Goede <hdegoede@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Modify xhci_find_next_ext_cap(base, offset, id) to return the next
capability offset if 0 is passed for id. Otherwise it will behave as
previously and return the offset of the next capability with matching id

capability id 0 is not used by xhci (reserved)

This is useful when we want to loop through all capabilities.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/host/xhci-ext-caps.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ext-caps.h b/drivers/usb/host/xhci-ext-caps.h
index 28deea584884..c1b404224839 100644
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
2.14.1
