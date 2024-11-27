Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A3B146D68
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Nov 2024 06:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.71.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732687331; cv=none; b=Mm879CWKnpeesThk5CttqiBZ0gMfNDShstEGvUSuU7wBGvekI0BBhqy+n/akzmE7h9BKNoZXnF52N+0cX8NhVBHczUl4/BI9B8cwZNFVF6F4qFXGFVBx3TgUgb5778TEOQiDoHTNEAB9XswHmUdZnGoMcQL8E067bSIbdDwZGS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732687331; c=relaxed/simple;
	bh=MXVjNzaY09jOJAxY5EJMzPcgp5c2K7MD/Zs5KmStsR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdwD4OCe0R6V+q4qZsvxqYamp46lUDxTS9RQzLfoiSTD3yKusnGnVoYAvLCnPs103FX/DEdp0DqEFvex/1ZeQqnWH0/PVZoHAfUiTp+a7yD758pUIBvz1y4WwoKpfAFKs7b95Rmqqe2+goBZLOYKjODTDDSaNauQs1Lbmorn7IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=LiJZlANj; arc=none smtp.client-ip=216.71.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="LiJZlANj"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1732687330; x=1764223330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MXVjNzaY09jOJAxY5EJMzPcgp5c2K7MD/Zs5KmStsR0=;
  b=LiJZlANjduGUfmLbB4JLxYZwPFRIRIgZE91f1V+8ay3GNYSHh85rDZSX
   sp49gXdW7UN0jdS5DD+vD1BSvmgGAeNPYnQd2jSA+iiJWQvnqeavYtFOq
   7EoIdwG/WY1NIwu0Q5imLs5MIdSiUzs6FABOmVac8P7FDhTGWe52JIl3w
   KCUGJQcQreCTPRPG/Jbuoe7Ze9RGNLa1Df7HtJwwZecT71UVesHEUWHfR
   Dkh0PtgYe8jp3S9NWUzK34v99o3F+WoyEptPLtXnlbMj1nvgXqAOWfPXC
   zbPa+OZrkN1RfdTEZweROTdQrOzXvun17NrFypEwDVrll40Lzsj0KVt31
   g==;
X-CSE-ConnectionGUID: 9yJNL534R6CQO3+t9YJZ2w==
X-CSE-MsgGUID: yf7osQzbQuuRZr+u2kPVVQ==
X-IronPort-AV: E=Sophos;i="6.12,188,1728921600"; 
   d="scan'208";a="32533130"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 27 Nov 2024 14:00:59 +0800
IronPort-SDR: 6746a84a_dXyU/FkCVIxBSZfSwVmt9zXN1pQN2rs+YZD6uUG3TdOqBYz
 5uSk58wVA764/KRHooV1TfIvbR2bxoPleAWmXYA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Nov 2024 21:04:10 -0800
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip02.wdc.com with ESMTP; 26 Nov 2024 22:00:58 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ilpo.jarvinen@linux.intel.com,
	danielwa@cisco.com,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v3 1/4] p2sb: Factor out p2sb_read_from_cache()
Date: Wed, 27 Nov 2024 15:00:52 +0900
Message-ID: <20241127060055.357498-2-shinichiro.kawasaki@wdc.com>
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

To prepare for the following fix, factor out the code to read the P2SB
resource from the cache to the new function p2sb_read_from_cache().

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 drivers/platform/x86/p2sb.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 31f38309b389..aa34b8a69bc1 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -171,6 +171,22 @@ static int p2sb_cache_resources(void)
 	return ret;
 }
 
+static int p2sb_read_from_cache(struct pci_bus *bus, unsigned int devfn,
+				struct resource *mem)
+{
+	struct p2sb_res_cache *cache = &p2sb_resources[PCI_FUNC(devfn)];
+
+	if (cache->bus_dev_id != bus->dev.id)
+		return -ENODEV;
+
+	if (!p2sb_valid_resource(&cache->res))
+		return -ENOENT;
+
+	memcpy(mem, &cache->res, sizeof(*mem));
+
+	return 0;
+}
+
 /**
  * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
  * @bus: PCI bus to communicate with
@@ -187,8 +203,6 @@ static int p2sb_cache_resources(void)
  */
 int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
 {
-	struct p2sb_res_cache *cache;
-
 	bus = p2sb_get_bus(bus);
 	if (!bus)
 		return -ENODEV;
@@ -196,15 +210,7 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
 	if (!devfn)
 		p2sb_get_devfn(&devfn);
 
-	cache = &p2sb_resources[PCI_FUNC(devfn)];
-	if (cache->bus_dev_id != bus->dev.id)
-		return -ENODEV;
-
-	if (!p2sb_valid_resource(&cache->res))
-		return -ENOENT;
-
-	memcpy(mem, &cache->res, sizeof(*mem));
-	return 0;
+	return p2sb_read_from_cache(bus, devfn, mem);
 }
 EXPORT_SYMBOL_GPL(p2sb_bar);
 
-- 
2.47.0

