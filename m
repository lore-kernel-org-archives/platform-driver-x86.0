Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010015.outbound.protection.outlook.com [52.101.56.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0517548640D
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 09:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451825; cv=fail; b=RnEXXpKeo6SvvqkEH0tQuM3l9z15LJj2Nl68qyTcPng03gtXGfP7KtLDzp7B/GeBFPm8W+Ah4TP0+FZcDoP6LcN1iApffI2vky1nkXqNU2VrZRC+whtiuj6pu9WikZmSqTQiX0GgBIJlTrNR/tSpe+ZbGiTeLu4iP2mmHLiwYpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451825; c=relaxed/simple;
	bh=25tCJxu/Y5I+g/NvCUS4DDQ9TCCMVcufpt00r8qjthU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xr85rqwkn7v+BIgWDWNk6ZEzCOS0/Z76E23W38pp2D4u9Y0nIrt2r7ZBFNEpcREZv+/Vx1ZICXm9YURIGylEKafhV4pozKi/DsedMqJSF2MSulJC1eJJ46ISkMVcy35b3+wlGFDzAlSZS1jPpRTHiexDs4+lHrHkSsiywFO+W/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=w6yuZOii; arc=fail smtp.client-ip=52.101.56.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="w6yuZOii"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWSeU3mfGM3djXuVZSRfdBPn0pB2FIK07zLUHBONblUctejAmBoNY8HiIGs04tLaMkLcgtDv4TQY9z8T9Y47f9p1aHERBscfkvuP7iOUmpsuEKkt4N9FWVMtw6pncLCHOetb12TKMtObro1/TEWlobCaWYz0cEjaqMSy1VQL7NtgD+L/LG3XWGXFTk5bc5FozwDZGOqFgdDyrXkeB5fN2GUcbO2VIL71sFM5Tbt5Af1mcvwLeJv7m2k2h8mJdx/VdWdOjkZ9RosMBV/KYhphbMzAV4H0zd8LRvWW4QN2dqaawfoMbfrO3hs5pm+FAbDAunrTVrrSoHvEOcHP/PFQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KreJGDMCou+A1+ySyGOkiaIZdFmvleno9TwdrSIgsk=;
 b=sAwgNKr4QptGX083H0RsfNMOFvr5zhvr44gjsQfFPcoct7xd1QknbihKuVrWZZ5ly5cEE3hSAP5SFOoZLYbfEwp5b/qimJFY3rvNijv7yT9Tw3FGAEvHQ+P9ij8y+0uODBtXji2DNZkb4VOMbAV39nvAgrPEp6HPj+WOI8JkJlbhZnSxsojTOocyy33uWBPYRW1tWXB26PPCNg1wb5c+UCxaXczZP5rL5HoX4MJv0O/nYPPbMEdpA6IwC6CtNQKTXBDYu0TIXX14U/EZ0zpSU8I2U+aW8Um4kH94V8mSF14VLp/vHsQMkg27iCjfW4PmmVTfFdxNWtF7oynFKHsUhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KreJGDMCou+A1+ySyGOkiaIZdFmvleno9TwdrSIgsk=;
 b=w6yuZOiigNw35A91gXy9NGY8e07JymhaGgfEk817H9dpIbJaLPjdZLL2AXwHawE1QyCFtPJxe0TuxWelCGkmU0sLrtzDbUrcbeRGJJYF55wt1A/AvrRqsukdNGoSu+jg9asr6OSR+qHtvLuwhJmmY6pk6XOjPgfXLJxdvK/QE8c=
Received: from BN9PR03CA0487.namprd03.prod.outlook.com (2603:10b6:408:130::12)
 by SJ2PR12MB8012.namprd12.prod.outlook.com (2603:10b6:a03:4c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 8 Oct
 2026 09:30:13 +0000
Received: from BN1PEPF00018070.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::9a) by BN9PR03CA0487.outlook.office365.com
 (2603:10b6:408:130::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 8
 Oct 2026 09:30:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00018070.mail.protection.outlook.com (10.167.245.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 09:30:13 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 04:30:03 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
	<muthusamy.ramalingam@amd.com>, <NaveenKrishna.Chatradhi@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>, Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 03/11] platform/x86/amd/hsmp: Null-check drvdata in hsmp_is_sock_attr_visible()
Date: Thu, 8 Oct 2026 09:29:31 +0000
Message-ID: <3cc4005d44f633a427eb3861be8094999ce9e71e.1791446401.git.Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791446401.git.Suma.Hegde@amd.com>
References: <cover.1791446401.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018070:EE_|SJ2PR12MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: ef929add-b247-4b84-1dad-08df251ec159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oD/D9D5Guz+ow7PxTSj24nn5Kd016asJvm54yKj70U4AonX/mGDfQmlCIxuyNOuV+aX106JywR9D4AMbbh39dZ0KV12eD4wPq8Ka3FwAZeNf6DYcoGxo6pjt+XNPNPgQeQBCAooTS07JCSnApQDJ3povvi6F0MjJVwWPsHlDzAZu5/lHvpn8H1FqrVcscKweo9+UL1JbFmQLIpSQ4UCLVqLQoq2WW68EObQe1rRii5QKzmF6Iaq3fWUKSsawchG56SqIbUT3Kxs2DvqjQgq9VKlsjBsmzHdSgHO+X9lWqi9McWJD8MUAOObWeeJhL5eeo8RTlPKA9pGR3c6dSyZYInOK27eOhaiX1arOkBkg4zuaar+uFwNxXzw144EfAxAN7GkcJtj2Qb9ijq4mbVL5XrSJk+ktHatalqJFLi34/ZmBaMYqWeB9c2tdaSiz7uridxfp0pfQ8McYdjbOBHiak12MNK9FBoqGbqTCK5cYBk9G7YZq5apoxm5+K1g+ARv9+zIIb1pp+OEsIuYNjspk5nuKeNaLVV6OFrhXoWJrhzoB+DjXZG2fvjVk14t1QWT2+uzxKDtf/aEOoUpQ1ZqjmK5FWjHwMAVZ5KMb4NTNQTHEqpjfBrWyvfPviuso9TEQO518e2nh9dY4i8its3Da2fMSszGSjlHy6dMeS+FTpc2A8oa9EhzYfdb9Q/HIpGaiN6nQUDyhseG2qDV6Lm+9SA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fGxx8BAhTCvhcptT3EdjtXDx/Sxc9xny60tUYrLjbSilNfFK/djPaHDQjqjGlO/K5mHYdEfqsP0ele1Fx7OAPdlyTZfcsPxXQ/W292nNgQiskcVclMjnNhgV6WOBO7TgfJ4+HBzrqfx4Ew3yXPL7nD3aSLbnoD9scWh3XaezrEXBexW/ZYzghIQwD9yPazsZRrCmhVqRMdOKNqnHZ4RAlorgHstrjb3dbFEXA5ayZ9IiI7haBj4uESD1+Y5JW8DO012xFfb4HhAoXHlgcFdqc/4My12wvync43FyPxW79dvOVL334iKcqOct6EFByp2KTHs0Rmja6/9O95AxltarMhp5J/m2d6jgIcPx1aM3bz41UdftTKaQD+e38j5A5Xqo543OmOAIJ5WAJbZ+zU4hZxjddj2mUwRKm6X8/tz4J/e6bZzw5R485yfweitggeP5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:30:13.2499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef929add-b247-4b84-1dad-08df251ec159
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018070.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8012

From: Suma Hegde <Suma.Hegde@amd.com>

dev_get_drvdata() can return NULL if probe failed before setting the
socket pointer. Check for that before reading sock->proto_ver so the
sysfs visibility callback cannot NULL-dereference.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 088c44ea1782e..0e412c23c69c8 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -306,6 +306,9 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct hsmp_socket *sock = dev_get_drvdata(dev);
 
+	if (!sock)
+		return 0;
+
 	if (!is_client_platform() && sock->proto_ver >= HSMP_PROTO_VER6)
 		return battr->attr.mode;
 
-- 
2.34.1

