Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4930E1A254B
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jul 2024 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722349707; cv=fail; b=i2vbSWw3LE8m/Iea08XZvjXfxJjo+9imkjKeQ9cdfCD40ifVzC3eZTpup8XT/bH+dPdoqrYqqLzRPGMPgT3Imlc/1pUPqnRCn2HHPyZk8CCFSTlhkMpkEQ4G80Cj0Y2kmQ50O24ALq/0SeOCQxi4bCKPaKaMwAlLypAPhu4MeW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722349707; c=relaxed/simple;
	bh=nXORBruzlPriGK4Arkl4/m/EqYoeQKfGgCYrp8JFNaM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z5P9WwKhbLX75l9PoLGua2Ll5sA2m2HL/iRzjs29D4l4a36g8FCSh8rFeuLQ8z4b/8lbcYSJiih1LGahuJVIcqLnNp9Xuz+QEi0/8OdURZKmWj+HvSFs9CI0o3xvF/oVCyjRHXA4tZqA5K2pO6lQaqktXtdhm0+HebIKh6ud1Zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fkaxSl2c; arc=fail smtp.client-ip=40.107.92.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fkaxSl2c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8GX92JJw8sCE1OOIrvb6NpSqoyllvLnNHe0wfEmLTYkjS07GzmLcMMKMNNelKZQUB5FfUNFvarYg/YHrYg1IWObb8rT7uQWXhwJqSv8Jl4fEY7hMZoIKOgtzbWnT6u7n8DsapwpsvMmIwownRRA+7Ed9lAlYdGeRo2F68miNBWG/UofPCXAQAzs8Z/EWuSAVHCZ4muAetqAH7EXFeTbcftpOj+sShdcrHMgli5gnr+BbtOpu0Lk6bTAaBAMgnVquOK+GXy4x1jRK0h9izbrrMKKnxRZAWLwfuIKDBvjhy8f/r8Jonutnamu3oiV6PhczTDK2e1W/yiHRSvpvSgeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLUvVo0yLEt3NBuvLKs4V1LDH0Ws9yV1bXhig8+UbCU=;
 b=hKvmxOKwOHglMqZyn/KPfnOk3SQnmavZxsCPCjqB1F/0WCrdf7TC3yulXbZ2jipM4pzu4NjTU4GXNwDm2eLTiTdWRCjvSrU/kd8rXKaEXRgfav08mYgA0al3bCYKxv4PjBV/lspQlBJB8FEIiTykj4Q/4KaPT0ptL+RVj9yDxk2tlR7AU3SPX4K+lGl1ZjWjJAMLfhuVMNjtgwCMHHyfLc2NHVlDz4YWH3/lo7TqWI5jR1GqIgXsalrDytywnZ0N+zU5tv8p+7v89IAUxABs37IABnaxqQVAx7J7FJQfp3FJMarPm+XBuc32deQ++2o1nThMgCOcCIHVbbpsFzM/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLUvVo0yLEt3NBuvLKs4V1LDH0Ws9yV1bXhig8+UbCU=;
 b=fkaxSl2czjL9NGno4Sp12u1ZqrJ7jXennm3ZkJDLg6jztRbv06v4CZ0zNtyqvnaMJEa84uJDyqhC9GxZCOp5vBEOSbHb5M/Qekjv9tFqOzt+Aqql9dIyVeaqC3+WmRMFA6oV10N3nzBPihQ52SzPD3TbsHrs9t/WxxgEmfkalXM=
Received: from CH3P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::30)
 by PH0PR12MB7470.namprd12.prod.outlook.com (2603:10b6:510:1e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 14:28:20 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::65) by CH3P221CA0018.outlook.office365.com
 (2603:10b6:610:1e7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Tue, 30 Jul 2024 14:28:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 30 Jul 2024 14:28:20 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 30 Jul
 2024 09:28:17 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2] platform/x86/amd/pmf: Fix to Update HPD Data When ALS is Disabled
Date: Tue, 30 Jul 2024 19:53:16 +0530
Message-ID: <20240730142316.3846259-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|PH0PR12MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d91ffa0-aec1-47d7-f2d6-08dcb0a3dc3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z3vVvTS2d8FEp0KFd68T9i9w6aa7MSVoWcNPmr4D8C70cxQmlscjReouJ37s?=
 =?us-ascii?Q?vZjQnqwPPbex0N+IJMfSSvSfjS9wSo8Lpc+qC4GvhBJ6YJX0yrPSWXkvQr8t?=
 =?us-ascii?Q?51Qm8tEu67r527MWU2rn3Hadl5Ze30O2hv/l6lmY81IQUrmM39lcFuvQLHkE?=
 =?us-ascii?Q?7APSym5GNNmvff9sQw5j9313UZhqBFr9flSVTDwqiTKaJ/hBhBV4H24FomSY?=
 =?us-ascii?Q?aP4nbDfWHPDzVkd33aaFdb7fYetGFhE6dL9U3m2fekvBC66ort9/QiMPhbO4?=
 =?us-ascii?Q?9xH6cc/UCOWuYdFVlBZ3QJL21n8nz6uBAdnoP1R+YYLtm0krI3p6wGDLvSyn?=
 =?us-ascii?Q?8CLUGdgLDpU96Ec6KAMRKQzC2XO+MkFydWamIWzUt9z6UKZ3efNNIG6Y2q0c?=
 =?us-ascii?Q?IYmwy7j0ylzwB2oLyWcwFmlLTNmzqBt2aH8IwrYSyNahOIXJ5c8D3tAdgyNg?=
 =?us-ascii?Q?EJgR9Ycv0+uyeQsnwc+kPCDhWzcuANA5ZToUEiENdAo38GE6zDy+VGPufCfZ?=
 =?us-ascii?Q?i5//fnjPVo/VZH+ZlAiKYvnjQ6oXFSLd67yVYHV5tbhmfDgAcscb6SraX1v+?=
 =?us-ascii?Q?+lLdDeysZpZ3gmrJ/YhoxW6TTnAbQspdgJM+Oc0dR7k2ldLG7jey8Zjavh61?=
 =?us-ascii?Q?80jcl06tI4Radjk5l0tKfPddQxqBswm7G3jsj4YFKdxoSOH41eik65w5n93+?=
 =?us-ascii?Q?gzRY7PEHoDXiZB/acHqGPxvjkwVflXJ6oIptNMCj9DGxwhv6zaieLS5vXM/e?=
 =?us-ascii?Q?slNuzw+tBeLKLPs1I7KWYPralZd08WRb3R4/Aeznw+/iMlNYEEXuhOLfnbph?=
 =?us-ascii?Q?9A5AlKTVh/5DjXzqirACjJGzB0YnLGOgK4lPnm8KpndjOEJjd1auutwTABnd?=
 =?us-ascii?Q?17uN9ZpvlNr3pmk9AR47tBQmfts+XcrM8UglRzMCpe4RyqASDvJkHedHCQ+c?=
 =?us-ascii?Q?eE1cHmel7ZNegfcX3B3lTqxGQPRFJzl4ki2TgkclSlQA2ctczRbZoMVvUZKR?=
 =?us-ascii?Q?EWXapFx6E1ND5sKg4QYaVsFJPEN9Wu+l8g9luBZuazn7poEnJzVefIUYe6cK?=
 =?us-ascii?Q?mKkdMpPm1ieCjzKOoZB1FkoNHCiwuOoLbS1em9uRJl++4pj2ygKdrLE7V0iD?=
 =?us-ascii?Q?E023LOdiGUcQJV7zd3v21cYtGlJGllgZ6MwIYBsDGbn1EAw5XYnpbUf/29Sl?=
 =?us-ascii?Q?IVb2DfgLzS7GZwvwuHSpC92cGem7s7LErScu0JjukbkvJxW8LoeVXwYT6dck?=
 =?us-ascii?Q?2UboUM/jKPXDW5sbQ253SWFLLnbmXHw+VBLHoMN9OqBuGRXyoj54mFlQME+4?=
 =?us-ascii?Q?ghYRnhoRIAoTk4Nz3pRWie11KGbj9zAtKzqRQBDSub5XhA207TvcA5lEnEs5?=
 =?us-ascii?Q?OKxBjB72hWt90ve7PkEDM9UrC2omwn77d7GphYHbFfwPRJOBwIzBsv4qWDhg?=
 =?us-ascii?Q?a9mWvpImjD7Tuyxs5l2mgtH5tnY949Q5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 14:28:20.0101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d91ffa0-aec1-47d7-f2d6-08dcb0a3dc3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7470

If the Ambient Light Sensor (ALS) is disabled, the current code in the PMF
driver does not query for Human Presence Detection (HPD) data in
amd_pmf_get_sensor_info(). As a result, stale HPD data is used by PMF-TA
to evaluate policy conditions, leading to unexpected behavior in the policy
output actions.

To resolve this issue, modify the PMF driver to query HPD data
independently of ALS.

Since user_present is a boolean, modify the current code to return true if
the user is present and false if the user is away or if the sensor is not
detected, and report this status to the PMF TA firmware accordingly.

With this change, amd_pmf_get_sensor_info() now returns void instead of
int.

Fixes: cedecdba60f4 ("platform/x86/amd/pmf: Get ambient light information from AMD SFH driver")
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2:
 - Simplify ALS and HPD sensors not present cases in
   amd_pmf_get_sensor_info()
 
 drivers/platform/x86/amd/pmf/spc.c | 32 ++++++++++--------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index a3dec14c3004..3c153fb1425e 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -150,36 +150,26 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 	return 0;
 }
 
-static int amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	struct amd_sfh_info sfh_info;
-	int ret;
+
+	/* Get the latest information from SFH */
+	in->ev_info.user_present = false;
 
 	/* Get ALS data */
-	ret = amd_get_sfh_info(&sfh_info, MT_ALS);
-	if (!ret)
+	if (!amd_get_sfh_info(&sfh_info, MT_ALS))
 		in->ev_info.ambient_light = sfh_info.ambient_light;
 	else
-		return ret;
+		dev_dbg(dev->dev, "ALS is not enabled/detected\n");
 
 	/* get HPD data */
-	ret = amd_get_sfh_info(&sfh_info, MT_HPD);
-	if (ret)
-		return ret;
-
-	switch (sfh_info.user_present) {
-	case SFH_NOT_DETECTED:
-		in->ev_info.user_present = 0xff; /* assume no sensors connected */
-		break;
-	case SFH_USER_PRESENT:
-		in->ev_info.user_present = 1;
-		break;
-	case SFH_USER_AWAY:
-		in->ev_info.user_present = 0;
-		break;
+	if (!amd_get_sfh_info(&sfh_info, MT_HPD)) {
+		if (sfh_info.user_present == SFH_USER_PRESENT)
+			in->ev_info.user_present = true;
+	} else {
+		dev_dbg(dev->dev, "HPD is not enabled/detected\n");
 	}
-
-	return 0;
 }
 
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
-- 
2.25.1

