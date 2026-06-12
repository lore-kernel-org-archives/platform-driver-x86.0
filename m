Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011068.outbound.protection.outlook.com [52.101.52.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86483793BF;
	Fri, 12 Jun 2026 04:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238412; cv=fail; b=OViB1HUuJOmF5hPAWouoewHCGYWyxoiYbmy21lN88kWIqZlaHyU0Xj5gXV9fD0INXv+U0/pufrIgCL+h0VijH6OJtwdywQKXla3D1BxNhtfAPjKp+2ppfjSLmqvPtLKoMmz937bbU5g9gtJXzeB0/FuetzFn7V6SV0IedrXBGhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238412; c=relaxed/simple;
	bh=FhVAp1lPjGe8GTXOCBqCSRHK1zwesljKOaHI/wjfz6s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XOObQbCbS4SYKGvluQ2QYcPVmQa8aMJjmDkVQQX+bDcYjPaprZyyLBV08B52R/F9KJTOTHTVWfBDOTR0diwcXy9odcigXsyDGHPkt7wg50mX3dJwVKh9w2wiSlk/sT5mQfvo3vU4AZw/X4sBdIkZCGbt6G7lN5/m4qI56KnlUHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4poxmMI4; arc=fail smtp.client-ip=52.101.52.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4poxmMI4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bK3+a++0H+fN7wqBCdngmfhbRv8Gspmflq4KRvl9OvRy939DdoTC0Bsk7O3VK4LADc7/Yd+uEuuW4D6NpcZ205O6ZJ2ZfhQpHuRwMC0T+4qsLup7Ln9WtvnN3PJwcub7Rss4tci+I6fQo1XnHkeepgIMYFPRROADSMj1pIv7Ap78VzYz8pCKuRQx7vKq4Ipxb72hYsBpWo+U6PJmGHu9RDG+kekz07eFrCg/0puYJBj88LDrYIMDjrZDl69Z+5oQTdisIUV5FicCkNU0USUClHKzs2KXL6f8Yeb9X87hPCuNiU2ES60/2bpqO4QqL4B2TIaT5tbG0jIzL5sF9KsyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smjemcLDJA/Y4bjk5bg1Iry0tzw8m42HJ90urWKpIWM=;
 b=WnRw6L6B2l9N3zii379MZ2Om6lUJaoo1NwlTBUqL1WOSR+M47W3HfB1neRhdwaV45yQDdsg0fUY9OcgVT6cWiDmpgWJLAO2wwCSTroCE/KK6n732Udnd+c746ZVymUXX4SP2eRgHlYBMDwAgaNvl5G5lAKSHO8lQlwE7QyGRKsE2CfglCCs3G+iB+1YG4vZdYBfL2F8siPCy/J0MBx/oh5Uw2Mteef4SKDf1M7NAcnoooExVvpexf0NpS5GFuK/CxcKKqnWRhOu+5t6dggnbZU3TlCrPfc3DQI0leypxu7R67HIwlPrzrIeIOVHFRcRm72q+pY4gY+/n+ssQsnw4HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smjemcLDJA/Y4bjk5bg1Iry0tzw8m42HJ90urWKpIWM=;
 b=4poxmMI4gLPkRoKyWX4Wb8mHUxCAVwyOc3E85Ewfjjp2NsrQIyNaUC09GqeOX6bwyKJKOkZd7LIq3i55rIXAfviH8kXH3m3C85CtmkDp7HfgL4LcXk/i8LZMYHLAhRV5/FbN1kvXNwOCwujJwzq7sGBw0Sg4RVfYSpLQoDKbo2I=
Received: from SJ0PR03CA0229.namprd03.prod.outlook.com (2603:10b6:a03:39f::24)
 by MN2PR12MB4126.namprd12.prod.outlook.com (2603:10b6:208:199::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.15; Fri, 12 Jun
 2026 04:26:46 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::a) by SJ0PR03CA0229.outlook.office365.com
 (2603:10b6:a03:39f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Fri,
 12 Jun 2026 04:26:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 04:26:46 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 23:26:44 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v6 7/8] platform/x86/amd/hsmp: Enable HSMP_PROTO_VER7 metric tables on the ACPI driver via the IOCTL
Date: Fri, 12 Jun 2026 09:56:09 +0530
Message-ID: <20260612042610.1629037-8-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612042610.1629037-1-muralidhara.mk@amd.com>
References: <20260612042610.1629037-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|MN2PR12MB4126:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3da854-277f-4204-233c-08dec83ad060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|22082099003|18002099003|3023799007|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	28X6DCPw6KnyzjST4XA6IKT42lTE6w5p0ccaBYMikT0H5Y1TSGa0gRNS+xXlz1d4Wwa8Q03DdHR1WNfr8VcY3Z96fh/JcAc7KbeYeC8jqXfA2xW2zqhS7PZTLcUStH3S4O1sfNe1+oJ1W9Nny4z/oK5VwpUT3OSUVSDs3TOcgInkuNu9UgR1t7PHLYO3RtxxK62Q7pleUnIodxhIDG6o2qs/VWwRd2Czmwzk5Y2r2GYcm1ZHGKw/uzq5J6bSBGR6bMwwNcAB8dwXyAcLD1ESEcHBJjopZcr/fwBVE46UdndzhXhHcxkhVzZ+Am6hy6O9VBBq+WokdQMNK7C7u128GYVkFGrZKA6RAPoP7B4UwEopJg7JdtIvezDpb7zi09GJqlSfbDWyDdgwN4qCfsNDOsreznBxOQRfI2M3iOyGQiaUGlCs+tFhHxA3YSyhIrfJmzl604d8UUWW9AqA21oez9Dz3YGRaln5xIS0CvBPqmG5x0IayXCvnH+LvO+taYYIQDrWCUAC/i/oTLmRhjERXJJuXPWPoZbfoQ08zpzxi60862knDjjT7H4dhkhAR0XPw/rwsPRYnPF2D1Ct6VTM6+BBmcWvG4y14Bs09yT001nPqnpYlM8EqW2OzoV5u1psKynuwG+1qLTcGhD1an3v6r452khg+KFJ+SLvlb0/Yu0fPhc4WhQDBt9fSqKoufYnXq9XItJcQdD6xqaOEYkYPYKvGTDEWvtJss2ScxT6cZI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(22082099003)(18002099003)(3023799007)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yMwa3WcjG5ePfB6BoVkS5VppEmhZBjkTqmXaxY8/APuxsoz+Ov3Rt8dkrIl+4OMY9y791HCahts4FFvuLJFBRU88O5BV+K+PoeriJ5Ea2aD8zbnqjuerc9XRJH6APXZt2AIGNnUzSc9nLN9QV5pLOFq0C0V/HEY0QJCg8IrR3/qgv0JLwvgGoH631RIx3qgy8cuA6vA9ZXxW6tXquT2Efgi/tiRtMHRnwvKYc8OvXMNKJ24RMmD2QxuBKIrzvREJiHU5ICSLaRsw88eh6osot51Zo2I/auFveHGK7JthH6MY7kISN6l+yDI2hS3DsQRp73bGjdUXfnzFatELRlbW6zhBHylA5aHRS6u+Lm1n5nxO+taghLq+AigiPwgW1NL4zMXg0jhsp0bZa13FJ3/QQMVA+N9J1lHtyrpEiusYBfoIIQg4Tw4geryVEHR0IJlZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 04:26:46.1404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3da854-277f-4204-233c-08dec83ad060
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4126

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

