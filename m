Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012007.outbound.protection.outlook.com [40.93.195.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D58351C13;
	Thu, 11 Jun 2026 05:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155794; cv=fail; b=lNEOH/1jIoITOzfLlOBv2YlkwPDKM2OnbpeYDE7+WE6lzrLVhdxaJwf1HmKIwZwzrZvRtjD/dZH5pbfrnp5AyeUSG18hrqVKsex1FWWK3Q7FWaW4Uj6P5+hMSsfc9Yh2l9rtDMJecrApQ9kYE4rt8r7nFzCFTqAX3E1qyE/EDUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155794; c=relaxed/simple;
	bh=EkM1/WsRLDcDUNeiKE/UWpjiKLuGO1nDztRsvuCjOqU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XJERZxofQxXmxeK3kqlw1RF8ZlpQcu0CzCGeUhya/a9pDbbMEc5S9NP3JK9WdQMmVAasg8k5jk/9PEA5BR0IKGuo6Tk7WtwEfO3DkXN2CLAuS13514GF8sFe8STFBNZ5rrO0Xy1JbQW6M7FxvJRLurBAXuj7biDW9Nnwf/mnvbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gLnHn0Id; arc=fail smtp.client-ip=40.93.195.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gLnHn0Id"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WoiHoBvbAbitnZq2ZwHwLk7nE9/Wi4sF+SXPeUQgaT11ZYOkufYIRlAIbcXaoC8HZJlyxqczNjpMpz+WUBvMNSIFJePM6BWTFG89tz7+HbBB96sBocQtAdxzO5VlHPK8c16MGKBV1VM6r+0i4U7fxIurQ/LIiIwpooDaS7wIYdTn2Q6BkAKUSTxYQ800JLmuilsz9E2MsKuQRvQKKt6ajmFX8PxDUF4DdBbaWsiBPuIKFD6onM6doC3nXf90Glbi1u6s71Q04keULQ9PNhfHzIo47dm07au9Q5ESOr9tCGxb0mDE2l1EqnRqSvmBC2YsdV+gjJ5Kpc/WUdVBtb7cOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uh7lXLeIC/hMkgGP5ij4RghWFHbq/ACrn93GwB++Nzk=;
 b=NUjWqoHP0n/NE4qu/RPn6zmMihp558CajDsuEaRMMOpz4Leb6Nd5yyH8AK47RB5u0Vv/4V0dUy4pSib4/L3iprxSNc77Tsc0KhsvGxgJnAGNoegb21DPfoC9sYv6d3rpmDuw8Bj8SrNeMx82XWT2vyMDlNH49LRMBfyDJZWiXpqMVYRGot1k8u58/N2mwux9UWDXpZsEh7oySQ8UmArWz0NCC0/KRLdDlIIHUwJNEgaX+jK88Dy/igJEnjmb/ndffdiAg7THVQgYjGRhBXC/qi9x/7hXm0AXbSc6ojfwiV3gSkuVUKHB6hfKzpHKV9yzN6qZ/Ov+pUkmI528jG2PLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uh7lXLeIC/hMkgGP5ij4RghWFHbq/ACrn93GwB++Nzk=;
 b=gLnHn0Id2m6QqFL/LM+aapofxeI7Nb3wLXG9+J78IkGsNOl52surr7S/5EZx+Sk4/Y1VBdkZ4Kai8GaNBu73F/n3Xt1AXYA4Oev7AT89wPQw163Yc7+qVQV/wI1OBpw/1UrpVZ/EgbmWz4KSGldkHaF2+bCnL6m27VYB259kCGo=
Received: from CH0PR03CA0244.namprd03.prod.outlook.com (2603:10b6:610:e5::9)
 by PH7PR12MB6906.namprd12.prod.outlook.com (2603:10b6:510:1b8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 05:29:45 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::4c) by CH0PR03CA0244.outlook.office365.com
 (2603:10b6:610:e5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Thu,
 11 Jun 2026 05:29:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 05:29:44 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 00:29:42 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Suma Hegde <suma.hegde@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: [PATCH v5 3/8] platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound check
Date: Thu, 11 Jun 2026 10:59:14 +0530
Message-ID: <20260611052919.1095549-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611052919.1095549-1-muralidhara.mk@amd.com>
References: <20260611052919.1095549-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|PH7PR12MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: 51171851-67b2-4ffa-fe84-08dec77a7214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|18002099003|22082099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	GoGevrLCNJuwBzjG+qmVWW7mC+xYStlNO7YDmE43Org/kDFSuhNzxqvQ4WxmaOm85jrjDMMM7cuA31KWFTDCqj282AE5w6+sWykV1CTddo8Sc2UM/4MXl/3YGYNBgwHvY8f+DXD3t97uTtnsmpRJg5cCPLjMt17nVBT20sIp8BQ8zrCwIMzcJDci9RU1Jl7lGI6sHTI/DB2T+2uTqObQla2kh7h4LYzuZn5DjfOQ/GddUCEzVs9Ydd00oNz7P76/Kw7ajOooKTnfmH8EvrMaSr1OswfQwFpBtYfUd6t3Zopp6drM3HFTjr0cWVU+jvjxM+StUxa0Yhor3hTKsYt2t/wf/qxeiG54uKKB8378epmz2qz0lyMvXyfpCuFwcA2bkt2Hwe14TUEHSrmRU8jB48T9pYdTOsHx1NEeXRLIFg1HJ66Dg/2RuHqeiYDJWiLOop7ZAV56MTj/jrQY7tHeE6Tcty1affNmfq87W+z8ng/MK4GlRgVIFLelh82XYvDlpIWsW1ESVIDvKDCKxv3cA8QM72XCtvPO0HPQ8oF7JCVBs38DGUnP6uGzbgCz34B8f9kv/OuSfV9w6JBO/TTI2zBLvXHed8WH5TiloByXBoBGu39CtSlrGK37tUX+s0P3tODrdHI3mBRFIQ/TioZCGfAXBKfQCjfv+wOUITzaQKOrh/e664WEWUX02NCxgsSuZmViA+Vxn0T012QntIfsfoBajEeI21NBONgsBeNjfo0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3nrTt4wLzWEnxGmW6c8oq2ozT06+YZ+wXfdVMW14jjPt+vEtfBKq2IqOs2rD6/9b6uXme57VtrxhdYsiklxR+8tzjFYVfXsZmAxgsBwFCuk4rBMQHGNYObWIwYexcqMRGNzXbmXM95LRunZ4+IVxQ1JHwTcUXYzKDIgf5TRGDu1Y3Cb9Xqg4gBnhx2hBcMfUDX/LqW4BU938zREfBnIBF/ZTkEfShg4dhKGCqngL7QICdFziew6UtQ2/1hEyI/S12K7mZoL0/YhU8wWBK0wexQiEOqDB5gSzEkowrfEDgauEpX4jGjWDbm6v7ovrHrAlXSCQBEYFSmos3GUl0NCAUehNwg/90hnv/965Mg55VFUFQgGyPDeeAAv+HMjxvIoAHO1XxRWAmbsiuFdDwITZN5eBZ4OUvEXv75R9JqNnb5uuK2LsNP1xkMjlNSUJ92Nt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 05:29:44.6785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51171851-67b2-4ffa-fe84-08dec77a7214
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6906

As HSMP protocol versions evolve, existing message IDs sometimes
gain additional response words on newer firmware. validate_message()
currently enforces a strict equality (response_sz == table value)
for HSMP_SET and HSMP_GET, so userspace compiled against an earlier
descriptor table is rejected with -EINVAL when it asks for fewer
response words than the in-kernel table now declares - even though
that caller has no interest in the additional words. Only
HSMP_SET_GET already used a relaxed upper-bound check.

Replace the per-type branching with a single upper-bound check for
all message types. Userspace can now request fewer response words
than hardware provides, while requests that exceed the descriptor
table (and therefore the hardware capability) are still rejected.

Reviewed-by: Suma Hegde <suma.hegde@amd.com>
Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
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

