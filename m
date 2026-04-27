Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE8034F492;
	Mon, 27 Apr 2026 15:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305137; cv=fail; b=Wq/H1YJZt1PyFvp8Z1ck60f3txO/qSEJ+xntL3J7uaWxEF4WSj0gMJCTbXYeXHv6y5AAFsqQScJea3pStKRL2FBcVP+gG5FFhrMcapJ6GCWLl/y37mivCrknTlc5aAjhTh8h/cgBgqR1WswTUZFCMh9ETbAD0zBAf9m2xmoupls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305137; c=relaxed/simple;
	bh=89C6CtEL/1+a7ADws1NjDQjAV4Pz/4jLzb8zy/2XArU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iWgPcHcOovLoFDxLMQVyfDmYPGoPYDPEizQ7xIAvLykylXe9gYE/GH+xFl8QJD/Ac5Ot06n/ZS5915cRiGMlOE2Bg+eAdcb+zPuaYe+ea/kkvNHquNLH3iyHu39BLek4fuTzIqj8gn7yEN8ZezQOjXV1IBWky7IBRb9Y156l1xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DeQMtPCG; arc=fail smtp.client-ip=52.101.193.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DeQMtPCG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riz+tnXLekQ9i3/rNpBDD3xuCpCaDgdqZE+Q78ASQOcAG1fg0UFE9O0wYf1/4+9Q5FCjESdlf/b197XeyCHPZR4cPQmbEjRB7yO/Q1lBlHP3AAcjB428OK7YmPGC/B3fjqwn1W8tFPFYpxhFkwD2ywp2Nn4hJMbQyerD+MgRuNbkkOmljZe1EP4YL50B65MGWYcms5HKK3vkTim9TEuTN57Bom6WZOdauE2qnhmVamQaXy6KHWggrzKillUMXxpi988Cz6U/kaZPG5H+sGEF/8kZzqA1dMeruOhVa6Ptl7J7jZU49QzfYoQNmcdfW38I+Fae7kggovMXMg0HiXgVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cfhcxc/jodwlIupqDilGhGxlSlodjXYp7tF1JmZv0vs=;
 b=GdudgH61IRJT2TYcfUktvQPfyMMkU3u5E2H7L+YcVjChkLaZ/vxyYc+zOjMHnZO5Pim5n/HnpnvB3CEe6ILIVxQz+oa6S5Q+PKaxTkiexk4hOkkeXawZ/bBb6nvcQDdieKY5jxEdCvIEJ7gnZd1AtjA99baqs6jlEuX9lEndx4t0ubjda3kgdvbp6mXu4x4lUiCqs1Yafk4kYz5+LQi3vcr0euNlQVmV0K6o/cyV17G3t78cYmfuoqGpr0dfcpEJwEukQpdzTJV804Wq/Q35WWWqB9632kf9jSe6w5NSQlHMFoI2PfJwWq7RnoMVT/fxgpzOEvhLOo7aZaVpXfHPZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cfhcxc/jodwlIupqDilGhGxlSlodjXYp7tF1JmZv0vs=;
 b=DeQMtPCGuSg5oQc9waZZ3Lc9HQ7X+4SenLyNN4QV9Cn+s6SZ7SPkgXdIMbCCOwBEB6VS4ikDyEdzc+k7b10n9FbrUssoSqDnClZeWv17AZiLH/WCGQ0nSOYjvFfg7BymGNO8a+ZRhpoGG9ZNRU8rrfvAjlWxeW9Pa3DDmenQ9CA=
Received: from BN0PR03CA0034.namprd03.prod.outlook.com (2603:10b6:408:e7::9)
 by CY5PR12MB6131.namprd12.prod.outlook.com (2603:10b6:930:25::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 15:52:08 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::5) by BN0PR03CA0034.outlook.office365.com
 (2603:10b6:408:e7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 15:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 15:52:08 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 10:52:05 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<driver-core@lists.linux.dev>, Muralidhara M K <muralidhara.mk@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: [PATCH v2 6/7] platform/x86/amd/hsmp: Make metric table read locking use guard(mutex)
Date: Mon, 27 Apr 2026 21:21:28 +0530
Message-ID: <20260427155129.545327-7-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427155129.545327-1-muralidhara.mk@amd.com>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|CY5PR12MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a0ebe2-39b4-467c-2482-08dea474f01a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	LsNtGJQCFIrSzD+JOgBX8oxtmeZO86UTEGcN8h/uOaNkI56etdS01Mey6W1cX+MHRWEEK/bLrBp8MjInAlhBef7CIztB4to1p9t4y9vDQZGq4rn3Sm921gnpCRloI0sDTiziF1HJOWIHKAO/naY9EazcmwJwEGTmZJq8070jhhLyo3SZvX15XhCAFhAs6yZcUd+0WWaxVf+mBHrPuleeaXgpKlNRHzB34BrOcBHQSlfmvMvGwWHxufHWQzgei8JYlstVLxOKMOb+j2oDoTznem2t3kLIorNH0krOMpXrzzJ00yiRCET4pDb6ketUOJTe6afQfnYW/pbIPiyY+xKECbiurcEL1IvQSERWV0dHbn2woOFebELlC2H3VOP/CyNDfzhPw279b88nuONF9ylC/XoOGLxvxh1W5NNsGoXLCnx4fiMZtF9X+myG40pMWwWfmC6sHcYZ0Xbkl1V0HTktmybxlGZ7tlGs0C0KWUY8JQCsPb/JsZrarj66CrzFSCs/txMAhMKu/BFsc86cggcLDDy0Zd9T8f0mVargKboa8ypQLn/rtjVfoyXYZqqv4Rppl9xQSotUDCPw+KmGcT82CPn4DQIOKsP2o1Z6nC5uIVWxQ/4aUcJMyEk8XsUWAy/tRIUaXeQPxkizThpPnJFNl7ZD5o4B5QDzj0/+MgN/hqc4jcdkEYkIUYL7qEq3JjKfXzngWmPNaLgRXW/HEjsXwfdj6cLlatnI9hZhzhBk4tlfSjFzBN2DwgQVUsJLK9/bx0kAJweXo/fZbCpRuNB97Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6Y8VAArQ415yYX5EAUG/eiJWxdq8Mzaf1rFNnTDKhbQ9PLKH5N1rxzeaMe++OdvkIX1m8A+L/3t1sC/LPxVmv+XhoXSv+l91wDxD2xzzcY1b7308PyLo2j6Q2CNTBibdxuOIACUgZkq/X0FKxJJwbafQ/9ATAshejHkTl4g0DxQ+/IqIi5178RzmThico/hfgwOTVhk1ksTngyHoeQVjIb9ILyumSl66Hq0Lij6HwJGooFOSJMdCOklN5XUcu4PdFTFkWZlK6Hw9zHc9JIkb3Aj2/n54zIUDn38P/wg4BMcOcmpnWcaP7ycmJmlYE/l7wf5di4Pr7roUYHLnIt7Ac/WuCTav4nU4u+7mzSgcqH32HM3Iuwm1LRFSgPeaMSkYD6vVJfzaNOunzMtCub8A3oCA8SaT0PMhggMX10Sg7PJ6I3UUkOVretXLltGCjAw1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 15:52:08.4162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a0ebe2-39b4-467c-2482-08dea474f01a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6131

Add a per-socket mutex (metric_tbl_lock) to serialize concurrent
reads on the metric table sysfs file.  Without serialization, two
simultaneous readers could interleave the SMU refresh command and
the memcpy_fromio(), producing a torn (mixed old/new) snapshot.

Use the scoped guard(mutex) API from <linux/cleanup.h> so the lock
is automatically released when hsmp_metric_tbl_read() returns,
including on error paths.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
Changes v1->v2: New patch

 drivers/platform/x86/amd/hsmp/hsmp.c | 5 +++++
 drivers/platform/x86/amd/hsmp/hsmp.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index d6e377078182..49e7ed9981e9 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -10,7 +10,9 @@
 #include <asm/amd/hsmp.h>
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
+#include <linux/mutex.h>
 #include <linux/device.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
@@ -364,6 +366,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 	msg.msg_id	= HSMP_GET_METRIC_TABLE;
 	msg.sock_ind	= sock->sock_ind;
 
+	guard(mutex)(&sock->metric_tbl_lock);
 	ret = hsmp_send_message(&msg);
 	if (ret)
 		return ret;
@@ -408,6 +411,8 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
 		return -ENOMEM;
 	}
+
+	mutex_init(&sock->metric_tbl_lock);
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_get_tbl_dram_base, "AMD_HSMP");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index e7f051475728..038678b8ab0e 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -16,6 +16,7 @@
 #include <linux/kconfig.h>
 #include <linux/miscdevice.h>
 #include <linux/pci.h>
+#include <linux/mutex.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
 
@@ -41,6 +42,8 @@ struct hsmp_socket {
 	struct bin_attribute hsmp_attr;
 	struct hsmp_mbaddr_info mbinfo;
 	void __iomem *metric_tbl_addr;
+	/* Serializes concurrent metric table reads */
+	struct mutex metric_tbl_lock;
 	void __iomem *virt_base_addr;
 	struct semaphore hsmp_sem;
 	char name[HSMP_ATTR_GRP_NAME_SIZE];
-- 
2.34.1

