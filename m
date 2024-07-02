Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC665146D57
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jul 2024 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719907627; cv=fail; b=R1uRUyvJy5Ej/jU0UGv/1uOBWU/HyJ6oLKBjqBjJ3LvG1FENyQwzefR48bGWUJtcLSvXS5s61fKwBrkoiLlx/GdAjm6MR3MlsjQ6H3x2x1MgoKwAB+IJF4pGYwLptRG1peq1EOqwVVUQ3reYD2r+yaEWbTAONlOwFODWZOMYHAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719907627; c=relaxed/simple;
	bh=xdXFpung390obwxo7am31VGqjbVnyx1L4yNieVR3lbo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N9X664jHIiILUHlhRam+CjRiyAIhWmpiIS9FYEVZKX0fvFowwzLFlBlw1RlhHYB/gsRYJhuHGqK2kyk78aFdXl8txJ3cQa/Fd9BcvJ0i1HkKn8Hlz4GoMgBsXQQjWkYuu/3MYV7zPdTGABwHN+PrWGeLamPPhYpphAVcQ0seRlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zAS2juj8; arc=fail smtp.client-ip=40.107.93.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zAS2juj8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKbVUukMUhzsxopM8D0nvaR9XbHGlYPP8jNrC/zUzc9Qh+XZuk9pi2IR0+VG1A3V46PqnccKkgmpjAegHYG6os+JAN/7ZNkRh9BBqtY5cWWLJP6TiprRyKXCQ8cYvc7TdYkJYdY8OFzlq6b6Sh22DGrYlPzUE2TKJouzGXUeUGWzqW5cvpgBPr3BsWug1yhTSAxceq7oW6DN+nmlX7TOMg5bP2YypK1vyoY4+fYQ0JWLn97dReADVgqeNV7mzdafPXaq4Bj4WVpKCQLCwcRldky3DMnJh3Lq1XRH8ltdiKhETd/DHZSrR1xDHjRlGAUIo+75EnEFs/Pu+ZjlC71TVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkckvFtej4OgM+RR3Os0la9uTUfr6uknFKVwWr/DIMw=;
 b=bwFn6sZzZNI0CjWKv2ZaWU1iLtmK5xwMPtKSEvRoynKMwUbh0VaoD3/G28z1xrLzB04a1OC+xYdO5VjBdWynz9odONRN2MAItCI5deCaAWrrQSWzp4EZsFFI9YQb0XZq20cG3DLoNcaMEcWKpTyvyMXXCSYyjHMvE9KXsLCJpK/C62cyST/0s46fqvkLPX0i0wBhZGZNmK2vOBloiNLyitAn98KJ/f3cfgtE7fLGA4DJ0BQsBz2KEHKfEoujT0iwZbtBHW+dhW+iwr3B4S0cLfEBZGKHKgkAeE0V6T2pqngOdndqgumrV7CApTRHXKVqA5bw6tiCmmhyCmt9gQbNRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkckvFtej4OgM+RR3Os0la9uTUfr6uknFKVwWr/DIMw=;
 b=zAS2juj8MrApe7SRdRO+su9YY0R4p37fE3S8Ycs3Us0Dwm0jQzAtTKy0emYx36JLehrQhxuWYUsDnUHw/ujiJe819u5yQgLiaeqCDiqzkBiKuZa1pAUzzzT1UxQy15Exo5278zOSzDeLLNtY7612RVPvfeXbylKdQSHBDzutmeE=
Received: from SN1PR12CA0083.namprd12.prod.outlook.com (2603:10b6:802:21::18)
 by MW6PR12MB8834.namprd12.prod.outlook.com (2603:10b6:303:23c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 08:07:02 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:802:21:cafe::ce) by SN1PR12CA0083.outlook.office365.com
 (2603:10b6:802:21::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33 via Frontend
 Transport; Tue, 2 Jul 2024 08:07:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Tue, 2 Jul 2024 08:07:00 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Jul
 2024 03:06:57 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1 1/2] platform/x86/amd/pmf: Use existing input event codes to update system states
Date: Tue, 2 Jul 2024 13:36:25 +0530
Message-ID: <20240702080626.2902171-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|MW6PR12MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: e271358a-f2b4-40fb-2727-08dc9a6df363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2aJhIWi3EPngqIJuCvXXEWTfbnTKGzulH3NLPbULDcVs+r3bHK8PTB2qv3VN?=
 =?us-ascii?Q?rSHOC3YeeFNf+tKlTxiLWcrwyGjyVXVVMgkua5n3Yvr2CzRtDPIT6nx1hRuB?=
 =?us-ascii?Q?ajI5TgwhjcXhVfA5sAngQeddMn2zpIXQ4IAw9TBepZvAds93f7NvbJysNBJU?=
 =?us-ascii?Q?ok1ENsVWphfEkDEz3kY/wK+DQUOqDwtAYxdim9ZCv5YM6VATlFTxwVwrM7RW?=
 =?us-ascii?Q?WYPzw9AQiVbjjRNaVKdLhgmSBHo4P+ZgViTvGJCF6uBmY5QpmuW509lz/e8/?=
 =?us-ascii?Q?p9UiJ1/qPRkb67tHKRcbfZFdmcCM0ImjwchXDYaGkAugVq/j5ICVq16iZbRE?=
 =?us-ascii?Q?ZWaWnBcBMtg0tT0VkzY5WjQexMW/fg91hWHRvVL6HCnKgpfmX2yFkUFp7kw9?=
 =?us-ascii?Q?sqBU0EqwYJVqEcHCSkfW9yYjIQLPuZsAkkFBFpoUe4zN4uq7l6uGbKdhI8u7?=
 =?us-ascii?Q?MUEqdlsFR4o/Jp7l5c45sf1SH9h8Q2V4i1CtPRkRZyI3yxgx1xU26pkn6ML0?=
 =?us-ascii?Q?kNiXXwHmANkZL1Gb9rBh6iUIplAXfbQ0J8jZe14wjbYWVT7BtNV0QIvbZN9H?=
 =?us-ascii?Q?aXeco4Kw+DPDD8du+2LjDGtB5BgDetCSUu7O/WX3gqKR/5J98/yovlQngveg?=
 =?us-ascii?Q?+R7WW9XmnJKPTrHJV0uk44jqQ9orUKJchEX22JNJAdMbBYpIv8mYsQHQRIR3?=
 =?us-ascii?Q?UjuO01zRhH7joRa1PaK2UTF3IzlA8tN0FVAB1+xS+8XWQEa7/8cOXCvrbU4h?=
 =?us-ascii?Q?Hn9kfBQuX1ywo2WLRLu0A74VNaVhRtW68RRqlvaPSall2Nkf1pGhRzLp7Xv+?=
 =?us-ascii?Q?VdQUVeGYoF/Nu4fyWe9iU414SgbBsUXc2e/cC6j5gS4N3fvKJWbSTRdhLRY/?=
 =?us-ascii?Q?uGGqKgiiTEaQNG5Rsrbo2CaUNeUUO8NRGfaifljB2sHX81Au2d/15YvppPQq?=
 =?us-ascii?Q?wL2/eGJzVfXrS6DK1Ryt2XDQzqujp+QBLRWRiJ9vOqKdai0uEx0hQfvBeZJ3?=
 =?us-ascii?Q?ZePLL3aXNVH3olEiCXx2QqNwCSRLuVn8ZWP748teEy0AWIYi2QiDV+NBlJUI?=
 =?us-ascii?Q?3rmk8x1mM/zrt7Lb3lx6ryMsCFufWK8yaX/5eHw9AOpbJAp7KReP8WUxq9tq?=
 =?us-ascii?Q?qIDJluKhuAO6GFtiG/MlUzMU/x8x11GbPhGxLdeVgNEEUuTGRzA6bI4k+s7M?=
 =?us-ascii?Q?fz46uYF0JwjNJqi5ScEfRyGS5oK3M3Yx2KofffxIM2/60FjI/2FkkRyWmYc6?=
 =?us-ascii?Q?Gf5yupmy0zq0CApG5x6NP74DZsX+J0uCBCbu9OPs4DvtgufW1RnUqmbfeGyz?=
 =?us-ascii?Q?LZjkQX8EidH1/nDfKLzQcEAWPmmZ3HeeCMAqVC4bPRYkBqVVoAnjyE4IeZCr?=
 =?us-ascii?Q?DnQ5Zw0BIrBD40Ho6v20Wqj6w65ESIllXU/2nzEylxLmiTYlhS3DoEWfSsKM?=
 =?us-ascii?Q?bEigC/vdVw3tLwdvSDl1MFb9nKllJs/2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 08:07:00.4304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e271358a-f2b4-40fb-2727-08dc9a6df363
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8834

At present, the PMF driver employs custom system state codes to update
system states. It is recommended to replace these with existing input
event codes (KEY_SLEEP, KEY_SUSPEND, and KEY_SCREENLOCK) to align system
updates with the PMF-TA output actions.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  2 +
 drivers/platform/x86/amd/pmf/tee-if.c | 62 +++++++++++++++++++++------
 2 files changed, 52 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index eeedd0c0395a..753d5662c080 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -12,6 +12,7 @@
 #define PMF_H
 
 #include <linux/acpi.h>
+#include <linux/input.h>
 #include <linux/platform_profile.h>
 
 #define POLICY_BUF_MAX_SZ		0x4b000
@@ -300,6 +301,7 @@ struct amd_pmf_dev {
 	void __iomem *policy_base;
 	bool smart_pc_enabled;
 	u16 pmf_if_version;
+	struct input_dev *pmf_idev;
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index b438de4d6bfc..b0449f912048 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -62,18 +62,12 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
 	param[0].u.memref.shm_offs = 0;
 }
 
-static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
+static void amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
 {
-	char *envp[2] = {};
-
-	envp[0] = kasprintf(GFP_KERNEL, "EVENT_ID=%d", event);
-	if (!envp[0])
-		return -EINVAL;
-
-	kobject_uevent_env(&dev->dev->kobj, KOBJ_CHANGE, envp);
-
-	kfree(envp[0]);
-	return 0;
+	input_report_key(dev->pmf_idev, event, 1); /* key press */
+	input_sync(dev->pmf_idev);
+	input_report_key(dev->pmf_idev, event, 0); /* key release */
+	input_sync(dev->pmf_idev);
 }
 
 static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
@@ -149,7 +143,20 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 			break;
 
 		case PMF_POLICY_SYSTEM_STATE:
-			amd_pmf_update_uevents(dev, val);
+			switch (val) {
+			case 0:
+				amd_pmf_update_uevents(dev, KEY_SLEEP);
+				break;
+			case 1:
+				amd_pmf_update_uevents(dev, KEY_SUSPEND);
+				break;
+			case 2:
+				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
+				break;
+			default:
+				dev_err(dev->dev, "Invalid PMF policy system state: %d\n", val);
+			}
+
 			dev_dbg(dev->dev, "update SYSTEM_STATE: %s\n",
 				amd_pmf_uevent_as_str(val));
 			break;
@@ -368,6 +375,30 @@ static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id)
 	return rc;
 }
 
+static int amd_pmf_register_input_device(struct amd_pmf_dev *dev)
+{
+	int err;
+
+	dev->pmf_idev = devm_input_allocate_device(dev->dev);
+	if (!dev->pmf_idev)
+		return -ENOMEM;
+
+	dev->pmf_idev->name = "PMF-TA output events";
+	dev->pmf_idev->phys = "amd-pmf/input0";
+
+	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SLEEP);
+	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SCREENLOCK);
+	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SUSPEND);
+
+	err = input_register_device(dev->pmf_idev);
+	if (err) {
+		dev_err(dev->dev, "Failed to register input device: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
 static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
 {
 	u32 size;
@@ -475,6 +506,10 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	if (pb_side_load)
 		amd_pmf_open_pb(dev, dev->dbgfs_dir);
 
+	ret = amd_pmf_register_input_device(dev);
+	if (ret)
+		goto error;
+
 	return 0;
 
 error:
@@ -488,6 +523,9 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
 	if (pb_side_load && dev->esbin)
 		amd_pmf_remove_pb(dev);
 
+	if (dev->pmf_idev)
+		input_unregister_device(dev->pmf_idev);
+
 	cancel_delayed_work_sync(&dev->pb_work);
 	kfree(dev->prev_data);
 	dev->prev_data = NULL;
-- 
2.25.1

