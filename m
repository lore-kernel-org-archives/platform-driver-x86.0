Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011055.outbound.protection.outlook.com [52.101.62.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292A64F7988;
	Wed, 29 Jul 2026 16:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343278; cv=fail; b=pPT6NFxUGV/IIc7HMW59pIY7rbt6lPiiywi4f+dLTJkXJIYBQO4xHBPQznPA4OPi/7RhTa7unMuL0TIRHyimZiIxgAhKLPZeSLtwdnI8U8siH59zYe30b6a2xDRZsRRakKv0hBl1CudDRviqpoLiq9f/Olf+veu/KopN/aMpO68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343278; c=relaxed/simple;
	bh=WmdUPJCLvbiLOasH/JSEcupErSMxhree+KaM7zukuhA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cA4B+C7UFEQPMxxcfG6VF2BVwpRwbLxLVTFDdRlqqF/F2k9zdw17DsD8OngAVLfYSIqh/NO7VeadtuwQ0Lp++jVBY12wTGPAkBH/8zc0bN2gVNW5pFSJwPks+hNpRYtX0vaGZ/h2P1HZJoIcaJsXFXBpWLJdPUwL2cItjE1FRC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2Inja/0X; arc=fail smtp.client-ip=52.101.62.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2Inja/0X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAm+iFtgAEw/fiLlaGGi1Yjhq+xYe4atj9UnF1OKTtIvjlv6k8CyM9L0JxmL/mUBDOK5RL/av8Xl4ZOxn6qxI6PG2O5RUsQPOj+wYvUYLyHa+AbwTIImo9MYX00vUkTX6viAZfb/BDzBh2v/heKyzvFoVHt9fGlYKdAE6VlYdn8+ovhQQPp4Ec+8kMO7ickvxPLJWG6s0YfmS3CGoQC0h3nDl38WbAJdx9r2SeD7IonGu5/iN9sHXfgnhcEc9ar+HGjuBYxu7UdN8XsiU2b1iziaUjeINYNSk4gmmn4GvzoY4B5AMvU6VV1ezSDaKsWMCf4eglul8Vn8ffjKBo0XPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M87YGwDsLCx7sEBZ/rReMjcFJKIxIDHiZkfbSTLIWSQ=;
 b=dzNij0NTg8AGpkMm2HZg1rsQpTYLxwHAIgn6lTp3nQo6ZGsieqv9ndODvqM9Gd+iQovfSY4wpVRyvDvbSqxfgXTtOA6MZcMrbWNaiYeMc10UqpwI/LJ1dW3fVrOKPF491dxDrBSQkRN83swv/813jdZ9NH603UDu/TnjVvfx+MNoWC7s9XqXayq5393sGaKGgJ9oy7DPNJp2IESlEGZsG+R2WaP8ai2j99SxQ4Xc8SSIDpUu5dHwDWGWemDJ6Zz6UNFbyFnc+2pjyewnVYCcpqQKFhq3bE1bjP1KxCtKTgHPjFpLacn/B8svulxlusZ+D5LhZOUHKB8EOsS/Es268g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M87YGwDsLCx7sEBZ/rReMjcFJKIxIDHiZkfbSTLIWSQ=;
 b=2Inja/0XjZaojLxoBPgepMMDirJcM7bqgwwjV5mEfz/9DUvrSoY7Kg1SNx6FbvwVHHRO/7efZ3Od0Y5eyTxafEUiagNWuYs9N++N5dR45R+JPv7JLKl/ymlZVkCujURT/BehoAMyp4sPeXebZXv8ZJrZNKqXYwF/U3fpHWldNqo=
Received: from SN7PR04CA0009.namprd04.prod.outlook.com (2603:10b6:806:f2::14)
 by PH7PR12MB8825.namprd12.prod.outlook.com (2603:10b6:510:26a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 16:41:07 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:f2:cafe::20) by SN7PR04CA0009.outlook.office365.com
 (2603:10b6:806:f2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 16:41:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 16:41:07 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 11:41:05 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 6/7] platform/x86/amd/hsmp: Add MSR read IOCTL support
Date: Wed, 29 Jul 2026 22:10:33 +0530
Message-ID: <20260729164034.1331375-7-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|PH7PR12MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5c7482-f747-4eb9-6fad-08deed903052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|6133799003|5023799004|11063799006|56012099006|10067099003|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	tsyKfwvY0bDKIDrArg7W6aQ2mA+CWqCrklQhWpjCrpwlDosnHG+TZKcWVJBhx4ba4F9jPaqg1OtgFs1jm05wgUmuXzjHFNvlks2PdIVe2mMFiYKyOhL5/padXBoaj+nN6LI6bPC/gSx8x0qpcqmQgWP1kO5WC4O1mWOdnXoCpTlJ/fomXhM7pzedDHsjhG5mb2iTbYNzfmbhRjqrPFJr8kzxVfQby0quv80qxnHgpPzUc7muPsaM6LsOVgj1Yb1uf0RMjNJCpt3a0y77pYNz5+5u855ojoCsTq44rWF9b9Ff0oIF9O8L81PCVDaZ5exavIhMtQkQ2hX9dM484OKZf6+dF5qHip+eJ7IYj8ykaylQp94ZSTju9SGCTmaH7LAiw04JBnLrZEOZqOxpenO6sO1oxESe7TsnGhPJyO4n1iAJQvKoB0Z1uiMNoSSmCM0xfq7WBnYZ8jQemelyj9JR5Xe/O2js9hh7pO/dlDkmmeQosvTjpeNH7Hwib3p0qcJTodznC8F08K7An35X568G2hdamK2404PNi6kquuTJ2ZwOE22KKzOZKn64jh/B+qgNIEn7EumKW8c+EnyePOUVbMz7APzu6GeCpuxMSNLcQQYgD49nrISsmk57c+xYv4Cgp4WbIZAfG5NVgRHGqWbCMGiCtFNVhDQv5y5nO2tq5dsGC1ZXi0a+e0MHl0QLyLgW0cL32rlOxJPp2IlMMea2mw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(6133799003)(5023799004)(11063799006)(56012099006)(10067099003)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9IyRzGT5pj8zuo/NveoLBBCZsCYdtwNebT6Q3Z9md3c3LWy5b47UKSmBomN3zOSAeOxtobK1N/TCdVx7dyU3QnVj/Aqd5UHL2BLa4A6QAyN8m+2+Utqif6NO4hpxCFa+XKwB4BCPcICLPQhL2nGnW5ntilbJZFhRWBjc3vG2tv9+jAmAX8edLM7j3HOx6ZJaFPVEtOtqWp6yiWPHNIJILgZIRObbo9xDzWZSZzzcyOePTxSCrVViOThp7Fn3r0XnSAhbL9wt7wq6KDz2XTitsTp4Sd9mJpDKWNfFmopMouZsPIAxffByK3vJ+YB3oP9RIPGwiIXiWj14kwC97+Q/XxifSnwaPaYpn0fHxlglUKF3e6xOOPZm3buoG29szYMTOZWvCOWmI8aXbXjoo6k3EPEBdIUGVa3aglvHPJuXib1EHExOfEoT1fsxzOJm5KnP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 16:41:07.4356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5c7482-f747-4eb9-6fad-08deed903052
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8825

Add HSMP_IOCTL_MSR_CMD to read a 64-bit MSR through /dev/hsmp, either on
a caller-chosen logical CPU or, with HSMP_MSR_ANY_CPU, on whichever CPU
the ioctl runs on. The read goes through rdmsrq_safe() and
rdmsrq_safe_on_cpu(), so an unimplemented MSR returns an error rather
than taking a #GP.

This lets a tool that is already talking to the HSMP mailbox read the
few core MSRs it needs to interpret what the mailbox reports, without
opening a second interface and without needing the CPU it queries to be
the one it happens to be running on.

Like the SMN read, the ioctl is read-only and requires CAP_SYS_RAWIO.
struct hsmp_msr_message carries a @write flag so write support could be
added later without changing the layout, and a request that sets it is
rejected with -EPERM regardless of privilege or open mode.

@value is placed after the two __u32 fields so it lands on an 8-byte
boundary, giving a tight 20-byte struct with the same wire layout on
32-bit and 64-bit userspace under the surrounding #pragma pack(4). The
value is staged through a u64 local rather than read straight into the
request struct, because that struct is packed to 4 bytes and its __u64
member is therefore not guaranteed to be 8-byte aligned. All three
reserved bytes are rejected when non-zero so a future kernel can
repurpose them without breaking deployed userspace.

A caller-supplied CPU index must refer to an online CPU, and is clamped
with array_index_nospec() before the IPI that carries the read reaches
per-CPU data, mitigating Spectre v1 (CVE-2017-5753). The CPU may go
offline between the check and the read; that races harmlessly, as
rdmsrq_safe_on_cpu() then fails.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 arch/x86/include/uapi/asm/amd_hsmp.h | 39 +++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 75 ++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 9c4ad22e47ae..32d269e41620 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -104,6 +104,38 @@ struct hsmp_smn_message {
 	__u8	reserved;
 };
 
+/*
+ * Sentinel for hsmp_msr_message.core_id meaning "read on the calling CPU"
+ * rather than scheduling the read on a specific logical CPU.
+ */
+#define HSMP_MSR_ANY_CPU	((__u32)-1)
+
+/**
+ * struct hsmp_msr_message - Request descriptor for the HSMP MSR read IOCTL
+ * @msr_address: Input. MSR index to read.
+ * @core_id:     Input. Logical CPU to read the MSR on, or HSMP_MSR_ANY_CPU to
+ *               read it on whichever CPU the ioctl runs on.
+ * @value:       Output. Populated by the kernel with the value read.
+ * @write:       Must be zero.  This IOCTL is read-only, so a request with
+ *               @write set is rejected with -EPERM whatever the caller's
+ *               privilege or open mode.  The field is kept so that write
+ *               support could be added later without changing the layout.
+ * @reserved:    Reserved for future use.  Callers must set every byte to zero;
+ *               a non-zero value is rejected with -EINVAL so future kernels
+ *               can repurpose the field without breaking deployed userspace.
+ *
+ * Placing @value after the two __u32 fields lands it on an 8-byte boundary, so
+ * under the surrounding #pragma pack(4) the struct is a tight 20 bytes with
+ * the same wire layout on 32-bit and 64-bit userspace.
+ */
+struct hsmp_msr_message {
+	__u32	msr_address;
+	__u32	core_id;
+	__u64	value;
+	__u8	write;
+	__u8	reserved[3];
+};
+
 enum hsmp_msg_type {
 	HSMP_RSVD = -1,
 	HSMP_SET  = 0,
@@ -698,6 +730,13 @@ struct hsmp_telemetry_data {
  */
 #define HSMP_IOCTL_SMN_CMD	_IOWR(HSMP_BASE_IOCTL_NR, 2, struct hsmp_smn_message)
 
+/*
+ * Read a 64-bit MSR on a given logical CPU.  Like the SMN read above this
+ * requires CAP_SYS_RAWIO and is encoded _IOWR because the value read is
+ * written back into the request struct.
+ */
+#define HSMP_IOCTL_MSR_CMD	_IOWR(HSMP_BASE_IOCTL_NR, 3, struct hsmp_msr_message)
+
 /*
  * Client HSMP messages supported on the Family 1Ah client platforms:
  * Models 80h-87h (Medusa1), Models 88h-8Fh (Olympic Ridge) and
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index ec11c5840b87..4467a0eb0224 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -9,10 +9,12 @@
 
 #include <asm/amd/hsmp.h>
 #include <asm/amd/node.h>
+#include <asm/msr.h>
 
 #include <linux/acpi.h>
 #include <linux/capability.h>
 #include <linux/cleanup.h>
+#include <linux/cpumask.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -21,6 +23,7 @@
 #include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/uaccess.h>
 
@@ -497,6 +500,76 @@ static long hsmp_ioctl_smn(struct file *fp, unsigned long arg)
 	return 0;
 }
 
+/*
+ * Read a 64-bit MSR, either on a caller-chosen logical CPU or on whichever CPU
+ * the ioctl happens to run on.
+ *
+ * Gated on CAP_SYS_RAWIO and read-only on the same terms as the SMN read
+ * above. No socket state is involved, so unlike that path this needs no
+ * serialisation against socket teardown.
+ */
+static long hsmp_ioctl_msr(struct file *fp, unsigned long arg)
+{
+	void __user *arguser = (void __user *)arg;
+	struct hsmp_msr_message msr;
+	u64 val;
+	int ret;
+
+	if (!capable(CAP_SYS_RAWIO))
+		return -EPERM;
+
+	/* The value read travels back in the request struct. */
+	if (!(fp->f_mode & FMODE_READ))
+		return -EPERM;
+
+	if (copy_from_user(&msr, arguser, sizeof(msr)))
+		return -EFAULT;
+
+	if (msr.write)
+		return -EPERM;
+
+	/*
+	 * Require the padding to be zero so that it stays available for
+	 * future fields.  Callers that leave garbage here would otherwise
+	 * have it misread as a request once the bytes gain a meaning.
+	 */
+	if (memchr_inv(msr.reserved, 0, sizeof(msr.reserved)))
+		return -EINVAL;
+
+	if (msr.core_id == HSMP_MSR_ANY_CPU) {
+		ret = rdmsrq_safe(msr.msr_address, &val);
+	} else {
+		unsigned int cpu;
+
+		if (msr.core_id >= nr_cpu_ids || !cpu_online(msr.core_id))
+			return -EINVAL;
+
+		/*
+		 * Sanitize the user-controlled CPU index against speculative
+		 * execution, as it reaches per-CPU data through the IPI that
+		 * carries the read (Spectre v1, CVE-2017-5753).  The CPU may
+		 * go offline between the check and the read; that races
+		 * harmlessly, as rdmsrq_safe_on_cpu() then fails.
+		 */
+		cpu = array_index_nospec(msr.core_id, nr_cpu_ids);
+		ret = rdmsrq_safe_on_cpu(cpu, msr.msr_address, &val);
+	}
+	if (ret)
+		return ret;
+
+	/*
+	 * Copy through a u64 local rather than reading straight into
+	 * msr.value: the request struct is packed to 4 bytes, so its __u64
+	 * member is not guaranteed to be 8-byte aligned.
+	 */
+	msr.value = val;
+
+	if (copy_to_user(arguser, &msr, sizeof(msr)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
@@ -689,6 +762,8 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		return hsmp_ioctl_get_telemetry(fp, arg);
 	case HSMP_IOCTL_SMN_CMD:
 		return hsmp_ioctl_smn(fp, arg);
+	case HSMP_IOCTL_MSR_CMD:
+		return hsmp_ioctl_msr(fp, arg);
 	default:
 		return -ENOTTY;
 	}
-- 
2.34.1

