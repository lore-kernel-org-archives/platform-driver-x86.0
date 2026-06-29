Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013024.outbound.protection.outlook.com [40.93.196.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85913914E4;
	Mon, 29 Jun 2026 07:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718788; cv=fail; b=OsNEEldQn9I52wsY/m0HnOUL7xm8DH3MzzCLzMRuHt7rpu+Dv5L93PFk9zRgY6JMZzoutVFC9u0PZjExAZkLHdZFax4q6et/MInocP9ePAkXnd1mu3+2aKasb8C2BuG0PVYmt2IXrehkOQz1WFqJMu3ShhS/kqpSyh+qvYtPtHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718788; c=relaxed/simple;
	bh=5T8L019DkF2B1bQPyreNpThjqKvP90aaXkMtP7ffnb8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FQjSFMVK8RFVTLMh6LrgxO2Gg2Ju9Z6tj8cmZA6JXFUNhroadaimUIR9tjG2k0Nn1CrU8vLZPq50xx4wDIfUsNlWHaPSqDUtFBze7Fil4YQ4iPqt+mDBd9yaTNwYvoxO78B1Ym+Pg332qyPpG3EjxFJ0P6SwBSSXPY/DpUDtk24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iiORp4Vi; arc=fail smtp.client-ip=40.93.196.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iiORp4Vi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAtSDvTLBrVLbj7A1Wh3xyLLYPHMZzuC2H3GDBxGcrUiUgDLXwA6OoOaaauIqTyyaRi+pw9UeL+yThgi0ArX4ZLywmTyMXgkNo4SrOl8/sNieL1ZpLe5U6ftDbEuOtyzIfpaIpOYNnKjxmUvuvWel3a11qOlUWR7gRPq3gVSUTObtFSFoRiau6qzEBTaDk9n1QhJ9+W2FPDxbuSBDHAczgHHALlLupCusrto1/HnnYyJWX5G0t6iTCCE6cxLkeuilp+F+fDo5e90QumwtiaB3ubwkwHadms1PdC4vuD7hy0eXHahxDL3F2opGEQ4IQiPbdDAqqwrbAW3TrWxsWnTow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLsgFetBAcXpZtikJiueJyOzj0iMkQ0lPNJm6bmMdTY=;
 b=JILxgSFRtIB9BLdbEgpFagaJj9q9MitrWYa3M8MwurIIfRJRcZl4WJ8pzPXuu8yXD4wv/R4Jwll9hJaWY/YOjvDLlr9siXXcNhqWLVEJrQ1qkwJivDzhfib4++v3vYhcoggp3AZjPTJ47oNKNYVd/BRPZ/FI7hlGWP194XzrlpHZevDZCMALBSD28JuLS19aKcr1oYiXniEFwrJLdVFtQlNJMjn+HAEXWJQd1+sMqY9bTJKwBDzpjRTG43o4mAtyeRiXsYNyjSaZ+9WE76RuWlq8Q8zljl2hxlup2egVb/6YSu6ihdg9UKxpvhXsWT/pxY8KO5Bb6ZMj+UVpxHqBaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLsgFetBAcXpZtikJiueJyOzj0iMkQ0lPNJm6bmMdTY=;
 b=iiORp4Viy+YSwV26NXw2ekyQsIfEw/D9cs+kWPBPP2tF6271bVSUKHfeGg0RGc8Ti8qLat4TSYCv0MWAi2jSYwl2D6pzDvgBwfyTRwYDW+bA/D+oGC3DIltyGcKCgbqn47Sifsz/TksXI2Ib8WbOpxYLtD0PGAydGTpRjE7OkcI=
Received: from BN0PR04CA0111.namprd04.prod.outlook.com (2603:10b6:408:ec::26)
 by CH2PR12MB4263.namprd12.prod.outlook.com (2603:10b6:610:a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:39:40 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:ec:cafe::ae) by BN0PR04CA0111.outlook.office365.com
 (2603:10b6:408:ec::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 07:39:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 07:39:40 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 02:39:38 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 1/4] platform/x86/amd/hsmp: Validate ACPI UID before parsing socket index
Date: Mon, 29 Jun 2026 13:09:20 +0530
Message-ID: <20260629073923.1595696-2-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|CH2PR12MB4263:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dce2d9e-07c9-45ad-6f7c-08ded5b193f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|13003099007|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	THXavtvYuDxdCevCYBAW+yuS3ek5aadnGpiDaa//cJuWvJ4V00PrcRpCf73l6hPpCbXwamf57dsuoBVreqg72pvubC8W7YluU190clb0IvqUFtHIohpnQgso5G9o9UQV6hZuRr0LxomNFQl3N+GMtNeyKkZR9wR+SbOYpwMHH9mdzKz1pq4Sr1WIEDN+3T+e25Bu0YknFiKrgpo+bvdyeylTbUnveG3hhVvlzuTrtCX2tmmikCBaJiNMUsrmfAntq2pMM134+l3MydOkXrtWNU7WEeMoHel6SNj0cp1akBxstvLgftkoSq8fhMySgeM9XjDW8rwL5JNbYq1ECeBWAcdA6IDoC/706c8AGJxDes9qnpjuQgAt4LgczFPMn5dtAhQs9t21MxogjeuDTdWqazYz+j/kFpCwQCvZgWG9PHAdI3SlvH9pBzGSUip36TrK07PAWuGIYhwPtfH+mZQSmKDDeSu5mIJ1EGKv82B7Egt5fMGCg5Ioz6j9wuP/iHoed1IR/fqsSUGUK3XvXktN1y1eNNDccEkzm9O5UKyy85Zt4BQcFQcICKqbMO0Gm/Sqa4HAIxyzOSDeYeSRXCRQIHEihTdSeIDTJUdow8Bc5ZuDcW/lHmXmxnqHfN6ykEPil0PiWQCfItMvJyyCVIp/GFbkdxzZa02zXk5BOY0CiWpAQMuOBoYkmKwb3ZFiwvJxBch8uMDv7PZgZwF8mI+DYw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lKXdkTHYtwAnANMI+juE23F2BD3lTf4rUC1OcsYJ5z3VhiOfwhBTdtyVFuPGLtdf4tfHMSWzntRnVl1+XmT3syo09ngpGQ5Gt9dtiMtX9vvQrRBbmK1Rfc17ssFiH1v3aKXUmrXtRArXqNd/bLPqGbq0TpwxVi+XpZ7d9SVO9lQVSr9zv/XGbZiVwi1CWKGkNuoX0crWTDr5zQp0CV2eJNAnjJKhM8ZwDyCHDT3TO3r0gqr+RZyyl67a/3E+joh9lP81/+j/JR9RSR/JEROZ2LiRiHnclLwBq1P44Ff3SkORRWhXuTAJfBRpJYHaLhFeAkvzkcaYfEIKk7wBEyvZJbGySA7IJjuEigBsIdfcXbxY7fw56lDYrevREOYlPDIEXn6p1H9t7m3sKZkPqwneJdFYSqn9gN6fLqLivkQZmKkv19hossg7FzrYvpNK2doA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:39:40.1031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dce2d9e-07c9-45ad-6f7c-08ded5b193f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4263

hsmp_get_uid() passed the device UID directly to kstrtou16(uid + 2)
without checking it.  A NULL UID or one shorter than three characters
would dereference a NULL pointer or read past the end of the string.

Reject such UIDs with -EINVAL before stripping the "ID" prefix.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Link: https://lore.kernel.org/platform-driver-x86/b723da76-6309-0cd4-59e0-5931231f585d@linux.intel.com/T/#u [1]
---
 drivers/platform/x86/amd/hsmp/acpi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 97ed71593bdf..4a1ce4cb25e7 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -21,6 +21,7 @@
 #include <linux/kstrtox.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/topology.h>
 #include <linux/uuid.h>
@@ -77,6 +78,8 @@ static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
 	 * bytes to integer.
 	 */
 	uid = acpi_device_uid(ACPI_COMPANION(dev));
+	if (!uid || strlen(uid) < 3)
+		return -EINVAL;
 
 	return kstrtou16(uid + 2, 10, sock_ind);
 }
-- 
2.43.0

