Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B10A18EA2
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Nov 2024 04:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.71.154.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732508617; cv=none; b=TWzkeeDi5LTc4H9z9050ZAHnu03gl4XuiFPwWguqkWDlBFguQhGkM1V/VPWWnmMrA6Juetu5Um/1F01hHEgtiSaPqZs1AAumwUxYmwRNEx3izQYJEKfNGAIoURyUWKKvPUiynZC8e5hJNlYrW3Wp4O6XMegkU1fYcTF5LKkqRc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732508617; c=relaxed/simple;
	bh=ttvnwOJZvCO3bI/dyhRMPi+Kp9QbJX2Bo/LNdRjqilU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o7eQNZOq3JQm0SCEuPar6CX366IN4eSAIruSLrc5sFufeVZyeOSQ65FnRxzro0Y/Ur07nq/eYPeZEmKG+z7DkFOUawFO86GhT073FOaQsHSGSeeHJuoSdULsnS5C0aBNIlMTtVZa1Vh6J4ekXtEOQufSbzuyB37PWhWPvSf+kAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=d7Hp872p; arc=none smtp.client-ip=216.71.154.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="d7Hp872p"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1732508615; x=1764044615;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ttvnwOJZvCO3bI/dyhRMPi+Kp9QbJX2Bo/LNdRjqilU=;
  b=d7Hp872pCM3yMCX5REQVCbZwhWsm1FwUBLzyu8U44tOsKhBnDcA8KGw9
   1n/mKCyN3nKRIJ7nUzi7osGLeV65WfhO1/ilE1pAAgP2AA2O1HcTm2vsd
   eYX3nHTx6m4PPCyx9dHecqLRXIn5jp+w8L0Zf09W1vqxtEc4JpNrVNDWD
   /HOUckcpaR9EMd1Qoi/t+nmnSFHWcGgt6HTsSr/j59UifDo7kuqFRlSts
   8uB/2K+hvlugHiQ9Hvy2QYTKHCAxKKC7ytZBA+RbfC7qTdV/GxvwtIVwJ
   38HUzDU6NO9f/R8CN557C4l8pHSNBnVVnAJGuesko4ietqgn4gNadpnDy
   g==;
X-CSE-ConnectionGUID: 6r3NSEhHQZm5qjksO9a3HA==
X-CSE-MsgGUID: dxO0K4dNSluV4Scow/wqbw==
X-IronPort-AV: E=Sophos;i="6.12,182,1728921600"; 
   d="scan'208";a="31628275"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 25 Nov 2024 12:23:28 +0800
IronPort-SDR: 6743ed27_hiGLUzlzn6uS+yMq9MFTVcxcbqxC2xixgHzTiorxjefznUM
 cvmA13pH5bpsHEaFOlIHOk9yw5ENgfbiCCMIgNA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Nov 2024 19:21:11 -0800
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip02.wdc.com with ESMTP; 24 Nov 2024 20:23:27 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ilpo.jarvinen@linux.intel.com,
	danielwa@cisco.com,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v2] p2sb: Do not scan and remove the P2SB device when it is unhidden
Date: Mon, 25 Nov 2024 13:23:26 +0900
Message-ID: <20241125042326.304780-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.47.0
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

For that purpose, cache the P2SB device resources only if the P2SB
device is hidden. When p2sb_cache_resources() is called, check if the
device is hidden and store the result in the global flag p2sb_hidden.
Check the flag in p2sb_bar() and if the device is hidden, refer to the
cached resources. Otherwise, read the resources from the unhidden P2SB
device.

Reported-by: "Daniel Walker (danielwa)" <danielwa@cisco.com>
Fixes: 5913320eb0b3 ("platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe")
Closes: https://lore.kernel.org/lkml/ZzTI+biIUTvFT6NC@goliath/ [1]
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
Changes from v1:
* Put back P2SBC_HIDE flag reference code in the rescan_remove lock region
* Do not cache resources when the P2SB device is not hidden
* Added the Reported-by tag

 drivers/platform/x86/p2sb.c | 56 ++++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 31f38309b389..0b1d604fcfe5 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -42,6 +42,7 @@ struct p2sb_res_cache {
 };
 
 static struct p2sb_res_cache p2sb_resources[NR_P2SB_RES_CACHE];
+static bool p2sb_hidden;
 
 static void p2sb_get_devfn(unsigned int *devfn)
 {
@@ -152,20 +153,23 @@ static int p2sb_cache_resources(void)
 	pci_lock_rescan_remove();
 
 	/*
-	 * The BIOS prevents the P2SB device from being enumerated by the PCI
-	 * subsystem, so we need to unhide and hide it back to lookup the BAR.
-	 * Unhide the P2SB device here, if needed.
+	 * The BIOS does not hide the P2SB device then its resources are
+	 * accesilble. Do not cache them.
 	 */
 	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
-	if (value & P2SBC_HIDE)
-		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
+	p2sb_hidden = value & P2SBC_HIDE;
+	if (!p2sb_hidden)
+		goto unlock;
 
+	/*
+	 * The BIOS prevents the P2SB device from being enumerated by the PCI
+	 * subsystem, so we need to unhide and hide it back to lookup the BAR.
+	 */
+	pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
 	ret = p2sb_scan_and_cache(bus, devfn_p2sb);
+	pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
 
-	/* Hide the P2SB device, if it was hidden */
-	if (value & P2SBC_HIDE)
-		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
-
+unlock:
 	pci_unlock_rescan_remove();
 
 	return ret;
@@ -188,6 +192,8 @@ static int p2sb_cache_resources(void)
 int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
 {
 	struct p2sb_res_cache *cache;
+	struct pci_dev *pdev;
+	int ret = 0;
 
 	bus = p2sb_get_bus(bus);
 	if (!bus)
@@ -196,15 +202,33 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
 	if (!devfn)
 		p2sb_get_devfn(&devfn);
 
-	cache = &p2sb_resources[PCI_FUNC(devfn)];
-	if (cache->bus_dev_id != bus->dev.id)
-		return -ENODEV;
+	/*
+	 * If the P2SB device is hidden, refer to the cached resources.
+	 * Otherwise, read the resources on the fly.
+	 */
+	if (p2sb_hidden) {
+		cache = &p2sb_resources[PCI_FUNC(devfn)];
+		if (cache->bus_dev_id != bus->dev.id)
+			return -ENODEV;
 
-	if (!p2sb_valid_resource(&cache->res))
-		return -ENOENT;
+		if (!p2sb_valid_resource(&cache->res))
+			return -ENOENT;
 
-	memcpy(mem, &cache->res, sizeof(*mem));
-	return 0;
+		memcpy(mem, &cache->res, sizeof(*mem));
+	} else {
+		pdev = pci_get_slot(bus, devfn);
+		if (!pdev)
+			return -ENODEV;
+
+		if (p2sb_valid_resource(pci_resource_n(pdev, 0)))
+			p2sb_read_bar0(pdev, mem);
+		else
+			ret = -ENOENT;
+
+		pci_dev_put(pdev);
+	}
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(p2sb_bar);
 
-- 
2.47.0

