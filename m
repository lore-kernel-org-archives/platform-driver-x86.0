Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795197156;
	b=NQxboShzHMttvvvg2XKYDXLeljiqXmoM4RMRIMr5jE1R9jX1VWf4G/pDxnnfFhdmnaej
	 D/bvyQKH6DUDGsFHYaBShwcZkn5t/LsK/NpnH6rxQ3Ax7/KY9+NZrz7MJp/oWouuTnDJy
	 HQlco+BYCpOU7uPQJ/T6niDxxXsOrbGd2mMsCopAI2PqQAvAEYXAvVPoi6PkpCV0fNJ2c
	 47BdPSbq4jOy23uojpxCS/r53upW0KzbbEpmLWjn3cxZs7K+SvaUG8ISQJnUI3iuNtqLt
	 d6WssdRldJgZqQUD7sN0EtEm1d/kSAi+lr7Q8qkraEf+Wst7qpuwN/aqUi3VVsBOrIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197156;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:X-Originating-IP:
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
	bh=MlN7bp39qBrfU/jSQUxrjUrypWdkgIP5qa7o1M8BKYE=;
	b=4XrFb8HZsfgoFW/Cm0tsnm49wMwwBRWHLbzxtFws/rqMemG1HVmOIS3reWo8ijNXWn3L
	 zNGQwb/AZaf/p4SauWQVItxcOh7OtCiwMjzvRiY43Cb9S8ETCzhd4UFNy/ro9jBUlCmC9
	 YwsQbvAyyPYKXzyxNO1pFheAdmFMeIas+cigKSvcr44xvXYzSKCf84xXO5M6W07txdgAS
	 dwXlRGE6gIXKyoMlW0/awY8TuXsCBSARBCCcDLnycvvZUy4AsHJR3uBsLowfLy3++9Zbp
	 h6Wb5xL7+SzQPuWxtohGwFH8vxqjD1X4rfL6E8hcKAylL36BOKVXB4OwR+m+AYEHCsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=a557yLxW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.12
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012012.outbound.protection.outlook.com [40.107.209.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EAB606A320;
	Fri, 20 Nov 2026 17:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13EAB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=a557yLxW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxEIFCGknuCt/5odkizQryt/am70ZpDEnqOUd/ZQl3g4xk24ToyCPx82TzoT/+/P/93eaOdo/qjhdO1uTUQlpiHctIqbLyMGEaSaYDf3sxMdnEV66ThqiXT/xDvH9VLIpvTWK1dpVJbQwaTWEirFOdkITTaMh9t2UGf3lpeSh60qLVhJxKf8Sr1kjxZyFd0MZc7m3OKHGiHbfd3OlOG9L5Uk4yjQmkcLed5O8kJHMW1Shk+N2h6uA+2qQlEahPwhUDY/sBHWneawwDnolyXl4MjRuuI3ezXIzQr1CAesYmZAnBsRb2G2bYMf63hrgSCZO8WQIn/tbzEHqebEE0P/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlN7bp39qBrfU/jSQUxrjUrypWdkgIP5qa7o1M8BKYE=;
 b=Py/lLR8yw0WlVd3cZQXyt9b1KEFEk0z0CbJB/5olkiLvRv1cg7dH4D3LdwdMPdxxb1Nvn2U+dCuUDvnfJf5GsocEJjsIgLJoZDs7eD6YAT3Wp6o3rorNxhcTL8XMNSyAp/ggUBxF5d88E3erR2WbWZ6nsRrgII/2L5f5ACAmI00rxYpKA3kjB6ppJXoqiwHoQi7MLN6E525PD9RucsHS0NZqUJT2O0AZb1GAA1tYTMbhcNiELpUn64/plexvomsZhptsrt6PYjHk+xZWsixAHqYXm6Fg5yM0BVQrzjxk556VDrEJ4N6orr2OvGo29d9TAnjIwb7kqhSu/VUTe8IXZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlN7bp39qBrfU/jSQUxrjUrypWdkgIP5qa7o1M8BKYE=;
 b=a557yLxWWitDDDoCihUMI38O/LKIN7N2jsh4BstrmuipFDrvesBmgDkZnX+yUiJKD3QN+ZDJfCzULiTdabRtCmXQ+xzK4WcBxdeSF8Xb4E0hCTWs/PZBtr6aax4cnR0RXJH7CNSywtdgravsLxyx1PWQcrWoxzYT4gl5pNFbX4c=
Received: from CY5PR22CA0075.namprd22.prod.outlook.com (2603:10b6:930:80::18)
 by CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 17:52:32 +0000
Received: from PH3PEPF0005961A.namprd05.prod.outlook.com
 (2603:10b6:930:80:cafe::7f) by CY5PR22CA0075.outlook.office365.com
 (2603:10b6:930:80::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 17:52:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF0005961A.mail.protection.outlook.com (10.167.243.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 17:52:32 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 11:52:30 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
Date: Fri, 20 Nov 2026 11:52:24 -0600
Subject: [PATCH v3 1/2] platform/x86/amd: Add missing includes to wbrf
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261120-superm1-wbrf-v3-1-f6c872816dbb@amd.com>
References: <20261120-superm1-wbrf-v3-0-f6c872816dbb@amd.com>
In-Reply-To: <20261120-superm1-wbrf-v3-0-f6c872816dbb@amd.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>
CC: Hans de Goede <hansg@kernel.org>, Ma Jun <Jun.Ma2@amd.com>, Evan Quan
	<quanliangl@hotmail.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mario Limonciello <superm1@kernel.org>
X-Mailer: b4 0.15.1
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961A:EE_|CY8PR12MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d498a49-26e3-4bca-26ea-08df472f0d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|32650700020|36860700016|23010399003|1800799024|376014|18002099003|22082099003|6133799003|261026130827099003|11063799006|56012099006|261022075727099003|261022115727099003|261021133027099003|261021123027099003|261021121427099003|261026140227099003|261028144727099003|10067099003|261022113327099003|261021130227099003|261102123227099003|261026121527099003|261102130727099003|261021135927099003|261009223027099003|260925021911599003|260925022911599003|261026135527099003|261022105027099003|260925021311599003;
X-Microsoft-Antispam-Message-Info:
	3+xnqXjmOsUsJyFJAx2MjN8tF29yCRQK175VzXrzKPgUOvqmu1cq6tE7TEkaFG7UEv6LnFdtZe8VrPop1AsOZN9vt9H2c4gZ60uJhXQn+IpSeU7T4gr405A+6TZmaFYROXlatiTsJ4Rckc7LSeK+qTCwRm/AjIYldgUF5ugnnh/89fi++bEjQ05XPNZ0zX376704mScmTrlPOtq7czkaR38RoInn18lSsHgdbLZPRV4F+6Q9TnY3QRB249dvfVoIbS3s+DPlNMbFSku8f/1RcljAb0OLFILqR+q1OT7ZHq9Tq+ygeNEVZQi6O5NtaKUxT9uJy4PsLdtrrjZelGGoA+MuEn78Yfa9BHq0spxVYW8hJ/TjT+9XXDyjNL/DjgTruQqfBNCscSEAXlGLFQQNVxMPSZ/wUkaFscJ+eH3HNzFaTpflRw90C1qkdxCgfDN/QBqpdiWeg4OUMAFSlgex906AKLi43jrgreovSCdnRtKOI4B6hcUrVIvbI5WTWrRJBjo9w4K66jHDJNnueFUgcWfkvqeV+x8/9HhjdEQlnuU7UEjeyrfgL5W+L+6Urod4GcY8WmGRbSTpKIQs0Qq8dL35vfWay5e8tNis/2E6GxNZ9UU99OC1b4yP3PKbawCCsgyiq8VTixxDiudw597vj0zXLOtJvkCwze+LBpsoKAKLB1YwXqM7HRw83oE1os6dqUi21LI/A/zp0afOU/K2Ng==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(32650700020)(36860700016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(261026130827099003)(11063799006)(56012099006)(261022075727099003)(261022115727099003)(261021133027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261028144727099003)(10067099003)(261022113327099003)(261021130227099003)(261102123227099003)(261026121527099003)(261102130727099003)(261021135927099003)(261009223027099003)(260925021911599003)(260925022911599003)(261026135527099003)(261022105027099003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xN7vuuBykL5eT807J7YoBT1o0a0E5o3cxgrozn7Ojq8cyDJKBlg5LluysakM825D00ds/LIl8PZzN+xHO4+9WENNaaN4IOw1G/nScjgNR2nAdI6rzvqSXjQXqWvXPwtTI7FH5hOhwiX6gVH/ReEaB18Z9iU1GhZQyfsNGeKq8sJ24q3hkr2PzwkaTB/WcIRjF8FBmuiddto8G8aVU3cePUTNHA1shgVAUhTODcYUaFdNY1CQYhGgcT1AWtM1IUBArf9fv6Pqv2NuWJ2gTW2V5LDcspOnKT8qyEFvc2EdK9hJT7MhnqtmCDu4MFckKz5XPuA2zBpR0OrOT1troRatVS4IVqhE4J6Iu1C9+xcWIS1omL7a4BGy/qzvbnvWGlY/pYOkIG/dX7rGmltRY6DdN1M2Mt9UjtH5TVCYXj1G/gUtWjrgzP/sc1FZibjRcJf4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:52:32.6469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d498a49-26e3-4bca-26ea-08df472f0d9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7706

The WBRF driver relies on <linux/acpi.h> to pull in most of the headers
it uses implicitly.  Include the headers for ARRAY_SIZE(), __free(),
__packed, dev_err(), the errno values, EXPORT_SYMBOL_GPL(), the notifier
chain, kfree()/kzalloc_objs(), memcpy(), the integer types and guid_t
directly.

No functional changes.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/wbrf.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/amd/wbrf.c b/drivers/platform/x86/amd/wbrf.c
index 3281357185d1f..e3795f8a9ad84 100644
--- a/drivers/platform/x86/amd/wbrf.c
+++ b/drivers/platform/x86/amd/wbrf.c
@@ -6,6 +6,17 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_amd_wbrf.h>
+#include <linux/array_size.h>
+#include <linux/cleanup.h>
+#include <linux/compiler_attributes.h>
+#include <linux/dev_printk.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/notifier.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/uuid.h>
 
 /*
  * Functions bit vector for WBRF method

-- 
2.43.0

