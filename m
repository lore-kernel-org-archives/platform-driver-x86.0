Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011029.outbound.protection.outlook.com [52.101.52.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ED743C055;
	Mon, 29 Jun 2026 15:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748622; cv=fail; b=Ga+0z1eods9bLmw1YztoBLBjPVv4N/l7Ym0X5ll8SZKYLKv5vOrhsoOZU0+eZNjopt5B9QshqsJaeujJMAzoYg3/P6M7+fezOAb/844PFjjJyQPkoddko0KpSLPh00gdKQmsemYVNTi2thZgyrRkE1eNsy+zeGSDjeSJPHHpNso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748622; c=relaxed/simple;
	bh=rsRaJ7WiRsPO7gRdQp2z0FOpdjfzenvRobEJ9jUL6D8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tsDGhh7a3K4pvItY5KXelGZ82PpMsTkujW1oC0MJe0OF4a+wWfCbLdGP1vykMDYx+ADkwCDt+xBMmFYDsLN11VnjON9WHGqNr6AvTOPasLkgPM4K6pa/UKlpoVYSbFmYHim3x//D4ROE6QfxbMPs06YuQxeFIIhMuUCwmGdnBlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j6TYgxg7; arc=fail smtp.client-ip=52.101.52.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j6TYgxg7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ss6Pm29jIh/qknMfI5lLzj2vyH4MFCup/pjUH2RB1Zom5rywCTwjPK6TwZ9Un+zcuZjuR4K63ULa0cWkchKNbTvdlPHdcA0jQFrTPFpXRX2vDjEaMv/BILZGcBtBpJMqvnM64XulNfz2kjY+ld9SHyv4T1zZZs6VBzkcWVqIqjBb4P6Qu4PUs/pNaEpu7o/kB0d/yY10lPcdICg3PcWTM2zc4BAYbtqsBKL+jcbwwvSDhwa0SBoJK2adnO3bIPBtMqTjFlrgswiWA2K0GC5sSXxhQJ2WUlJeOeVbh2wYBAVFTkPfk9TymBTkzsqLon3nI0dzAmt56bSeXaFvcFENtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0VuCVTPWqk5kamdLoGQSm2lGqS3aSea83u2xeI+lus=;
 b=YBcjW5ZeCGHph38aW0tqYdIft8mu/lzCwJHIykku3vOZX2bXoaRyz+m2+I8JTQc8Iw1yldWnFkvKA1PxpXl2QBNr0gfwp3WHkIijTG8uEFtlKJL7GdugDtqKlXbjjohZOTed07JA2RGDmPyA37JYnTRv/1yWI0IozYSeqySW+dexB080u5ZyJlGbrmCtRw04Em5OiLRhpPUjgSDaIsGpw8qD+22hHEkUx993Mk+ld4t8VpcuOFIH8ne1chEczf5CMIO+LPWSIPizITIgwBYKliHr2QbdMvvnpT36dSdM7tfnYIscoSlj13ODoILKKPdZx+SZFEmTkHKj6RgM3FL9Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0VuCVTPWqk5kamdLoGQSm2lGqS3aSea83u2xeI+lus=;
 b=j6TYgxg7eVUyimuhrCLBFuf75v+ke3H9MRB/Zvun48zZb7nCkOlxXBm216dcT1WGYP6txEWNli0vA9LsH8nGFVMiwJGqcscD85NBNjKPjzGg9NTMx3+qdbmLyJ3FpEvgJr98HndpvO0OHLrBRYirGZXO/i/u30FWFhz+OYVfUmo=
Received: from BN0PR04CA0031.namprd04.prod.outlook.com (2603:10b6:408:e8::6)
 by SAVPR12MB999144.namprd12.prod.outlook.com (2603:10b6:806:4e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 15:56:57 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:e8:cafe::5c) by BN0PR04CA0031.outlook.office365.com
 (2603:10b6:408:e8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 15:56:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.0 via Frontend Transport; Mon, 29 Jun 2026 15:56:57 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 10:56:55 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 3/4] platform/x86/amd/hsmp: Pass struct device explicitly to ACPI mailbox parsers
Date: Mon, 29 Jun 2026 21:26:33 +0530
Message-ID: <20260629155634.1807598-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629155634.1807598-1-muralidhara.mk@amd.com>
References: <20260629155634.1807598-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|SAVPR12MB999144:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad1a5e3-7e41-4eac-6b4c-08ded5f70c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	xChQ687YBgmgzcY+rGS6PL9d276syQTqBX+iezZGZa8QSsSiMumUh7diRzrpoPVnRld2KRkbyRImYa6QkrVgfCpajVcMhShaCm8cS2V8Jc3TieZZ2SMN0zmp+K2mseR7eRa9vJTLbCODMtp4r6jqPE7mE5kHfa3joPXAFYqBzjOFlWWkgsyx45VNl1gubcXlga31mC+gapYjQUq1mfsUTBzJBDuXkIINQ+yDE2RABydmlmuWpGZ/oF0gmwxThDorikKCTE6i0ftd35uviOZcQq+VLflvC++MrqOC6JEixfelXhUg5TTngvZlXj8H615Pr3J5Su/2TV3gOZh6uIR1VjRYz3+iuBYs9biLWDuSiXd/LlajHHdss3BaCklByxLR0J2WDeV6l8SkDgU7scQUQRH+a13uyP80ox7vxTc29VKB2KAsMMROm8iuOY5zICsffZ7r7dSa3vogoj0NP+F/CgJNtbZqo0/XEwDer5syuHGcd2GO1KoYz+RijBGXH3pSjpFB8mQUmRI4wTE/DMInoAssH3GvwTbq8RIaCnPWcjdH/tvAD8/THV9fO762tzZ9vAa0D/7Tt0roKEkV5Ecfq70e4aCWiLzSrYXF0KV4zuAKWbY7QHLklQQRCtmh4tPpQtsXhbgCLAsWCm+hN/WGsEKuShsJaicdTyp937u96vjZy2vcEsMdH7Ukyzag/HkZHqibhxi5aGGMXXUWNJrWkQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	21gUOdT5KXe5xa1PVXQjVagSbQ1//mHwWQAQt0/BMpllIoTO11PGdYqtkDxj8KUyVKjAQte4pHNQgBHOiMTXkduxb2ih644QNyPJZBeKil+a7nGpomNfVNu0HniPnoyj1tazYtb2cSX2zW/GRu0BkYXKFt6S+qIEWTwlw7LOmhOR+zgNuADCQRo6sSFk+ZMve+b6Ui9xPROGyX5pJHCSSj8UJw0JDIOmRIy8+VsJv+WJXi9k7Ajk1W1/Xin0Mww0OS3UGCpvNn/TP3uFiPVFEnHwrpPjeIsudRyU30T7uIqDVAOGtj1dgXLD+WBtemf8idDEfgZKgsW+WWaTxRNnwUsrCf/qIbDBCIOgSRTV27Vs9uPRxjnrIVq6TCbg0BlKJIzmxJL8k0RLmSrPUDnjp2jFg/zSjIyP8XEFf9sYkw7LJfrDy4hKplM6gm/1S7f5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:56:57.3578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad1a5e3-7e41-4eac-6b4c-08ded5f70c59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999144

hsmp_read_acpi_crs() and hsmp_read_acpi_dsd() read the ACPI handle and
emit error messages via sock->dev.  Pass the struct device explicitly to
both helpers instead of reading it back from sock->dev.

This is a pure refactor with no functional change; it prepares for
publishing sock->dev as the data-plane readiness gate only after the
socket has been fully initialized, so the parsers must not depend on
sock->dev already being set.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 8c3185ae6395..1fb09251d826 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -107,7 +107,7 @@ static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
 	return AE_OK;
 }
 
-static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
+static int hsmp_read_acpi_dsd(struct device *dev, struct hsmp_socket *sock)
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
+static int hsmp_read_acpi_crs(struct device *dev, struct hsmp_socket *sock)
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
+	ret = hsmp_read_acpi_crs(dev, sock);
 	if (ret)
 		return ret;
 
 	/* Read mailbox offsets from DSD table */
-	return hsmp_read_acpi_dsd(sock);
+	return hsmp_read_acpi_dsd(dev, sock);
 }
 
 static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj,
-- 
2.43.0

