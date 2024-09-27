Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A37318C919
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Sep 2024 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727438428; cv=fail; b=KQrzG3uTfVkr+SPFQaVc2ba364rvF4d7XJwUdgqVyzNE0wTFuSYm4IHUTFo0Xq6hDfDeC2TyiYASLTLUivXydAbhBzNh280KlT/QwiDAF8aN4FvnpvZN9WvybfBk1ZKa8x1990/USQA2gIyoulXeGS33AqRnJ30l5K7shsRp/dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727438428; c=relaxed/simple;
	bh=5oBKjabA2YdytiFu5wEDB4lxNiHBiES2qrXvztj16AI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pCTUNDoDsk7gUR7R4iWt3mfIv3xpre7NgU0uUxOhZ0TrmTh5NEFiM3S2kddBGvTtFTGzYm7ViovLrrt25MaTsuxkyrjn0OimiVnlmyxS2iqBO3X10AOMRcO9OenRyXxIj37pM9dLMy31uKNn5N4QMOcP1B96JHSiuizHJUddmS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HDN7pTHe; arc=fail smtp.client-ip=40.107.236.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HDN7pTHe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sB9H3Ak+JpG+SeM+MO/hp7/0WFUUZljA8T+6fEab8F4BrPqiCAv8OJ9pcCFt85stjy7trC2GcGJV7lv7AqknZtWYZ8fND4zAlD8shGE8XBmlIUXfX3Kk1B4lUoIrOs5Lr9z1NfAyfo7BM6H1QjRUtj7k5uJrgQ5KNrpE29udWZrKQg9dATm7jyJHAARy2L7dXEv3wuHSj27sZCDeSQKsii+1WHqGDlO2BzpYIjCajBRn3GL1P4U6Hov2lyMQt96VESFz+3hZuhlt2en+Cj43FbHNU17Dam1iMsceQd2/P5c3usj14L7rMoi5JmsuOq/oC+JIqRYano/2hObTcthuRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdUPzNSAjpC/zSuhS/WkNl/Dbxeep8bxj1VA6jiwEqI=;
 b=LXdnmiYezXYFkQ0OQpA73zh9WZ5xgAxAaoMcdS162fKUQ0geD0m2n+URq9B4fMcUVOfuIT7wQG4P9atF8OCNpjoaM0XAzlhDw1aCHqVl3+M0wVbpmesmkQ/AQc9MZ8axklcuiXu4HQiSCcKIGX9PEko9dSJrjdzuQijMgQX4Kp9E+O9z8ydRcBhBhPYEl9GehIimPEOcwXQhdvOshmaFXwioUZtNoxStdtxDoZW9TcJ1n7oEBSaTtFtu/gWa6+5MrhzGiMAJA2fGNlzzWzo2OK7wvXh5MDV2gf83qPvCfl/RboDUlWhCtdXo0IZECzCLaxy4a3NRu6vN8F3UoVOMWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdUPzNSAjpC/zSuhS/WkNl/Dbxeep8bxj1VA6jiwEqI=;
 b=HDN7pTHeU5tLsGxJYInOqKxQ0xVRvuVLs6reBRiRXJApKVO5ielrBN0LClVN0bvb20Y9jC6dz689LLu0r7E3Iw6rgmlqdcC7fkRnMEon+hdFKqsENXACrjCew4y5FNxYH62bnvSLs2EzQ4J7Dw9dkyaNolwqCNfVBpzHQFhshtg=
Received: from PH2PEPF0000385C.namprd17.prod.outlook.com (2603:10b6:518:1::6a)
 by PH7PR12MB6491.namprd12.prod.outlook.com (2603:10b6:510:1f4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Fri, 27 Sep
 2024 12:00:17 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2a01:111:f403:f90e::3) by PH2PEPF0000385C.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22 via Frontend
 Transport; Fri, 27 Sep 2024 12:00:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 12:00:17 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 07:00:15 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v8 11/11] platform/x86/amd/hsmp: Make hsmp_pdev static instead of global
Date: Fri, 27 Sep 2024 11:59:21 +0000
Message-ID: <20240927115921.10909-11-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927115921.10909-1-suma.hegde@amd.com>
References: <20240927115921.10909-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|PH7PR12MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: f2aedb5a-b7e0-461c-bd39-08dcdeebf44f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6u8m09aYl78y0vJh+Mf9cF6NFZJ7Zj0SzRgDI9XNxURjS3V8FCwAB4hUwWJR?=
 =?us-ascii?Q?L+UbhWA4JYelKIkp8yvcbtDTL5X1IZ5ITrL4bpvnQHjWoGyJdj3/50EE5l7A?=
 =?us-ascii?Q?gFt3kegTfa4fag4hNyAYKyQ/5zWHXf6EumJACgR782QBwx1kD6+YTrc+0EZ9?=
 =?us-ascii?Q?Xo0FGbGVnOVChlc9RZdHprp5YTla0slTIAmjOYx8A/oub8HDrzWlBVxcBP2q?=
 =?us-ascii?Q?NLDOSGd5ZizYi8X5/8sBCDDc8t1lwpempKHaIVgLd9yju5Tb+XuMyYDSZH5T?=
 =?us-ascii?Q?vCiK73jYNnCK8nLearq7g0Ql1tkDsV8ifAU9SLSKbue91Cr4pVdptlCd6ZOd?=
 =?us-ascii?Q?2iGdmAjjAxVuMgOBDvBvMtcYc5cMezSjYLGsLoUgIsPGdr8V5gTJsEcMnN36?=
 =?us-ascii?Q?lGMzkpa+VJUGQrIcRSWGomj+iWYLmhwkf9rFpiHGojqKB8UtfJ48Ea796TfM?=
 =?us-ascii?Q?AJmabk5lCwRnZu23Wozu11LUvztPZz9BhxGV4tCFKKg6GehragjE08vgZ347?=
 =?us-ascii?Q?AYYAQYtwjdkpz4K0p0mSRq1NjRePd0dJ3Z8Ze9IL+sjkx0h8ToT1U4KmzEjs?=
 =?us-ascii?Q?dvNSy7KeQY1rcTllsRyklWcmdwfRTNH2gtXvWry8hXPrRuV4Pc0EalBF4MKt?=
 =?us-ascii?Q?DblfQEeVqxRZEq29OJjp4ucY1cnac1c7/AkQml6VTP8BpjLLbode80MhLJA8?=
 =?us-ascii?Q?WwIM6a0FvmdFNvekADrLPjH19zKbcnXdscsyKlOwDUApuoMruyM3U3Bj4Gga?=
 =?us-ascii?Q?O+J1+FVXBPpTf6Z+dBfLF9cDvblGd8sE/Iidcw/ucnOwq+i55D7KwAtC44it?=
 =?us-ascii?Q?oOnu25VsXQ31hihSaMlcgG2GZ8qI6YJSsKUCm60Rl/+O9TpGc8qSdjKfXYv7?=
 =?us-ascii?Q?lUacAsMxfMkgzK2IxS8SoIjVp8lk9/LY4QlzIiWGgMqp0iCVH9Q2mBGiWV+s?=
 =?us-ascii?Q?oMCFqWxw9CQGGlfVhTu9qM7BY/wb92uOOOvXDYp5+/iVDRdIpHewbULH1aQ8?=
 =?us-ascii?Q?6Hw6D5d7FdhKXEgnf4x+cOz1mbJbKD5h1Q+XNDxGsMfRhojZKf1wnIa4yocV?=
 =?us-ascii?Q?26Ecsc/ZfRQ2Nsje3bZgb3SJRT8tkGEyW/LQY9mXbxETlc5EHO4d2SqUlqJx?=
 =?us-ascii?Q?dhfBy+ioeytAhjQgYPPPLmTv/nxhc8Dk0HV7D6ZXZ1ie+kxIdgqvXirQDWBi?=
 =?us-ascii?Q?HPL+hBwtF2iKXTuuYZ/NrjHH8c8mHd1+IllTEXJTHPAx2RBhbwLglQvWOa8q?=
 =?us-ascii?Q?VBlN4cUJ5pXLQjlZ1UF+kqQVWSz4lL1WPWS192OCL2numf+2NX5Id2L1EQYV?=
 =?us-ascii?Q?1vfu8ZXzJupgMBX5O3Hztkpfk6jyQ9zdR6PAQxD5IV8H8QbUsb/hpDTfUvvl?=
 =?us-ascii?Q?U0rACOsuYttLE4eZimTBweTkq38cqDVJf1YFvp0LKOmEprOSSnfSAUDzGMy8?=
 =?us-ascii?Q?ontDp5R8PxrK235fMe7A9b9Qx/at7ls+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 12:00:17.6377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2aedb5a-b7e0-461c-bd39-08dcdeebf44f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6491

Instead of making hsmp_pdev global and exporting this symbol from hsmp.c,
make it static and create a wrapper function get_hsmp_pdev() to access
hsmp_pdev from plat.c and acpi.c.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v7
New patch

 drivers/platform/x86/amd/hsmp/acpi.c | 36 ++++++++++++++++------------
 drivers/platform/x86/amd/hsmp/hsmp.c |  9 +++++--
 drivers/platform/x86/amd/hsmp/hsmp.h |  3 +--
 drivers/platform/x86/amd/hsmp/plat.c | 32 +++++++++++++++----------
 4 files changed, 48 insertions(+), 32 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 9435e40bbf25..360b7789b192 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -35,6 +35,8 @@
 #define MSG_ARGOFF_STR		"MsgArgOffset"
 #define MSG_RESPOFF_STR		"MsgRspOffset"
 
+static struct hsmp_plat_device *hsmp_pdev;
+
 static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
 			      u32 *value, bool write)
 {
@@ -203,7 +205,7 @@ static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
 /* Parse the ACPI table to read the data */
 static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 {
-	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
+	struct hsmp_socket *sock = &hsmp_pdev->sock[sock_ind];
 	int ret;
 
 	sock->sock_ind		= sock_ind;
@@ -236,7 +238,7 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj
 static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 					 struct bin_attribute *battr, int id)
 {
-	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
+	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
 
 	return 0;
@@ -250,7 +252,7 @@ static int init_acpi(struct device *dev)
 	ret = hsmp_get_uid(dev, &sock_ind);
 	if (ret)
 		return ret;
-	if (sock_ind >= hsmp_pdev.num_sockets)
+	if (sock_ind >= hsmp_pdev->num_sockets)
 		return -EINVAL;
 
 	ret = hsmp_parse_acpi_table(dev, sock_ind);
@@ -274,7 +276,7 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6) {
+	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_err(dev, "Failed to init metric table\n");
@@ -314,15 +316,19 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 {
 	int ret;
 
-	if (!hsmp_pdev.is_probed) {
-		hsmp_pdev.num_sockets = amd_nb_num();
-		if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
+	hsmp_pdev = get_hsmp_pdev();
+	if (!hsmp_pdev)
+		return -ENOMEM;
+
+	if (!hsmp_pdev->is_probed) {
+		hsmp_pdev->num_sockets = amd_nb_num();
+		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_SOCKETS)
 			return -ENODEV;
 
-		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
-					      sizeof(*hsmp_pdev.sock),
-					      GFP_KERNEL);
-		if (!hsmp_pdev.sock)
+		hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
+					       sizeof(*hsmp_pdev->sock),
+					       GFP_KERNEL);
+		if (!hsmp_pdev->sock)
 			return -ENOMEM;
 	}
 
@@ -332,11 +338,11 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (!hsmp_pdev.is_probed) {
+	if (!hsmp_pdev->is_probed) {
 		ret = hsmp_misc_register(&pdev->dev);
 		if (ret)
 			return ret;
-		hsmp_pdev.is_probed = true;
+		hsmp_pdev->is_probed = true;
 	}
 
 	return 0;
@@ -348,9 +354,9 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
 	 * We register only one misc_device even on multi-socket system.
 	 * So, deregister should happen only once.
 	 */
-	if (hsmp_pdev.is_probed) {
+	if (hsmp_pdev->is_probed) {
 		hsmp_misc_deregister();
-		hsmp_pdev.is_probed = false;
+		hsmp_pdev->is_probed = false;
 	}
 }
 
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 7c3fb090684f..82d8ba2e1204 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -35,8 +35,7 @@
 
 #define DRIVER_VERSION		"2.3"
 
-struct hsmp_plat_device hsmp_pdev;
-EXPORT_SYMBOL_NS_GPL(hsmp_pdev, AMD_HSMP);
+static struct hsmp_plat_device hsmp_pdev;
 
 /*
  * Send a message to the HSMP port via PCI-e config space registers
@@ -384,6 +383,12 @@ void hsmp_misc_deregister(void)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_misc_deregister, AMD_HSMP);
 
+struct hsmp_plat_device *get_hsmp_pdev(void)
+{
+	return &hsmp_pdev;
+}
+EXPORT_SYMBOL_NS_GPL(get_hsmp_pdev, AMD_HSMP);
+
 MODULE_DESCRIPTION("AMD HSMP Common driver");
 MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 9b4ab6a3598c..e852f0a947e4 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -55,8 +55,6 @@ struct hsmp_plat_device {
 	bool is_probed;
 };
 
-extern struct hsmp_plat_device hsmp_pdev;
-
 int hsmp_cache_proto_ver(u16 sock_ind);
 int hsmp_test(u16 sock_ind, u32 value);
 long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
@@ -64,4 +62,5 @@ void hsmp_misc_deregister(void);
 int hsmp_misc_register(struct device *dev);
 int hsmp_get_tbl_dram_base(u16 sock_ind);
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
+struct hsmp_plat_device *get_hsmp_pdev(void);
 #endif /* HSMP_H */
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index c1ddd8957f19..37bf75d5c43b 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -37,6 +37,8 @@
 #define HSMP_INDEX_REG		0xc4
 #define HSMP_DATA_REG		0xc8
 
+static struct hsmp_plat_device *hsmp_pdev;
+
 static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
 			     u32 *value, bool write)
 {
@@ -70,10 +72,10 @@ static ssize_t hsmp_metric_tbl_plat_read(struct file *filp, struct kobject *kobj
 	u16 sock_ind;
 
 	sock_ind = (uintptr_t)bin_attr->private;
-	if (sock_ind >= hsmp_pdev.num_sockets)
+	if (sock_ind >= hsmp_pdev->num_sockets)
 		return -EINVAL;
 
-	sock = &hsmp_pdev.sock[sock_ind];
+	sock = &hsmp_pdev->sock[sock_ind];
 
 	return hsmp_metric_tbl_read(sock, buf, count);
 }
@@ -85,10 +87,10 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 
 	sock_ind = (uintptr_t)battr->private;
 
-	if (id == 0 && sock_ind >= hsmp_pdev.num_sockets)
+	if (id == 0 && sock_ind >= hsmp_pdev->num_sockets)
 		return SYSFS_GROUP_INVISIBLE;
 
-	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
+	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
 
 	return 0;
@@ -162,10 +164,10 @@ static int init_platform_device(struct device *dev)
 	struct hsmp_socket *sock;
 	int ret, i;
 
-	for (i = 0; i < hsmp_pdev.num_sockets; i++) {
+	for (i = 0; i < hsmp_pdev->num_sockets; i++) {
 		if (!node_to_amd_nb(i))
 			return -ENODEV;
-		sock = &hsmp_pdev.sock[i];
+		sock = &hsmp_pdev->sock[i];
 		sock->root			= node_to_amd_nb(i)->root;
 		sock->sock_ind			= i;
 		sock->dev			= dev;
@@ -200,7 +202,7 @@ static int init_platform_device(struct device *dev)
 			return ret;
 		}
 
-		if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6) {
+		if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
 			ret = hsmp_get_tbl_dram_base(i);
 			if (ret)
 				dev_err(dev, "Failed to init metric table\n");
@@ -214,10 +216,10 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
 	int ret;
 
-	hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
-				      sizeof(*hsmp_pdev.sock),
-				      GFP_KERNEL);
-	if (!hsmp_pdev.sock)
+	hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
+				       sizeof(*hsmp_pdev->sock),
+				       GFP_KERNEL);
+	if (!hsmp_pdev->sock)
 		return -ENOMEM;
 
 	ret = init_platform_device(&pdev->dev);
@@ -304,12 +306,16 @@ static int __init hsmp_plt_init(void)
 		return ret;
 	}
 
+	hsmp_pdev = get_hsmp_pdev();
+	if (!hsmp_pdev)
+		return -ENOMEM;
+
 	/*
 	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
 	 * if we have N SMN/DF interfaces that ideally means N sockets
 	 */
-	hsmp_pdev.num_sockets = amd_nb_num();
-	if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
+	hsmp_pdev->num_sockets = amd_nb_num();
+	if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_SOCKETS)
 		return ret;
 
 	ret = platform_driver_register(&amd_hsmp_driver);
-- 
2.25.1

