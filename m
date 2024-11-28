Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47938F64
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Nov 2024 00:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.71.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732753724; cv=none; b=O1RwKOaZXdnbJX7rw9sHrjd9CNG5JtBpQjRIxscmsrw8p9rgHTPGwqPR6utzvj7afRK6nEjvVMQt00Zpl6hXI4sm1ic+vnL0ORrQskAFMbgiEn3X/kXxpcyJHLSsACP8+1OQHSlIRKAYEQeFM18CqSzDPHu4lCvqMEegQjXtUD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732753724; c=relaxed/simple;
	bh=VNtbFFkcpnDe7mxxpCDHubJfS44qlBtPRva34M+zs20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qEDcvgJLawHdFtcV6zO1wDJpMQSYz83LzMU0eHGkDBI3g8dEeaVmGfiHU9V/RFbq2ft+XKVvqcPQDE3ZJICgBQXlbMWRh6G1BLUyNm5k/sy5FoMy9M2OjIXgur2D9adsnuHHNOI3NnKYKjvyVw6YIKU4aekfcwasKCQkgmcUls4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=cQQErOjP; arc=none smtp.client-ip=216.71.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="cQQErOjP"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1732753723; x=1764289723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VNtbFFkcpnDe7mxxpCDHubJfS44qlBtPRva34M+zs20=;
  b=cQQErOjPnMhA7oCQ1UfilLHXWq7DyBE0eZRxLT4sJTlmDcCtRWzMurYJ
   x2FjPsGbl0ye8BV6IulPVrWlVWhteEOFrfVSpEPqdyIdRpEHJg76UW0LM
   S2kr8xhixHxZZYsQZj263cjQKE/9VHoJm2WFwmVA/W49BIwQzgJmGIpT2
   pTiYDevaLnfAjvm//uOh3hUdEuP2aTjIftUcbXOimH6QyIgSw0oJ9AHPr
   pramdfLMEC/RCEfLe2pjujtaWLZddIRZucyo9vki/tX3+S2J9HARUxt2x
   r+4kBDFCuwl3skl5NGupD9lzT1TYjnzCNmAuGXbHVbX5iiSddYTd1smU6
   g==;
X-CSE-ConnectionGUID: MjMKdDeaQ9Wn1DHy9s/vGQ==
X-CSE-MsgGUID: 1eBkyGX8RQiwc5OpaQaeZg==
X-IronPort-AV: E=Sophos;i="6.12,190,1728921600"; 
   d="scan'208";a="32605721"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2024 08:28:43 +0800
IronPort-SDR: 6747aa9e_BGNRx+Q2zmn49/AekFnlOBorf3gn8NXHep0vz69TSaKhgXO
 iIFYcryWsN8rLuEj3n6bl9osx/x7FkZKInViJ/A==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Nov 2024 15:26:22 -0800
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip01.wdc.com with ESMTP; 27 Nov 2024 16:28:42 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ilpo.jarvinen@linux.intel.com,
	danielwa@cisco.com,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v4 4/4] p2sb: Do not scan and remove the P2SB device when it is unhidden
Date: Thu, 28 Nov 2024 09:28:36 +0900
Message-ID: <20241128002836.373745-5-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128002836.373745-1-shinichiro.kawasaki@wdc.com>
References: <20241128002836.373745-1-shinichiro.kawasaki@wdc.com>
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
Closes: https://lore.kernel.org/lkml/ZzTI+biIUTvFT6NC@goliath/ [1]
Fixes: 5913320eb0b3 ("platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe")
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/p2sb.c | 42 +++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 0bc6b21c4c20..c56650b9ff96 100644
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
@@ -141,7 +137,7 @@ static int p2sb_cache_resources(void)
 	u32 value = P2SBC_HIDE;
 	struct pci_bus *bus;
 	u16 class;
-	int ret;
+	int ret = 0;
 
 	/* Get devfn for P2SB device itself */
 	p2sb_get_devfn(&devfn_p2sb);
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

