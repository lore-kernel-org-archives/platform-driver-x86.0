Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C39528C5D3
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jun 2025 07:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144496; cv=fail; b=C5IxDuq+AAvM3UKOevtSBBNJKl8B//qy+mGOfD6g+aXYHqkvsGepBgRuN1bK+Q0oXDTXK6Qvdbk8B4QH0f+IIhtwDJHwXQGWRWyALCGwov1Xmhp0klH8mAWauKuiiE/mtvEnzLUnni3vkywg0B4Ej4rMO88n3BbEmSuQyYcecwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144496; c=relaxed/simple;
	bh=UV7M02ERdw/U3BlxtZ2hwj+cRMk3TOqvoBohdkxFezQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y7iMUMumfD0fh+XAcHNUty9XrjScARX2G7a31C00//841vP3Edkzw78c6u9TSnpuP+HthD/jKEOoHOdBLjZkdGwS1Su0AvjEncAURYPk4FF8T3d8m2Bov3C7KIK/gsmceo2L+6cRMM9ajfvk84DNTS6RWhnhIpr7r3sT3ydRdwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ziJsyxhs; arc=fail smtp.client-ip=40.107.244.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ziJsyxhs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRlpKjYltYtCn9MCgLiM79Park1c/iISwUphS9CWtbHR+JX+YaX9gUbXPiuhGwReVcNowWMpptiDvmZhXBjDsAOhDoos6K1anGym8pVCmbX2otX7GhnwZJgu6i3dne0cIaA9q5y61TVvGegdnhuV0+y8HLRghjzLbyLtqEX0IMah1GbN6ZACJt56RysZAMyQ5ZeK2WKxEmWgCcFVQ3gCK9a4hRFsyzT5hPPGf0sarUuklOlWXIs2coPa1PFmYeGVr4qImP757bUpAIJ6SfF1989pk+AsCXDeqCfBeNDdBon/P9badnQnj1pxNzlV4Abq9Zuj9RO8hEM7SWr2SMTBiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxOUohOENo8aB+kJd4ublP0+r8LIjiomOaxi+6Kw2uc=;
 b=xcZAoHrfh3DRHC21QSlCeHy812s/uhZzxj43LYscjDB7VOarKenydBeXezR/ZnjPUeiYvLvYqzFRnXvK8vOMCWJd9O1Uv/bVpxr1cgfUJ/41Nnmww13Fzkk0El7a04h3T5p3r0BNONvcqnKWvubYvgzp1pGeDaYAA6RuXknF6jn3hAtBHYBXUoWZPyVUq0gKgnUrcjn050wjV3jYoygS69BH4LoYFqS0wTQWR0WL5flEU8Moc4CRwIY2FgAKON//M9hYzWl4m8/CedugSK03v2G1H/M6e0h93vZzZzBYRpjFkD4chPKfX1Fj41fCqG4RNbH93yb0l1M1Di4YO/dauw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxOUohOENo8aB+kJd4ublP0+r8LIjiomOaxi+6Kw2uc=;
 b=ziJsyxhsrmxIHKy92ivcsq1+gTfOQA5outS61nMdK2LJf8fsLNI8QPPvz4myyHgo5I2tCb99PrgMo9vO2w4B56555t7mJM8Yt05nOJYRjTKfv8xtXDgrZQbCAP/t30W+CXobdQe56rV1QWNIQa2n7/LBOark64c48ZPjwxTCQAY=
Received: from CH5P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::13)
 by MW4PR12MB6828.namprd12.prod.outlook.com (2603:10b6:303:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 07:14:51 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:1f3:cafe::1d) by CH5P223CA0017.outlook.office365.com
 (2603:10b6:610:1f3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.28 via Frontend Transport; Tue,
 17 Jun 2025 07:14:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 07:14:51 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 02:14:48 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 8/9] platform/x86/amd/pmf: Call enact function sooner to process early pending requests
Date: Tue, 17 Jun 2025 12:44:11 +0530
Message-ID: <20250617071413.3906284-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com>
References: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|MW4PR12MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 085f5c1a-6c3c-4ea1-906b-08ddad6ea6cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HvCWjB90lFl4FpKSASvvgh7Wv4Ao+gfexfhdCCamMb5z1/Z7nvn6dbjO0K16?=
 =?us-ascii?Q?9rCpHxVoC9/KvbAHsOLtI77lNc0MIwObSD7Z7gAUyDCThlPsAz7BZvNiPdG+?=
 =?us-ascii?Q?iGou/3uDrjsO8Xn7F+I95/t1lJp3qHex+ISrbJlgXzfj4ND7Wk2xhz7OQX0G?=
 =?us-ascii?Q?IcS1Z+nXDPtn1gzDo3w2EsRkt6V4/WdWbErzYmx7DQGFzAqoVN2cr9Z9ozvU?=
 =?us-ascii?Q?Hc528fcncZ0Nnx5pzJH9sY3gnUsdyRPUGa1TaznZDSL8ZWZOg++BMk91ayYy?=
 =?us-ascii?Q?ZCxCHgNUy2JMLO+2qIH7mtURYa3XWhvszpEXSOXuv/yReZRKfeYejUdp2Sim?=
 =?us-ascii?Q?HossTmWcZt7dKy708IbFIXO7EuT7a0/K6++8RDxHSDqi9ehcCwQR2RRI3glA?=
 =?us-ascii?Q?SIhV6lA1s4ibYHcSf0mraeHxCvTqmCGiWz0AFQbsFNY015Hs+ngCEsrsT+Gl?=
 =?us-ascii?Q?g0eFSkNNsaeJYrbnEtLTZPKYwhSr6/7QTZmR+AuuPXVCy28hVAdH8fkk5moI?=
 =?us-ascii?Q?NdH/35hkHmrcMJp7PomvT/rTTTImjMrD2GEILn7/wkrp75Ja2nXmwxa6gXQ/?=
 =?us-ascii?Q?lhqEdiB3RTLeR1kD7TKKqqyA8TX5mIBNqypUFh83JNYv6fCvcoZvvOOg/mdf?=
 =?us-ascii?Q?KcwpwAbG/nNybIP4A9Hbt210p5aOWgKV0OIkjl9YefXEOjOUHQRX+KlIBlVV?=
 =?us-ascii?Q?jcglj/eK5iCPl64kTj+tu1gIemzMC+4MsIyeuxy58NeQSMC6qf5AsOKv23z8?=
 =?us-ascii?Q?bWhrB0Yp19w+s4/ZS1BaqpARbg4FTVjAxdMON+h/6S+XN3tVMIOUINt17v0k?=
 =?us-ascii?Q?RfCh0PkoUMidPT6c7ZZyXNBinieEXAmbkVi1vu548Pt2AspMvWZ2UaEt2dbk?=
 =?us-ascii?Q?xVIqVWlhbQ4gzwPyQvMiL5bz48cjB59SVky3NFpKvtYpP7sG8sb3TXCU20mF?=
 =?us-ascii?Q?dj/8tEEd1EKfeoUt/BVzLvIfNxh41CcGR/Jw8xjZ8JqkROGm6aAdTpypUjBg?=
 =?us-ascii?Q?UYWgM+w214jZ6NNqXQPcYD0ehv5WOiXcINcqRwuiPeyBMhFXqhZIBUx4rWaR?=
 =?us-ascii?Q?47m3Fn3cpioOM+E9xE9J7zX+Zx7ZrUIpWVgYgmGH2mB88bc2X3PIWFe3LmR6?=
 =?us-ascii?Q?9VIUCa9KXWGlP23VUxymw2MUeA6lXRK2tOhv7SmGZuak3FfZhCLMKmWKDZ0l?=
 =?us-ascii?Q?8jEad4p511AH/6A5X4zRU4Lru3bsDC7kYl41XUBbPLheqGXZWo6tTjrsdfIe?=
 =?us-ascii?Q?6+PePfZ/JtFuuaKdD3kwsild93JimTe0E5Y5wmx1c1gd8Gte2NYRymV/uwPw?=
 =?us-ascii?Q?vnop4bYeJKmrsmaWcxWNUBGvN9+cO1O/0G+MDErQshVEPQUdIt6zEqs/gw6M?=
 =?us-ascii?Q?eq7D7aHLaqTjn/D+9mf8jmwX9HfiwwQ92T6JK8N4rZELg9rztR17u5lR8120?=
 =?us-ascii?Q?XZv6TvMgTJpj0atTHAt43Qw/S6QGAboZOaD92kyuhsydmu/TJeCafQcxGHOO?=
 =?us-ascii?Q?GeZ0iZltcmeamiEa5RcXzgk6EvOS6Q5aSLfP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:14:51.2396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 085f5c1a-6c3c-4ea1-906b-08ddad6ea6cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6828

Call the amd_pmf_invoke_cmd_enact() function to manage early pending
requests and their associated custom BIOS inputs. Additionally, add a
return statement for cases of failure.

The PMF driver will adjust power settings according to custom BIOS inputs
after assessing the policy conditions.

Additionally, add a new common routine amd_pmf_handle_early_preq() to
handle early bios pending requests for both v1 and v2 variants.

Cc: Yijun Shen <Yijun.Shen@dell.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c   | 21 +++++++++++++++++++--
 drivers/platform/x86/amd/pmf/pmf.h    |  2 ++
 drivers/platform/x86/amd/pmf/tee-if.c |  3 ++-
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 4b8529c9bdd4..7f95a8b6c1a7 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -331,6 +331,15 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
 									 req, sizeof(*req));
 }
 
+static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
+{
+	if (!pdev->cb_flag)
+		return;
+
+	amd_pmf_invoke_cmd_enact(pdev);
+	pdev->cb_flag = false;
+}
+
 static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 {
 	struct amd_pmf_dev *pmf_dev = data;
@@ -339,8 +348,12 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 	guard(mutex)(&pmf_dev->cb_mutex);
 
 	ret = apmf_get_sbios_requests_v2(pmf_dev, &pmf_dev->req);
-	if (ret)
+	if (ret) {
 		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
+		return;
+	}
+
+	amd_pmf_handle_early_preq(pmf_dev);
 }
 
 static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
@@ -351,8 +364,12 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
 	guard(mutex)(&pmf_dev->cb_mutex);
 
 	ret = apmf_get_sbios_requests_v1(pmf_dev, &pmf_dev->req1);
-	if (ret)
+	if (ret) {
 		dev_err(pmf_dev->dev, "Failed to get v1 SBIOS requests: %d\n", ret);
+		return;
+	}
+
+	amd_pmf_handle_early_preq(pmf_dev);
 }
 
 static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index e10b8fe68e67..9f49ac38776e 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -406,6 +406,7 @@ struct amd_pmf_dev {
 	u32 notifications;
 	struct apmf_sbios_req_v1 req1;
 	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
+	bool cb_flag;			     /* To handle first custom BIOS input */
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -887,5 +888,6 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq
 /* Smart PC - TA interfaces */
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
+int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
 
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 870857574f0d..178cf090da8c 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -225,7 +225,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 	}
 }
 
-static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
+int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 {
 	struct ta_pmf_shared_memory *ta_sm = NULL;
 	struct ta_pmf_enact_result *out = NULL;
@@ -582,6 +582,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 		switch (ret) {
 		case TA_PMF_TYPE_SUCCESS:
 			status = true;
+			dev->cb_flag = true;
 			break;
 		case TA_ERROR_CRYPTO_INVALID_PARAM:
 		case TA_ERROR_CRYPTO_BIN_TOO_LARGE:
-- 
2.34.1

