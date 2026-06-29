Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011008.outbound.protection.outlook.com [52.101.62.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A49C35838F;
	Mon, 29 Jun 2026 07:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718789; cv=fail; b=KeGOuupzVD6sJSGXyuOmxTlswsu6CZi4YLvAl8mJDFpwQxi+x9PpnYN6BdW8bWeB2oH+1PvIo4cRQpIiNCxQtVLYfooWLHEISzyi6pBglcIVpzJq/KCvc9BMDzEx5L8PZzQyubXMrY9CBDOFJIDxZrzyYbacvHaBHObnjCG9Jzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718789; c=relaxed/simple;
	bh=GiFZGh8mQ3uwLN5gdSN6xiilQTF+mFVUfRlnwVyulas=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CsIGaCa3WemA9hZWxDVv7PW03D/sxNSsI3aeqK8DsNqi75l5q30nAESKl5vYfrYWwu4AyfpYhrUXlR+pCQsFCWl5cvIkO8CLVygtX7rFxlS3a8fZjb2NOWOzsKhEoAJLTuYlY7IJ0aIOiao12kJBnXXd+kUAbiRoValfL2eXgbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=F17niEyv; arc=fail smtp.client-ip=52.101.62.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="F17niEyv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBVc87cKqee8YjnJkJjFKzCaLMBiRgvEIjFaceRZK1jnII7lIW8YRhce3VByBksEgSzc9dXNeco5WsaRtrBzj25gvIceclcud9dVkif49BHEewGjGYEAqbhQRv2qWNQ28eOXpYlppvl66W7rWO+24Cf/adXLStCkHdZADZh1CMFN59z3yxq6uNAxwFe7yqC02d8CYhifmfCTK1IaIYnbwJxgo2/ujeN3dql0aIn/JlK2QhTy19UI7VULhcYpxyb55mFnehyb1vuTGS4PMjzAgNLsLyr6bRByIDFgoMrVL0A2cf2U5JOqKxPK4WDDqaCoVD7tI+OygciSNt0F0meTNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjQMDnFeEDjnKEuC9pdLJKOSRjhxzAB+++N+sGpIUkM=;
 b=d966DEarXh+mdmDhcarN9/FN1i+2H9v02xaPHQh5lAjyXHLMW1Sff47ijwFQmc6iAjgorArryxgbks8RZwvTgI/T4ZdYTof5Q/iZYorbUZT6T+xCMT78le6NDJZ+GJpYZZJXz5FSKAFswBK/vxQtTXU4rK6kf4Y9QGfqlkzk0c3HDHxUj5ziCydZ6GC38zRjOkI3pEnEQS/G+K7M0L4kstuH2B78eDbEnA+neXNXMYs4UPBdoWKxzDe7yovU2vRalLDlyxcGChPHYGwf2SQZ20W068gxrIgVUHD/0y2+o+doXMQ/2s/lboHFJRV3wYUyMwlDghfDJXghW9LUPK1Ykw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjQMDnFeEDjnKEuC9pdLJKOSRjhxzAB+++N+sGpIUkM=;
 b=F17niEyvam1zBAnNqZXGI42PEXJwIzU9iG6tKjNzXft3lvKk9b0Il69MLE/07nMruk997/jwB45qR2BdV3NnY4MHmd5KnTcAm735WDaLPHi744qmiMAx1vyVor/Xd1CPmNl3AP/6gbOd5FZCXIUw3Z5+EcgmpZokOIm8AMiSTB0=
Received: from BN9PR03CA0500.namprd03.prod.outlook.com (2603:10b6:408:130::25)
 by LV8PR12MB9643.namprd12.prod.outlook.com (2603:10b6:408:297::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:39:42 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:130:cafe::70) by BN9PR03CA0500.outlook.office365.com
 (2603:10b6:408:130::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 07:39:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 07:39:41 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 02:39:40 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 2/4] platform/x86/amd/hsmp: Validate _DSD mailbox sub-package element count
Date: Mon, 29 Jun 2026 13:09:21 +0530
Message-ID: <20260629073923.1595696-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629073923.1595696-1-muralidhara.mk@amd.com>
References: <20260629073923.1595696-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|LV8PR12MB9643:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2310ef-03c3-46ca-ea65-08ded5b1950f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|18002099003|22082099003|13003099007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	hb9skvuMxeNnDkLJ2tm6tbdZIZLbYWHI2TBhvzeZIIDA79Tg/1E81SIPS+qgURo/2h9Uq3iVo5Xs5YAn+xvQXnqkVhrOYXeStauKJWEBSs3Hs2+otPAK2oS2OjffaRkb61g+v35F9J2vW2Y19hDyBlg78Q5bd/1UUffZN6GpkkQXDH1fVtMwx3g+HaYOc3ZESAxNOYRCRrBQSsObFSfXQuDlSCHBLVL0XvpHemTsERAkcZQ0CRbvVNiC6ALAQ6mC//HuJD0LF6I34f5pIz0wlUPGp8WMTt4brtqkgnjdqngfAUUkW9pbMpKQypZDUTgSALbcy7xIYIfQydf8pDGdkKBByIV4lrd4P6BASGmfYuO9YuY0QwS15JkylXms0QHNj9KX+yyef2aIl+O6VT4ECulBeCZLg+bymcTLHwHrStZJ4YNM38t/4EaCL6xPW1RuTKP0EU6ijQINmgYOf36uBxLDEkEfXOjT0ciGUsHYutj0wg0WIIxWDvVB1PQ2g6wz6RoMGonNGD5ofzecjW4G2rFysLGj/oS9Q4Yu8HO2qLZBwYakuTlghwQckv6RDFbNUQeJVnRA4+Wb5Uit63SiT27n9lprSl5jGOeEXZAC0Xiu8id/KXfUAYWs5YSTWAy/718UD7SYQRdkL729QlWU/chuNRj/Bg8su/1Tlv4eJiUlDZaWuMppjSZWUY2kgx0aZ1W48wSRoLffufMVPC3pog==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(13003099007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qQ+4T7vgU60kp/Y8qVkLZvaQamVLnWA0CBAZA2qECVZ/+GNd9g7yDAGvaChQaNxEjYl/rYbID12bs46Hiqyjbnp6TF/biwAczQLd/PJk2+0d+AFsl8kTEAtwX91t0p39FPmx/yO+suNA6OhLRkmQIXmXXxZo65d0ZDf/k339LMYh4GzANGIZvz1pGbpdWEQSRObYvHG/qvNFjBXHdgtoYHNCFOvKugU6UvTH7G3pDaYd9BSEAsBFqJ5H8c4Ys6YMCu59Wz0Ebhv7VKYZnUdBLbay0lGU0C4ZnNO8nLrLZtY7e5OIa0BQ5IEh6ogHKv/wYId1orwcCyxk96qzqW+tM2yL8lzDal4TWozMQp9mt7JZ9vryNtlIarzXmibF8BR+luxyumBtuB99t+lIbCnEiV3Bc4kzYVWUODyizbRshU/L4RPpOscwsrfBpRgMbArR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:39:41.9594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2310ef-03c3-46ca-ea65-08ded5b1950f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9643

hsmp_read_acpi_dsd() dereferenced elements[0] and elements[1] of each
mailbox sub-package before confirming the package actually held two
elements, allowing an out-of-bounds read on a malformed _DSD.

Verify package.count >= 2 first, then fetch the string and integer
objects.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Link: https://lore.kernel.org/platform-driver-x86/b723da76-6309-0cd4-59e0-5931231f585d@linux.intel.com/T/#u [1]
---
 drivers/platform/x86/amd/hsmp/acpi.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 4a1ce4cb25e7..8c3185ae6395 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -151,12 +151,18 @@ static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
 		union acpi_object *msgobj, *msgstr, *msgint;
 
 		msgobj	= &mailbox_package->package.elements[j];
-		msgstr	= &msgobj->package.elements[0];
-		msgint	= &msgobj->package.elements[1];
 
 		/* package should have 1 string and 1 integer object */
 		if (msgobj->type != ACPI_TYPE_PACKAGE ||
-		    msgstr->type != ACPI_TYPE_STRING ||
+		    msgobj->package.count < 2) {
+			ret = -EINVAL;
+			goto free_buf;
+		}
+
+		msgstr	= &msgobj->package.elements[0];
+		msgint	= &msgobj->package.elements[1];
+
+		if (msgstr->type != ACPI_TYPE_STRING ||
 		    msgint->type != ACPI_TYPE_INTEGER) {
 			ret = -EINVAL;
 			goto free_buf;
-- 
2.43.0

