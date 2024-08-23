Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E35013DB88
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2024 07:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724399780; cv=fail; b=hVPW2yPTb8ur5+PXFyEX3Hf+kzM0MIlNG7d0I/3ccc0rQV514j1NvyZG33R8i4BLJ4oGLWX7c5nbeX02hO/xShRtH3dl8rIFEvwFim5pR7SiiEuws4DGX6MYemQA9d4JQX3uujHgzkfqqx3UjJ440kACgPLysTJJSs+2UaekQTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724399780; c=relaxed/simple;
	bh=bWfL2/Wz1z4RwfPTenf4IFQS7BVxqRNyPchrTcB7TI4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D147o5WxAp3swjC9ddm3TQMBLOZ8qpNIuLD8jbNf0KyXrsXL3TeTdHOYZP8mTSDaX5OjC6TKDffhl0TngULRiVVkh+JNCC52ZN3wKkTtXH7kwJGu2+STN7uPdUzbjpKUkByUKC7ivKUPpa8iFKj98Lji26OMvSfg9Rj2ZhQVuDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LiAwZ5Qz; arc=fail smtp.client-ip=40.107.93.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LiAwZ5Qz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gm8FZY/dAQB+be7Xz3fK4SMwDNUb7eWz/Y8/mbedCdynXiNye/Pq67aq/gx3+gPYd48hPv01LxPl0xunW4m9tmnMhTdz/2n8gajT7nBchjHZDgDp6hqcpTFkTmIbzvmKCR67AGBtI8+60cS4OHC2FqRK2UGyuxMqxO+S8qPSkPUo9rS56s9Aqhhv4KEKZBRsBfnnoU8bnzLwWq/Svj4i06JWCELIg/aohitwb4Hk+LitXRTPHUPZOlDji6H+Vqtvr0NqxD9mtltQD6NgQSnsjyaOJmb0QA/6O3ln/l10pnpKoSfyCyPyR9mIltpxRFXMzp2qt11iHuSTjxKUE7I5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwv9H4mFaU7KEl0Hy/mCkoFe99RtBzV8yBC/e54b43E=;
 b=ZfAqjQmqRFJj+4V2DC6z7PbeLEAQW4zKATO6SZXK+9Ishf1lXwVUyxxjLbA3CmtTyy6IUpuodsS+cRMZKVha/lGUUKTtQiQ9n3i2v/otJvzsOIL4phF6npDgvNKukrlFa62vVsX93bYfjpYpMzYzueo2jpPXhD9j0nMzF3iCXpd+stBbVWCU1k/9rmXZuD/R7G64VZEY6W3tC344mzF+LRIqQ33xC16u4bERX7mlfmrIl+qRDbY4/SdCq16QWEeryN7EAON2g0LHiEtf8fzftbJ90MNNPQCouXzRpxp92ym0SUeWFxDRfX6PImnOe00NyutYhk5lF0pb0xvoIPOp0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwv9H4mFaU7KEl0Hy/mCkoFe99RtBzV8yBC/e54b43E=;
 b=LiAwZ5QzXqnRQjcNDZ0kGpv45B08HGp6wD0xUBCODZAaEfB+4KSoNw87i3sM0tCqYgX2wZyGPwhU5eYZEZgKhMGr05csIDbCxG6FJ812whZ3QibhS2WOKJAIEL0XzR08QzNHHpPVcFT2pu+P7rMWah4LIk0onIclVfhyypfwoCA=
Received: from SN6PR2101CA0015.namprd21.prod.outlook.com
 (2603:10b6:805:106::25) by CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Fri, 23 Aug
 2024 07:56:13 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:805:106:cafe::44) by SN6PR2101CA0015.outlook.office365.com
 (2603:10b6:805:106::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.9 via Frontend
 Transport; Fri, 23 Aug 2024 07:56:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 07:56:12 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 02:56:09 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v5 05/11] platform/x86/amd/hsmp: Move platform device specific code to plat.c
Date: Fri, 23 Aug 2024 07:55:37 +0000
Message-ID: <20240823075543.884265-5-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823075543.884265-1-suma.hegde@amd.com>
References: <20240823075543.884265-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|CH3PR12MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: fd208bee-6d55-484a-a0ed-08dcc3490ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEhOMStURGkxQWxqSitlY25QZHAramNsdE5GbEdKV051aGp3RnZLSnRKV3l1?=
 =?utf-8?B?T29xdkkxYlBac0ZzM3FJVzFUWEh1TzNOQ1doOEduejF0RzFGOVFhSnZqUWpR?=
 =?utf-8?B?UUlqRU9VTU9YVnhETC9yeXhLNjd0dW50dkVhZnovdGl1TlJqWlFhd01PY1dk?=
 =?utf-8?B?MUFPRWJTYXVRakZJV3hDM1lHQ0FCRGJpZ0g2dDJYU2FpSUZQdzRoaG9NOHhB?=
 =?utf-8?B?S2dvbXEyRm50Z0VrbXl0cjROQnozbFQ0WG52TXlvTjQ5RkZzRDkyNlFtY3NI?=
 =?utf-8?B?UXNOejRpTTNOWUJrRkZISzE5TlVIYy9CbnBpc29tTThxYmFhbERGZUx5Z1FQ?=
 =?utf-8?B?NCtHeFBWZWN5Q25QOTlqZHVUWG9mZEhjZVo1NVNUbUVLMkIvdDAydnB6U0VZ?=
 =?utf-8?B?TFoyMHJqSkVUOU5ZMkFxVzNlbkd2WC8vSDhjVVZZVzE1MjQwR3pQVDR0Z2NB?=
 =?utf-8?B?WXdiNThLVGQ2eGc4aC9pWTkxUzA4OFdUOG1UYVc3Y21KbHFUMU1HRURBclVL?=
 =?utf-8?B?UE5Qd0hrTDJHNXZ5TzdDdXJ6UXFvdG9jeW9BZis3dlg0a0c5Y1U1dDNuQXdB?=
 =?utf-8?B?cWFNSmVZbkhVYkpuUEJEamRVYXlRR1pPV2grdmh5V0M5MDVJcEk0RVBrS0M2?=
 =?utf-8?B?L0JLWGw5ZWoveWxoOGpEVTRzekFuemFkbEJaLzk5TUdUZ3BTOGRXS2tGTERz?=
 =?utf-8?B?Q2dUNUVSNDEwemlFbFNOM1RVUzJwTlBRZ3pLeTNYaWJkYVF3TlRKOUVNR3h6?=
 =?utf-8?B?d1dvaEdPaUhFT2lHMlJrZ1lnMGpGODRrRDVrSDVmM0FKd3ZvTGhmdWJSV2Fm?=
 =?utf-8?B?eEx6alZPOTFZOGJKVUlSdnhsQzltZHgzOW1Dc00zb2w0NmZHNUJFb3ppaEti?=
 =?utf-8?B?VEFoWDZYdDA4d0R5Ky9PeTIxZ29sa0FSSFdDY1pnbk54b1lsVUM1RWtzZWl5?=
 =?utf-8?B?cllvL3pON1BtdVJVbTBDSEVFZTV5YVorcThYOVhFM2xkSTVzM0tKUDBQaW01?=
 =?utf-8?B?RXB2OEpVdlROQVdZa0VheGZyc2Ezc1Y2dENtRlYyUlZ2ZzlFYWdGS1lWWmlD?=
 =?utf-8?B?SXpZbVp2bXJsVmhTV29WUVcxNGVuZXoreUdUdzdOR0dLeFJqcmxwZ0R1c1BI?=
 =?utf-8?B?ckdIQ2s1UXZMaGEyQWdOT1RnN2kzQmZIcTBQdXo5ZFYvL0pKMWg0d2o0SDhn?=
 =?utf-8?B?V1hLTGUrbG5GOHVuY0ZSbEdWMWlrL1ZIUVdlVTlDMUxOK3orRWZVM1ladlZQ?=
 =?utf-8?B?bkRLVnBlTmdhSitvMHVQWUhmcWhjRXlUK1hVSlVnYXRpNTh1eURGMkZONmNx?=
 =?utf-8?B?U3l6UWFmTmRFV1MvTENDeXhsdUNiR0lwNzY0QTRuOUpvcEkwY1hmSGg3cExi?=
 =?utf-8?B?Zm1tRGgzQXdENTFUeHNoV1VGZ3greEx6UmE1RExHV2FNUTd0ZzNLZDJzZGhi?=
 =?utf-8?B?WE5XYU1IR0hUMkIxYW5HdmdnTjljZGl0bTA4SVlnWEVMMGQvTFpocEtRN0pV?=
 =?utf-8?B?eldoSEk0UmxQMjJNRkhUZ2ZTc1lyS2FVKzYyRGRRcmswU28yZDg5c0lGSlNi?=
 =?utf-8?B?UnVzVU5UazdsRmhWSnZNem5CMmMxazdPM0s0NVpPZ0U1eCtKUjlsY0UyblhT?=
 =?utf-8?B?TEMvWU1CVGpCQ1VjWCtnYXo1dndlSnliUkJTUmxVOW1kRTROaVZQeWhYM3pI?=
 =?utf-8?B?SVV6dElFOU1JMm11aFppR0xORDRRT25QVVVIdTRtRktRWnJMSEJLbGVQVVFr?=
 =?utf-8?B?bmE5aksxcGRMKytZakJ1ZDQzOUJXN2hVMWFya3VOQTY3Rzg3bGc5MnltL2F5?=
 =?utf-8?B?SkxqMjJtb2VFM21YL1Q4YzI5Z3pCQnFKdXROeWJqMXdLQVZlWnFqWWx1L3Jl?=
 =?utf-8?B?aW1qOVVSS2pqUkVzeVU3TnNVR2RBT1IzNk4zOG1PTFRYMTA5aitaV1FWeTVF?=
 =?utf-8?Q?ysDdh9EQYxtAz/Ml0DOFDUO4q58CHt69?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:56:12.9101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd208bee-6d55-484a-a0ed-08dcc3490ee5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9194

An upcoming change splits HSMP driver into ACPI and platform device
variants. Prepare for the split by moving platform device part to plat.c.

No functinality/logical changes.
Common code which can be used by ACPI and platform device
remains in hsmp.c.
ACPI code in hsmp.c will be moved to acpi.c in next patch.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v4:
1. Update commit description.
2. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com> "

Changes since v3:
1. module init, exit code, probe, remove functions are kept back in hsmp.c
   not added to plat.c in this patch, as per review comment.

Changes since v2:
None

Changes since v1:
1. Include new header file device.h in plat.c
2. Arrange headers in alphabetical order
3. Add an empty line between asm/ and linux/ headers
 
 drivers/platform/x86/amd/hsmp/Makefile |   2 +-
 drivers/platform/x86/amd/hsmp/hsmp.c   | 138 ++-----------------------
 drivers/platform/x86/amd/hsmp/hsmp.h   |  14 +++
 drivers/platform/x86/amd/hsmp/plat.c   | 136 ++++++++++++++++++++++++
 4 files changed, 161 insertions(+), 129 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/plat.c

diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
index fda64906a5e8..fb8ba04b2f0d 100644
--- a/drivers/platform/x86/amd/hsmp/Makefile
+++ b/drivers/platform/x86/amd/hsmp/Makefile
@@ -5,4 +5,4 @@
 #
 
 obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
-amd_hsmp-objs			:= hsmp.o
+amd_hsmp-objs			:= hsmp.o plat.o
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 9ed1fc0aeb00..6da7c6189020 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -16,7 +16,6 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
-#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
@@ -40,45 +39,12 @@
 #define HSMP_WR			true
 #define HSMP_RD			false
 
-/*
- * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
- * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
- * Below are required SMN address for HSMP Mailbox register offsets in SMU address space
- */
-#define SMN_HSMP_BASE		0x3B00000
-#define SMN_HSMP_MSG_ID		0x0010534
-#define SMN_HSMP_MSG_ID_F1A_M0H	0x0010934
-#define SMN_HSMP_MSG_RESP	0x0010980
-#define SMN_HSMP_MSG_DATA	0x00109E0
-
-#define HSMP_INDEX_REG		0xc4
-#define HSMP_DATA_REG		0xc8
-
 /* These are the strings specified in ACPI table */
 #define MSG_IDOFF_STR		"MsgIdOffset"
 #define MSG_ARGOFF_STR		"MsgArgOffset"
 #define MSG_RESPOFF_STR		"MsgRspOffset"
 
-static struct hsmp_plat_device plat_dev;
-
-static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
-			     u32 *value, bool write)
-{
-	int ret;
-
-	if (!sock->root)
-		return -ENODEV;
-
-	ret = pci_write_config_dword(sock->root, HSMP_INDEX_REG,
-				     sock->mbinfo.base_addr + offset);
-	if (ret)
-		return ret;
-
-	ret = (write ? pci_write_config_dword(sock->root, HSMP_DATA_REG, *value)
-		     : pci_read_config_dword(sock->root, HSMP_DATA_REG, value));
-
-	return ret;
-}
+struct hsmp_plat_device plat_dev;
 
 static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
 			      u32 *value, bool write)
@@ -248,7 +214,7 @@ int hsmp_send_message(struct hsmp_message *msg)
 }
 EXPORT_SYMBOL_GPL(hsmp_send_message);
 
-static int hsmp_test(u16 sock_ind, u32 value)
+int hsmp_test(u16 sock_ind, u32 value)
 {
 	struct hsmp_message msg = { 0 };
 	int ret;
@@ -516,9 +482,9 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	return hsmp_read_acpi_dsd(sock);
 }
 
-static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
-				    struct bin_attribute *bin_attr, char *buf,
-				    loff_t off, size_t count)
+ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
+			     struct bin_attribute *bin_attr, char *buf,
+			     loff_t off, size_t count)
 {
 	struct hsmp_socket *sock = bin_attr->private;
 	struct hsmp_message msg = { 0 };
@@ -577,8 +543,8 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
 	return 0;
 }
 
-static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-					 struct bin_attribute *battr, int id)
+umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+				  struct bin_attribute *battr, int id)
 {
 	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
@@ -607,8 +573,8 @@ static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock
 /* One bin sysfs for metrics table */
 #define NUM_HSMP_ATTRS		1
 
-static int hsmp_create_attr_list(struct attribute_group *attr_grp,
-				 struct device *dev, u16 sock_ind)
+int hsmp_create_attr_list(struct attribute_group *attr_grp,
+			  struct device *dev, u16 sock_ind)
 {
 	struct bin_attribute **hsmp_bin_attrs;
 
@@ -624,36 +590,6 @@ static int hsmp_create_attr_list(struct attribute_group *attr_grp,
 	return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
 }
 
-static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
-{
-	const struct attribute_group **hsmp_attr_grps;
-	struct attribute_group *attr_grp;
-	u16 i;
-
-	hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
-				      sizeof(*hsmp_attr_grps),
-				      GFP_KERNEL);
-	if (!hsmp_attr_grps)
-		return -ENOMEM;
-
-	/* Create a sysfs directory for each socket */
-	for (i = 0; i < plat_dev.num_sockets; i++) {
-		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
-					GFP_KERNEL);
-		if (!attr_grp)
-			return -ENOMEM;
-
-		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
-		attr_grp->name			= plat_dev.sock[i].name;
-		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
-		hsmp_attr_grps[i]		= attr_grp;
-
-		hsmp_create_attr_list(attr_grp, dev, i);
-	}
-
-	return device_add_groups(dev, hsmp_attr_grps);
-}
-
 static int hsmp_create_acpi_sysfs_if(struct device *dev)
 {
 	struct attribute_group *attr_grp;
@@ -677,7 +613,7 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
 	return devm_device_add_group(dev, attr_grp);
 }
 
-static int hsmp_cache_proto_ver(u16 sock_ind)
+int hsmp_cache_proto_ver(u16 sock_ind)
 {
 	struct hsmp_message msg = { 0 };
 	int ret;
@@ -693,60 +629,6 @@ static int hsmp_cache_proto_ver(u16 sock_ind)
 	return ret;
 }
 
-static inline bool is_f1a_m0h(void)
-{
-	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
-		return true;
-
-	return false;
-}
-
-static int init_platform_device(struct device *dev)
-{
-	struct hsmp_socket *sock;
-	int ret, i;
-
-	for (i = 0; i < plat_dev.num_sockets; i++) {
-		if (!node_to_amd_nb(i))
-			return -ENODEV;
-		sock = &plat_dev.sock[i];
-		sock->root			= node_to_amd_nb(i)->root;
-		sock->sock_ind			= i;
-		sock->dev			= dev;
-		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
-		sock->amd_hsmp_rdwr		= amd_hsmp_pci_rdwr;
-
-		/*
-		 * This is a transitional change from non-ACPI to ACPI, only
-		 * family 0x1A, model 0x00 platform is supported for both ACPI and non-ACPI.
-		 */
-		if (is_f1a_m0h())
-			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID_F1A_M0H;
-		else
-			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
-
-		sock->mbinfo.msg_resp_off	= SMN_HSMP_MSG_RESP;
-		sock->mbinfo.msg_arg_off	= SMN_HSMP_MSG_DATA;
-		sema_init(&sock->hsmp_sem, 1);
-
-		/* Test the hsmp interface on each socket */
-		ret = hsmp_test(i, 0xDEADBEEF);
-		if (ret) {
-			dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
-				boot_cpu_data.x86, boot_cpu_data.x86_model);
-			dev_err(dev, "Is HSMP disabled in BIOS ?\n");
-			return ret;
-		}
-		ret = hsmp_cache_proto_ver(i);
-		if (ret) {
-			dev_err(dev, "Failed to read HSMP protocol version\n");
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
 static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
 	{ACPI_HSMP_DEVICE_HID, 0},
 	{}
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index d54b9681d514..d59a9efb4799 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -55,4 +55,18 @@ struct hsmp_plat_device {
 	bool is_acpi_device;
 	bool is_probed;
 };
+
+extern struct hsmp_plat_device plat_dev;
+
+ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
+			     struct bin_attribute *bin_attr, char *buf,
+			     loff_t off, size_t count);
+int hsmp_create_non_acpi_sysfs_if(struct device *dev);
+int hsmp_cache_proto_ver(u16 sock_ind);
+umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+				  struct bin_attribute *battr, int id);
+int hsmp_create_attr_list(struct attribute_group *attr_grp,
+			  struct device *dev, u16 sock_ind);
+int hsmp_test(u16 sock_ind, u32 value);
+int init_platform_device(struct device *dev);
 #endif /* HSMP_H */
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
new file mode 100644
index 000000000000..85a104859acd
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD HSMP Platform Driver
+ * Copyright (c) 2024, AMD.
+ * All Rights Reserved.
+ *
+ * This file provides platform device implementations.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <asm/amd_nb.h>
+
+#include <linux/device.h>
+#include <linux/pci.h>
+#include <linux/sysfs.h>
+
+#include "hsmp.h"
+
+/*
+ * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
+ * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
+ * Below are required SMN address for HSMP Mailbox register offsets in SMU address space
+ */
+#define SMN_HSMP_BASE		0x3B00000
+#define SMN_HSMP_MSG_ID		0x0010534
+#define SMN_HSMP_MSG_ID_F1A_M0H	0x0010934
+#define SMN_HSMP_MSG_RESP	0x0010980
+#define SMN_HSMP_MSG_DATA	0x00109E0
+
+#define HSMP_INDEX_REG		0xc4
+#define HSMP_DATA_REG		0xc8
+
+static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
+			     u32 *value, bool write)
+{
+	int ret;
+
+	if (!sock->root)
+		return -ENODEV;
+
+	ret = pci_write_config_dword(sock->root, HSMP_INDEX_REG,
+				     sock->mbinfo.base_addr + offset);
+	if (ret)
+		return ret;
+
+	ret = (write ? pci_write_config_dword(sock->root, HSMP_DATA_REG, *value)
+		     : pci_read_config_dword(sock->root, HSMP_DATA_REG, value));
+
+	return ret;
+}
+
+int hsmp_create_non_acpi_sysfs_if(struct device *dev)
+{
+	const struct attribute_group **hsmp_attr_grps;
+	struct attribute_group *attr_grp;
+	u16 i;
+
+	hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
+				      sizeof(*hsmp_attr_grps),
+				      GFP_KERNEL);
+	if (!hsmp_attr_grps)
+		return -ENOMEM;
+
+	/* Create a sysfs directory for each socket */
+	for (i = 0; i < plat_dev.num_sockets; i++) {
+		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
+					GFP_KERNEL);
+		if (!attr_grp)
+			return -ENOMEM;
+
+		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
+		attr_grp->name			= plat_dev.sock[i].name;
+		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
+		hsmp_attr_grps[i]		= attr_grp;
+
+		hsmp_create_attr_list(attr_grp, dev, i);
+	}
+
+	return device_add_groups(dev, hsmp_attr_grps);
+}
+
+static inline bool is_f1a_m0h(void)
+{
+	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
+		return true;
+
+	return false;
+}
+
+int init_platform_device(struct device *dev)
+{
+	struct hsmp_socket *sock;
+	int ret, i;
+
+	for (i = 0; i < plat_dev.num_sockets; i++) {
+		if (!node_to_amd_nb(i))
+			return -ENODEV;
+		sock = &plat_dev.sock[i];
+		sock->root			= node_to_amd_nb(i)->root;
+		sock->sock_ind			= i;
+		sock->dev			= dev;
+		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
+		sock->amd_hsmp_rdwr		= amd_hsmp_pci_rdwr;
+
+		/*
+		 * This is a transitional change from non-ACPI to ACPI, only
+		 * family 0x1A, model 0x00 platform is supported for both ACPI and non-ACPI.
+		 */
+		if (is_f1a_m0h())
+			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID_F1A_M0H;
+		else
+			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
+
+		sock->mbinfo.msg_resp_off	= SMN_HSMP_MSG_RESP;
+		sock->mbinfo.msg_arg_off	= SMN_HSMP_MSG_DATA;
+		sema_init(&sock->hsmp_sem, 1);
+
+		/* Test the hsmp interface on each socket */
+		ret = hsmp_test(i, 0xDEADBEEF);
+		if (ret) {
+			dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
+				boot_cpu_data.x86, boot_cpu_data.x86_model);
+			dev_err(dev, "Is HSMP disabled in BIOS ?\n");
+			return ret;
+		}
+
+		ret = hsmp_cache_proto_ver(i);
+		if (ret) {
+			dev_err(dev, "Failed to read HSMP protocol version\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
-- 
2.25.1

