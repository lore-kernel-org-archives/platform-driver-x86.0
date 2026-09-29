Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012016.outbound.protection.outlook.com [40.93.195.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D654F5DE3
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 16:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697795; cv=fail; b=U9hFq0kl/2ZUnU4tgs+FQ53F3SpYHincho1jMgbZmRqZ/OijNIXqyaj5vZdTVRLdycVOnOjpJnoeA1ocAkgXs7xQonuUVToy/4kIYf+2gxZXKAZG1/FJ9K5lNSCFqV9VQyzp7AIG7iU7JtrZ2jcN4wbh4OlqtN8UxxZn8gBsHXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697795; c=relaxed/simple;
	bh=HIDosGjb35exlVmBdCo4c3IJmI7h5hTBkk0LpNw51r8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zit5UREzjcOblUZhgZueMdCx6lGCrYD9ZxH6GOMt/RIfAOtzvpzpR5NMETKC7cOVxICEH45fIY8/d/hnYHnoUqEhwpIBVILsmDVjavYNGqR25gRx8iiR5mC2+WL0wua2Y2VYazSy0pClR9GwwYPjiP4V3Imbw3OHK0K787tL6MA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tJR9rFh7; arc=fail smtp.client-ip=40.93.195.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tJR9rFh7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kdl5jfjQ3m8z+BFCG23oyd/cNaZ1wAgQBJLhNGZEZF7LfIMbNBCCFhxXekGApxKi386YOeZ2iWc86EYulJkTa70lsM1TeeQIvTujUj0BWYLY9Ndw1cNrGxRb3EcA1AglMh5/GyihF6nEsDB7e3VdMHU7+fggNT5JyI0dXLH6+3XdlOQnPVUu2X6uwab5xh/gN4dYLZaM3SvVmTJwTgy1bSnZJ7TyK6DydELJHCNTqSVvFDPHneYNo5hEG2DFsb8gpxNq+RuZ9YiO2VkWsP7E0abT8Cntoux76cQCbtOF58WLXCvM7PRBEUStb4lLr9tSf24/MJYppKgUAvNiXQ4NxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jxN5NSjCY1qllv+WK3wxQiCaUS/pyMqHn+V8slcmEo=;
 b=ivJvyVfe9vQkKs4eBC+X6w1sXNb7JVACDVYJYE46prNtpfGxK4MRX9bnIXGvXJAMrALsZCQjHqisiE0MZiKmIizmvaa11OKsfIlZOORWpjXDXszyzOW+G01UF4i0avAbJJM07QJyeK3LIrikf0ihKZ66fjtd5vkY/44ID7+6bzjolJrnbH5ukVpFIPXjAEnmF8tcqbB/IfGeIzgBrNevwrIMYnIw5KNdydM+tptQQ6k+5VTvWtIYwHXMZRe/HlcW68QQ+9fnIrDH2/fir4O5gpO0sxW6RAVNt+CbIH5goeG+rheGU2obaTZjx64oQbsAWPGI3KoHxJ9dr5qRlDdQEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jxN5NSjCY1qllv+WK3wxQiCaUS/pyMqHn+V8slcmEo=;
 b=tJR9rFh7g5/EDnpgww2unTecJIjbaNCCU524IhTemYPhWjeulWSkJYsd/QxzvL2kvy6ELshXPwXn6FCn9IGqciFHa2Y0oz42JGekkkZAOwcK29aqBqroOdTAM27CqXUlRaT1aPLN5ywtk+n2ccLMlxmd30avCYHuT/acrBRrbds=
Received: from MN2PR16CA0044.namprd16.prod.outlook.com (2603:10b6:208:234::13)
 by LV8PR12MB9269.namprd12.prod.outlook.com (2603:10b6:408:1fe::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 16:03:10 +0000
Received: from BN1PEPF00018548.namprd05.prod.outlook.com
 (2603:10b6:208:234:cafe::54) by MN2PR16CA0044.outlook.office365.com
 (2603:10b6:208:234::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 16:03:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00018548.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 16:03:10 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 11:03:07 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd/pmf: Fix ACPI buffer validation in APTS path
Date: Tue, 29 Sep 2026 21:32:41 +0530
Message-ID: <20260929160241.1718067-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018548:EE_|LV8PR12MB9269:EE_
X-MS-Office365-Filtering-Correlation-Id: 96adcde1-80a9-4ff3-b7b3-08df1e4328b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	aKTNHD1az60pdOKISECjFayphyUzYKJmyTaqNQLl0BF3OjdGW55jMM3AQr8FE9cBC9vRxTG62KfJQzXxqfjA5gEa5Qb9GYVFMnY7GQdLlfbENijYSLHFd6XIIaC7npH1/Eah1ndXcRohvbP8w5w9bGSXCUAuoZMvoaWh0T+whcRVayDktXnIEZXYM1IF5zqOubFniEFAdV2C+HYelyPMbK3iaD1K9XSp9xh+FZ/c6fZLibZU75j+xlfmVp5ln7YQvL9JZR6T7HuF4c+KSXvM5CcdLEY8Vd5JKmdymDJj9zIz5tJvFDD7XttfwmHdDsIRpOasVYrCJbzWDdTw/lkrbXTJhogiiDC/x6SLCtzA0BsoMk786e+aq5y1972oBfanZTIXDXgHy3SYRVaiZE4I/1LzWTosuctBO5+Hxy97DXd4oUfufjUEbXcFp+on9FTsoXIgkioZcrQ2brnEqqlsRRaE59Pa4gRPCja8m+gMbCvPuQ+8M3jQK/iw18EDqqlwIEbwWNeF+Yo15zxWikQBGOYi5+od+crKWA4zEp+zCRq9zbOtVfS0rw+OedqYPibHfEUB1FqaK+zcZO9ABCoh+YSnIGXc9QpGu0otxB37p0ciLF+BIHapPefEduXWM1Xcj/BObPo05WaaUqrCW8KGXunGBi5pyyizFUMhdUQs9Ra/wbn8VjIkg3uiLbZBZdcB6O+WHUVS3IYC4MuFqkQ7Og==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X8xtMq4vv6+Cb0IdaZPd5p6fWLR1pHxMVKFilehbHu9Jva5DZxClZN0BRQHNxM05Gr1UtKyxbzW+gft75mPLQwN9nlXQT89v+hXAadjn8s49f7J2SpVguvTx1PKBah9eNjEDyDUqsp6tntwFnX5RQT3zEIRHkp5R51UJuIVl7RH8DMfEa4lweYv1gdhOINWEQizCBR0WbBnpatzFDeogp0J+rGHcuLo4H48j+dxKuwfHKP6/j3F2Fl4Y1YJUc68qkeLxT2Ex5vhpIP6e45yA96B7F1HVpaCCMmhZAPSyG1E8lMSU6lnlF5kI0XWW81hHi/DwpcxBgysSK9QI8dqw8Vcvg3XGZW/QT875UQh/hwl8LUpjNaWT77cBrR9hNEqIIeiPV31uEtUSrFgfZigB8aCPu6iVNEr1ii7tvoTXLP99jOC+8WhkYMXfJ2cOYG5l
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:03:10.3804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96adcde1-80a9-4ff3-b7b3-08df1e4328b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018548.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9269

apts_if_call_store_buffer() reads a u16 size from info->buffer.pointer
without checking it is non-NULL and holds at least 2 bytes, so a short
or NULL firmware buffer causes an out-of-bounds read. Guard the access
and return -EINVAL before the dereference.

Fixes: 3eecb434d7f2 ("platform/x86/amd/pmf: Add support to get sps default APTS index values")
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 3d94b03cf794..c820a5da77ba 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -138,6 +138,12 @@ static int apts_if_call_store_buffer(struct amd_pmf_dev *pdev,
 		goto out;
 	}
 
+	if (!info->buffer.pointer || info->buffer.length < 2) {
+		dev_err(pdev->dev, "buffer pointer is NULL or too small\n");
+		err = -EINVAL;
+		goto out;
+	}
+
 	size = *(u16 *)info->buffer.pointer;
 	if (info->buffer.length < size) {
 		dev_err(pdev->dev, "buffer smaller than header size %u < %zu\n",
-- 
2.34.1

