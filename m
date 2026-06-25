Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012020.outbound.protection.outlook.com [40.93.195.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216A23E1D16;
	Thu, 25 Jun 2026 12:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390862; cv=fail; b=nDJwByp7ExPywcBJVfhp5hS/aqLiA6oc1zl7GpBfr8RTUqGTZotEYy+KxaTE+CqMefkOygJZKL1/CcZEV5gvV9/soEwlgeVCsR+OI/e14ZfYLoP5DFn06hL5BPnESn/cebJ6Y45kjjWfs5u9mh1l1B9CCZSe5IulzYyP8PEba7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390862; c=relaxed/simple;
	bh=sDOxVIWmPqIaPgzJJ5cq6XLzFSyfv3DQgT4RAnbSFBE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rYERDLfFvpC458itIPK1uw2P2uurCJ3IhhFeAAeE/4qhepyPRXOw5Bxa8kmLiCHKUa8+pByVh0TDkzwRee3h2/UKkP3pGH/aL/lEw6t0X5Nt2HQ+ytyEusA0AHDgpThlY978/59/lRGHB/4A1t75cY6oVT8OfqX7v7zhDhBHzys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ibwwzpyC; arc=fail smtp.client-ip=40.93.195.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ibwwzpyC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMKMGXsCaUV6PxyRGK5JE5VtjwrqPozKWhkKYSTzXEW3AqRH8vYhgeZdcupYbb8IFkZZNnMWOBbXC1wz9tKl+wM3m/aE20DXCZ7dOlM0KcjSRo1EbJaBR10+FMHMecaV8z0Cph11CDHpR5f8gs4p9ZtXLklyWZYCJiaQETby2NQBPnY+srQUYwRVRL/YUy7Fv9xdTSK/eg+c8YphMBEJIbqlytSA2zhma+K6D6N8NEMZVV9tyykiq5RJ7wOuGIF4JZgJk8/ZMoLFyGDsUH4A6kcGWPhR8NSXodCW01HLdVAQiop/v9xR63HKxsJQ+ZcfX3EhlKHg3xTb/oKFXXVs/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tUtnBh8Yy5porkPpBAch/IKCdf7KsXk0OFzmVbbBnE=;
 b=OA+gr2jovutXBbga4Zghsm+W7ErFOk0ABa+azRMzeIvSji8uO9lVoYu0pbUbUDCtHcno7tLzKF0iEOlQaieGrg36kgE8ptVLzz3xqDlkmB1ea4+A9WULhBHZjA+cr1ZK5wyLykhbJHH4VbFLYitXSWJqj+jhKdlcUrjFHmJZf9xXFpu5f5Ra2z9Vk0+dt0uJVowVyn+bkkfJqfyWhPHP4QvkKqWs0mjvEfOY1BZlf007fJNGxSw5cbcdf77tbgT5Q/THljqk/b+JqKqjn+hSHyF+GhdU7WjlwktyQMgvh0D8bWYEkEkfKGXIddsm6wshiuWifwPgWq3mEpzaskRPqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tUtnBh8Yy5porkPpBAch/IKCdf7KsXk0OFzmVbbBnE=;
 b=ibwwzpyCWzJr+D+SczKDjuKwOIO3weyAj5pBMtnVhin/VRbIeSKJMp4H6E2q7GX3BrHtqBUdMrz7Pn/dgNhjrWlXzcZJ+8vz7XcHJX6K+abotYkRR87G3A7QoumbbTeIg2qfNXp2J35i+Ns2PUFI2DmlRYThJ5OeX6eL0MBmFTw=
Received: from CY5PR15CA0174.namprd15.prod.outlook.com (2603:10b6:930:81::12)
 by MW4PR12MB6950.namprd12.prod.outlook.com (2603:10b6:303:207::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 12:34:09 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:930:81:cafe::5e) by CY5PR15CA0174.outlook.office365.com
 (2603:10b6:930:81::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Thu,
 25 Jun 2026 12:34:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 12:34:09 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 25 Jun
 2026 07:34:06 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <muthusamy.ramalingam@amd.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 4/7] platform/x86/amd/hsmp: Gate the data plane on a fully initialized socket
Date: Thu, 25 Jun 2026 18:03:34 +0530
Message-ID: <20260625123337.886435-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625123337.886435-1-muralidhara.mk@amd.com>
References: <20260625123337.886435-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|MW4PR12MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c26e8db-3d6e-4fc4-7bcb-08ded2b60de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Mq4PrDbczMYNyZSyPTPLnfsGHD+3v/NOG1AXS17H5H6RQLhFyMWZx4nmL3ZtxmLhxyF5lmH+aIhv8113ha4QQ1i8Ci+0tg2s3P+1KGH2f75BTnJC0yO7L6dJMdO4dFfQ7II+nFLftx4uZ2/9UifxDtst8j6EWSfiXNcuvYrOZwVAD9YgfSURFktpwsrHX1VJoXXm9C92IdHLqaq3G9VfCDHutJyiXNz1KbT2+fzRWY/r5m2ILTqw5TDx+wU54BGzPS+vXVqg3XtR0QfYsgh0Di4oP9odKorxES73ENeAwym2Pa0R/2G4/grISjHlfngGYT6e85HQ15+GZDtVJbTXQm6K8F0y2+PmHWykbE2+4+4yiqaqvPMuEVhXSIlqVwGreJEneZbynVuF3ZBrXxRmaaQac5dL2RhUZxF96IyJw/Qut6YpogGoqqHqs93K/djjbz7mSZakv4//CYgny0EVycJr6WOs5cjvWUPzn9bcPnkzQWo4RvEGb4E5+ewLLhESDEFjvStUgQKjX8qbOLSBeuuTbVnJv5bjyTf5ra+c0QrwrZ2kv86gbG73nTUsjesBT3ak0ZDaMlyL22moM/TIf/vyxvPSCTIiLS4+kLTlYN/jDcESPwf4X7DfQd/i6Nf3XPlpIcSEUlmEn8qOzeMqAzsiv3gY8hdsofZ51Lqs36wU4yMAeADYVMlhiEEHzWnfUWfxLkPrOEDCpJJEp0RQ/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C439r7epmmYZhIFKQ9fqgSh3XGW9rEKQy5GJhEwyvAqpiSl2LKVXhdsCVp27WAlxE0HsPWAw/7bJ3bz0zjXerV/1ncffriJIx3S2A6x/r7z5vmD3SAk0m9QcmlytV3Lb/SGZZ7kwLh9/z7kZgWSquv9QH/HM2wLzBOvXrUK+B0zBJATMAW0z6zoUI0DJxBZNDVBR4zJDlvTyF2q7+Ya+Dw44C5uam1I+Zbl8dYdCxD7TgEUaz8AmRuYhi7GxKTPD51KNBvlv6ySzYwud6o0FAU5Lqr7Uftszei5IVw2MqOjZeV550TZLrsH4CDQtq7YBuYs6RawH2+ay0hlKi0mZbBdOhBvfNKe1buSsbEI7M3KO4paE0ijOYZQ0UUbhp3pYsLjeCYkemJSuZZBKEFwLASA8QzzYu2hrvfcgkMqhFLwc+DaCLpzaxFvMGMm2pI/C
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 12:34:09.1330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c26e8db-3d6e-4fc4-7bcb-08ded2b60de0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6950

hsmp_parse_acpi_table() published sock->dev before hsmp_read_acpi_crs()
had mapped virt_base_addr.  sock->dev is the readiness gate for the
lock-free data plane, so on a multi-socket system - where socket 0
exposes /dev/hsmp before later sockets finish probing - an ioctl aimed
at a socket still in bring-up could pass the gate and dereference a NULL
virt_base_addr.

Pass the struct device explicitly to hsmp_read_acpi_crs() and
hsmp_read_acpi_dsd() instead of reading it back from sock->dev, publish
sock->dev last with smp_store_release() once virt_base_addr, the mailbox
offsets and the semaphore are initialized, and read it with
smp_load_acquire() in hsmp_send_message() so a non-NULL dev guarantees
the rest of the socket state is visible.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 38 +++++++++++++++++++---------
 drivers/platform/x86/amd/hsmp/hsmp.c | 13 ++++++----
 2 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 24296747df47..bf5601229c6c 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -112,7 +112,7 @@ static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
 	return AE_OK;
 }
 
-static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
+static int hsmp_read_acpi_dsd(struct hsmp_socket *sock, struct device *dev)
 {
 	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *guid, *mailbox_package;
@@ -121,10 +121,10 @@ static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
 	int ret = 0;
 	int j;
 
-	status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
+	status = acpi_evaluate_object_typed(ACPI_HANDLE(dev), "_DSD", NULL,
 					    &buf, ACPI_TYPE_PACKAGE);
 	if (ACPI_FAILURE(status)) {
-		dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
+		dev_err(dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
 			acpi_format_exception(status));
 		return -ENODEV;
 	}
@@ -147,7 +147,7 @@ static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
 	guid = &dsd->package.elements[0];
 	mailbox_package = &dsd->package.elements[1];
 	if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
-		dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
+		dev_err(dev, "Invalid hsmp _DSD table data\n");
 		ret = -EINVAL;
 		goto free_buf;
 	}
@@ -197,14 +197,14 @@ static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
 	return ret;
 }
 
-static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
+static int hsmp_read_acpi_crs(struct hsmp_socket *sock, struct device *dev)
 {
 	acpi_status status;
 
-	status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
+	status = acpi_walk_resources(ACPI_HANDLE(dev), METHOD_NAME__CRS,
 				     hsmp_resource, sock);
 	if (ACPI_FAILURE(status)) {
-		dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
+		dev_err(dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
 			acpi_format_exception(status));
 		return -EINVAL;
 	}
@@ -212,10 +212,10 @@ static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
 		return -EINVAL;
 
 	/* The mapped region should be un-cached */
-	sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
+	sock->virt_base_addr = devm_ioremap_uc(dev, sock->mbinfo.base_addr,
 					       sock->mbinfo.size);
 	if (!sock->virt_base_addr) {
-		dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
+		dev_err(dev, "Failed to ioremap MP1 base address\n");
 		return -ENOMEM;
 	}
 
@@ -229,7 +229,6 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	int ret;
 
 	sock->sock_ind		= sock_ind;
-	sock->dev		= dev;
 	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
 
 	sema_init(&sock->hsmp_sem, 1);
@@ -237,12 +236,27 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	dev_set_drvdata(dev, sock);
 
 	/* Read MP1 base address from CRS method */
-	ret = hsmp_read_acpi_crs(sock);
+	ret = hsmp_read_acpi_crs(sock, dev);
 	if (ret)
 		return ret;
 
 	/* Read mailbox offsets from DSD table */
-	return hsmp_read_acpi_dsd(sock);
+	ret = hsmp_read_acpi_dsd(sock, dev);
+	if (ret)
+		return ret;
+
+	/*
+	 * Publish sock->dev last.  hsmp_send_message() uses it (via
+	 * smp_load_acquire()) as the readiness gate for the lock-free data
+	 * plane, so it must become visible only after virt_base_addr, the
+	 * mailbox offsets and the semaphore are fully initialized.  On a
+	 * multi-socket system socket 0 exposes /dev/hsmp before later sockets
+	 * finish probing, so without this an ioctl aimed at a socket still in
+	 * bring-up could pass the gate and dereference a NULL virt_base_addr.
+	 */
+	smp_store_release(&sock->dev, dev);
+
+	return 0;
 }
 
 static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj,
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index a96c59fcba0a..c3939908d95f 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -228,12 +228,15 @@ int hsmp_send_message(struct hsmp_message *msg)
 	sock = &hsmp_pdev.sock[sock_ind];
 
 	/*
-	 * A slot exists for every possible socket, but its state (including
-	 * hsmp_sem) is only initialized once that socket has actually been
-	 * probed.  Reject messages aimed at a socket that was never brought
-	 * up so we never operate on a zero-initialized semaphore.
+	 * A slot exists for every possible socket, but it is only usable
+	 * between a successful probe and the matching remove.  Reject messages
+	 * aimed at a socket that was never brought up, is still in bring-up, or
+	 * has already been removed, so we never operate on a zero-initialized
+	 * semaphore or an unmapped mailbox.  A non-NULL dev also guarantees
+	 * virt_base_addr, the mailbox offsets and the semaphore are visible.
 	 */
-	if (!sock->dev)
+	/* Pairs with smp_store_release(&sock->dev) in hsmp_parse_acpi_table(). */
+	if (!smp_load_acquire(&sock->dev))
 		return -ENODEV;
 
 	ret = down_interruptible(&sock->hsmp_sem);
-- 
2.43.0

