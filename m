Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983587;
	b=xgVCWZcKVulA5eLDG/+jzuC5jrmyr/pAcfYZo0M9v/U2ESGiKgZd5U9szDrTgvwkCvqG
	 OeN/hTSm3eroQWXy+xk3/cTVAWwCFS0lkxneHPmliPJsxuZ0py5/UIeXp86g87h2PjEhW
	 VxHj0eXKOYcPK8R8YyQOQxPLs2Sq+9CD2NaG4LlbjMc//zkQTWOtpPmXtNgbvXCf/m9f9
	 f/tpD3tD0G73KCz8EGa87zyMMTP1h6Ozzzi+Vq2o4UZM8Ay6wecmD7+D+qRJNUDdf5tjV
	 apQB78o6udeEeDtiP14TTojEx7YA770QOrYEjoMzLW/kJlRS3d8sxyx/6Z6GfCBwBMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983587;
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
	bh=kmCAU9AzTZeKuqz8YrA8dCriOm2Asl1Ftq45b8fLlMg=;
	b=xgHAjlnJRF5hxvNZmFX6FtGoP/kSoJBKk6VvEnjcExNuHDddvpFLFrrmkOpBjLa1IYs7
	 1MWqlirTJfeHirPoGanP+2HhcokMMpq1G3pUJl8zkVp8+CbDgPnij/czSu+WDRqHCkCdP
	 sc8hfbqqwYXl3DE1jjxwMCVvFgbTajzuE1zQ92OEEjomoLO52e4ClpdN+UwouHoSHLbR4
	 wXRkN4Syewo36q1EuyVsbDHZkZngBWy3l68yZmWwMwikVbkQGOZ96+fE4ll5uDPEbRzce
	 MOgoxo5E5MViUNulc7H+PKHS3pEabusb4I/RsfB9me3ohcm9A4bsovnhRSf81mr9yJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=p2Z8xhp8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.0
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013000.outbound.protection.outlook.com [40.93.201.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17907606A32C
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 16:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17907606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=p2Z8xhp8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rnmm9SmNkHPCbyBkoZZYeEVJMRdH8tacCuOT84HIHWTKHw0Oym2fJQO8SOc2+DKCHT0G4J5WnuXiHvQuoHm0iI1nEUKz+gZ9iZFqM346vt+tiQjQNDq1CIscHgLfESjYAhFq5/utlPbs95+iVUOq0lUzAtwiQzttD/q340H6FhOe+ERaO8uXFmCyPfU5xixjOxyHFgGA8FPaSpeMwhl/OfyHQuV5ube9oGM6laAEn+EMRh/dWrmajj2iSIr9rpseh/R/Vb7+Cc2aAck1gkP1JS9Cc6OCSBHZqXrX8iZ7Ct6JDE5ScZfwz9HI6O+LwR3xXkXS3OjrMKyBE3wfHWPT7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmCAU9AzTZeKuqz8YrA8dCriOm2Asl1Ftq45b8fLlMg=;
 b=dl++l4LEpkn4R7QEFKKuv5twuWTjCx4xFI9X31EcGqdYyQmfWEQR37TjdY39XHf54H/i43ldIos/2NxvTGzu8XmLz9+Aw2/ToIp56IivzSR4Tfta/4dKnM3QfH023Wg1vkbpY85XP8eQ1V4RkEacHNx1peqUeK+bJM7hd/5JZjX4JCoLPYZcs74nrseT9qnlY4a+s52Ufuno2KVFR5LbAnxhv0S6Q15ZR5K3iG5OHXNbK5oo31fQGN2nJKlUorUnCWeYQ3blIVRhGdoZR1BTPditZ1MijkYl2DB0RkQpT7418YrUnKrbQ38iw0o3fqMvTRGNS2ZOv3ZvXMuUhNZk8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmCAU9AzTZeKuqz8YrA8dCriOm2Asl1Ftq45b8fLlMg=;
 b=p2Z8xhp8E8HtBg34TgCNSaU2/qX+n4TFp1aPllj1eYxNXg1gguNmisi2m8PEi8fmgFIoinnJI8QOD/zbWIjRBm0wFsA1Ij3s6VgOyeeq4SNVemQWxONyqGgq8rhIzErkMwWr/+S53+daUKiJlfBPtmUuVGRVTfHmr/ygJ9A9vas=
Received: from MW4PR04CA0367.namprd04.prod.outlook.com (2603:10b6:303:81::12)
 by DS0PR12MB8454.namprd12.prod.outlook.com (2603:10b6:8:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 16:46:22 +0000
Received: from BY1PEPF0002695A.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::78) by MW4PR04CA0367.outlook.office365.com
 (2603:10b6:303:81::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:46:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0002695A.mail.protection.outlook.com (10.167.244.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:46:21 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 10:46:12 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v2 01/10] platform/x86/amd/pmf: Skip legacy DRAM address commands on 1AH_M80H
Date: Fri, 6 Nov 2026 22:14:20 +0530
Message-ID: <20261106164429.30738-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695A:EE_|DS0PR12MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b4a7bf7-6bba-40af-c780-08df3c257cfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|18002099003|22082099003|56012099006|261022075727099003|3023799007|260925021911599003|260925022911599003|261021123027099003|261102123227099003|261026121527099003|261009223027099003|261028144727099003|261026140227099003|261021121427099003|260925021311599003|261022105027099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	m9WFjJSygJ0QXricJ4IM2YOxzsUq1MP3NqXj9sQ1RZQ61suCSoORaqX9MCVBv8LKG1eaZsE6+2sFCtBC1Gb50jYVJG0AbmVGs2qzBY6eFKkra1gXrEAOGXwS7q6xmwR7qM1rVVqPrfqcbM0tYVmEgR40lvEu7tstpBXAZRb7u+F3DnWk4TttjEyTExrrQtVML9A8fZY4DICR5KPOkjEDFFQGsoj42MSkfwgSeADevnXHWNJLPnjBDS+rDTpSzs6F8vc6zFH404WHiLVrtqJW/SUBomLxd3ak+gfrnRy3kVaEW0lnNJs6PJ3IGcm279F9nwjZbRHyaswmMMLO8hyewQWl+JPb6hTNjjksp/bw6XKut8VYJ5OaSEyFF8t1qfaCQhEReM20elUGnkR3wsDpb7t+TkSwIYzfvFI7JI1WePYcA2P6rUt66KZCU/8UnLmPG0bN6PxaQpBil+byPG/jF6O1OfkBw0NvnUKXGG4dA8bCKiVZl6eW5LkO1us/anSRH/oNXOuO80xHkXiPxmqH2Ib+7U0kvNEysXbh5Iwg51lx8hcCjMlpPslHU9E9Wjv2fdIsjgUjVSu9CdUTtzqxWY67oKMPrvCRWF7/AEfqoF3U+rx+Dul7Nmg2ZlMwslIB9VEIdCE7cx+QFtqoBSnnReeLRQjVhk5t2KhM+k3Ziqr+FlQp1mVfKQhTIGkxcvreWDCn+KzvHnZxtgdoCR42CQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(18002099003)(22082099003)(56012099006)(261022075727099003)(3023799007)(260925021911599003)(260925022911599003)(261021123027099003)(261102123227099003)(261026121527099003)(261009223027099003)(261028144727099003)(261026140227099003)(261021121427099003)(260925021311599003)(261022105027099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4ELGznEa7fhY1hXekNhc7S4Wh9Ya7GBFxERPxcc8BhKc/qacv/6tqOg2MehfmX6EMPRuDJChl7FXWQ4zaSKMu3tkfXUMDNgqNQdEcN5L2SUou+Tl1bvB18I9I8kCZDM8/xkRB8jw9tqHVLD3G8IOlXTRoEmI19gZ6i0NbM4RfC0qxPwvS5rWnNuKp5VmWudzmCCwpcjkyEuM+a0Dl3lhEroBvAq7RdlGZp/VpY1mc1yDbop9/jQ+9I7M7p24yxjo1ZrzfIT3IlcA1IUntbRb6NITZZTtKefEjIBBUAv2uE6enD1kFzf6ONKJ9sfzsCpGQ0WJ6GjjIf8UwU/LTO7Y9ySEO1TQZb0Sx+wBgalq8aHH4rezW9Eyh2f53MzTcP+jrrsgpUPjpH3RY8/R9y6rRmngjc3jt+crUHzhNp1qil0MJpPTN+UcE3OwBIQ1HwMi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:46:21.7411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4a7bf7-6bba-40af-c780-08df3c257cfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002695A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8454

1AH_M80H gets the metrics table address from PMFW through
GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR and does not support the
SET_DRAM_ADDR_HIGH/LOW commands used by earlier platforms.

amd_pmf_set_dram_addr() is still called on this platform from the
Smart PC and auto mode/CnQF init paths. It logs an "Invalid CPU id"
error and sends the address of its local buffer to PMFW using message
IDs that mean something else on 1AH_M80H.

Do not send these commands on platforms that use accumulator based
metrics. The buffer is still allocated, as the existing metrics paths
use it. Add the 1AH_M80H case to the size switch, and move
amd_pmf_supports_accumulator_metrics() to pmf.h so that it can be used
from metrics.c.

Fixes: 641b41a7a125 ("platform/x86/amd/pmf: Add 1AH_M80H metrics table and NPU metrics support")
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c    | 10 ----------
 drivers/platform/x86/amd/pmf/metrics.c |  7 +++++++
 drivers/platform/x86/amd/pmf/pmf.h     | 10 ++++++++++
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index ba9324448586..96e37eb56591 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -68,16 +68,6 @@ static bool smart_pc_support = true;
 module_param(smart_pc_support, bool, 0444);
 MODULE_PARM_DESC(smart_pc_support, "Smart PC Support (default = true)");
 
-static bool amd_pmf_supports_accumulator_metrics(struct amd_pmf_dev *pdev)
-{
-	switch (pdev->cpu_id) {
-	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
-		return true;
-	default:
-		return false;
-	}
-}
-
 static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
index 5c0e368ec8df..bf6117b4d742 100644
--- a/drivers/platform/x86/amd/pmf/metrics.c
+++ b/drivers/platform/x86/amd/pmf/metrics.c
@@ -158,6 +158,9 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
 		case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
 			dev->mtable_size = sizeof(dev->m_table_v2);
 			break;
+		case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
+			dev->mtable_size = sizeof(dev->mtable_v3);
+			break;
 		default:
 			dev_err(dev->dev, "Invalid CPU id: 0x%x\n", dev->cpu_id);
 		}
@@ -167,6 +170,10 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
 			return -ENOMEM;
 	}
 
+	/* Accumulator based platforms get the table address from PMFW instead */
+	if (amd_pmf_supports_accumulator_metrics(dev))
+		return 0;
+
 	phys_addr = virt_to_phys(dev->buf);
 	hi = upper_32_bits(phys_addr);
 	low = lower_32_bits(phys_addr);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 9f64ab833c08..b29c5192d878 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -1105,6 +1105,16 @@ static inline int amd_pmf_get_power_source(void)
 		return POWER_SOURCE_DC;
 }
 
+static inline bool amd_pmf_supports_accumulator_metrics(struct amd_pmf_dev *pdev)
+{
+	switch (pdev->cpu_id) {
+	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
+		return true;
+	default:
+		return false;
+	}
+}
+
 /**
  * fixp_q88_fromint: Convert integer to Q8.8
  * @val: input value
-- 
2.34.1

