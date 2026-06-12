Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012054.outbound.protection.outlook.com [52.101.53.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B463812EB;
	Fri, 12 Jun 2026 04:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238404; cv=fail; b=VGa1J48hEp8HvB5hw045cFLWfRjkIU7Piwoc/O4OvSahLLOrig4nVXLV/FrCD67N089eMf8J7uF26h9OkddumrvJJAhly8bTWJmLIrgLkcX0BsHKj3t0eVTWBaEBK7PSdduUDVokW734sm0S7CLxO9gACrFG2W4I7V/vJ+NW3oQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238404; c=relaxed/simple;
	bh=EkM1/WsRLDcDUNeiKE/UWpjiKLuGO1nDztRsvuCjOqU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b5dh0jLKtcJRw2ZWKOCqZ7Lud77hWo4NeNp/SISeFtOQ4si1v3Cp07HfI2jqnh3LpmT4zWUyhrJ1qdgD8JWqzQ0B134VF0WMD97WzrtGrwV5vkQjStmLk79ZtzcM7XW+Yv0cZ6yqO6xIkOlKvPPG9Xu6/10TPHuEjOLRHCKNuQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XZfDnCmp; arc=fail smtp.client-ip=52.101.53.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XZfDnCmp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZT8fVWUl6VGWkwqeAfzpucc4UOJysWM44xLPKByZFo/KiS30fPE4a8ImHSgAiCWsAY8MyGoBc58UCKKr5zdscQAk55vdDLvreOizij5VQ+wdNi9QknwXM9fa5vBu3OF9mvSO+zPYHrgrCwTvMyLoQosL3MkhVFW8yHUC5YuhmzJwdhqyPpz6tazcts7TRmTqNlhp73ybClVU2nwAaamwdiRimZnxcwrZuy9eZpH2h08n67ES0wvH4VVazQ8iqMMUFMgEp9WfnTGjcDXp88+D0WiplPt+xyPcahSc4SoYNOuWUxQa/ZUY+oEf32nt4cMmw5pTG2yE1I/SsKIfUIGfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uh7lXLeIC/hMkgGP5ij4RghWFHbq/ACrn93GwB++Nzk=;
 b=gpsSzFA+64wCODdsIYhLW78IaEQt0Dvgse0mdFkTmLkYMvt/saGTWLOS2waMx1WgLuJUMPUkrmQimy+PKmjR+IVU/fD868e2s99opCWlUPH3uEqcUVtpEtv/W1/wN5+AX0hhxU2jhysVsdi+Z7WNwSnKZSsT3zWWGvODQkKzNSKJmArXpTR0xvX4hzYZyP41VJv5DOVe2+mqDXVg/IxZ8UVSS0Z/fRuXIpeGqmmM1ZgVlkBKpxb8LE1OjhpxtN3Cq5v5Nf+a8YbT2dCRAQ5WCIakNN+5+ta7eJ7RnTLXiSmpwyJCeCSD3/3X3WJTDs1nL/DvFoC7MLnxISQIzuqysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uh7lXLeIC/hMkgGP5ij4RghWFHbq/ACrn93GwB++Nzk=;
 b=XZfDnCmpE2flN1fSerfxb7U1B2MeWziYvUc5G4X3Fg2VScxDOI0bYkyhFbOj0xFTbFCLsZLKdMuvRS+5RW9HdQRIYPjqt/UWx6PA8ItyjeqWYqiMewgk+FtmVYPdUbajq+L0K2oFnIPIscVcDG4FWLBszY9OIEuWqwRf1UP3pvc=
Received: from SJ0PR05CA0034.namprd05.prod.outlook.com (2603:10b6:a03:33f::9)
 by SJ5PPF2CD49510F.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.15; Fri, 12 Jun
 2026 04:26:38 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::f) by SJ0PR05CA0034.outlook.office365.com
 (2603:10b6:a03:33f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Fri,
 12 Jun 2026 04:26:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 04:26:38 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 23:26:35 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Suma Hegde <suma.hegde@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: [PATCH v6 3/8] platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound check
Date: Fri, 12 Jun 2026 09:56:05 +0530
Message-ID: <20260612042610.1629037-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612042610.1629037-1-muralidhara.mk@amd.com>
References: <20260612042610.1629037-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|SJ5PPF2CD49510F:EE_
X-MS-Office365-Filtering-Correlation-Id: 63ef11ba-bc56-4bdb-aea6-08dec83acba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|22082099003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	dhcOigfCUG36lj+0XgbXulHP/TdYVkX1Iy6+AXP+XDcqkjKZJaCqdNIGtql4sdmvnFkFZ9OX587R2T/T3qV45KcwICMU9oqiphc3DRTbr4bhD4KgpySQaQa9NRG77Oe+hQQLEocr2l1JD9wc5+ZPNrphdZ1wT0l9cjNyijcJ3pqNEgvkBnmVO8l4Q71qzWrQOBSKZXaBRqAWbBtcgihGX1t2mhWBZ28sYtXcK3UO2zihVdh/bC4q2YVnDGcGwQBDfPXOG6dAnlukGehhQvq5gFenG08P2e1bp0Lyb/n0hAfljNxPruVmvEftpJJl9sMWtigsB7lc0JPySjCt4aKct5ItIM1w27DO3GORF/HdcdBh5L93wC8isNBIOtdnF6QvFy252SkSAKk4TpZzr1G2ZnWU/yNfdEj4V9mcDr7o36z6ui99pGl7U4hxGTcxvYa4dt2VV/BgotdPV4tm2hTKXJ7XbkY+Gk1MVuZmWtq6kLV7I22X1DjGQRcnA1qKVcX6cRv6KzZG8/7ymOP52ugs7Yi7TGLa+SHFU2DmNfQOr++CCKpLOz654iHJkL05VBnaPQdRKAJZELgUJankbUt8j+fBfO3wWBjzhg/D7IehHrW97h1LiFfE0/VWXvHX0c9WHYsXNaQN3V6ocEcs0dhrTOpjrvEXbNoOnxMEI+SnRJsYkUb7yWwJvI9XvxoEZd81j1tPHQ9aFkJgo72qBex2ytyzzr4u3B5QmkbOrZLDeGk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QWuOP8cBfEJXp/Hmu2MfUve/l3vedQ/wUJm9nIi+A7YjELYuS5rJiRbdlGB2jHQ7vX/oVsfoKO10nNhGwQO/NgVB+ENPq6CjLS6bdzgl3zktySCOozQln1LDiRAfCdtGzEY8mgylJbMekH/2Ud1NYIjvSO0ArYm24oE3nO7o5MZiaspL7gC6w7rBc1mUd/XIxMBDub95LzdlbmOAbkgkFtq6Agqwxsuj466dkls8+JHQGkWkzPI043BXDURLplEjLzM3g8chz5GiXyNhZqeIHrO5mdkbyrRO6SyogNwhmgkTru3IPtQEPgGSfUt2Cgnyx/CBR4mnaqI0h6Cm9HItso3HgFZGV7cOSWUGjh8uqDfvabR+BC6Bm5SuFEBh2/uFM+SO8BQ2VFuioX4Uov9tuNhTPLHoSY9BIQ0eDLVMAGr1kThn3Mzqn/fQ5FeQ0Scb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 04:26:38.1884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ef11ba-bc56-4bdb-aea6-08dec83acba2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2CD49510F

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

Reviewed-by: Suma Hegde <suma.hegde@amd.com>
Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 631ffc0978d1..9bad58fef304 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -182,20 +182,15 @@ static int validate_message(struct hsmp_message *msg)
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
 	return 0;
 }
 
-- 
2.34.1

