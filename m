Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795012379;
	b=Z2ZBrsZRgB9Bj8YfhWFnoBQ+Ka53DJiQCViKicxMeSt2qb/2ncxxY2fwLkxlvw74SO/8
	 uJXy+0nN3CjTkQ5UEe/Otp48rCsPhWphxSG2TD0HGokGVdSWzyBfQb28lsDiV9dL8YgRq
	 aVwATombHPq7XwzrHPQQBzlPhQFjcyIpgh14mw2OwCZtA4lTlVqLwWMxtLkRJVfukL/sf
	 yi7l+QmTsah32YiVoNKzSTd3IVALRu14aA8TH6sF2oyIY7w6QB+c38f3fw0bGHFtVGOGy
	 l5HjcyHqoQsVs+DtdTKOEKaHzdWhm6F1cP3ow80pLHZ+SJ3k82HXbQ1yZzFBArqzE9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012379;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9vAW0WHhS81X8Yh7bNOx08mH72sBdBDQ7GarHlP5Pes=;
	b=YVsAPOHSNdS3aW1dThTQAuHhsQw9mcY4lNzARUTRBXqdjE8n7HJZysU4liP1CKhfdOcT
	 iQzmsjPZD49n+V6ZxDAmDm2O9dq/h9JLyQiIyYnie/V4chjB9MeUS9IQp22Si6nXasRFJ
	 eRlkVUVqJSBSQUkY7p0Mugos1Tcs0R11O6eztUaCfcDxlVMDGQKC+TcB9IYp/RMY9uzcm
	 jHxbhKv6xpRNmPTyOObvNZWFCk71zEMVJiLel/8ynT8T4V0ULjloXwzIZNNA3Y96gteNJ
	 AX9zJANCaUsVRU/pSK5qsPUhhQKleCvz4WBXw0v4FjKPP1TPFubtcebAJXMpBgA0djg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="A37/w+tj";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.67
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012067.outbound.protection.outlook.com [40.93.195.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8CA606A32A
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 14:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF8CA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=A37/w+tj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qM9BDkNAEimUDSKRU8ghFs7o9GOXoCcgVTzdH6HiixGlgbJ3L5GnuCABMxuCM82T6d+V6TD4Gn4SY1HmLSLUC8FibcxqYM6NyBKEjzYc+pjqi0/T+U6nmeZRYyps4Cl8iELyTjEopwWyJHL/Ob2gKMigbovxW1xF8jd4j8T0E4vC4cY/0QT9O7FNwMqWx/8TVcFBicbyf1ZMNhCSZMarwo5DQx55AvadPyfRaTrBqRA/0dKoBtLM/eVyRThn0OwfYszNfOO3ker6QrLngSgfYEWInX31oZZOfrr5eLR9tSEHFdNh5JW5FULp8VvCPWrRw9urqtAWb5cTkggbiYTelQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vAW0WHhS81X8Yh7bNOx08mH72sBdBDQ7GarHlP5Pes=;
 b=LoAdVi0IIv2YG2lJPCAIG0CIHECc/t7YSkFFGwsiu/5IWQxoD3aqcf06OBQ+12UE5hv9TND1HNfbKhtALi185+nxc32U5NAN4ak5ZiXKo/SwOjZqPSxOEvfBaJB9kUotbJ/jaYeqIAF09ncFfZ3SvDpOqF2+TW/lDCSdXC9sLrPOszRIs7SS1g2BJqYfftvfHcDphvqSQwqOlAadV8Kf5Tn5jMlEoOUq2Bq3JNMWwnru3v6772nbCD8FQfKRrXV2OyOsDsEESc5K2yOpYLq5fcHfVrA7/KEiNxy+oLVYjx6UOQ7uw4LUiYTUzBsyWkH3YSV5XEZKkfm64qxjUqV3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vAW0WHhS81X8Yh7bNOx08mH72sBdBDQ7GarHlP5Pes=;
 b=A37/w+tjahgStATac/pd2jJUmY5/4iK0/+G5NaDq71nM1ebcU1tvdvJgQg0I+xaYawgCABd8dpiMr0npFZ9ivOJ4li+cj5Ip1TIO9NR4R5NPtFnxXyC5AV3x+OazT0ElRVqVE+F8aGWqESIJ0FZS/Emy7ggXiEUbj15JQW72YZ0=
Received: from PH8P221CA0056.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::11)
 by CY8PR12MB7413.namprd12.prod.outlook.com (2603:10b6:930:5f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 14:32:54 +0000
Received: from PH3PEPF0005961A.namprd05.prod.outlook.com
 (2603:10b6:510:349:cafe::91) by PH8P221CA0056.outlook.office365.com
 (2603:10b6:510:349::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 14:32:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF0005961A.mail.protection.outlook.com (10.167.243.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:32:53 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:32:46 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v3 09/10] platform/x86/amd/pmf: Share TA policy apply code between TA versions
Date: Wed, 18 Nov 2026 20:00:33 +0530
Message-ID: <20261118143034.3566684-10-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
References: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961A:EE_|CY8PR12MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc5499f-a32e-42e1-6c12-08df4580d4a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|11063799006|5023799004|56012099006|261021123027099003|261021121427099003|10067099003|261102123227099003|261009223027099003|261022075727099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	b+Lp3JY00DMrg0oESG4Fj7loVZCtQeUt0Kfi70vgGfgTBk37tzkojCR4kfXNwKc8/lLHu+KodPWwf4Y3kWGs5uX09vwTsVc2F5RUdKMCcFg8dzKLfz506pwIWUwBCw/krOswEd6GmdIQAyw+1U99zv5wBht4GYFMIbYgzO5GPEmfpJIGl55ZwT5NaTGc6gJE4HjWBpyhew1kdwyTQChSn8vZ3XBl7x6eanjxfAJTzEiQ2naHbwnJV2RWjXxak8uixNoKJWDS2WOEaolxAG1+JqibMdWl5d2SdaoBc7MiD0eC1n/DVNAg3d1DtDaBFiPcRWpaxSr2KE+/wZj2set/EBQq0W/zHM3j3jNE0m7wTIflgaYqFxufl8ui+iB0Deu9k6Gw9hqJmMwXi0n5q/qsGSHI0wlnNAcLs26XUit0cF0QPAu7FtUt6ScFVlo/tsAefqo5YtOTA8EwZBgSDZf/npK3dfjs6Y0wHNRiUH8ReTERH/T1CmGOKqfNvnFi/Vni4mNBmTsK2fKnrvhd5ThzknSi7OFNNCrtjTPDm3slHmnlMRbm4DqWIq5YOf3WWbqKPslZbIhD+rjwz1i+DaRdQJbijcUD5tPu0JPMQQUqrQ1jV4bW99VqHKni/Bq7VGgs4VZWm2vtCNtAazjMOOgX/G1ACDtaFQHLELs6fsPJtgGFHDEgF+P8skb6CACROB9H0cPX7hNk+Cp0SX9p+//AUQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(11063799006)(5023799004)(56012099006)(261021123027099003)(261021121427099003)(10067099003)(261102123227099003)(261009223027099003)(261022075727099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ModThKw8KIyHrvmFGyLsvWOLaKbEV+cKANzGYKvcKB0A5fyNxPw8pr2Gnt7Mw0QFy8FODVsmrRGCAn3tqbJAlw9YoTN9yzhP0k37KFyeDqtJkX9rSFCb02vcU1rT1ETbfnkba2hVzRg1ZEbCtAJIEe7daUGZNJ465dZDL6RIOHAyBHLCZwkmf4ETLizH7+i8dpqRfdOa5OrEmcQ8rIww1u00MPQNwRNFiBpd72TiAgTXdojTpQ7Rox7LWjoIKNZW4Xj6NTTQ6Yi6LQz+LIM8EIlwg4G9H1csmRx2M5kayBQO9fyF+X7IwuT2gUYFV44rMJBTiHVqaNuupn30mEGMxo1RGvg1gMA7qoZ3pIUjGVS1M9/saDhm2UjVuo8TO2iEhDfnxPaDZ22ZHIgQ3Dq8JrjRs5sUFhDPxHaghWCi0SwoSrQYB196VIau7e8M7For
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:32:53.4440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc5499f-a32e-42e1-6c12-08df4580d4a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7413

amd_pmf_apply_policies() and amd_pmf_apply_policies_v2() handle the
same TA actions and differ only in the SMU message IDs used to program
the limits.

Add a table of SMU message IDs to ta_ops and use a single function for
both TA versions. Actions without a message ID on a platform are
ignored, as before. The check on the number of actions returned by
the TA now applies to all platforms.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |   3 +
 drivers/platform/x86/amd/pmf/tee-if.c | 197 +++++++++-----------------
 2 files changed, 73 insertions(+), 127 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index fda06100826c..a3b8e11b65a0 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -677,10 +677,13 @@ struct amd_pmf_arg_data {
 
 struct amd_pmf_dev;
 
+struct amd_pmf_policy_msg_ids;
+
 struct amd_pmf_ta_ops {
 	const uuid_t *uuids;
 	int num_uuids;
 	size_t shm_size;
+	const struct amd_pmf_policy_msg_ids *msg_ids;
 	int (*invoke_init)(struct amd_pmf_dev *dev);
 	int (*invoke_enact)(struct amd_pmf_dev *dev);
 };
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 7d876531bbe7..ed3aa150ec83 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -115,163 +115,102 @@ static void amd_pmf_update_bios_output(struct amd_pmf_dev *pdev, struct ta_pmf_a
 		pdev->bios_output[bios_idx] = action->value;
 }
 
-static void amd_pmf_apply_policies_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_result_v2 *out)
-{
-	struct ta_pmf_action *action;
-	u32 val;
-	int idx;
-
-	if (out->actions_count > TA_PMF_ACTION_MAX_V2) {
-		dev_err(dev->dev, "TA actions count %u exceeds max %u\n",
-			out->actions_count, TA_PMF_ACTION_MAX_V2);
-		return;
-	}
-
-	for (idx = 0; idx < out->actions_count; idx++) {
-		action = &out->actions_list[idx];
-		val = action->value;
-		switch (action->action_index) {
-		case PMF_POLICY_SPPT:
-			if (dev->prev_data->sppt != val) {
-				amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_SPPT_SPM,
-						 SET_CMD, val, NULL);
-				dev_dbg(dev->dev, "update SPPT: %u\n", val);
-				dev->prev_data->sppt = val;
-			}
-			break;
-
-		case PMF_POLICY_FPPT:
-			if (dev->prev_data->fppt != val) {
-				amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_FPPT_SPM,
-						 SET_CMD, val, NULL);
-				dev_dbg(dev->dev, "update FPPT: %u\n", val);
-				dev->prev_data->fppt = val;
-			}
-			break;
-
-		case PMF_POLICY_SPPT_APU_ONLY:
-			if (dev->prev_data->sppt_apuonly != val) {
-				amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_SPPT_APU_ONLY,
-						 SET_CMD, val, NULL);
-				dev_dbg(dev->dev, "update SPPT_APU_ONLY: %u\n", val);
-				dev->prev_data->sppt_apuonly = val;
-			}
-			break;
-
-		case PMF_POLICY_STT_MIN:
-			if (dev->prev_data->stt_minlimit != val) {
-				amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_MIN_LIMIT,
-						 SET_CMD, val, NULL);
-				dev_dbg(dev->dev, "update STT_MIN: %u\n", val);
-				dev->prev_data->stt_minlimit = val;
-			}
-			break;
-
-		case PMF_POLICY_STT_SKINTEMP_APU:
-			if (dev->prev_data->stt_skintemp_apu != val) {
-				amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_LIMIT_APU, SET_CMD,
-						 fixp_q88_fromint(val), NULL);
-				dev_dbg(dev->dev, "update STT_LIMIT_APU: %u\n", val);
-				dev->prev_data->stt_skintemp_apu = val;
-			}
-			break;
-
-		case PMF_POLICY_STT_SKINTEMP_HS2:
-			if (dev->prev_data->stt_skintemp_hs2 != val) {
-				amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_LIMIT_HS2, SET_CMD,
-						 fixp_q88_fromint(val), NULL);
-				dev_dbg(dev->dev, "update STT_LIMIT_HS2: %u\n", val);
-				dev->prev_data->stt_skintemp_hs2 = val;
-			}
-			break;
-
-		case PMF_POLICY_SYSTEM_STATE:
-			switch (val) {
-			case SYSTEM_STATE_S0i3:
-				amd_pmf_update_uevents(dev, KEY_SLEEP);
-				break;
-			case SYSTEM_STATE_S4:
-				amd_pmf_update_uevents(dev, KEY_SUSPEND);
-				break;
-			case SYSTEM_STATE_SCREEN_LOCK:
-				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
-				break;
-			default:
-				dev_err(dev->dev, "Invalid PMF policy system state: %u\n", val);
-			}
+/* SMU message IDs used to apply the TA policy actions, 0 if not supported */
+struct amd_pmf_policy_msg_ids {
+	u8 spl;
+	u8 sppt;
+	u8 fppt;
+	u8 sppt_apu_only;
+	u8 stt_min;
+	u8 stt_skintemp_apu;
+	u8 stt_skintemp_hs2;
+	u8 p3t;
+	u8 pmf_ppt;
+	u8 pmf_ppt_apu_only;
+};
 
-			dev_dbg(dev->dev, "update SYSTEM_STATE: %s\n", amd_pmf_uevent_as_str(val));
-			break;
+static const struct amd_pmf_policy_msg_ids amd_pmf_policy_default_msg_ids = {
+	.spl = SET_SPL,
+	.sppt = SET_SPPT,
+	.fppt = SET_FPPT,
+	.sppt_apu_only = SET_SPPT_APU_ONLY,
+	.stt_min = SET_STT_MIN_LIMIT,
+	.stt_skintemp_apu = SET_STT_LIMIT_APU,
+	.stt_skintemp_hs2 = SET_STT_LIMIT_HS2,
+	.p3t = SET_P3T,
+	.pmf_ppt = SET_PMF_PPT,
+	.pmf_ppt_apu_only = SET_PMF_PPT_APU_ONLY,
+};
 
-		case PMF_POLICY_BIOS_OUTPUT_1:
-		case PMF_POLICY_BIOS_OUTPUT_2:
-		case PMF_POLICY_BIOS_OUTPUT_3:
-		case PMF_POLICY_BIOS_OUTPUT_4:
-		case PMF_POLICY_BIOS_OUTPUT_5:
-		case PMF_POLICY_BIOS_OUTPUT_6:
-		case PMF_POLICY_BIOS_OUTPUT_7:
-		case PMF_POLICY_BIOS_OUTPUT_8:
-		case PMF_POLICY_BIOS_OUTPUT_9:
-		case PMF_POLICY_BIOS_OUTPUT_10:
-			amd_pmf_update_bios_output(dev, action);
-			break;
-		}
-	}
-}
+static const struct amd_pmf_policy_msg_ids amd_pmf_policy_msg_ids_v2 = {
+	.sppt = SET_1AH_M80H_PMF_SPPT_SPM,
+	.fppt = SET_1AH_M80H_PMF_FPPT_SPM,
+	.sppt_apu_only = SET_1AH_M80H_PMF_SPPT_APU_ONLY,
+	.stt_min = SET_1AH_M80H_STT_MIN_LIMIT,
+	.stt_skintemp_apu = SET_1AH_M80H_STT_LIMIT_APU,
+	.stt_skintemp_hs2 = SET_1AH_M80H_STT_LIMIT_HS2,
+};
 
-static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
+static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_action *actions,
+				   u32 count, u32 max)
 {
+	const struct amd_pmf_policy_msg_ids *ids = dev->ta_ops->msg_ids;
 	struct ta_pmf_action *action;
 	u32 val;
 	int idx;
 
-	for (idx = 0; idx < out->actions_count; idx++) {
-		action = &out->actions_list[idx];
+	if (count > max) {
+		dev_err(dev->dev, "TA actions count %u exceeds max %u\n", count, max);
+		return;
+	}
+
+	for (idx = 0; idx < count; idx++) {
+		action = &actions[idx];
 		val = action->value;
 		switch (action->action_index) {
 		case PMF_POLICY_SPL:
-			if (dev->prev_data->spl != val) {
-				amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, val, NULL);
+			if (ids->spl && dev->prev_data->spl != val) {
+				amd_pmf_send_cmd(dev, ids->spl, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update SPL: %u\n", val);
 				dev->prev_data->spl = val;
 			}
 			break;
 
 		case PMF_POLICY_SPPT:
-			if (dev->prev_data->sppt != val) {
-				amd_pmf_send_cmd(dev, SET_SPPT, SET_CMD, val, NULL);
+			if (ids->sppt && dev->prev_data->sppt != val) {
+				amd_pmf_send_cmd(dev, ids->sppt, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update SPPT: %u\n", val);
 				dev->prev_data->sppt = val;
 			}
 			break;
 
 		case PMF_POLICY_FPPT:
-			if (dev->prev_data->fppt != val) {
-				amd_pmf_send_cmd(dev, SET_FPPT, SET_CMD, val, NULL);
+			if (ids->fppt && dev->prev_data->fppt != val) {
+				amd_pmf_send_cmd(dev, ids->fppt, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update FPPT: %u\n", val);
 				dev->prev_data->fppt = val;
 			}
 			break;
 
 		case PMF_POLICY_SPPT_APU_ONLY:
-			if (dev->prev_data->sppt_apuonly != val) {
-				amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, SET_CMD, val, NULL);
+			if (ids->sppt_apu_only && dev->prev_data->sppt_apuonly != val) {
+				amd_pmf_send_cmd(dev, ids->sppt_apu_only, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update SPPT_APU_ONLY: %u\n", val);
 				dev->prev_data->sppt_apuonly = val;
 			}
 			break;
 
 		case PMF_POLICY_STT_MIN:
-			if (dev->prev_data->stt_minlimit != val) {
-				amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD, val, NULL);
+			if (ids->stt_min && dev->prev_data->stt_minlimit != val) {
+				amd_pmf_send_cmd(dev, ids->stt_min, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update STT_MIN: %u\n", val);
 				dev->prev_data->stt_minlimit = val;
 			}
 			break;
 
 		case PMF_POLICY_STT_SKINTEMP_APU:
-			if (dev->prev_data->stt_skintemp_apu != val) {
-				amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
+			if (ids->stt_skintemp_apu && dev->prev_data->stt_skintemp_apu != val) {
+				amd_pmf_send_cmd(dev, ids->stt_skintemp_apu, SET_CMD,
 						 fixp_q88_fromint(val), NULL);
 				dev_dbg(dev->dev, "update STT_SKINTEMP_APU: %u\n", val);
 				dev->prev_data->stt_skintemp_apu = val;
@@ -279,8 +218,8 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 			break;
 
 		case PMF_POLICY_STT_SKINTEMP_HS2:
-			if (dev->prev_data->stt_skintemp_hs2 != val) {
-				amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
+			if (ids->stt_skintemp_hs2 && dev->prev_data->stt_skintemp_hs2 != val) {
+				amd_pmf_send_cmd(dev, ids->stt_skintemp_hs2, SET_CMD,
 						 fixp_q88_fromint(val), NULL);
 				dev_dbg(dev->dev, "update STT_SKINTEMP_HS2: %u\n", val);
 				dev->prev_data->stt_skintemp_hs2 = val;
@@ -288,24 +227,24 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 			break;
 
 		case PMF_POLICY_P3T:
-			if (dev->prev_data->p3t_limit != val) {
-				amd_pmf_send_cmd(dev, SET_P3T, SET_CMD, val, NULL);
+			if (ids->p3t && dev->prev_data->p3t_limit != val) {
+				amd_pmf_send_cmd(dev, ids->p3t, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update P3T: %u\n", val);
 				dev->prev_data->p3t_limit = val;
 			}
 			break;
 
 		case PMF_POLICY_PMF_PPT:
-			if (dev->prev_data->pmf_ppt != val) {
-				amd_pmf_send_cmd(dev, SET_PMF_PPT, SET_CMD, val, NULL);
+			if (ids->pmf_ppt && dev->prev_data->pmf_ppt != val) {
+				amd_pmf_send_cmd(dev, ids->pmf_ppt, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update PMF PPT: %u\n", val);
 				dev->prev_data->pmf_ppt = val;
 			}
 			break;
 
 		case PMF_POLICY_PMF_PPT_APU_ONLY:
-			if (dev->prev_data->pmf_ppt_apu_only != val) {
-				amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, SET_CMD, val, NULL);
+			if (ids->pmf_ppt_apu_only && dev->prev_data->pmf_ppt_apu_only != val) {
+				amd_pmf_send_cmd(dev, ids->pmf_ppt_apu_only, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update PMF PPT APU ONLY: %u\n", val);
 				dev->prev_data->pmf_ppt_apu_only = val;
 			}
@@ -323,7 +262,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
 				break;
 			default:
-				dev_err(dev->dev, "Invalid PMF policy system state: %d\n", val);
+				dev_err(dev->dev, "Invalid PMF policy system state: %u\n", val);
 			}
 
 			dev_dbg(dev->dev, "update SYSTEM_STATE: %s\n",
@@ -380,7 +319,8 @@ int amd_pmf_invoke_cmd_enact_v2(struct amd_pmf_dev *dev)
 		amd_pmf_dump_ta_inputs_v2(dev, in);
 		dev_dbg(dev->dev, "TA v2 action count:%u result:%x\n", out->actions_count,
 			ta_sm->pmf_result);
-		amd_pmf_apply_policies_v2(dev, out);
+		amd_pmf_apply_policies(dev, out->actions_list, out->actions_count,
+				       ARRAY_SIZE(out->actions_list));
 	}
 
 	return 0;
@@ -420,7 +360,8 @@ int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 		amd_pmf_dump_ta_inputs(dev, in);
 		dev_dbg(dev->dev, "action count:%u result:%x\n", out->actions_count,
 			ta_sm->pmf_result);
-		amd_pmf_apply_policies(dev, out);
+		amd_pmf_apply_policies(dev, out->actions_list, out->actions_count,
+				       ARRAY_SIZE(out->actions_list));
 	}
 
 	return 0;
@@ -761,6 +702,7 @@ static const struct amd_pmf_ta_ops amd_pmf_ta_default_ops = {
 	.uuids = amd_pmf_ta_uuid,
 	.num_uuids = ARRAY_SIZE(amd_pmf_ta_uuid),
 	.shm_size = sizeof(struct ta_pmf_shared_memory),
+	.msg_ids = &amd_pmf_policy_default_msg_ids,
 	.invoke_init = amd_pmf_invoke_cmd_init,
 	.invoke_enact = amd_pmf_invoke_cmd_enact,
 };
@@ -769,6 +711,7 @@ static const struct amd_pmf_ta_ops amd_pmf_ta_ops_v2 = {
 	.uuids = amd_pmf_ta_uuid_v2,
 	.num_uuids = ARRAY_SIZE(amd_pmf_ta_uuid_v2),
 	.shm_size = sizeof(struct ta_pmf_shared_memory_v2),
+	.msg_ids = &amd_pmf_policy_msg_ids_v2,
 	.invoke_enact = amd_pmf_invoke_cmd_enact_v2,
 	.invoke_init = amd_pmf_invoke_cmd_init_v2,
 };
-- 
2.34.1

