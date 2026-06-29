Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013005.outbound.protection.outlook.com [40.107.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561D543CECD;
	Mon, 29 Jun 2026 15:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748625; cv=fail; b=j4iV1LaYWclqzzlCIUK9XvN+uluc95P5KGILTtaeWDlJlPTSuxYJnauzqF+X657QjLbP0nTu5l6l9QVgV8jP8gVHGGKSeVwY3xefhcdSfRYHTNUCW3syx5SklKG/CGk//1ofINDpF6uFyY/3LLqC+RMr6Izc8G2HnY8OiN1y9QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748625; c=relaxed/simple;
	bh=Vw1BuOdWmt/Yad4zozI6VSsE1pOLhK5GKB4s1FXW4FM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dDVYzaQfgTXNlUQncf6doWoENp4BS+7bxUsVjjhg7PILN5TjV8I3R6+SWw0V76MwQGkV9SaKuE7wYIgK/MIUkvVRXBt+0QB/pbaVAy1hCOsImOZ1K02FTX/yLsvpWfHoYdDtnWbQRcOwtBiTY1z5Z2mE9duO+B0MWlYIemkFfX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=evFH0nlM; arc=fail smtp.client-ip=40.107.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="evFH0nlM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmfJJnO/g8Os91J+OS+ZVBj0rS8rTvaUoEIKK76GuDEMz31bumSekZ5L0WZbvuMXDgXgCKilfuGWED4TL1F2dREbdLy1mbgm9yrQLh1ziKOxMMVVxHvWsrNQGITbNVoXOPmJFqJqOzi8TRunU4FCtppWfFT33Qmxca3fkzgl+X7wa3r4hClXdIUWac7gHXB88/7Cm3sM4o76oBSrt1j23Q/tTPT0wj3jfb57+CyCDtiqNwDsUiwV4EE21vQGFmzMkeA0fBLRQE8gDvSEsl53+MCCUsCkTBJy/nTDlOFPLRi0o0DmlbKtiEfRbTEC2vM5TIvBn0WI3lxRp6veqWWDqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9JhQCRkuqKxjRbdvn5IIHqFZCiLBmyit9VILcxdnp0=;
 b=hXcBndBa6tGEwSdAM5O80wjAycnAdlisr19yj4K7f5hgIs1hUr2cM3K42e7X2sNiimQ/Fj7ysHH+7CqOyTb48pYtFeU8hpfN9KusqWCJYAcvLQ+4cL7Sblet07rKcKzDX735TfpcDm8TcEboTS+JtF34+RQI0cUEGr762MBW/Io8a02fq0QBwKeoNOf6tOfXH7zsSWjmD/et9irRZGvEfBwNPnVc5EK1J0aFpxuXF+lYnCCIdVCTIea8H91B6qxnappSNFecSZGK/YXcvBtzXs57jM8lce45LnzFlnQGoD/i4iPu54TH/aMltTgsvnFQILa7sEbolOt0US8BbO8TBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9JhQCRkuqKxjRbdvn5IIHqFZCiLBmyit9VILcxdnp0=;
 b=evFH0nlMrEL2u7KwJSzmBD3dqSyQyzpCsaVuP7Hoz5wD+IBPw2Zljb5lN+80oRhW9hzjfFI4fgQgnvdOb/AEZ8litK6m6/UL/Whev66eDXb3/gpBa1BzC+MbWswlu5/gt2FiShqOF5kLheuhwqRzZjRBFAE7B+m3jf8u+n2ySeQ=
Received: from BN9P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::6)
 by DS7PR12MB6214.namprd12.prod.outlook.com (2603:10b6:8:96::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:56:59 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:13e:cafe::39) by BN9P220CA0001.outlook.office365.com
 (2603:10b6:408:13e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 15:56:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.0 via Frontend Transport; Mon, 29 Jun 2026 15:56:58 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 10:56:57 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 4/4] platform/x86/amd/hsmp: Gate the data plane on a fully initialized socket
Date: Mon, 29 Jun 2026 21:26:34 +0530
Message-ID: <20260629155634.1807598-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629155634.1807598-1-muralidhara.mk@amd.com>
References: <20260629155634.1807598-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|DS7PR12MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 21290653-b811-447f-2aff-08ded5f70d4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	MfJcn1C493LCk8RZEcwh2ZbfFx9X7/r2lXU0p5iK7UZk7c3ilG533r7wcyjX0agEAHxZoUE5a7cPSatPqm6m84nhXt7HWRqlo3IH5vd0ttbe0nZHzw3aCvUuESbwXbhnd9+7vyTYaGfkPpnZBPdHKAtHG/7JZhipxBgFVijvHyIZZa4U/G9vmphJGqpYsJ8v6ISHqaIE3rOihXWCbZZ3r7SgFaXPOcAcyXXabJLBGfD/YDAB9RCtUhv48/EjEGl7p68llgSvbeS62y8WjOHKoZ5oa1kApLZqksySjeyzCHOwvo6igB85cwMYraFWF1GSxe9qbr3Fy0quYJBv+HhSZq1talv+AB6Xv8Uykak6OhlBoZtuAqYzpEjpoBB3hjZR7i0oTcSR/wDoY1Nw/88YQo01pjHAbxPYrCcO8aK3tNr8Kq8N9ifjRKqJzsm4WDju1yMsc7e+CsOSvOGut+CpWYEtCxNIdA7hILq6b6alaN8+zqWTONNuIK1bMr4ttIp+2u68NYJYO4nW4Hwhid09wb0bUcOhFjp1r+J8j9v93idXmd/avbXeYWB0k7gM6d+Q3hg6MsuRYsU6wMR/mBNgMc7TRtC7J7w0vyD4rPrYIr3aEHY2hRvklSrxWKPshUwSPdIRnXkVMeBR3GBnS+g4eZY5JBS7E/Bh9KEn+qDnOmzERjp0xMEzz2w456R4BxiJSKZJsxTZbM787IsX97poAg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V83KHZGOaWOcNvUiPRsu0RMfLyNg7jQu9I1AgpYe0SW2SkL6RyzgSphjaIdOEJvcJpAQ+FGr8YkZ75E+6mlJNMcj+yrTcWPFp+8q/llA0RDdDSkl/GpKEManeeBIANMwNgrIU8UuDslP6ZrWLrYOV9V/cGm477KQi97JmVT4bmjTQEaGiZPM/QLEfwH5R72dhRch5XX1WqPfP2m8EI441FxvbarVOrHjwTchrCMwv5bs34R3Iof2vTP2xhMgc7UWKx2FtQiUkAfd+pxriAen2PgFNRk5PmSNJTkG2oo7Ws23svAjkaal6doHLzbBcqWBFPgto6F6rg6sZZ8fhHGvbMSVJ8EcNcKkK8hnngxqPGGh795Lua7VWwQmAxEhzSojsL8tpQ60IDuyW2rXxHWnrBgududDzTFDf9Q5IWS/DhPxykH6y+qBpslb2e40+tTp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:56:58.9655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21290653-b811-447f-2aff-08ded5f70d4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6214

hsmp_parse_acpi_table() published sock->dev before hsmp_read_acpi_crs()
had mapped virt_base_addr.  sock->dev is the readiness gate for the
lock-free data plane, so on a multi-socket system - where socket 0
exposes /dev/hsmp before later sockets finish probing - an ioctl aimed
at a socket still in bring-up could pass the gate and dereference a NULL
virt_base_addr.

Publish sock->dev last with smp_store_release() once virt_base_addr, the
mailbox offsets and the semaphore are initialized, and read it with
smp_load_acquire() in hsmp_send_message() so a non-NULL dev guarantees
the rest of the socket state is visible.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 18 ++++++++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.c | 13 +++++++++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 1fb09251d826..72f68cef1297 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -224,7 +224,6 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	int ret;
 
 	sock->sock_ind		= sock_ind;
-	sock->dev		= dev;
 	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
 
 	sema_init(&sock->hsmp_sem, 1);
@@ -237,7 +236,22 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 		return ret;
 
 	/* Read mailbox offsets from DSD table */
-	return hsmp_read_acpi_dsd(dev, sock);
+	ret = hsmp_read_acpi_dsd(dev, sock);
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
index 6a26937fc2b5..1a87931136fd 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -223,6 +223,19 @@ int hsmp_send_message(struct hsmp_message *msg)
 	sock_ind = array_index_nospec(msg->sock_ind, hsmp_pdev.num_sockets);
 	sock = &hsmp_pdev.sock[sock_ind];
 
+	/*
+	 * A slot exists for every possible socket, but it is only usable once
+	 * that socket has actually been probed.  Reject messages aimed at a
+	 * socket that was never brought up or is still in bring-up, so we never
+	 * operate on a zero-initialized semaphore or an unmapped mailbox.  A
+	 * non-NULL dev also guarantees virt_base_addr, the mailbox offsets and
+	 * the semaphore are visible.
+	 *
+	 * Pairs with smp_store_release(&sock->dev) in hsmp_parse_acpi_table().
+	 */
+	if (!smp_load_acquire(&sock->dev))
+		return -ENODEV;
+
 	ret = down_interruptible(&sock->hsmp_sem);
 	if (ret < 0)
 		return ret;
-- 
2.43.0

