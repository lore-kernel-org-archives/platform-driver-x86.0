Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013013.outbound.protection.outlook.com [40.107.201.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E90834E779;
	Mon, 29 Jun 2026 07:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718798; cv=fail; b=tKLfgxcP1WxzXRcaOSkcpLYMjjJOw4kP2ScX/why5ucamWgMsLsJAJuLZp2W032b0lfsgAYMAd9Ue09lS5z22F+1wFhAjTykl9oAgxYn3TZJpj1KSEt90BbKyTX9BhZm7C26hLGPrCa2SbF1ixIp5e3Eh8V7YsvWeCk9M8Zf2BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718798; c=relaxed/simple;
	bh=JhR4jfYflq0AmA0pmRuyWnC5iiybPxMCSCPbXbr1z2c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aRUo/MzReUGEcZSt1DUq3WHjOChu64kW2zxLiYebyBd3/3tLNz/oQkSNmTX6OSY+huazLY5kokuIKd6ilPPo06euE7/CN1s2FBvrJ35hJrda0ZGz7TUIlLfrNwoGulj4XtXzBVfOfhPOHlWk9L48qsPPjlfd/9R4z0flD5XRuNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TJRVUv6p; arc=fail smtp.client-ip=40.107.201.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TJRVUv6p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6vUsoV9wbCoAHzwT7RM5J7vbbHsYYbY0T7+rZcovNnvyw3dXoZWN5oIRgVTtVX5BfLQRdXeyGhRlzOKDo4fI8QvJUtjyCe1GfjrdahbmMxFCFq/YP7/ErSdsN3m26m3GBVo/ZxyopNtMJBhNAMFJXow6jPV58betMUWs3FSGDsf9acvH5KyX/hhTSgAKJKN/s3s8wA20uMycInNImuRevS0bFhvD5L3bgKw8cud8FqFAPYrmD5LTtSt8jbxmO0DK+2A/lhBFZicDSBLWHpZVg18NupG5cTFmMFlgg6ilwCaSq0FMZAbA5vUgVnTVf9n7LJsoAW17gGj29z3SziARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwP8ysTOWetQAVogGahC7dE/GTus/S2LGf/4K+RGAkM=;
 b=o+mr+64pYMSvubmMgFUqtbRCwa6Wjwn3g/rgZaskdj850ysiGBsWC7EHb34M/NuwTyh2FZ66TWG0hCNo+bMAtC6PP5CYCM9s5XSp3irKCf5sYxcAipIHeHNVLrsA5BTYCStJIxSy6Z3ILkoXN08hSZQtZDuVX8p1H4Ha3sl9JvhyrwlBoHRj8rT0CEyQq02NzAmLXGFAr7Gf9skYf9NpcYcXmgPJm9sX2MvvejwgH2yTSHmJr2EUi9Z+06OATbUp7qcrG9IDLd3ttiomAAjfKkgsym5LILuYAjEP214FKLF6GE/mQKyiQnlEat1HSQRB1SiMjnso4DV9t3FNHpSL2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwP8ysTOWetQAVogGahC7dE/GTus/S2LGf/4K+RGAkM=;
 b=TJRVUv6plKi2ZZzLl3B9j2BRvuGVLinnktps/r+pnzU21Y0Kf9iPWoaSP9vIVf0WDeXEEZzZ27CqMQ0qTC/eDMDuAeIL6Phj0PQujAy7ND+9RINEfnYsFTk5IJzg04jFXotooOH9Qb3aiIDi4Ex1Sf2UX2q8p9nccoq98yi8EmI=
Received: from BN1PR13CA0018.namprd13.prod.outlook.com (2603:10b6:408:e2::23)
 by MW6PR12MB8867.namprd12.prod.outlook.com (2603:10b6:303:249::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:39:45 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:e2:cafe::a7) by BN1PR13CA0018.outlook.office365.com
 (2603:10b6:408:e2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 07:39:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 07:39:45 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 02:39:43 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 4/4] platform/x86/amd/hsmp: Gate the data plane on a fully initialized socket
Date: Mon, 29 Jun 2026 13:09:23 +0530
Message-ID: <20260629073923.1595696-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629073923.1595696-1-muralidhara.mk@amd.com>
References: <20260629073923.1595696-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|MW6PR12MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c37dc05-51e4-4ca8-fbb2-08ded5b19700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|13003099007|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LUogMWXstoV6vo4rQkdRLSIykLpUt3so6vHsTV7N2BJLj9l/DJx1FRlQ84ieRmZGSmr1fGFWfeNrPILTaI3knapKnmtYn8vnLBG65BuYh1uFo2XAxvAh/C+RcqTWEb3M0Vji5Vl2DUCNYjgqMNyn8i615EkCi9oUP+3XBzrA84smnYqnLgUta1qd4RPlPpeG0Ib80tlmRnPhnRE08i02J4t7cEFEfnmOyGniT9sULDaVAJwfh0pRnh3IyAoFsJxQLxzfnY88TnbNZAWbZGlOTXL8cARGqH951AdIn/bFOO0hO/FQjiJKi4V89JdD9zkj1qKIhSm6ecjw0URBWsxfm/WOcYL0OUWxK/nprpuYvKosKrd+T8P6hmAykG+yIkwxoBxHmRB7Zz5PbI70S1Z8O1IvrCmWF8wt9egPtlNuJziOgTs9c3d6m6DevKUeq+ecXBkU/Gucf+H+ZQt3uZ7SZTn45vkiWbRr+YbReBeoe1/xn93xEFEDpivvC7KB7WiuY+z4MW5HY45ZXFI+RnqPQXiVdN4Q5xvBmK8U4BrPT/yF1aLcRxRGnzS2QI5h9x7UZXLVXcJ9caI866VikBNw5fMQqkt0IcxqCQcSne2811qmzeaZGciaV9nQ2jRzwiI0BdFA8Aq6RjByPswL83WSHwdA3z9qJ3PMnutBZMOPYI+s0VyNJ1/hh5rLurgJvI/IsZ76HhOoy5I1+hDR/hvXag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(13003099007)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	571t2NeF6sH86F7o5pONUd6FzAqqOGNvU8YZnBBIAmyOO6DSrSYgQzUlJwyzOJ1sBc1H80KkkDWxm+prpKJOn9SC9LKJp1l4GZajyqMGi/EQkhDrR5v9lLxXN1G1rTavrqCOBgEmnQc4BJm9EunFu57Ea+w6+HBJp3MGWWPxXJc5auQBoBOEU2PVIyxZE/2/GgGfUrzCBxpsinUEzHdYgh+Wv46Cnmsnex2bhOXj3mfztU6DTsbdqI2uSkkyI/OVQecv9w20fTc0xq6JNzPKIEjjGTMco6kdvhNBHeb6UpAhy6YDvNCxWsqo7S2cce+rOHFJ0G03BKApeh7kAbXnew1AymlMkICxANeWDTP6BQ7GmomYTqxWqgfeKr2SU0GxDsXK8q+5m65we0fvtZqd5DkQQoCsP4d343QWQXfA7BZpVNhDxFoXHK9z6NrLGaBN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:39:45.2146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c37dc05-51e4-4ca8-fbb2-08ded5b19700
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8867

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
Link: https://lore.kernel.org/platform-driver-x86/20260625123337.886435-5-muralidhara.mk@amd.com/T/#u [1]
---
 drivers/platform/x86/amd/hsmp/acpi.c | 18 ++++++++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.c | 12 ++++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index f7fbba4c6b66..5aec3bded712 100644
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
-	return hsmp_read_acpi_dsd(sock, dev);
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
index 6a26937fc2b5..0cd4f691db49 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -223,6 +223,18 @@ int hsmp_send_message(struct hsmp_message *msg)
 	sock_ind = array_index_nospec(msg->sock_ind, hsmp_pdev.num_sockets);
 	sock = &hsmp_pdev.sock[sock_ind];
 
+	/*
+	 * A slot exists for every possible socket, but it is only usable once
+	 * that socket has actually been probed.  Reject messages aimed at a
+	 * socket that was never brought up or is still in bring-up, so we never
+	 * operate on a zero-initialized semaphore or an unmapped mailbox.  A
+	 * non-NULL dev also guarantees virt_base_addr, the mailbox offsets and
+	 * the semaphore are visible.
+	 */
+	/* Pairs with smp_store_release(&sock->dev) in hsmp_parse_acpi_table(). */
+	if (!smp_load_acquire(&sock->dev))
+		return -ENODEV;
+
 	ret = down_interruptible(&sock->hsmp_sem);
 	if (ret < 0)
 		return ret;
-- 
2.43.0

