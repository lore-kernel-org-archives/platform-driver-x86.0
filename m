Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F95158A09
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 06:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.71.154.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732084865; cv=none; b=CQ0ZxggDg8eASw5UD/G6iHyZeq/zgh/k91qmai+SdEDvJ0sX+atABuFgf/5TbnTEBjkm+HS54YgtU4JRPVEonD6KGUuhCY6OGBoGI/UhwTx9u7FeuUCWUUcHQhGfdpqVts5Eepkl16uslZncE4bORRB8Q3vl4xkIu+ThXu0OnIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732084865; c=relaxed/simple;
	bh=1VNxz5jrhpQMypUpSQ0AVceHqtewk2GNLDbrLrr5Fhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VxmQZ3jqHsjSLkFzcwXSZz9wjtoK+vK02nDm4L4WFx3GG7ckB1dPAokH6B0U2AKO/KKbRlTXYiEKM96JDJVjRKVNMyKHwWg39/VAm8N5unRuOZDef4r3XmdDybNPqmdvSexO4addTKuQITA/aailZvb8nmoLu+rZ9HeKONRCGZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=V8CqvqE+; arc=none smtp.client-ip=216.71.154.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="V8CqvqE+"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1732084863; x=1763620863;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1VNxz5jrhpQMypUpSQ0AVceHqtewk2GNLDbrLrr5Fhg=;
  b=V8CqvqE+08bJc9WgBm/HkUlILHKs5FHvX5sXmmgbvxjFQZIXiueg+Ezp
   f1vHir7NouCYg8b9PEHfLoNLYliD5DNgGKUwLS/8glEppeEwyERs/j78M
   EkLGXdaa86uQdiSeW6zazzYOuOC/Qlw7YiM3baup9iBgoobMmd5886Rk+
   9TNpXBm+BPJDsCsYbc1OVWE8B9s5kMo92vEhWy2c1oeIqhslfFpfMkWG4
   RuTlLtVuF6xl2gV4N7K2td9daOkdWT1ikKh6uMMNdFbqORwJKxP862mXZ
   q6Z/WJVbxWD+vyI1uKCv65728xW1k1xBR4uFIbBVaZvjQmUmCd0OvxsAo
   g==;
X-CSE-ConnectionGUID: 6DdIzDPBQfKaJ3i9dsRNJg==
X-CSE-MsgGUID: Knfzh5+nTcKzvfxG2iiYhg==
X-IronPort-AV: E=Sophos;i="6.12,168,1728921600"; 
   d="scan'208";a="31828837"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 20 Nov 2024 14:40:56 +0800
IronPort-SDR: 673d75e6_bN/r/kmkkEUeiWjBggrfCHotOKYpKOkZSpZ3ZhIUbtvMYXK
 9Bybj7WYoilhDBaqzOIM90sfjcsaY0T3tViiYOg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2024 21:38:46 -0800
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip01.wdc.com with ESMTP; 19 Nov 2024 22:40:56 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ilpo.jarvinen@linux.intel.com,
	danielwa@cisco.com,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH] p2sb: Do not scan and remove the P2SB device when it is hidden
Date: Wed, 20 Nov 2024 15:40:55 +0900
Message-ID: <20241120064055.245969-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When drivers access P2SB device resources, it calls p2sb_bar() to obtain
the resources. Before the commit 5913320eb0b3 ("platform/x86: p2sb:
Allow p2sb_bar() calls during PCI device probe"), p2sb_bar() obtained
the resources and then called pci_stop_and_remove_bus_device() for clean
up. Then the P2SB device disappeared even when the BIOS does not hide
the P2SB device. The commit introduced the P2SB device resource cache
feature in the boot process. During the resource cache process,
pci_stop_and_remove_bus_device() is called for the P2SB device, then the
P2SB device disappears regardless of whether p2sb_bar() is called or
not. Such P2SB device disappearance caused a confusion [1]. To avoid the
confusion, avoid the pci_stop_and_remove_bus_device() call when the BIOS
does not hide the P2SB device.

For that purpose, add a new helper function p2sb_read_and_cache(), which
does the same work as p2sb_scan_and_cache() but does not call
pci_stop_and_remove_bus_device(). These two functions are almost same
except the device scan and remove. Then make them call the single
function p2sb_cache_devfn(), which takes the argument "bool scan".

If the BIOS does not hide the P2SB device, just call
p2sb_read_and_cache() to cache the resources. If not, do additional
preparations (lock "rescan remove" for parallel scan, and unhide the
P2SB device), then call p2sb_scan_and_cache().

Fixes: 5913320eb0b3 ("platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe")
Closes: https://lore.kernel.org/lkml/ZzTI+biIUTvFT6NC@goliath/ [1]
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 drivers/platform/x86/p2sb.c | 51 +++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 31f38309b389..43b712b7a1ea 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -79,29 +79,37 @@ static void p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
 	mem->desc = bar0->desc;
 }
 
-static void p2sb_scan_and_cache_devfn(struct pci_bus *bus, unsigned int devfn)
+static void __p2sb_cache_devfn(struct pci_bus *bus, unsigned int devfn,
+			       bool scan)
 {
 	struct p2sb_res_cache *cache = &p2sb_resources[PCI_FUNC(devfn)];
 	struct pci_dev *pdev;
 
-	pdev = pci_scan_single_device(bus, devfn);
+	if (scan)
+		pdev = pci_scan_single_device(bus, devfn);
+	else
+		pdev = pci_get_slot(bus, devfn);
+
 	if (!pdev)
 		return;
 
 	p2sb_read_bar0(pdev, &cache->res);
 	cache->bus_dev_id = bus->dev.id;
 
-	pci_stop_and_remove_bus_device(pdev);
+	if (scan)
+		pci_stop_and_remove_bus_device(pdev);
+	else
+		pci_dev_put(pdev);
 }
 
-static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
+static int p2sb_cache_devfn(struct pci_bus *bus, unsigned int devfn, bool scan)
 {
-	/* Scan the P2SB device and cache its BAR0 */
-	p2sb_scan_and_cache_devfn(bus, devfn);
+	/* Scan or read the P2SB device and cache its BAR0 */
+	__p2sb_cache_devfn(bus, devfn, scan);
 
 	/* On Goldmont p2sb_bar() also gets called for the SPI controller */
 	if (devfn == P2SB_DEVFN_GOLDMONT)
-		p2sb_scan_and_cache_devfn(bus, SPI_DEVFN_GOLDMONT);
+		__p2sb_cache_devfn(bus, SPI_DEVFN_GOLDMONT, scan);
 
 	if (!p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res))
 		return -ENOENT;
@@ -109,6 +117,16 @@ static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
 	return 0;
 }
 
+static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
+{
+	return p2sb_cache_devfn(bus, devfn, true);
+}
+
+static int p2sb_read_and_cache(struct pci_bus *bus, unsigned int devfn)
+{
+	return p2sb_cache_devfn(bus, devfn, false);
+}
+
 static struct pci_bus *p2sb_get_bus(struct pci_bus *bus)
 {
 	static struct pci_bus *p2sb_bus;
@@ -145,6 +163,14 @@ static int p2sb_cache_resources(void)
 	if (!PCI_POSSIBLE_ERROR(class) && class != PCI_CLASS_MEMORY_OTHER)
 		return -ENODEV;
 
+	/*
+	 * The BIOS does not hide the P2SB device then it should have been
+	 * enumerated by the PCI subsystem. Get the resources from it.
+	 */
+	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
+	if ((value & P2SBC_HIDE) != P2SBC_HIDE)
+		return p2sb_read_and_cache(bus, devfn_p2sb);
+
 	/*
 	 * Prevent concurrent PCI bus scan from seeing the P2SB device and
 	 * removing via sysfs while it is temporarily exposed.
@@ -154,17 +180,10 @@ static int p2sb_cache_resources(void)
 	/*
 	 * The BIOS prevents the P2SB device from being enumerated by the PCI
 	 * subsystem, so we need to unhide and hide it back to lookup the BAR.
-	 * Unhide the P2SB device here, if needed.
 	 */
-	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
-	if (value & P2SBC_HIDE)
-		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
-
+	pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
 	ret = p2sb_scan_and_cache(bus, devfn_p2sb);
-
-	/* Hide the P2SB device, if it was hidden */
-	if (value & P2SBC_HIDE)
-		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
+	pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
 
 	pci_unlock_rescan_remove();
 
-- 
2.47.0

