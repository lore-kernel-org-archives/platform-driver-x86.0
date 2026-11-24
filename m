Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795506776;
	b=eCIKnBKi+t/puC9Km0R3ix1OCFUrNoD+1iIKCnyrx7xuh3mXLxP6q8/J5VVbeWWGBtT+
	 rOhGDBi8iC5D4AlFroIxTt4UU0eIIf3jjy48XO5B0ZfgN+AOtRTk1hlf449P9rNw58pkB
	 qJ5J6A1UdnrddU35GoLyrGtHgZMU9lXJqsBykTeL8/3EkVA6dgiM6gjLtUY0aV0hG/arm
	 mSCeKV8QhCU+PnhxpUs2UsmnE2E44lyvdybeNiSx/fSq4E9jYcSvaneC8CRsAW3o0zHJ7
	 LyxgFmEkv4FDNSCG9aHA/oDeEmJhnLrXpic9iTInxkZ0UflNU9SQRbON9/xhLS9YA/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506776;
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
	bh=yeGhwXE4yk/aprhepku0w4NQN8tyZrT1FyDaFdqd91o=;
	b=UcXIX/X8dj3PuNt7j9qNfBG3G8MJySMGSa2tYEy9BmIRFqH/pjXhbYtQtE5VJOCvEwi2
	 6Wfy61zyTz3ktge7a/qDawJcGdkQxlKoN3KxyJ+MVMpMueKiFdtl9vI3XubVfwEEEr/9v
	 s+EotYPCUKaVR6G5JexBqGFh3+DV7kellx7MOgItGUUm2EQb7A+2qKJ4uB5ENWY9xc4dD
	 d2f/7SRmzin5Yq8g8MPoGjqj6Uf5Sjkz0A8pKh9UlfTqwmjNJ5KD+Y+I+Mqu483BmdHH2
	 T7Fhz3v/d6Uh9fw1JMUBMmIyYIwBn9ufNIDp37e7WE9DB4CGOe8yXz7sRRpOwPI3thw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=a9xGF0HI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.23
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011023.outbound.protection.outlook.com [52.101.57.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB62606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 07:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB62606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=a9xGF0HI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mR3yWi+EjsEuR+pEhD0dXOZA8A6P/BMpGTKwVQMpiEu0rWo6149ZqPhU47TMtK8uqtL8z9jQyMgypqkLij4Wf2oDnyubZht3Evp+vbP5Sc11aMfWQE0XztmK6ZRfAUHJx+AZ9i6pbtCvz9mcHbZTBdrDdqRPknxw00DdENq6epV8oqq6+Gjkakp2HHP7+Mivw2V8tkrPerDmJupxeeOvDyTfs/ZiQWYBv85g63MJDWOrfNoNz6L5NirUcO4hApu3lzLGCiUWnXyVhwcy3xk9ebt1KnTwBH57SiOt4DgSnsxi9w1nB/oQ+yTKphX7CHSNQI89w+iqMFnFF/eua60VBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeGhwXE4yk/aprhepku0w4NQN8tyZrT1FyDaFdqd91o=;
 b=bB89pyjxBnlpMa7CqWntv5crTTjmRY1D7XYUXhrKtVLHX/Pg9FZeJUvfV4TE3JP0ggjCrgGAEqXVt/YM1ejco3YHqaS2We3EZyFfVmOU2NxToa0xseVjWWBJ1GTtJ6aQP5W8BaW3/XRaUftzFRKSltjlN2sDM13XwPCVukEtCOtZJ1SZwKhxiXgRL34GSvGdZHkj6cxQr4FP6t3X/gtGsKInLtIntIHLTdWAvVkSJ5nmqyF+1L2vLSCP9EJYhrDM4xg7SpKKe9CcABveT45Kea/Ati3l5uO63MN6O+y+nMQ5MVYotwFIljevw4GqVjOmooLoh7dVJvNtB4Gy+FCRGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeGhwXE4yk/aprhepku0w4NQN8tyZrT1FyDaFdqd91o=;
 b=a9xGF0HIhu/67lxgcgEoRTrJmmmnx5Y6ljqvodUBguk3WjNURFRhxqVYa6p77n8LRYu4rc1J7EfYhai9bQeYRs6ETSvKA5pqqLs98QwOqTEDxu2uMJVA5nMdWPQ2+m6VMYFIQ2qcQRRyF/+zMmVVWfGW7mNNxqIIgI85c751kNM=
Received: from MW4PR04CA0373.namprd04.prod.outlook.com (2603:10b6:303:81::18)
 by BL3PR12MB6524.namprd12.prod.outlook.com (2603:10b6:208:38c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 07:52:50 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::40) by MW4PR04CA0373.outlook.office365.com
 (2603:10b6:303:81::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 07:52:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 07:52:49 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 01:52:46 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v4 05/11] platform/x86/amd/pmf: Get policy binary signature size from PSP header
Date: Tue, 24 Nov 2026 13:22:07 +0530
Message-ID: <20261124075213.2317127-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
References: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|BL3PR12MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c23d0f5-5463-4728-c2e5-08df49ffefb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|6133799003|22082099003|18002099003|261022075727099003|11063799006|261021121427099003|5023799004|56012099006|261026121527099003|261009223027099003|261021123027099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	MDTwF9hMxwrWEohe9a/8Sew7djuW46JIwHBoTxnyzhqan6cxBu1YxtX+EyLt0Z8+pCozIBWJRF4a3m5qO5S9yKgc17zapXjSFwD+hND7gh4ycs8MnqXJ1GR8QAx7XQxkMWRfPYjNKKXk0CHulbqbkpsyp8H3Jjh7aU3uO/X8CLj6fmhfTrNOAlbZvVReIIjQyxNG55VhonG3XrlHeF4pzSojJm9QkVXaczfaoWbFjA6Bxa2InbQxT5sVZogdTfTWfL9cjyNCy+3MqlmWJqUtywqMw5cUIsZvDSG4dB50dGPKLvSUWtlPjinPiiqZGoqzpDGfgRcVij+ZQDvnzeVgF/WsNU4iyTshNfwDTUyhw7yFCt5XIWjatjY7JNo2rmnfd18QPGCqraLNgEtUKCA0if7xI0GDQZwLaz6SR0NbvwVrnx8aFPTE0VNJk9eKgKYx8juS1NuN+RGWXJnSTkW78VIKLACE5+T6ZChNiPDdmsDoXTB8EeeXlfvaA3cQQrB56q5vVSKpdtLa0T9GTNcvkKwh+CN+eWmH5zGASHM6Jm3XAsZCJC53tsXlIBhauxKQLpPYzpFNG9y137yJ3YOxjDzRh/IgkSyacuhdS20bJUx7QXg4QfKsgRB1fImm+lNjQDmMO9WP8zppD6vhOkWgDA+LvVXZFq/GM3vLn6MOdY43b+oELZ6WYw0LxyMjUbgtm6d9IRJqUwDZLPHC5MV1gg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(261022075727099003)(11063799006)(261021121427099003)(5023799004)(56012099006)(261026121527099003)(261009223027099003)(261021123027099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3bGkhSWlLk+mnNAwmL+i3InuSzfF40mv0eUh/PoUldpjOHIfWAdtZY03UgMnUBiwjbFB7Ys8lQPrlM7YUFwG9+6fRENDivRaDFnl4woJe1ZrCmP47XYEqQ0DE/dteRr6JhUXNmIpWYB6rAJ2u+r5xQ0hPRjCD0VhQ8bFiYPGpxYhxs5vqlLvzxmuTYIynALsO5cbVQfT13j67wuwOSEgIUxSTVdb65TOO4g/09kdNsVpjP5WOjw7543LRIYrwLtEFYkAYH1vhHY9HaXA4Z0+CcKKjjyA999bm742wfWCNg+08mdTNb9xMDT2dVg6mGUflmjf+OTsKC8IiRMBplUvL/YRHuFFsqLuNcT35cVH+Lt+/AkOzUbM0tPQDGz/Lhfgf1Eic1qXS+3DMeeaOvy5KPTizi8x6R/uhcgz+thQz4qZNSbWZyPU9B62AqSLRFlP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 07:52:49.5797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c23d0f5-5463-4728-c2e5-08df49ffefb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6524

The policy binary size is calculated as the payload length plus a fixed
512 bytes, which assumes a 256 byte PSP header and a 256 byte RSA2K
signature. Newer policy binaries can be signed with RSA4K, which has a
512 byte signature, or with an alternative signing mechanism, which has
a signature size of its own.

Read the signature algorithm from the PSP header and use it to get the
signature size. Check that the buffer is large enough before reading
the header field, and that the size calculation does not overflow.

Policy binaries with an unknown signature algorithm are now rejected.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    | 11 ++++++++
 drivers/platform/x86/amd/pmf/tee-if.c | 37 +++++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 5de862187c4c..16ac9bac9496 100644
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

