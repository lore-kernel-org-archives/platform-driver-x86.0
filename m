Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7E3A38
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Apr 2024 02:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713236020; cv=fail; b=CicnDY8dndx0hJestuCpY8vcHsUj0V70idbQXhtH/IjIu3x/1ehQI1aQmNFiqeX7HfSBDPlOcrHCAxnORQsLxLwVEMrZK073DdLcGuDi8OolvgA/zG27Cd9YBgao7B1912Q4hRyLvGN39Qc3A6WGh+F50n9qajelmetB7gA7m30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713236020; c=relaxed/simple;
	bh=Ior/3qt8C23NktwZnbnee/2Bgza7liZe2ZJXjPNiHpw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I+5NefIe9NBFmlhBP4DihVihsUdgLX6XTBu8eoM5U41i8lrOtiBtLyhPalh9gxJNDoN+xBfP9FUNPSF0oFHbmGZSpn/1bibRpDcBlG6Bm4m6CPpVEwHaXl3hz03GiTWSgGgjP2JU0YnYKOYOjOLjcfE3X9B/0c3Wkkr9Xh+UyMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Iz2rh96L; arc=fail smtp.client-ip=40.107.220.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Iz2rh96L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGAuE0G8Vl4tR/ilrXW6+zHgEqMNfVVPKSpXNAYbMuUROj03pK1W3PxX2gHzPx6Hckc5UycXDszC47veu8nDZdWz5a4y1TqJbZnk+kKmoJdSbjxdRTYllETTSj7gVsFxLdgHlVpv6HsXeXmoot+9mU9PW47YSOFJtUdh/11msxDoxNTTlhx0C0/+zlU5d4SsKzKKKbPYUF/YhW60nTyWen5momm7jSjzlIQyGkQNpaY/Lzq6eVBTWv+PrnomWMkVnAHdFNnb4COLVgnxNi+oW4lfJLWXFDeo1+xG98/osmp/iYIWBZueN5pQP7B/j1UkkfsXBIKE+zfrWsl2far6TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydgBaSpzlk5ncKF5OTHRNwBlXP9uI7UxdfFUNpHBmec=;
 b=AIDzNPdPHyUwM3P/d8Ok98oBLQoISdxYZINGBLDr4IzPABIxyPx8gKsBg/4pIFWrRc705jV97U++/LklnqYCYSIVXyHPY6bOsleZ7z9Qve3pB1GcgTTLhsU9JfFUq/6SAp9xKVIAVRjuaTgm7VCZkZ+SGxTVXGanQmZ8nOmf3iaOrHK6/lbd509KsXV82jzDHKRXZ4YQLOd0igCVDn8rq78IClReQ8gvVN07wpmgyl/ST0uNB9jyr4gmoNKNKpJ03f4NDN92IUBng4fcDYkzuNnBOFxcyWAytrgr9fw0v4W1J95GwsZxKUHoAv0p3zGZ/vNbbsdIEF61O+GMz1llng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydgBaSpzlk5ncKF5OTHRNwBlXP9uI7UxdfFUNpHBmec=;
 b=Iz2rh96LNRpDLxROQgCUgDJGIaysLXn92XKkGOBS49RXliznPQzVVJ8znbLYOnlpKw7Pguw7D+yu8WFxnfW1lGfNdeRaPFXsCFq8tdFD4iWeEwa0X+Qj8UGwW2x3dnceb6mEGBOhcIXUwAk0mBoBBOIQ73pQJ384h/0t74dp8x0=
Received: from SA9P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::18)
 by DS0PR12MB7605.namprd12.prod.outlook.com (2603:10b6:8:13d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Tue, 16 Apr
 2024 02:53:31 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:25:cafe::32) by SA9P221CA0013.outlook.office365.com
 (2603:10b6:806:25::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 02:53:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 02:53:30 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 15 Apr
 2024 21:53:26 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <andriy.shevchenko@linux.intel.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <Shyam-sundar.S-k@amd.com>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, kernel test robot
	<lkp@intel.com>
Subject: [PATCH -next] platform/x86/amd/pmc: Fix implicit declaration error on i386
Date: Tue, 16 Apr 2024 08:23:12 +0530
Message-ID: <20240416025312.731809-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|DS0PR12MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: 01890cd2-e322-46fc-5fbc-08dc5dc06614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/cO3s3sNFyi+EECPsgqjuWx0gpsuajdVp1/lftIkiHMlFVgIZIPhY9f5/8JGojKtXz4a5OnixfPtSZhC9viRcwcKIsOBxzr+bHGuUf9xJQjgN+uwTe1VUoldWZZhMykyAFw5NSJslA8ipxt7iNBGz47bA+2kEf67oh2X3+O/zBkJTJF5QRtL6iT4kLeSPfOL+JRYzur4PrUyE0VhnOTut91Fur/3LsU+9k4SvlLvv5N5Xg6M44jJRzo2FgSLwLtRyXT15c9G0/ZHKctz6cEku/XBRP48Wt+6I/aUn9eHxQMCdotMWD2u9W0R/lnKvnAYdAOYyooAV5kOIj28x9/4HTcMgkr8vCUldT+l5PmT3//5EWXC7XuxxTI8SX0zVFOgam9HgXY5kSgxfasGgw5Y6fLnIXJJH19m5yTeZ4mTgmCyluGmGAphTc35pk+R+f/agugFc7qT2S19NPYIeXZLj2mwJFcIF1k82uQwEyvrvR3F0Uc2qGjXFTuwKsP21x6fyvgdjuyL1MjkOH9PGHS5A2TzuuRlRBj9cBrUUqX5CVIri6YKaDBhZXZBvG+DVoopvk9Yo8izmIldaFQiDvTCEN+bYs9MqEud0ABbIxYSQYhlU6+vFrocFOR+LqC1r9i0csV7HEsDUBBlf46weRz4IUpJfGqkzRQFQjqMs7oKG2rdVc0mQmjfsTB8iL8Z3uA1WlROEIbxeKUmTFfBap5Z53RdXZ7zaX+bVHT45iB7uy5Wp3hQWiba6ZEKx4EVGbFp
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 02:53:30.6701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01890cd2-e322-46fc-5fbc-08dc5dc06614
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7605

Add depended header file to fix error on i386 due to implicit declaration
of function ‘writeq’.

Fixes: 2dc77993cb5e ("platform/x86/amd/pmc: Add AMD MP2 STB functionality")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404160320.QAHyZ0c3-lkp@intel.com/
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/platform/x86/amd/pmc/mp2_stb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmc/mp2_stb.c b/drivers/platform/x86/amd/pmc/mp2_stb.c
index dfa55327e5f1..9775ddc1b27a 100644
--- a/drivers/platform/x86/amd/pmc/mp2_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp2_stb.c
@@ -11,6 +11,7 @@
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/iopoll.h>
 #include <linux/pci.h>
 #include <linux/sizes.h>
-- 
2.25.1

