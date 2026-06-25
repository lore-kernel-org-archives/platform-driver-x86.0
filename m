Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012035.outbound.protection.outlook.com [52.101.43.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241963E276D;
	Thu, 25 Jun 2026 12:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390858; cv=fail; b=nizC0vDUyfQmoW62/GgfisaFMCXLBbSaIdwkYswuGKqTAjo2DX0tWcADq66m6PHeEvmSheF3QWIllTxryHDljSScVfGnbFTBjX68PaVBoSEyNaix6i7V1mliSWaYVG8n8Sym9doYOqBvQjndTFy1erwVezrLxvYVD/banG7dtpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390858; c=relaxed/simple;
	bh=X4Y3MhFu6UwBCDm/tWLivy2b0u4MoNQVGNtDey+oKLk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MrZrX8jyAgSxEqZ393AffUsNIGvjAebv3/tI1b5JLdejCuRBX5+fwAvsfGsc4p9DndEEMfhlvnoLtKCVyzWr9uTo1pHt9EeOh76urH50mZewbVcV51mqCuB1tZ9OJQKY6mhpKjNxKfrF+nMbJamPsKV9vmC1oA07qkB5oxFYCJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lmQ0aUZW; arc=fail smtp.client-ip=52.101.43.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lmQ0aUZW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAh5JjuHsinx/zPK7DBXXmcfKXqoEZZprHASR0QpUediovB74bmfCEnYCuFNe0tZb0iadlpmCTxomgo3Xc5cuBECbJxPQj+aca60HLzemZ0v2sXMpKWaYqcPcDpOgB6ZgeWwSS/krzJCxKrIDyF8t2ZM1/bie2VdT7fDboQFladPx5fhkoKdIsU57g4YfyMnN73f6s+5gpsakEFRVD33ThYrPNXq8ZLd1RwlIcERS/aSb4ruJ+JTl6GGmwei+3M1bq2ngSDbM+0qBHVDb4Ab+RlN7b7K5b1LkGJdxzmIMq57Fn2zXWUDOJrd1qXM3bZNzWRzwdTuC/lC9ck0BTSX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcKXGaZZCvKYGdiKzDf61InFz9O9evlZU/8Q2pEVqdY=;
 b=W0XXlnqN7Sja2Is+IPiCio4CIqmLKUJYLn/5Eqbg+CjgtiAW1NE2wyOoVX8Wy9kwZNCtpoZQv+8by6TI/hQ2q/Ge78qSHJyPKDJH5t60moZvAaSpHL/4oMGdu5xNne1Vmh1ULsh7k3LAEhpQnZw4643bQa58TVxM0R9DNbr4EZXQ1MOnqDRTgwbEEYe32L/E/Vk+yR6etbPgOSsJTvJb27VBtBZgznLd9R0LN8qi3XE3CfuaHMrm2d9djX15bTfG2LZsmC9C6G2gDjnIC7mmyx1qyca/Km6sOv6XAuJk2WmlmlhFej2LEKtKpTiu7jZVqeRGDDel+EGmARcSbMEm6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcKXGaZZCvKYGdiKzDf61InFz9O9evlZU/8Q2pEVqdY=;
 b=lmQ0aUZWCi5klotvMxo02UqiQJH4pPKMuM/KYaEKAetHiGwDF1uy4pQHhJOqoTV1XakRyXKQ2D3cEntYQaxwN9zIfFC+tOgpfPQj5ZIqYpGtk9kZxIjcllVC8vPpQoMNwBOjvmSJ6s/GVyDxCc+M6twCWfRann/xyv7EfiQVqB4=
Received: from CH0PR03CA0313.namprd03.prod.outlook.com (2603:10b6:610:118::34)
 by BL4PR12MB9508.namprd12.prod.outlook.com (2603:10b6:208:58e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 12:34:04 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::92) by CH0PR03CA0313.outlook.office365.com
 (2603:10b6:610:118::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 12:34:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 12:34:04 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 25 Jun
 2026 07:34:02 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <muthusamy.ramalingam@amd.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 2/7] platform/x86/amd/hsmp: Validate ACPI UID and _DSD mailbox package
Date: Thu, 25 Jun 2026 18:03:32 +0530
Message-ID: <20260625123337.886435-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625123337.886435-1-muralidhara.mk@amd.com>
References: <20260625123337.886435-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|BL4PR12MB9508:EE_
X-MS-Office365-Filtering-Correlation-Id: 717e75da-55b5-4941-fcdd-08ded2b60aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2B6JwQpkT1m0F/eat7ZFpZGqeEJNo9kjQHYPRRpbbKp/Z5J9yWd0TI4OkpPFLVa1CDQFKAn+ws42DbZMIqc6hBOAmBhMkPcxKTguPiAoKeKJkdbrwNO0RxvLA+SNaG17LUQP2GBoW1tVVmuOPYtImqJiRyv6AwgakPVsHO0L3SwHb8p+ZgL9/sJKGVfgq3B2Xn6AV65ziQQET7mntxwmlKV8+sehjQo3is+i6LE0KkKjjfpp29CI0itOqS7mQd5LabIYCOI2+QSqyYWp0DyU4MlOQiXf7x5JxHmQTP6L2vldYUuCJP6KiicvajzoVr3Bm6K8l00n0FFJLMdiOvHnhM/MDxOK/cX7TuCDbf7pXaIwtVqSqbnVkXZhrBQMO3hxtof6sfd/vFf5znaRouZysNFB3yVBAue21XLM+b9Rjj+tp1BWI0GJMkpDug7nzwlr40cJbGCqTnVMJ54WPlcPYRUB4JoBKKXFkRZZ53poRVfX+xUDODWpmGUmNG4DFylmOmR8M/dPq6Tt4obVVcGqyYshH/5we85xUFrM6CEvinGO+fwHmepq1h0mkasRQd92PQqqTEiWqcbMwt6yLooN7nR7jA1UGBQpaIXv9cAMjZ1v1kbM9xwizZsfP375xU3iIxvsSesVrHJSTe66hXCKB7mQ0N9naR8aaMFaHni+F8wxhWt2gQyRgVCxcms9ZbNeU2Lp4Pzs0QjCvSz9Kj8+6w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	88mhVSYz+rPTS4xdkkZqT8cZjTD2TdKfxQNomyBIb+eIDvcB8CBWgZhVM6CBjXnRgNHbVKEmrDaQGUaE93vVZ6LQWez/BfFd9yRKelaXl2LtcKuqzt7vOwIsNZ3ky+oycHCLJcnS/EL4nioX53pzuqNRld6ULNp2l8hWfKdVKcKA+GzVyE29bBAXpRlZwaegztTFcjKNDotRaFH38bCbHgsS6hT9rPtb4xdYhVCqHu0t1z7hAzfPCizo1Vvb8amKEbi2kmmWBQISmrdyyf3ypY6A1XTZ7hKKp14pGYt8LDXDZMQ9gNxGuad+ziGnrfb4U0CfP4GPGs9JUGpPGyQozBAPwUswupEQRMIGn/xZWbT1n5CzPYNya0GfT/0p4TquNWijUtCMrvolfDxRD8QiEi2uDJahINAhdLN9+WZ0gN+0NAcv6WmZZuWI2XqDr68i
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 12:34:04.3069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 717e75da-55b5-4941-fcdd-08ded2b60aff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9508

Harden the ACPI table parsing against malformed firmware:

hsmp_get_uid() passed the device UID directly to kstrtou16(uid + 2)
without checking it.  A NULL UID or one shorter than three characters
would dereference a NULL pointer or read past the end of the string.
Reject such UIDs with -EINVAL before stripping the "ID" prefix.

hsmp_read_acpi_dsd() dereferenced elements[0] and elements[1] of each
mailbox sub-package before confirming the package actually held two
elements, allowing an out-of-bounds read on a malformed _DSD.  Verify
package.count >= 2 first, then fetch the string and integer objects.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 696884a91c22..24296747df47 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -24,6 +24,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/topology.h>
 #include <linux/uuid.h>
@@ -82,6 +83,8 @@ static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
 	 * bytes to integer.
 	 */
 	uid = acpi_device_uid(ACPI_COMPANION(dev));
+	if (!uid || strlen(uid) < 3)
+		return -EINVAL;
 
 	return kstrtou16(uid + 2, 10, sock_ind);
 }
@@ -153,12 +156,18 @@ static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
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

