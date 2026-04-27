Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013047.outbound.protection.outlook.com [40.107.201.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA1E34EEFD;
	Mon, 27 Apr 2026 15:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305134; cv=fail; b=n1wzTHobsZpZbXkwNyH1qk8GDFM/4YSo1Rm/9uW5HTCV1oNcRgiKdEoIHLfDTONpZlgXm2wNBPi0VheVpNGEB/YqxDSNWJX0d2CqVWEfBU4RRNXnvCQK/XXhANiaGab80mqQnxFuVLvjKhaCO5U670+byzQklZMWOEBZKgO4PMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305134; c=relaxed/simple;
	bh=I5OXAqeBGujiEgntQ5csSUhV4jQB5m4ShiHUsBXCvgw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mxE+HUmRqRFxs5Dnm8wDlcGaei1j6HUaYZ30NAuhJMJMqri1zd/AznUQE9KQLgwBCFkhl5jLuGSPcZvXmkMOayMK2CMAzrhM9lo04C5H4EAFXh6b/cSJRHXKmU6M3Db3UNmgj6ECLB8TpIo5bS+FGVrGE0qJjNfJpSl749XLOJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sx60Afi/; arc=fail smtp.client-ip=40.107.201.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sx60Afi/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQwlz19kPXREHvmy8kUhuExGUjDSmv+/6p9nGZ4c3rY4/o4RXHA9XNXwXmU/XaK2p2CWtFi+qxvZANKfbFJw9vXr/b4lcya1coXF3qPxwTgDOU/Mw00PNpcw57NNFUJjte02bailjCOyuKXGieaKyyOgpwqAMfMWnMHiZ3LUSrd+B0WNOE98tTno50a/RonsCXmv8rSsrvrSXqNPeNMI5vRNwS+uSQrpj2iEnZyucSkQZPyMt1n7QMXUbOF9YkVZDK7Ja3lrb8YSgy2/Axqq6GYiDXfd6nrdr5VA2bwJfo1RuzYn/zc9oJ6gxbaMgM6NxAbHefC3n56niuEHwgU+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c19hP4k5OG4rDViU4KrDZGkC79A5M4jW7Xk0j7vTWyQ=;
 b=xk4vC96TKAv+/3OD10/0sYmyZJf4btuSQyu8y+ZxmqTDxnGO73ikR2SQLpOLCr4uE28RWqP7Jc9kYYfvJTbXwotC5jmGAkmMl9/aXfxw3bHd8gBBGAXa5qdLffezPhw299p0qUfEnuWx4aBCe78kgVTJWFKJatcOYg01Pi7Vc1pbNCGrhbQMRiRrGZsiOzoXdfa/F8QrNyXYhW8wfSkeWD0CpDmT2j+a3ZR+uvEWq9a5Zuw4WMuXIAJSVc+D4iXGvELWLdUCEgoMviRIjryCYLF7nNUw73bm+dkHMc9l2aHeEGKfrZb2zFyoO0sw9PwqNLUDB+rikEmgGv7uvrf9Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c19hP4k5OG4rDViU4KrDZGkC79A5M4jW7Xk0j7vTWyQ=;
 b=sx60Afi/aLjG5OUUxqs35QFAHGl80rFhpOH61ib5XyQehPB8pSlSwUvzv8n2rLjysaHIEYrn53UyPZEUp9hMXRhBt/P31Gk26j0kLWis5VNvb1fIWxaWa0VTxOEsSCvqSs+QRTuT0MiKhOjopnQhjdUkpmy6GhMK2Pn84bWbFfI=
Received: from BN0PR03CA0060.namprd03.prod.outlook.com (2603:10b6:408:e7::35)
 by IA0PR12MB7751.namprd12.prod.outlook.com (2603:10b6:208:430::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 15:52:04 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::33) by BN0PR03CA0060.outlook.office365.com
 (2603:10b6:408:e7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 15:52:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 15:52:04 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 10:52:00 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<driver-core@lists.linux.dev>, Muralidhara M K <muralidhara.mk@amd.com>,
	Nayak K Prateek <kprateek.nayak@amd.com>
Subject: [PATCH v2 4/7] sysfs: Add SYSFS_HUGE_BIN_FILE flag for binary attributes larger than PAGE_SIZE
Date: Mon, 27 Apr 2026 21:21:26 +0530
Message-ID: <20260427155129.545327-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427155129.545327-1-muralidhara.mk@amd.com>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|IA0PR12MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 45e5a96e-2a24-46dd-a58d-08dea474edee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|22082099003|17002099007|18002099003;
X-Microsoft-Antispam-Message-Info:
	6fVQgh2ldd2J3wUgnhfH/3RDdeGm8e643ZdYzA+3T/+JU9cpAPjKVFpxhofoBMHKq5uNIge30pWnyRe6NTgrwQsPVWu7T/Eea6UgmcDRERIAj3zatk43G2HO/j9XX31n43gxn/kqnrHrRZQEtrA1AW/4w3zwYhmOYrnjRVKprnm1ISAJ1mI71JbdjV3B12j7DNVmol3dB5r+lSIBd3UOAKByjGWXy6mSNePIHRuCN+6X+Yyg5AB6dewQBKGfHma/wXIRTjZqJJ+hw1oJNnyYuUU9tD3U3j+aOMzws0hZ+w3EDHqoyxzAW/9HLLQY2TYxKRqhQgft1ZkBKRiPWWu1BhXH83aOakO7NEB9CldKxU2fujXvABfqtUTfzTkQJIrlNL1Bo9F+Xs/EKxIVWQn/UnLDTqh2Mt9xr/RSn0jnwpX2qjMMVg9d5AaUtqOfNLXYL1lfefwtTr7FsuUrGUTogZ+ITuF/tq0CdykHuBeuBF/Ej28Ym7qfoq3wbXck8NjYRze7LBL1TqDXguZgn41kNG1ismIGFEh97xw6SdmFAyKWCndS83365f++XRo72fwPHhv+B3F3vLx+1/KFfUPqOk4FFJk6E5FHi1Hu1+pl9SVx5DDf2gvkpRFySAaTpvTSRwUkZC6uoIkKC2V47qOthCAMdbyAQY2Mz1pSBudxtv6J3WB5wcLxJpQsEbUGcSsk61WIXNkGryqi6qqw4kqc4s7+gNAZGDqDtTC9GY1ietJ03outlPbNzf7056MK6IKIVgXb0l6fyIlpH3oNn1GqJg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(22082099003)(17002099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oxXN4pGf7FTb+/HYEtM//4MFY2vx6qwoG4fPL50V3reWEJID2Zk+qpQki9uvYgLnlpdUAOs8gsxuYlcsOFa63GAmNo49xLEkJZNFjG+9gIzVXag1AHaScmhafY2b8Bzd7MzViAnDqzCiXyIv3qK64EjsiW26/MfaOrjP1AVdmP2U7oNjutUdDneqjfMYfpeGlGZm/hTLMUfJerSrCP4JvqqsLAqmj2l9QPVI78r33Vbr7KGt1o/P9rz0IQIHXnqJkdCYBUd4nAT2q9lwPpry/4IGKJdw/FjH5gKpLMFZkMvldu2v9EEu+UCn5laVrsJXh2vEBGDIRwsyVVD2QH2OInFCWuHPfMRqk0R05IE77LyDYWSDb0cwNsdXcuwJpHtni04HriM8o5n7SM+mvqYCyNUdLnUxU/y5JAL1hHiSRYEGC8/xHGrcg1dziBxK4U9j
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 15:52:04.7727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e5a96e-2a24-46dd-a58d-08dea474edee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7751

Historically, sysfs read buffers were allocated with get_zeroed_page(),
limiting reads to PAGE_SIZE.  Commit 13c589d5b0ac ("sysfs: use seq_file
when reading regular files") transitioned regular (text) attribute reads
to seq_file, which can dynamically grow buffers beyond PAGE_SIZE.
However, the PAGE_SIZE limit was intentionally preserved for
compatibility.  When binary attribute handling was later unified into
the same codebase, the non-seq_file read path (kernfs_file_read_iter)
retained this PAGE_SIZE cap for binary files as well.

Drivers that expose binary attributes larger than PAGE_SIZE — such as
the AMD HSMP metric table (~13 KB) — cannot deliver the full content
in a single read() call through the existing path.

Introduce a new opt-in flag SYSFS_HUGE_BIN_FILE (040000) that drivers
can OR into their bin_attribute mode.  When set, sysfs selects a new
kernfs_ops (sysfs_bin_kfops_huge_file_ro) whose .seq_show callback
pipes the bin_attribute ->read() result through seq_file, allowing
reads of arbitrary size in one shot.  Existing binary attributes
without the flag continue using the legacy capped path.

Co-developed-by: Nayak K Prateek <kprateek.nayak@amd.com>
Signed-off-by: Nayak K Prateek <kprateek.nayak@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
Changes v1->v2: New patch

 fs/sysfs/file.c       | 45 +++++++++++++++++++++++++++++++++++++++++++
 fs/sysfs/group.c      |  8 ++++----
 include/linux/sysfs.h |  1 +
 3 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index 5709cede1d75..be42c3c1e056 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -38,6 +38,45 @@ static const struct sysfs_ops *sysfs_file_ops(struct kernfs_node *kn)
 	return kobj->ktype ? kobj->ktype->sysfs_ops : NULL;
 }
 
+/*
+ * Reads on huge sysfs bin files are handled through seq_file, which
+ * takes care of hairy details like buffering and seeking.  The
+ * following function pipes the bin_attribute ->read() result through
+ * seq_file so that reads larger than PAGE_SIZE work in one shot.
+ */
+static int sysfs_kf_huge_file_seq_show(struct seq_file *sf, void *v)
+{
+	struct kernfs_open_file *of = sf->private;
+	const struct bin_attribute *battr = of->kn->priv;
+	struct kobject *kobj = sysfs_file_kobj(of->kn);
+	loff_t size = file_inode(of->file)->i_size;
+	ssize_t count;
+	char *buf;
+
+	if (!battr->read)
+		return -EIO;
+
+	if (!size)
+		return -EIO;
+
+	/* acquire buffer and ensure that it's >= size */
+	count = seq_get_buf(sf, &buf);
+	if (count < size) {
+		seq_commit(sf, -1);
+		return 0;
+	}
+
+	memset(buf, 0, size);
+
+	count = battr->read(of->file, kobj, battr, buf, 0, size);
+	if (count < 0)
+		return count;
+
+	WARN_ON(count > size);
+	seq_commit(sf, min_t(ssize_t, count, size));
+	return 0;
+}
+
 /*
  * Reads on sysfs are handled through seq_file, which takes care of hairy
  * details like buffering and seeking.  The following function pipes
@@ -249,6 +288,10 @@ static const struct kernfs_ops sysfs_prealloc_kfops_rw = {
 	.prealloc	= true,
 };
 
+static const struct kernfs_ops sysfs_bin_kfops_huge_file_ro = {
+	.seq_show	= sysfs_kf_huge_file_seq_show,
+};
+
 static const struct kernfs_ops sysfs_bin_kfops_ro = {
 	.read		= sysfs_kf_bin_read,
 };
@@ -333,6 +376,8 @@ int sysfs_add_bin_file_mode_ns(struct kernfs_node *parent,
 		ops = &sysfs_bin_kfops_mmap;
 	else if (battr->read && battr->write)
 		ops = &sysfs_bin_kfops_rw;
+	else if (battr->read && (mode & SYSFS_HUGE_BIN_FILE))
+		ops = &sysfs_bin_kfops_huge_file_ro;
 	else if (battr->read)
 		ops = &sysfs_bin_kfops_ro;
 	else if (battr->write)
diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index b3edae0578c0..2d0b01c00a97 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -74,11 +74,11 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 					continue;
 			}
 
-			WARN(mode & ~(SYSFS_PREALLOC | 0664),
+			WARN(mode & ~(SYSFS_PREALLOC | SYSFS_HUGE_BIN_FILE | 0664),
 			     "Attribute %s: Invalid permissions 0%o\n",
 			     (*attr)->name, mode);
 
-			mode &= SYSFS_PREALLOC | 0664;
+			mode &= SYSFS_PREALLOC | SYSFS_HUGE_BIN_FILE | 0664;
 			error = sysfs_add_file_mode_ns(parent, *attr, mode, uid,
 						       gid, NULL);
 			if (unlikely(error))
@@ -107,11 +107,11 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 			if (grp->bin_size)
 				size = grp->bin_size(kobj, *bin_attr, i);
 
-			WARN(mode & ~(SYSFS_PREALLOC | 0664),
+			WARN(mode & ~(SYSFS_PREALLOC | SYSFS_HUGE_BIN_FILE | 0664),
 			     "Attribute %s: Invalid permissions 0%o\n",
 			     (*bin_attr)->attr.name, mode);
 
-			mode &= SYSFS_PREALLOC | 0664;
+			mode &= SYSFS_PREALLOC | SYSFS_HUGE_BIN_FILE | 0664;
 			error = sysfs_add_bin_file_mode_ns(parent, *bin_attr,
 							   mode, size, uid, gid,
 							   NULL);
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index b1a3a1e6ad09..78f6c6252cf9 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -124,6 +124,7 @@ struct attribute_group {
 
 #define SYSFS_PREALLOC		010000
 #define SYSFS_GROUP_INVISIBLE	020000
+#define SYSFS_HUGE_BIN_FILE		040000
 
 /*
  * DEFINE_SYSFS_GROUP_VISIBLE(name):
-- 
2.34.1

