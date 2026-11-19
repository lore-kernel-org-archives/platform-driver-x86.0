Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078288;
	b=iuyq7zxhltKUjnGAMHJTx81VNtXn4VxpSzqdl4Xyo7wemxUTlpnfWG3bMnnOWzymHw1p
	 HqzSSacslIJMrPavXBiVGqCG6C13+09T4jCKiuO9JxM5dV0iuErzFXWPQszefBqYPAFSw
	 rX0mwoxfAuguCiKwJUu5LsBOvK7ZpTz0NnbzFGLEzF//0JvcIP2Pr9lW5cZG59R51Z3Tt
	 4Nust4aA4VRGy3ChJ6kQTkBeaiEMCyQgP+7euaKEQx8UIMRcaxYg72HJcdsSorRZrdSyB
	 164B7CEcjNkjeC0VfAXk9+jDqXdcEJ0MbpDjeQfCHVg7IMZsSxQivsFtAvEk6sqEqRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078288;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=T/8yOigCLvBb1/YuikUbP/MC3/F18+KkoYnYXoh5fAk=;
	b=DHOxNSbB9exOMsZrr9PrbPOO2TqvR1pHUMVQjp+3zTShPrUTJYWAaYxt89DT0BBHMNII
	 O0kzfjrhq97tk1g6dI+ZQObpJHoIqcxhxfjoGkYSoN2BV8SwAcQhSGymfqI+pfE1HxcuN
	 8HPkVAL+1oV7y/EttK5DwyScsbsM+Qsl/tARF4KZ76xoEQwyd4MQCRCX0bvVKAC2Unpi2
	 hDQ5jnHe6J6hVc5Thtl7C0ZHVDoXVd8BI+mPtaUmL9IjBfh9EwPSYFxPLKfIE6SVltdWQ
	 d/eyriOjFlG06IRQx/IFLV0UNLkFApEHXWZIy1G4jaCqs0owimQSMlxydAhrYaF26MQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GgOCtTfl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.62
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010062.outbound.protection.outlook.com [52.101.46.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3DB606A320
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 08:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E3DB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GgOCtTfl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyZ4AMuGacdMElx+ZPUWqhMJ7EaZsownAO3sVGHEKGR+pu2lHLumTe/hGViOlj8yolykj2j+7F0/ZRncwvly7E8IoOzpmoLFfHdj1qjBSap603aRtaZjunZaXO33qx9feYhG3ttzqQh3+IFS3/ERUuNREdoXrnZWq31Oq3AxXChz0+r4r6E3qJEHFxVNly7FKc7Gw51Oza5GXxsnZQM5vFTfS2hxuALq90xMcCrAjSKQ5VdgQAMAHNps6cy0PdisHKacuPrFgKWNPQKtyCxtyiE5TdJX5kR+Tbio5zds3hircNBc0+ewl0Xf+MarkoDRnctj3NFlqu+1nPkAKdiBbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/8yOigCLvBb1/YuikUbP/MC3/F18+KkoYnYXoh5fAk=;
 b=S2IXyKvMnE0nr0hoduK48wtrC4xuadyabfuscXo65s9gaYTNQnNVgbfQ0GPz6C7wPqxJMy85+44o2M8TPh/rpr4GxMI2TXMS12Dc7LTBi1+AbKN8BHTOaZ632xlVEQ9RFR2aRaCka4KNQPAwKiTrcPwqK3RIr3d6GsY936jwrqGnln01GHF+DqW/7lHDCRtjr1uPQFh++gZ2Cg5ZJWQZX6leIDfYnwg6WjaR/Zdj9fBlMk9itglUheOfp73G7V1lxQHTatYPWWkZ2mqI46/E00fOMA6b6s8E8+iYt70DzFUMnRP4937vyExXzBWcsJd8AzWJrJoKxe8vgam5dbQDGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/8yOigCLvBb1/YuikUbP/MC3/F18+KkoYnYXoh5fAk=;
 b=GgOCtTflBZ//ql23IyGoiOz5ym4orkvqgk9isOqZPSiFkakwLF4RrTBJInHesFbxE5aNF2l9nVifpFEYK+713sS6fIGszMxYgretNgluUVqVw47J74yF0++FN6rtQmRp+93ntgPuGHMxlIGvw5jh7oxwE62b69Pi4hvOKrSbPgc=
Received: from BN9P223CA0004.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::9)
 by IA1PR12MB8494.namprd12.prod.outlook.com (2603:10b6:208:44c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 08:51:25 +0000
Received: from MN1PEPF000793FC.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::65) by BN9P223CA0004.outlook.office365.com
 (2603:10b6:408:10b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 08:51:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FC.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 08:51:25 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:51:22 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Muthusamy.Ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>, Dhruv Gupta <dhruv.gupta@amd.com>
Subject: [PATCH v2 02/11] platform/x86/amd/hsmp: Move proto_ver to hsmp_socket structure
Date: Thu, 19 Nov 2026 08:50:36 +0000
Message-ID: <6445972489f1a4e7f2dee121738ac3ee250b8859.1795061419.git.Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1795061419.git.Suma.Hegde@amd.com>
References: <cover.1795061419.git.Suma.Hegde@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FC:EE_|IA1PR12MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: 641ad67a-4f27-495c-9494-08df461a4b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|261102123227099003|261026140227099003|261028144727099003|11063799006|261021123027099003|261021121427099003|261022105027099003|56012099006|10067099003|18002099003|22082099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Rcaz5lwRZJKu8x/NumHdzLKP9QmFZrcMdlbUkJpgc8ztrcwrcBmhJRSGOnn6GaEQ7ryl/RMg4eYvriOsUg7sFZ34/1bs/5lJa+c3ZBJ982QU1spuOVwUxPS5zbjlna5UH1n372NxHBN1wnINs6L309K7FFhI0603D6aQSf7rXvM1XKPLRX8W97cA+nEXgyvhwOq1U1UmBAXEr3sUjLAN8ZSjfMWLRg4jecpS++IDNTbpa73+YoAxcWybsHfppNsvqM1DWUp1lX7HX1UlawfDfLOTDj3jW7S9plNrcLtv4SfNOcPFPPw8UeZ+tFUwr8UDN3R6LYO/0eRdvB/Sjz7RuHRczb5zK6SpovIYf648nSmSLqpe7pDTteCroxybZR1ikLQzOej/169me+oNMFJyReIGx9Yt3vWlxsdsquOFievLrJeG09+2WVQ9yQTHV8xeqv+ZWRXKBf52I5Se+bwaPhSYPJZcIi66EWNJUBl+fxeJnuk0q9KTe7z+VwosFVCBVICWDXLnOu72CQogq3ZUq3hV5M3Xi6TiNURSaIOY71xsCL2OHFaV8xlRzG3VgCVHDxYZ5uXqjinaE2YGnaCzW/EBSq5B3bl2HUlDBt5QIWfzNgtiDjFiwYiyH4gfj0epTO7CtXog4UghAcNEqOT8oZw5Nq3jsBb3hDgNV+aBASvvT0FAyFU5S4mXcZ428kkDqD/6WhHLuIgneZaJpJfMGA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(261102123227099003)(261026140227099003)(261028144727099003)(11063799006)(261021123027099003)(261021121427099003)(261022105027099003)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2wHxkPW9SZSH3fkRnyBBUxumy6BFcqfnAfk5Y7eu946GXALT25h82Sl/z5NElA+lI57oyTeICMMklmsIGRHF9LohWjwDPxVk937A3c0bQI4Eq4VQqhFUBZrFk1ZhiJbRpgF0qLzrG93YFvFHM1yNd90L9zktYBkm+MRNXWaymMDAFLCCE/ekr10uXYHJmf8QrUXtk2latJFOU5HNYPqByAZHO3HTQm9EFmhDbfTJe8SemPw+p367pYAJb8dNqjkFkVsaVk+76sx8qmEGYNRUbP+A21nzLGw2izY7uFjU098DzleGOeyzB9dp7LuC1MzMhuL/cH/XCv1M+/liA7EprczETJR7KiXBCHNQoquE+F1a9F9I0rGCvd++Zssm9Oh7/ePpdeV1VvvxOGyHUDk/1GJQYUXUzAe12T7tIJxUFLhFhI/OZS96/mA4TTJVlsaK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 08:51:25.1517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 641ad67a-4f27-495c-9494-08df461a4b0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8494

From: Suma Hegde <Suma.Hegde@amd.com>

Move proto_ver from hsmp_plat_device to hsmp_socket, as the protocol
version is fetched per socket. Update all users to read the per-socket
proto_ver.

Co-developed-by: Dhruv Gupta <dhruv.gupta@amd.com>
Signed-off-by: Dhruv Gupta <dhruv.gupta@amd.com>
Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---

Changes since v1:
- Add missing Co-developed-by for Dhruv Gupta to match his
  Signed-off-by.

 drivers/platform/x86/amd/hsmp/acpi.c | 14 +++++++++-----
 drivers/platform/x86/amd/hsmp/hsmp.c |  2 +-
 drivers/platform/x86/amd/hsmp/hsmp.h |  2 +-
 drivers/platform/x86/amd/hsmp/plat.c |  4 ++--
 4 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 167c76c13ad07..44db76308ceb9 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -286,7 +286,7 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj
 	 * Surface the unsupported case here as -EOPNOTSUPP rather than
 	 * silently truncating the snapshot.
 	 */
-	if (hsmp_pdev->proto_ver != HSMP_PROTO_VER6)
+	if (sock->proto_ver != HSMP_PROTO_VER6)
 		return -EOPNOTSUPP;
 
 	return hsmp_metric_tbl_read(sock, buf, count);
@@ -302,7 +302,10 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	 * pointed at HSMP_IOCTL_GET_TELEMETRY_DATA as the supported path.
 	 * Hide metrics_bin on client platforms.
 	 */
-	if (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
+	struct device *dev = kobj_to_dev(kobj);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+
+	if (!is_client_platform() && sock->proto_ver >= HSMP_PROTO_VER6)
 		return battr->attr.mode;
 
 	return 0;
@@ -574,8 +577,10 @@ static int init_acpi(struct device *dev)
 	 * version enum rather than relying on numeric coincidence
 	 * between the two.
 	 */
-	if ((is_client_platform() && hsmp_pdev->proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
-	    (!is_client_platform() && hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)) {
+	if ((is_client_platform() &&
+	     hsmp_pdev->sock[sock_ind].proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
+	    (!is_client_platform() &&
+	     hsmp_pdev->sock[sock_ind].proto_ver >= HSMP_PROTO_VER6)) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
@@ -684,7 +689,6 @@ static void hsmp_acpi_sock_release(struct kref *kref)
 	kfree(hsmp_pdev->sock);
 	hsmp_pdev->sock = NULL;
 	hsmp_pdev->num_sockets = 0;
-	hsmp_pdev->proto_ver = 0;
 }
 
 /**
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 45d20beda9464..3a8b8697e62b9 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -805,7 +805,7 @@ int hsmp_cache_proto_ver(u16 sock_ind)
 
 	ret = hsmp_send_message_locked(&msg);
 	if (!ret)
-		hsmp_pdev.proto_ver = msg.args[0];
+		hsmp_pdev.sock[sock_ind].proto_ver = msg.args[0];
 
 	return ret;
 }
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 3302c15173695..5b05dcb074846 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -77,13 +77,13 @@ struct hsmp_socket {
 	char name[HSMP_ATTR_GRP_NAME_SIZE];
 	struct device *dev;
 	u16 sock_ind;
+	u32 proto_ver;
 	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
 };
 
 struct hsmp_plat_device {
 	struct miscdevice mdev;
 	struct hsmp_socket *sock;
-	u32 proto_ver;
 	u16 num_sockets;
 };
 
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index af8aee1fb22ba..40c98d9c66d4f 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -79,7 +79,7 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	if (sock_ind >= hsmp_pdev->num_sockets)
 		return id == 0 ? SYSFS_GROUP_INVISIBLE : 0;
 
-	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
+	if (hsmp_pdev->sock[sock_ind].proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
 
 	return 0;
@@ -193,7 +193,7 @@ static int init_platform_device(struct device *dev)
 			return ret;
 		}
 
-		if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
+		if (sock->proto_ver == HSMP_PROTO_VER6) {
 			ret = hsmp_get_tbl_dram_base(i);
 			if (ret)
 				dev_info(dev, "Failed to init metric table\n");
-- 
2.34.1

