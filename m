Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734565FDB1
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 11:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709725485; cv=fail; b=RdNJ6d8KZItcpnf+NpfEAQDAiD1rdDtmprnEdgzG+VZU9g2vB5fbWwXfEAU25q+HWSXpbHTku1r0loYZJyFTBb6M2K2CcBIavJo9bVuiJMenvygCNmveYeGJoN05npNAhyVssA5i8Ab3J1PZwQrKd8Efn/8NpeDz2QH2kLuMnZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709725485; c=relaxed/simple;
	bh=LsW72JN15++Ld3HfFxMCyAsxL33E/+M/vPtB/ABvvFw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kCu/h4JuqUew5+mVEr56w0lmxv6bgaP3hUwxRYUyUr8WJxNbCNHqluJjGBrW6Sxw6jCmWYi/3wDDyel8/FXbe8TbrPWM33VO8BPGLJ+oNa85CqAwwLlPeQiivQS4MBIdwT+M3V1KXmE4WCiAx7OuOGSZ6x9jNft83876OryeiVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O0phM3Ov; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O0phM3Ov"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLVjog2FUFwtdQmdSj9LO4k/40gXD173Loz0pzRlxwMazg2PV+bZgUme34gAW/0BHzYQ3KYQ2Amja4B1XTizikV1DQoAHz82HiQrLSaBMChrKcD0DGG9oQJiUGU9kWawfMSZ2S5Ktqq8f7cOvTwsM1EJ2UmQHOnXvdvQzu6ePEF8iJ+fao9/6mMGnv9TtQgO5q+/FIlGbil73yC79QcAJCNpcyMjy9dTLuxw9EamS+tBOp4AttmBsPojfqjPX5+Oh/dz5xNDKnPrg3kjmLeszw52q9d94LzqqPwdgls6jm25jJxgfAho2J6fuAR5AmG8jz7NtjWzMIZLW74rf/vlsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3ikSXXyQyGsRGhuDbdBb2kssRlYKBKUm3pPbOaZ/CQ=;
 b=AyEo3Fp9ieGXHyr3P3dDYVaZssv4fjlydae6rR/bcomf9UViMa4EY5O6me6zLpzpCckJyfoscvXwXuga3pm76oWNkwgGKVFGoROUWEO6Q+BfTuKJxUHwt5z0XRWhkrVleQpRnDZH3Ar4CF91q3LXy3JrYFIFjLq6fTzbdm5auNlLoQHAv6sLjoeVhei/4kgm8TdQobhcZOfZmiigEVS3SNWwaxlTihT6lZs4cB2LuMN3YtrtxE00dG/7+zEQssaj+/cFM8hyHdxofpONzEP/Yzxl/QFH8Po7xLA/Ch+4K68m1ocOmFV3h0ZFrtO7Ju7k6zS/FqlqBNDZCwPmhdYRZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3ikSXXyQyGsRGhuDbdBb2kssRlYKBKUm3pPbOaZ/CQ=;
 b=O0phM3Ov3vpt56EW168o4gEdoxVla4DhV5GP7vkMmv4X2Hdipi/08m+uClKMUBVARh1n/9DK5rHkpf4jX+TOLIUdhMf69KPjGmOgOx+BDSkNaWyUs/1uHFkIUIVO8tb2IdL3fMfDnxEJRnlBWLOEEViGw0sxwegbUphBlxsOCFs=
Received: from SJ0PR03CA0078.namprd03.prod.outlook.com (2603:10b6:a03:331::23)
 by DM3PR12MB9413.namprd12.prod.outlook.com (2603:10b6:8:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 11:44:39 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::10) by SJ0PR03CA0078.outlook.office365.com
 (2603:10b6:a03:331::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24 via Frontend
 Transport; Wed, 6 Mar 2024 11:44:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 11:44:39 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 05:44:36 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v3 1/7] platform/x86/amd/pmf: Differentiate PMF ACPI versions
Date: Wed, 6 Mar 2024 17:14:09 +0530
Message-ID: <20240306114415.3267603-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
References: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|DM3PR12MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: f6fb15e0-9c45-4d48-6bef-08dc3dd2ce6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	shr/t0C4U+HmiGMs6TE8tVc10AMcZdmG5Qrvgi6tW7TrDK6Ai22x+gGkQqORyUHNN/7PQJb3a/s0KnT2ygn1e/FV7DW+EnqxSW/ImihmJa0WEkoKk3OWhSVnvJSg5zyy0Ro4ikUXYQfP74lEYmegMgd/xd0FGdf51yCFc5jbJxozgG7YAmzXB0wH7dNst60YBhqShGOWc+zFGsNRW2yUeCuHG1kDLa1SWPpAAO2YXH7Jt5TJ+mw+ndOUv6+WUEvfqvFPJxJazknYIiacMwi9dlCR53EJy18loZJw/bxcqXBq56645FS19pmm1f/HvUXMGyvJ0Qfl6gabOYUEY9zAJIA2JdB8awNcBFZ8RiyGOSf09RXBR0Ybd7K3s27VNGIO329oFMQC3VLoeTgdRXJbL2lYeKBOl2wmTceA4naMyDaRGGqW6g23VtJXV1IfXkqagicMMMIa3EJRjMDgOAWLrOVJyIF7m4uOGEGWqSl8O8RAO5Qc/sZE4HGD1xjSedI78orjo5h58+htMrhrTSmYuam3X5ruYOsR+0xmW/BzO0pW7nZhEoVOFpQtrrH6u6Pjfc+Ry2RMOESqKmQC4uq+C+UwXmBPCJqLdivnrkt+gUUtIsDQUzQ5ZCdRFPIrHsedQcw9HI0BlyWWOCZJECTdBBEhDQ1YhNJSdW8A7XyrKcz7azGTMFZUI+3IWS8rrIYdeVspolrUY38gjiSN1vfJ8CJzp3auiM+knE8wLr2//hqOmE4hoGjHj4gWxu/8CaUs
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 11:44:39.3843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fb15e0-9c45-4d48-6bef-08dc3dd2ce6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9413

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
index 0c90805dc85b..2f23ced7da66 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -235,6 +235,7 @@ struct amd_pmf_dev {
 	u64 policy_addr;
 	void __iomem *policy_base;
 	bool smart_pc_enabled;
+	u16 pmf_if_version;
 };
 
 struct apmf_sps_prop_granular {
-- 
2.25.1

