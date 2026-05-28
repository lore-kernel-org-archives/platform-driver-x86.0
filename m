Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011002.outbound.protection.outlook.com [52.101.52.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F923AFD0A;
	Thu, 28 May 2026 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961229; cv=fail; b=lOvTmMauTY4v0HxGqe5Xbzc30OdSUO03uOjJB8S3UIOZEXV/dUd4Xxvio6fAF767YariOPg+eEGWYJb6MUk9neZdlhky5x/w9r/qgEg201Wt5JejfhfCtY5g+WbwtYZkcOiipJh+PWT8z5ofHj43p/nMS4eM1SeBpwWvW5quLIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961229; c=relaxed/simple;
	bh=EkM1/WsRLDcDUNeiKE/UWpjiKLuGO1nDztRsvuCjOqU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZvnDz5vPXZliFvTEYZA2muTeruz5unaQns5H54Cgixrhh8xBs0AL0F5jZrBYghq/ZzoSMi8OSoafHOPB5ijPfxv9hkbn6JfZTnwTSQ3dQZqUoFmedQz2LnqQy/Nui64+6F+/KRu+K9+G6CD7RVG7KfaPm27EnRHcKwqUX2OgRIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4ifbG+NZ; arc=fail smtp.client-ip=52.101.52.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4ifbG+NZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mp4zjhx4PfqrZd/ghJvlWytaMrAHkJC/ikz0FHpm0UKqdIdWJ89n0ff0I6aHRKfR2lrBTJUDM4LGhH+A3wWSxbvb1PvuEieSBIwpbnLhhtsiGZRpAmHLIWYDBm2z0v1HoX/cqHWf28qwKQUvq9muGQifX4yZaL1eFfXAPRaDvQ4eu2LWn9QD8Z1sUvwwpIBcdzddoIztXYWxj6gx91qVYjX+5HBvwJfu6wzKKsDYNinNxQI32NZCfLjI6uW/e0iXW9J426jgaLvCR4fW+Z9Bki69lUS9XRkYvMqEn09KG7ZnCTdxdiSIeuvLc9wbslvlayz/8yIbEwoyPIpEzWoP5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uh7lXLeIC/hMkgGP5ij4RghWFHbq/ACrn93GwB++Nzk=;
 b=WEHjugE7GZjo9DzWbdcfU6y/L3pjsMDQQlg+Hc/KFyMZOZ0+K+Mt4FQg/pWhuHn2bajtM2DmmsQNYHPYuZWP1vlAVqSKmIW6i8VQilQC15jSPbbFoFP5R5X0a+ipzZrZQvMUlVGkw6oMVC7abkZPJvX72vUmW/w5wojZZYgIpXaNeLdMBwIC6htNWNQclHl/wH7NKSE8vILGJAtXoYVC8Zw+BFMKsdZQyG+Zz+ZD/Dv6VXhsDUrIWS+s1XGhRRqxjMwFqrOP6FlrO7VyhTaE0ExnwGDZbSercUH2aiGuUlB3hdjyW0xFlS5vuH2yqvet+lmNnor8BEtSejOn6oiK8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uh7lXLeIC/hMkgGP5ij4RghWFHbq/ACrn93GwB++Nzk=;
 b=4ifbG+NZVUUhNOkJjAn7dN5eW/ZKfdOHq6ph4d+cNsjfY9ecXJgTOYgzVUeyS25xVDKNFknzzJWp885Z7HouCatckX7Q9/6GZ+kHWHJXZUbRo3Q7GJqghk73bOUQf+JJ5gRA38YmG2kRE9UIaA9bbci1IsjSbjxhSYfITBgWxSA=
Received: from CY5PR22CA0078.namprd22.prod.outlook.com (2603:10b6:930:80::25)
 by CYYPR12MB8872.namprd12.prod.outlook.com (2603:10b6:930:c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Thu, 28 May
 2026 09:40:23 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:930:80:cafe::30) by CY5PR22CA0078.outlook.office365.com
 (2603:10b6:930:80::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 09:40:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 09:40:22 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 04:40:19 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Suma Hegde <suma.hegde@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: [PATCH v4 3/7] platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound check
Date: Thu, 28 May 2026 15:09:50 +0530
Message-ID: <20260528093954.2461272-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528093954.2461272-1-muralidhara.mk@amd.com>
References: <20260528093954.2461272-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|CYYPR12MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6ae609-b029-4961-92ef-08debc9d23d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|3023799007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	PPPyajCPK5RL9PMemCVTjcUZ2aBx37kbQNxRunJhetVhGn700rlF8qvjiksPo5vgI787L/sDB4b6dgUSmhaEyBUSCAFbz9wJha0j5UebAmZhSAflGpbWZ25zBS0fwjy3cSQfKFOKiQnv1PeH5xINlKGZJqVor/ERKDGNYEFYFqdzvoe5e1L5Rtk6t0Ni4Dmof6TynYiJR4epd4DsVk3nJcVu4Z9qbHp90y+yTjUILZF/+jA5kEvTxZ9pIvvF1YNftD2NVBmTOTf+25vsJKfWdheT1QakwyaHFZoIGTnQIvUleQIaX0adCJSqGqUGXsS3PiORE8YMhuhIayB9Ezw1Kw7RrTXZftaYgL5+HLPUHXPjXCicdP60kbBPjDIVz1hJevz2FD0tGcyN89d824OAE5iUNBaWaI3H9jOEJY9rukRWkLUEWXWFwIKxFaLAPyN16l3LSI1tLyEQT8DXFoqGVIMQLw6Q+aORrEwClxj4dX6KdER1vOeHllJfqku2NTIC0cmypOebf6h5RMYqepZtb0AzEi2231VHLVVbny5dnPdxH1wAF+iYS7kGiup19cWi6kTFYmkfuI3G69jr3m7YtV/jaibjjue4XmlNeya2+szG7Z0LWOADUGeyKQ8jjce6cf9w6/th6D5KP0/vtmFxk3UBFguPkLPdqRIYUK2K+kZGUVGLntwLBgRLW9JujuigfPGjMp/S/6vNhb0Z8wvuJlzEZ82Cy5fr/r8YlEEk0wY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(3023799007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eJTAPLjoWdWn/yzNDUgO7vPq/Mt0+b74+Ku9E66Y9SrmTd+Om/DGj8FtojWU2BaFhmeLZ8+i1Frr5JUxdwIgIEIpnDoTAjraCLKdnVKrUZW1f9wZ/vQH6/dfUKpTSBAXDAUd0GAdutf8sg2rbrlOOiyRtJlvCfVI1I0wD5aStn7D9UmQ+iITip028HsZCeXOAQptfvki1PL01upRkhthryBSIKXXZrBXqPQp0CysuysSH1mX0u/mZwhoe16o7p0EZGgkAwNKLl5vabSkuhzFhdmysoV3KtMWlvHR/7AyG5JwNfG/F2wNg+P4/w+0er41tfXTlE0b9yKrzXjTZB5Wr4QviMUYTusR/gfM0NyhTY8EXlDBQOAM+OFn+6oD/I0ZZjZsR/G5sNeNPWeGMmUWg2wrrE9i8ZICfUk08zSN1iNxwMOg6dLjFlxPV3+80BPA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 09:40:22.9924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6ae609-b029-4961-92ef-08debc9d23d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8872

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

