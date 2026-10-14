Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00D13AF66E
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976524; cv=fail; b=LQ3RFuZjNelvF7Dr0GKB+iQKqWIFl3TlHXEWO2oZ9rg/DvILtXPma0CMOyqm0LqqHJ73rzHU57LltqoEjSSqrF4RHOBlwjEhSJ1TPup6yte5gMe40jYW6pBu1Fz+Qxt2vNX+i8tlnLoOq9vWqw1INMIXV59YMGMuZcl+x38PyqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976524; c=relaxed/simple;
	bh=J30FXaGXMG/Iz2pt5Bnz/VDIT5VF5eJkc+lEvlRKSik=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KRKfO3c2PsJPcKO4IJIKveWYB++qLM+ViVmk/5qudPCPEgD/ErXnFErBlcw+DphucxQYveD6ONjFTiznzHtyxqPDjcitczsZFkNo5r0w27wlE9KWGGXg2PX6rqGRerDtnavMVphpcT5G7ORorCS39qnKUgVWdb0tZYskgGSJFGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Y2nwKYva; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Y2nwKYva"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4xPiPaSESN36QBTGfLZAXyIa+GVuXw+wgyEb7+O8FFwfTUkRLyMWyiRPYaMVZeDIbn8b13oeTgQp/CJPa0j0LZc/ng186uSTcjp4G59On4g4CHLTMo8OrnUOR/Gi/mAFGliSezNKJKEfSsmMhtHDq3mpkzLza6EuUyceOcQd3t1LLhn0yKJeaKAMIs6W9PIds0HN+PIAVne26wliQKEgpUk/jHyNPe8BFg6dZHpXzYRBbJlXU+gVdKdXyfqa2GMsEvDvMLBYcmuivrBRxIqkYLmLXKhToCnum2NhZna3s9GLsniOZWN7MCNO243K0Hvs4QfM6RMpzA113UiPiDKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UyEZ9EAB+fmoj78wQ9hEfdgq258mRoM6gEFqXbm4RA=;
 b=Ch6NVvDJvbx4m+2lF/ay7+2qgVDnDYVXeHHsAp6zQMSJBi+zEZUlvsSU+MvPYCOrUXM7BD5ZhDjgxO5jqC5RMe/gvfebjipq4VFtumnn8bLZpChMAyCOlAvGPALmtxR5TXJaLHoIqYzV/UqT0BSebZQ97gV41qhiT/02qXQjxBReHBiOV5kxQAjAY7c9Maj5Ssi081nwVNXCWIRnBuuw8y7epKV3cS8U1ZoOsIjE4/qwD3tYcBlRvgc1MTj66OT05GL7wSP2Zv+xTU2ho+IhyODXK6b9SyJmKXrnIMbfa9z5s4SchTUcWPMx3XnIdeW57AtcP+NVXKgssLzUb7I4Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UyEZ9EAB+fmoj78wQ9hEfdgq258mRoM6gEFqXbm4RA=;
 b=Y2nwKYvadRyAIFx8ou2V8Ku5sPS3Zw1SWfUCVd15VMk8oqMwV4dwATXOhTb8/4EAuxipkZtSO3JsUpdDUT9Dz7DwpT1fBjBrS4QrpwXKflclkT/d6ebpPur3FH+h0V4b7LIL0C4PFGWuW3EnMWmBLvImuNemB9gPe+m7i1kRqsI=
Received: from PH8PR22CA0005.namprd22.prod.outlook.com (2603:10b6:510:2d1::18)
 by IA0PR12MB7697.namprd12.prod.outlook.com (2603:10b6:208:433::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 11:15:13 +0000
Received: from CY7PEPF000000F2.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::f) by PH8PR22CA0005.outlook.office365.com
 (2603:10b6:510:2d1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 14 Oct 2026 11:15:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000F2.mail.protection.outlook.com (10.167.247.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 11:15:12 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 06:14:59 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <muthusamy.ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Suma Hegde <Suma.Hegde@amd.com>,
	"Muthusamy Ramalingam" <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 5/8] platform/x86/amd/hsmp: Move common sysfs show handlers to sysfs.c
Date: Wed, 14 Oct 2026 11:14:27 +0000
Message-ID: <20261014111430.23156-6-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261014111430.23156-1-suma.hegde@amd.com>
References: <20261014111430.23156-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F2:EE_|IA0PR12MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 03e44ce4-5de3-417a-b870-08df29e46a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|6133799003|22082099003|10067099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	AtsrEoDk4zHIVdLwsk59ulGIxIw4zr0VYxyMbyIEqGBPAreRWKM1G9vPulDDHTYR3U76xO1dkm/4gh7JVxSip9svhe39dJ2cjrvrNQCkJ4gBwVxUHZfbGx97Txb7G7cqS5BzapftvaifhcWX500RyQLT0HQ9HoIIPaNklt3emF8gsKDiS+L/cyv6cZ8p+zC6Igp6mJ2d7c6j5oQKSsvlu4+xwMFa6y+qDeK0otmfaX0hhRQQB6yNZxH4DzoSBXQYnpD1a7vHd2Mmm7XIhD52Tz/DXcJy70ITlO6jWBRTJ/ziW3UK1HjlKy1YeVmF/OStCphXau+11l2uVLtyfV7ZOBf28NpkGrtN9TNLMl4aHxBusZpzVAnyAUT6+jKjMKUl+PAiNhJTDuzijyielskDZkn9z9pOb5cZnYaAnPh+MlHJmOj11ITu0ZjSOqDc0DVsyREGaav4WG2pgFkLJ0Fr9O5pc/ujU88B6VxkSt3H2h9yEThAwKXgNJgsXnAvmEfpSNLseoPMyMUd87Ibflx/SwNhq6kOD0Bk9Sp13mhCJ8FhNEbXh7+lbD8akkC7DtPSvBr2UVWRGGr6OmH3kWXHsTHfD4rScq1+c4AmWo+VFPUIxM0CTMTX5UUPmb1EplVWBHpa8pwVM9hdRraGWMzEvRJIC/Fn4KpQE3Qjx8yKJl8QS3sb34n2FK0S+0m1/Whzq8bs3ZBEl5Fu2W4rjpmwzQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(6133799003)(22082099003)(10067099003)(18002099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jbax6wHf6TfgNLMNeIQGx7xD8VTaqYTIrOiqXN2aAjyodgiiC6GDi1bq5dapNY++8rQFhtiFCxP8I9my/YC3P5xwE6WGMhZVfwiJ0jOUUB6YryV+qndfbxLxfKU5bQLdiICPldkYENVD+bjh9Gq9z3EwoBas/f3gHrkWopgHhbXSXohluOm9r7gboD2XwBVm0T00ppQsuDGpWUq9KCrxoSqTpYeRLiGSt0u5uuSZjoM35n9g+Jrn4leq+T1aHbzm1EwEHGrtM4l+d8NE0Ak0eoJJQUtVuo1SEPNIe672Qm4sUHyuKjKr1iOriuBIzvwA+zHYc3wVGmsmgEIbGLuD9YSqq9uwBtpaMkl4IgIxNZzdanFdZG6msS9qToSOcpGGbui0mCSx9chQR5DN5zpc56vTwdPSMfbTNp3psbnQG1P+CrXnVf6XtIBlrEcwoP4y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 11:15:12.6765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e44ce4-5de3-417a-b870-08df29e46a99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7697

From: Suma Hegde <Suma.Hegde@amd.com>

The ACPI and platform HSMP drivers had duplicated implementations for
telemetry sysfs show handlers (DDR BW, firmware version, FCLK/MCLK,
freq limits, etc.).

Move these shared handlers into a new common file, sysfs.c, and expose
their declarations via sysfs.h. Keep socket selection behavior the same
for both paths by using hsmp_sysfs_sock_ind():
- ACPI: derive socket index from dev_get_drvdata() when sock_ind is U16_MAX
- Platform: use per-attribute sock_ind directly

Update the HSMP Makefile to build sysfs.o into both hsmp_acpi and
amd_hsmp modules.

No functional change intended.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/Makefile |   4 +-
 drivers/platform/x86/amd/hsmp/acpi.c   | 181 ---------------------
 drivers/platform/x86/amd/hsmp/plat.c   | 170 --------------------
 drivers/platform/x86/amd/hsmp/sysfs.c  | 211 +++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h  |  34 ++--
 5 files changed, 236 insertions(+), 364 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.c

diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
index ce8342e71f50d..85158cccc7858 100644
--- a/drivers/platform/x86/amd/hsmp/Makefile
+++ b/drivers/platform/x86/amd/hsmp/Makefile
@@ -8,6 +8,6 @@ obj-$(CONFIG_AMD_HSMP)			+= hsmp_common.o
 hsmp_common-y				:= hsmp.o
 hsmp_common-$(CONFIG_HWMON)		+= hwmon.o
 obj-$(CONFIG_AMD_HSMP_PLAT)		+= amd_hsmp.o
-amd_hsmp-y				:= plat.o
+amd_hsmp-y				:= plat.o sysfs.o
 obj-$(CONFIG_AMD_HSMP_ACPI)		+= hsmp_acpi.o
-hsmp_acpi-y				:= acpi.o
+hsmp_acpi-y				:= acpi.o sysfs.o
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index ce7fb62a49c65..f8afc50461a65 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -13,8 +13,6 @@
 
 #include <linux/acpi.h>
 #include <linux/array_size.h>
-#include <linux/bits.h>
-#include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/container_of.h>
 #include <linux/device.h>
@@ -378,185 +376,6 @@ static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 	return 0;
 }
 
-static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
-				    char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%u\n", data);
-}
-
-static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
-				    char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_MAX_BW_MASK, data));
-}
-
-static ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
-				     char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_MASK, data));
-}
-
-static ssize_t hsmp_ddr_util_bw_perc_show(struct device *dev, struct device_attribute *attr,
-					  char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_PERC_MASK, data));
-}
-
-static ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_attribute *attr,
-				    char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu.%lu.%lu\n",
-			  FIELD_GET(FW_VER_MAJOR_MASK, data),
-			  FIELD_GET(FW_VER_MINOR_MASK, data),
-			  FIELD_GET(FW_VER_DEBUG_MASK, data));
-}
-
-static ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
-			char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data[2];
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%u\n", data[0]);
-}
-
-static ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
-			char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data[2];
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%u\n", data[1]);
-}
-
-static ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
-				  char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMAX_MASK, data));
-}
-
-static ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
-				  char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMIN_MASK, data));
-}
-
-static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
-				    char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
-}
-
-static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
-					   char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-	unsigned int index;
-	int len = 0;
-	u16 src_ind;
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	src_ind = FIELD_GET(FREQ_SRC_IND_MASK, data);
-	for (index = 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {
-		if (!src_ind)
-			break;
-		if (src_ind & 1)
-			len += sysfs_emit_at(buf, len, "%s\n", freqlimit_srcnames[index]);
-		src_ind >>= 1;
-	}
-	return len;
-}
-
 /*
  * Bring up one ACPI HSMP socket: parse its ACPI table, run the mailbox
  * handshake and register its sysfs/hwmon interfaces.
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index a8e4d7a15e2a1..83f6b86896117 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -12,8 +12,6 @@
 #include <asm/amd/hsmp.h>
 
 #include <linux/acpi.h>
-#include <linux/array_size.h>
-#include <linux/bitfield.h>
 #include <linux/build_bug.h>
 #include <linux/cleanup.h>
 #include <linux/container_of.h>
@@ -136,174 +134,6 @@ static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 	return 0;
 }
 
-static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
-				    char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%u\n", data);
-}
-
-static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
-				    char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_MAX_BW_MASK, data));
-}
-
-static ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
-				     char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_MASK, data));
-}
-
-static ssize_t hsmp_ddr_util_bw_perc_show(struct device *dev, struct device_attribute *attr,
-					  char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_PERC_MASK, data));
-}
-
-static ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_attribute *attr,
-				    char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu.%lu.%lu\n",
-			  FIELD_GET(FW_VER_MAJOR_MASK, data),
-			  FIELD_GET(FW_VER_MINOR_MASK, data),
-			  FIELD_GET(FW_VER_DEBUG_MASK, data));
-}
-
-static ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
-			      char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	u32 data[2];
-	int ret;
-
-	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, data, 2);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%u\n", data[0]);
-}
-
-static ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
-			      char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	u32 data[2];
-	int ret;
-
-	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, data, 2);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%u\n", data[1]);
-}
-
-static ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
-				  char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMAX_MASK, data));
-}
-
-static ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
-				  char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMIN_MASK, data));
-}
-
-static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
-				    char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
-}
-
-static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
-					   char *buf)
-{
-	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
-	unsigned int index;
-	int len = 0;
-	u16 src_ind;
-	u32 data;
-	int ret;
-
-	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
-	if (ret)
-		return ret;
-
-	src_ind = FIELD_GET(FREQ_SRC_IND_MASK, data);
-	for (index = 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {
-		if (!src_ind)
-			break;
-		if (src_ind & 1)
-			len += sysfs_emit_at(buf, len, "%s\n", freqlimit_srcnames[index]);
-		src_ind >>= 1;
-	}
-	return len;
-}
-
 /*
  * AMD supports maximum of 8 sockets in a system.
  * Static array of 8 + 1(for NULL) elements is created below
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
new file mode 100644
index 0000000000000..8d802b51b728b
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD HSMP Platform Driver
+ * Copyright (c) 2026, AMD.
+ * All Rights Reserved.
+ *
+ * Common sysfs helpers shared by ACPI and platform HSMP drivers.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/limits.h>
+#include <linux/sysfs.h>
+
+#include "hsmp.h"
+#include "sysfs.h"
+
+static const char * const freqlimit_srcnames[] = {
+	"cHTC-Active",
+	"PROCHOT",
+	"TDC limit",
+	"PPT Limit",
+	"OPN Max",
+	"Reliability Limit",
+	"APML Agent",
+	"HSMP Agent",
+};
+
+static u16 hsmp_sysfs_sock_ind(struct device *dev, const struct hsmp_sys_attr *hattr)
+{
+	struct hsmp_socket *sock;
+
+	if (hattr->sock_ind != U16_MAX)
+		return hattr->sock_ind;
+
+	sock = dev_get_drvdata(dev);
+	if (!sock)
+		return U16_MAX;
+
+	return sock->sock_ind;
+}
+
+ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hsmp_sysfs_sock_ind(dev, hattr), hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", data);
+}
+
+ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hsmp_sysfs_sock_ind(dev, hattr), hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_MAX_BW_MASK, data));
+}
+
+ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hsmp_sysfs_sock_ind(dev, hattr), hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_MASK, data));
+}
+
+ssize_t hsmp_ddr_util_bw_perc_show(struct device *dev, struct device_attribute *attr,
+				   char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hsmp_sysfs_sock_ind(dev, hattr), hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_PERC_MASK, data));
+}
+
+ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hsmp_sysfs_sock_ind(dev, hattr), hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu.%lu.%lu\n",
+			  FIELD_GET(FW_VER_MAJOR_MASK, data),
+			  FIELD_GET(FW_VER_MINOR_MASK, data),
+			  FIELD_GET(FW_VER_DEBUG_MASK, data));
+}
+
+ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
+		       char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data[2];
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hsmp_sysfs_sock_ind(dev, hattr), hattr->msg_id, data, 2);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", data[0]);
+}
+
+ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
+		       char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data[2];
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hsmp_sysfs_sock_ind(dev, hattr), hattr->msg_id, data, 2);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", data[1]);
+}
+
+ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hsmp_sysfs_sock_ind(dev, hattr), hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMAX_MASK, data));
+}
+
+ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hsmp_sysfs_sock_ind(dev, hattr), hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMIN_MASK, data));
+}
+
+ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hsmp_sysfs_sock_ind(dev, hattr), hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
+}
+
+ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	unsigned int index;
+	int len = 0;
+	u16 src_ind;
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(hsmp_sysfs_sock_ind(dev, hattr), hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	src_ind = FIELD_GET(FREQ_SRC_IND_MASK, data);
+	for (index = 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {
+		if (!src_ind)
+			break;
+		if (src_ind & 1)
+			len += sysfs_emit_at(buf, len, "%s\n", freqlimit_srcnames[index]);
+		src_ind >>= 1;
+	}
+
+	return len;
+}
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index 771ce5e2b43f5..297d6151001c8 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -21,17 +21,6 @@ struct hsmp_sys_attr {
 	u32 msg_id;
 };
 
-static const char * const freqlimit_srcnames[] = {
-	"cHTC-Active",
-	"PROCHOT",
-	"TDC limit",
-	"PPT Limit",
-	"OPN Max",
-	"Reliability Limit",
-	"APML Agent",
-	"HSMP Agent",
-};
-
 #define DDR_MAX_BW_MASK		GENMASK(31, 20)
 #define DDR_UTIL_BW_MASK	GENMASK(19, 8)
 #define DDR_UTIL_BW_PERC_MASK	GENMASK(7, 0)
@@ -46,4 +35,27 @@ static const char * const freqlimit_srcnames[] = {
 #define to_hsmp_sys_attr(_dev_attr) \
 	container_of(_dev_attr, struct hsmp_sys_attr, dattr)
 
+ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
+			     char *buf);
+ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
+			     char *buf);
+ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
+			      char *buf);
+ssize_t hsmp_ddr_util_bw_perc_show(struct device *dev, struct device_attribute *attr,
+				   char *buf);
+ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_attribute *attr,
+			     char *buf);
+ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
+		       char *buf);
+ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
+		       char *buf);
+ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
+			   char *buf);
+ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
+			   char *buf);
+ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
+			     char *buf);
+ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
+				    char *buf);
+
 #endif /* HSMP_SYSFS_H */
-- 
2.34.1

