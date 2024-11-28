Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FA7A93D
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Nov 2024 00:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.71.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732753723; cv=none; b=iTBqshHwLC2JmalsilNlLZGXGf6L1cs+SyWQjddQZ9fAG/sUuCTZxcE3apJg/JYQw1Xw4i03DKoQe4hkUgEVHGF99c3Nn78HaDuqriTolBopikVjQjK48LHWowYrjW5gHz8pRhifLawhVdEfn2zXfO6Fp3XhbHvOx4c4361/2Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732753723; c=relaxed/simple;
	bh=zCQ71AJkoGwyIGw5aiYqYzPtxk04vVSfm1rrz2UuMSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MEnkhCfwXj82fqZIx7O4LdIVXI2UlU9zrapkQoRjIovEbqErrymkhYebk7snD3O3t32LeUCO3Vm0s8rZNMa+C7cEbRlWBP6DadJxZACcrdaOX0qZqK79h5JxILYteP/lRj+vo6O6k/JjBXPzyjqIEaQJ52wF6lNcSfwWp4jlFG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=j0K6Ewkh; arc=none smtp.client-ip=216.71.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="j0K6Ewkh"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1732753722; x=1764289722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zCQ71AJkoGwyIGw5aiYqYzPtxk04vVSfm1rrz2UuMSo=;
  b=j0K6EwkhTaQjHiJPBzxws6090RUzPM/kAmo5d53DcszyOQpgaAoMj6pK
   4n9+M12vFCjpaka/t4ZRjxJJbFergzzwnEjdReUgz9CHtKdzxaX8GXwsQ
   gAGwoZOA45+rvgPK6azdOCnRNsD64m+9qb1MeGjiAXZZAYgB82HsV7fjA
   TfbdvfvV0BDfTUwVfa2AK7tjJfTUhzkdUGsSiZSC4lzED/XVepQO32mXG
   ZjXDAcvb/A+q/nAm7NtITfryyblT9Y6apnmYNDzVetD91UZRfpLpjD/xS
   K822grjur01cPtdOykFf20e0IS9jcEPoaT2H2EdeVxEJUj27sY7IjgoLb
   Q==;
X-CSE-ConnectionGUID: MB0lAfYHTUuKNtb3W0PX2A==
X-CSE-MsgGUID: NGP8xd4kT4+9CUSebjGDig==
X-IronPort-AV: E=Sophos;i="6.12,190,1728921600"; 
   d="scan'208";a="32605720"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2024 08:28:42 +0800
IronPort-SDR: 6747aa9c_g0y8soBEdRck+NHfKtUMTIxLpnEq+uc8+t/XWddhYeo+Ut/
 0xM6vYz5qt7jCJ5iNFUtdW1Junqg2qPrJh90W5w==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Nov 2024 15:26:21 -0800
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip01.wdc.com with ESMTP; 27 Nov 2024 16:28:40 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ilpo.jarvinen@linux.intel.com,
	danielwa@cisco.com,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v4 3/4] p2sb: Move P2SB hide and unhide code to p2sb_scan_and_cache()
Date: Thu, 28 Nov 2024 09:28:35 +0900
Message-ID: <20241128002836.373745-4-shinichiro.kawasaki@wdc.com>
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

To prepare for the following fix, move the code to hide and unhide the
P2SB device from p2sb_cache_resources() to p2sb_scan_and_cache().

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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

