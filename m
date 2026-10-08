Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010032.outbound.protection.outlook.com [52.101.61.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E00147B43A
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 09:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451812; cv=fail; b=HnB4zityL6rcPdULME9oKhsOwKKzGfnGOECGmC1oauYq+jlavYWX9EXFZXi6Sh4Rq3DwQmOeKjZERJLAO7W9nqbQfWTWt/1KD4O4Ln7etJWdej9lwD8/DVq9V8RWfRSUvdHfMFE8hOxGEiWIQi+k7CyBFoVbJWiDBV+MfjOqMBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451812; c=relaxed/simple;
	bh=Q6PQ0QuxczKqXkP9glVNRaR/JXp/rTigBMfXXagwceE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aGrXl1FdINORWEDK3jKxRhMrrqPDRk0lGapVNHn8RD684FDoduxfTRV5UWZ6bn1Zw5cME6ulVDvHBtRFWitK5sszKECuEmlVBBd62BoFWUmc6PZQ/JpGhIN85OM05GpIiowIVheXn6IhbqxzIB1vdxfnPENGWia0qU4Y9GEEk0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ezfCNdPx; arc=fail smtp.client-ip=52.101.61.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ezfCNdPx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGkZSI5YG5LSxk41/pjMVXONQd0RYItjsNwyTPIeZAbpPgRNUzJysG6oZpxmxOqk4GXyoKnjRga0peg1IfHTxLahjkTrWOvP0FptTVPB9XCRr7iWZTfC0oVIX016zG2Z1r7rtwF4Y98vkDpXgtsQqtNmW6sngFg83cDgHk5a94hx6BXW+7En+J1sBPj3dhc5FMT9PuRu7xkRXCHLDZP6ouCKx/mUVfppSW3c6Rg6tVw4WFZbdQvehi87AQHRztoNPfJZvp3+mhj9Y3LN0+d42IsMTvwPXbA/cGh2M7O+IPZO+WhhaX+e3S32j1LxICpdzd1bFqDXEfnUpydSwkOLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oI1umtHJZCmV2y1QX24oQWe1iEQXXioqrvV+dlJy42A=;
 b=w5wd/DpvvbCDZgIaDhOUP1mj50o+T0gkmMphn2AbJyN/9Pl88WPiWxOiwHvVr4QwmdvNintNVbzfT+A8wGo4nLORrUYY+CYFnotBBFeyxMLxjkR3ezQXeVjwV7qiGD60j9MQij1KKBOd0Q0y+xbu2lBVuRGxkmaXEfUFRSsrEG/010msbhObX1Gw1u6F6EUWQ4jLHLBYj+We8ibtb4FtOVRFD4PEZxd+cEVpXayhdnliNzryHV6iftYePDQx4tz5cYwMxoMAKacu/+IFx8IVjm1zFnk5bWHXbd2B/Yg49SsdPHvxuN+qdHLRIyXsOg84R4SwFTjt3dConJFWDjxlAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oI1umtHJZCmV2y1QX24oQWe1iEQXXioqrvV+dlJy42A=;
 b=ezfCNdPx50gd9ORTBTU2K4lfMO7D+4+IFl5zqlNu+noNxUgh1pX1OLxkqNtE/vzaT4zcNN1m7FVav9PSEKJfh1W0cOykqKeWncPXfU2zrRqJxJ1A6oIN/Hhk/w+Et6ZY1iQp518HDIDvuWQSYBLi4WZk6O7Kc49xFmawIRtjTPg=
Received: from BN9PR03CA0706.namprd03.prod.outlook.com (2603:10b6:408:ef::21)
 by CH8PR12MB9789.namprd12.prod.outlook.com (2603:10b6:610:260::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 09:30:05 +0000
Received: from BN1PEPF0001806E.namprd04.prod.outlook.com
 (2603:10b6:408:ef:cafe::32) by BN9PR03CA0706.outlook.office365.com
 (2603:10b6:408:ef::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 09:30:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0001806E.mail.protection.outlook.com (10.167.245.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 09:30:05 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 04:29:58 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
	<muthusamy.ramalingam@amd.com>, <NaveenKrishna.Chatradhi@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>, Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 01/11] platform/x86/amd/hsmp: Fix sock_ind bounds check in is_bin_visible
Date: Thu, 8 Oct 2026 09:29:29 +0000
Message-ID: <09bbb6c757ac0e436624371e88ac76b6c8475c80.1791446401.git.Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791446401.git.Suma.Hegde@amd.com>
References: <cover.1791446401.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0001806E:EE_|CH8PR12MB9789:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6742c0-3002-4956-ed63-08df251ebc6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	E6v1F7x3KLrfitezxRPGigguUJIjP3gO1qF8K2k+YsPFM3MEquhf0wbVl6/iCcam+t7YCfnu65VRhMyKVpZ7dFqkwVaUGu2sDgBxcn4vero7n795afIZuZ6xkfF2MtUilkDkT4xKVUvFrpisq80jpUCrH0Sd2guTpZ24yClUxq6Pti2989qzFUdcc/QRvGmk99/IKTooDPlSSwfpbFI4EfBnJsyYRd5hr3lyz5lVUAuyG1gPfck1Rr4sWxBOleayR+b8IzHWFBkCAahMbBHofKxDV6pO0kek6zsEktX6Z/d2+vfRKG8Xs9pDIV/tly5gQ0PLVHImwxXnPweBFzafd/7w1I79AvRsCoTzCc/GiiyU5RKBZAkJ/71EGe5o49qRMeHw77fcq+4dXBZb7fTHyIeymcdXt5UPmgQT1sN48vQNMRB3bFIf1BreoHOp3h+2MVJH+wi/n1/KvHXO5WVLUiE4iIid9/DdhI2sDCKCCt3rt39ohErK4aTj00kWzKp5mQs/DVGMoanR85vwdLsBmhrXPDxobOCkwQw41+aeJGxIeAFuP2hiQ5EnGnpUa7gjPNttPvN8wE3ezB7sp7zp3gCNHvfMom/lXwFZbEMPR5DLk1AbegTv+EEdKST/Rpfwfl8/4722DZ5bhG6vPoPF21YBtuKOiX8FrI7xD0crmGGMXOq/4zrQ76DXZDu6ZYJv34ZG/dXmmcsDCZo5xztZJw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j+XVxyKhWQYCOR2E5TXzMbRu46prTKJb7Sehw3QBKU7pcKahQ3kOcf2VDSB9YfF4IPP0in9V9P9Lgz/IOnhbwu3S42RVxPu91MfMrdgXUe4mYohfk8QCM2vj14gpySwwcy1r4er0Qal3JWj4uuVSmBYfHOes4QqdiIQbOAPSWrkrPgyVOxRzHdVcDzU1dc2kOPo0tz3WawPN5NK1FFgN8fZ2KecCYqJppu5RKTOVo+r2m7lvgJKpJy9LNsM1isqR/CrbVeh/U/FdyZ1hT62cIAWzONB7ecmw5ayE3Wy6MnMkUTilN1a5wt7vngsFa+2NiqWPIalozF9ozuds2pDaTFV0E+Wdg9AJYfqOoez+zqnNCho8P1Vih4GvyJkxc5FCrtHWXjYzjnTih2MsCUkhWu2Zi2AC4ue6+Pvaau5ckNs4u7BG8IcKCkOJDzhIi6jn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:30:05.0077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6742c0-3002-4956-ed63-08df251ebc6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001806E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9789

From: Suma Hegde <Suma.Hegde@amd.com>

The bounds check in hsmp_is_sock_attr_visible() only ran when id == 0.
SYSFS_GROUP_INVISIBLE is only valid for the group-visibility call
(id == 0), but sock_ind must still be validated for every attribute
so a later bin attribute cannot use an out-of-range socket index.

Always bounds-check sock_ind first; return SYSFS_GROUP_INVISIBLE for
id == 0 and 0 otherwise.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/plat.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e9b2b809c0f52..af8aee1fb22ba 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -71,8 +71,13 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 
 	sock_ind = (uintptr_t)battr->private;
 
-	if (id == 0 && sock_ind >= hsmp_pdev->num_sockets)
-		return SYSFS_GROUP_INVISIBLE;
+	/*
+	 * Always bounds-check sock_ind. SYSFS_GROUP_INVISIBLE is only
+	 * meaningful for id == 0 (group visibility); for later attributes
+	 * just hide the file.
+	 */
+	if (sock_ind >= hsmp_pdev->num_sockets)
+		return id == 0 ? SYSFS_GROUP_INVISIBLE : 0;
 
 	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
-- 
2.34.1

