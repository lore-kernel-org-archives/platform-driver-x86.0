Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983593;
	b=j8qimG7EIikwduTbUrYDkCizNd2q/fWz7jAUU1Tvb0STWG6S9SLK3eskbGKEjU6NYXDQ
	 ng6t4zMbAGx3pwq19QpPf7+oTk8pck2POo2Pi8MkarzWm6QvzRiXmvhBzParyBNTpxhLl
	 JVdsks/vpwOYNtzPOG55+qGceY1zOLmLCxuDf+bKIV2Q67LXmoHUOuwQpfIaNoY9bbFUD
	 +UhggfdyMJcsS/klaXsfPSpRGFjOQBBjZRU3n66mdgwQEyh9f8sx4MdTCKYWsU5OlOO0G
	 a3/FmbQ2XJMK27wGiDx9FYf0rH9uHhIKhpwK8sLSgZmU2BXpR0broY9o/KgV01/mdfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983593;
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
	bh=fE5gYjJ1F8Gt0V39XIAnlcnOS9HXQXrTeQlSqEPUsCU=;
	b=NWKtQt+1RCyd94FaLa/qJ4WahAlHJfXmNvIAOtER7XJ8CSzwK2o4GbdrTocgaPHcRnGZ
	 MwMyUImLfXjRuZtMKYGkbU3ShY1W7t7y4pjGV57KXIj1Ywi0ZsrkdZsm9l913jaoxwhHL
	 ZXr+yNgRtK9jQ645pQfnrc+GCR7E0/ZkCgqb3d+tjwU3SN9lgMkFXIcW0cqT/r5liOxLA
	 5MD0iF4eaqJNe7ORORG5ymfDWNwjWA4u9m9sSK8tyzhk/09jHcVy1sU3oUXn135MW+Y72
	 JsXhsxDQMDAhAUngFdSqU2poqeGQ1PHgQ1fFtZyvau0mNIRuUhsDFuOWahCYMtf1lRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=q9N0WfRn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.16
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23F3606A32E
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 16:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F23F3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=q9N0WfRn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMt8Xz2Nbir2914ueWb/6IikEVnP1OkVXirtkn7/Pi136A7/DMbKp/LpsmcLNqjFQ98BsMnjYkag/wZy1SQnNiQbcMc6XpNfhq70BcFhzV4teVKa5eEn2HI29putp/winle5ulPNEi6TTwwJEWX5UGJ1EQVawLLM5N59vpgRg/OrrWZMWsL3i07tB2Iqrgtg9QOza0wpG2kCtY6p1OCHiCOVucMhzQvyo1yWPQm9HeQ9jN2XqUqChHoVIELzdzCDSsVwkFXeJ4zFO7Jqh2989vREXL0lKrZbh65zGjvcnpqR6MGcoOctcPbcXad4TTWiAq4R+EsKOt7TipBZKxDGxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fE5gYjJ1F8Gt0V39XIAnlcnOS9HXQXrTeQlSqEPUsCU=;
 b=D3974Z32DnI+c8ZpJ5zXxDmXdBaLZm/5uMjapunNGcO8u+vHVbiAuGPrWdIEsWLEoDHcddMG8uQ/hwQkt8M81o8jv1TZ5h/hYG1iByGviM3abmGMULwbfO5/3K299G4j8cL/Y2j5KEn3M8EkZ5+XHwLjEhaakYQwtwTJ7AwQEe8hz9uxsgeAYkYEDwWNdBQR87aN0cPiwoCbwaJBERlQVktb295c9Za9THKcnDrgA3bYqXWqq0Jyi8zY4j7JeQ4BP8vs4HfQYtlJ/WopiPWGbDVnHxKCLWhLfHlIytdJcgq5QMhi0zuj9LuMhge+TtVBjeKULMK27CsdYfPgK4coLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fE5gYjJ1F8Gt0V39XIAnlcnOS9HXQXrTeQlSqEPUsCU=;
 b=q9N0WfRntpkPcEqowa84W+L8FXc70WVrjDTXxOfnOliIz1zKucZYLVkUQS28WGpkl9LYvUq41XNUKZBRDv//Rr1IjgpViyvQ3fZMhIGMY47KyjjTav8LgEVYAeo+9ZKCL72BD0Ql+1VK8tdL4hL6vG7ImYH0raqCEie5D8y3IA4=
Received: from MW4PR04CA0323.namprd04.prod.outlook.com (2603:10b6:303:82::28)
 by DM3PR12MB9349.namprd12.prod.outlook.com (2603:10b6:0:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 16:46:26 +0000
Received: from BY1PEPF00026959.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::4) by MW4PR04CA0323.outlook.office365.com
 (2603:10b6:303:82::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:46:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026959.mail.protection.outlook.com (10.167.244.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:46:26 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 10:46:19 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v2 04/10] platform/x86/amd/pmf: Get policy binary signature size from PSP header
Date: Fri, 6 Nov 2026 22:14:23 +0530
Message-ID: <20261106164429.30738-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
References: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026959:EE_|DM3PR12MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: f959681e-0b63-41ac-5e02-08df3c257f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|22082099003|18002099003|6133799003|10067099003|11063799006|5023799004|261102123227099003|261026121527099003|261022075727099003|261021121427099003|261021123027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	DGLnj4qerQl7mV8iSAxayDHzZpdJCNVnUWD++qTe3rdXH5iuob2CTbIgFhlcndoIahsdzUkMhPTp9k7C9hYGDKfUkhERojPKLHL9KUTKTdm6hOR7bOn5Gx80kIC2fxTxxqSlyE3odZQusKzQjDBigjhY8Qm5HZu3uECow5DAt+fEkxMi8THIbx9OD+i6+5iOw2gBrJlAbnsguIekJ8FWbpz/LsywU02StM1AfTtO+EyTmjXu4w4LfAs33Fryp5As73P7OiEWQMD5Fb8XjBXr48fHBbme/1NiTqHsC0KYkci96SUj9KIEWU1I72QNibEfgEhvdbV5viSjN6oammXtXO3GblBS/gbXgJdKpNhC8DVFOkgzumjUeQ894kfMqdI07EcTGpDLrVNWQED58x9nAH9NPmAm3jmZiFQPitAnv4R0KvjSmyGfgotwSUY9rISL2Q9Y8vj8ZxZBiHxmsMb4isGWOSTed2FvAYVUaYP5WJzZEpybvR6GPpnOadpwRkc/Dsghut1lN0cFeJY/t2XKS7Bu27TppNoL133WqfzhYDA+O7i8oPOPlaLXVHjpX+wv57jscFrdQ64A7r1ViaAAWWXHHVYrWE3yz0iTPuhyvrJU1Mmt61cB+HneeDxiCLCxP9TL6S3iU/8m1/A94oqZqR4VOS2s3t/Y4O2Enp7zkKzJy3eVOZXgVhcNU4aXJYk7PauyJLy68mpcSw8gr8BUtA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(10067099003)(11063799006)(5023799004)(261102123227099003)(261026121527099003)(261022075727099003)(261021121427099003)(261021123027099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MvEXFnPhMTA1zAbbDm9HjKvjEeOF9fx6T6W5w/ryBTZi21tmjJMv/qXxeehqX75IwaQ5E9Z0fqhXPPlUzRKS+viTFaFVLsnFaOPslRIsL7TmGwlgJjPtAzqrMaZl0EKaG8qQ4rpuS6E8Ikagzhd/7f9hCgii5oV4WoBxUgV5OG55OKkPP4v9ADm2GAtWf4ccKe5/h47q1p7qif4Ry40IVcH03MhRHfIpgJoYpzD5arn/hb4ezMRjNO7SSo6lGZhGPBctaRWj1rKLPjk4ofDXjbXvWe2tLlNp7GqdwgBK7QtOgtzbbPhKFNYyF6AnEIrJUxPe4FZl7HNIhWMR7Y/xXunHJe/OqpqhKdz4W5lWOtGLxx5to+Yp0ZOAqkrcv1YytjBKAuAx0C9kS+tgjWCWVgIB8KJiZRSFRZFD6u6IMI2uT/DWAGG1tPMFz/QB6Jap
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:46:26.0058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f959681e-0b63-41ac-5e02-08df3c257f84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026959.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9349

The policy binary size is calculated as the payload length plus a fixed
512 bytes, which assumes a 256 byte PSP header and a 256 byte RSA2K
signature. Newer policy binaries can be signed with RSA4K, which has a
512 byte signature.

Read the signature algorithm from the PSP header and use it to get the
signature size. Check that the buffer is large enough before reading
the header field, and that the size calculation does not overflow.

Policy binaries with an unknown signature algorithm are now rejected.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  9 +++++++
 drivers/platform/x86/amd/pmf/tee-if.c | 34 +++++++++++++++++++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 378798fb3ec9..af46a2c28ec8 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -23,12 +23,21 @@
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
+#define POLICY_PSP_SIG_SIZE_RSA2K	SZ_256
+#define POLICY_PSP_SIG_SIZE_RSA4K	SZ_512
+
 /* List of supported CPU ids */
 #define AMD_CPU_ID_RMB                  0x14b5
 #define AMD_CPU_ID_PS                   0x14e8
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index e145eb7b03cd..9b328be1e8f4 100644
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
 
@@ -327,9 +329,32 @@ static void amd_pmf_invoke_cmd(struct work_struct *work)
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
@@ -342,11 +367,16 @@ int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
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

