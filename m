Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793944530;
	b=GB5ty15v3FRVfSzf0Q2cAZwmPJh/lQWmAyVDm3EQakDDip9PNvRXkAbPDDq/69ibWTua
	 /D3+cJRb/2jOFOtEJIxNqXzBiuwVsC1IlhawimVSffU/WjfwzGbvtepzUJhKxqvsx8eDp
	 XvSnBQ0V5IBBSvxalQH0ydFQCOHLu7AUpk0JbxbxjyY5JdllALa8ohXjR3WHW7XX0vOmk
	 EC0vWtDOg+yzgZCCeNOTTYWWYD7agyfrsq5fng0IHBtEsoYKrQkYZgQY0eiCCZNewZUY4
	 UcEmSeqY83OusLOPBqJrDU49rJDgiC5t3Qb4kfknnDn6nexMQGpNr4C/IyQAF+nB+eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944530;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
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
	bh=aosYhR9gS/mpFYhNt4Fdy1ZD4WSLzctJr2GHHFvFap4=;
	b=T18iHe2c0vnxtpmXg7flOQESOfk3wiTOfvZfximMmsmmiSsdmsjt+KWI+CLCDHyQX1gz
	 Yr0xakEpfG2iC/w8JW+szwISPJC6JmSQ1+S7RYyrj1YIazf4qRVN6ybJ1SudCA2a9HLUY
	 DcOYr5djFvWEemnKRpt9qDoZHxuOyqFzyR3YAtUVP7Z/ZN/b4siMvl2CXozJUDUuSYQzS
	 9iIjrz9IATb2DSOn3B59OLi7dTAEyBQq5ta6IVcnUPuv83mgtiKRMo34Q7tfwRF2rZRey
	 NdkW7SGw8Iwkux+PTgbzQtjxH1fYga31WnIiGaPD6tntjkglxvy4z8YSBrx7pSDf0wQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3sojaNA+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.10
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013010.outbound.protection.outlook.com [40.107.201.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D18606A326
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 05:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D18606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3sojaNA+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehdh6nxIVhu7+Z11rV8RQpVqUckEMeDd/9txCHCgLVI2+sS6fv2Xdw5NuR/GWAxZdeWKPX50/8Uicjf0pniVhbxK41zCxfm09yB6++NLIt4gWC3VRtPudkcvujLnBFLKWzNkmTniv+sDf1YrtZ8cjSbaWJBU7KHk4jRs2shLf6OhX1YAMmJ1pz0HY+vwVcf7Fv1UbL1jb1vaM2SJVmvYFe/ZBeJYar6irq/Yp9WJ5fXFAtDKahwXvx6++SpPqmtL9U9gvKuwSPaa+1/4D5TdWrgYMpJ/PJBiSiE1ZYEF56Yf6iET1CjWgS4Qc9UCWMRy5rzAly2cAgtoPKxpszgZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aosYhR9gS/mpFYhNt4Fdy1ZD4WSLzctJr2GHHFvFap4=;
 b=f3ndB1/g3Eta2qmZNv7fLdME4oFPTsC9ERxPLZr6pFtC2lMZbfCkmgzHJTv8D1BvjNPl/l0taAWxiSNXDMsYtLcd8wm+7yUU/ss3f03H25S2aIsNawPpWXBXqiCX5JF3Eg6JWWVb9I9K8LlgEUtP0NN7b+XCRO/ri5KlwUYhaUoBoz4OZkIxzpXKE4156hCPN9ull2cizggC8TShOKSikmn+5i++clK9fklc/3fcc1r/JMdI71VKNMNolpLrr+lXfAtQv1Owd/F9p5VxGo1MTALIRzqsAcYJ7xeFIjacnrvsk4FgmVEsucFx/db8jqiZsoyfesqRrA3fDiNEiceu1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aosYhR9gS/mpFYhNt4Fdy1ZD4WSLzctJr2GHHFvFap4=;
 b=3sojaNA+l7hDKzf0o2cckasQmnqhhgcTdU52brMvZYDj/v+75kxD1nQIQctggpQ2oQOLjB/aYENoGOCXXdvhP0conLCYTPeWrI5zjN1QWnQb/s2PeVZtkNIpO4xxUUgRnWpsNEytXibc+EESQsY4xvKkZF4QBwJcXlMZMtt45fA=
Received: from IA4P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::17)
 by DS7PR12MB8369.namprd12.prod.outlook.com (2603:10b6:8:eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 05:55:25 +0000
Received: from BL2PEPF000352D7.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::60) by IA4P220CA0012.outlook.office365.com
 (2603:10b6:208:558::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 05:55:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL2PEPF000352D7.mail.protection.outlook.com (10.167.254.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 05:55:25 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 23:55:22 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v4] platform/x86/amd/pmf: Fix ACPI buffer validation in APTS path
Date: Fri, 6 Nov 2026 11:25:04 +0530
Message-ID: <20261106055504.2314590-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D7:EE_|DS7PR12MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: adbf7364-172d-4fd9-cf1e-08df3bca8d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|261022105027099003|11063799006|261026121527099003|261021123027099003|261022115727099003|56012099006|261021135927099003|261021130227099003|261021121427099003|261021133027099003|261009223027099003|261028144727099003|261026140227099003|261022113327099003|261102123227099003|261026135527099003|261026130827099003|261022075727099003|10067099003|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	S9EQr/Gz4WO3PHOD/lMGbN7sBVkKLGhPZKUAi5wahv/aNi2tAA2kSIgHXQULrFl9Y3INEB6W7v3EWB1y5sHBZmKVObLtGOKXphoIV+vsiuY9hR/BpSg1Kn+SPyN/B7qewz+uneAvyMRQMBLraaMyge2PCQXERaUrsTaMRa3UveyKfnA0r+67jm2n/lUG/V+3qODcm43z0rLbtnkAlP3xFx1fqsk9SoNJCtsRHiSr6QQazPOacKJ13RERM2oohEhV8EfSCcdN2RmB6AYG2QvpXfwULwgEFCGK8JSMUW/can0r3DyLSo/eZfNlSLZio9xoLXaH3zO2vdPO2AbsYKaE0m8zl0oeKWjyNpWu/5zwIesuImsOoiVKMXJD7n3QFt7+7SRWGZcDtEmu+vU4lV/g8E/yAFdirAPeOLNWfyuE7Is4bOOImO2t4CMqzv4sNkA3VSeW79hhsHZ1bO6gDRWUTxm7qudj59JjORV27LtdS5XyJlgSapnRwwyxWZ6QSQW84k3oZkYnYzk7IUEQgbxKmVEJxfWs36GsbXmfB6wRbmGq0Hofhs0w+AnC38dnnq9sRZE/D9xEHAqSmRyX+qUK+egReunqXUJ4aLdNKsmOvSEOJuth11YLQs955j4l4DlD6MbmaFe2khjn49Ul8tnrDsjOpCVcdQc1/HlYk40jFZQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(261022105027099003)(11063799006)(261026121527099003)(261021123027099003)(261022115727099003)(56012099006)(261021135927099003)(261021130227099003)(261021121427099003)(261021133027099003)(261009223027099003)(261028144727099003)(261026140227099003)(261022113327099003)(261102123227099003)(261026135527099003)(261026130827099003)(261022075727099003)(10067099003)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2nNSY7nMgGIdVM8IUvn5mDgeCWtDxJQRJswqPPFjjzrYPsBM8kNfxS+C8rYjpXUwSIY9dS7HAeVtflJ+99i/AnFZMjW6wURgs1G6myMxdtzsxEU05KK+GBntsBIaFFjlAXtObFO1yfnMEW9RR10JHm99rAMZdMSlIHVEZNkJHSHRZxqOvzCu21oB9Nqe/tLum5Ohjlgjw+HPjzVjNEWpy1l/IHBju+SBb2ybvYhan9OH2nniVXQKX+YK8/IiTdIMdd/86Q3kFRM36nMid95VnIDLv54pr/jTxaZR4rHv5BNa8wBmddeKaWIi8UaCDvN/5EyAbR0WgfawVu8JzmWvvHbkTJbZv+kSF8oRbLztcVC7s+Nt3liJhSqLZeU98fXqzd6vUFI9MDrKKlCNQUOL9/SHdj/c/T0tzWwLCngt3EoXF2PH+850kMIqgUwHyJaL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 05:55:25.3182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adbf7364-172d-4fd9-cf1e-08df3bca8d84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352D7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8369

apts_if_call_store_buffer() reads a u16 size from info->buffer.pointer
without checking it is non-NULL and at least 2 bytes long, so a short or
NULL firmware buffer can cause an out-of-bounds read.

Add a common helper, amd_pmf_if_verify_buffer(), that validates the
buffer (type, NULL or short pointer, header and output size) and returns
the size on success. Call it from both apts_if_call_store_buffer() and
apmf_if_call_store_buffer().

Fixes: 3eecb434d7f2 ("platform/x86/amd/pmf: Add support to get sps default APTS index values")
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v4:
 - Rebase on the latest review-ilpo-fixes

v3: https://lore.kernel.org/all/20261005072811.1378555-1-Shyam-sundar.S-k@amd.com/
 - Move full buffer validation (type, NULL or short pointer, header and
   output size checks) into verify buffer helper.

v2:
 - Add a helper function for NULL pointer and buffer validation. Reuse it
   in apmf_if_call_store_buffer() and apts_if_call_store_buffer().

 drivers/platform/x86/amd/pmf/acpi.c | 70 +++++++++++++----------------
 1 file changed, 30 insertions(+), 40 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 4392bf0bc0bf..d71d592857c7 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -50,47 +50,54 @@ static union acpi_object *apmf_if_call(struct amd_pmf_dev *pdev, int fn, struct
 	return buffer.pointer;
 }
 
-int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *dest, size_t out_sz)
+static int amd_pmf_if_verify_buffer(struct amd_pmf_dev *pdev,
+				    union acpi_object *info, size_t out_sz)
 {
-	union acpi_object *info;
 	size_t size;
-	int err = 0;
-
-	info = apmf_if_call(pdev, fn, NULL);
-	if (!info)
-		return -EIO;
 
 	if (info->type != ACPI_TYPE_BUFFER) {
 		dev_err(pdev->dev, "object is not a buffer\n");
-		err = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
-	if (info->buffer.length < 2) {
-		dev_err(pdev->dev, "buffer too small\n");
-		err = -EINVAL;
-		goto out;
+	if (!info->buffer.pointer || info->buffer.length < 2) {
+		dev_err(pdev->dev, "buffer pointer is NULL or too small\n");
+		return -EINVAL;
 	}
 
 	size = *(u16 *)info->buffer.pointer;
 	if (info->buffer.length < size) {
-		dev_err(pdev->dev, "buffer smaller then headersize %u < %zu\n",
+		dev_err(pdev->dev, "buffer smaller than headersize %u < %zu\n",
 			info->buffer.length, size);
-		err = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	if (size < out_sz) {
 		dev_err(pdev->dev, "buffer too small %zu\n", size);
-		err = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
+	return (int)size;
+}
+
+int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *dest, size_t out_sz)
+{
+	union acpi_object *info;
+	int size;
+
+	info = apmf_if_call(pdev, fn, NULL);
+	if (!info)
+		return -EIO;
+
+	size = amd_pmf_if_verify_buffer(pdev, info, out_sz);
+	if (size < 0)
+		goto out;
+
 	memcpy(dest, info->buffer.pointer, out_sz);
 
 out:
 	kfree(info);
-	return err;
+	return size < 0 ? size : 0;
 }
 
 static union acpi_object *apts_if_call(struct amd_pmf_dev *pdev, u32 state_index)
@@ -124,37 +131,20 @@ static union acpi_object *apts_if_call(struct amd_pmf_dev *pdev, u32 state_index
 int apts_if_call_store_buffer(struct amd_pmf_dev *pdev, u32 index, void *data, size_t out_sz)
 {
 	union acpi_object *info;
-	size_t size;
-	int err = 0;
+	int size;
 
 	info = apts_if_call(pdev, index);
 	if (!info)
 		return -EIO;
 
-	if (info->type != ACPI_TYPE_BUFFER) {
-		dev_err(pdev->dev, "object is not a buffer\n");
-		err = -EINVAL;
-		goto out;
-	}
-
-	size = *(u16 *)info->buffer.pointer;
-	if (info->buffer.length < size) {
-		dev_err(pdev->dev, "buffer smaller than header size %u < %zu\n",
-			info->buffer.length, size);
-		err = -EINVAL;
-		goto out;
-	}
-
-	if (size < out_sz) {
-		dev_err(pdev->dev, "buffer too small %zu\n", size);
-		err = -EINVAL;
+	size = amd_pmf_if_verify_buffer(pdev, info, out_sz);
+	if (size < 0)
 		goto out;
-	}
 
 	memcpy(data, info->buffer.pointer, out_sz);
 out:
 	kfree(info);
-	return err;
+	return size < 0 ? size : 0;
 }
 
 int apmf_os_power_slider_update(struct amd_pmf_dev *pdev, u8 event)

base-commit: 086aeca907789bd2604f16f07bfc073b19015015
-- 
2.34.1

