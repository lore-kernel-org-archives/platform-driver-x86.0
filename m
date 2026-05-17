Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010032.outbound.protection.outlook.com [52.101.201.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12E635A3AF;
	Sun, 17 May 2026 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030778; cv=fail; b=lZwzx9Eu/wgUU4FDAX2q9BMykIA2vTHeMztw6g5FOdVlEZl0+9dDph7UUW+whOzGxQtmUukR08xPkne/BhENeMk8C8yVCvHmbktTfCnSRYI/NMRKor2wZjomi7Nt6Erw2XWU8NgRZGfwMFt+xAUOwnPXe354zt6nE3Lzf+lnsTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030778; c=relaxed/simple;
	bh=76l4/edzCTA9l3wG8k9IJ78ROb6tj5gFGgbV5oV+xUs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nvYiw6EWpVnp8QZj1Egd99w1Rm6lVRkcOCnC2gZNA7QaTUR1GMY0UXpb29CY3+27nhU/+aZd5b7p4AzpWEmK4jnkrFGgwqI0mm+plmpmImuzQGNwYfxR0VF/FJrd6hTZwilSeCzGOAG6Z/Gii+yxgC6bWCaaeiD1FJFaWsaOCbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0hfaFTr0; arc=fail smtp.client-ip=52.101.201.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0hfaFTr0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OE5AWeSmttnybO7ycilkezRQkATgWVqPrlaw3f2i8Y7SKOn+Rj0g+2ebWZx0zCoHs48aWPTXo9sJQ/rDX5wm6vcegVxxq909QHH0v3Bv/y3hHiTkdM6kbmECiPhrcLvksPktSmoX7Sqrifsn3x/MWtKaomZOfYjZ1NKAZJMet9dCl7s+KtBsjwzlwFrBgtNWV6tn+eBR3DG1fV5rLjE3ECoRFbn6DP3D0FC+rIRrPF+4Af/a8S9jChc+BNIzvHftgLzEbEGyhaxV0wdzKeSBsBKxcTS5bPdjXcjHNW0RK7h6mN/NNJ+B36LlSc57NXenuHQ2X+Mkmy551C444aVfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ne5hhFMssWtvyyRLkgKvlmSVvxyq7lR4rn93MWfU1c=;
 b=R3Ha41vy836fkJQ6d2/AF6Hf5NG6jTq2tRG2O25L4KdEGT8pv7DxAE7YMX83x/UTFvAbFKGKqwZ7JpO5H4F9OnCpRfmGOLi6CHXKMymYWDlwVChIEqKYBolR/Dsty5+5pzejRFXmlSoYZMFvdxrcOjYhmmCfDaXZGCVLX+b18x3XRr65F9ezavWpbBX3SHz4hkqkYoo2o3etK93FEMjZox9E8W/xPpHG3pwkFk7pTHbbKRr6gLFyGcm4vDrmnWs3Dt8rOLTw4fTqGWLUFfMHjwMsDeidINtaPQUp5QE5aOoI3JgBoV2KFwwIDJzHvTL6mVc4wwJ2H2sAiIN2LHThOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ne5hhFMssWtvyyRLkgKvlmSVvxyq7lR4rn93MWfU1c=;
 b=0hfaFTr0ffoElkQmr+5zTMXQCGlsO7iRDFOp47eL4se3cjIUGC/V/irtcq6yH0ewL4PS88slPaBdHk/xEMT5iYMGi0sfe9gCSB5jv5pfL7xAYf7DKCVn2zVzc8CPFlTLyeYSUQ2JJRxIgEOlaH5igTGWxTpg+x2n/f45u+OlG3o=
Received: from SJ0PR05CA0129.namprd05.prod.outlook.com (2603:10b6:a03:33d::14)
 by DSWPR12MB999153.namprd12.prod.outlook.com (2603:10b6:8:36e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Sun, 17 May
 2026 15:12:51 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::99) by SJ0PR05CA0129.outlook.office365.com
 (2603:10b6:a03:33d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.12 via Frontend Transport; Sun, 17
 May 2026 15:12:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Sun, 17 May 2026 15:12:51 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 17 May
 2026 10:12:49 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v3 7/7] platform/x86/amd/hsmp: Make metric table read locking use guard(mutex)
Date: Sun, 17 May 2026 20:42:11 +0530
Message-ID: <20260517151211.415627-8-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|DSWPR12MB999153:EE_
X-MS-Office365-Filtering-Correlation-Id: 6093c752-8a48-4cfc-0a49-08deb426c353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	+VGbRF/dTiOmlpkGZOsjXnyL6rxUh7G22gxEgPViMr6/J2gn9cV1Wxgrk8oGdk2pH6x+fLj9iYSP8zmiAo43WZunNTJJOUCnXo+igSQwT3CkY1YUDoIH5zCjYXa52hsUHCK21RqPwsYHpgp8G0bJ587kpxG6EK6M2/Y9AUMyS94rujhgdqJoGC18T9kqZDuU9hN0Nz1uIYlrGBmoO+b6/oIQF6YNo2QQdPZ8LYTlaYeC2gB7NxHpeBFegJinXBorck0zou5U/sVCjkeDC0p4Lsxve/TnElwwURfJUEHixA5ZMRYQtUe9gCe8CMj8CSw+A2D4FLaxrIsL9DdcCvFf9HFqcEuKwfaOgsICwaMgUL9kzTT40iHGbNKL9PzzOgYnqW9BwY/MiN5i+b9g0onT48AoTW3FmP7qZj3t4T68RU78VJJl8W4Cz3Z2ywywNCr0LJU0OCt68zsqp8pPZHQdJXqcCi65BSX2BiFE+6YLmVa8pJ5ABUrZblTXEWbANb2nK7dekdEBz/FKyurMTiU+pjYzD6mPnH/DoDZTXknEpIJWhSAVurcW1N0j29FNBrwe6iGY49P7XU2qeEmn0rCB8OlCxvxyKvti03rUJKZnHDvCXE0aczLmXFN7hgqBm/qitNKtWiTSKE1unn/1qMzrC2BRHM3aWEHyOo1nJHBd2yQMRVBvFaGvn6wAIRGJbryn+G0EVbmhjAEfmARU/wkjuZ1QIsNrAzNeJ2yCR4LLY48=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FObMhEyCHPNlsdIdU8g6Y/l5a6eelLb3RUePEWtSWAvAa0Jz32GRkUChFzbx4LNutJKaShnKdO70cc2ltMNWUOQJcl3cY2fZ00FvK+b0qFmi7x50gOrIvDvchlTwVgzc7nx539DELDzuKgVzt3t1661DaYdLsDS+zb+zC9WuX3Z8Dcrv06kiKBSiyaNvPe9PhWSTYk6CDh0TgfNR831r9bU+g/Yx6Kdwvn/xiftsMtI7Og7Ntlxcrwyoho9Ej/vJdeSviOh9vtTyeHT+NQu3o0avU1N8tNwGrFBST9nhZOdVOoPGZyYe6Mj+JaQdId8o6isJKXXYeyVA3N1DCIciYh7n1pxn716acX7paBYbIw1zj7imkyxtvpc+GqfqKH+pYqWlF3BkG+8m1PHS85eg+EepUfM/grZzIjV3HMllXdLUk88kyV8dkLNwmC1y9l8v
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 15:12:51.1134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6093c752-8a48-4cfc-0a49-08deb426c353
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999153

Add a per-socket mutex (metric_tbl_lock) to serialize concurrent reads
on the metric table. Without serialization, two simultaneous
readers could interleave the SMU refresh command and the
memcpy_fromio(), producing a torn (mixed old/new) snapshot.

Use scoped guard(mutex) in hsmp_metric_tbl_read() so the lock is
automatically released on all return paths. Initialize the mutex with
devm_mutex_init() in hsmp_get_tbl_dram_base() and return an error if
initialization fails, avoiding manual mutex_destroy() cleanup paths.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
Changes:
v1->v2: Add lock
v2->v3: Replace mutex_init to devm_mutex_init call

 drivers/platform/x86/amd/hsmp/hsmp.c | 8 ++++++++
 drivers/platform/x86/amd/hsmp/hsmp.h | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 3a02d683dea0..2fec897a95be 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -447,6 +447,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 	msg.msg_id	= HSMP_GET_METRIC_TABLE;
 	msg.sock_ind	= sock->sock_ind;
 
+	guard(mutex)(&sock->metric_tbl_lock);
 	ret = hsmp_send_message(&msg);
 	if (ret)
 		return ret;
@@ -492,6 +493,13 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
 		return -ENOMEM;
 	}
+
+	ret = devm_mutex_init(sock->dev, &sock->metric_tbl_lock);
+	if (ret) {
+		dev_err(sock->dev, "Failed to initialize metric table lock\n");
+		return ret;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_get_tbl_dram_base, "AMD_HSMP");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index e7f051475728..f7b1cbf19932 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -15,6 +15,7 @@
 #include <linux/hwmon.h>
 #include <linux/kconfig.h>
 #include <linux/miscdevice.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
@@ -41,6 +42,8 @@ struct hsmp_socket {
 	struct bin_attribute hsmp_attr;
 	struct hsmp_mbaddr_info mbinfo;
 	void __iomem *metric_tbl_addr;
+	/* Serializes concurrent metric table refreshes from the sysfs path */
+	struct mutex metric_tbl_lock;
 	void __iomem *virt_base_addr;
 	struct semaphore hsmp_sem;
 	char name[HSMP_ATTR_GRP_NAME_SIZE];
-- 
2.34.1

