Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011012.outbound.protection.outlook.com [40.93.194.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C775304BCB;
	Thu, 11 Jun 2026 05:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155796; cv=fail; b=C/PzpfcZDQSck56wtwv/52HT3RR6tdEzQuPaoNAuegdV5muouxqIY7Jk3N0DlOCLrLl72XWdPJ2WtvDrz/4vNxmgb4IaHvDtnt1zzh+QhdatxGofCB+DhTKyDJt/RTehdqHNa4BddaoczaXJm2FWZJSIqYI5R29elMyodWldBAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155796; c=relaxed/simple;
	bh=Aq4kxSw1h/n2yfHlXazFcCm9eLbHfl6y29jaUyyqAkI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YfTHd/hpPvU3jMuDhD0nC9QbKv5OqxBQx1gC9bwX+0a4RtauKs8LRVOn6fKSSjl+i/7aZHFf6plJ12+qkwlg77mA6YlvEww16Cn5y6/4tjD4nblXidZF4gavtDlhM/xz+OWpnNc7AZZTh+umwyK0ctWpU5ApeKgYM8MLgxyY/7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=znaeyafo; arc=fail smtp.client-ip=40.93.194.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="znaeyafo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRLBQMwD264Pc5nTSe/Bgb9OuZRiZITl/kYFik8hNASceoL8NNN98paH+2zP3ef795yNLyI5yVB344hOam3yhL9Ad7SyOGfgELDyNmNMtt+KowyBHaiLmYYe71rvyz6AU+Ui9IDxJREajO6VxV+Ym4IYzRCPZ1XnnPAWJu5PJ73fBTNJJ+T8MFgZDvLuAwIW19azhDm/lpI2MGg2ZChnIZWOs1WuQHXoIVNBg9zIJL8thrkjbt2rN2fLPFj4AHm/4pfcmA/W8vnVBZsazn9F9G/PDWwAiSLZ/RA0iuLDtW46Oz9Itmlg5SGZ/EFBuwbVsMS7E7HSHpEGX5MIPC9znQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+H+c2uRkOMa59N5Rhj0L7ptDOcOL4bfpqUm2vGCPwBE=;
 b=yR/hH3hghc6ISRLdeCpfb1NirdzqwcLQxOdM0Ohk56Lshb8+6I2Z4JL/zcErit5AOd2w/r/44cPFsyzqkgRMUMjueDZVHeapzo8OilJrCLoHN1lx2iVPLTY1fQzEiWFdaFwJ70yv9Vp0XZAtc/o4DlS2OIsQ5//nbqciZuyEXdvxASKYcJCItBtY43qXZy/t8xlAgn7VQo8S5lre7o5nHXq0jfmbt+5JE+VGUKKFYtG7FIdT4bE706aPiJATv5m/7fPaXm4a56Whf4KHBYCe9QFmNXhdnYxTOWLyS1jqqoVYMnURYwY08KDHtfZ626pJeO7AVCHN/EKDVwhjfChbaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+H+c2uRkOMa59N5Rhj0L7ptDOcOL4bfpqUm2vGCPwBE=;
 b=znaeyafoFY5Kc4riqPc/zYx2/HUmZQ8WrS0iFGK6ty1dAJFV8OfE6Bk0JmoeCS7uU4F/nnqn07PKxciPA1zQBh9WgZmabUT2Bc3K8nClfUY/P1kGIQVYbyOCinCKI8uZop5ATY4SMpPKmB32iCoT5SLDDrLWXTo2pRQwSNtOq5I=
Received: from CH2PR02CA0005.namprd02.prod.outlook.com (2603:10b6:610:4e::15)
 by MW4PR12MB7168.namprd12.prod.outlook.com (2603:10b6:303:22d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Thu, 11 Jun
 2026 05:29:47 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::5b) by CH2PR02CA0005.outlook.office365.com
 (2603:10b6:610:4e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 05:29:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 05:29:46 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 00:29:44 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v5 4/8] platform/x86/amd/hsmp: Source metric-table size from firmware
Date: Thu, 11 Jun 2026 10:59:15 +0530
Message-ID: <20260611052919.1095549-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611052919.1095549-1-muralidhara.mk@amd.com>
References: <20260611052919.1095549-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|MW4PR12MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: 0440b224-62b2-4101-da08-08dec77a735a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|22082099003|18002099003|3023799007|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	13B8sfoPzyQlYlxDl/ReTVM4iHGJPBS4RL9NkoB36RWUXfMO3W2AfAf3Ut4X3BnraXeJVV4u+GgjGUn5KW1tHDp8yrpiOIxK3JjH3U4JsB8zt89T756NUnl8UfcXWu1Y+59cGxCt43iKZwE0u2Untz73/hj+gTBK6/qywuFgzArXrNfh4kWVWb4KoqWlotZKU12g5BHrwPItTxv77g+zEkbpO+7AaYJUoLC0I5g/ugk/QSSf+lQ0UYWRa8eLRJ7fDXJK8CpwT1G6FIMNetwfDeyMWCaKZrwAcRMEOHG0aZaw+o0/K3NG2XJ5hrMrd0jqiqd2NKZ0LP0uAw5Vgxhf/g39IQVcnXXPlSye8Hqx+76K70wcB2miBtl9HBfJuo9hLQbi6yU5rCTuf4ffA0jov0ORNnMzus42xR9iiKGFecDKnlOTk5/GLKJgUXwKzJIfTky0FthzUrxRsqKexEg3PpjDJ66uZTWuU/iveE60zL5uJDjOKGOYT193zwsDouV2gD9wCAO5sYv5RtTu15Sv+DpCZmNPswbZkhimTBHD6diEhSItEbqRGPUVdj1virPou9mWgEjUtdtYw1XFDuDqTo+fS5foGXMf0EGHmoV0Ub323ZTPimo3FzVItnDmKJga2Dq8jUaydTJKGD0CKKxWYdCifmF4CphGXe5tCMqY3KUJRzpTyBF5zV3ExX/JksgyGxJwDm55cST0KMK0nU7sJLhUSKAQtbVysk53kje5hZU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(3023799007)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LNjebxYv49H7JuqHHrcBrVUJmr3c2bme9VVecO0X+4iz78mKk3qD+lw+xMDu50gVP8Mum3FW/BDsIkUewDjfpr37J1j7pfPMepp8V5OOkLTe9fE8FUbHbeLQnfjJRnD15jvcgKv47fXweTEj5c/xlW287AEUBZD6VKBrgfXpRcSumPDbiu5y37+pgtdR/p4f/odbSEjBJcpEshiAlTcDxTbOPqbrGCLrfam2pFOAhRT9BrZbr5Z3uP2GDvmOOFSRAthmnzPrq0CB6+j7hKI/ld57kU+sQDIJbqIAyif6cvxfzIzFSjvYWhGW9HAW3SZ4bFpr768rxFG6adYxoeY18FqcdAFTa84ClmEBkOh32DCOEQAvd57liYTrol4KOp1P7gsE1bsjNFR9jKqcsKvGfFZobK3CuAZNCJ9d5EzqlCZHIZJ3cG3LKZY0JRYkyNuJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 05:29:46.8132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0440b224-62b2-4101-da08-08dec77a735a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7168

The driver hard-codes the metric-table region size to
sizeof(struct hsmp_metric_table). That is correct for HSMP protocol
version 6 but mis-sizes the ioremap of the SMU DRAM region on newer
platforms: Family 1Ah Model 50h-5Fh exposes a ~13 KB
hsmp_metric_table_zen6, and the table is expected to keep growing
on future firmware. The same hard-coded value also forces
hsmp_metric_tbl_read() to reject any read that follows the actual
firmware layout.

Pick up the table size from firmware instead. SMU on Family 1Ah
Model 50h and later populates HSMP_GET_METRIC_TABLE_DRAM_ADDR's
args[2] with the DRAM region size in bytes; older firmware leaves
it 0. Bump the descriptor's response_sz to 3 so the field is read,
store the value in hsmp_pdev.hsmp_table_size at probe time, and
fall back to sizeof(struct hsmp_metric_table) when firmware reports
0. Use hsmp_table_size both for the devm_ioremap() of the region
and as the upper bound for hsmp_metric_tbl_read().

Behaviour on existing protocol-version-6 hardware is unchanged:
firmware returns 0, the fallback yields the same value as the
previous hard-coded one, and both the ioremap and the size check
produce the same result as before.

The ioctl interface added later in this series uses the same
hsmp_table_size to validate the userspace request and to copy out
the full firmware-reported region.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 arch/x86/include/uapi/asm/amd_hsmp.h |  5 +++--
 drivers/platform/x86/amd/hsmp/hsmp.c | 11 ++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |  1 +
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 34e25d9048d5..77bea5ab7ade 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -367,11 +367,12 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
 	{0, 0, HSMP_GET},
 
 	/*
-	 * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 2
+	 * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 3
 	 * output: args[0] = lower 32 bits of the address
 	 * output: args[1] = upper 32 bits of the address
+	 * output: args[2] = DRAM region size in bytes
 	 */
-	{0, 2, HSMP_GET},
+	{0, 3, HSMP_GET},
 
 	/*
 	 * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 9bad58fef304..cf9392f99298 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -356,8 +356,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 		return -ENOMEM;
 	}
 
-	/* Do not support lseek(), also don't allow more than the size of metric table */
-	if (size != sizeof(struct hsmp_metric_table)) {
+	if (size != hsmp_pdev.hsmp_table_size) {
 		dev_err(sock->dev, "Wrong buffer size\n");
 		return -EINVAL;
 	}
@@ -398,8 +397,14 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
 		return -ENOMEM;
 	}
+	/* SMU returns table size from Family 1Ah Model 50h and forward */
+	if (msg.args[2])
+		hsmp_pdev.hsmp_table_size = msg.args[2];
+	else
+		hsmp_pdev.hsmp_table_size = sizeof(struct hsmp_metric_table);
+
 	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
-					     sizeof(struct hsmp_metric_table));
+					     hsmp_pdev.hsmp_table_size);
 	if (!sock->metric_tbl_addr) {
 		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
 		return -ENOMEM;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index b153527e0a0d..e7f051475728 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -55,6 +55,7 @@ struct hsmp_plat_device {
 	u32 proto_ver;
 	u16 num_sockets;
 	bool is_probed;
+	size_t hsmp_table_size;
 };
 
 int hsmp_cache_proto_ver(u16 sock_ind);
-- 
2.34.1

