Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795012363;
	b=gm4H3/VxvBqQ/fp5tN13QJoy7O3B1aE5+vWkes3hdI3BqerJZMOFHU310Q+6tmiiA+kh
	 sPDQ813RDEBbrCZF4kjG8Sinl2wsbJWuGLTeWP/79AmhZ9RJVXqubeaOMVPyi62KFS61N
	 Na/HYihgtrKLXiiNgHim8L8ItA8Egq1vgevwt5FIWhfKQCqEt34cv9xyaJWpAJy0spbmF
	 l0wps3BxUCHLtlv4V4OOHS4YmLAWBMRe7ukVfffypzqR0Cva8LyV1uyMmyLAI0bnjf/9M
	 X4TytZOuMvuH+m7JUGiBvxcnCHRP8IPIxK5+awAI1+s18WUrWpSqI2E03SZ/ZMYLyfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012363;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=O0NXGxxoGvT1ivF+zDwc0YPYEvkKe8P3iCtQ5OBN0Gs=;
	b=bWGsw4CDPO7C06M+Hh9Va8vNWcR3WHMfP+mWOJnH6qtUwkzyRHUCU8O7KwX2yJMrk2oy
	 upnaoilGAjR5r9CaKtolPpJCFalKUOeevukowpKWEXnJbHoWcFy/aOuV565V4J7JZRY7W
	 pyYxNyp1ZSvkbxBYUHn749WiQvNtNTW23jwP5RJ8qgIIEgdyHtCXYphXV8FteCzpFoGHW
	 i0nHgnEX8BaEpvuKfTL/+6kuXAx5TXAWj7im/9dYvJRktTolZJgi50TLvLQf/Yo2vZ/Tn
	 EWgesutkHlRCTD8l72qfmtkuI8ep4ShOXmn1yBxXc7DqFuFjS/UxTbXK+CvJZlshnWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Pr6egVrm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.6
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012006.outbound.protection.outlook.com [52.101.53.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819AF606A330
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 14:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 819AF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Pr6egVrm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wh6MA+kVhZCAlQHZh3wrVOJNFDLEsRgMAFzSFi9OpjW9qoRqGvHp1eHxnCiwMcGd5vQ046teND3UXWVz0ybTUMmk1dg38B2QqsRfDNodv5McQuED8u0reEHZAt30UtArwVfWPQMVXOtb4+BHp46zwE6R0umZq483B4AQwSnhyzZMJMf0IoJp6k6oVFp3nsyUJgD8eI+TFLfNAwKLeqfolkNk9ECMUJXqMGNCOzIk7ajK1Vu1gSWzg1shcarpGjCUrRiRwueOdSgFNtMwxjsPXGe8ybfzMLVKbmFO2X7CaxqcFkPn2rQZMWmJ/Yd1l3HVXBBGvsirQ7TEjSnZ0hGaCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0NXGxxoGvT1ivF+zDwc0YPYEvkKe8P3iCtQ5OBN0Gs=;
 b=TKI8hgDRdfrIrr8+SCknIQm7BUbgHrVyuNUsoDhWmW7ewlj0lNylBpr+NJ7u05NPeuNZsF/MC8EPy6uj5olaxUXX9KQB3sqexLeuX9IjUWf/afSaG+E1VOL2QAfklOGNJ3PWqzWZZ4sSA3HsWfG4w/4wXENm5xaF8M0IugQ80z2AOq2T3x9HW/lNfFStd0ksKuaUZQYBqrQk8xrYfi46D+nIC94lD0kiOLrc18dLkWCu5c0I1uNL9AJ/DRU2+MbItg3Ay2RtwPafFEyL707eFaJfe5NMQT3zgmnVqy65WBCYTVH4pPsvv/G3Ao9k9b8Cr95vZ5d8dSLLr6LMZ1GDtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0NXGxxoGvT1ivF+zDwc0YPYEvkKe8P3iCtQ5OBN0Gs=;
 b=Pr6egVrmx8AuzUVUzSAC/y8ffOZaFTbM7/wRopKWK/Sus5/6a3wG89u//m6kFumHCuquiYkrDT2l/8QjadYd106ZDVKHTTk8C5RTQ1O/rUALBjEBcz4ZNY3ujj2dURgdiZdDamZozWbqHQ0fp0K4gMo3xVee6UFc7++mc36xqrU=
Received: from PH8P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::8)
 by BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:32:38 +0000
Received: from PH3PEPF00059617.namprd05.prod.outlook.com
 (2603:10b6:510:2d7:cafe::4c) by PH8P222CA0010.outlook.office365.com
 (2603:10b6:510:2d7::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 14:32:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF00059617.mail.protection.outlook.com (10.167.243.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:32:37 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:32:34 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 04/10] platform/x86/amd/pmf: Get policy binary signature size from PSP header
Date: Wed, 18 Nov 2026 20:00:28 +0530
Message-ID: <20261118143034.3566684-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
References: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF00059617:EE_|BY5PR12MB4322:EE_
X-MS-Office365-Filtering-Correlation-Id: 00910de8-fd32-4e98-5c6e-08df4580cadb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|261102123227099003|261021123027099003|261021121427099003|261022075727099003|261026121527099003|5023799004|11063799006|56012099006|10067099003|18002099003|22082099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	Bqql4vHiq+i1Y/y8sfR09BxSdSbEvcdbOiI/k6JexzQJZQZ7e/euGi0hEInTDz8Ih62WJ0bEJiDg3FQhwMW4aooKNPiAmcPfmWnVB85klIeUaKSFG2L4DnPRzAMk27o34ARyIGOF2re/490SKTPFC8mfb7cv1QIPTIiZRJ+wRKcAMMZITTeLJLv7o3VUKmNliWx1wIdk74FHZGWwo0j1ukNU8bHtLaS0wZ2l1N1Z5u0TZ8DGo5gI8rL5PToZzNqokkRcPRZyZBl4dAhghbHmpjQtmBFT+uEmFBE2wUb9mihLbloooLJTLeOMr5ABePzLymEdcDwKZmxc+eo/V1gx7dCBmuVEkcd0Y22rhr1EwM0Kz9QhoeHs+1RA0u/v0QtjEV+9q5uP1pEUC4UmIq5tzWY4+8wozD0HtK+WUKE9j+kUFfwWK0eOaNk0FBUo4j8U0Y+HQ3xJ0LtBe/1MlHUoVR1RVJM8KVpHG63PMIDOFPDdX8Jy7QUlC3k7oDaV6kD/Y2GrsWEJUHpHhbpAj37lII6f+dO3zI72Tp/OKQG74xnrQ6YamWqUAkCvjH/o0U7u2e/j09BrZ/nmJBiqCuQSljg10VF1ebQe1oxoUbbp4gkeodBUoZ8GfezorD7aDOugjH9/Psf1Z0spldJPBHuFcx9CXJrVmFAMEK79HdBcF50iJo5wHOCd17anb8vQLDxppaLHqijTsAHYtPWeRIjGEg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(261102123227099003)(261021123027099003)(261021121427099003)(261022075727099003)(261026121527099003)(5023799004)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	feRA6AZN8SDHTA5vHQnK/Zyk86U1jhEa8vei+5iUoJ9gq19PWWsBBNN3K2sRE9hTnn2SKdeKCahS7PHLnOdqkuf8mbyXa0GkK4ZqjKOzTwiJjUL4yHJsmawg6+d+8TP3kwjtWh+36gNpEs9hDiU786FrZIZdnNvZ9q4aW2WhkfxxJEBv+qswgJXqTELrZS5OZ81r0fUVY+RMjVY+kg2uscZDpWaQFMVglWB6heLuhoYSMBkP0WPHl42iq+J2nJWPG4nJnQBAQte+H9iVBFL9FeB2l7fF1Z4zvf3yilO3UCpRPKJloZF6BACAhicvFcAQRxCv7zM+XeiGzgsJWLfGc9fFY1xSN61Y4wtLxhOo5gqdZ7yUWmMp8mf7TLU31pT8pGvtysD5jotIhRAaP/e5DPiQOmA5dvVL9L0xotsLg/w9vGiUIBz+0qswpzXnkOrr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:32:37.0178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00910de8-fd32-4e98-5c6e-08df4580cadb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF00059617.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4322

The policy binary size is calculated as the payload length plus a fixed
512 bytes, which assumes a 256 byte PSP header and a 256 byte RSA2K
signature. Newer policy binaries can be signed with RSA4K, which has a
512 byte signature, or with an alternative signing mechanism, which has
a signature size of its own.

Read the signature algorithm from the PSP header and use it to get the
signature size. Check that the buffer is large enough before reading
the header field, and that the size calculation does not overflow.

Policy binaries with an unknown signature algorithm are now rejected.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    | 11 ++++++++
 drivers/platform/x86/amd/pmf/tee-if.c | 37 +++++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 378798fb3ec9..4e6db4e6fbfb 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -23,12 +23,23 @@
 #include <linux/power_supply.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
+#include <linux/sizes.h>
 #include <linux/types.h>
 
 #define POLICY_BUF_MAX_SZ		0x4b000
 #define POLICY_SIGN_COOKIE		0x31535024
 #define POLICY_COOKIE_OFFSET		0x10
 
+/* Policy binary PSP header */
+#define POLICY_PSP_HEADER_SIZE		SZ_256
+#define POLICY_PSP_SIG_ALG_OFFSET	0x34
+#define POLICY_PSP_SIG_ALG_RSA2K	0
+#define POLICY_PSP_SIG_ALG_RSA4K	2
+#define POLICY_PSP_SIG_ALG_ALT		12
+#define POLICY_PSP_SIG_SIZE_RSA2K	SZ_256
+#define POLICY_PSP_SIG_SIZE_RSA4K	SZ_512
+#define POLICY_PSP_SIG_SIZE_ALT		1932
+
 /* List of supported CPU ids */
 #define AMD_CPU_ID_RMB                  0x14b5
 #define AMD_CPU_ID_PS                   0x14e8
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index a0f2b4be1369..3c26296a5815 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -11,7 +11,9 @@
 #include <linux/array_size.h>
 #include <linux/debugfs.h>
 #include <linux/dev_printk.h>
+#include <linux/overflow.h>
 #include <linux/tee_drv.h>
+#include <linux/unaligned.h>
 #include <linux/uuid.h>
 #include "pmf.h"
 
@@ -327,9 +329,35 @@ static void amd_pmf_invoke_cmd(struct work_struct *work)
 	schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms));
 }
 
+static int amd_pmf_get_pb_sig_size(struct amd_pmf_dev *dev, u32 *sig_size)
+{
+	u32 sig_alg;
+
+	if (dev->policy_sz < POLICY_PSP_SIG_ALG_OFFSET + sizeof(sig_alg))
+		return -EINVAL;
+
+	sig_alg = get_unaligned_le32(dev->policy_buf + POLICY_PSP_SIG_ALG_OFFSET);
+
+	switch (sig_alg) {
+	case POLICY_PSP_SIG_ALG_RSA2K:
+		*sig_size = POLICY_PSP_SIG_SIZE_RSA2K;
+		return 0;
+	case POLICY_PSP_SIG_ALG_RSA4K:
+		*sig_size = POLICY_PSP_SIG_SIZE_RSA4K;
+		return 0;
+	case POLICY_PSP_SIG_ALG_ALT:
+		*sig_size = POLICY_PSP_SIG_SIZE_ALT;
+		return 0;
+	default:
+		dev_dbg(dev->dev, "Unknown PSP signature algorithm: %u\n", sig_alg);
+		return -EINVAL;
+	}
+}
+
 int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 {
 	struct cookie_header *header;
+	u32 sig_size, total_sz;
 	int res;
 
 	if (dev->policy_sz < POLICY_COOKIE_OFFSET + sizeof(*header))
@@ -342,11 +370,16 @@ int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 		return -EINVAL;
 	}
 
-	if (dev->policy_sz < header->length + 512)
+	res = amd_pmf_get_pb_sig_size(dev, &sig_size);
+	if (res)
+		return res;
+
+	if (check_add_overflow(header->length, POLICY_PSP_HEADER_SIZE + sig_size, &total_sz) ||
+	    dev->policy_sz < total_sz)
 		return -EINVAL;
 
 	/* Update the actual length */
-	dev->policy_sz = header->length + 512;
+	dev->policy_sz = total_sz;
 	res = dev->ta_ops->invoke_init(dev);
 	if (res == TA_PMF_TYPE_SUCCESS) {
 		/* Now its safe to announce that smart pc is enabled */
-- 
2.34.1

