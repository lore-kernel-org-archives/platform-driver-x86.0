Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2040.outbound.protection.outlook.com [40.107.100.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468767AE54
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 11:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709204479; cv=fail; b=VFz0fGHg061QhxCQfLqOJ+EOoxDy8UlaH1WlWxgpBWITIv8I72RpUBvC7rPSncYp5O6Ue+05bJMwU2eGu41HF9NB93IRM9png0GP1A8/T+cZ3I91qqVhqfljEpDsKURm/+30MQztFab7hOfN9jV7QLnOYL4g/7lI57wd6ajTugU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709204479; c=relaxed/simple;
	bh=CcjLFYAGsnjTF24Z8aLae+s6YnTYSBKEncipSigZJds=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FeNyl49dZlM+FVTRQAHIcZ8retAB2WF9fb8Mc8fYm0k0uSEcmh4Rp1PzH/8Ye4Ucx1n+UDJaQCH1cN52L3Ma6l5inagTXmhEqkZelrjIapAU2IpihQN5BXX0B04iHaJINe/pMfl+dgcYLk7aoAOzbUJqRunsnpBysOXLZcZLDZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cxSKQf1S; arc=fail smtp.client-ip=40.107.100.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cxSKQf1S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESeNzpZFww5r70St0CuzJsLRjsWP3mPy9530ILLmSwHwyHUhWHoeEM9SFMcoxeqkvrY2lQNUuZ5oYIrQVNmY+vGzPXNzfm6yveeSN3vQCEo8A9W4FsIoWKkezu74yKRtoUtnbVtYPtHoJgumsDhFM1oXXx4xUMRDXjCb6OE9KC4e5GZw4GLUpmUri2GP4OiXNdi7h3VuO+gqSlnD7VP+4HDH4HUAWt76vybW7gqIxf9MouLmQDhWY+6MGKlaCDDo4VJ6L32zOJqkMEoWJcsFvkAIG4tn6gTJv0DFxzal2sdwcDrXvVGvRCthJSa4O3Wjxbg4I6/2WLHU7sT7y8yx5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsHqzKrdKy5c1HTQUUE677ojkD29pktUNtetjI3LEC0=;
 b=Tjop6dfx7duDiVSizXRAm6rH02NZoZnQnuL2TSnKyKeJhkHBqenLPR80ITIFB1+KqWhttaky+6jtRIlkPJ89+9CBSpXb67k0YMqY4Es9eioYv5M380ofOTcs/7Q9OqFT1+Qm/Xkv+/zQXu2pBNTUB2ZLJysO47e6OkZMjVbTieucofx3vcaIF9RXTQa60fpKo+44w8QwJpymCENW0Yay7FJP/tnLlN4pK4HOMBDvYlZ8pchNDrcVLFUIY9i3TCJOG4VS8QLarkAgCqfIQ5GBm3dNDiQeTKy7cxp+md18QTr8ICLG6tp/+XyqhoPQ/RimXYdqf9acADDcXTcOnBN9pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsHqzKrdKy5c1HTQUUE677ojkD29pktUNtetjI3LEC0=;
 b=cxSKQf1SbNSx2FzA4m8voBHXfky2BlJ052SuUjHgxGZ4oOAeHsJoQ+EaQ3+Si42rCDNLTZEko7m4+cE8wP4UE/mifQJMa8AIRM4yQp/tZj6gHV1sGFRG7TNUTgQZPdYnSTDb5RfTjLEeCZxC9cld0o33HtfnbrNiG9CbkLHHOmM=
Received: from CYXPR02CA0009.namprd02.prod.outlook.com (2603:10b6:930:cf::17)
 by SA1PR12MB8947.namprd12.prod.outlook.com (2603:10b6:806:386::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 11:01:15 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:930:cf:cafe::ac) by CYXPR02CA0009.outlook.office365.com
 (2603:10b6:930:cf::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.30 via Frontend
 Transport; Thu, 29 Feb 2024 11:01:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.76) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 11:01:09 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 04:59:58 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH RESEND v2 3/7] platform/x86/amd/pmf: Add support to get sbios requests in PMF driver
Date: Thu, 29 Feb 2024 16:28:57 +0530
Message-ID: <20240229105901.455467-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229105901.455467-1-Shyam-sundar.S-k@amd.com>
References: <20240229105901.455467-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|SA1PR12MB8947:EE_
X-MS-Office365-Filtering-Correlation-Id: 231c8995-58a4-482e-9979-08dc3915bf7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P6BidDd5v0pLknMzTFuwjTtwcct4dlk1Fygtmc3zOm0bBfdWXqDakPXpQWuGifmNILYSy/T6g8LPVyA2AKnmE8vnBfoc1hjihtpHbLhQ6vpDioxOsY7zeZhOarki0OCpYLApJdgmBTPdzhD0bszZVfE5RkOclefXl/rtnxL6NeXY3fkdyKA6+zwhPAB3JB5IMS/pE7DDsJTWyv81X4czlNWTe/eQPYxSihlvvadjA76lx6pppNywknC+ZhoLos02X9ALcju28AgC8RF2OBxC2vS69dxEACqpcXrdxPRnfFBiXeOyzn7Gf6+f3wq9hH13A1RC+pf6M3qEXyCMvaRWOFajTJ1muq9/K2gam3lyPqvwSHyZ9n83uzzgxjNRmMGebpO7VH96T8iAIubgemlLDR4moO9OpQwYnszznlRSVsQJgR7Qek3P5MQzeJElbqDk944unau+ohilqhimV2n9UA9Xr9YBwxdHcX7K/7H7uMLLRKXziQqsQO8b3IqvC6KLCzAj3+mG7TexDG0asDxXGSbQkmcBFmXtptbY9Pmoa82sr/JIrkNsNUPY4bWJ8Z4KCUGqV/iqQT7aolIB9BMqwh1Rch+q4ZDCsyUz0X1FFGskOm/y8A/UGW7yZYInHVYgwVw8VgH5mPzsehSfh7YmKSoEY7HcLnUxhVRIVRc1aKjVCG5TH0/o3A6iHckuSBiaxESpwcb0GTW//NFrZAV9xScL+ywrvb1kMk2Q6Sh7GbxTrowHu4zmTHHj1otYe7wo
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 11:01:09.4256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 231c8995-58a4-482e-9979-08dc3915bf7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8947

Update the APMF function index 2 for family 1Ah, that gets the
information of SBIOS requests (like the pending requests from BIOS,
custom notifications, updation of power limits etc).

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c |  5 +++++
 drivers/platform/x86/amd/pmf/pmf.h  | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 1f287a147c57..13af83b187ac 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -166,6 +166,11 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
 }
 
+int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
+}
+
 int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
 {
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 4364af72a7a3..f11d2a348696 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -116,6 +116,18 @@ struct apmf_sbios_req {
 	u8 skin_temp_hs2;
 } __packed;
 
+struct apmf_sbios_req_v2 {
+	u16 size;
+	u32 pending_req;
+	u8 rsvd;
+	u32 update_ppt_pmf;
+	u32 update_ppt_pmf_apu_only;
+	u32 update_stt_min;
+	u8 update_stt_apu;
+	u8 update_stt_hs2;
+	u32 custom_policy[10];
+} __packed;
+
 struct apmf_fan_idx {
 	u16 size;
 	u8 fan_ctl_mode;
@@ -612,6 +624,7 @@ void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
 int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
+int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req);
 
 void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
 int amd_pmf_reset_amt(struct amd_pmf_dev *dev);
-- 
2.25.1

