Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012012.outbound.protection.outlook.com [52.101.43.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AC941C319;
	Mon, 29 Jun 2026 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748621; cv=fail; b=k8JuIWJKJOm/2ppxtuZGoMpYIHW4hpLvbtRqWea+ivDgOu0ifqx3OHN3TpCnS06oSWgz04x8nxEh3bJx835ZDzbdUH/kmKqm9cdjsTdyeAliQ4f9j0LWIhXBi6xaSIE50TeVCz/2QkM3uqgehguqI6hHQLY+fMpI3bbcsx/E2MU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748621; c=relaxed/simple;
	bh=HV0bar/DWHo4eW4sU3irWxJFUtFJ7FoqZ2/sJrQI9tc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nSFmWyWgGcTLZK0IKziBvT53nDBRVHcrysmdkZkjXa2tEXgbeJEJPfO1J3PnhZDrU8QC+hOzOwBS4P7jO3qxbvVXm2GqktntLB7sMlyAF+GN5hqKuH4JItMPnrgdROkAeSNpVBJby/jkDUBgJ5SGI5PLVOcddyKnK0iZ9zDxvF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qRWArZqU; arc=fail smtp.client-ip=52.101.43.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qRWArZqU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0CJNyw0GNw/axIDcVcpKOFyWHQ7KLQKYkcnMzAQgSDcVHN/xrzYp+Pc9oj5MXvUBuYGvhr+yGBXIT2XWwGBN6iXUc9IpiLneP/yQX0/qzQV8MnCgdjxm6OoR4uP9sHkTls0Ksg0fegpY5k9T6Al8/ZGxnvvRpwl+Skmc84UfA7yAeoXZkm/M9F1SA3AmmbbGmVmwkmB9uAeCxBeo/JJC4UK7OadEJJCzrq8vkdQC8Ugvpe2k1ZJ16hPHVZSsZN+5Be9XTuc5sbPEIRj8a2vY4y/COji0wvGuyvDVmJ7M80ls/os5V9Ogh+7GY7w5+ONwVXF3sOQX1nHNwKLuAsb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAPsp2aE54GzcfPzxZN8JGB73cDdRhEJWBg6QXcQyO8=;
 b=A9T+I1azy9u7F20y5PZLRkDKhZ2f5J8GJxOUWIeKssNIZplhMEfEeoP0dYwnKq0dtbHuXCHNcxWU5ibEAGqWpsqhGiXeRaBTx32iXxLS1Q/h1PwtsMA/5qziMKz+Wfx9tLW+VMmL9xmLQS+w+sic+ksrKAp7XFPhTJBbpMkvSS3UOr64ThZMcoQgCfkKjHNId2dOeWory7T9HyyS3GVyD8EanBaenLU3yn4c3bSdXlr0hjHAOQOyKXngLw4GJ0oDqeeKYNYU3PeEkLzkvAQtcYdNg7jX9bVdcDSjrfVAojVjstisPxhsK+PCHICz4hqfUsQI2aQI+7fsM4GmNf43vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAPsp2aE54GzcfPzxZN8JGB73cDdRhEJWBg6QXcQyO8=;
 b=qRWArZqU5w2CSil+/MtX4feepVE8YJg7vnpEfNMzCQs0euEWRLZ7Zg10g/E7ZoiF3UU+WJe2l1lorZUV/1xSStKNs5qtBO6w0wl4Qd4XXxaYg2T2KI2VXaWDK9yeYvxzd9kxAdv3v65JQ8HO4mN0b5OsmKuTRcDdzBX5adCV/kQ=
Received: from BN0PR04CA0050.namprd04.prod.outlook.com (2603:10b6:408:e8::25)
 by DS2PR12MB9664.namprd12.prod.outlook.com (2603:10b6:8:27b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:56:56 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:e8:cafe::57) by BN0PR04CA0050.outlook.office365.com
 (2603:10b6:408:e8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 15:56:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.0 via Frontend Transport; Mon, 29 Jun 2026 15:56:56 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 10:56:53 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 2/4] platform/x86/amd/hsmp: Validate _DSD mailbox sub-package element count
Date: Mon, 29 Jun 2026 21:26:32 +0530
Message-ID: <20260629155634.1807598-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629155634.1807598-1-muralidhara.mk@amd.com>
References: <20260629155634.1807598-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|DS2PR12MB9664:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e12a30-8282-40ec-d2a7-08ded5f70b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	KJRBJdAk5XcHeHHQsbJ0wP7Blht2s4wOf5BOfcYg5aicXPUwm2O34hGelWw6t0m5kr5dGPHnwjrmmC+AnGBDL5AlLv8p+zGhratugI0u++vjdeL00GXQ73zJ/rCXaWvBqaYLuVl82owrhtkm2jYnH9AeOgfdOr2TVfiGuSd612Vs2IOa+u85yZwddLJS1uvYPKpLTvnk0ilrkE/7pvkIfbFcnE0M8fZYndw//iVVHMeVWN2wzgkPmJ51Oq++h91YOI2nTvy8updysfRllJX258FZsMonMklyrxtofmgFTFFAdW2sFHdS+d+ztQyf9JfV/kLkmlwM6S3AMLfY/2ZBiFgxNrHfyYZ+2Pp6Fs1707YD8fm2Jmj9UNye+fpEu3lYaFoaOn4vE6kSYdQR8BTB9HOf+Q6XRiE52IN5peJt8iIWhmZpyd1NxPeEcIUFNUIfsI/P2OyxySHMWUKx03hyE8xZTny8sb7IvBTqv+ze60iiwQX9rJiwOghv9qnPJZLa8FtaLoOBqLCz1+4GmVFIpy0O8Jm+5rzDF6avkIxRwUIsaPtWPgw2eMgViCkkbzSQ5Er3gbwZkYPTiRzZoMxHI7m0Cv0wYmKpT3WdF8Klc28UDaDucPYJkVQp0IBi7qQxt/QXvdeliwjaoR7xJwEu4S67cBIDVze9bezPccOrUJA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6UgkcdV/653O5depuzcLK5vBcUjlTSS8tCh3jaDTiTEVYAER0Ot1pnB3bOB3HXiMinRpT655x/bqahAvOH3LFnfn30X8Ao4f1Z0+F+2c3lRCld5AvnT3OL1gbnLoKrEitOoqE4ivb9CdeLB9isEY2S1TAdYMrFsfGQKmHCEI+qXa0TDvEE6KN2gmlWY1ikWJt/mFWcfb/nGH6Alzhrqb3l/BbO/YHXMtS/anzJX/wKYa3mARGDAYUfSAfDEDvJUV7nVZ/y79UMi60cadSAjwgQwQhKtGjtlKkVcqgjmTGOZVAZDZ8ydC5VlnJJ9u0INVX0/JMz/UQsj0VB3khNQQbLp9agyXeyc8eR+18EQ74PPZp7hZV1WWj+MG3yk+F7y/WOJKpXFYFpxxWhoVvncyF40fdaU54nTKVD3+ihaTMTeZSrpcPbcRwrH1jR4brLe7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:56:56.1347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e12a30-8282-40ec-d2a7-08ded5f70b9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9664

hsmp_read_acpi_dsd() dereferenced elements[0] and elements[1] of each
mailbox sub-package before confirming the package actually held two
elements, allowing an out-of-bounds read on a malformed _DSD.

Verify package.count >= 2 first, then fetch the string and integer
objects.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Link: https://patch.msgid.link/20260625123337.886435-3-muralidhara.mk@amd.com
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

