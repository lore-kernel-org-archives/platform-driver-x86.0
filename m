Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1404514F9DD
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Aug 2024 06:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911666; cv=fail; b=AgFN80vI83iICNrE7HITUJFA5jmiDrZEpBmDP6/y/ze50YpjrQyj2xewBMWKjRmXHS8HxA5EiGcMVZ/b1LQTHM/BZd2AVV63+NRhTqm7rbJksC1ZflwJ8e2jjObsUCYpW7rhqX1bVJBorQO9S55JtmFcO6PF+99MktWw1Ly0E7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911666; c=relaxed/simple;
	bh=139m0G0ZFfra4HaE8OIk5tK4P/w7o039fAXPThnvYdM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SU2gId0ggBGnZV9Qp0+qkE/gHu2wUZ9UHH/MU+uKBeQ11khYrgaa18RdDbsb0szpzk2fxc5N3fT6CIaYqWwYVHv2JWy1jgi/JnZuIwEP2t8tGlQUertaMMBqi45DnvjquLbkH01caCm3CMLqy1IZsHWf3FDT2jq96w7ShfSlr5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QOIa+ydN; arc=fail smtp.client-ip=40.107.93.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QOIa+ydN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlZ7WBJ8sFYpg746lODQsEhDpepXl6rrOdfa+6RLuGZHdgZN5vEHTZ5FcN4WtgKY9x/XkRs6V9x7HrYnEOzwn04CuZI+bSaCU2R2LKwS7jMSHv9Lkq/UnbQ//O1bqrwvL26WuJpLT9GBW4NDlT0Le9u2v3ktJciRNocdzzGUGPbKCtvDHurhoduj8RK7jzmpnR+SCWlNV22dXAhTU4/3gFrTZLp/hpPdxMAxmD369OSWK5TE2ZlGVHj/BC8aeI/DLUlWXvqXcuQhU2jX1FFDhQt+R1gyUCfrM7YRSbm0qgEh9edGQh1ep9yiQFjUnrLxADSPgewnfzb7Z+XNYw4gIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jo7liFoM3tSFZnSO+lS2tFsLtu11KrTVz0Uf79YbE1E=;
 b=Ueug5hpEMNYAjwpqqV+D1f2GbhYqy2MZI0sUf+gdGmljujnokdLzAAGc6BKOGrRrWdh74JcgzfGEKnBNunEOU8FIA76dfiYHYG1LIHJjK6Ghr2QAy7V3Nh3NQb+1HmRONy3Rr36tmpegNlyIMYmJpDBFPWf3KZXLuyzIhwn3AkHBNahvFdbffPeaHv1ciW9KvugnmIb0cG/a0T6Sto76TqY9ESOuJZR7UthgHA1+PYul0WFLVEfJLkSk0iaEulJLLtQC0y9vCE/Ue5ed9LVQ0/BomOj1ykxMi3qylD+OmxHlUjt97sZn3qVIcIXdQkE1ozpkKZ0b/D7kI/TMkVAloQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jo7liFoM3tSFZnSO+lS2tFsLtu11KrTVz0Uf79YbE1E=;
 b=QOIa+ydN6dALizJqXTTFRDkmhBscs+bPfxgkGyh45FShQggOqwTHRKVlFx86oONwl17EGZur5ZomjeQf2pbybJxdAb46OTIvNWIwcqKTPHVIlGdyt6hIpMroH7yXGJvcP7qsszSOGOXvG058YbvoMxmhCcRqP0M+cIbxGlr8JK8=
Received: from SJ0PR03CA0276.namprd03.prod.outlook.com (2603:10b6:a03:39e::11)
 by SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Thu, 29 Aug
 2024 06:07:42 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::47) by SJ0PR03CA0276.outlook.office365.com
 (2603:10b6:a03:39e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27 via Frontend
 Transport; Thu, 29 Aug 2024 06:07:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 06:07:41 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 01:07:38 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v6 09/10] platform/x86/amd/hsmp: Use name space while exporting module symbols
Date: Thu, 29 Aug 2024 06:06:16 +0000
Message-ID: <20240829060617.1548658-19-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829060617.1548658-1-suma.hegde@amd.com>
References: <20240829060617.1548658-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: bbcb8f88-b859-458c-37b3-08dcc7f0e48c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qmEQwhzo7R4+i16TxdNIhg5ZiBk6yDavLE5I0OJWug26J1BzVDe+qmEm9koz?=
 =?us-ascii?Q?UhtrHh4H1BB64P5jBrgtQeKJABjJTn+75MlB9VBpan/ugzePv6sGg3akyJxS?=
 =?us-ascii?Q?TDP7hICnjI4VqVA9F0JHrRwSlnbjOupEDlM86aM/syzGBEJ6UXXDEac3Ssth?=
 =?us-ascii?Q?dDitRpHXmcNYH0c3LgzooZX4KMu8SldZALBXj74EztqxkVu6aAeV+hTimNa7?=
 =?us-ascii?Q?fQu6oT5Ow4PO1+5I0YD3qWo8zObanxOenEhp2fud6Emiju2tph0RzbbSgFyT?=
 =?us-ascii?Q?7KpQKHZaOEQDLfig+nuPLDLMGQMp/zLgxI4Nadv6u/y4dNnVMFK188d8mZcU?=
 =?us-ascii?Q?y4rHGKsveo0DHNkGdhRFOtxOhhyR8ID6f+MUyaegdixUlj1a+P/yumskdaEp?=
 =?us-ascii?Q?rnsRWhWFHdYunO51lGkbiPIFMS50ae/MNQYdouXo+cqBoBm5BJIH3XiyWkVr?=
 =?us-ascii?Q?A22Ydy8o6/kIzZ40K7K8hovJAGTv2PakaLHARJMpIH6tzHAHdRFPj9A75xnG?=
 =?us-ascii?Q?540TEOfVyZYXrf2/RgJTvYpEV6PL252gM7sCIjZotVa0YzSQwViAZcF3pDyG?=
 =?us-ascii?Q?1UaSTRx/K2rFllebvrd62dpvjil+w1axql93fR+edNZy3uEfDM6PKLL3vyfE?=
 =?us-ascii?Q?1DHDLAw6q5g5q27YUehQJ98gQcSW2TQolp/NNh+Vzmz7wO9DLKk7O6n5KCiz?=
 =?us-ascii?Q?IqhiV/F9oft/4AruQoXNMdo36Fpcc90EHaC9u28Kc3t5gEpmt+poMsEG6Zqp?=
 =?us-ascii?Q?40PYbg8qsvs+xzor7ZdFD4W+O0W1GAA29S2alUbY/aPl1GLrfylkfTY7rRO1?=
 =?us-ascii?Q?tyMPNfJ37q8UoObybxCxj6QUkNvWRf7MtFiVvxipZiJ3VapjC3jwtp+cXZKM?=
 =?us-ascii?Q?vUYV3/AootYcrz1vYqt/dB3emgQHaGWQxC3f06vnyurj8ozi3ntF4lJQ49QY?=
 =?us-ascii?Q?Cd6HgFRech+CLLOKEgrhFa72Cw1OirDCG4UGMiyZC//3XfXQ+XOY7yr9iNTp?=
 =?us-ascii?Q?BZ8Ao+qtFRXl9QPrvKZ9cNKT9o5gJpjgMG16R3PyPR1Jd0RKgRf2k3GzQQxq?=
 =?us-ascii?Q?3IpohkfpoVCEItoys6D5LKhpw7veR3Wg+1Ei3IBWCc0QeO5zM7eaFwqGuxRy?=
 =?us-ascii?Q?+Ao+ycBSV5QI5n9TDd597objFrudcyqrwbj9kZNY3vS3Vnw10xa/9iorteRL?=
 =?us-ascii?Q?gquuwTTmQXRJ2bkwQn9qbpcLGvmGzWDFP7Z/EEIRs4F6k/EKK8/NZWZsb32E?=
 =?us-ascii?Q?h1ZXXR2i9pb1tNdp91JGHBU3SjpQ5QrXp6AVC7T5FO075bR6v+ajt4EeaVcw?=
 =?us-ascii?Q?y5yxbt4KdXktyNqNM09KJO+mSEIG98yWbg1jrAyZ8AvV31cBjin7GMnyhZq2?=
 =?us-ascii?Q?C6RtlTbPWlmx+4xijIx4Of6iF+6aGclftnyqMiRWlNKYSRSssUGOxfqoG53t?=
 =?us-ascii?Q?4+i/OyOqF79gjrLrz+ClodhjSlaV3dVp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:07:41.8053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbcb8f88-b859-458c-37b3-08dcc7f0e48c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124

hsmp_send_message() is exported with AMD_HSMP name space.
The other modules who would like to use this symbol,
need to import AMD_HSMP namespace using MODULE_IMPORT_NS()
to get away with warning.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v5:
None

Changes since v4:
None

Changes since v3:
None

Changes since v2:
None

Changes since v1:
None


 drivers/platform/x86/amd/hsmp/hsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 5e0c9c36f435..8c8e361b1feb 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -190,7 +190,7 @@ int hsmp_send_message(struct hsmp_message *msg)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(hsmp_send_message);
+EXPORT_SYMBOL_NS_GPL(hsmp_send_message, AMD_HSMP);
 
 int hsmp_test(u16 sock_ind, u32 value)
 {
-- 
2.25.1

