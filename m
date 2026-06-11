Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013019.outbound.protection.outlook.com [40.107.201.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB4935E1B6;
	Thu, 11 Jun 2026 05:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155800; cv=fail; b=IuBeJIJLj3Ei8tMbKD3XfM8N0PLzruKBXYMfvqCLj3UoEG18Q5rk/AXqQGwF/4kybYOTKwa48nIueifjU06AYg1+5N7jwWwI9Q+4BlHaq94iymAbkgY9iNSoiWP5hjcIRdIA8iLYmwrJy0Im3CsR9t22ZtXCc2GiBha4BqPot+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155800; c=relaxed/simple;
	bh=FhVAp1lPjGe8GTXOCBqCSRHK1zwesljKOaHI/wjfz6s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HO2fiI2m70LCnJ2UlDpKpaFHQaMEdUDIqH0iI5lo+H8/G8hPgNCO+CLJ4cZSeai/DIJ42gpn3pmfcMjh+2oGdS2cZsaQAKDnSiwnx3l5bIpbDEVDKoVBFsSd4Pebrx9QgYS+IHeiSyAiOZOxkfuFv9bxDuS3hdTXZtzEveJREn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Rv5vQkOk; arc=fail smtp.client-ip=40.107.201.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Rv5vQkOk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+0Zu9A4NrkzOVmzb0q4ERHA2w9chvwR2RGn0eDN1dbc7ZLPnB2S53OUL6WMG5gFA1PVkFstferVMP1TXplcwu7/0NV8Dse27NWJq3iWoz26OttMNbX+E5cCsqU1bdW6/R12Pgw3eoO2iVdkgNx9l/3TRbDRsh/+1+ZLlwdz0hRJU4tDo9d9z+vEwrzvIIa7i8ORcyYXeVba7seLpA7bvTTtb28eRz7WybLi/hG9PACvylprP46TO7ZnRCV272EITwQQJmUXOBEMLPBqLKCR8vAmweqEjVku92IMJgONdXvXekolM8NCrx6TjF/ywSzqs/kCwhmzL2Yf1NHUnZhnfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smjemcLDJA/Y4bjk5bg1Iry0tzw8m42HJ90urWKpIWM=;
 b=liTNCBGqhlbIjdQf+t6c2ggwIs9iZuTCiiLxW/nfabq2W0JDejrZ7Eki0FW3JZTXlLD39hFQpJb+NzAVexSpz3vwRP12rCw8r/U+PnoWWyqEgEBK6270NoLJ4pla4TE+xGCXhoRlXA5ZKE1dpyxZhgSpPrv+BXl2VadiHlZ3/K3VwDQFAVeVcE/m7yRmGxxNmGDMfb2oyFUQWjPgTOZWHeXcSI1Aja9MDRpSoQ7FHoFlilq8dNRbctlBMjvHRqk6jGTeFFqQaoFDZ5M0LIRtka7AKgj13GLgv0xdhW+zUGKAn/UuGlveMgkaNyl+2zmz4nY9vzFM/6KM640bGuaiqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smjemcLDJA/Y4bjk5bg1Iry0tzw8m42HJ90urWKpIWM=;
 b=Rv5vQkOkFNXoGkLyhqWXz34DYOLZKSLwQ8IqbHUvimj7Trf461c2NWuk9Tqm7aWQUXjeOb8ZyVLds++CaMoj5hsNLTWKWRU/qSCyvbcFV6Ay6EW/dXNncLM1dbiDeJw4u8d3yeyfsGWbd7xsDkfJWziPcUlQ2bn6IJZcvaRucM4=
Received: from CH0PR03CA0255.namprd03.prod.outlook.com (2603:10b6:610:e5::20)
 by BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 05:29:53 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::9d) by CH0PR03CA0255.outlook.office365.com
 (2603:10b6:610:e5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Thu,
 11 Jun 2026 05:29:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 05:29:52 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 00:29:50 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v5 7/8] platform/x86/amd/hsmp: Enable HSMP_PROTO_VER7 metric tables on the ACPI driver via the IOCTL
Date: Thu, 11 Jun 2026 10:59:18 +0530
Message-ID: <20260611052919.1095549-8-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|BL1PR12MB5732:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc6bebe-1cb4-4262-5d78-08dec77a76fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|22082099003|18002099003|5023799004|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	vvFFHHn9bWxHjTQ1L9WMpU0T2M5pJvy48T+jvzjf1DwkM4yMWLfy15RZHkE/LtErMSlr+AKQu3V7/epfqb81d3TRJeQMwvbS4gn5zYRVaHLRvSAfcy8vApGvGPzP+HbNfQjhoPlvDdBgO/m2GJRzf1vrV2fZ1Ol+P2xpFEgV5+ufTPRdVYfaYV9pZiYHvaj4DfboBBHzLg57WazbKMiefSQlJRDo4OWJ1F2Havl/7D1wegdwkXZqySYS2QzCeLSsVpKfjcBDNaeTbI5h/G1RyPgHHwfAxeq6ZIRjczGEQx6pi1EOzI5T0bajOpB9NpyMKJiRw4Xa3VIdTyr3VMbdkCm93EbwsooK231zprbkE3BkNpCI6k8aDh2re8T/zf73khmHv8z8O62tQp9NdUHpzVmERvdh8saYRHB+KpkZ7FmER0bPx5/TENCTl7ITyGGckbN5OSx6qw5eXiW6W4I4LS9HWULJBK8+fWfLxpOjybrGeByHeH5becAgfoTWce6w+6U80JaQD+trO0CMXO5S2MaahdbLlQl+R8Yh5r5qyWq8w02ZMineFpKWm2X5ZCkDHV3q4ph6yo+EoxDyvBhsyKmvZPBESTi/f/Zpd+N/tru9SACg0cLi6LmbjQUtyVTjQmsv841nsCMXvRTndcp4IcuuUMFxJ9Pf/J4ATGuSZyNe16HWdq8iXL4V5dyUBrfHt4Er/JXPGpvsCp+1k1kYASqWqyIeH+m2/n5kcUGiEWs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TfBc9Zgz/9Vwb201syEx2HY6wGp6epYWkRjkHz66kJRcesI2szal0elN1vmIllun2Bnzn9xqfahUBSfjhixdB8mR2G6GbfvEm7KmBFQdHItB/vVMKs5Bksde5JEkKZ8PZCxzdWQvDjv4wk5ffZetqqkUGYYjDqpyqGtYZNhFnTOjf1k+HkuTgcx88qInf+6TtdB8jt1JUTA+og1huG7fSCkBsKlH/Xtr02t3UoSI+S//oo4zRs54Ha3a8MhBlMyzqSLscaiFhMNMa9QHNCCt3yiA8V4XN5VOgVzW1tx5K3APeJLD3cRDYmf9a0uJZ1Mi64mbLBd4uTPH+yzjTS7nVjnEtTvgr3t3whpQbAPcPpSGMLMXkyKD0ow3+BKwFQ6k/ZzBqjiw9nDBzMImeQT2LsXTOcRs0pxbUgfCsJXEaPQUDKlPmdrQZv+QEvDC0/0/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 05:29:52.8838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc6bebe-1cb4-4262-5d78-08dec77a76fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5732

The ACPI driver currently prepares the per-socket metric table only
on HSMP_PROTO_VER6. With protocol version 7 in use on Family 1Ah
Model 50h-5Fh, userspace cannot reach the new ~13 KB
hsmp_metric_table_zen6: hsmp_get_tbl_dram_base() is skipped,
sock->metric_tbl_addr stays NULL, and the ioctl added earlier in
this series has nothing to read.

Widen the proto_ver gate in init_acpi() from '== HSMP_PROTO_VER6'
to '>= HSMP_PROTO_VER6' so the DRAM region is mapped and
hsmp_pdev.hsmp_table_size is populated on protocol version 7 (and
any future compatible version), making the ioctl path functional.

hsmp_metric_tbl_acpi_read() now returns -EOPNOTSUPP whenever the
running protocol version is not VER6. v7 userspace gets a clear,
actionable error and a documented pointer to
HSMP_IOCTL_GET_TELEMETRY_DATA; v6 userspace sees no change.

The non-ACPI plat.c path is intentionally left untouched: it covers
Family 1Ah Model 0h-Fh hardware fixed at protocol version 6, where
the existing metrics_bin remains the supported interface.

Reviewed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 97ed71593bdf..8dc6b4a8bd27 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -238,13 +238,32 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj
 	struct device *dev = container_of(kobj, struct device, kobj);
 	struct hsmp_socket *sock = dev_get_drvdata(dev);
 
+	/*
+	 * metrics_bin is a sysfs binary attribute and is capped at PAGE_SIZE.
+	 * It can therefore only carry the protocol version 6 metric table
+	 * (struct hsmp_metric_table).  Larger tables (HSMP_PROTO_VER7+, e.g.
+	 * struct hsmp_metric_table_zen6 at ~13 KB used on Family 1Ah Model
+	 * 50h-5Fh) do not fit; userspace on those systems must read the
+	 * snapshot through HSMP_IOCTL_GET_TELEMETRY_DATA on /dev/hsmp.
+	 * Surface the unsupported case here as -EOPNOTSUPP rather than
+	 * silently truncating the snapshot.
+	 */
+	if (hsmp_pdev->proto_ver != HSMP_PROTO_VER6)
+		return -EOPNOTSUPP;
+
 	return hsmp_metric_tbl_read(sock, buf, count);
 }
 
 static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 					 const struct bin_attribute *battr, int id)
 {
-	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
+	/*
+	 * Keep metrics_bin visible for HSMP_PROTO_VER7+ as well, so that
+	 * userspace which expects the file to exist gets a clear
+	 * -EOPNOTSUPP from the read handler instead of -ENOENT, and is
+	 * pointed at HSMP_IOCTL_GET_TELEMETRY_DATA as the supported path.
+	 */
+	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
 		return battr->attr.mode;
 
 	return 0;
@@ -491,7 +510,7 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
+	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
-- 
2.34.1

