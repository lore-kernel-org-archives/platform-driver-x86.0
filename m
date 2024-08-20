Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946B518C01D
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Aug 2024 10:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149822; cv=fail; b=sOmGlu3zc4smaorhRTz4ENWb3/bOGekDm02VrdpYRiwqfTKET0ZiDn4N2OCnYt8JV3dXrhCr4AkVT84RMqQQZSq7ijgjgvE5fNC9uO7pA//kNGvzRTmKmeIEQD/bAG9rWkW+lpcRzvF1jTfDQyDb3ds52X65jSWSS8d12zD243U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149822; c=relaxed/simple;
	bh=LgX3Y2b5lAwYlSTyFZwlUcLTFl5ovjJ47NLdjXaOj1o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D3HuS0zGeIxsIUjL10VGRZqejz6JAfL1WEBT1tNmcbubH6O8rAVBOhM/aHlNgdLvl6XbJ2I1HCbXIrBNd3FYXhsMb/goYjhNz62AzoWlH9lsb4eCmIYphoHKDiCsorqdHnX4LLZfTqyE6TR32WOLqqz2UBBav5/TA53rNTj88Vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=asvkB67S; arc=fail smtp.client-ip=40.107.92.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="asvkB67S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mj7eJpU4mMOxS9kv511BhrcuWMVN9Z85LH+69RW/b4PbVmO7ZpAk9eGd0GSee9Fa2qF5M6rbyQ3SHHn+0JfJ6SSoDEipKhTZHb7Hm+wnjkKCQKoaJuVHG8P34B3JhJYtPU9WgOwOL7oqiE765OcSEmo2ZHlIEysqofPH1VFTWxTaxkx9GOfEe01mocSyzrEcfmHxehw9SoFS2VioNjUTarx94Imcg+MCcKWE8q8qeLbB1WdrX32+qmqylJckQkRwbHgs+7WjptcAGtIAXCLPgQSo5W0vshc/rT8Y3ZqwhSrxG0wqPxYdJa1gOQyKQJptRucgWIH3tJk0jh8Ir2/DCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tAhZuq9wTA0AMU+Ud+1a7N81bipgN34Bd/Lr9nNYgY=;
 b=XhRmy0IeIUfus+XzbDuzqElCFy1jc8rpmJ942aAhGbE57HFC2cy7SU/Hzqbb48HKbB/7QeRFXXt99ouOOyPW4MjUuLqxApwzFBh5e/y1unuY+jnPvpxlG1ZQLki59XH7WeH+HPH5mkXYAqJ1CFqJFTjl0uwQCQ48cCYeAJ/xXCZlaNq+WjR5r51W3U/AumwSRilP4QY0LMH+b1Wu4el2C36H9UecTXZA2/eVarDZXvFKI5YSPpBjBv1XTEyHO2hqfczk6iTu6p00FrFe7tOc+vrE4EsvP1z0ldHkxpDpqOWrpszZ6YIvpc/pRzW63+bYql5XkWdQngSfaKojxd0uqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tAhZuq9wTA0AMU+Ud+1a7N81bipgN34Bd/Lr9nNYgY=;
 b=asvkB67S4+jV6lO4BKRfhP3GJiDL1phAITOrHS0JZwkDgiS3uxuOYuCEDN6ZoM9vykyxG1e/bOP0RVNEbNwZrMzsFqxTtHF9r6R3sjq2c0puJso7+kIsg1hO0GXqpADelzr2SkzK1dPtnG5IEBtNScWvwDTgKgNW+E0AV+SHLlU=
Received: from BY5PR04CA0030.namprd04.prod.outlook.com (2603:10b6:a03:1d0::40)
 by PH8PR12MB7135.namprd12.prod.outlook.com (2603:10b6:510:22c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 10:30:13 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::3f) by BY5PR04CA0030.outlook.office365.com
 (2603:10b6:a03:1d0::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Tue, 20 Aug 2024 10:30:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 10:30:12 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 05:30:09 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v4 05/11] platform/x86/amd/hsmp: Move platform device specific code to plat.c
Date: Tue, 20 Aug 2024 10:29:35 +0000
Message-ID: <20240820102941.1813163-5-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240820102941.1813163-1-suma.hegde@amd.com>
References: <20240820102941.1813163-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|PH8PR12MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: de02fccc-e194-4a5d-0e85-08dcc103133c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xy0ZRS9TzqrsL0h5bR/1XHzuwzXVPfBeOa1r/N20ieb/KPmMOFeA/dD3QGSx?=
 =?us-ascii?Q?zbgWUTFt5Mq80BsCrse8yyCiGChqjFvAhAyQsVAsfpgV047ciPpDtaBRtGQ+?=
 =?us-ascii?Q?T0tyFJrhRc5Qbu9iC2nAwyLanv0pITxyvPi7vD90n1DnLitaeAlnf2Y7R0ez?=
 =?us-ascii?Q?mEG+oWAjUkuC/tgOfUeLtRbh+kccs5+eE4y55D46ihiFo8EZ5EHbYjBPK+jL?=
 =?us-ascii?Q?v8Romiil8bWPHxwVvVyuqAS4d92y+LsLRRw/miwIEXcgfZPZEZlE5Ix6BZ56?=
 =?us-ascii?Q?9mCI32IyT58VrpfnCDTouvFVXzyofnNgt2vdu5eurO3oK+2YTbmpl/c95ZPw?=
 =?us-ascii?Q?u93jFXgtL7ITCZltqjXMI3OyASDwd2JGGxycMqSiVmZBnNvKaZyiAv83NDv0?=
 =?us-ascii?Q?z+mF1H5wC6I6baB/QLKC189FaRGXQ/uuUbls2d2WJ2hPfP5kCYr9HXe2zV3y?=
 =?us-ascii?Q?8d+DvwgwSekdO6wUdynK6fdD073sXhxkLKwvp7o7rkolpanuelVtnnyywENB?=
 =?us-ascii?Q?BtSKYrlFOSyq6X1jvWusDXLCSXubdULOuryz3nHFbJE4NRraju4xDXVC/ixv?=
 =?us-ascii?Q?tmRqWMUSEbQs/6VyjduCyDMRxEIvk4Aly0oGUJEqzwODZI+xmWcA2tLzivpY?=
 =?us-ascii?Q?M994xOCh61GIEOfF7IEjn+4fOf6bxxvRPTyAMvpmGwkHSgXN2QiZ0GdH3KWa?=
 =?us-ascii?Q?AieSkcj1HiFZRq1IjSpCBcGIoytFxq1u0/WGFKRCiT/mkumZJMnXpctJeDKb?=
 =?us-ascii?Q?pf1nRa7QjD5913gBUzKNHRvuQ9cNeNpZhUtE3ygVf0IKhKyz10enBi/6m2E0?=
 =?us-ascii?Q?2lYcYD7Pf4MawzEzfraJsAJ8z/M+n6JO2qiJLAqkAecedtTqfSTPV5sCwIGA?=
 =?us-ascii?Q?tHns7nytTjdo4G68UlzJhk5hWWfDh4uBEsuLfYl4HxTWfxPDNFsbWmPa6Ocn?=
 =?us-ascii?Q?eYI+rCYX4Y+B+0ToxMKYDZdKyQhBejn4RJ2pXPEkVm1NhNnOWkMI3pErFBEw?=
 =?us-ascii?Q?Rt20be1NhLTgl7YLnZfIN8d55gQXAURu9EMUPM7D6xZysPoTmFJbbvR8g1IR?=
 =?us-ascii?Q?vJjj0zx+39ZLoOhqTr3brZEJVuwGSZy+LLBBesodLFJ+/VPn9utbzgMPChCl?=
 =?us-ascii?Q?d/WBHZfyrZ4UJmPcPoFDHCyEX82nyeiEn+VCQ4QbJKWgMpmJHOGwSUrW1e0G?=
 =?us-ascii?Q?HBsrO8kr6Phl8dVbC42E4N+DPhWztB0O7ss2ITiDuAsTxIM0117QlroeCvxw?=
 =?us-ascii?Q?9N8QQ4PYZ69uSXkKOu5G4XJnotIOWPASJ0Bn9wo957WqGCAETgAVqiBl7aOh?=
 =?us-ascii?Q?e6yknznl2NY6tqw9vOt1LCiF7idAXfH2ZkPPIGfPs07yYNnIGbM7xLAUjkd8?=
 =?us-ascii?Q?oRD93D+b5GNHBEd62PbMZzt/zOoOkmstUh6bULZrgJY80TxJphENzTQ8eeJ1?=
 =?us-ascii?Q?3RECVu7qMZRQf7D1LTlqT75cUuL8GvHE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 10:30:12.9814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de02fccc-e194-4a5d-0e85-08dcc103133c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7135

Move platform device part to plat.c.

No functinality/logical changes.
Common code which can be used by ACPI and platform device
remains in hsmp.c.
ACPI code in hsmp.c will be moved to acpi.c in next patch.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
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

