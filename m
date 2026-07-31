Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013003.outbound.protection.outlook.com [40.93.196.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E78446830;
	Fri, 31 Jul 2026 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514560; cv=fail; b=BaOC+Zo0HjdOSTZdLYWaEu4cwmH8sR2AnfwPYCjrGEfmALtN8dJBXOPWp26HMyoEXK1r8o0x4MHxqc17hnrLRa0bLeyMqM6BBykOTFpQKqGx7Mrojzmmc7CtLfxkR8k1SHM+uVSJZfIopo9/047h2ElVyRpIuXhr/uh9F+eBDGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514560; c=relaxed/simple;
	bh=ubVwty2HC6RYbx0YIt800rHaZiV143qRfKd9/pkMeFQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c7yIr1HIr57sFfVSkqs59zckQORqr8jb/8oRvJambKu4oKsYNpbqvRApQ7vsEAfWLOaFb7sImTGVagGAxhYP8Z8iPB/Q+IBHn2AYhKjU9gDsF9BM6i9q3n72+pWL+3gCiKi7KUzc1gi3kEhRWGTH0gjBnFmmCH6K8vGZB7iOM4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LLExUYiq; arc=fail smtp.client-ip=40.93.196.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LLExUYiq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wU9JXZxgxkOE/Ai3fWzc3xm89o4Z0sTpOybDAgFjyGj/B0cXKP7zPe0anKy2zkMmqVrd7S9imLX1DlkiaHopCcIYVeXCpru/4oh/PYbuFvegQT0kMg11Isk+I1W+KB0P12Wgrd/aJxRBwwPoyIHH6iNOVhiv4HOZGVjqTLUcnSYxIb4FtATQaFNePzegtCECiZMuSyeDZZuOWVYlOp823i9C2Gu/E1BJfKd434KjBmVywgKXAH3TaTAm44TgEhRfqfYIh3w6WDyEP8vAtII8CMGBdFP02PgzhgsQiAADlzWY1LT1j9139mjc9p2RVPohzTXurwrQqgxtejkUjhXJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0n+yQu0PHG0Ui2awQPFlhFRRR5ux20tC7RKbLhWfazs=;
 b=s7UXyxcRx6xZcsZKTH0+duRqDguNz/zMibeGgm1/8xa+L4PXQIl1niCHL6ynExmgpfrEkQHPfWuhBNkLQNSaGjy35uprrrgeRlLgX41Agr+p3oeo89bkNDfDhxi4M8CYA5ej0LTJS4I/4ztxiQ5b2yss6Pv1LhGpO2t2RHwmwG+5fgXDL4uvVgipnNdSOVYneYWrtLFJfaSJ6Vej6yhpdBm+Crc3s1ClPI4BSOH6aCP6lA4xnMJPoDnaKLLGglpMW7UFuE12+vnbX2M4V+xf7Senf8oAHWgvaZjtgwRDFL51wM1lNZFmES6l8/fjy1xtTBpKSxH8m5ZuQ/R2kM33Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0n+yQu0PHG0Ui2awQPFlhFRRR5ux20tC7RKbLhWfazs=;
 b=LLExUYiqyrgLZFB1zzMkRJQTf3+YIfWPZhykBjwSWCNhAbJbXxn6uDkKLSQW8asqnyWht23SgcXsSUD6/KS/JugYsMbyPCUjfNlCFEPpHKejL37eRsLVA831xi9neW/le0+evGvy5vTCRbH8usOJtGU9W5AJ/s1P+hVPG1dS6HE=
Received: from CH0PR03CA0196.namprd03.prod.outlook.com (2603:10b6:610:e4::21)
 by MW6PR12MB8760.namprd12.prod.outlook.com (2603:10b6:303:23a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 16:15:46 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::86) by CH0PR03CA0196.outlook.office365.com
 (2603:10b6:610:e4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 16:15:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 16:15:45 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 11:15:43 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 3/4] platform/x86/amd/hsmp: Add ACPI client support for Family 1Ah
Date: Fri, 31 Jul 2026 21:45:15 +0530
Message-ID: <20260731161516.2242993-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731161516.2242993-1-muralidhara.mk@amd.com>
References: <20260731161516.2242993-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|MW6PR12MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: f582b57b-5e05-4cac-9554-08deef1efa32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|6133799003|11063799006|56012099006|3023799007|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	tGw7+yg4LLgQmbNajkjW/LT5WMETSw4iihSLU0iPUbDbH5dYBDhTb/xAx2lRIq0KiNapVQ4WZahmXYXm6Hh8ik+ji0kAKcB5+4ADv7A62pXYhUYQB8rCXphRMU05UZdggEb3PvbcvWfgk/CRmfcIA7guBjcncN5SBL84NmSBk6jN17oVQ7bb+ibhtqwGfBVibLN/h/muZq8/qrAALj6zTgLibZ8FFdd2hEMFWojuQiPWg+K2hJv+qJlSEs65cTYinNDNN3yjNlRIQje1dn9XxQPg4h2X40RpSAuH+O9LNup5pPQ9MlTUVpdYMpwATr/4dqgjuyDNR3vi6W1qNCBYIpJYM8tvuwlX+8ieTcuoHelptcySjSZJOI9FYG7DFS3q2Z60+dpaP/VOD4yvhmY54zslcrxt0P8TRdXu0bF/QH0TrMdh3+3cu9QRc6NKPfAkjzph7UafDPO2Y4iL/diVygk/dkkjJCaAc6Bu0HGH/V8N7p06aG/HsttG5+gWTaWiw1FOqyOhsuI3EEuJUD0OG4a54AEczS8xkjwXOv+wLrFQEiyiONOXlenBkqSK6OswjIC+Me0hFr/B51r3vBJ9YhAbW+LQAgF2m2o2LriiPT5qcoCOFChCmIjn1FIwEejYqSOOMwUyGCDrUIdVf5GXJqXlvYICDNOHeDXUwiyruQdCqBOxsxLAufzz3S/q9PgspAQFexTKuO3dcdTicElF4Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(6133799003)(11063799006)(56012099006)(3023799007)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ua0GmJRJRTwozTSlY8zpIyZT5wCEqS9ao10iPYWh8M2tS5di2GSRAs4iOwMyCPfvvB9NdQTCbCKYB2sOUEyf4FlFrFbqG6bib5P6d2or7vb3JI825lWVsOJOloUi1LMlhHww/8MJ4p6p6csny/qPPNdczlWlipRz63+EpyNRJnmdPtn05hBT0IRrKTa1El/luyzTmKM0rJmzOP9gHyq/sznWX52/qR9HNxQaOmtbxLGZR/60xTfZRuLh9IyuPown17zvd+a+0k6Nce+EqGWLeNp7K7nE1DGIXoXto3iFEHw2AEHHAcTSKBxrfvUF0bPInbEo4tNEet755knmejHRfGzKxwv0SGChJNxpO87LwYRb2AkimTgdfj5xXiprYbltPw2XHGdZoa1T6/+Ej2AdOFcKDjtitMlR7VHSGGi65CQwVp3z3fS+hhHJulApYKF7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 16:15:45.8311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f582b57b-5e05-4cac-9554-08deef1efa32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8760

On the Family 1Ah client platforms (Models 80h-8Fh and E0h-E3h) the ACPI
HSMP device (HID AMDI0097) is present but exposes neither a _CRS memory
window nor a _DSD mailbox-offset package, and names its socket
differently.

The missing _CRS decides how the mailbox is reached. On the server it is
an MMIO window that firmware describes in _CRS and the driver maps. The
client supports no such window; its mailbox sits in SMN register space
at the fixed addresses the platform descriptor carries, so reach it with
amd_smn_hsmp_rdwr() for both the reads and the writes the handshake
needs.

Handle the client explicitly:

  - hsmp_get_uid(): strip the "ID" prefix only when present, so both
    forms are accepted; kstrtou16() still rejects anything else.
  - hsmp_parse_acpi_table(): for is_client_platform(), skip _CRS/_DSD and
    take the fixed client mailbox addresses from the platform descriptor.
  - init_acpi(): treat the interface-version query as non-fatal on the
    client and fetch the metric table whatever version was reported.

The client branch publishes sock->dev last with smp_store_release(), as
the server path does: it is the readiness gate the data plane tests with
smp_load_acquire(), so it must not become visible before the accessor and
mailbox offsets it depends on.

Server behaviour is unchanged.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 77 ++++++++++++++++++++++++----
 1 file changed, 68 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 8257cd1da48e..80a6ede0f0e0 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -10,6 +10,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <asm/amd/hsmp.h>
+#include <asm/amd/node.h>
 
 #include <linux/acpi.h>
 #include <linux/array_size.h>
@@ -71,6 +72,26 @@ static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
 	return 0;
 }
 
+/*
+ * Family 1Ah client platforms (Models 80h-8Fh and E0h-E3h) expose the HSMP
+ * ACPI device (HID AMDI0097, ACPI path \_SB_.TELD) but, unlike server
+ * platforms, the device provides neither a _CRS memory window nor a _DSD
+ * mailbox-offset package.
+ *
+ * That difference is what decides how the mailbox is reached.  On the server
+ * the mailbox is an MMIO window: firmware describes it in _CRS, the driver
+ * maps it, and every access lands inside a region firmware has vouched for.
+ * The client has no such window to map, so the mailbox is reached in SMN
+ * register space instead.
+ */
+
+static int amd_hsmp_acpi_smn_rdwr(struct hsmp_socket *sock, u32 offset,
+				  u32 *value, bool write)
+{
+	return amd_smn_hsmp_rdwr(sock->sock_ind, sock->mbinfo.base_addr + offset,
+				 value, write);
+}
+
 /* This is the UUID used for HSMP */
 static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
 						0xa6, 0x9f, 0x4e, 0xa2,
@@ -89,15 +110,19 @@ static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
 	char *uid;
 
 	/*
-	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
-	 * read it and strip the "ID" part of it and convert the remaining
-	 * bytes to integer.
+	 * Server firmware differentiates the sockets with "ID00", "ID01"..
+	 * "IDXX", so strip the "ID" before converting the rest.  The client
+	 * device carries a bare socket number with no prefix to strip, so
+	 * only skip one when it is actually there.
 	 */
 	uid = acpi_device_uid(ACPI_COMPANION(dev));
-	if (!uid || strlen(uid) < 3)
+	if (!uid)
 		return -EINVAL;
 
-	return kstrtou16(uid + 2, 10, sock_ind);
+	if (!strncmp(uid, "ID", 2))
+		uid += 2;
+
+	return kstrtou16(uid, 10, sock_ind);
 }
 
 static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
@@ -240,12 +265,34 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	int ret;
 
 	sock->sock_ind		= sock_ind;
-	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
 
 	sema_init(&sock->hsmp_sem, 1);
 
 	dev_set_drvdata(dev, sock);
 
+	/*
+	 * On the client platforms the bound ACPI device has no _CRS window to
+	 * map, so take the fixed client SMN mailbox addresses from the
+	 * platform descriptor and reach them over SMN.
+	 */
+	if (is_client_platform()) {
+		sock->amd_hsmp_rdwr		= amd_hsmp_acpi_smn_rdwr;
+		sock->mbinfo			= *hsmp_pdev->desc->mbinfo;
+		dev_dbg(dev, "Client SMN mailbox at 0x%08x\n",
+			sock->mbinfo.base_addr);
+		/*
+		 * Publish sock->dev last, for the same reason as the server
+		 * path below: it is the readiness gate for the data plane, so
+		 * it must not become visible before the accessor and the
+		 * mailbox offsets this socket needs.
+		 */
+		smp_store_release(&sock->dev, dev);
+
+		return 0;
+	}
+
+	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
+
 	/* Read MP1 base address from CRS method */
 	ret = hsmp_read_acpi_crs(dev, sock);
 	if (ret)
@@ -553,11 +600,23 @@ static int init_acpi(struct device *dev)
 
 	ret = hsmp_cache_proto_ver(sock_ind);
 	if (ret) {
-		dev_err(dev, "Failed to read HSMP protocol version\n");
-		return ret;
+		/*
+		 * Some client SMU builds reject the interface-version query
+		 * with "invalid message" even though the mailbox is functional
+		 * (the preceding test message succeeds).  The client does not
+		 * need the version to reach its metric table, so treat this as
+		 * non-fatal there.
+		 */
+		if (is_client_platform()) {
+			dev_warn(dev,
+				 "Interface version query unsupported on client SMU; continuing\n");
+		} else {
+			dev_err(dev, "Failed to read HSMP protocol version\n");
+			return ret;
+		}
 	}
 
-	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
+	if (is_client_platform() || hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
-- 
2.34.1

