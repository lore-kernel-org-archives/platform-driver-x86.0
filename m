Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784743AF66E
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976513; cv=fail; b=ead2o5DbXXQuEcLW0CZdOOOsYw1JiGBeEb/wpLYVw1cqaXUf+aRhVJjRRTgVjxaNEo8+DAx1n2kTBC5O8wuC6W8TBdGEGl8HudSiqWz+e3wmvRQBcwDmuXoxolu9axKLS6crpgNAEEYlD1on1uCumaC4GtLbmJIjRsLF14szmx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976513; c=relaxed/simple;
	bh=/ou2Te2rWvK4DZK8G/znfCjmnV3jqbg3J4RfV0hvTHw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NKk/o7gYfyVqcEKaQGG565qeeMK4OM+kD8Se2UOZB6qGq4+RvQSKXvNbVsp4n42U1twyN+DLBg5no5xbmWGZv2kgVWrGRE4CeKJEeCn5YPAuRlIU0wWKqeedccgjDz8yYoF2kSMdEBnzYmws9ZilCth3taMmmfjuZA0j+/qLjfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nqEGb5+6; arc=fail smtp.client-ip=52.101.48.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nqEGb5+6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5vgcFmj9hKiajzSFJpNUxBhcfR8k8B3j9maXctPiWb3gOcyIu1Q1lni0FzdF38BTarErv+NWTuAiRix9JJyiNRigQYYMWKmufpmVrZlYIHoOvg7vk+EKByf0baAm9Uk2kDtUtn9OCApWKGp7e15Mxe2hZwo1IT3JuJS70NOYSNPfglgE/tW1eKVPwmGEPdraq/FWEtnDeZOCIM8NMNUI59mowk1q5MG4ylAYv/xuJcnqT4mwUdiaY/cjabJDMJksmXcSg7hNCDMjcx88pLyHqUYlOnhlGbFxjhN/mNQisPLBfToqfk7Mt7jIbObsPq2i/+9MroZwS6lFx3pTgKSug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TKYqXlWaTalfdSpMriNoOIR+vtRsWoGINkPtUj1kB4=;
 b=PUa1QFeKiIQ+jgTESKax21XZqxyQoe6vXVEoJyb0/yNErqkrOVK3sRCdx84PSJ20yBzR/SV+3reDOQgFp53anuhKIKetUOk/kCMQrSl6opJPiEZKbK2PIOqd+lXJFkn6uHqCFzw0qTo0HmjkYS7aQfq8L87e7d3busg6fYBBF33L9EBspuwZROTslsnTIXGi64/GBJrH8BWw8JgKnMrD6nyn0LCCa0UC+xWT6CME3tgTWmATao7wBrR+XX6nHmTJrUJQhZH2StzXqPOeLxP6XQXzR8CAf8/OHPllxzl+ybX9XGAFUFD7s4Qv6G8XrNwvaaSGIkkGJJ7Oe/8P6GPoeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TKYqXlWaTalfdSpMriNoOIR+vtRsWoGINkPtUj1kB4=;
 b=nqEGb5+6SSLVL8Q7rmsGno2gl9VAFXUIzBpGFAwJS0OeIA0CJ7YB+W0qYm8jmR1MD+bJYyIeuvBFNxVRqDyVwFnteop/YC4IbkUCP4PuQ4Qu2RN3h/cBhfiGqR7T71RkeTXYK8hpnAXR247SU+YEGYebNdGAwdyR9wWDAjO9p2s=
Received: from PH8PR22CA0023.namprd22.prod.outlook.com (2603:10b6:510:2d1::21)
 by DM4PR12MB6255.namprd12.prod.outlook.com (2603:10b6:8:a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 11:15:04 +0000
Received: from CY7PEPF000000F2.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::9c) by PH8PR22CA0023.outlook.office365.com
 (2603:10b6:510:2d1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 14 Oct 2026 11:15:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000F2.mail.protection.outlook.com (10.167.247.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 11:15:04 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 06:14:54 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <muthusamy.ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Suma Hegde <Suma.Hegde@amd.com>
Subject: [PATCH 3/8] platform/x86/amd/hsmp: Rename the HSMP_BIN_ATTR_GRP macro
Date: Wed, 14 Oct 2026 11:14:25 +0000
Message-ID: <20261014111430.23156-4-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261014111430.23156-1-suma.hegde@amd.com>
References: <20261014111430.23156-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F2:EE_|DM4PR12MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 7639bccf-55d5-488c-8407-08df29e465c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	D9SxZpLA5jG/VXaRKzph7fGCSXccR29Yj7alPbb6x48XF4KP7ozR3p3VIK/iS0f7699DasEWFd1cQXZHjKXbKl1KbaOm80MHSy0BJ8NCfP4L/u39HkV6Nv35hY674tkrZpOYYR3+Oytdf1xegJZ7tkeK2Pvy8O1vspYhk00RbwsbR+gD/szxKInOJQqbsTRCxrO33HZPr72LIxBE98+tKqYUENeWLgvnT6cwX0iNNgmmw9tEMEZSRQEZT+MMf5ozLokw4EEeny8khs4YSHo+VLtTdwHw6iv1RGyJyJ3FStOEFFvXPwvk82VGibO7H1Ana2fOY9qcSB7wgkofR81Xc/SRvhxNH9vsqfmCe0ae5DWeDrTZlaYS68kq8cYgcSlms+OWgnQZD7VrfN6EUC3xyr0S8A1KHEOXe35R+6gBv2D0YTBZThaYuS2xCMudYc8npN/vM5O30KFQmbXloEoC86gzgfiWy+aNLy5c75jqoLyHgc9EurkPDSWYay8OgZCHOx9CSuoGDRkUcUkmXPHbcAk0rwRLu9H27nLdw/nqpcDpo0tUnNgeoqRzfzdW57N3QfWE2StlQw1XCEdRcefhbTsmJWzFwoK6i7VOxRmtpeMqh4VqSrD2V8IXESvKkeiqtalsa6GZvrjPvMNHcHsfj6xbo+es1rNaLkP9Ry6luh3edyqBP6TKD+EhI2pq0G7YKpHku++QzTwlxLdVA9E/6g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DdIpV1Sw3uDS9LpkSS5nCJfCj3oEWoG5dcDTs/JCsX7QrzfG5hTaYOxp8j/XGwJOD+YUnJlkMmqptufJD0nBl9JO3iqxqWlof19JbYxdGCZSvjvm51GgejIaLQJT5sOocslIkJ4Di9djAna5w7V/ikxclwNa3MGQdSwOMTru+i3RIevmQM655RY+/LWmaRR2JXc+KEyMXQltyCv4T7YlUJ01A35f9KM+4T2jik1NI9pP95WpctgK5e+qsLtQDmtRG87dc4pgeLMAKqE84dLjlCwuII3wmh+6Mk7ue5exxCFTHDEoCKHH7HgqnAgjgCj0s93SQl+SHF+cse4kcYwJwO1d+CNN+L0P1vLpHvhaHAZVDrsbzO719QVAOzVyN3/l6fREyFei6geWoySJEefBApwrDl6qeOMvMzNZ9bPBPvSTSMds0+soOdddlHRsS41P
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 11:15:04.5596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7639bccf-55d5-488c-8407-08df29e465c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6255

From: Suma Hegde <Suma.Hegde@amd.com>

Rename HSMP_BIN_ATTR_GRP to HSMP_ATTR_GRP so the same helper can
describe attribute groups that carry both binary and regular
attributes.

Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/plat.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 949d75a3e6de4..b88a05498cecd 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -120,21 +120,21 @@ HSMP_BIN_ATTR(5, *sock5_attr_list);
 HSMP_BIN_ATTR(6, *sock6_attr_list);
 HSMP_BIN_ATTR(7, *sock7_attr_list);
 
-#define HSMP_BIN_ATTR_GRP(index, _list, _name)			\
+#define HSMP_ATTR_GRP(index, _list, _name)			\
 static const struct attribute_group sock##index##_attr_grp = {	\
 	.bin_attrs = _list,					\
 	.is_bin_visible = hsmp_is_sock_attr_visible,		\
 	.name = #_name,						\
 }
 
-HSMP_BIN_ATTR_GRP(0, sock0_attr_list, socket0);
-HSMP_BIN_ATTR_GRP(1, sock1_attr_list, socket1);
-HSMP_BIN_ATTR_GRP(2, sock2_attr_list, socket2);
-HSMP_BIN_ATTR_GRP(3, sock3_attr_list, socket3);
-HSMP_BIN_ATTR_GRP(4, sock4_attr_list, socket4);
-HSMP_BIN_ATTR_GRP(5, sock5_attr_list, socket5);
-HSMP_BIN_ATTR_GRP(6, sock6_attr_list, socket6);
-HSMP_BIN_ATTR_GRP(7, sock7_attr_list, socket7);
+HSMP_ATTR_GRP(0, sock0_attr_list, socket0);
+HSMP_ATTR_GRP(1, sock1_attr_list, socket1);
+HSMP_ATTR_GRP(2, sock2_attr_list, socket2);
+HSMP_ATTR_GRP(3, sock3_attr_list, socket3);
+HSMP_ATTR_GRP(4, sock4_attr_list, socket4);
+HSMP_ATTR_GRP(5, sock5_attr_list, socket5);
+HSMP_ATTR_GRP(6, sock6_attr_list, socket6);
+HSMP_ATTR_GRP(7, sock7_attr_list, socket7);
 
 static const struct attribute_group *hsmp_groups[] = {
 	&sock0_attr_grp,
-- 
2.34.1

