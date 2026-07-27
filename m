Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010046.outbound.protection.outlook.com [52.101.193.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DC5370ADA;
	Mon, 27 Jul 2026 14:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161772; cv=fail; b=DcqVHTXsxgJLYrjEEdCiwoSX+ravR/JahqrvWU3yEuR8HjGj0HFLo2XMNHLR3Z9k/dlLrniHqjL1FETqhCVplad/ktsy3HjoGgUlqj+TvmN0yZt/5pxExpX4Rpjme3newrYudmIY3WGUZ5OHMVUUsCmRfYySeJpmrCN460woz4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161772; c=relaxed/simple;
	bh=ZwhYcUzgSEzAnAoq+PW931XGUst8aQR6OZI89UCunYY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tMPVpW3rwpwIdE1f8J9sj2CHFwrL1LGbc8/S1AKJzvA3uAkvQ2D7h6GYlf6fYygJNdV7+AIJIDfk6bwd3huJdqTzEGFGOBx/TYZflsfoe7xGSpP3N3ecz9wo2pRSTjfEEvZ8VZSd633ZQRHT0ziBzixvi2HHmUgxwnq1yOP2Pfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tCmt/ppA; arc=fail smtp.client-ip=52.101.193.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tCmt/ppA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fr4UmqNg4hW/EDrcf5vvDM7zBLZKalva37EgGM9Gf/6jADyiHeWvKggc4vv+qy7iOpHqw8zca1Yzp2VdhmIocHBoMbjXxpMa8N6l3skhYVPBW/6o+/saCZFDofD0fl4a629wvNutFHauhtnL3Zomuj0JQkJcoCftY3r9L6O/phUKQaTfbiO+0salBwXUEcY/YzjFIY8KbnrpffsZjfcCSGZSAnDp06nexZixus+KKv+VLPAseXbezuIpjG8oQAmuUHe35ivwOll/slCA0/3XffQ4XXcIYjEbytChXrVrLeGVHJxBBIzQMDsrLnBIz/umwPcIAmh87DXahB3x3dkaaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsPUVDeGSxRJxeXxzM3G/MaScz1X/DD7cFxvw47GBdo=;
 b=yBRJU1P1E5MZJ0GOZwvqv92jS3QWrASzEl4hTe+qJbRrYkgpmk27s7bNS5vnSWVuAeQJQV+rbeoJYNVaA4SALXfWN6NzYXUKdK3bNWSjFwg72mHd9u01BJygrDTTX/fiFkPTX+DNUabpC4kciDSUhNEQqLrzfhRDyFfjSEmQwhqDW894nSD8f0TgEO80I7Th+ofgV3LByBRn/E615XkQLyoYpE3DCQ507wmRpq5BOZ2PN3Z+4oF8aYguEFCaO3NxjWDzQepMnEhCW6YgGd06v0rLo1UEx7QfnSVtMN2ANkkWfieRoNyllheXUm1CerPlJZ29N2vUpLj+u3uiOujytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsPUVDeGSxRJxeXxzM3G/MaScz1X/DD7cFxvw47GBdo=;
 b=tCmt/ppAtBwZbL60TXX4qXFoBSpFUNk/MB4Fef2v36ftPEadvl3qA5r8ZYyLJE0cGcy2zIG5wq3F7YMlCulZGQvtplRoB54wWIJynvon4gl6ZO37Nrc9cY1itAF9iI9S0n67ZriaP0X8z723Q1CRWHs/4sllkwfkZViBHoKCNJA=
Received: from MW4PR03CA0212.namprd03.prod.outlook.com (2603:10b6:303:b9::7)
 by PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 14:16:04 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:303:b9:cafe::36) by MW4PR03CA0212.outlook.office365.com
 (2603:10b6:303:b9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 14:16:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 14:16:04 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 09:16:01 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v7 2/5] platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound check
Date: Mon, 27 Jul 2026 19:45:39 +0530
Message-ID: <20260727141542.3370108-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727141542.3370108-1-muralidhara.mk@amd.com>
References: <20260727141542.3370108-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|PH7PR12MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 298ef1e0-1563-4265-1024-08deebe997e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|11063799006|56012099006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cyDMvC2ZkZRn4lTH7eCcjxd2XyQ1Bwl7+kygCPOB9UbVWPOXz1lm5PqfeK0QVVGhQ9AoWxhYs0WDICUmBsUm90GmPagffRIWvBNtMG7OO7C6XA2ZHDDeViJ6trktARzLR+iEMeQtLH/hDDCAK0GOIWCXU5dJfTjYa8jw34T36zbSQXyyZtbv3qzmTV8eNV4bsf/ElOdPJ+Qz4gekwR52xvlfG9CjHUY/gHrWhG/4rMLdgD41yh+2Phn3X4W4PAPfVMdXrojD729XbuDfH2ko6yFaZwrqYE2R/U2A5VTZAI92FM6ZtynyEbPqMDfMN3sp+Oohe2j8gY9fne/3Lc80d7oK9Pl1LMNyw6Wl3NkncSKjEYQW9x8OA6kosBnaFYqqKDxsoJCsvtNUXy9Q71HIoBZRShYlSeBKQiilYtTT8U5Ln4BBsN/YzsffL/lhlqd1eUScdrbQrad6tqccO+rrdopa+OeyKoMT1+wW7FL4YEY3yk80GvqygHHeW1wcJmN3tAPxYgNuIHQXWC1un9lIZ2q/k5fVvPaMf3ly4wXMyrXwHP2Xs9F4o+mnfLv+kW6aDaKqZd7x8YF9ybSIFG1vmi8r1vujsPdX2vOoBcz9tV6AO/h6bCmnVFKbtsfPw1DhUCvut/mb3tAptctWa9PisYpl9eXeQpL0QF/nqeLF2/FNB9lhuLQFocHaKdqUpAj4ADGIFt/CzuZbAymoXxzo8A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(11063799006)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3MkqgGxEA98TLu3n2RKJr12XxNjYAd17IC74gc77jkSzEsgQNsKP+GU0v3ZXk9vkGt/JwiVmja3i6fuowceBiGHNCDwq20xXCxpOF2cSnGBIDprUu5UGZKpW1fdqzJwo692TREhmlFmpP5/DsB3SEAGsuj65R5l5KXIa/0hUxrSPOIRlPDDaJNYskUk2DoaDexT5b7p2vHN9EW82izp7RutB6eXi+4ZUY+TXyQV6ULXgh2ocdNcHhZjRIXZL3+JGgUuEBYnkg5FjZn/g8MX0VfekRYqRtnD/2LsQYCfViInGAyhwH5Ffi0K5R6ugrCtJujPTGN5iBAFsT30CdTIwNgVI2B8uAj2fIpRSJ3VOyt/rXK+6xhXs4/No6tv9nXox4I6C5xM/3E/8YAnb3UdiGvp7dO1uDpXUc8GYlkYiC/ZcdatkGTGWzthJ9kAFQxZd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:16:04.0590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 298ef1e0-1563-4265-1024-08deebe997e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8156

As HSMP protocol versions evolve, existing message IDs sometimes
gain additional response words on newer firmware. validate_message()
currently enforces a strict equality (response_sz == table value)
for HSMP_SET and HSMP_GET, so userspace compiled against an earlier
descriptor table is rejected with -EINVAL when it asks for fewer
response words than the in-kernel table now declares - even though
that caller has no interest in the additional words. Only
HSMP_SET_GET already used a relaxed upper-bound check.

Replace the per-type branching with a single upper-bound check for
all message types. Userspace can now request fewer response words
than hardware provides, while requests that exceed the descriptor
table (and therefore the hardware capability) are still rejected.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index a457831c9c6b..02425f7e6f14 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -197,20 +197,16 @@ static int validate_message(struct hsmp_message *msg)
 		return -EINVAL;
 
 	/*
-	 * Some older HSMP SET messages are updated to add GET in the same message.
-	 * In these messages, GET returns the current value and SET also returns
-	 * the successfully set value. To support this GET and SET in same message
-	 * while maintaining backward compatibility for the HSMP users,
-	 * hsmp_msg_desc_table[] indicates only maximum allowed response_sz.
+	 * As the HSMP protocol evolves, newer platforms may define more
+	 * response arguments for existing messages.  Use an upper-bound
+	 * check so that older userspace callers requesting fewer response
+	 * words than what the current hsmp_msg_desc_table[] defines are
+	 * still accepted, while rejecting requests that exceed the
+	 * hardware capability.
 	 */
-	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_SET_GET) {
-		if (msg->response_sz > hsmp_msg_desc_table[msg->msg_id].response_sz)
-			return -EINVAL;
-	} else {
-		/* only HSMP_SET or HSMP_GET messages go through this strict check */
-		if (msg->response_sz != hsmp_msg_desc_table[msg->msg_id].response_sz)
-			return -EINVAL;
-	}
+	if (msg->response_sz > hsmp_msg_desc_table[msg->msg_id].response_sz)
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.34.1

