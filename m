Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011035.outbound.protection.outlook.com [52.101.62.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8934C9003;
	Wed, 29 Jul 2026 16:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343274; cv=fail; b=ZML4Kh/1StowQXy4kiL9NlkEX8F+OfXV/HvdbHtMUnsaptOIaERW6wr9Mj8OLsWwDlZJa+u1VTQ7xyKTIiRq3YJP+DR4xsU5oAgUS2/9HbIa4H/eI2KfhtNtvAWvPYhZz+AFbYKszo/6CSIttgiir++L61C1zJSCHn6OoKqq4MA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343274; c=relaxed/simple;
	bh=GmjXB+XuoIwoIGqXlkV7sfun6nsUFb9hdlEW1HL2jT0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ptmel2tlg6G2bHcBYvLKGHsAb2g3MLRLD8KypADMs3XXcI3LamG90l7FSMx+oSX2CCaaRgr2/o0pV/lfwo8jAj0TCJGEPSIOCt2elU5KvvUy5mIcBLpI8G3nmbVZkGQM6fZzDE+jxZm3n+6YZ5q2K3JGK46H8rvrtL9+1+SYXaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SJ3Qbb0E; arc=fail smtp.client-ip=52.101.62.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SJ3Qbb0E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6RG+YMYRkFtEaV1ZlpdLuOyNJI5/mp/011BxVqlBxJGm63+i7CvufNja55QAgBYmENewuTCpkhAQo94iPfRpkWK3uMRo0w0wEyg3Ez/seQdI+kWUKmpN60OzPImt/Hxdqz8/bpdUYpSnGWn7QO7CW1LPypBNV9AgOQPraubocMeyHoQd5WT71+lPTMBwAq9dhqSK0b86nsC+gP7CCO6AExz4E0MdhWt/uZe/v8SrZ1KuK1/3Be04xkpI00M0mIiK/iM4PDnS+95UmrEyKo8RAXwKSLgUj9wz/MsUKun7HXQ5veCkeeHXs06dPp1mOkXw/ipgoJx28Kt/89afQKoOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frkM4vY6tBOxKiako92SMt2iSy7FnqmF+Fu91mL6nxI=;
 b=cU/Jw6Gi8vIm89WKkuSrjjSifQ9SRVSGzETkfrbXQ9oLrg/2ICVT8piqH0AX/HwsftbEoNTZp+0rholG9EGoruO+k9pIWvngH5LeJXUvHXKJlZTOfgAd2/4Ke+drKTLK6x6rpsRB0f6J6BMpk53q2kr07f5hJoiURKBPK3EEv/yDi+X5QUCXyrJlo+beVT0oIwE4BQrbTWd9NRhBDucwvQB/JX+1+Tz5ziTNh3WLyrWS/Qe+Wf6+6M0p/INYY9V7Q+ZqJnAljNeKXfsKfFZfHNUrOTYXeTcNG14DGSuIZoLo3KiRTxFbXrI0ito0W8GNy7frGn/xttFQuoRKf6U6gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frkM4vY6tBOxKiako92SMt2iSy7FnqmF+Fu91mL6nxI=;
 b=SJ3Qbb0EUh2BrdZrNPf1IO2MhVbCe71+QOBUMvOgp27vmKCghCoTxwr9IlZi/BC7WQWTCpnEFQPNvkxP7NRWx/gIZobdem7nmIMjPvcpbshvJ4YRD32HZNj1fK1Iz7k6TjJhWeRYn0AVKgCphXJs+ecy715EQunuk8GPv0kpoaU=
Received: from SA9PR10CA0013.namprd10.prod.outlook.com (2603:10b6:806:a7::18)
 by SJ2PR12MB8953.namprd12.prod.outlook.com (2603:10b6:a03:544::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 16:41:05 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:a7:cafe::f) by SA9PR10CA0013.outlook.office365.com
 (2603:10b6:806:a7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 16:41:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 16:41:05 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 11:41:03 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 5/7] platform/x86/amd/hsmp: Add SMN read IOCTL support
Date: Wed, 29 Jul 2026 22:10:32 +0530
Message-ID: <20260729164034.1331375-6-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729164034.1331375-1-muralidhara.mk@amd.com>
References: <20260729164034.1331375-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|SJ2PR12MB8953:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e3717d6-76d3-4b21-bd49-08deed902f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|6133799003|22082099003|18002099003|3023799007|56012099006|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	1wBv1OYRFgGIiYMudojJUvY+XKslhueDzxlY6XfKGituaL088o0Jy21JvJ22WsJwkluLyxiFDfpsshZ+7Wl1tCh7JHPziLng5zqXjeutO0cdP9sEW/SZEAYaqDvmc4IOGmg7tQDbV/ad9/plASPm5pxlCR/Q1T8NBXWc3VT67VPnRCwEExjLCikkjX/SR6Y+mJx5MAi80gpXV1WjUjJLJufXDmzVF3gl4xjErHJQ6vOIIzAEwEgBzxPUb7Fmy8yBhbEXG5jX43qpGFli8Ya3bbtSWkZfHyxVE1e6dhzPwf9LrATuRgHDgwjbJWd7aC5ot8afr418fE2jKKcIs2fnCh0ddfXgjuS7jr7vSLeojYeNYJIB47+CukAuq5bsTEIYr3Qx2mj1kbWjGY82TeTaAq4jWcArznyi6LbuFgyK+8YlmyF3abMOC09aWLism4E/au5UYOPHy0Bz9LvbMY5VLKWobdgo/uNSHQc8louqQe0gAL1NH5w0470trekxif5g+bz4Py0Ww/HQS3LETQN0YHB9CbLdeHLZXA5he8WR7vyNfylAx8deV5sROsyptJs0BqTKPNPEFbl566WGZG8Ey9PZykb2XRPpADm2SG9f/KGS+r4cIP+GdPaTEBMhzZr2sZZMwqgJC9TUrS97I78Uvq2ZGkoI/MGi1jWcZ0YGXCwBNtwHjySzgEeRskG9hbfSUoybBhgdeawjF0HRi6qKDQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4CoUTKSC2lcT3Ioz0ogwF0H3w+s486gUpJI8wGaX3Y2XZAg8lBwc/w0JPb6Yu6+eFKYRobNEn8WLSOl5jXgdiKLdnA1J6QLxfqHgyMFMWgRNprQRWPf8bwVamyYNhZ1p3Gptv4b2Jshdc1+7VjGxSqzhUY4NjUGHTP67ipABHG2CRFzwe2vSx+xF3vmExlkqgTCKadFanVhImmrPzuXwmL+gxSLbqfVZuM8GPKL9cI/Ij7jCQUeQ/1ZLlVcpKybep7b1CdonbgiyCizxBzgFWrY5MAxTJiXb7/TLOTanupXgieIPckZorgkLkQ62kZA/nWMTL5wk2yQAq/n2Myw0VZCamwLVBqH6hxh98ewELH6s7fnZOaSPHJGoKB5xowNJIQNJar3lYC/RzEJu4HI5RjpOXJ48PL8YERYaEJ6+BmhUywzB69+7HqEhHPDUl/jj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 16:41:05.4931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3717d6-76d3-4b21-bd49-08deed902f2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8953

Bringing up a client platform means reading SMN registers that the HSMP
message set does not cover, and today that means either a debugfs
interface that is not present on production kernels or an out-of-tree
module. Add HSMP_IOCTL_SMN_CMD so a privileged tool can issue a 32-bit
SMN read for a given socket through /dev/hsmp, routed through the same
amd_smn_hsmp_rdwr() helper the driver already uses for its mailbox.

The ioctl is read-only. struct hsmp_smn_message carries a @write flag so
write support could be added later without changing the layout, but a
request that sets it is rejected with -EPERM regardless of the caller's
privilege or open mode: an SMN write can have side effects anywhere in
the SoC, and nothing in this driver can bound them. Reads still require
CAP_SYS_RAWIO, because even reading can touch registers with read side
effects.

Every field of the request falls on its natural alignment under the
surrounding #pragma pack(4), so the struct is a tight 12 bytes with the
same wire layout for 32-bit and 64-bit callers, and the reserved byte is
rejected when non-zero so a future kernel can repurpose it without
breaking deployed userspace.

The handler takes hsmp_sock_rwsem for read across the bounds check and
the access. /dev/hsmp is a singleton character device that outlives an
individual socket unbind, so an ioctl on an already-open fd can run
concurrently with teardown, and remove takes the same lock for write
while it tears the socket array down; without the lock the check against
num_sockets could be made against a count that is already being torn
down. The copy_to_user() is deliberately outside the lock, because
faulting in a userfaultfd-backed destination can block indefinitely and
would otherwise leave a socket unbind waiting for the write lock. This
mirrors HSMP_IOCTL_GET_TELEMETRY_DATA.

The user-controlled socket index is clamped with array_index_nospec()
before it is used to reach per-node data, mitigating Spectre v1
(CVE-2017-5753).

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 arch/x86/include/uapi/asm/amd_hsmp.h | 34 ++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 69 ++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index b4c3ddb9d1c1..9c4ad22e47ae 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -79,6 +79,31 @@ struct hsmp_message {
 	__u16	sock_ind;		/* socket number */
 };
 
+/**
+ * struct hsmp_smn_message - Request descriptor for the HSMP SMN read IOCTL
+ * @smn_address: Input. SMN address to read.
+ * @value:       Output. Populated by the kernel with the value read.
+ * @sock_ind:    Input. Socket index the read is issued on.
+ * @write:       Must be zero.  This IOCTL is read-only, so a request with
+ *               @write set is rejected with -EPERM whatever the caller's
+ *               privilege or open mode.  The field is kept so that write
+ *               support could be added later without changing the layout.
+ * @reserved:    Reserved for future use.  Callers must set this to zero; a
+ *               non-zero value is rejected with -EINVAL so future kernels can
+ *               repurpose the field without breaking deployed userspace.
+ *
+ * Every field falls on its natural alignment under the surrounding
+ * #pragma pack(4), so the struct is a tight 12 bytes with the same wire
+ * layout on 32-bit and 64-bit userspace.
+ */
+struct hsmp_smn_message {
+	__u32	smn_address;
+	__u32	value;
+	__u16	sock_ind;
+	__u8	write;
+	__u8	reserved;
+};
+
 enum hsmp_msg_type {
 	HSMP_RSVD = -1,
 	HSMP_SET  = 0,
@@ -664,6 +689,15 @@ struct hsmp_telemetry_data {
 #define HSMP_IOCTL_GET_TELEMETRY_DATA \
 	_IOW(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
 
+/*
+ * Read a 32-bit SMN register on a given socket.  This reaches registers
+ * outside the HSMP message ABI, so it requires CAP_SYS_RAWIO.
+ *
+ * The direction is _IOWR because the kernel reads the request struct and
+ * writes the value it read back into the same struct.
+ */
+#define HSMP_IOCTL_SMN_CMD	_IOWR(HSMP_BASE_IOCTL_NR, 2, struct hsmp_smn_message)
+
 /*
  * Client HSMP messages supported on the Family 1Ah client platforms:
  * Models 80h-87h (Medusa1), Models 88h-8Fh (Olympic Ridge) and
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 2326506929a4..ec11c5840b87 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -8,8 +8,10 @@
  */
 
 #include <asm/amd/hsmp.h>
+#include <asm/amd/node.h>
 
 #include <linux/acpi.h>
+#include <linux/capability.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -430,6 +432,71 @@ static bool is_get_msg(struct hsmp_message *msg)
 	return false;
 }
 
+/*
+ * Read a 32-bit SMN register on the requested socket.
+ *
+ * Raw SMN access reaches registers that are not part of the HSMP message ABI
+ * and whose side effects the driver cannot reason about, so it is gated on
+ * CAP_SYS_RAWIO. Writes are not offered at all: the request carries a @write
+ * flag so support could be added later, and a request that sets it today is
+ * refused whatever the caller's privilege or open mode.
+ */
+static long hsmp_ioctl_smn(struct file *fp, unsigned long arg)
+{
+	void __user *arguser = (void __user *)arg;
+	struct hsmp_smn_message smn;
+	unsigned int sock_ind;
+	int ret;
+
+	if (!capable(CAP_SYS_RAWIO))
+		return -EPERM;
+
+	/* The value read travels back in the request struct. */
+	if (!(fp->f_mode & FMODE_READ))
+		return -EPERM;
+
+	if (copy_from_user(&smn, arguser, sizeof(smn)))
+		return -EFAULT;
+
+	if (smn.write)
+		return -EPERM;
+
+	if (smn.reserved)
+		return -EINVAL;
+
+	/*
+	 * /dev/hsmp is a singleton character device that outlives an individual
+	 * socket unbind, so an ioctl on an already-open fd can run concurrently
+	 * with socket teardown. Hold hsmp_sock_rwsem for read across the bounds
+	 * check and the access, since remove takes the same lock for write
+	 * while it tears the socket array down.
+	 */
+	scoped_guard(rwsem_read, &hsmp_sock_rwsem) {
+		if (!hsmp_pdev.sock || smn.sock_ind >= hsmp_pdev.num_sockets)
+			return -ENODEV;
+
+		/*
+		 * Sanitize the user-controlled socket index against speculative
+		 * execution. The bounds check above retires the out-of-range
+		 * case with -ENODEV, but a mispredicted branch can still let
+		 * the CPU speculatively use the index to reach per-node data
+		 * and pull arbitrary kernel memory into the cache (Spectre v1,
+		 * CVE-2017-5753).
+		 */
+		sock_ind = array_index_nospec(smn.sock_ind, hsmp_pdev.num_sockets);
+
+		ret = amd_smn_hsmp_rdwr(sock_ind, smn.smn_address, &smn.value, false);
+	}
+
+	if (ret)
+		return ret;
+
+	if (copy_to_user(arguser, &smn, sizeof(smn)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
@@ -620,6 +687,8 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		return hsmp_ioctl_msg(fp, arg);
 	case HSMP_IOCTL_GET_TELEMETRY_DATA:
 		return hsmp_ioctl_get_telemetry(fp, arg);
+	case HSMP_IOCTL_SMN_CMD:
+		return hsmp_ioctl_smn(fp, arg);
 	default:
 		return -ENOTTY;
 	}
-- 
2.34.1

