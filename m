Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011051.outbound.protection.outlook.com [40.93.194.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763704AB1C3
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 11:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976528; cv=fail; b=dkxm5HwPGi2L6otxZeE/hF+AC1RTiaCFJnTLq9CadQ3BKRae8/5+WjSUzfSWV7DDmUCrToo8mx8tgXZGEA/ek18K4t82l2/GxpLmuHgCuUzMlCl85ZRCEBDtRtDKYWPxRpbw7sjJ4LrrOCB0H3uhejuquCnNOs0HV5kBy6ProZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976528; c=relaxed/simple;
	bh=7VJ6FDSTPmi/D0rP8nUMlyPI363b1yVzHsaIYb7rYBQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uw15ejSoUR+fdNdhtzO8sYkE6+CfxI+nxhHI/lhXRop7U/xirsN17rTZpHEM6r/C0p50//UD7sspiNxC/O9mprsg7CwE0leRxApKl76bmvAgpw8UAdn71zWZdXmWs0z4cA/wvYmGvxCAGAw6r1KSnL49R901gBKdj4XdDXlZp28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=V0/sjGwi; arc=fail smtp.client-ip=40.93.194.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="V0/sjGwi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIutX9iiny5151SEQ1T7OW5BoygBlwym7CB6Hp6hyInt876qdtFl7ATpTqLSSjVrU/JPcDBCx2GNr8ZESLOKDzVx28w/HuKR+9eojrGwl3M3rYApg1AM83VbvSDIubiC6moSfCQQwzsyTqla6YOdSYdkZYNO4qTE20cfC6WUirmz7ZUeG0yhOo62xG2wjIdHbvx4tDFROdVhL+sohZMUQHd2hsmcrHqUA6TxY9yYLuNeHEpf8/1JQLJSLJfOCk9C13hZHSQMmCdQLh37DtrSYCu7tAPSMfcvHITPVzPSkuWAbwlG7Cz7LTbp8/e6A5qWhIH1S5UpTk7KSpsCpqFOgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMnK7QmCeKidw5x+KLj/dBTwCWwsnCD2wmBxsQf/KAo=;
 b=ffoK71cLknGtbEq2keUWuKECLaGvJwal8kNSAoGvhtQFHgWaUatz3NiQsUv2ctbZY9xz2RESteYvzy309nbLHvii+UUv5CQE/P2VGxYqcd6Ekzw4nHh8ESM+rK/f05Lq6A9b0OUyBZBppUdHwzM8fCbQzbfK0hRoKl9ZOEh4DJOwIhIePKq+MKn4MwmPxH4WqYmSqv/XNBuYs7O+EhTHPiy03x6FoR//VVNeP5r8qZTvEy5/Qc8Pd/AXaj0qClGX2/4w0nG0Qvq7oR4zdDJldV6pgB1Ux76DtEwc9Tuwq4eVtednS8npsk+m8SCZ2ojhq6CU+WgKE5LxP0CU2RmJkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMnK7QmCeKidw5x+KLj/dBTwCWwsnCD2wmBxsQf/KAo=;
 b=V0/sjGwir9ejAq1fdS/PqDb5A6UwNZrGLRB2QxYCAi53pLYZaeKhMIZeIvFCVi0gvoT3GFgellQfhYNlw4p20gkAz/t0Ub3OY4s9QLxESNjoftlR7Sp78mqQLafWmhxfR24mGabBdp7hnoSOV/1RKcbskY4IdYrAkYgkp71xlYg=
Received: from PH3PEPF000040A1.namprd05.prod.outlook.com (2603:10b6:518:1::52)
 by SA0PR12MB4397.namprd12.prod.outlook.com (2603:10b6:806:93::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 11:15:17 +0000
Received: from CY7PEPF000000F0.namprd05.prod.outlook.com
 (2a01:111:f403:f912::1) by PH3PEPF000040A1.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 11:15:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000F0.mail.protection.outlook.com (10.167.247.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 11:15:16 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 06:15:03 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <muthusamy.ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Suma Hegde <Suma.Hegde@amd.com>,
	"Muthusamy Ramalingam" <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 7/8] platform/x86/amd/hsmp: Add wr_msg_id for sysfs attribute visibility
Date: Wed, 14 Oct 2026 11:14:29 +0000
Message-ID: <20261014111430.23156-8-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261014111430.23156-1-suma.hegde@amd.com>
References: <20261014111430.23156-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F0:EE_|SA0PR12MB4397:EE_
X-MS-Office365-Filtering-Correlation-Id: 48922d3b-d5f3-479f-41c5-08df29e46cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|10067099003|22082099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Hr+SNxwD50dB3XpBQRIPOp7VDOPt4On6lspa/WHNaX+AXCX4k6HrLWwNE5SeDW4qiZWXlaYySX9VkifwzInGhHheHbf8HGANqYt37GV1yc3xpmphfCC1hT4RUHI3rNOG3HDT6ytPtvq2TPH+qH4HMJy07yccVxmli1dorP0y8avkjAX2NOqE6vXiI4QOMKSoK56D7jMAc+A/fGfcwMg1PoqMssWmkmrrzNt4mXGfyZR1zRGm9MkINmW3OTVhe9cTglNGrHGjl9TpAfgdeMGawpZQpWVI6LNYWgQ43i8GEvXvx1puFjCIXJi0FpB5sJS5r/PwrNXxtQAimQpRvI7t16wj74xrV551aCSBVPonZ54SfnHJ81oGyDfPq9tfcmntMsSggNrEsWEw0nAgFU/hb5U3LqmSsXecVJ+7k1RTwLlBavn9dXwPUGkunH1Tu40ok3990gGjdaYYLEEZS3RDNrAK+JMcCFb/PPqOf/0KiTZyWwznV88prA1ufWJeAbvLBqGpAYmL9Gpn5awcPOrPKZ0zaoKvY1YRRYhW5Cg5sGkwPgUwbC2+EfIRaorYqLzZaLG9ePPgXYo/YE18k6xwI6PySKxuPWdWPOBLD/P/lN4Me18AlMy3Or5fJLGDAmRkFheyKM67R2pwhGY4zMbDt493QRKeFyBvqXxdS5IWUEk6TWuzQMytfBbW4KBsrlXjTymcOn8Misdv2WsA+OwoDw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(10067099003)(22082099003)(18002099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R8I74QjHKkvgLxEAnPx/G9zvmeb7JGlszyyZTJ5lmU5R/FWBOP4ZkB8oJ5oKuNgeIXE0mgJ6D9Xcp+u0sQQcy6nr9o6C406oKKSxnjrCKc7Q75Jqf1mN/noVfJhsgM5mRpT519jz0jW4hgy8DEmgBxsiu3kFruVnAvj+JT/eZJIawwmGRVmhACUj39utGIvoCdq5uJ5KylSCDoApdODScvpic/EoVFZDtM7NCy6sDj+hzjZ/IkEPgwZW6uo/cVsEBJd/rZTrdva1k5XEf4VtJDok004Ho/Pc1vPw6f8F1w2e3MijxwO87rJC1kA6pRKByp9Bg7sHWk78T/xD2pyg+Rjoogz52jrpBliNoiEu6v8MEvaIiuUKNLiuGtPPyqJMeQLiiQjkSLNkHhzF7tLdgIizFhklHGIWix+jpOXXp3088PB06HBDRBvnw1NvpCC+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 11:15:16.5960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48922d3b-d5f3-479f-41c5-08df29e46cef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4397

From: Suma Hegde <Suma.Hegde@amd.com>

RW sysfs attributes may use different GET and SET message IDs. Add
wr_msg_id to hsmp_sys_attr and consult it from the ACPI and platform
is_visible helpers when deciding write mode. Add HSMP_DEV_ATTR_W for
write-only attributes that only have a store handler.

Share the attribute initializer as HSMP_SYS_ATTR in sysfs.h. The ACPI
and platform wrappers still differ in symbol name and socket index.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c  | 26 +++++++++------
 drivers/platform/x86/amd/hsmp/plat.c  | 46 ++++++++++++++++++++++-----
 drivers/platform/x86/amd/hsmp/sysfs.h | 16 +++++++++-
 3 files changed, 69 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 8c3527540f8bc..df0b344e22f80 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -351,13 +351,14 @@ static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 	writable = !!(mode & 0200);
 
 	/*
-	 * File is both readable and writeable. Some platforms support only set/write operation.
-	 * Some platforms support only get/read operation. Update the file mode accordingly.
+	 * File is both readable and writeable. Some platforms support only
+	 * set/write, some only get/read. RW attrs may also use different
+	 * GET/SET message IDs — gate each direction on msg_id / wr_msg_id.
 	 */
 	if (readable && writable) {
 		if (is_read_msg_enabled(sock, hattr->msg_id))
 			mode_updated |= mode & 0444;
-		if (is_write_msg_enabled(sock, hattr->msg_id))
+		if (is_write_msg_enabled(sock, hattr->wr_msg_id))
 			mode_updated |= 0200;
 		return mode_updated;
 	}
@@ -370,7 +371,7 @@ static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 
 	/* Write-only attribute */
 	if (writable) {
-		if (is_write_msg_enabled(sock, hattr->msg_id))
+		if (is_write_msg_enabled(sock, hattr->wr_msg_id))
 			return mode;
 	}
 
@@ -502,12 +503,17 @@ static const struct bin_attribute *hsmp_attr_list[] = {
 	NULL
 };
 
-#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)	\
-static struct hsmp_sys_attr hattr_##_name = {		\
-	.dattr = __ATTR(_name, _mode, _show, NULL),	\
-	.sock_ind = U16_MAX,				\
-	.msg_id = _msg_id,				\
-}
+#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)			\
+	HSMP_SYS_ATTR(_name, _name, _mode, _show, NULL, U16_MAX,	\
+		      _msg_id, _msg_id)
+
+#define HSMP_DEV_ATTR_RW(_name, _rd_msg_id, _wr_msg_id, _show, _store, _mode) \
+	HSMP_SYS_ATTR(_name, _name, _mode, _show, _store, U16_MAX,	\
+		      _rd_msg_id, _wr_msg_id)
+
+#define HSMP_DEV_ATTR_W(_name, _msg_id, _store, _mode)			\
+	HSMP_SYS_ATTR(_name, _name, _mode, NULL, _store, U16_MAX,	\
+		      _msg_id, _msg_id)
 
 HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444);
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 2ac934d59ae64..66269bf1823c2 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -115,10 +115,15 @@ static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 	readable = !!(mode & 0444);
 	writable = !!(mode & 0200);
 
+	/*
+	 * RW attributes may use different GET/SET message IDs. Gate each
+	 * direction on its own enabled-message bitmap bit via msg_id /
+	 * wr_msg_id.
+	 */
 	if (readable && writable) {
 		if (is_read_msg_enabled(sock, hattr->msg_id))
 			mode_updated |= mode & 0444;
-		if (is_write_msg_enabled(sock, hattr->msg_id))
+		if (is_write_msg_enabled(sock, hattr->wr_msg_id))
 			mode_updated |= 0200;
 		return mode_updated;
 	}
@@ -129,7 +134,7 @@ static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
 	}
 
 	if (writable) {
-		if (is_write_msg_enabled(sock, hattr->msg_id))
+		if (is_write_msg_enabled(sock, hattr->wr_msg_id))
 			return mode;
 	}
 
@@ -168,12 +173,37 @@ HSMP_BIN_ATTR(5, *sock5_attr_list);
 HSMP_BIN_ATTR(6, *sock6_attr_list);
 HSMP_BIN_ATTR(7, *sock7_attr_list);
 
-#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode, _sock_ind)	\
-static struct hsmp_sys_attr hattr_##_name##_sock_ind = {	\
-	.dattr = __ATTR(_name, _mode, _show, NULL),		\
-	.sock_ind = _sock_ind,					\
-	.msg_id = _msg_id,					\
-}
+#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode, _sock_ind)		\
+	HSMP_SYS_ATTR(_name##_sock_ind, _name, _mode, _show, NULL,	\
+		      _sock_ind, _msg_id, _msg_id)
+
+#define HSMP_DEV_ATTR_RW(_name, _rd_msg_id, _wr_msg_id, _show, _store, _mode, _sock_ind) \
+	HSMP_SYS_ATTR(_name##_sock_ind, _name, _mode, _show, _store,	\
+		      _sock_ind, _rd_msg_id, _wr_msg_id)
+
+#define HSMP_DEV_ATTR_RW_X8(_name, _rd_msg_id, _wr_msg_id, _show, _store, _mode) \
+HSMP_DEV_ATTR_RW(_name, _rd_msg_id, _wr_msg_id, _show, _store, _mode, 0); \
+HSMP_DEV_ATTR_RW(_name, _rd_msg_id, _wr_msg_id, _show, _store, _mode, 1); \
+HSMP_DEV_ATTR_RW(_name, _rd_msg_id, _wr_msg_id, _show, _store, _mode, 2); \
+HSMP_DEV_ATTR_RW(_name, _rd_msg_id, _wr_msg_id, _show, _store, _mode, 3); \
+HSMP_DEV_ATTR_RW(_name, _rd_msg_id, _wr_msg_id, _show, _store, _mode, 4); \
+HSMP_DEV_ATTR_RW(_name, _rd_msg_id, _wr_msg_id, _show, _store, _mode, 5); \
+HSMP_DEV_ATTR_RW(_name, _rd_msg_id, _wr_msg_id, _show, _store, _mode, 6); \
+HSMP_DEV_ATTR_RW(_name, _rd_msg_id, _wr_msg_id, _show, _store, _mode, 7)
+
+#define HSMP_DEV_ATTR_W(_name, _msg_id, _store, _mode, _sock_ind)	\
+	HSMP_SYS_ATTR(_name##_sock_ind, _name, _mode, NULL, _store,	\
+		      _sock_ind, _msg_id, _msg_id)
+
+#define HSMP_DEV_ATTR_W_X8(_name, _msg_id, _store, _mode) \
+HSMP_DEV_ATTR_W(_name, _msg_id, _store, _mode, 0); \
+HSMP_DEV_ATTR_W(_name, _msg_id, _store, _mode, 1); \
+HSMP_DEV_ATTR_W(_name, _msg_id, _store, _mode, 2); \
+HSMP_DEV_ATTR_W(_name, _msg_id, _store, _mode, 3); \
+HSMP_DEV_ATTR_W(_name, _msg_id, _store, _mode, 4); \
+HSMP_DEV_ATTR_W(_name, _msg_id, _store, _mode, 5); \
+HSMP_DEV_ATTR_W(_name, _msg_id, _store, _mode, 6); \
+HSMP_DEV_ATTR_W(_name, _msg_id, _store, _mode, 7)
 
 HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 0);
 HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 1);
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index fb9aa63dcf820..ded0a1edf2505 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -21,7 +21,8 @@ struct kobject;
 struct hsmp_sys_attr {
 	struct device_attribute dattr;
 	u16 sock_ind;
-	u32 msg_id;
+	u32 msg_id;	/* message ID used for read / GET enable checks */
+	u32 wr_msg_id;	/* message ID used for write / SET enable checks */
 };
 
 #define DDR_MAX_BW_MASK		GENMASK(31, 20)
@@ -38,6 +39,19 @@ struct hsmp_sys_attr {
 #define to_hsmp_sys_attr(_dev_attr) \
 	container_of(_dev_attr, struct hsmp_sys_attr, dattr)
 
+/*
+ * Build one hsmp_sys_attr. Callers pick the C symbol (_var) and socket
+ * index; msg_id is the GET/read id and wr_msg_id is the SET/write id.
+ */
+#define HSMP_SYS_ATTR(_var, _name, _mode, _show, _store, _sock_ind,	\
+		      _rd_msg_id, _wr_msg_id)				\
+static struct hsmp_sys_attr hattr_##_var = {				\
+	.dattr = __ATTR(_name, _mode, _show, _store),			\
+	.sock_ind = _sock_ind,						\
+	.msg_id = _rd_msg_id,						\
+	.wr_msg_id = _wr_msg_id,					\
+}
+
 ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
 			     char *buf);
 ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
-- 
2.34.1

