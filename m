Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117C21CA80
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jun 2024 05:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466844; cv=fail; b=WitZsFpYx85JLVnIAUX1thfmRXqhN6jjd84bChjZ37Mae/fceH2tJNbej849AB2R1H0+ljRdDjXzIqvj7NceSw9DNOu4ROvl26yb5k7jsbxL96yoPHPJOaZ97TfAJQOJ9ZZWPziz3ySfrHLXEn3FWbBnHHnITzYZMxdzm3rHA1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466844; c=relaxed/simple;
	bh=iTmKxT7l9mu3NIBewz0vZrirq06u5Jajarj1sVba9Hg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A3kUEFMkvOC7DQ+ftv9nBNYFwwsGGaEBjTil9iPcTlwmJb3NCxAEi4LJwWrb+D+1AiTr6OqWOHsFa3mjWHyYfM/ZLafECSly18lHKpa8ltv4IsOiiLpZlvhvIXrXtzgapCb9exl4Ilbgo5Ezta/gY7gxqANXlZ9UZFFgkCQgtMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qXDxECdA; arc=fail smtp.client-ip=40.107.237.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qXDxECdA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eq4BYBZg30Ug7qmPBQtUr2Tn2YNU4UwDIXyqYoeAAuox9svXNmfZuqNcWCXN3HK2NrEu0nwrxJUewAVgpi0O2CoNyTCCpZQYWcM1F1NehQylHe/GpodJjrQ1TFAhpnKyJDDbKlRWZx7ZC+Y9T2d373McYE6rZ0bEbXsY6T9M9jhGQDM5Pb3XAzlbgfdQdkB9uOscdDMQLkquXUIF8OjiHQssQvQCpSR2C5/o8LuG5V0yKXW3ztPaEQj2ASm0I+UjstIYf8GiM6Em5+pxjh7zm1JS7zYpo4uL1ndGjhyPrrHQsGlURsfA2QocN6v5AlVRPW5fd4YIN1DReQD2aSmZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoT0zq0OOofGYCLr5+9vN7LL8SYSVCnWLea4kyZqD8E=;
 b=bX5sm9nFhgV9KOXT1Jg9eCLJDnxTRQoEHvEQZ/KPtRAm712wKgBHzWYDn1t359nocEZT9xhc4mN1HUoZUPMAST1+zI5HtnCpM4KXQNy1ZLTfeTQgMvAJNucgIhPOcIZPRgs07FXwZ28SyDy2Ksg/4efuBIXBYypHl/Qus3f4ZQjSRrhQFrtWUlh5+nTB5u5J5wpEWWhBtevzoCcjhUJ+TSP/LGbjQ/PuxDFnEFfdYeW7n5UDvLj42bPqlk6YtG/InWBXz/9HiCwXrm9+AI6fxE5hlULIdOMqSM6xoFazUjsrwfV+mpHXfdDDblwFiolgAyeQjsHcfWhuINdUgOn55w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoT0zq0OOofGYCLr5+9vN7LL8SYSVCnWLea4kyZqD8E=;
 b=qXDxECdA3cjxJ4m8E+JE6ZnlYPq1c9z1Orc795P4EOTsJxLwOGtfR6iieK0XHv29THuujdUTu5X8tjHVpcksORoE0twLIpNvrb0MDtRjkabOeiHIrtaN1E43saJwqfCzBbYFYd8UIx88fzRk4lkAPSjxbjFRDVjlIcakh+Tpd60=
Received: from PH0PR07CA0059.namprd07.prod.outlook.com (2603:10b6:510:e::34)
 by CH3PR12MB9429.namprd12.prod.outlook.com (2603:10b6:610:1c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 05:40:40 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:e:cafe::f5) by PH0PR07CA0059.outlook.office365.com
 (2603:10b6:510:e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.23 via Frontend
 Transport; Thu, 27 Jun 2024 05:40:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 05:40:39 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Jun
 2024 00:40:37 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 10/10] platform/x86/amd/hsmp: Fix potential spectre issue
Date: Thu, 27 Jun 2024 05:39:58 +0000
Message-ID: <20240627053958.2533860-11-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627053958.2533860-1-suma.hegde@amd.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|CH3PR12MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: d33796c0-c151-447d-c50c-08dc966bad8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D7w27081ySYo8+SDvT0Qm+1g1trmXAUXqpN/+tPRJE+kNE5oDPPZbQK6RHEX?=
 =?us-ascii?Q?VgKlTx8YFWlsgT7DYOQNp9zOt+pz+mpyADRKSuU5oainNBvVaSVKk12aN3mO?=
 =?us-ascii?Q?Ziq3udzWf2Xiwbht/gHHZcS/HceZj6YyzX2Gh0Xyd3sRsm50WXTkuajxjjTM?=
 =?us-ascii?Q?qJXk9kHrHAxTT5LfPxrtrhs68O8asr4eRm8EIS0TUBQ8sjZcr5/PsmmzukvC?=
 =?us-ascii?Q?lAr4RODuw0MdUAOYrVyiBDk0HrBRt9RJNAjj20wr2eebx4jrx4R9VMcydXgZ?=
 =?us-ascii?Q?gimt+aHxlwhabI26nsoYAOr0rhZgks+AHkhBoiA2TTE5AX1QfyRnrQHILW8g?=
 =?us-ascii?Q?Tlqd2JlzLW+qqSc+F8fR6v9k/vnIIsklylfLxYSlNqRExj5fZcKXxUA/nAiQ?=
 =?us-ascii?Q?DBvVf0VgjuUZhynsWrqOieRy7STK352UnrBbGVwC5LPgPzeUUNURwPFLYGuU?=
 =?us-ascii?Q?q9QvbVvTf2i8PrAUO9zVS2aznTr8B/c63yJSSYN+haLNMVrKlodMUxrMoW9A?=
 =?us-ascii?Q?+aYnTrfLO2FK80EFztlXAHgaLru1xhLPN4UoxuDY1vYkSmsvied3r4r2tLYd?=
 =?us-ascii?Q?GCV7GNlE/tN+O89RQaAcWBQYkPls5QCyikr/SNqu89YtQ8+DWgvflqlAoLX9?=
 =?us-ascii?Q?iavd3LoajqpkUsOuNq9jpCPC0zG+Ui0lT5bDfUOJJx5LbaFZT6rd3vE8yZpT?=
 =?us-ascii?Q?9CcC/rKwSkDF8Y0P8uLIT2A3wqOdUVeToH+UhiUANlQuDUmAudg/tCoferre?=
 =?us-ascii?Q?N5rj31sUuDriX1lZWr1UsXyw8frkoRB7+CjV27z0jERHXKHnOZwB1UhFtD5t?=
 =?us-ascii?Q?6BHHK+PcTEj0PMsWdeEnaqs2WRu67wc6xJKfGmf0BXIigwykkabluLyKL+em?=
 =?us-ascii?Q?sGS6ELfAshOKZiY776EsjBFbOh5lAxP6+T7dxiQPDDmEDJgNfVBpjt7Rsjk1?=
 =?us-ascii?Q?0vtlbv1/ftqdDlNNCNcCDgXpq5WeUuoZZQPuiLZkAOixLgucf09l+QADs6kp?=
 =?us-ascii?Q?ooE/4VvmD9rXL14M2xVXkypzX38+qgtfv93WH6d2WlQAlfLYIt+Y1hAj7IX7?=
 =?us-ascii?Q?TeCmyE4s+jMvIsDYS2B9S4B9wc2fHjMVDxdpbjoEfCBrgM1D0yVBTuL17Z5R?=
 =?us-ascii?Q?ftE/sJQSOBr4b7hmsub+fwvoOegu2gNPfJHqIxxm9EcGDyaPbRgapNfTlGV1?=
 =?us-ascii?Q?h7AzrSik9SrAGQ1GqwA8z1PA/kuBVas5d1yvXJ3Za7KPOq/fG3mK4VzHvmdF?=
 =?us-ascii?Q?q6vm/cafh4ySz9S/1lWNyKSJEMIt8PIgNCC6DBF8mwahea9OEJ+B9TIHyQWW?=
 =?us-ascii?Q?NKf3vI+0EjZJ/ZpbTvKaznmMzN/XZCoNDXm/3RmW1N0EcUkiIyv3B+w/8OlT?=
 =?us-ascii?Q?1fWrZvLG5c32ZXjMi2tkBbfC6TETr0XY/mpyGSDzFW6T0O9qYL4v2UBVpwe7?=
 =?us-ascii?Q?pqakHho4vxloMMOL8bs/1bbQlGOiBARR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:40:39.6206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d33796c0-c151-447d-c50c-08dc966bad8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9429

Fix below warning caused by smatch by using array_index_nospec()
to clamp the index within the range.
"warn: potential spectre issue 'plat_dev.sock' [r] (local cap)"

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 3 +++
 drivers/platform/x86/amd/hsmp/plat.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 087cb360814a..f6d990fe0cb1 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -14,6 +14,7 @@
 #include <linux/acpi.h>
 #include <asm/amd_hsmp.h>
 #include <asm/amd_nb.h>
+#include <linux/nospec.h>
 #include <linux/platform_device.h>
 
 #define DRIVER_NAME		"amd_hsmp"
@@ -267,6 +268,8 @@ static int init_acpi(struct device *dev)
 	if (sock_ind >= plat_dev.num_sockets)
 		return -EINVAL;
 
+	sock_ind = array_index_nospec(sock_ind, plat_dev.num_sockets);
+
 	ret = hsmp_parse_acpi_table(dev, sock_ind);
 	if (ret) {
 		dev_err(dev, "Failed to parse ACPI table\n");
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index da4ddb6e9819..04d1da455257 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -15,6 +15,7 @@
 #include <asm/amd_nb.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/nospec.h>
 #include <linux/platform_device.h>
 
 #define DRIVER_NAME		"amd_hsmp"
@@ -75,6 +76,8 @@ static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 	if (sock_ind >= plat_dev.num_sockets)
 		return -EINVAL;
 
+	sock_ind = array_index_nospec(sock_ind, plat_dev.num_sockets);
+
 	sock = &plat_dev.sock[sock_ind];
 	if (!sock)
 		return -EINVAL;
-- 
2.25.1

