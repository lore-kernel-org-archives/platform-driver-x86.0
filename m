Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA4623B60C
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 05:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753247606; cv=fail; b=JYdRIKAL6iN/IqHE7FNoj2WTXtwzQ6YoTXN4FZjOVRygrNXCvqCRd5KcX6I7aQoeSWy5HtJeslRHThLKE0rmsbYA6KPfbZr2tXRK3JlfuchWJwn5Ow/U6xyiATrjAVYYQKjEorWfJ0syZ022PSSudfZIlxb9uQIO3uRjcJSIWmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753247606; c=relaxed/simple;
	bh=kqVXwJlDFddYyycdKIJx3VREPKoTJlUqhiXjK7/g83o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WVL7LrRfLF1fLeczvw4b0Mz4d5ha4OMc8UC3IOIlfUFPM9LuQ7VbjoZgg+EHNuXVPzhYc7dIzAC6B3rktVIAPWTaKgqd69aLfyLKTZtuYlMf5oEeiPAstDRN+Ot3X2x/40nqZ+0S4mYjjRnFMr8ca1Vkey40PKf2JFx6s6LLv+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pzHq69Pl; arc=fail smtp.client-ip=40.107.243.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pzHq69Pl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwec7mZ17NBd4dXSx2qwkBmyF9cQpN1JjGHuz12mp6f3X26TA1XthlH67Kk4tQEiH1McVRndMOPgQy/uyczM/984J+G454pjYNOJ1RjyGHCrbn3e5SBoadfHSW59UyBKDjJPsILKKeaWvkGlOfaTGCQhUzqkbtZywajb5hwXJs5YnpBDRsA2I8MI+XC+6/AIoalKbotrNSth09qBxuu+S1geRB2bxVoDwFWapQ9C+avB2BUvmZw9v1gqSVQ+VE8pwDoN11nRyqg8qBr3szsm3s4fsjZL/Ai0Kke2esUHbnRRrgPuuSXFbHcKtC849MdXII3XEeWOc6i485uhtc/9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjHIzPDYMyVNyL64/0gbKr63Y+nmXIsgDvOvYGLEhBw=;
 b=qda280UwTLw/JLaewqtutduTS3T5qH3dclvtFSuJBrP96qmuIVdFG5oAxdPZE07RxCS9Ulu8ObigZMUyswfb/aDZ/mIAmVbCmexhJUy9MV12PTRJ1f3LKqcaQKlGhJ5nxNAQXM6DQHcHSJhT3BUdstpI5rrDM0dkX8s75PX8Rd13WlXmnYT1YO/4Fn3AlSAjWRGntRqyNKvdmll5a0d6zaoXEBqrer/SbPWAjHC833iSAV3G4jEd6cbOL1jgZSfXKywt/xYXdNImYg38OTt8Sm+MKwaUpQJWuO0bVL17tCw3tTqBJmKLiT/nU0Dd8MJvtJz2huHl0XVit2uzvw/SGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjHIzPDYMyVNyL64/0gbKr63Y+nmXIsgDvOvYGLEhBw=;
 b=pzHq69PlALRX7xyuu4OkyXu0I+mC9tfJcXUT37PJWgCoAmySTVjeZxr/JVSSOYGHcn3bghKfgVK5uUyIv8S7322S1xyrTQqRMtAw9MaljybVibK09ia5nyNLs0JskGHSd9KeB46SEX+VLx9tpjaTxaRqvxt9wWrm5c+97kJczC0=
Received: from SJ0PR03CA0155.namprd03.prod.outlook.com (2603:10b6:a03:338::10)
 by DM4PR12MB6206.namprd12.prod.outlook.com (2603:10b6:8:a7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Wed, 23 Jul 2025 05:13:22 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:a03:338:cafe::d6) by SJ0PR03CA0155.outlook.office365.com
 (2603:10b6:a03:338::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 05:13:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.1 via Frontend Transport; Wed, 23 Jul 2025 05:13:21 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 00:13:17 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH v2 4/4] platform/x86/amd/hsmp: Ensure initialization of the sock struct in hsmp_send_message()
Date: Wed, 23 Jul 2025 05:12:51 +0000
Message-ID: <20250723051251.3009625-5-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250723051251.3009625-1-suma.hegde@amd.com>
References: <20250723051251.3009625-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|DM4PR12MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e55928-c467-4a2f-0153-08ddc9a7a4bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LMGbNhX3kcTJB2SzonU4OU9jrwuyyk5FIJfA4fRdX9Lz22smc14LrrxSX1UG?=
 =?us-ascii?Q?pV75WVHa+jhhRu0kHxkjZ1fZIppZefs9S/dVqmOcKCWGNhbSuupftxuCfD4K?=
 =?us-ascii?Q?FWM0K85EOS11l4+ETqG5zqu3UuEJntCwB+YWfAhwoha8/0LrOSz3sFJAoqiA?=
 =?us-ascii?Q?jWKTX9yup2ZFuRxYZEn8rnvxJFRf/XDVYb54kghd9lvAlJOB0baDed+Y9TyA?=
 =?us-ascii?Q?T374fAi6yESeLpZBnMZLDQbhE5o2tEw4KlsmXMVlH59umas7dMVnaYX1Td4f?=
 =?us-ascii?Q?+OZRGdTDCjFjdRIGdtUfBrOWHo7oKddx4OMmjjTBZQ9NeGlv7Fbx7eQrwDGg?=
 =?us-ascii?Q?3j9cL5roPAxbVuTntm5RCI8O7F0KjPYiFviXm35EqbbBXnca32lkoDp2uCrm?=
 =?us-ascii?Q?XQkpxs/TUx5tz7DKf78Ldwa3Ou3BQHu8OgCRyC/eGtNGup0eJe4LvwSssraq?=
 =?us-ascii?Q?6PWDTUw5SRxXz75L9F+aqQLqoqaUaPRjvkI5od5YtoEstJlhKSYosVO0aQRq?=
 =?us-ascii?Q?xsl4xf1/qKV1q5rrjjOd/4f09qmOgPwX1da3U3lM/vQR57fLFHxmKnErIvV9?=
 =?us-ascii?Q?LHNz4qcLN/+zFV9QtO9DURQ5ft+UfrQr7E6aEz9pVgHnVv8jd0cZdqq0Nqye?=
 =?us-ascii?Q?ntjy/18tUtTPk3MZ0jCi2gjlPLpFZuer+jTAnOXeKzImf0jkUaWY5HoVe/jU?=
 =?us-ascii?Q?5jRcfO6ytqOSm5Q3fqZjnjFjKmT4+M8TwJTk5fD3QCAYWhyL4vF7RHS9SA66?=
 =?us-ascii?Q?3b4r97xG1vaFMTLWeh6DhUXn9/z2foL8BOENAMMFEWwqVgbx0evP6y67fReR?=
 =?us-ascii?Q?NDRvT9d0SlQDCyriFniqZ3prMbmH8eBtBPOXMGNzTuY6B/Z9D4FLBJ66rmpx?=
 =?us-ascii?Q?YfJrP/yLcujMva/cyRbq4hKTAnb0kcJJW514KZ5uNi5WzuXtctSWW6xzE08c?=
 =?us-ascii?Q?9PoL6cO+0VY2mDMN3znwtlsIW5OEUyQGGh0vgE7og+2nqSjp8yRkjRkbqZLG?=
 =?us-ascii?Q?sGCuI4z8ruGvxRCmWkndU1hIB62XJApJeMgz/yTPofc+dzXQeIdGDXRd/+3g?=
 =?us-ascii?Q?iGLCtXeFJU7x3MDXbrF77GP3i7M/UnaR74ViQ3G+iQET7ZYPRUCkcaOvKiV1?=
 =?us-ascii?Q?/C/dGTf0PH/942TgGJNTCSm5T2uM10PCbYCbRVOpIpq9gUTmMNdFjqCdHptH?=
 =?us-ascii?Q?JWjASC8fxG2cO4Mh4Jk1KMxFXTzEiOtimmwBvMRz0heFmFOV0yOQvAVzXpgY?=
 =?us-ascii?Q?V2YLitLkOMnjKddxLNRDgQuY6FgBT6uDA0TavAp3gRC4hMMZmPHvghpBX4HQ?=
 =?us-ascii?Q?cARm9DB9VteqzVIWgTpfyOrMb9LYPE5oKkMIV9ZCssGmmUKJBF//eYtJNF5J?=
 =?us-ascii?Q?aYwl1xmjolZevQqSPQ0C8uUU+ujar+EKlnuv57ISZDm1Z32aD7eZg+drfawh?=
 =?us-ascii?Q?/fINbe+Zvci6LqLBxCetQ7WylEQRkde3cczP/FuiACXj3aAI7lhVoHzAZyi1?=
 =?us-ascii?Q?gI4G2zimK2z9Wim3C4NuNg6ErtVjcT4NLkBT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 05:13:21.5646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e55928-c467-4a2f-0153-08ddc9a7a4bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6206

If all sockets are not probed, invoking hsmp_send_message() might result in
unexpected behavior due to accessing an uninitialized socket structure.

The initialization of the sock structure can be confirmed if sock->dev
is initialized.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v1:
New patch to address the partial probe/removal issue.

 drivers/platform/x86/amd/hsmp/acpi.c | 4 ++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 15c4cedc2759..a2d91d4a3e02 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -617,6 +617,10 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 
 static void hsmp_acpi_remove(struct platform_device *pdev)
 {
+	struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
+
+	sock->dev = NULL;
+
 	guard(mutex)(&hsmp_lock);
 	/*
 	 * We register only one misc_device even on multi-socket system.
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index e05d824045d6..a4420db42781 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -219,6 +219,9 @@ int hsmp_send_message(struct hsmp_message *msg)
 		return -ENODEV;
 	sock = &hsmp_pdev.sock[msg->sock_ind];
 
+	if (!sock->dev)
+		return -ENODEV;
+
 	ret = down_interruptible(&sock->hsmp_sem);
 	if (ret < 0)
 		return ret;
-- 
2.25.1

