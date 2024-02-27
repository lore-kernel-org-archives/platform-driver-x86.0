Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19DD13A258
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 12:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709038577; cv=fail; b=I98J1lCuTVN3ysJgjquZdp8cex7cI0trx0CRZhF6Gdnz8u7d9XgxijnSMt1tKu21kUTkmz+DkPcUkVDiROzAEufZccO2mTxtfKRCrJWp2wA8J03g+t+OdSKW6VBd6Dxd38rFQXmZk2GVVmCxDMJXCx8Edt6P33jrOpr9UHz5NSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709038577; c=relaxed/simple;
	bh=cD2hHyYpaAlCCobpJvWc2k68RSExhGiFMlZEhg8UPdc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HZegoyZDSw3kPTb45nSSjVpVMpnsFBFdJNjRUpNW1O43I6j1RVNV1X3nUj0mGINsUwBGd/08AZwnF5fuvGdF4qsz/Or0N6ef5Aqe+51pZkxOPaoGXHiQq8JLwfFhdmy7VjZ6ZIa2T5COFYW7lnBSGr2zPHKqVlJtgGnlLlgv5Gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1HUkf1df; arc=fail smtp.client-ip=40.107.92.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1HUkf1df"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8ceso36LhaefAWPTHd8gA3Av9EFv4kPevhq/1XPUEC64uru/oOOqCnQJrpw4VIF5TFXQURNbGBiljsYx3KgdIC+I5qeLaz4ndMUJ9tAP8erYaDGyUXm7YdYIKliURn+HURLVeeawlAzDMJW3E3oQuhhjNMaPU675awvUkth7TerskwwVLQJc1sRoQhpp3K6QvUJQACzONA6K/sx63FzE/umT3rGBLBb6l7uKmTFr1KgxlF/Ah+P8vxxN2gOoHpyDRxaKXtLViwsLwIZ64cFNSMUTygcAHy2T1NI/HwVLTeSObFA1X+J6CNb6aJyUjSkgBsmDEN2+Uo3yPguQ1l4Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvSRgORzEYrm5MAp2nVIcABjpa5aXH5WJNUediu8xl8=;
 b=XduVJYndJx6ZL7RUw/fDIeNAcpi94iThbH90QU9Hc77P6ebCCbdV6Ze3y0kIW20a8xWM5yYkdrBjpKKVXSz9bCa3/Z3yvilZHsuSYD9nPwGSql5IPr0rtlfW53vOc079wq55yMErsHX4/FNRC2ZQSVytBGTg2C0BAD37U47pigansajAycrsibaeXK8byjmzaGt99hEpWy2ALpRCclCvaih/A4/JL0kNINJswvmFbNnwuWjpHz/yD4u3+Kc56fSfb1aL2NT4TINX91BZ3tRHJ7rQohsktKs0iY1CVU2OEiijkHNP9rdkpzFIgQLIRkEOGob0DLpF3R9m9zXSC16qUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvSRgORzEYrm5MAp2nVIcABjpa5aXH5WJNUediu8xl8=;
 b=1HUkf1df0AsUvxVg2xH1mc04jVOD/HjlPY+wFWb7alV/SGX+kZZCz+w28VIibYY0Kidmt8cN/6cEsA0iZMZN1pQoHT81kWrYGOeBBWDxb1tJ/rx6XHxMxfHicNRplqFrjiCaGDA8j3grsPEVOlWWbiK/yXajOF2d3ajZnupq4sA=
Received: from CY8PR10CA0034.namprd10.prod.outlook.com (2603:10b6:930:4b::11)
 by PH7PR12MB6785.namprd12.prod.outlook.com (2603:10b6:510:1ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Tue, 27 Feb
 2024 12:56:11 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:4b:cafe::f5) by CY8PR10CA0034.outlook.office365.com
 (2603:10b6:930:4b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Tue, 27 Feb 2024 12:56:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 12:56:10 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 06:56:08 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 7/7] platform/x86/amd/pmf: Update sps power thermals according to the platform-profiles
Date: Tue, 27 Feb 2024 18:25:20 +0530
Message-ID: <20240227125520.3153140-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|PH7PR12MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: 87cf2949-d7c0-4600-c04d-08dc37937907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2Ny9jyAJJgH1ViJMfac5MoGaXXZMdAtd+jovNeWs+GXwjYkRu2F2oTytInWQyCNtuk8zQOxTItxh9J8UEQTA4cIsQvmendXqs+vB9ROHjS1gV1KQfMN43gnQHiCDhkju3lpUWr++3FgBt1/EiIeMCg2c2ebK8uGVPJavCFVyVudOE7742DI1B+rzkSCFqJ/lE5Ne0qIeYMCaBwXM2QTuO1H1/5gm8/QfdGHNQNaSTjit4KLy/P+lRlV8QGxHI5yRdlpRBE0SqXw6JojA7ypb0mhfMB8ne65MBqWNNdoQ8Lel3MIW9OztpO7tPcltZJ08pHgWOzcyzFDikQb2KqUcfWM14mklV4/+WOL+JlKRZOITs8Evul4Lqe5PJrtuTDhHw+0R8dOU3dTSG8Ikjb1S2ypZfVj6wNL/t47oOyrIKlXbceLqlwrJ1NLqyEha8FD4scxN7rkGaxlxYY69eAKs6LMAGxiJaEPGEuMj7KxQYfWwnhYzgTSmCepcNAvquCPM6OvZk9kMVlx6EIG465AzTbyhC+HDA80x4G2By5vOEp5ODSOGsMrBHEUmOxkb9qPxyidBh3KrEqeFlSZpKOzs0y48vhU91iOwVyuEtT7FFMtQmgJ9Qs3iVCVUPalYhMny/wc9MS9AsG9U/CaNWetZXohRUTIqOG82y1LqDFNK47wAHst6aSy3zAo4UrnK7HRdc/dpxjVCSuWvqEOHcnMzWElE/VIjocWsEgKEiBY4FJ3aezP3QUvhUy1ENMiP6/Wb
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 12:56:10.8632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87cf2949-d7c0-4600-c04d-08dc37937907
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6785

Update power thermals according to the platform-profiles selected by the
user.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h |  2 ++
 drivers/platform/x86/amd/pmf/sps.c | 54 ++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index f99805827510..09600b612964 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -51,6 +51,8 @@
 #define GET_STT_LIMIT_APU	0x20
 #define GET_STT_LIMIT_HS2	0x21
 #define SET_P3T				0x23 /* P3T: Peak Package Power Limit */
+#define SET_PMF_PPT            0x25
+#define SET_PMF_PPT_APU_ONLY   0x26
 
 /* OS slider update notification */
 #define DC_BEST_PERF		0
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index 067fabdaa503..1ae06a4743a8 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -177,6 +177,19 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
 	amd_pmf_dump_sps_defaults(&config_store);
 }
 
+static void amd_pmf_update_slider_v2(struct amd_pmf_dev *dev, int idx)
+{
+	amd_pmf_send_cmd(dev, SET_PMF_PPT, false, apts_config_store.val[idx].pmf_ppt, NULL);
+	amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, false,
+			 apts_config_store.val[idx].ppt_pmf_apu_only, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
+			 apts_config_store.val[idx].stt_min_limit, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
+			 apts_config_store.val[idx].stt_skin_temp_limit_apu, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
+			 apts_config_store.val[idx].stt_skin_temp_limit_hs2, NULL);
+}
+
 void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
 			   struct amd_pmf_static_slider_granular *table)
 {
@@ -209,6 +222,44 @@ void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
 	}
 }
 
+static int amd_pmf_update_sps_power_limits_v2(struct amd_pmf_dev *pdev, int pwr_mode)
+{
+	int src = amd_pmf_get_power_source();
+
+	if (src == POWER_SOURCE_AC) {
+		switch (pwr_mode) {
+		case POWER_MODE_PERFORMANCE:
+			amd_pmf_update_slider_v2(pdev, config_store_v2.sps_idx.ac_best_perf);
+			break;
+		case POWER_MODE_BALANCED_POWER:
+			amd_pmf_update_slider_v2(pdev, config_store_v2.sps_idx.ac_balanced);
+			break;
+		case POWER_MODE_POWER_SAVER:
+			amd_pmf_update_slider_v2(pdev,
+						 config_store_v2.sps_idx.ac_best_pwr_efficiency);
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else if (src == POWER_SOURCE_DC) {
+		switch (pwr_mode) {
+		case POWER_MODE_PERFORMANCE:
+			amd_pmf_update_slider_v2(pdev, config_store_v2.sps_idx.dc_best_perf);
+			break;
+		case POWER_MODE_BALANCED_POWER:
+			amd_pmf_update_slider_v2(pdev, config_store_v2.sps_idx.dc_balanced);
+			break;
+		case POWER_MODE_POWER_SAVER:
+			amd_pmf_update_slider_v2(pdev,
+						 config_store_v2.sps_idx.dc_best_pwr_efficiency);
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+	return 0;
+}
+
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf)
 {
 	int mode;
@@ -217,6 +268,9 @@ int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf)
 	if (mode < 0)
 		return mode;
 
+	if (pmf->pmf_if_version == PMF_IF_V2)
+		return amd_pmf_update_sps_power_limits_v2(pmf, mode);
+
 	amd_pmf_update_slider(pmf, SLIDER_OP_SET, mode, NULL);
 
 	return 0;
-- 
2.25.1

