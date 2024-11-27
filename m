Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C476614659C
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Nov 2024 06:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.71.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732687333; cv=none; b=ThaAy+z6n4h0Lazu/rQ1M7BETY6dnUIv/PyNfMj7n18CUhUiFAhPiabGJAru7jF+s2ju9FFz5fO4HJuLEdHJH1qdsYExBgzHEH6Ibb0+1DRu3HKk2VVqiyjh170p641T8Km1I+4kxqN5OYkcBuudRI1w3OFC6m2HdvI0j+Zj3vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732687333; c=relaxed/simple;
	bh=arQKyFKda9d3Smuu7cv1BVwqMNffZFmKride/qoJ6KA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J1QkUc6HG7j7enuH7QHE8kjzMxKcAnRephqMQhjUYj/tubIynb4HGaZZ8rfyNhrddva25dRyfuskevkFmh11LRehF5QJJYhu3aG7LUlyDrCanMUkbQ4+DoFCSvyqVD3Mj8oXG0thXJaIp1UFnDXobfeMQa2fuTahMKZsFk4LGAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=mNVAc+Yg; arc=none smtp.client-ip=216.71.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="mNVAc+Yg"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1732687332; x=1764223332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=arQKyFKda9d3Smuu7cv1BVwqMNffZFmKride/qoJ6KA=;
  b=mNVAc+YgV2OgE4RJd/W6U/uic7P4iYpAHqyZmmbgg8RlbUJ153NClwDA
   eFY9SBBlY+PJXsik8/bFXKsmM56eILluaUfbZkHLxFcoIhO1zUTWBhHnn
   adpybt18aug9BVkvqhOnJjHGcS7ZEzvMRPUNN2iR/ANoRnBhvUL0RoW7T
   xl6H3bBuRVg40dyDYY1ilVoDesFU6RQ5nCFvCGyB7S0VDtvxC9wOSU+Yz
   HDmms9PT4Xz1N/Ddz1AtjfVgOl4BCLKWLz2Al4BscZE6OQiqOSGfNuTwd
   Xi2lYPGuKdb1kvJENFVuVvu/HjSE6dZxRNKRhj1+x/dd7eeIGepf5eyNc
   Q==;
X-CSE-ConnectionGUID: V/hJFkXWQAWG18hE8aE6NA==
X-CSE-MsgGUID: x6RaoRP6QRyCuOrB6rLWwQ==
X-IronPort-AV: E=Sophos;i="6.12,188,1728921600"; 
   d="scan'208";a="32533140"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 27 Nov 2024 14:01:01 +0800
IronPort-SDR: 6746a84d_4nwNiDLzUIazgYrhcnenNcDvofx+LU5neHq4B+kjTvMW/Ih
 LE53iV+oONuT7a71xIjXpZy8Sd3v1/phZuPjqyw==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Nov 2024 21:04:13 -0800
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip02.wdc.com with ESMTP; 26 Nov 2024 22:01:01 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ilpo.jarvinen@linux.intel.com,
	danielwa@cisco.com,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v3 3/4] p2sb: Move P2SB hide and unhide code to p2sb_scan_and_cache()
Date: Wed, 27 Nov 2024 15:00:54 +0900
Message-ID: <20241127060055.357498-4-shinichiro.kawasaki@wdc.com>
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

To prepare for the following fix, move the code to hide and unhide the
P2SB device from p2sb_cache_resources() to p2sb_scan_and_cache().

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 drivers/platform/x86/p2sb.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 273ac90c8fbd..0bc6b21c4c20 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -97,6 +97,14 @@ static void p2sb_scan_and_cache_devfn(struct pci_bus *bus, unsigned int devfn)
 
 static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
 {
+	/*
+	 * The BIOS prevents the P2SB device from being enumerated by the PCI
+	 * subsystem, so we need to unhide and hide it back to lookup the BAR.
+	 * Unhide the P2SB device here, if needed.
+	 */
+	if (p2sb_hidden_by_bios)
+		pci_bus_write_config_dword(bus, devfn, P2SBC, 0);
+
 	/* Scan the P2SB device and cache its BAR0 */
 	p2sb_scan_and_cache_devfn(bus, devfn);
 
@@ -104,6 +112,10 @@ static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
 	if (devfn == P2SB_DEVFN_GOLDMONT)
 		p2sb_scan_and_cache_devfn(bus, SPI_DEVFN_GOLDMONT);
 
+	/* Hide the P2SB device, if it was hidden */
+	if (p2sb_hidden_by_bios)
+		pci_bus_write_config_dword(bus, devfn, P2SBC, P2SBC_HIDE);
+
 	if (!p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res))
 		return -ENOENT;
 
@@ -152,22 +164,11 @@ static int p2sb_cache_resources(void)
 	 */
 	pci_lock_rescan_remove();
 
-	/*
-	 * The BIOS prevents the P2SB device from being enumerated by the PCI
-	 * subsystem, so we need to unhide and hide it back to lookup the BAR.
-	 * Unhide the P2SB device here, if needed.
-	 */
 	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
 	p2sb_hidden_by_bios = value & P2SBC_HIDE;
-	if (p2sb_hidden_by_bios)
-		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
 
 	ret = p2sb_scan_and_cache(bus, devfn_p2sb);
 
-	/* Hide the P2SB device, if it was hidden */
-	if (p2sb_hidden_by_bios)
-		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
-
 	pci_unlock_rescan_remove();
 
 	return ret;
-- 
2.47.0

