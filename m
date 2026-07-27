Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013027.outbound.protection.outlook.com [40.93.201.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F842376A1F;
	Mon, 27 Jul 2026 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161787; cv=fail; b=s950bPxkiJnfBU6z5mS0H+z8mT9saVNwiUG1VMJdUzG4UGlttD/AGi6PFf3H/uyCFxIlwQB9ln/eYXQTX1yh0lIqeG0y9dULB3b6Ym4fpiGIjtOA4BuBDbY4jsnjteHW5ph2Q43BxQ5eJ6NKogp5yXKEeY9uBh/I+GHifwQwF4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161787; c=relaxed/simple;
	bh=VaP6ib4x63QSIe5PBOXWsjQlrI3yr5U1PyiZsiBuuEE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dMROoCOxjAtg3uvxaOJl3kazuV0FLAXfRuVrHfUQmM9GES5o9oePf5Y3jwQhHUfLRwIKgt4wh/lPNlwo2UKPB6icRvuzkjz9p1gqd1HqGOlGw0qtGzkMXrHQezru0MHo9L106+n85IFynDP/UPFxZjLthep0HBRuxju4LMERZw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=huEfk87w; arc=fail smtp.client-ip=40.93.201.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="huEfk87w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkABUPrL/cXjHWR02miJsruuBnnVOWB2WYtkSfo8yJKiS1Epc5YpNBjLHvdTgp4MNYZwlc4+j+1rcGgdo37b5jnOVNUxhj4anHF3KsU5+RvDF0RGh1xyE1aLqv0OnbmHpfls3Klrm+0sQQD61avc1FuuhZdpOaSdnEgJJalna2FQ5DYU/qFkSjI0dKV7L0DxRv8rhBP+6fY3ykgr5SX6D4NrfQfXCZRxZUGUzWp86yAxoxGjT6QeWtjhPZb1X2evgdz0Ur9bcDp30BsIlqNwMAdZPLcrBrGz0K9KgkS6Bj2zl1rYbpwO1OYPJZJO+cubEcEg+47oYfTgjYgNGzk0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaF0BE5b6ylApbjPTQJmuYHmRsJHSJ7s4KtbXwwnAig=;
 b=siq7j0Kiyvwysw1YKigEG1hgnDCsL94YLlb1MprMj4PSTDP3vcb1rQfvRcS6flma/+f5XQg4XOvUnuArPI7sRgijgSI1TDUCWAt8gL9tsoDArNBSMNtP8iWl/IkBE1nN2K+65MUoYHCa1am4ToYwdP8yxaZVxHeMLguLpqHKOV8UOUsAvizYqxP6QtsN1cpglhCleqnOROSse9/m+Xw4TQW9tC80Mq8wP66IS/MxtfVj1c+HuI+z9tO8ks9ffwWF6B7a9Zlr3+fn8FEeRQgV1NzLkahGztaZ+kAmJ+legFjavHo1dXXwZOM7+I+uBvnUAHNee11i8ghJx6P8eVUUlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaF0BE5b6ylApbjPTQJmuYHmRsJHSJ7s4KtbXwwnAig=;
 b=huEfk87wX4crOrD0qVo/i+nlfhWXn/p9xLavsCzXQ2egnD8V2clFJdrIGmrE5Az64XmkoJ9XxVGchmeE9fFFqbHvum8SSSQFsJLI+lGhsxrKTUPCcLm5muhginrZSn3UJ6tviE/oxrrgY0U3umaVCPEXJ0/SRUA/5jUQUSrxIwc=
Received: from SJ0PR05CA0198.namprd05.prod.outlook.com (2603:10b6:a03:330::23)
 by CH3PR12MB8880.namprd12.prod.outlook.com (2603:10b6:610:17b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 14:16:14 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::3d) by SJ0PR05CA0198.outlook.office365.com
 (2603:10b6:a03:330::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.8 via Frontend Transport; Mon, 27
 Jul 2026 14:16:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 14:16:13 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 09:16:07 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v7 5/5] platform/x86/amd/hsmp: Enable protocol version 7 metric tables on the ACPI driver
Date: Mon, 27 Jul 2026 19:45:42 +0530
Message-ID: <20260727141542.3370108-6-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727141542.3370108-1-muralidhara.mk@amd.com>
References: <20260727141542.3370108-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|CH3PR12MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 7972cb7a-90c5-42a1-e25a-08deebe99d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|5023799004|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	LQKKubYWdWDyMqeB9KDigEGWe5ZeM0mTCPNcjlIA+v+RdjkhFKA4ZVUNs6gOLQBELu8Qi5+j+NRqQb+Ej0XhXoo9/5xHD1lxcKXhX4fzO744rJI7AtNJu8VcfnpRThJ1uXxAi7GEJc6D9hRkRkuSVG8xeAYAOffUED1mNw6FR3PRpkVkde57kjQWKmQCISu9o7Zs7tUVfuk7svCAn9m6Q48xeW2Y0FlHGGRBnXAY7gOypSOy4uNqMIyBO6xPwLA7U8Sz/sc5TZpiubisbdfHS+YDJNFklV65wztrBXmGIYBU1HcXzuOjGxVSo3LWDoByJzSJ5svi9NrCwvBzoIbvAHPpVJ4ynKDG2b+SeH7e7kkIROBzG2hvvFftcNlZMK+U/ibsh0GuF9N3HE+fVogJyuCyZ6dWDGXo2i3a1kC3aC9uxx6MUroPw1yUHKoJUH8XfBGwmYU2a/YMRdx6Wt6Y+7AzL6BbleXj8Mac0MOJQvh5DhW38EMVMPemHPUp1R32BmkoWwcfqZh4Ax5IXL2V1XXWHM3aWcKlfrxWvZjJvJQ85hkwL7hageD9UlvZfpDV5GKVutWvq/EMKWEdl9FhoCEwugVsWM/eeQTuQyvopCDtnmHJ3jAAWsJ8slToVRNV3MVq+TRo+ACgVGEBKprA3aLq9qVDjO9QJHTVlS0ckbVdG3TOwH1TdEiZtRKTu/U+PXWECgPDDb12vs7lFYhYpw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(5023799004)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5aUxCFTf6YAlo70E/WRkyOtag3mVGxLVO9RtJsGFYleAZ8qN3414BPwBuU8XRlzBbx11NuFPGPiCRvJ+jwln094TZ9eIkxf2vRs4Yfc9eT5/Zwrgl+JDwzsfEvPQ//Oo09rc7MDkOf3DFVJ6HQPYTA+7bmQeowUaoQGi5K1ahkYoCuMgSoHWMzdgQQfDlf6+3HxkW/lVoxWVBW92QOiVobwZ73bSjLR0W62TfCNWlcch2G9Xo80dXx3xSkzhimyMamKbfOXXrRNhUHOJ/qgaefDkJDMg1XUsRdT+xwZOaFs7kq5RYcqSWqjxNXdiqDzhwOilD9y+zUziSD/8lJ3MbE++eZmd+MzScmFhp44uaAvkHzfHpXICPWhN2siE2NHwkNpJO8SH2o3SOjQvBmGt9Xnl4Wgg/laf1cuHgDErFfEOynsMu2zUtVp2lmeBrDJP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:16:13.3467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7972cb7a-90c5-42a1-e25a-08deebe99d75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8880

The ACPI driver currently prepares the per-socket metric table only
on HSMP_PROTO_VER6. With protocol version 7 in use on Family 1Ah
Model 50h-5Fh, userspace cannot reach the larger ~13 KB table:
hsmp_get_tbl_dram_base() is skipped, sock->metric_tbl_addr stays
NULL, and the ioctl added earlier in this series has nothing to read.

Widen the proto_ver gate in init_acpi() from '== HSMP_PROTO_VER6'
to '>= HSMP_PROTO_VER6' so the DRAM region is mapped and
sock->metric_tbl_size is populated on protocol version 7 (and any
future compatible version), making the ioctl path functional.

hsmp_metric_tbl_acpi_read() now returns -EOPNOTSUPP whenever the
running protocol version is not VER6, because the sysfs binary
attribute cannot carry a table larger than PAGE_SIZE. Version 7
userspace gets a clear, actionable error and a documented pointer to
HSMP_IOCTL_GET_TELEMETRY_DATA; version 6 userspace sees no change.

The non-ACPI plat.c path is intentionally left untouched: it covers
Family 1Ah Model 0h-Fh hardware fixed at protocol version 6, where
the existing metrics_bin remains the supported interface.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 24f54dc7254f..8257cd1da48e 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -277,13 +277,31 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj
 	struct device *dev = container_of(kobj, struct device, kobj);
 	struct hsmp_socket *sock = dev_get_drvdata(dev);
 
+	/*
+	 * metrics_bin is a sysfs binary attribute and is capped at PAGE_SIZE.
+	 * It can therefore only carry the protocol version 6 metric table
+	 * (struct hsmp_metric_table).  The larger tables defined from protocol
+	 * version 7 onwards do not fit; userspace on those systems must read
+	 * the snapshot through HSMP_IOCTL_GET_TELEMETRY_DATA on /dev/hsmp.
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
+	 * Keep metrics_bin visible on protocol version 7 and later as well,
+	 * so that userspace which expects the file to exist gets a clear
+	 * -EOPNOTSUPP from the read handler instead of -ENOENT, and is
+	 * pointed at HSMP_IOCTL_GET_TELEMETRY_DATA as the supported path.
+	 */
+	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
 		return battr->attr.mode;
 
 	return 0;
@@ -539,7 +557,7 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
+	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
-- 
2.34.1

