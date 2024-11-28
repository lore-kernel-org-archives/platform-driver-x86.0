Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F26DDAB
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Nov 2024 00:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.71.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732753721; cv=none; b=BK3cJ6XvoDPtZeWkFf6T5oPjKcXYdKc5VhCB8JmXVHXo5rCoEmKye62HrQaoBKjAUukxoLJYaCq/GMeHXqdv8+mcVp39RffVynwWLRranmX+s46CGslHq9Ks3zcvtlBZnJg9MxzbjwsUoIZCn7R2jAkppu39IiI5pZE0TQUR+Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732753721; c=relaxed/simple;
	bh=H360zmVqItcd2atbk96/Y/SuSRUPcE+upBz7d7vhzCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6cYkewXoWO0qBMarQZkDm4k1l3TDLCZfggk4KdIEM9CjbllQz6GemGIUcB3l1lKzzC2baqJuPp1CFZ538IpxyBKxPTQ63A12nAvfmJB21jSr9+3VRuIqs21L9HEVpu8cWQmuMiyrzM4YXADA9H9ESoSkbKT+bTlfFLKD+BjwpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=nxNI4Dpj; arc=none smtp.client-ip=216.71.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="nxNI4Dpj"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1732753720; x=1764289720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H360zmVqItcd2atbk96/Y/SuSRUPcE+upBz7d7vhzCw=;
  b=nxNI4DpjbvbHZ+JTq/qFO71ClKHEamms/V26rkxAD7iaO2X2p149zPl2
   QfYhPbRpASWr2q0y6tVHfimIXv0Zxrn1fCxi2qsTdJPIA4c0INRHmh3US
   cpqo+g5Lqp9Uf28zo7k5pEWtBfVu42YD6zqy1ta1uJFu2hfJLaujMlAuu
   MH9UKO3extTguqSOI4H6n3g6R+EQ6gf0gEacyqq+Uc+j3ZB3BTRTw52I3
   hWVR+vM1MPmhKLCj2B5aGj2bwOFpZYnJosSXrmSJcz9pKuR8eqkTul1PL
   ykhS6FMAiTehaebgTgW5ew9uTjopSMQOb8PxuoRlYGwlKZyu7hMV8Jl20
   w==;
X-CSE-ConnectionGUID: B8/wyn7qTHijCozoEIBv0Q==
X-CSE-MsgGUID: m0E9k/rhTYmabYfT8iBqwA==
X-IronPort-AV: E=Sophos;i="6.12,190,1728921600"; 
   d="scan'208";a="32605712"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2024 08:28:39 +0800
IronPort-SDR: 6747aa9a_2gE9F9hWocMW2h74drOKFJo7WR4cnn8kl7Nds/l6aH7vrCl
 Sj2jJuvzz0o/kb8DsohZt1AcFy6HsPocOjmpphA==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Nov 2024 15:26:18 -0800
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip01.wdc.com with ESMTP; 27 Nov 2024 16:28:38 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ilpo.jarvinen@linux.intel.com,
	danielwa@cisco.com,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v4 1/4] p2sb: Factor out p2sb_read_from_cache()
Date: Thu, 28 Nov 2024 09:28:33 +0900
Message-ID: <20241128002836.373745-2-shinichiro.kawasaki@wdc.com>
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

To prepare for the following fix, factor out the code to read the P2SB
resource from the cache to the new function p2sb_read_from_cache().

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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

