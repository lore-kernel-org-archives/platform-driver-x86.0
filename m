Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2044.outbound.protection.outlook.com [40.107.102.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F491C3D
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 05:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720675287; cv=fail; b=tnI5ccSR8EG1QWfohaJXlIbNmIXsjJOPiF4xDt7GGnAzRy0XPa8vo3hsFF+egZesE0oQtsxouN0Dt/nsXGByyuBVn7fYwL0SHwtQbb0G1uLpZCjKftcwgyaQzCIcFSvUzr/VfuwL2ncgNCcRaWnLA9Q3IslAYsyQWZDL6g2OYUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720675287; c=relaxed/simple;
	bh=IpfROkXWon5aXjZfJ76+4TdFyJ2/9q1Ibplpt9KoTB4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GWtVq6iEYN0Ii7KiTG0jatccbm6lZMEMwXlhyVGWoHqY7jdP+HsPG7PK7/R9HS19W3/m+QjBitI053iYvH5plKPEtGthpWpXWTuZHAo+lvfAOUV4yISvhjlqbNvS+4Egy5XOfSYNQsJlwFAWZiRee4ErYciuuA8kPZSwTucpGHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G+lLuz8J; arc=fail smtp.client-ip=40.107.102.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G+lLuz8J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YL/PX4gMVcFneGFwkL+BwXA5Do7wfXx+5Czln9h6g2m9dG2jZKWoo1jkv0PLY/qvyTy3Jx+zLMBlOD/00Q7DURcCZt2KzJfe1wDJMgSnP7GsVMLn5pfA6YrY749sVnc2aG6gPZS3DIeUb9ptGkiRr9wkSFSRJZQ0Z9QGkNbr+b5kAcgclpfh83vsM9oOWCrJkOqsFg+cJOodQloTesUX65DYPQz6vNzSZiazhCyL1H6yPCatENG9TF4i2RzOoOgf8FxTOd9dhpNQf4lsL44HAtqSuYcAlar3wXaeEgLpNLPbwXPhOIAeBdt/tY0gs9cZwLmGJU4bbkPnyIN4sfwV+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPn9OLhl7bPvEopQqslxr0EJnCs/aM147/ojJhW/ktU=;
 b=CjZgm0HpKYlf5z3Aw2EKrlUNRbG/2xKootowiZ1zvPkDTB3lTAXY69Q6IuV9usgU16FpwFMzQLc8PKzkeZz0HBUR1SRTYnu8u9ZfN0gcW0MPN0uqVpW0ATJjC7nNiQzupOGRsNR5/ScAqjJHM8t0y9Y2U8ZzhVzGGsDv9RV+NzYAbeegut41jshTHANVbd2VN7BxFD6iZu8BfHQ7TEkdXPHIdSbiEFb5FyMNrpyuCyh4hnpuRZzSawdzLTj5s/FH2FxQQM+6kov6Tm558cSn2Gh5DG43j9SlJ3qHnUCcILTVsdWF0TOduFnE60BYQ+um+6xhMIJcrzlQFbvAhNOkAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPn9OLhl7bPvEopQqslxr0EJnCs/aM147/ojJhW/ktU=;
 b=G+lLuz8JQ5o/9YWeE5AjkDebgld20SSxO0k7s/nhzuHN4XLvRhzZdC3v/Ro6W/yliW52/NKplpZhHln8qBUy/7uv5OE5tBEVYO3m1vPhrJ1EzQ3i3syiWjQ1NKetuPveyzMbEryL+4FQ5kwT+O4Kx+oicUJe4nlaomxVotv7DiU=
Received: from CH0PR04CA0039.namprd04.prod.outlook.com (2603:10b6:610:77::14)
 by SN7PR12MB8101.namprd12.prod.outlook.com (2603:10b6:806:321::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 05:21:23 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::30) by CH0PR04CA0039.outlook.office365.com
 (2603:10b6:610:77::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Thu, 11 Jul 2024 05:21:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 05:21:22 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 00:21:19 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/2] platform/x86/amd/pmf: Use existing input event codes to update system states
Date: Thu, 11 Jul 2024 10:50:46 +0530
Message-ID: <20240711052047.1531957-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|SN7PR12MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: 71713364-e34f-4b59-c9cd-08dca1694de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U9uZ5c/wAnJzyfg2F/Npf0zQNqVQEHqRBak2YRR2H4KGa3Sg6m7eA9cHrvah?=
 =?us-ascii?Q?2DPYLy1rtk1eNdlt68ZLhmY4YFyG7/vOxfTnMz08vrjtZG/l0ccVFgh19Gpo?=
 =?us-ascii?Q?bhKKTsMUonXbsvatKU6tc5SsEFmpAXLvcOzHxj6o8RHKuQie1vecH8vnpXKK?=
 =?us-ascii?Q?YfdPzB5O64s0vQSuzGZOkNr9eIGGQXm/GCwpeIbyj/kkOf0ilpZwJXvjplUA?=
 =?us-ascii?Q?rmbhEHpD5KJKVxVDlVoPIrhmfPeXeDkX4gTx3x3JwhtrpgQGeLbCBXDaRjOr?=
 =?us-ascii?Q?kF7ILSsEiiFGz1wHb7y1LnTiPrBfrhuzksVVHe4OlKvR/Cv26X1f/AwuCfS8?=
 =?us-ascii?Q?2abrFUHo5cuex9dT72HqOjA6Xfe01WdcqMeN2BW7v5soENkrIQjvVbqnnvq2?=
 =?us-ascii?Q?ijM1wAgm9naCBlvsuepfUSvXj0F6nazoI5Fdwj/Gx74FGKgfDQQ56mIocFCr?=
 =?us-ascii?Q?BG0pdXN13GJYk0Wd7VrLBs7hX/1eB+aSRyXAp4C8dcuba5NyB5vd9k2IX/Ni?=
 =?us-ascii?Q?UkVZG9Tfcy2iQP7nLkLkgOPkY3HQwQuS3HeS5Pxg3zvabBbUAJAjIX3icV6Q?=
 =?us-ascii?Q?Jx0sgGN9U/1vnWxmi+rTWyOdv6AHXtkFrJO29ZWQnotuf6vS0BoZT2c2V7Hq?=
 =?us-ascii?Q?H2iS1XejMZLmQSGppX8lDVANqaN+clMBcaal4Pb24ABUUE2LtjageB99Llu8?=
 =?us-ascii?Q?2qemfcDTSm9bYdSYDDf4yJJo3FAWVHVzWUtUbwT+QvIAffAVJaaLx+Q+ZQXQ?=
 =?us-ascii?Q?MVFFuScQyJiu3ZeVYzOQTenPwMUCzM07X6N42l/+YIj0BXTSj065xA8Ztgk8?=
 =?us-ascii?Q?hH4KtcKJ9ehawMqaNhmUDXJkUkxckN4utWqPf1ITd4ShKTf99PscLpXughMk?=
 =?us-ascii?Q?+23QTvxphPz9l4BVud8wQ5hIX7QA8t66uG7gU0HTTT6P0KXgS6yagFCXmnMM?=
 =?us-ascii?Q?PjEhjoZFhAqali7XCVnmN997u5iLGkwGlnOxx+GOOdC9b4EzxNzJ/4y1nuKj?=
 =?us-ascii?Q?L0P0ILFvEvZbBAhQol39nN6Ioh2P7F2Ed9wqYwvLAEX+MSJmF+3hfzOWhAUK?=
 =?us-ascii?Q?Vz5Xb3cBuPZdn7o2d3uHLesLFlKZ2rZrWvMGJE/tSPlvyawwZ9Vq7sVCtk78?=
 =?us-ascii?Q?EzRhyRWZlSX0BHpEwWwyF2bOaVZkBVNHZURO7EkF9LXhQMbdaSsW9E36/FNM?=
 =?us-ascii?Q?nVx/x9mu+zGvWhI5wdcYfWBDuuN+H3bpRHbD6XovyJ7676WRvpMO3nsHlMQH?=
 =?us-ascii?Q?zRNasx3mcWS17Z0Ast0R6R4e+PkjL98V/XSr071aVE6bgSgI5A/9OYP6BXOd?=
 =?us-ascii?Q?/ta85OcdCaDU+akvUNafFdani1+4Q38g4LtatQQpciMOXVq0OPvJ5JykXE1O?=
 =?us-ascii?Q?dbbb5tsCmOb2K8dMJIrCSyBGPSWZGNg3GLQ9y1spB0nz9yjeGHCk+JTxg/yK?=
 =?us-ascii?Q?dpoRYMHLCklJ1PMtOQ86VTJrEOJ3IokN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 05:21:22.7004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71713364-e34f-4b59-c9cd-08dca1694de7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8101

At present, the PMF driver employs custom system state codes to update
system states. It is recommended to replace these with existing input
event codes (KEY_SLEEP, KEY_SUSPEND, and KEY_SCREENLOCK) to align system
updates with the PMF-TA output actions.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2:
 - Make symetric calls in init_smart_pc() and deinit_smart_pc()

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
index b438de4d6bfc..22a5889a1850 100644
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
@@ -485,6 +520,9 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
 void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
 {
+	if (dev->pmf_idev)
+		input_unregister_device(dev->pmf_idev);
+
 	if (pb_side_load && dev->esbin)
 		amd_pmf_remove_pb(dev);
 
-- 
2.25.1

