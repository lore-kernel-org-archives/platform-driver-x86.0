Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983592;
	b=h5lT4J2OIJ3pFB6d1zuR4/zDS7cGbJushQVg9dtUM8Eyug8GNDBpwkLcff/re9jLIxre
	 sOsz1G8Geux0AqsKd+WqaZBmjnmMSIKNFX2if87MPy/ghlA0sxrv+BgH9iEKEAdLHs2Wh
	 uRQKRUvHw2Z0NnhqxEMCfWt/qvosg170mOsaX46OaVQ8aU7hCsjVn5tYoqgy2nUtGukoT
	 liEKIBiHGbjafLv0q4IkFRUjXrl5vXmpIJp6NY+B9I/TsUuimyASIlScX5Lwc+wlt8n0C
	 fD8TvMKRHhRoA7rSP86mFqsa0VPH2pL1nGcR/3BmB6aDZhZWGpHfAQAsptk8F5y0SoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983592;
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
	bh=/u/9s0A+bITCwU8QQKhnOE7MHrSGdWyt3J10TMH20GE=;
	b=TmeuNE/EWys6uqYAWUlCLclSzvKFLYtSuA3jI4ZmcuHOu00uOoyWnX3nGxI60FToK9+7
	 V9v9r4glUkDhTqJhkYgCJV5y05yBWoNNt8b2E3wxzQLLkab0ZImMiWMysfmZcaIBGgidF
	 4t8SD7UEH6T2Mrxzj+rSTu3mGj1Xaa+lOHPV775r4xn70Mz2yjPqJUkmwRmLiOq8PndoD
	 OAIhz23Xy6E431pxIQQhW1ULa+ABqdUQflB0QLgI6fSDJUcJakdwn6XJpyQV7+Oc0SfvW
	 yliM5rj2EgN8eJtL6lvTgtnqFQf9C+pW1ggozNVFW6WwDZpEvPFakBbFXOEopVLvxoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ypz68hYE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.7
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013007.outbound.protection.outlook.com [40.107.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20BD606A326
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 16:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F20BD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ypz68hYE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0L5bR0aCTgX2Nd3bzERHH+kGD/nWRWMhVXb6nFrlIs5oHZ37O+EonPEzEawbOZeduH1wDSLaUpHfcDPC4Wy0HhXvBGNo8/9kv1IF6ObN3Xg6YPm9uvw/x0YuuW9nqVhtVigEWxEiGBiXGNTUZtuSmE80OOE7Z0KDmgZtpK5GHYyQrKNMZ2QcbZwaXMZGmdjjYnSBpbQ1SeMuvPJ8hpqFHSVxT1yBnR8nTh9bBJJZi5WIbIeCeoPB62AsxT3cpr6S89aSR1kBHByf8ebxGScvWlOyT8bHHi1TcUAp467o/l/SunV/gk5zfG3hgtvHxBBnF1AUUVRhr126nw9gTIZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/u/9s0A+bITCwU8QQKhnOE7MHrSGdWyt3J10TMH20GE=;
 b=m7huxh34U03v8cpPfCcfAaUArHUVIbJpP2rBcAqzYecEcqJWljGfFulkrNYOblJOY+9jD7K0OgsWsbRsjcSJDdovjW5j9jmn4pyu+bLzYUGZKOnz1RgrG4lloAahY5IO52q7k1Ur29swJdzaX/Gg/6pg1M6nAtyB5fPVHmKRkuoyOM1CtLOwR7DC0gsiT6SJ+zOWMGvoLfDOHkoEu4TxWBsVsHLxl8ESgwF3NZQ224+G7JHofHjqnKZEmOGsMyPwPlwHg2F0jx+EHVKh3omXyF7ZRH2n5b/q58bmulAkC2gIGPO+VuOEhV1KBe4SEPXuJ8lU5YT685Tzlz+X4DSchg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/u/9s0A+bITCwU8QQKhnOE7MHrSGdWyt3J10TMH20GE=;
 b=Ypz68hYE/LdKwC8rJS5Q4e298LE/OQfiw+frmfv3HjJvK68wSEf7IP0bP29r6POmxebdY5jRZTTHLxZKF3xOCNMGsTJPJJRFZswds4nXXvg4TEtsC8mh/Bu3OMWwreXxbPacC4Ir6lLKK0UOEIFgJFjMQEqRocSVBiu3gR8fT+c=
Received: from MW4PR04CA0375.namprd04.prod.outlook.com (2603:10b6:303:81::20)
 by CY8PR12MB8268.namprd12.prod.outlook.com (2603:10b6:930:6c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 16:46:26 +0000
Received: from BY1PEPF0002695A.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::31) by MW4PR04CA0375.outlook.office365.com
 (2603:10b6:303:81::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:46:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0002695A.mail.protection.outlook.com (10.167.244.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:46:26 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 10:46:22 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 05/10] platform/x86/amd/pmf: Use enum system_state for the TA system state action
Date: Fri, 6 Nov 2026 22:14:24 +0530
Message-ID: <20261106164429.30738-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
References: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695A:EE_|CY8PR12MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d9e67e-39b1-4974-da18-08df3c257f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|18002099003|22082099003|10067099003|11063799006|261102123227099003|261021121427099003|261021123027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	ESBcRXUVvUTLH3yyNWFKfNA0vXuHZmC/IbMftLDGI/KdIBfVAK2tmGdxVY1sJajTsxF6Pg8ioAKlN+ftaAbSsZrwxLM5oFZHbGWTCq4b9OOfVFMkWCyPZwaVB4eyxKdmTUac2TzrpHKU85VEr18NJhlSj7zau9Xl7ikBFIoqLZh+slAh+HpFpY7eC/S3wkbmbyIvUypo6mPIZrru8e5GU76UxaesUNIK83MkhtRH92IJgoc8yjG9dxdu7XMMuE8Um76gsQgO2JWoY+2NKz2YYRIRo/Unxh/sKKayKMbyP+QlTP2KnO6A1wp+jsrCV+VMkFK4gaqPpupMw4FTKugzDiyvvIZseZEXtQZx/2MWJFpvaDh4AvgY+zTwUFpylokzXMG8Y/736Q9P/+wnCcKSsPj5PIImdKU2alyzeaoHDR+P5AzzI0DujLAOtvx7IF8/R7oI2BrMLa8HPkA4TLTFsCg+k09NDz69k0Di5cA3oDCIK/EtVQ+WB3P8hOY5sbKH14WnwCYruMYJ5dU2foknpzlJJIp+RzbHFqoNff83f4pmmgyZu9U/6NTBKW/8qT3WerF8BXp9XxR3BGzBB5yISbvJvq/gTKBR3R6EByA2y7ckDyKZOhte6+sA7T/8B5SB9xbsSIm8HTT7WxRTdu47Bcccjdzkku9yP3fckDz2qX+Q0AwfsyQ0MbpJeP8v5FOEC4oFd0O8vfJ4/Ymk5O4AcA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(261102123227099003)(261021121427099003)(261021123027099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PDUBOcx0ocWQ2CVwTdesjeYam8jGOsK4E0JR3EvFfgFTx2VLGcOXJN24k6Icz5eLnlZUWGPC/cniFU0Wpg/G2E043luYdu4hlRn88mEX3cr8e5HZA7Ko6fmB/IiqhOMpJDJQwtilGacuH8q9XD1wfEhZrNaR7o2rmTX2jThGpxNfj1AG9xZSe1MybkgPQsxskgvVYyzGMUN1e/cBfRtf26t/FLsN2sBReGzvNg+GJQ7nf9SwvO0SOZulqptVbzwJvAZ+BoXZPQoh3NmVsN1bj3Izzw/MIP6O6XaKCri2HYYlm7awZtmMmkxdhYTuiwyfHxzgVJ0gJTsXrbjdg1A5rgpw/dfZRJsSZRY9+CT3lywsLQvzB5xzkJbJNpzhe5D4I2bV3ELxHkBqZhsgsp+1amMgYoXazxWcI9ZCT82mPkncluphy3N3y7yRLbxMjbLp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:46:26.0460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d9e67e-39b1-4974-da18-08df3c257f8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002695A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8268

The TA reports the requested system state as 0, 1 or 2, which are the
values of enum system_state. Use the enum names instead of the literals
when handling PMF_POLICY_SYSTEM_STATE.

No functional changes.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 9b328be1e8f4..e672f7cdd1b5 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -209,13 +209,13 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 
 		case PMF_POLICY_SYSTEM_STATE:
 			switch (val) {
-			case 0:
+			case SYSTEM_STATE_S0i3:
 				amd_pmf_update_uevents(dev, KEY_SLEEP);
 				break;
-			case 1:
+			case SYSTEM_STATE_S4:
 				amd_pmf_update_uevents(dev, KEY_SUSPEND);
 				break;
-			case 2:
+			case SYSTEM_STATE_SCREEN_LOCK:
 				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
 				break;
 			default:
-- 
2.34.1

