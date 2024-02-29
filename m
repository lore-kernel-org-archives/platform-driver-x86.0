Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6437F7A72A
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709204470; cv=fail; b=C1R12Ybj30URqOUcj+ZFBmofWdzIGOEIqUhAzuv99065NL+l3b/dKo3JhFpJQb2UwtxKmavWyv6M755CjlK3WTonvidqCuG3Xgn2Q4dgQdncCGMfuJ3OtBV4ff4RHPWtG8BG+wgm1hJPyYOZh8NdurOaHljeKHrSKmIBbNdNW7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709204470; c=relaxed/simple;
	bh=vLOwQaqMzGk5VRG9lc2vZ6JCMIkNOzEypWMug3F2/k0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cCZQ/ItQJYZoT4LS5CvGV14/2scA8wdacuinYWizykVSuP2KVZY5s+2aYtSwp9fjBQ0xOpLiJwinP+i8gg5L07NOA94bRjD9aIX4FnTousRMdIm6jrrk7A6JWZCTWVeIzh3LGxR7MPPXSJCr37SM6PZwOGVnONXRpx3PSF1vFJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wmBbaCWk; arc=fail smtp.client-ip=40.107.93.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wmBbaCWk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HsT6BqoDSaYUAcmv3uNE3jQPLyIaYqJayHe7ABR5wWCoEXqoPlJzig3Jz+UlaEgw6z3qgB4tDc3kvndGHydrq/vdmLpyRYL2ps4JcUZlOAVoezHoetoPabILe8qpfeCXypJde4YE8twe7e38rqREtgHwX+Tidzj7Rx7jFG8FIoa2dtRSZbQwml/TSxOCB3Wp9TsPlno5HkE6cIrsFY98rtUpVm+PtwAt3OzS7gkXaBG9xUj/T8tiCqxwN0CEnHsigtpTWtmwV1VNlTm2/Limi0JO1axM9V4En16RIa38FDOYnIcGmsPlC4eHkdwITMTc15+MEHLhspAVg+eZ/bryJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obSqyj1RYPWBEOWd6PdsMHmYOzbZ9xU3OdmON6JAgsg=;
 b=TiPO1OQws8tStFJbaZdIbHFOfzehzCOF729T32XdT1e+HZmGU+0hXTE1WgdUWlxqehN7smitHXSCimGLturVvxcOS4bk4MhyL6l2zFuuyovu0BwZpfWBf9oHLwkjgcYTs62XGGVj9aTpm/9qGs9D/nDlqszaUP7R3aDha9oEksBEp5MoZ4U0tZg29CV0tQd/q/Dvv/Bt2EeGCDFknNTj00PjrOwXQ+RMc7k3ZnaoSIkPlBiBRd1W0hhV+MhKvNvCvqL97DpiXC5g8dOYT+fNHVA5J9k6tHB77ChHpAoW4XOsdKrrB5F3D8h1UEmza1WIxSdogoggPy7cvMIYqBArAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obSqyj1RYPWBEOWd6PdsMHmYOzbZ9xU3OdmON6JAgsg=;
 b=wmBbaCWkOKntdVN44GUXsJAt1CIY853xAp8GiERWhBT80uF2kP/G0/jS0MPNgtqXyxtopusN9calV4UkI19SScP62ACfdDLkIl1FqSFzZpbhVvum3VklfE0HBDtV22h6nymyms+cwjRhQFsSBcM6XcQRlhcpANkLRLx/bQla5Q8=
Received: from CYXPR02CA0015.namprd02.prod.outlook.com (2603:10b6:930:cf::16)
 by SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Thu, 29 Feb
 2024 11:01:06 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:930:cf:cafe::8f) by CYXPR02CA0015.outlook.office365.com
 (2603:10b6:930:cf::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.31 via Frontend
 Transport; Thu, 29 Feb 2024 11:01:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.76) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 11:01:03 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 04:59:54 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH RESEND v2 1/7] platform/x86/amd/pmf: Differentiate PMF ACPI versions
Date: Thu, 29 Feb 2024 16:28:55 +0530
Message-ID: <20240229105901.455467-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|SA1PR12MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: 9726a9d6-c76b-4231-b00c-08dc3915ba20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TJ73Sg9yXLffM/Z6dqJ81Y9QjzFjpXJJmnb9+3z8iLDMxW0SuBzE1C2jLGlUjDl/Ggd/fei8DzivAFwU8rBZK4PvLMcHZJGKCxQEE5SQ3EOIwgihwteC63qyEJed2/uhZ4QM/UM7NqBoYSpBYth3weW8kirjdveON9Tuq9+yaCwPVwRIhuJQ/mgIDflzZseCgeUkEsqVOz+QFe8IfaL12nedeeHniTOte7wmha9/LoasYnkbUgR3Q/OVgB9UtZwTBlShusrWFASkw+mA39vMD9yrcZ0T+nOd+S4o2rIoSaLTwlIq08aRDIAwZNKH/OeFFPjqxB2QDtdAo45hS/iQE/4a4yyE0E9osMaWiKEISncLNDgDjpDEPkGXOH1D6Tj2xDz8LgJ1TYB4MTOV+diGwFBogzjaZBJMNqqKixV4Rkytd/jbs30G2AoxE4UT9qdVo99r5WJFZMnhCfx6eReQYSD7OR3AGKEecw7ngFH/YJMbdO/9h+Ivq1eBIVjXisjEHr5D7stDl5vAiDGoVy69pa5tSjHLLjEHpDhgngGTRYwjwxf+hXsGEGDPYydR13SWDvM/Ky8rLcMzjpoQ11HZ15iYLfB4J5M7FCowXp4Jb8rzve9BQes/u2z9DQNVWFElxibB22QI1GU+sfMmKgiki+fiTaBsMMYB8idueNzLtlmDWeaS/NryxFECH0HNrrk6+a/pmbG/5qoonIYsiYRUjtk9sApw+O6t9TVL6VWt0piSDhyciJvhlmUdKXcq3U+7
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 11:01:03.3318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9726a9d6-c76b-4231-b00c-08dc3915ba20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6870

For family 1AH, certain PMF features have been enhanced - leading to a
newer APMF (AMD PMF) spec (BIOS and PMF driver interface) called v2.

This information would be fed into the if_version field of the
verify_interface method of the APMF call from the BIOS.

Use this information to store the version number to differentiate
between v1 or v2 and also store the information into the PMF private
data structure, as this information would be required for further code
branching to support the latest silicon.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 6 ++++--
 drivers/platform/x86/amd/pmf/pmf.h  | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index f2eb07ef855a..1f287a147c57 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -218,8 +218,10 @@ static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
 		return err;
 
 	pdev->supported_func = output.supported_functions;
-	dev_dbg(pdev->dev, "supported functions:0x%x notifications:0x%x\n",
-		output.supported_functions, output.notification_mask);
+	dev_dbg(pdev->dev, "supported functions:0x%x notifications:0x%x version:%u\n",
+		output.supported_functions, output.notification_mask, output.version);
+
+	pdev->pmf_if_version = output.version;
 
 	return 0;
 }
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 66cae1cca73c..e51ac981af73 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -231,6 +231,7 @@ struct amd_pmf_dev {
 	u64 policy_addr;
 	void *policy_base;
 	bool smart_pc_enabled;
+	u16 pmf_if_version;
 };
 
 struct apmf_sps_prop_granular {
-- 
2.25.1

