Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010039.outbound.protection.outlook.com [40.93.198.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA763CD8BB;
	Mon, 29 Jun 2026 07:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718793; cv=fail; b=ILG2KFOoS+orS3MLFMGdBWRsFH+2H7zs3Dgj4MhEZmPMP0MmpCdjVyT6hM1lPPTkJqFhzqEllFjBPUmoJ2FLxrHio2GBVlqcRalNgzc1OCYOvQV2pNh3NowHi0dLXcB2aRxr5sgZ8iqnqNXwlnlfAIAplxJR6hzKmofw9Pq61sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718793; c=relaxed/simple;
	bh=OY2MxWK2TqnnNNkp46fmXdns2MVWYbeDTw4xxs6U1ag=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GJ3eLJEvBWEMmGBmCXv0mc5cnnJ0dFwdAmQYmvFFoFwkG9m1FiiSVNCO3ZSKSLVxbm07vKxvj0CvMCQzPSi8ecuTm0Zix/TIUBH1+9FcDSU8rOudnWr7R0XLoMPHgVB7CgmpkD3+FzxdH1J5peDSlgrpEZ5e/hM8dOJ/eKKDiis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=awHtf9NS; arc=fail smtp.client-ip=40.93.198.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="awHtf9NS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4i/n6FKiEfczvZrKdVr/IZQ/pAsibW4QRi5/ELa7UWET/1cG84EmOMkgJ9IjxJiX75YzOKbqcyZmshHebSahU/+ozLyNhggU16mEn+jIzFdcGXkfZTb9LX3anxnh6wSK3pdCEXohf0gECIm0VNMWLU5OgVkPH37h1hLaX9quv+vUEndP/19AM/M9E7BWtF+1Ky9Q1m/mOGgsUPppfamMDokiufRepk1cRFf1ICQntSME1nVX23uPTcZyT4XcrJF5AgjrURYwzski+ZAxR6hO2587NcR4ivgzeZUnnmLcvueliw6TrJ+uzoeoIn06JTGgdlvpxoxOTvsDyuFCOfrAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4anHJ2KINxIoNQCB45gGLSnNvk8du0Rzr0VIEC+YLBE=;
 b=jWG+C8WPxSiWiqitFdC7hBrI88A9IUed/vsX+5zlTdC3NSWIE4QgYYeJRj3SgzMOMjnuO8UVK5YM34HRYTKC0OVaaRpq96faFCCq6t319U5l04D8w0lOalsr72gibfeAfkBSC8rV8wonfBt2Mit9nDwyjzSkxVD+zxZy2ON1SMod+qtVdaOKRayTtA5VSagOxQvrSEXtyezCOkOkjwOT7isTTU2OoOGVIgOj08M/DuRVXZfSJfMhDAI6ClGb+yZNXxSamdO+sRs3MOjG7Eojtodvny1hIzfNI17AhmeBUFmGB/SYBrk7w3P9XEONrqjNMha2mAB2Wme2PEvEimSvlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4anHJ2KINxIoNQCB45gGLSnNvk8du0Rzr0VIEC+YLBE=;
 b=awHtf9NSykIZdujfOGqiJK8i3J9N2XYqrNVPGJlJcp4hPP1babdACl6J1qFvsxYpskTFOu/iAO7Cs/gdLhkU/bck86uidADlsQQt6coImUcEogivlG1kRxgwG28kaKoMeyUWZYNqk05m66nfhAypjnuGA7NqnLOPv1txY8CyEYk=
Received: from BN1PR13CA0028.namprd13.prod.outlook.com (2603:10b6:408:e2::33)
 by MN0PR12MB6245.namprd12.prod.outlook.com (2603:10b6:208:3c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:39:44 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:e2:cafe::ae) by BN1PR13CA0028.outlook.office365.com
 (2603:10b6:408:e2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 07:39:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 07:39:43 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 02:39:41 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 3/4] platform/x86/amd/hsmp: Pass struct device explicitly to ACPI mailbox parsers
Date: Mon, 29 Jun 2026 13:09:22 +0530
Message-ID: <20260629073923.1595696-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629073923.1595696-1-muralidhara.mk@amd.com>
References: <20260629073923.1595696-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|MN0PR12MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: d482053e-c6ac-4b44-cf3b-08ded5b1960d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|6133799003|11063799006|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	sNZoZdJ1EH2Tb8OFw16M63do5uNoArYNEluzjeQnPuccxDKL11W5ShL41Gft8pHrBEAc8BgxMI4wObDaaNsK6KNFCjseFTEQ5BdDCyR5sEkefKk6tzL9d9qt7OLYweo3eBOJzp/+EAjfNjeKIgzBegAIc0jGg1GU9HStCSNgGiJxO2z3vVHHQ2WQ0oakMTfx6SixP6bM0vyW3UR0eGxTiBPu4VWRzke04FahzLht27YtOe3NnXl+q8xdNxLLSuk0VapnwD+TJcsEYRGSlR0JXq2vZT/v/GpB2L0gaPyXxDz94Mjh7606G62fvwx4wukvuzHmuMpO6VVKigfmGWHffsWAWzPR73pJlg7f8pT0V6not2eMMkIV2MRNE/WiQ92SGWrnqF/JcpW45y6LG/FZvFwnmPIvrm+jg9XtMcjVFgOfU2JK0MuaCdwAkOC/FBMRXPGz4bFC9KMKOT4fOgmefy5xTubJ1QAVtWnOKvrzV53GAfvRPgZvbAoyCkoNGluwRImXA5OgoQYxX4U3ie7bzzI+S2BmDurGQ922cLU1WmWDHNzTZ2+HwmEgYiIdqZ2nPEfNldSJq8kArhe1mszbclpgFBEBpU59bVK9dpBDQ0P/0o2WdVjDSsmChoSoktPBTtvfr+89uLEDPuwF5jNAcgM0rtfBOBPGQnqKL1BmvzGpZHo49BgO8lY/L3KH7vZSFMzetrAPvSqu9PRxcj9smw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(6133799003)(11063799006)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W0tmWTQo2dTbwl6g7vgE6xfAEgSGxWS2jwK+158BJrq/gOcUMw4M1seiuzWX+deF4bI6f5AGe+XaUyzFzDhrLcdjdAYJalp923J8PU7+OnhIFWpOw3LeeKtLUi26xYSES/m2j6fVoXG/U0Pb1Dgq2oSoZ9KKCFtbsP2yGM7v2I1qqGjYlEhgWipfo45zdQDR4cRj7wIoNoUOZz6740v06kkv3flroKb+ToTv6f2JVzGWxtQocZY3f2Oe3gZlAI86xONpbcm8YIEQbe0vcCeN/mNcRBZTFN9os1XfL7kN85/uo5TmQAZWTihvwY1CMstNYy4Nar+WzorDYgoopTXt0wfk4BVOffy6cPvSc/gPCt2xkKov9XkRKfaYUJvCumU++uy0Y7A2SVnWFeMBaZSMFGaOiOVr5Wn8ticjeTBCMhL6IHTJAs0abLE4Rwu9edWb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:39:43.6179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d482053e-c6ac-4b44-cf3b-08ded5b1960d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6245

hsmp_read_acpi_crs() and hsmp_read_acpi_dsd() read the ACPI handle and
emit error messages via sock->dev.  Pass the struct device explicitly to
both helpers instead of reading it back from sock->dev.

This is a pure refactor with no functional change; it prepares for
publishing sock->dev as the data-plane readiness gate only after the
socket has been fully initialized, so the parsers must not depend on
sock->dev already being set.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Link: https://lore.kernel.org/platform-driver-x86/20260625123337.886435-5-muralidhara.mk@amd.com/T/#u [1]
---
 drivers/platform/x86/amd/hsmp/acpi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 8c3185ae6395..f7fbba4c6b66 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -107,7 +107,7 @@ static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
 	return AE_OK;
 }
 
-static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
+static int hsmp_read_acpi_dsd(struct hsmp_socket *sock, struct device *dev)
 {
 	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *guid, *mailbox_package;
@@ -116,10 +116,10 @@ static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
 	int ret = 0;
 	int j;
 
-	status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
+	status = acpi_evaluate_object_typed(ACPI_HANDLE(dev), "_DSD", NULL,
 					    &buf, ACPI_TYPE_PACKAGE);
 	if (ACPI_FAILURE(status)) {
-		dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
+		dev_err(dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
 			acpi_format_exception(status));
 		return -ENODEV;
 	}
@@ -142,7 +142,7 @@ static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
 	guid = &dsd->package.elements[0];
 	mailbox_package = &dsd->package.elements[1];
 	if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
-		dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
+		dev_err(dev, "Invalid hsmp _DSD table data\n");
 		ret = -EINVAL;
 		goto free_buf;
 	}
@@ -192,14 +192,14 @@ static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
 	return ret;
 }
 
-static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
+static int hsmp_read_acpi_crs(struct hsmp_socket *sock, struct device *dev)
 {
 	acpi_status status;
 
-	status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
+	status = acpi_walk_resources(ACPI_HANDLE(dev), METHOD_NAME__CRS,
 				     hsmp_resource, sock);
 	if (ACPI_FAILURE(status)) {
-		dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
+		dev_err(dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
 			acpi_format_exception(status));
 		return -EINVAL;
 	}
@@ -207,10 +207,10 @@ static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
 		return -EINVAL;
 
 	/* The mapped region should be un-cached */
-	sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
+	sock->virt_base_addr = devm_ioremap_uc(dev, sock->mbinfo.base_addr,
 					       sock->mbinfo.size);
 	if (!sock->virt_base_addr) {
-		dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
+		dev_err(dev, "Failed to ioremap MP1 base address\n");
 		return -ENOMEM;
 	}
 
@@ -232,12 +232,12 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	dev_set_drvdata(dev, sock);
 
 	/* Read MP1 base address from CRS method */
-	ret = hsmp_read_acpi_crs(sock);
+	ret = hsmp_read_acpi_crs(sock, dev);
 	if (ret)
 		return ret;
 
 	/* Read mailbox offsets from DSD table */
-	return hsmp_read_acpi_dsd(sock);
+	return hsmp_read_acpi_dsd(sock, dev);
 }
 
 static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj,
-- 
2.43.0

