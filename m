Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011019.outbound.protection.outlook.com [40.107.208.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF68402B9B
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165162; cv=fail; b=aw0HPe82vsS/5QjLuhDcyARpwqRkiLimmReysSwZBDKx6hsLfP8jTbQCiVSFh7iN3TRURhNN82qeGJqp2khE2UWXgfhZbDXzIRf0bYME2j4FcOMqzzGm+yplDRwAK4WmPRmJ4jPCDmU1hpgA7vGLkx2+w6h40abYTI1rQHf+5uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165162; c=relaxed/simple;
	bh=lA1TQOwmCDpTXJVt0UnPs6I7NEjfXPJ1xnsEV7uSllc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aQR8huclgqq68vgESwlzRzh0/AoAgZZfX/EI4fnbXh8fOOVicKbMQnhzgD1ei1+Q09MBQFvzmm75AA4gYWhLT8VY7R1HBwkbOxPwpj50O3XbEk5GtSSQwp8CrWZ7VAOuqNh+bv9qRWOd32PLQNnN4izTJCbqPCE49+EKgV616ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sVBkyi/9; arc=fail smtp.client-ip=40.107.208.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sVBkyi/9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMtJcvgjZMPbK9v0vPn17nLzn7SBIdmy1pDK3mj8ZI5PkpCUIME7asURqfh56NALEzswF0aehopvubu5hihX0fgfM1BMcQedee0YUDIwf8Rap1O6HqOJqEJTNa2zCvYvOwoSZuaiS8rm5WWvnaoJHcGGXKfpmy9QnikMD+4M/GbXSr+t/PWsgzskUYN+R6OtCpVSdeiXJMKuoahLSG8aKeZ193o145/2pe8zCKgHzfGXIH8aufzVEkAELir7N1Zg097CG746sOnUyLTeqQViMD5VdbM58jMuqWUHkrrrlXmUfCaawW49snmYcl5bvoUkyPTeUMxdGoCDaJj0ER3jjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFulvcZBa4gLY3q+NsO6rXIXi2iN/74SFjaXE9tveoc=;
 b=HCWEdGfZR9Xt4XHLWwb6vpWhyJysgLtb5Cp3U2V3IHbOhkz4Ka8G9sxNo1lR+1bv1TxZS1xXQoGOH4eltFIalrz/8qHsVx9xIZAdB2WpU82oOOXEw6pF2yha3CwLo0q1/gtqDkMXpARbETWYb96h1Z5IgPuteUrKDX+J/8n/vm+XGHyWCvNmPyLXKrXVMbv2TSSDdSitG4YaLoFEVVd74Qaqhak2daq40d0JtLEpBE7nM7ZZtQ8MVsw3svaZZRPZHSCBvfLfKfYDgjLRflvHE7+DQa4q7lbXceTXfmFLd6NxeXYmEQJyu8oErvKlvS9g7g5Voxb96buR8ebCTKf06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFulvcZBa4gLY3q+NsO6rXIXi2iN/74SFjaXE9tveoc=;
 b=sVBkyi/9z8HnUW9MW/cIpgCq7pvYCbapX2D8/b9m2YizXOdNqsFVR5xWEIqQifsMtiYK5f7/Cu6V8NkyEf9BCJ5GYTR+60RXJyAijrHf2l4zVDwVzQ0q3I/zecigEyX6B8L7w5BZ2MO7si0Fn3O8mPO45rPPyOIutof5QEa0bJ0=
Received: from BN9PR03CA0581.namprd03.prod.outlook.com (2603:10b6:408:10d::16)
 by CH2PR12MB9518.namprd12.prod.outlook.com (2603:10b6:610:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Thu, 7 May
 2026 14:45:54 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::e8) by BN9PR03CA0581.outlook.office365.com
 (2603:10b6:408:10d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Thu,
 7 May 2026 14:45:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 14:45:53 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 7 May
 2026 09:45:50 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 5/7] platform/x86/amd/pmf: Move debug helper functions to UAPI header
Date: Thu, 7 May 2026 20:15:22 +0530
Message-ID: <20260507144524.664001-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com>
References: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|CH2PR12MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: e569bafb-1f85-4c46-e7e7-08deac4756b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|3023799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	dLOD+YvyJlxNIbw3wPy1RoBSoILLtc7aQjieJgfa+JzushMfa82BUeVexOAT6/d7fdd6Jb/9KOWz3huu447ZYwsjFUSuIYjyilRT2JqSVXA+GYER2vo5s5J3M0FFRN8sR8CH38xckyjfTBv/Lff1Ram51nHnKhRSb2hvPOr/DVba8+No7SQH2JY/nC436gvlpktgrudP9fg6pIoNBB37+JUJqHYeY6AqraM4ryfVFutpze9j8ZcAKDsM9rQt8FNn2IxmsmElAvVHYZFyOnYK1l1UHMzL2wvrCLlMhkQlcoYdNp8wSAn+DZ0DMAuStyYO/jNp+Vo4toJJtqd3hRaGJ96yRAlqHubwI6hgBZTbxWc08Gph/LqpiKmTfhn7qNtNowLo7435kz0c7amb5UaUu3fml3OSlJmgoFWjrvav5RRdiYW1AFxIBKcIiTEmwcaSNWpxQ3VfmLALUjT3J434jIsd+S3Kp1i0JvqgGKJlEBPgou/MKLyG+kGFGr0jau/qohwCwcrW8OSMc7DVj/7WrTN1Zc1iyFfi979s8w8mwkgKYqvi0e0MgfaNfLEPMxerEe6fZRXhcdWZQg17QwbcV8hp3IsNJR1j+7C9Yg9d/ysbb4WghO5lEW/Ki0k6XFpsD2XGhdl+g7/QwS1+1sy8pwcTACaJmoFfbOuwU7Zq6mbVVKEMqPnBXhj0d1cQm5LGY91I7YSBSWONmYp5aJILtz8+psxsTMB/q3A1OYM/a4I=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(3023799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d4JRqERLFx54eMb0BzjDR9gTgNQb9mdEpMByV5txlZLf60rm/b9wNWl5no9o3CyR9Bp4joYfNbMY6lrvuJtQp5ZOUO7gJA0KhZ82e8aZHAcb7T2/NX72NxBSKdODH5rapO/NmSVY7Z1KznLSu9lez1SVogQ6PNJtk3ctQTQrkmRxBDyykbsemR3Sy3tVq3CC8Effm/8zI7kPeA2fhgPfsOZJ6oNBp8Kc3HM7ZjvQhzSa6J+dUUh7da6e4tvWlbaLw7Kw88V41TfSwtCG7unokcBMkyrdaC3Nvf8MvJCist8seLFfb+MsvPiLgudf+oz3a2Mvj7uTPvmNeMTCOft4Ijz93k2BsGvnkfEVhDE1A6qEWAkv2HoUDZgtZ19U+AdapgaBethS8g89c3dN5tB+mPpDeQz+OzaNlcqLBwqU6o2AT2U/MIRALyjNKlz0CMTr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 14:45:53.0101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e569bafb-1f85-4c46-e7e7-08deac4756b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9518

These debug helper functions convert enumerated values to appropriate
message and can be useful for userspace tools and other kernel components
that need to interpret AMD PMF state values.

By making them inline functions in the UAPI header, they become available
to both kernel and userspace without code duplication. Also, prefix the
function names with amd_pmf_.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/spc.c | 61 ++----------------------------
 include/uapi/linux/amd-pmf.h       | 57 ++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+), 58 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index cbfdf3256fb6..f32fb8761153 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -18,60 +18,6 @@
 #include "pmf.h"
 
 #ifdef CONFIG_AMD_PMF_DEBUG
-static const char *platform_type_as_str(u16 platform_type)
-{
-	switch (platform_type) {
-	case AMD_PMF_CLAMSHELL:
-		return "CLAMSHELL";
-	case AMD_PMF_FLAT:
-		return "FLAT";
-	case AMD_PMF_TENT:
-		return "TENT";
-	case AMD_PMF_STAND:
-		return "STAND";
-	case AMD_PMF_TABLET:
-		return "TABLET";
-	case AMD_PMF_BOOK:
-		return "BOOK";
-	case AMD_PMF_PRESENTATION:
-		return "PRESENTATION";
-	case AMD_PMF_PULL_FWD:
-		return "PULL_FWD";
-	default:
-		return "UNKNOWN";
-	}
-}
-
-static const char *laptop_placement_as_str(u16 device_state)
-{
-	switch (device_state) {
-	case AMD_PMF_ON_TABLE:
-		return "ON_TABLE";
-	case AMD_PMF_ON_LAP_MOTION:
-		return "ON_LAP_MOTION";
-	case AMD_PMF_IN_BAG:
-		return "IN_BAG";
-	case AMD_PMF_OUT_OF_BAG:
-		return "OUT_OF_BAG";
-	default:
-		return "UNKNOWN";
-	}
-}
-
-static const char *ta_slider_as_str(unsigned int state)
-{
-	switch (state) {
-	case TA_BEST_PERFORMANCE:
-		return "PERFORMANCE";
-	case TA_BETTER_PERFORMANCE:
-		return "BALANCED";
-	case TA_BEST_BATTERY:
-		return "POWER_SAVER";
-	default:
-		return "Unknown TA Slider State";
-	}
-}
-
 static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
 {
 	switch (index) {
@@ -89,7 +35,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	int i;
 
 	dev_dbg(dev->dev, "==== TA inputs START ====\n");
-	dev_dbg(dev->dev, "Slider State: %s\n", ta_slider_as_str(in->ev_info.power_slider));
+	dev_dbg(dev->dev, "Slider State: %s\n", amd_pmf_get_sp(in->ev_info.power_slider));
 	dev_dbg(dev->dev, "Power Source: %s\n", amd_pmf_source_as_str(in->ev_info.power_source));
 	dev_dbg(dev->dev, "Battery Percentage: %u\n", in->ev_info.bat_percentage);
 	dev_dbg(dev->dev, "Designed Battery Capacity: %u\n", in->ev_info.bat_design);
@@ -103,9 +49,8 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
 	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
 	dev_dbg(dev->dev, "Ambient Light: %d\n", in->ev_info.ambient_light);
-	dev_dbg(dev->dev, "Platform type: %s\n", platform_type_as_str(in->ev_info.platform_type));
-	dev_dbg(dev->dev, "Laptop placement: %s\n",
-		laptop_placement_as_str(in->ev_info.device_state));
+	dev_dbg(dev->dev, "Platform type: %s\n", amd_pmf_get_pt(in->ev_info.platform_type));
+	dev_dbg(dev->dev, "Laptop placement: %s\n",	amd_pmf_get_lp(in->ev_info.device_state));
 	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
 		dev_dbg(dev->dev, "Custom BIOS input%d: %u\n", i + 1,
 			amd_pmf_get_ta_custom_bios_inputs(in, i));
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
index 8bd2fdee6ef0..15397fdf4dbd 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -115,6 +115,63 @@ enum platform_type {
 	AMD_PMF_PTYPE_INVALID = 0xf,
 };
 
+/* Retrieve the platform type as a string */
+static inline const char *amd_pmf_get_pt(unsigned int platform_type)
+{
+	switch (platform_type) {
+	case AMD_PMF_CLAMSHELL:
+		return "CLAMSHELL";
+	case AMD_PMF_FLAT:
+		return "FLAT";
+	case AMD_PMF_TENT:
+		return "TENT";
+	case AMD_PMF_STAND:
+		return "STAND";
+	case AMD_PMF_TABLET:
+		return "TABLET";
+	case AMD_PMF_BOOK:
+		return "BOOK";
+	case AMD_PMF_PRESENTATION:
+		return "PRESENTATION";
+	case AMD_PMF_PULL_FWD:
+		return "PULL_FWD";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+/* Retrieve the laptop placement as a string */
+static inline const char *amd_pmf_get_lp(unsigned int device_state)
+{
+	switch (device_state) {
+	case AMD_PMF_ON_TABLE:
+		return "ON_TABLE";
+	case AMD_PMF_ON_LAP_MOTION:
+		return "ON_LAP_MOTION";
+	case AMD_PMF_IN_BAG:
+		return "IN_BAG";
+	case AMD_PMF_OUT_OF_BAG:
+		return "OUT_OF_BAG";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+/* Retrieve the slider position as a string */
+static inline const char *amd_pmf_get_sp(unsigned int state)
+{
+	switch (state) {
+	case TA_BEST_PERFORMANCE:
+		return "PERFORMANCE";
+	case TA_BETTER_PERFORMANCE:
+		return "BALANCED";
+	case TA_BEST_BATTERY:
+		return "POWER_SAVER";
+	default:
+		return "Unknown TA Slider State";
+	}
+}
+
 struct amd_pmf_info {
 	__u64 size;
 
-- 
2.34.1

