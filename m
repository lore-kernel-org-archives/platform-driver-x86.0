Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0361D0974
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Sep 2024 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367148; cv=fail; b=dcdO6/mdMcCjry+dgPj/W/4uYiC2ioUSW/qyQlMi4SOHftT/Thp8jBFxhUjA7ETqhoR4coMpAM2fdlOtc1kqmSMZOR6gnjUqRrlLhUWskiNT/kZClsezW1NVCWHWWpUPw5S+rBY2vd/KFzcQ2siwk94O/wuMSJhWjbO28cR7VPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367148; c=relaxed/simple;
	bh=31d16paXPTGy/Bkgbz5vT0gtX2PvlOGJQWw1VbBbrFg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OU8r/CkRq8CpKRuXNKw72sJvHvtvFyzrD8sGkTzkhxSeFaLwgYI21XVLlPNa76+oVuWswPSkGNEhfqC8GR901V74YHhW1CQ7zyYtfzgvz4wsOFmgSw2Mo70nTmnTWXDDefgWuiswepE/06L5hxw7XNUqWYUFOyd2+SjTD3mDC94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Tf1OIJhy; arc=fail smtp.client-ip=40.107.237.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Tf1OIJhy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Da2iqmH3obX81xmN75lTMeYhS/2AeoAbnn2gfeB6oahH9Zw/1cKp+tVNvvN9//RpXcUny6ABxWhDMo+Bao3u7itqQlj0sTmebC1fmtOU/6XnchZ3ncu40S65fPFQtQxyzkZL8HAMU+5Cfd7rUKfwbDeY/CIsR8ZtVkfAfk0toBdbE/qCtSWXwiScTxc1/JU6nCbvMWXU5Kt8rHMz//aIRvlaYOxXAgYpjgf5KwMDFkkfHZL7b1tqkSIGA/qibjLDis+EK4gKgFqA9ioZ1ouDM1zy83Zy3cG5COeeRJzIAkfQFhIu9qERtgpvK8QyIoTToCEWZapQfBqIjdufOPGVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkBId9d+NPXnLOiM7mAvKPMSu0QgJSCX/rm78cfz4P0=;
 b=WL4KPA0NcCUg7LUgE3qOherLABOewF67+4BZ87RwNRWhMsn29Lb4V4fKcrUvMV9mDxhdWI+V65ptE7NOR3DLaHsowFOYTY3pYlHeTIe+elgKnDvumWXHdlbVKubCq4rXXCUqkgNmYfuUcQxOjiwwLHoQpk/lMgZqLChZIDKH99OX1XmwCGldU6y9NoFvEqXIVqZzlsWHmC4eetTVLQEx1ov2JxJIW33NMeI7pssA18cDtefuscC1LRJxEZn2/5MQYsLQRjKBJ08b/E1m+YYTohOL9UjPbcBhln57zalC26YVmZnw4UEKf1ztlhD8ayhaoKWu2bsTvciUp2ShXBY+3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkBId9d+NPXnLOiM7mAvKPMSu0QgJSCX/rm78cfz4P0=;
 b=Tf1OIJhy+UwmnbeifgrZdeCnZFNIPZo1HNBr/I3PDFZ5edn3ZXB9fQthCD8uMZc2WvOc2wag9sj9DojP5VtfMoyo8VddLLmutng9drst6++jgVXSLaot0gUGGvsu/tvdVOHVN1MQbkweFS6l3L91XVBdN1kX0mfR3gIBfmfeUyE=
Received: from BLAP220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::22)
 by CH3PR12MB8877.namprd12.prod.outlook.com (2603:10b6:610:170::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 3 Sep
 2024 12:38:58 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::29) by BLAP220CA0017.outlook.office365.com
 (2603:10b6:208:32c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 12:38:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 12:38:58 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 07:38:55 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v7 05/10] platform/x86/amd/hsmp: Move platform device specific code to plat.c
Date: Tue, 3 Sep 2024 12:38:25 +0000
Message-ID: <20240903123830.2717196-5-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240903123830.2717196-1-suma.hegde@amd.com>
References: <20240903123830.2717196-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|CH3PR12MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: 950d6ebe-bb23-4998-107a-08dccc1561a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVp3ZzRrcHpkUFNOY1J2eEgzdjA3eXdVSTY2dWx0cUlhWlE1ZFVRNGxmMlMw?=
 =?utf-8?B?RkZVNlRCbE5BcytmcW1aOFZhWHg5ejhSL3E5MWd4N25ERHA5ZHB0Z3RrdERk?=
 =?utf-8?B?MmRrZGNUQVJzTmZNYkdjRFJGVDNCZkNCZW9vMlJVd2xtSkRxcVBkQlVJMTNV?=
 =?utf-8?B?NlYvU09kamtWbTZReEhMQ29ERVZBdU10MU1Wd0s5WElNWDdzM3hvaGxZL2k0?=
 =?utf-8?B?bjRaSHNXMFJuOWEraTBIRDUyUjV6RVhVY1FJeUxJcmt3YzRGeS90VnhJTHBv?=
 =?utf-8?B?bmt5L3FjZ2RLVzRxdTA2NHFxQW1vdlMzZGM1OVpBOFhGRXJjTEl4ekxlSDMx?=
 =?utf-8?B?NXZwMXRoRktRYUEwaURvU2VxejU1djdpNVdZZWc2ZDJrWVVYaDIvdkVVVDNn?=
 =?utf-8?B?UVJ6V1REcDNwUTdnZFJndnFGZTVQeE0zem5vYisxOHU5aWZ4S0pudlFWc0Zy?=
 =?utf-8?B?bERoMTNKRkt6emNlS3VYVUpmK2tlV3VzUWhSM2xkeVlrdXdSbUlkNWZTdDBV?=
 =?utf-8?B?bDNqQWNkZDBlMFB4dDJ4c3dTUUtBZHAyNmtRV3dFRHBZZGo4anJ0SEhrclV5?=
 =?utf-8?B?UVc1Qkh3TXZ1YjlqdVN2YUtCQ2hIdG9BOEs1RTgvUGgzdGNtUDU2Z3VmNk9q?=
 =?utf-8?B?SWxNNE1wNlNsN3NEZit4VGtib1RQUXVoZFhKaHpZdXh3T0pwVjloZGJ6RGIz?=
 =?utf-8?B?NlJvZzdPQklHYXQxYTZNQUNMTForVHloYWxLbmlUdGJtU1MyazU3cS82ZHlI?=
 =?utf-8?B?KzBPanYvZXJ5UjFVSDFSNTRxbnd2ZVZEWWNtMVdFWVZ0eVFnd21rYVQ3MkV5?=
 =?utf-8?B?ZWxHVmFMY2hlYldLY01ST3NsaGF5SjJ2N0tkd2hnNXFFVU82TnVrR0d2WUIy?=
 =?utf-8?B?LzVvMVpram9EeWYvNHFLdVZuTGVZSkRMTnEvTjY2bFY2UXhRKzJPU2NNdVJS?=
 =?utf-8?B?Vy9JMnNwYWxOQmNrNHNrazF6cTRJM2dsK3RuVWVUcUo0cmdKcDNkNlRzSkhu?=
 =?utf-8?B?ZEdqYjBMRWdRdGhxQW1nUmI2QldrNnp0Vnd6Q05pSi9BdGVsd3VCeXZpYjl0?=
 =?utf-8?B?ckI4ZUtiSFJRZUdJOUE4SGNGNHg2YngwV3F3blQ0VTJrS1IzNkplbFRDNjNP?=
 =?utf-8?B?YVNRdFh3eTk0LzhFbVBpb0sxRW00bWx4Uk53ZlZiK0gyMmZQak51K3cwZE5K?=
 =?utf-8?B?MEFZTzF1d0tPMC9IREhjcmxhdCtZZlBjRGM0ZVBhRHZQM0lGNjVhNHpkaFBx?=
 =?utf-8?B?L2dSL01oZ0RQUmZyVTJRdmpjK3c3RmU1bEJGdTluVnVDY21TVEpBY0ovaExh?=
 =?utf-8?B?dTBTVzZWekJ3a1M2dk91aC9tL25hTVVCNjEwckk2QVJVb3hwZE5wUCs5byt6?=
 =?utf-8?B?NWVpTUpacUtwKzdNQzBFNmYvTlpPaFIrajFRYjhyMlNDL3YyR2cvR0M4OUgv?=
 =?utf-8?B?bXkvend3WDY0UHNXKzVwcTBVeHFlTWdNcmQya1UxV1FjVW5yc1RFbkhyaU5K?=
 =?utf-8?B?cWxtREFaekVyWTVFVXlPT3pqaTV4VVdOam5YdXJpUFJIMG1EZDAzRXRzMy9G?=
 =?utf-8?B?aEdZYlZNck9oRlV1a0pXazlVVnIreWhTZlhPdllGMU5Edit1SE5Ya1VaemZl?=
 =?utf-8?B?Zi9Lc3Nnam9aSzUzU1BSYXBkZzdvTGV0d0txNldVdDFIR2FJZjE0MGs3bzE5?=
 =?utf-8?B?L3NyY1lvU2pZODVMU2I0MjBFbEh5MXVLUEhIeFpObWw5QkRGL3dkdGdHd1Fz?=
 =?utf-8?B?dWh3MzRGeFordUFuM3VSaDhKNnlSTWIwVmVWYzB1QXhPMC9aNDlxZUgyeEdv?=
 =?utf-8?B?Rk1IVlhGdzc1SGtqWnlTYjhjUmlJMk5hOXgyZzVKMjR5akdyU2JwNHBTdE91?=
 =?utf-8?B?Yk5uQzFNU2N2RjFrMUt2aHR4UTdoTytxWnJWanYwVWN1OHZFRHM3UXZ0T2Ir?=
 =?utf-8?Q?3TAxUxOs8n3r9MROwIzvFbE/RcC9vTEm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 12:38:58.3170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 950d6ebe-bb23-4998-107a-08dccc1561a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8877

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
Changes since v6:
None

Changes since v5:
None

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

