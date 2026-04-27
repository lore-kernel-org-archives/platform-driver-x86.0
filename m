Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011015.outbound.protection.outlook.com [52.101.52.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF9E34D3BE;
	Mon, 27 Apr 2026 15:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305134; cv=fail; b=qFZmZ8JdisuyLwVLwnMFx9XR7IEDHvo7WXY5VcOGwdIbiRglLijOmrok7CSMORSTqiMVrSTSgbBS9oWI6XiSHU4s61uX9hIzeuGZDVxewEm0LIIdhe32QVCHsNRxC3SBPR9Z/1iadcn4l5k3mJixJKOY6UATNp4/x1CsVlSfLO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305134; c=relaxed/simple;
	bh=Qvz3fYdz6hwenKM9MY5s5BT4RPrkpedMO1SHEOrDY/E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tyQ2IAbqpWsR+DyKlb2Yr487B35UCRrr8nwWxfrOTW1Y+WQY5PFZ77VOn0gU+wH1H842fUlGA1nUh8LlXKJsOmFg2+P38u1JYe7+FDBIyYpC2uFrN/d/e5gHr4PhSUJXNYITCikLWQNw2d/KfNzR5iwcS6QPvSxD2dSVIAdDnug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KOq0RuP5; arc=fail smtp.client-ip=52.101.52.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KOq0RuP5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0SwXAQsuJ0I7NvFyw/veKI8jmLKYc7FfShtpKD/aoiOXUop1dPq0Ae/xKwznh6MiTLDWdpf/lY26FKhAEpvH0GQE6P8ckT7NAPTzqlQisUQ1jMM1Yd7vXIntksqdmOJqX3yybdAQ53pR17rtcZ6p8AUS+wB8YYBFoc9XIoB/fpRDNiNROls+qYaZ41Xwr6pIP0Xytaxu1rCC9bbSt70UKjtsWRfByDrKeOuqiCxWihxV6q2TBDahsbLw/VOL7zhe2XRYOfh7/hBLCIc6zYMkx0fVDM/BKwqdV/zFGQ1VPeGy3hFeojVjsnrKozWJN6pm8iIQMycLnxKAc0Td+e7Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fqUNR8WHes34j6IDPkY/EnZzmfVsvEXnMtDoPFLvww=;
 b=Sm7hOcvGmUheEDNk04ds9R6OKexS3p3ilMsv5/bhMUdZmZb48bMbqKziXACyibdwJLLbDsij+II6qAW4g19qEapEgn1ySQATYRoJ7/bj5qUbqcb57f+91spIzvOBg/+LYEwp1Jml1DC/KXAlcsvh6aIWdYr4acnpJQnsX1gQos6TRgsW3u1Ulsy5bio7XlsGcfSiP0m1eLGuYrPnncj6Un5oRIYWrG6K0yGfAoHoLu8pUQfpIBnPq5TQ6JSUgwuVn1eD8+oUUG8LpqrKOhtXIvQmSkA5YWUWWmi3zMSQaxyzZLFsltHAKE+UrOEeDbLUpERWjYUNeqvEEJtaAOXvrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fqUNR8WHes34j6IDPkY/EnZzmfVsvEXnMtDoPFLvww=;
 b=KOq0RuP5UXMMQhBkmsaOY7Y/VLZn47mWXYRu7SmDYERhCCb3eCsAxCdCXjTVyKcfbk07VgYJ+c8NqP7WjX7s65fza+mvDEDYc7mYIWoI8Ncx3jeOLo0YCLQ8FE8Z5r2SPH2bLRsH8Wm/7+S6tg2WnrTxAWp6WEiejmA7ix2K2tQ=
Received: from BN0PR03CA0031.namprd03.prod.outlook.com (2603:10b6:408:e7::6)
 by SN7PR12MB6741.namprd12.prod.outlook.com (2603:10b6:806:26f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 15:52:02 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::5e) by BN0PR03CA0031.outlook.office365.com
 (2603:10b6:408:e7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 15:52:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 15:52:00 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 10:51:58 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<driver-core@lists.linux.dev>, Muralidhara M K <muralidhara.mk@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: [PATCH v2 3/7] platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound check
Date: Mon, 27 Apr 2026 21:21:25 +0530
Message-ID: <20260427155129.545327-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427155129.545327-1-muralidhara.mk@amd.com>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|SN7PR12MB6741:EE_
X-MS-Office365-Filtering-Correlation-Id: 0029e367-7856-4484-3afb-08dea474eba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|11006099003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	E9QmcZ/T9DqzbGkD2/cKVkbLVdQdoIWON5a8f4Xpw2K8G47zBse8fQheYQOGkhWXyLPTpm4l5YWBAtyXLEckUFSuofDuMR7Nr0Q8LdnrNFAYGaQ4n8DBB23Mq8REzA+2yI+4imToCwvZsp2dx1pUipFoEutmNI/gAtVGevoFD4TLk7D1OEYXJjj9aWBKWVXx+nr4HVgVNrxmHKyuR+Hzmuq7sZsqiV+Shz4t8Ysn7D6/7QpHfFdE0zDEie0KpH8Qr0TzWtsdhveRr94uEFdZGYcvc6kmo0BW8lH6ibCgo/+YiTb1FLkKn4RF123FWljKRle/ylXj10NhBPb6vFAyOic6SmxTRP0jnf/2h6hIyLt5/9LHCHfUISWypBe1Q1V21JsCYJ/podJ1ZEhu558JZZflc1Tsrs8Lk6gFVIq2lTCGjywCKJCwo6YoVy0gbK2XKNinDuHkl2K2udrtDMarKtvp3GLOhubHtvZnNfORlMFBQD6d8CjgNT5LDIzJK2w62CUBTAegDH73duF65HHDQ9hVuI4sSp6JW2/LrqStWyhyjsI3QkdMMWbBJXRRClIB3DX44fjJmsT4e814j8NhbR7bByIouLmXUW99mJ03jhx8qshCabkr9KW5++vGIPy4ocnNnlbPT3AEFAxywORKZ0YbN6ydvd/k/rdl3Qit5hrBo/OZVjwUmOWXjYUxaXO1ka1OV4BlCzUjiG/halgQIXYZKQ6pyvrX5hR+ORsm3XE4kfbOVn8eZ7+ecBQ7KoNNdpsJb+S+Ri56WfbbJH/Qgw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(11006099003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p7K+a8oQbiweFOICAZzOcn/tZEu5ebGMIUEcoD5bK3PyaisQQN+k1D3NnRt/pNJo5Lp7ffGkORvToLFaytpXxVj5XUzogn4L3ThD7RtDgNfL7IYFWF6YrBh9pQO3RbUFHulvfxBP0x3TtZflBGPyVc+U1DxtU6MRF4zWokwOsPdHj1SpZ/rbDXocBRX5sG3TPM0g7rwZ7ga3c3Y/SxjXtg+pFZQfAxmZwNmNOgX/yId5WmLfF8ZCsXfjsIaEWCxM2IdA2vz2V1YekhvtoLlTaMnRSYCbLNQbCCfYYSC6MCp3E2bJ5Bxjfuqhww5D3NJ7B8SPu6q0xFgQoxoPWmSEFqTQab7YvjtpHAGIaX5EGTEQxLgHGy/zvWONR59KwiQ1EstSviyai3F1YtIk2Ks+IFpnw3jxSjfCx2eKrvJ2Uz99Iocy8yMDj/sGSQLufyb3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 15:52:00.9072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0029e367-7856-4484-3afb-08dea474eba0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6741

The original validate_message() enforced a strict equality check
(response_sz != table.response_sz) for HSMP_SET and HSMP_GET messages,
while only HSMP_SET_GET messages used a relaxed upper-bound check.

As HSMP protocol versions increase, existing message IDs may gain
additional response arguments on newer platforms.  The strict equality
check rejects older userspace callers that were compiled against an
earlier hsmp_msg_desc_table[] and request fewer response words than the
current table defines, breaking backward compatibility unnecessarily.

Replace the per-type branching with a single upper-bound check for all
message types.  This allows older userspace to request fewer response
words while still rejecting any request that exceeds the hardware
capability defined in the descriptor table.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
Change v1->v2: New

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

