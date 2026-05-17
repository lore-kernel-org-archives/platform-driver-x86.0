Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011005.outbound.protection.outlook.com [40.93.194.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBD13B9D84;
	Sun, 17 May 2026 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030778; cv=fail; b=QXwSCRBinGNKnlGcVXqFr60sGLrwwzdGMez6hOCKWLY43fwegNFf24WT1PLAZjwnB9pYhkpnl2eB7ym78u3PBYTi1hlR77nPuK2oKeri4+jVPtLxTfkUYQj0F+owA+Hpb+N2MkZTdlCIHP0npP/CcZUOLyfClB1GhWrRfNg8ykQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030778; c=relaxed/simple;
	bh=GzWc1AOF70NDFEYk40rRVA/jQ1AnhUu1Qw5AJMah2Nk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iPjuUSstx5DSxtfdRgWEGeXJXVKqxbm3yRqbek8gYkDGtMWzpk/beDcjDE6RftregPEkQPuRUqAN3IJIN2YpxK6VmNwNbOgXj4LeaKVOXBHT+hqFQh+QPTUDPNUDWBtSiHvg+plCA9y6wy8WrMylw5CO9xe8I4xrC72KJbOzpy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=F/TxHj20; arc=fail smtp.client-ip=40.93.194.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="F/TxHj20"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4Lmzy3l05XXKlVVYTPOMw82g6EY78xr5xUJoFvGTTC19k4yKupdibngx87mdutNkoeFgnGq6DdqqIITvDAKg7xvAt5oPfTmZRID3/4jO/dubWD2NUFya6Mzf49AbOXp3lYTJ0gS1elJ/uQmeKn4AS7OIJdMC36ujeFFRD5rfzfyXkTi4goJ3be3AU6HqfuWP4rOUZEKyOVFzmqZ6OHKkn9GJv9B+ZCwXkbOjvvDQukY/LQjgBU7DSuLApIkZDf8ktUEaV8GIF2M03ldSRV0pOLypLzpcHN2mE3VGVSGe1SzE++J0Kp1KqD2WE8qRZqLvKiiA3EEGsckuusU398o9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sjzubx7yWzRdj0AmsaK4zgRCfyjr32T24Clhn6FpOgw=;
 b=onE0rVVf7WgjZ9tUZzK0HoQxEqpsADkMgd0WZwWU21wGMgv4wrTRxJH03tzqtNvNUKhZHL0a1+t+wA/KRJx16dqWmpd8z74ZeBtDjB4kWZPBdpV3JgxRMHSHHkZOq5QkZ7wqBhIB1chSFlIgBm7HYJNPzSWOrmPa5OuFDNFPwIlKq23oWc9zIIKnu25yXnfIrzk7JfuaAPUveDvDpcr3uYDlYdNuvw1enlPV7B58EPTbtHUQnWN6T+I3C5fav2MCbnxR/ormh07a5HMfqu+SaxiUyU9kmJWATCxoacTVrPes0jsiG6dYnCbGCeG2N8dMTrKEQl5TMgodrS5syNiYCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sjzubx7yWzRdj0AmsaK4zgRCfyjr32T24Clhn6FpOgw=;
 b=F/TxHj20uNXzbRCTFMFbDWeCbY8PkAU+3BcwRsgFusSCqtdgqh1QmhSTY/sLZE0ZK83LAnJitEXUj1M61WFSWAu0qFV4w5tIUzdlrx66/EY9qJJB8PY1LwbDJgWfQ9WXPaxzx+TlIif5s3x/b9qLuKqlyymGh1bnDgzAAGmvdds=
Received: from SJ0PR05CA0146.namprd05.prod.outlook.com (2603:10b6:a03:33d::31)
 by MW4PR12MB5665.namprd12.prod.outlook.com (2603:10b6:303:187::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Sun, 17 May
 2026 15:12:48 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::2a) by SJ0PR05CA0146.outlook.office365.com
 (2603:10b6:a03:33d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.12 via Frontend Transport; Sun, 17
 May 2026 15:12:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Sun, 17 May 2026 15:12:47 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 17 May
 2026 10:12:45 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v3 5/7] platform/x86/amd/hsmp: Add IOCTL_GET_TELEMETRY_DATA for metric table reads
Date: Sun, 17 May 2026 20:42:09 +0530
Message-ID: <20260517151211.415627-6-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|MW4PR12MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: a52828e9-f336-4f44-e309-08deb426c14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info:
	oqMKpqn0kQk9qRRGBlh3IOqZgBZLQCbolPgUlYPq6yosNCxHY1iSaD8vc1Npo4RFhPDxg6lr8gtIu89Yq4nZ0upu4ltUDawIqWw+V2FvwA66sZVV00iJI1VqIw2akerg6tDU3a7dn/vXclrUledrBWm2uRwKUPRTZFY0JmYniRT9RmdFPddEkZ/ItDmz+AInVRZJ6xBlfnD/GE/XhiS7v78aCNkUin0e70G8Al0065ERBsiMDbUVktAMglQ+8fYs73ece0WlVKTxkM18LO9lhTTA2EQd6HGwCSjVaGjyq8UVmO2zRQBg5TUP4+ttITJG1qnC2+MPD2frz3X7YBdCdnoVkt4yld+9nyPtkl0YbT+bS3xIeicRgBJX1WtmK3N4p5HiBmYd7rDGh1c+fZUibTEigyOEQAsguIGh+FQ7mYvP3ABf9hVnDrNOfFY8w3EaLpt7Wqb5gjA7VZN4FbTvCRJP6TsApBLGgzeIu8BQ9GJXUvI0i0je431QCbGnCKIvpO+gdmWMHvHfaiIhY7y+V8fH2Bf1XeDNmv+eDc3GhX6bCrGlyz0onQ8/+RWrHKRuB1/LXQvXiJmSe4gruP246ZdpQ0p+alDV9rgfd2o/hpQtvUsCEFS/uyDZmMFEcpsIs176PXbYsoixMSi+3W79NQp1vouAyBDwiVAlu70MinseeRySokZb/fyNCHecd0KNcDVcTnTknePn+ZuZxKLY8Y88wn7IxV8iacFk32O7swY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/KNfDLY99Eo60iOapF3qdw1QEQJStuO37LacxDppPmVOikxoT21O0ClquamBjtR++HoVMg3qf/D99HGWe+Q9h7WIKFFoVSNxVetXY4sitpH+K7wksebUr2Vyv0OznCAcM1rRkDR+X4sq/h7oYBtXumZNEsteQ35zvFiHnSiXY4dHBCa+6mYFB+H6riIxHyi3tCVUm5t/qOHq2lBV6XrBDXJRsJLIO1mdS3Ws9D5UcaL5r/74z322NDrq6adYbiCF0uDLe2hOnBsXhWzptaW/Q9hn+pex2YtUsPEXBGk+Cv1k2yVxfjHi5W9M7zowLLjC240Pat3/GSqWNHVBDsEKpmYjTV7kileM7KITof+kVIESGVRXC/YamUgkRdPykmLHZZZTS7UaRwLBMx5Wp9u6QwNkvwjPezF26OTgCiWpsDxrR9y2Hi2yWLlNAgiHFe5w
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 15:12:47.6619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a52828e9-f336-4f44-e309-08deb426c14c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5665

The metric table for Family 1Ah Model 50h-5Fh
(struct hsmp_metric_table_zen6) is approximately 13 KB, exceeding the
PAGE_SIZE (4 KB) cap imposed on the standard sysfs binary attribute
read path.  Rather than introduce new sysfs infrastructure to support
binary attributes larger than PAGE_SIZE, expose the metric table
through the existing HSMP character device using a new ioctl.

Add struct hsmp_telemetry_data and HSMP_IOCTL_GET_TELEMETRY_DATA to
the UAPI header.  The request structure carries the socket index, the
required buffer size and a __u64-encoded user pointer to the
destination buffer, so the same layout works for 32-bit and 64-bit
callers.  Fields are ordered with the __u64 user pointer first so all
members fall on their natural alignment under #pragma pack(4), giving
a tight 16-byte struct with no implicit padding; the trailing
reserved __u16 is documented as "set to zero" so future kernels can
attach meaning to it.  Userspace sizes its buffer using the matching
UAPI metric table struct (hsmp_metric_table or hsmp_metric_table_zen6)
for the running platform; sizes that disagree with the firmware-
reported table size are rejected with -EINVAL so a short copy can
never silently truncate the snapshot.

Dispatch hsmp_ioctl() on the ioctl command, route HSMP_IOCTL_CMD to
the existing message handler (factored out as hsmp_ioctl_msg()) and
HSMP_IOCTL_GET_TELEMETRY_DATA to a new hsmp_ioctl_get_telemetry()
helper.  The new helper validates the request, allocates a kernel
bounce buffer with kvmalloc() so it can hold the full table even
when it exceeds a single page (zeroing is skipped because the buffer
is overwritten in full by memcpy_fromio()), calls hsmp_metric_tbl_read()
to refresh and copy the table from the SMU DRAM region (under the
per-socket mutex introduced in a follow-up patch), and copies the
table to userspace.  Unknown ioctl commands now return -ENOTTY instead
of falling through.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
Changes:
v1->v2: New patch based on bin sysfs
v2->v3: Replace with IOCTL method

 arch/x86/include/uapi/asm/amd_hsmp.h | 43 ++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 85 +++++++++++++++++++++++++++-
 2 files changed, 127 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index b86bbc929395..3d085298dd52 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -664,6 +664,40 @@ struct hsmp_metric_table_zen6 {
 	struct hsmp_metric_table_zen6_ccd ccd[F1A_M50_M5F_MAX_CCD];
 };
 
+/**
+ * struct hsmp_telemetry_data - Request descriptor for HSMP telemetry IOCTL
+ * @buf:       Input. Userspace pointer (encoded as __u64 to keep the layout
+ *             stable between 32-bit and 64-bit callers) to the destination
+ *             buffer that receives the metric table.
+ * @size:      Input. Size in bytes of the buffer pointed to by @buf.  Must
+ *             match the firmware-reported metric table size for the running
+ *             HSMP protocol version (see below); any other value results in
+ *             -EINVAL.  The kernel does not write this field back.
+ * @sock_ind:  Input. Socket index from which the metric table is read.
+ * @reserved:  Reserved for future use.  Callers should set this to zero;
+ *             future kernels may begin interpreting the field, so passing
+ *             a non-zero value today is not forwards compatible.
+ *
+ * Placing @buf first lets all fields fall on their natural alignment under
+ * the surrounding #pragma pack(4), so the struct is a tight 16 bytes with
+ * the same wire layout on 32-bit and 64-bit userspace.
+ *
+ * The exact metric table layout depends on the HSMP protocol version reported
+ * by the firmware:
+ *   - Protocol version 6 -> struct hsmp_metric_table
+ *   - Protocol version 7 -> struct hsmp_metric_table_zen6
+ *
+ * Userspace queries the protocol version (e.g. via the protocol_version sysfs
+ * attribute) and uses sizeof() on the matching UAPI structure for both @size
+ * and the allocation backing @buf.
+ */
+struct hsmp_telemetry_data {
+	__u64	buf;
+	__u32	size;
+	__u16	sock_ind;
+	__u16	reserved;
+};
+
 /* Reset to default packing */
 #pragma pack()
 
@@ -671,4 +705,13 @@ struct hsmp_metric_table_zen6 {
 #define HSMP_BASE_IOCTL_NR	0xF8
 #define HSMP_IOCTL_CMD		_IOWR(HSMP_BASE_IOCTL_NR, 0, struct hsmp_message)
 
+/*
+ * Fetch the firmware metric (telemetry) table for a given socket via the
+ * HSMP character device.  This avoids the PAGE_SIZE limitation of the
+ * sysfs binary attribute path for tables larger than one page (such as the
+ * ~13 KB hsmp_metric_table_zen6 used on Family 1Ah Model 50h-5Fh).
+ */
+#define HSMP_IOCTL_GET_TELEMETRY_DATA \
+	_IOWR(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
+
 #endif /*_ASM_X86_AMD_HSMP_H_*/
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index cf9392f99298..3a02d683dea0 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -13,7 +13,9 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/semaphore.h>
+#include <linux/slab.h>
 #include <linux/sysfs.h>
+#include <linux/uaccess.h>
 
 #include "hsmp.h"
 
@@ -287,7 +289,7 @@ static bool is_get_msg(struct hsmp_message *msg)
 	return false;
 }
 
-long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
 	struct hsmp_message msg = { 0 };
@@ -343,6 +345,87 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
+/*
+ * Fetch the firmware metric (telemetry) table for the requested socket and
+ * copy it to the userspace buffer described by the request.
+ *
+ * The metric table size is variable across HSMP protocol versions and on
+ * Family 1Ah Model 50h-5Fh exceeds PAGE_SIZE.  Userspace must therefore
+ * supply a buffer at least the firmware-reported size in bytes.
+ */
+static long hsmp_ioctl_get_telemetry(struct file *fp, unsigned long arg)
+{
+	void __user *arguser = (void __user *)arg;
+	struct hsmp_telemetry_data req;
+	struct hsmp_socket *sock;
+	void __user *user_buf;
+	size_t tbl_size;
+	void *kbuf;
+	int ret;
+
+	/* Telemetry data is read-only; require read access on the fd. */
+	if (!(fp->f_mode & FMODE_READ))
+		return -EPERM;
+
+	if (copy_from_user(&req, arguser, sizeof(req)))
+		return -EFAULT;
+
+	if (!hsmp_pdev.sock || req.sock_ind >= hsmp_pdev.num_sockets)
+		return -ENODEV;
+
+	tbl_size = hsmp_pdev.hsmp_table_size;
+	if (!tbl_size)
+		return -ENODEV;
+
+	/*
+	 * Userspace must size its buffer using the appropriate UAPI metric
+	 * table struct for the running protocol version.  Reject mismatched
+	 * sizes so we never silently truncate or short-write.
+	 */
+	if (req.size != tbl_size)
+		return -EINVAL;
+
+	sock = &hsmp_pdev.sock[req.sock_ind];
+	if (!sock->metric_tbl_addr)
+		return -ENODEV;
+
+	user_buf = u64_to_user_ptr(req.buf);
+
+	/*
+	 * The bounce buffer is overwritten in full by memcpy_fromio() inside
+	 * hsmp_metric_tbl_read(); use kvmalloc() to avoid the zeroing cost of
+	 * kvzalloc() on the ~13 KB allocation done on every ioctl call.
+	 */
+	kbuf = kvmalloc(tbl_size, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	ret = hsmp_metric_tbl_read(sock, kbuf, tbl_size);
+	if (ret < 0)
+		goto out;
+
+	if (copy_to_user(user_buf, kbuf, tbl_size))
+		ret = -EFAULT;
+	else
+		ret = 0;
+
+out:
+	kvfree(kbuf);
+	return ret;
+}
+
+long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	switch (cmd) {
+	case HSMP_IOCTL_CMD:
+		return hsmp_ioctl_msg(fp, arg);
+	case HSMP_IOCTL_GET_TELEMETRY_DATA:
+		return hsmp_ioctl_get_telemetry(fp, arg);
+	default:
+		return -ENOTTY;
+	}
+}
+
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 {
 	struct hsmp_message msg = { 0 };
-- 
2.34.1

