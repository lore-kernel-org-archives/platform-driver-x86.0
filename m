Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F037A739
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 11:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709204467; cv=fail; b=KL8+due2pOdpL/63SN5OhL03bMzAKduKOXkRY8cMoY+uwvibvWYkfZpy2GncvCl97X8H9i1fS7VG8D/SMYEOo7xJU13Fe3TzUbKGKp6RievKJX0mJh2abs5x/Mq6tuW5fNiCFVBQhHDoqKOpGNuzHwEKXrQy04hmHozjS8ZFKjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709204467; c=relaxed/simple;
	bh=YAvpAf3PgZeygoEA+3kcbq0lc9XXbVSHNj19rt/2J7E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JXyO3SmBrZGPxmOw5CxRTp6wziFqkTyardZjHOgLsufvx5DdvU9hQBYWebpqam3CvsVh+UI27DJ7sECDcf6IxtamhtbX7wDkunlueVGpZFuIN/B6nnWYcKNvVABaxFSP3GQhXJ5O9xyHoVQGkqt1l1Bjx82FEste/0GRMuNe5F4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hQBxCebR; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hQBxCebR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jweRIvM+2kGskyqciV4MbjVIuO8VhBIPxwQlujzaFsZ3T7yE8ioXXA2lYRiArs2riAv/n5BLr31XuJuzlEy5hgQmbXjLFgUCJzjLWlOsfYRR85jOmGojYjyDua9lzQyE48H1cExc28WgIhO8DP8nVhA6eIbu+GlHrCEpVDCuivLXbjtusikv3Pt7KyGvY0i9R4n1jl6j1a4bZ0Mo5z7346bge3xKIncbxq7Bh3RUtp3hq8j/4EqY2P8RSzHTY2ZFD8iBWYBoh9uazdPELUF4zLEtSdH30PBsw4WxXERzDxPDfsbs9LeRmJvnz8rCQRJ2FA0JPf62x390uMdhWNyfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRSTM20KvwGTgcIJFEbkdCnZ2KugcCRdeJRf4xQ8q0E=;
 b=SAyAbWZEDJyIjyPDt8qBPpi9FoiAMKKi/lcnkU5tnOLkUPDO//Jvy382q6R/Ty/d9fJ5WYBBggpyTv0wKbxsXy7vnxlNz/3pHZu8i7Uaqmxz9TWkrbEBQl2WVwSAvPlBwXk+nvSZu+d2dnCOiDMmX57onDH7oYxMUzbsLFctTOnB4EjdHbdPOt1ruIr0gTVw8G2UqdIxWg3yHRXTUgeTTmn/cSWtr4zMIqne7y9OTIcNVw5Xtc5EoH4r8/urEmmDeKgUmf66E0rUDR/ZHESaaHy5/HXNpWtyU41nKgJQ/E3jSwul1adNQBztjBZcxq5dEJnZKikavPPjvNc1mKdO7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRSTM20KvwGTgcIJFEbkdCnZ2KugcCRdeJRf4xQ8q0E=;
 b=hQBxCebRqf+rMyZHcET4lsSmpDzoKqFhO41rw8LSYYb4zmc7YgTFxdOBrI2zp3sLLrryVFMNjO0SBcEGKga9+FKPLn+ddKUdBXPFc+Y3XoUYGbuLKJ8oHzKw5hCRytAzJ3xI/myTQIN0AFMxB0bHG/9dr/tXMz8pahSMru1qRhQ=
Received: from CYXPR02CA0012.namprd02.prod.outlook.com (2603:10b6:930:cf::27)
 by MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 11:01:02 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:930:cf:cafe::9d) by CYXPR02CA0012.outlook.office365.com
 (2603:10b6:930:cf::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.31 via Frontend
 Transport; Thu, 29 Feb 2024 11:01:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.76) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 11:00:59 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 04:59:52 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH RESEND v2 0/7] platform/x86/amd/pmf: Updates to amd-pmf
Date: Thu, 29 Feb 2024 16:28:54 +0530
Message-ID: <20240229105901.455467-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|MN2PR12MB4094:EE_
X-MS-Office365-Filtering-Correlation-Id: eb13728b-f205-4985-7bdb-08dc3915b7c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ikfTwFs1Y2crWvGJbux2SJM/hRkcSH6atp7CFOELowrSRHCi+m4dUY0DBF3p6iYZN4FqzG9R/LCtZOqPTHZLIjfEr4XdOpcGvFCmXiFwkdsVc9+A2AaiCAf/+zAaBMYZ0JS/gVn4PS3CDBkJt91+i0OPsUeeXHLVFV++qYYYbNzRSC5ZUVPQcliqCJUkvN5S7Cmt6ErdOdDlU6Rex3tX6Jtu9qnX2mrEEbn6ElcQcq6NVZDWrAbX64Ij/xKugOWJuBq30C+134vpWMJP7Qkxpax5wiRq5yzZnB8SzzezJZvRIm4+8+62TW0PV20rxKyxN/HqLPlUBWtfJecUakRmJKvMTJL4ysLx3FSXT/9zcqGreCxVy8djuMwBby/Sm8ITl1gY+qWZP53pzM84Js2vnjxEIQeXBrsO1e83Z0PSKknoYAxqdZl/BlRqzQAk/JCVjKZE18yY0LAgH9QK5ZI4ybOgIbLDL+XnXzj/4bDmnOfhCcIUDz4PdTRpkU/u2Nb5KFB6MpNkL8Ox5bs272cIDsHKGhrH0ZjbJiDkt9lTS6dgqEW0OAGEHBEYk2/TD/UDyiD7bvMdUifLrfgrQFiBY8c6bvQGg86OuTJSMPwBaeeq8YBep848hNZyWe9+ZNPP84eZ3F8dm1Opk4VrE7/aBlz6Iu0+6Oj+GNZHY7jFhSAgGTzilr36JDp2MxGoXiIhXeZtSbqViNgpSFZkDg7np9tV182LKxM9IT6k2ITlqCXTQ5FRmC2J0R+JjHsEtdWc
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 11:00:59.9724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb13728b-f205-4985-7bdb-08dc3915b7c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094

This patch series includes:
-Add support to get sbios requests and static slider as per new APMF
specification
-Add support for the APTS (AMD Performance & Thermal State) method
-Disable debugfs support for 1AH family series
-Add support for heartbeat notify event to OEM BIOS

v2 Resend:
---------
- Address build error in v2 when CONFIG_AMD_PMF_DEBUG enabled

v1->v2:
------
- Update commit-msgs
- Use 2x4 array to store power modes information
- Improvise debug prints
- Fix alignments problems
- other cosmetic remarks

Shyam Sundar S K (7):
  platform/x86/amd/pmf: Differentiate PMF ACPI versions
  platform/x86/amd/pmf: Disable debugfs support for querying power
    thermals
  platform/x86/amd/pmf: Add support to get sbios requests in PMF driver
  platform/x86/amd/pmf: Add support to notify sbios heart beat event
  platform/x86/amd/pmf: Add support to get APTS index numbers for static
    slider
  platform/x86/amd/pmf: Add support to get sps default APTS index values
  platform/x86/amd/pmf: Update sps power thermals according to the
    platform-profiles

 drivers/platform/x86/amd/pmf/acpi.c | 136 +++++++++++++++++++++++++-
 drivers/platform/x86/amd/pmf/core.c |  15 ++-
 drivers/platform/x86/amd/pmf/pmf.h  |  85 ++++++++++++++++
 drivers/platform/x86/amd/pmf/sps.c  | 145 +++++++++++++++++++++++++++-
 4 files changed, 374 insertions(+), 7 deletions(-)

-- 
2.25.1

