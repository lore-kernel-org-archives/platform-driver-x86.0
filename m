Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2073.outbound.protection.outlook.com [40.107.102.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327AD44C8D
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 07:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709191957; cv=fail; b=atBu8YRor8L3StrlVNx+eoP3kxkgYRQBQ34OZdY91dMEty8tvxxnypjBHoWQgGvM2MXW/qO9pVn3MBCR0Z+G75Lp5FCDW112UO/chKlh9pcN70xIJYXKSxHCYKUNr9i1IngUXG/t07VQFlPqztrsnGPICjiDAWo4dyPdtWuBi1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709191957; c=relaxed/simple;
	bh=vLOwQaqMzGk5VRG9lc2vZ6JCMIkNOzEypWMug3F2/k0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U/XNOCxJQ3Ypc8wkQEwClvSd7l/fy/ScOi+BCkIosi7xfQd8DZIyfDR+WHajvdSY9J56nksjs+JVPPDA8qahYKP3tN35VQ5uqQpWObBM8aiiSc36W46vJtT3xR0MV0Tk8lgQ2YgwJ0HQE4jWJAbWPiMxiBiSvvxn2ETOkDp+qig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MC0OKlmL; arc=fail smtp.client-ip=40.107.102.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MC0OKlmL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZtK4Z2U6xVVch7bfirEU+waKYoK+MXFy6D10rfNNafxFUdLVe/OJXuU4Yy5yrZPf/6rpVkayH5+tJ6mCnOnx3bvuUBv+fqu5bnOQpnxTaJJZ7acDW1NjcgkJyMWu79LPhGLXhdQaaclsz22h+2N59KuU64hd6sRDpYVCv5yeKZNYRaGTT45dXC50UFdYb3JVO3HNW3CdqUYs7ITSJeD36X0ssafA603gX9ynODb679WAICAc21aaOhteJoJWhPhwBmfNanpYkbyKfGsAaur2i5shpRjdnOtvrp6tuPoWmbDnlF0mEqEaWWoR/4Saon1vZhCnY0DqnY1jTaw1mAhtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obSqyj1RYPWBEOWd6PdsMHmYOzbZ9xU3OdmON6JAgsg=;
 b=EoN0Exf31AtMvBA78jJn+t0bskQTJMgbBcpYzOhy7VIE+mdBt8SrHi+xgzGj3K3O+ygPb5ulCYCbuZWGZgdcD3pBnXSxfgWg8e6FqLZBNBo5rk10mQo//17xC1UrfDzfxKHjRoWOxoXIkjaEQzT8gy4a0MAcCc/1RlWhi1YnCYZjUOyu7dWQyXHV4nAU3+r2TXlJHnonNUH5xxZO4opPuHIHTKz4D/EaByd08WPKFPoieUM1Kx2pjSwPfCLxue/kp7PSijdZrhPo//eLqIN/GGer8YYh+DqixXcy8ydR4Tin5m6c/4YzFsD/cr/Xps4ML2AJUDTDtWSqVx0/g5KDNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obSqyj1RYPWBEOWd6PdsMHmYOzbZ9xU3OdmON6JAgsg=;
 b=MC0OKlmLi9q0UcqoOMsJIX1vZdRwmgUj8vh+xrPG43535IREvDdgheqs+TO7o4P4b4OkeU4f6/sNOsfI5hok6PdjTyWzVnUpNIY5rICtVotL2QeAqdMQgVsRRvtjzJ0xDEKqtuaLYbFYeIczRL/APv8TrSGvnTzK7iUEZcQrScc=
Received: from MN2PR14CA0022.namprd14.prod.outlook.com (2603:10b6:208:23e::27)
 by SN7PR12MB6743.namprd12.prod.outlook.com (2603:10b6:806:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 07:32:33 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::cf) by MN2PR14CA0022.outlook.office365.com
 (2603:10b6:208:23e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.30 via Frontend
 Transport; Thu, 29 Feb 2024 07:32:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 07:32:32 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 01:32:29 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v2 1/7] platform/x86/amd/pmf: Differentiate PMF ACPI versions
Date: Thu, 29 Feb 2024 13:02:01 +0530
Message-ID: <20240229073207.4092698-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229073207.4092698-1-Shyam-sundar.S-k@amd.com>
References: <20240229073207.4092698-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|SN7PR12MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: 78959bbc-a08f-4e25-b3f7-08dc38f897c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+0RRATJJtSkN5D09Hs5+YGR5oVRjFnKnRxm/MZGhIo2SP10ZuBAv3L66FoJ6ZHA8oref92fhdgYA75OFJfIaNTfiOdY1lsE/Pvk3ju0pbjQoZeYx04ZYsNzDcVJgzq08rRwtMKMPK+1Vf7c6sJq45Ma8OzUzjjqJKvjNt0WTzR/oNXly0h/cUfFQxC2nlSK5S2vuDOxDvqwJyUUmP9rB6i5/TKM0vTsUBmpwNgU78iEHh7s3GFcltxjh9ekjqikgxertEK97HN28tB0JCcjDB+E3+G32Uwdzwe+4dnqEdBghroG68w6clfa0L2NawzAXb2OG+G+m6CoHK2/CktevQc7UlygcXnMWqmHcRRpueIT/8ruJAZCY3yE4+z+kvqFeYALZUg2QCK0xW8pxk1/ILfk7ranRnvbAiFGeqzZS94stJ4fZ9qw56UXTjpkAlF9P2zNmUmQ6AYc63xPluYS6huxtZzbMc/JOl5yG5uauIVk4RzpWDb2rp7oZas0K/kERkfwNS8F/Aw7Rbm5dXAxgCiTaIIhMlm/HBe6+IB38kWLPESxSUv75teqkHk049N7InagshEVmPfWqrVV5RCkZYLq4Z5Cg2j1ybfbak3U3KdTySYUZg7vDNot9Pl0em9zSBMgIPGq6Hyfm7c8ybBHziHdHqliizgwufnsejaciuMjLRpnrnudzd9IaVbi+Fp3zIQ3ElcTQXQDyG7w/dEoSyjvMiCq5ESNvCMRFrURNKDwFKKymQYwRWCUAT/TqBg4M
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 07:32:32.7788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78959bbc-a08f-4e25-b3f7-08dc38f897c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6743

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

