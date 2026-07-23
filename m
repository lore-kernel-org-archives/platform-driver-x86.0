Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010028.outbound.protection.outlook.com [40.93.198.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50925386573
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 11:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805381; cv=fail; b=j8H9k2XUnYJ+6ieeoO4MOv6u9mTym87NgbFXnNLu6GNieF3zbz4dYNrelDSkn/7h2BSW+bUoZxUZMhOLeCnwNGEpsm5YoRYK4+BGU762DNIJg5A5DAqla2hzu/mQjABtm21XcLM6H4TeWF7RRRteV9D9DFrfHFLePSR3xTeFrW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805381; c=relaxed/simple;
	bh=2bsAV3mrWrxwKLdvSl2G0sxZ2UMum3HezSV4z8FLPzg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pbZmG0eTfBW3Om6euVBdGk1SNSVu87RyCR+vBU3xGDdRXtaUS3NTRCg9ZRNQH4cA6nInzhs9sMhMyxQ9hF+KMsIr2xn/cPleTeqCGLXj1FNFcm9x4Y1qYmGDukl5beu9uCYCL7Zc+w1neDf8xJJebmMgT5zQWiRbeE+ntoreKE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oExauVFU; arc=fail smtp.client-ip=40.93.198.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oExauVFU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tnMas9P6703aIhwZhgixd/8YfBkD8Gln4BVm6Klrnr95JcL8VlkkigsbeAHgFpwyOjcnMM7drmo3vQ3le223qgZjLHENAgCpRHNnhWU+bVacebnqpkwvzG3xBvTzzX7x2/c35XDuyhyD7D7NGFpn2WgNV1eZdXUxB/4mQ8IVKI3ubUvLQ7AhHtKr5J1va0/kwjxziJ1HgLFGwQ//zeEt7wglkqQZj73kBufKAo7GlZJxSqnkLdLJyefuHAFBEBACxMspl1AzEsl2KHFXfPFl4kfe7x4OYA4x0wUWKCzyuT59C8+TQOnRawDCqFrDQiTvAzeoJGXzouZLxqM0WJ2Jdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHZ34ALJHLpRexVIIi6qm6hoNf/1Pz0x5TfQng6K2vU=;
 b=swuAYVkjL19CJLxvLlPnccTapg8aWUlbQ3v/jpTrlEuJPnqcIsniwKKxrqOp0b9jrTXAi6vJYcXKWw/5IoTIbcvcJst+A2E7X5Wlwjos8vUYrmwlLK5tFxusPeo5Bk3DAO0uHoaoWiwAX7Uw38yKErmTvGJgLNffXLMShG7GPyUq0EuNnW4tWRE0f9VHlLb1y1Ed8QqB28kxlHo/fHN2vL6rM36GMZGivj15bgrG0H5dQez8Y+HchTARFxLqDhlnmCTdp/AWRrApECym0tOcX8OeU4GpxRgdTqoOedySbPyqpzdg+bJ32qB5WIat2PM7du0kCihDS0exWf/ts9x0RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHZ34ALJHLpRexVIIi6qm6hoNf/1Pz0x5TfQng6K2vU=;
 b=oExauVFUsCByc+pY5woyxcMfMFyI0Bvk/pycyN9NxOd3hU6tM0EwXLDetGR8DVcF4NSuf6ZtDQ7TcdZjqSPSDOxO5bc1LYGfJgRhzU6qaiFMqkNB9YZiL+HDcJ8sBGc0InSwLgi8mhF2oUrNmAyVwOzr2gOE0/ty/8E6oh747iw=
Received: from BY3PR03CA0002.namprd03.prod.outlook.com (2603:10b6:a03:39a::7)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 11:16:15 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::77) by BY3PR03CA0002.outlook.office365.com
 (2603:10b6:a03:39a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 11:16:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 11:16:14 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 06:16:12 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v3 5/7] platform/x86/amd/pmf: Use upper/lower_32_bits() in amd_pmf_set_dram_addr()
Date: Thu, 23 Jul 2026 16:45:32 +0530
Message-ID: <20260723111534.1940925-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723111534.1940925-1-Shyam-sundar.S-k@amd.com>
References: <20260723111534.1940925-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0d4d5e-d4a2-4bfb-0805-08dee8abcf58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	0k8GqWsyyiFi6FcFDvTGI8tRps3v/AuuP2WD0ydDCZGQPaV1E5jvCADQhrsV3vhyoq9g1f/cL6FKLQQgilB/StyDHZn8L5aCj8+XJxTlX0hYpYOAQLAKwFhVcyUSKeaHRCN1Oz8Tiqdade8gFGtIEtP7p+MMizgubgLZDcKi68E6rwbHR9bw5J5KoT2HGT1HwCRjEygrBwA86MwokvOw/y2sxenJfoax9G7GdVAOxKkZ2SpGIftdBhlCo1mjN43UztSflwex+dYMaAHy+A2YOqNRXgtgOYE8+OJerApr3xMqnAP+7ycl8CYGTJ481jWLviOndYj9Zp5So0iSiP6dlUjUZG3XU899oslcFbwlSWTx6P+2+M326z9RwNhMiuQfJIRwkVqF7C8wcQTZ3fwFS6G3okCGfwUJ4zB70Ablolzf1DcDPx+u/Fzz3CXoDZiBSh2W2xcV8FLxLT9FR26bS/B2ijWdXL37lbLM5i3VWu2HXUjtxXoKUvurM6HSk+li1I50Dli1ay+3gp0GaWjVPB6c1fa7joRNBMIc8LziK1edjtXQslWZdydraQfO5TCJV0n+RWIKZZMNKL+HhwEB/qSdkUJ3YWulgBxUkgYhSNU3EFiBnnma9iZmiFnU67yWoySxByfWQLnluCQt7n3wNuws5yzviXag/FXJ+JTMZvWS0XnHgnvOwwdudyoWs70N59l8vjLwBfzvXSYyQ8iO2Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UIRPuvH5Vmt0dqA3b1gr8AGviK/GizfHjh+6qQN7nUpPHhDKPWUluuRCFodIiEvAUu6oxcjbo/C40bgry8sKUYFCKCzlZadIxX0OQpfM8jkHYD4T4f7OlD43AHXmcdhDRDY847I3Q0udswIrR86mr3xOPIs9TEb1TR3PCYxExMVVju4I0IlA1IeFc3JjOPO8qjDq7xPHyuaEwSkbmpyyFd4exPrBThILgF9Niuxk4MB1j4R6UhoArcZh9y7K1vGmqTzanni97M/9LnJNeTxJV3U7DCHURuwLByP9Z7Yckknmd3Jdor3Dyk1Ljpve7X1T8SmR4FsNd+x0NwjoZ2ynW2oDcj1CpjqhfvrTmHuopbpAhw4hUqdTGiE2CeNp4+XG4qT6ldKSvm6Rf7sXWVeeGLYpd/hp7cJTorMO+kSDAqVw/vI3gzqdHiGreErQf4jK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 11:16:14.7614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0d4d5e-d4a2-4bfb-0805-08dee8abcf58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269

Replace the open coded manual bit shifting used to split a 64-bit
physical address into its high and low 32-bit halves with the standard
kernel helpers upper_32_bits() and lower_32_bits().

No functional changes.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/metrics.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
index a5444ad52cf4..8ee60d455ec3 100644
--- a/drivers/platform/x86/amd/pmf/metrics.c
+++ b/drivers/platform/x86/amd/pmf/metrics.c
@@ -10,7 +10,6 @@
  */
 
 #include <linux/array_size.h>
-#include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/container_of.h>
 #include <linux/device.h>
@@ -19,6 +18,7 @@
 #include <linux/ktime.h>
 #include <linux/string.h>
 #include <linux/types.h>
+#include <linux/wordpart.h>
 #include <linux/workqueue.h>
 
 #include "pmf.h"
@@ -82,8 +82,8 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
 	}
 
 	phys_addr = virt_to_phys(dev->buf);
-	hi = phys_addr >> 32;
-	low = phys_addr & GENMASK(31, 0);
+	hi = upper_32_bits(phys_addr);
+	low = lower_32_bits(phys_addr);
 
 	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, SET_CMD, hi, NULL);
 	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, SET_CMD, low, NULL);
-- 
2.34.1

