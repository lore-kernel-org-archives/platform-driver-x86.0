Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A8814831F
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Nov 2024 06:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.71.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732687334; cv=none; b=Z9A8rPahmRvIT8kRT2OrE4C3V8N8Aiq4xcBobAhW9Z2UgKFoN3OT9/wTfMJYG0fQ1VmUjH9EtDG3jzAR4ZG8oQFmDMZWNRItnsTAnkiB2qU6pG7hMOBiQxtQpxbp7dmd7HsKAYHXsZlZBSycqa3uy235pX3cRRlKl7Fh6xvaGeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732687334; c=relaxed/simple;
	bh=8TcwO646rfU/sRD1K6BnXowlethh7x/iWDcX67wg06Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cIDmr6jlKxo73ET8hhfb4cwdhLf/EIYj0j0W2i8B5icWwNvCOI7wu663M55HnT0iCEmaaS6yGqcr+fQ/rs37+s29FXoDpFlrXvJDWq5DjrrdlI0VbFaER7gJw7/SWaxcmRFlaxthgqmkLVvG3Bmliuyo4h6C7G/SQQODriaA/jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=TWcG3nFe; arc=none smtp.client-ip=216.71.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="TWcG3nFe"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1732687332; x=1764223332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8TcwO646rfU/sRD1K6BnXowlethh7x/iWDcX67wg06Q=;
  b=TWcG3nFeTWE9dMR75It9Ks+kxJNv50XrT3Cw0DL7l4pt/49pq+l5nVM7
   NTXKluMr02a/P9TiBKWztibB8RDYPYQlEvElm4909kGRYfiZvupRjKe1r
   59+vpGvpE4PtI6IDyt+o6vUHvZ1n3ibXtRI/72pyOqd8GUKAUiEqU9lwk
   CdpzMuQR++kx742bgCaQ3ofqU04RKJ1lhh1w9qV/3MSRtatoU503Rb1MF
   0kPh/JMqiKlBaSEVbLyoibKJr3psXbDa8q0j7vHDDSUOuxAr7c1XdJhGf
   1jiuC7l/Bu0+u/ho6Jj1OLdbcCB4YARjd9l2KDgq77CFHLOy/V6meYiFE
   Q==;
X-CSE-ConnectionGUID: MjBpnurBQh+t1QZy6TZb9g==
X-CSE-MsgGUID: 4dpGqBUaRLKmZLIt065Tkw==
X-IronPort-AV: E=Sophos;i="6.12,188,1728921600"; 
   d="scan'208";a="32533141"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 27 Nov 2024 14:01:03 +0800
IronPort-SDR: 6746a84e_tRejygob95SytVYMBXyM0EooAfP7BAQlZttRSSUbPi/fEeF
 7EfrQL8fNfSbz5AoiX4kkwbOWitrBKnWo1deAQQ==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Nov 2024 21:04:14 -0800
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip02.wdc.com with ESMTP; 26 Nov 2024 22:01:03 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ilpo.jarvinen@linux.intel.com,
	danielwa@cisco.com,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v3 4/4] p2sb: Do not scan and remove the P2SB device when it is unhidden
Date: Wed, 27 Nov 2024 15:00:55 +0900
Message-ID: <20241127060055.357498-5-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241127060055.357498-1-shinichiro.kawasaki@wdc.com>
References: <20241127060055.357498-1-shinichiro.kawasaki@wdc.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When drivers access P2SB device resources, it calls p2sb_bar(). Before
the commit 5913320eb0b3 ("platform/x86: p2sb: Allow p2sb_bar() calls
during PCI device probe"), p2sb_bar() obtained the resources and then
called pci_stop_and_remove_bus_device() for clean up. Then the P2SB
device disappeared. The commit 5913320eb0b3 introduced the P2SB device
resource cache feature in the boot process. During the resource cache,
pci_stop_and_remove_bus_device() is called for the P2SB device, then the
P2SB device disappears regardless of whether p2sb_bar() is called or
not. Such P2SB device disappearance caused a confusion [1]. To avoid the
confusion, avoid the pci_stop_and_remove_bus_device() call when the BIOS
does not hide the P2SB device.

For that purpose, cache the P2SB device resources only if the BIOS hides
the P2SB device. Call p2sb_scan_and_cache() only if p2sb_hidden_by_bios
is true. This allows removing two branches from p2sb_scan_and_cache().
When p2sb_bar() is called, get the resources from the cache if the P2SB
device is hidden. Otherwise, read the resources from the unhidden P2SB
device.

Reported-by: "Daniel Walker (danielwa)" <danielwa@cisco.com>
Fixes: 5913320eb0b3 ("platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe")
Closes: https://lore.kernel.org/lkml/ZzTI+biIUTvFT6NC@goliath/ [1]
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 drivers/platform/x86/p2sb.c | 40 +++++++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 0bc6b21c4c20..1b2d83c4b02a 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -100,10 +100,8 @@ static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
 	/*
 	 * The BIOS prevents the P2SB device from being enumerated by the PCI
 	 * subsystem, so we need to unhide and hide it back to lookup the BAR.
-	 * Unhide the P2SB device here, if needed.
 	 */
-	if (p2sb_hidden_by_bios)
-		pci_bus_write_config_dword(bus, devfn, P2SBC, 0);
+	pci_bus_write_config_dword(bus, devfn, P2SBC, 0);
 
 	/* Scan the P2SB device and cache its BAR0 */
 	p2sb_scan_and_cache_devfn(bus, devfn);
@@ -112,9 +110,7 @@ static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
 	if (devfn == P2SB_DEVFN_GOLDMONT)
 		p2sb_scan_and_cache_devfn(bus, SPI_DEVFN_GOLDMONT);
 
-	/* Hide the P2SB device, if it was hidden */
-	if (p2sb_hidden_by_bios)
-		pci_bus_write_config_dword(bus, devfn, P2SBC, P2SBC_HIDE);
+	pci_bus_write_config_dword(bus, devfn, P2SBC, P2SBC_HIDE);
 
 	if (!p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res))
 		return -ENOENT;
@@ -167,7 +163,12 @@ static int p2sb_cache_resources(void)
 	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
 	p2sb_hidden_by_bios = value & P2SBC_HIDE;
 
-	ret = p2sb_scan_and_cache(bus, devfn_p2sb);
+	/*
+	 * If the BIOS does not hide the P2SB device then its resources
+	 * are accesilble. Cache them only if the P2SB device is hidden.
+	 */
+	if (p2sb_hidden_by_bios)
+		ret = p2sb_scan_and_cache(bus, devfn_p2sb);
 
 	pci_unlock_rescan_remove();
 
@@ -190,6 +191,26 @@ static int p2sb_read_from_cache(struct pci_bus *bus, unsigned int devfn,
 	return 0;
 }
 
+static int p2sb_read_from_dev(struct pci_bus *bus, unsigned int devfn,
+			      struct resource *mem)
+{
+	struct pci_dev *pdev;
+	int ret = 0;
+
+	pdev = pci_get_slot(bus, devfn);
+	if (!pdev)
+		return -ENODEV;
+
+	if (p2sb_valid_resource(pci_resource_n(pdev, 0)))
+		p2sb_read_bar0(pdev, mem);
+	else
+		ret = -ENOENT;
+
+	pci_dev_put(pdev);
+
+	return ret;
+}
+
 /**
  * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
  * @bus: PCI bus to communicate with
@@ -213,7 +234,10 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
 	if (!devfn)
 		p2sb_get_devfn(&devfn);
 
-	return p2sb_read_from_cache(bus, devfn, mem);
+	if (p2sb_hidden_by_bios)
+		return p2sb_read_from_cache(bus, devfn, mem);
+
+	return p2sb_read_from_dev(bus, devfn, mem);
 }
 EXPORT_SYMBOL_GPL(p2sb_bar);
 
-- 
2.47.0

