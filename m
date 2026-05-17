Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013023.outbound.protection.outlook.com [40.93.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7C32C21F1;
	Sun, 17 May 2026 15:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030775; cv=fail; b=EyFxTz+omseru1IV+8vx+F0lUCU9Ws+NgCpr2Wyh6uC08q1AiTRtBfoQFOlqPjUyuZsRqAzk1fZ5x2nFhx7n9rnGMDE0jLe0BhEbbD3OypXGjv3ikZ3o5PrkjjEGf9oAie97M+71SlkSK52e0KxpaSz8obYgCkQrw805Vra+/5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030775; c=relaxed/simple;
	bh=Jpz64DRQFaBOhK9NImATkH4mGu1956AqIE4R4jud8L0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Unf9wVwUCRUTXodyu+GrWiPiAYzemKLfOLmtEwWkzVZpTidVt9dpMbHTPitDJjabQguoF8J3wawuSabIRzKHmh7AklD1ltcTCVHHdedOgPqV9yrDft2XG3Lz1VK4fsS7omXR271Gx3lejarYv6oGb19ttxib9EnRsj3nz33Om/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qWlIqKhQ; arc=fail smtp.client-ip=40.93.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qWlIqKhQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLL+AGXDu3N6t7VcMWLqGqj5qNqrL1jmhM6MvmTlKK9dunrdbvf1U6BpSTeBsOSqxLprpMSkDGOFEMJkUjLQ0BgEAFSHclYf/rk6vtVQjAnSJHqpM7Zh00CjJP+S4Qxu8FxGiSexHxzrzfETw6hTIwqhUh4newkTBDouY0r73kdAhTmSwo1c2WwvlsrNRyaSTMzN5HJsSiIdQtyzaEtjt3OCBeM2O56WbwuAENu08pbsRgQJ38kLS8fisUwGML7iW7oO6Du1WRjksPXuFrq5odEpqb4dK8R+OofPZB/5Vl0HL7iAg7JWNgKAOuIgJt/lDJ+forAPrqRzkOow0tOEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/8Y0elS0JfKzLsDWv3u6jfyB32z85VoxqK9Cq8/oAQ=;
 b=lcmmysoKLcy/ZebKmOxpWMnkXMKcDs9x9Oc1ckwMK2pDnGYrjfh2Btk66DQoqdTNqOzc6dlsaMo/1FDGprh3hRo6mCDA1B5rXbwvM5BtlnT5QFMN2FLcCP/2Xq3fdZDy5dJAeiwmqovElyiX6pjp02F2aD3U4XL7tRcdkryjxUKUe014GQej0aJoqXoAmP6s1xD1LbAGjbEbaXpIjtYc0t93eydkHxTs8bv5QmUf3zhaQ9GErxFN8m2I2/LAL1o0M4tvgu6kp7xXVPFh/8hw9PcuKkm+ac9HHSouFxP7AQkv/0mbuEwYH09jxdDuya7Oh0fJ9hxCo+X36I92GbRNtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/8Y0elS0JfKzLsDWv3u6jfyB32z85VoxqK9Cq8/oAQ=;
 b=qWlIqKhQTdBRMpR6cKq1L5mXcoF+ZfEFNU5lilzC2JtK3oTPrUBhXL2HGJ0cENJccnRcmVID7A5GkZvq0i9vMrDtk+T97yjtYk10DTGntl8+ZViCFnN9SuYqnlnkf8PMFXweN+NHDALUOXURa8l2IqeqfRVW5okUmfoUzyfVc8g=
Received: from SJ0PR05CA0148.namprd05.prod.outlook.com (2603:10b6:a03:33d::33)
 by DS7PR12MB6286.namprd12.prod.outlook.com (2603:10b6:8:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Sun, 17 May
 2026 15:12:50 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::17) by SJ0PR05CA0148.outlook.office365.com
 (2603:10b6:a03:33d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11 via Frontend Transport; Sun, 17
 May 2026 15:12:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Sun, 17 May 2026 15:12:49 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 17 May
 2026 10:12:47 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v3 6/7] platform/x86/amd/hsmp: Drop ACPI sysfs metrics_bin in favour of the IOCTL
Date: Sun, 17 May 2026 20:42:10 +0530
Message-ID: <20260517151211.415627-7-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260517151211.415627-1-muralidhara.mk@amd.com>
References: <20260517151211.415627-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|DS7PR12MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b3099c-6bc5-4ffb-9f97-08deb426c27f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|56012099003|22082099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	rng89EC/ESwDqhOfPKT38uO5Xe6bNm0Q2w9wvl+CdO/HOyh01x+mWnmyixUJ2bV3WMYAD2BQ2GMakhWQQNfHxkVTqZmupgKE7YrvzNVzaDr24JVgswSydXwVbxj27w4v0sfNhjh8n++4FCVjBejNpK4ErZkWCHIhrVnfU7rJjWmXZIcbkuCdMn3gr47to/DtiaxiNenQn7oeJoGoXDHdplz3xzf4Bf49RQo0HlKlF5SN+OlLYzO2n3/ExRxNjiOvQBgGf1aHZmejvJjLRpYhYrEyqyBYs/yRmS93nr6IHsLdshlkV3L6pD3U8UMrCUgMKlcCgv5KrYBDcIPLl25inOG7oJVaGVn5cnuww+yE3aQ0eJ+Z27eUZ9L92ozeiH/X3ABeDlMKHZiQa1Y4vmEn0HNtQ1mQfAu3Ha34GwX1qScDSvOFgP5M7S0IFkxr9mH+6TA7tUkvCnoz0B0zPAadKWhMwMPtrRk3F0fYAecId65tBBm4Nw4bkOevjz5TLAnBNWFVEkxpHc6AatHPVm7iB1/KcqkdNHJNCWPraticJjEkCcCG5F+xMFUS//B1nMs1jc27lqEpwfukHGuNCUuxSttlpXUWP1pdBe11KTE94fatGVV66TTdH6LsBi2ozolcrGM7kZwwxMhP8XAkFZQC8oV3VkUAQ46+hxiCbt3r4gVn9GaDFfkj3RuAN2vphUdWYZJjG9ZCnRk7IGc9YYVUwV6k57lJRtblEjRAbXVw8M8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099003)(22082099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cD0UsEiwM8zscsjpHwLY49U94STzZofvOUoXnLS31qtzBJR7isEAALDkEoLJ8W4llkEih1Or8uZEKmqqsKzmBbycIYrwbZ5Ez7VVQVxrapqensj/X2kVWOwvd4XykRqzB3T12zyDZld5Gg+sSOnpuFusoKzup0klAGhkkZruZA+0gZeDJATIov/CIeWgYaENRhOQHbr7YOgqiWMp7VymmfMrAcrcZ+A8fSnWzKQgg/rGHQUCdUwrKGG1fxzGCf+glLjyMbnfISmaE7DnnXxEcX4oGhycvSjFblWbCKftGzvR1EtuAL0/pVf+pWDmvSAR72Eyyg8yiChH6oINQx0c67o5pQYB16vtj84oiB21KdD93KHwi/X05I0COBRLu+gq7em1K6A/P19a5ccjHR1rvRqNnn3AcueCiBzU55ZYKh1rYrEVlx2AREMnLLiM7Ti8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 15:12:49.6742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b3099c-6bc5-4ffb-9f97-08deb426c27f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6286

The HSMP_IOCTL_GET_TELEMETRY_DATA character-device ioctl introduced in
the previous patch is now the canonical interface for reading the
metric table on the ACPI driver path.  Unlike the metrics_bin sysfs
binary attribute, the ioctl is not constrained by PAGE_SIZE, so it
works for the ~13 KB hsmp_metric_table_zen6 layout used on Family 1Ah
Model 50h-5Fh as well as for the existing hsmp_metric_table layout
used on protocol version 6.

Drop the metrics_bin bin_attribute from the ACPI hsmp_attr_grp.
Widen the remaining proto_ver gate in init_acpi() from
'== HSMP_PROTO_VER6' to '>= HSMP_PROTO_VER6' so
hsmp_get_tbl_dram_base() is invoked on protocol version 7
(Family 1Ah Model 50h-5Fh) and any future protocol version that
retains a compatible per-socket metric table.  This populates
sock->metric_tbl_addr and hsmp_pdev.hsmp_table_size, which the ioctl
handler requires.

This is an ABI change for users of the ACPI driver:
/sys/bus/platform/devices/AMDI0097:*/metrics_bin no longer exists.
Userspace must read telemetry through the HSMP_IOCTL_GET_TELEMETRY_DATA
ioctl on /dev/hsmp instead, sizing its buffer using the matching UAPI
metric table struct. The non-ACPI plat.c path is intentionally left
unchanged: it covers Family 1Ah Model 0h-Fh hardware that is fixed at
protocol version 6, and its per-socket metrics_bin remains available
for existing userspace tooling on those systems.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
Changes:
v1->v3: Remove bin attributes

 drivers/platform/x86/amd/hsmp/acpi.c | 34 +---------------------------
 1 file changed, 1 insertion(+), 33 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 97ed71593bdf..49765fefe1fb 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -231,25 +231,6 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	return hsmp_read_acpi_dsd(sock);
 }
 
-static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj,
-					 const struct bin_attribute *bin_attr, char *buf,
-					 loff_t off, size_t count)
-{
-	struct device *dev = container_of(kobj, struct device, kobj);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
-
-	return hsmp_metric_tbl_read(sock, buf, count);
-}
-
-static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-					 const struct bin_attribute *battr, int id)
-{
-	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
-		return battr->attr.mode;
-
-	return 0;
-}
-
 static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 					     struct attribute *attr, int id)
 {
@@ -491,7 +472,7 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
+	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
@@ -506,17 +487,6 @@ static int init_acpi(struct device *dev)
 	return 0;
 }
 
-static const struct bin_attribute  hsmp_metric_tbl_attr = {
-	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
-	.read = hsmp_metric_tbl_acpi_read,
-	.size = sizeof(struct hsmp_metric_table),
-};
-
-static const struct bin_attribute *hsmp_attr_list[] = {
-	&hsmp_metric_tbl_attr,
-	NULL
-};
-
 #define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)	\
 static struct hsmp_sys_attr hattr_##_name = {		\
 	.dattr = __ATTR(_name, _mode, _show, NULL),	\
@@ -559,9 +529,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
 };
 
 static const struct attribute_group hsmp_attr_grp = {
-	.bin_attrs = hsmp_attr_list,
 	.attrs = hsmp_dev_attr_list,
-	.is_bin_visible = hsmp_is_sock_attr_visible,
 	.is_visible = hsmp_is_sock_dev_attr_visible,
 };
 
-- 
2.34.1

