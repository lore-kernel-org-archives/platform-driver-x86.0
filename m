Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012011.outbound.protection.outlook.com [40.93.195.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DE83AFCE4;
	Thu, 28 May 2026 09:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961233; cv=fail; b=kxdnX/uZiD3nFAkAnWwc3ORN7RJNkr1v1WZI43aZ/QmYBbC7Hp+qkrBPFN02cqpmbEAifuYP2wh0AZaTXp75Sgpf3+LgkStfL2TvKWuqXsEYDJTJxN59TpE2jILRjQ/Q3jCB6XSVMNKe2Gxnlp5lwNs0PNoJ0WME3P0MCQMhgzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961233; c=relaxed/simple;
	bh=r3YAuXP1aKDHdedEAIQ+a98JdvlsaEoBxt5U5KN3VUk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qxJuMvc3NB16h+JbZTZYSMbaX6VaaaXFArq4p0t5Ok4DWz1D0PACkQcIxkiP3dhwoCmOXUeSf/48eK22rw9CAYVYr5GYQQIXXDSKQcakDBUd8Q72G7iSwftMjSPwurUjqOE63QdKrib0AQZfkjQYWNSIatcHBhmNQVzQIO3gCXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YjYlZsZ0; arc=fail smtp.client-ip=40.93.195.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YjYlZsZ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxPfa76gqpLdHfs7M458phzPShri1wUbyqDCy4gY+QqqJnpg2t0hFGy0YA0WvD8qSaDyEyXj7TPU1cC/KXAMa1FP02ZLtMqBBkm/nCnf9HIJxX2oWuf8hndhlnDZBJu/6NjzODbaKFFiwz0y0DA4nHA4OhLUoeWzdrIpagDO/coG/CCJq5CQWzJ4szu6Hm4Np9CH/8UVat8oEFwU47LS7zvnU46O4zA1HJoFyNO42eCsNtEIiFnzgfCDfpdJsnESRfKJ8Rp4M0QLjyDT6b+1zR00R011qMH3hUmL/FOLW1TAi11WQlrwTfnX6oCHKBWn2h+Pfyr3hEKxgJHZ5eTM8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHXeXFWn+60PXIyf0oFx+yEmGUdUD7N+PeBrTvHoujw=;
 b=kCrfBUsAVXvOWTICSUsjR68VoU2cLxcQFjxpybJAvn2a6Q0efjhCXxaCqOKErUn28Xn+j59ljGwdRk5Dkn28TJV9OSWRBLlbA05bFYqsWWMlaAQ46W74RoEeC+1XsgikJNSeMMTraEOw9u29MO0sWYYHJ/QvHSX8tSCJu1RJXsDlg0v9v5JXA/DV7Uq1XAhy5+FeOFSUOWydRyF9GoLPvKG8Bzowj6GKiOfwKp2FmdGxE08hlruJhgOidDnxQ2vuLT5XvFiZ6vqo5YK3n1We5nB/fXTMKDP0jRFD5fBHwiFqcGfqwsZWAmUz+WegytTE/EKWJpRcxYSmJFomErPztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHXeXFWn+60PXIyf0oFx+yEmGUdUD7N+PeBrTvHoujw=;
 b=YjYlZsZ0j/4rEOb+LNzd6xehqkdFN/THWmdMl3t5fYSFUqHCxd61kdBYJsqgPtBbbZ4seCUJF+moC2c3RVv9arfhWn43aGsGZbMoapqrAWml4I7bU3f2QJsqsA9sNOkLYCkCXQKQFKguOsvIWxTClgUn6N/Jgr11kSUR9XMDHKQ=
Received: from CY5PR22CA0084.namprd22.prod.outlook.com (2603:10b6:930:80::28)
 by IA0PR12MB8907.namprd12.prod.outlook.com (2603:10b6:208:492::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 09:40:27 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:930:80:cafe::2c) by CY5PR22CA0084.outlook.office365.com
 (2603:10b6:930:80::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 09:40:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 09:40:27 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 04:40:25 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v4 6/7] platform/x86/amd/hsmp: Enable HSMP_PROTO_VER7 metric tables on the ACPI driver via the IOCTL
Date: Thu, 28 May 2026 15:09:53 +0530
Message-ID: <20260528093954.2461272-7-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528093954.2461272-1-muralidhara.mk@amd.com>
References: <20260528093954.2461272-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|IA0PR12MB8907:EE_
X-MS-Office365-Filtering-Correlation-Id: fc21b4e6-0fe9-4d94-cfcc-08debc9d268d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099006|18002099003|22082099003|11063799006|5023799004|3023799007;
X-Microsoft-Antispam-Message-Info:
	Lo+VVLfPV4DBHdmvJRRLI5vc14AI6YyWkTSOmxItShOIBF56QZis8wnSmjraSvkK7gbywKJQQyhHXHLWwKTYKq9Gvv3mP3Vhsy96fwKvgYjWCbMrMICWrmOjKy8SGSluCpBUjqyUdGmYA37epEi7TUgAbT3lsjjVrRrzYyy7XXxqVY9jruYrrYM3ie1Rn9QKVYChQ3QY1Rc95JrKFwhn/Cdm+O6Ax2OCPJ5Gk1Qch7gV7AxpJJ01lMqoJO/uKs64kfrgFE4hwJSprMm80o7JplJqH1egEEtupDT38+YbkAEEcVhgQ+Bd3crnPBGTBzetMFKC006+kQxKyJs1YnWrAhVrsYTTqK6YkyCiP14kRIlOVwjzOPevAArHCBLGVJHJfLKfugESwQoS3zv2Hn8fbT3etTlwFMVGeHUTVHt/wi3koEgVSW0Z7XkrqU1zgJS2TmlXkAd7fBYDJawPa3quzsSW0yWMvJ2+GYzi80jSpz7T6Qlga4KDWKX9SAz93RIT0AJI6QtG1BTAt2ZO0NqbsXnwZ37hHeUuKjRRCzfNxhTY4923uU8EOwq8Q0+yP6aqGn6p/3bCjVwtLOnf36/2NsFekrQfmSgrrHR665S25kFeoHURtHXLMoAvPuHC24/QnSWM5n0Ic8mrgw4ClA8CWR/2yLQjalaz5yPhLr1SqyKXUzoPbTB0qrSIwu9rAE9wgTrULTVYjSb1lnSVgIs5/DPi0Rqj3Bjpso6P2BoDZFg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099006)(18002099003)(22082099003)(11063799006)(5023799004)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LIgWRM0F8OQWAjNwirw9amY+o/G4ZFTxfg0h1+SNsfnm6/cXKig38VZUkASsvMNFpNvqIVihiJ+Cjdqu7UvflY4o9V0/+a3ZOeYTso5G9YFHFnAwokZa3e27vE7T/DRWt0pqbqv/N+KBQoxYRvWapMPCCykGOkQ31uwD4ZOTGgp7M4Rw2XTTkiB+Bq6MCGzyh5sWWFL9Rh/ehUeo/68ECt1zEJqvuYzJAINUXQxeojE9J+lK7LgRK9kTgz09krLP8g2myPqXfL+GZwNC2haV9XYDvFg4W3pCs/UfMKQUz+cF3RvvjiDNEytZ231Y4kHrRR2v40J4iBCX8RdO/MUsSRJyc24hRjpIyjsBoXXIRas56XCaQwdJN+OIz9W25viIOeLAarn984tg6VoKL6ZaiiVAtrzbnATq04Zmg/9DFTEHbaP4h0UWuCRlF4WtyB/q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 09:40:27.5574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc21b4e6-0fe9-4d94-cfcc-08debc9d268d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8907

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

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
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

