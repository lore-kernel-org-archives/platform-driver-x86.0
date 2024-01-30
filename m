Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48833524AC
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jan 2024 07:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706600087; cv=fail; b=n8VEIuzE5YW2QQWJWE/O1L9bp6BZTxzo2YGBW8zOfpQcKKyOwZ99hwGkJxL/CBEpYNw4qugnq+HCP7S1XGJFPS3dWygqL843PO756uEPfHaGc/7Vhzvnm4I7yW+fnimXbAOHqSyTzxMHzdO2rITAG4MB82XiAEdVgTTFPdiIWDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706600087; c=relaxed/simple;
	bh=lL6Q7k/OBu6Wse843G2SWRKoe7z33nHyRPC1CWdCK38=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CnEUM3cjwNgLFZN+cQ1GZOYQyc28Gs7hxxGudKCYr8aIiJNYEUV+tQbWpAwhXc3b38Nv21gEZsY2ZrfxwN57lyydvA5+1AR6PInAkBmjPvBf1SPNj5/mjz87a6S4kOsdvPdFWo+Vau5tVJquVJf76nTt9mllhEpFaHW/qcOV+e0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vdeyAjSW; arc=fail smtp.client-ip=40.107.94.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vdeyAjSW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yamv3RhZm206kHCIt2ZUrR/Q31a0EYPQQQ1YlK/pabvL6DU7AQDxZ+UBmSKRFIw4j4be6cSOrcZ/2iCRyBcU5s7w/CPoWfJOEq/Zv9Pw1n1fFbjbebLXpgYUw0GfIOWy2tPmRcP5AWJO2Px51zVLusecatr6xHF3oo6YeCILI3vFlK5ceu/etJBHRgwtKuB0m36ItrFbKIbFSxlu3fXcqhDSb0Vf07NdaYtYCm5qrrrrmNkAw0O5/TBRXs90MkSRn91K+/aYR7w1adJorKFBMKzYKJgw9mLpUm4l+v7OpYQutbgiU7hDjqNPwCruuySRmSTU+BMd03ah7YrVGHqnYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHMsc+f+mGOgKqyGgTbhiDs0m0Rjx1LJiQ+ucknUuRs=;
 b=OS9FSNwvAzsiUTAj/HmcFqpz79NVKmW/bdsvCtqweX5eaPTMYLHmuC52nc03S4ftu3lUKSRx6VXlrUP1/nY8KTssQAxJ3H6dUNUae5y5Oy/kFH+cRe1SRk4uG4BKQ7Bm4ILIrKYN5wHN7iUv8EbG/66xMzvT2RgSiLjenN6LjmdRtrx/W55la+QQJiNcYcjg4h0cKqGJgPmEJk31Y9MjlD3Q/jrv8RSGdbrFUHWJW0IbCXOJoxz5sgiFdpP3H/+zeGuSej+Nz3fX5WyZsEI1RqCK4yKVHP6eMeeOWP/PJxYqMy0TNMqRdcDJ7OgH4MmzQ4Tmj7zTHB5n7grUtXVsJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHMsc+f+mGOgKqyGgTbhiDs0m0Rjx1LJiQ+ucknUuRs=;
 b=vdeyAjSW5+4B/QS5LJ5SLNIjuk9Aw86RfUefBzrjDSOnS+iaf0bYPv2rGjao+YH6LvbGErQXjgqO3vhJAM4yT9nRFxUfbzWareVm9ZtNDm78uBWL9L4j1KspY6dCeBxuRhcPXuv+91MyUQj//ryondJzWE9YiTFQA+7mq49/BGc=
Received: from BL0PR02CA0142.namprd02.prod.outlook.com (2603:10b6:208:35::47)
 by SJ2PR12MB9006.namprd12.prod.outlook.com (2603:10b6:a03:540::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 07:34:43 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:35:cafe::35) by BL0PR02CA0142.outlook.office365.com
 (2603:10b6:208:35::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Tue, 30 Jan 2024 07:34:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 07:34:43 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 01:34:40 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, kernel test robot <lkp@intel.com>, Dan Carpenter
	<dan.carpenter@linaro.org>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH v2] platform/x86/amd/hsmp: Remove NULL dereferencing code
Date: Tue, 30 Jan 2024 07:34:15 +0000
Message-ID: <20240130073415.3391685-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240130073415.3391685-1-suma.hegde@amd.com>
References: <20240130073415.3391685-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|SJ2PR12MB9006:EE_
X-MS-Office365-Filtering-Correlation-Id: a346850b-7a3d-4084-7e1a-08dc2165ed23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PHV5z6FuVnZaQbCCzyF6X8G2iQPOV5Mh5hO30ILiNeaMkKDFjVwHBc4m2UFxNRAA6sDWswIZE/lZ9Pps0dsDHAwdPmM64u7ZMishg0Ga5QVMtMng+5HAqPi21Jptp3XuhZE2ACkDX7GqCrHBPAvevznAFnmc7Zn2MY6g+f6ITwoUhRPiN9UJ+ycFp/F0a5Y2Up4HfELRPNq/sxYSfZVlCSe9DOwyCF/YRstfl2uvlw9bHj2ksF6FT6dFPErezGpLoOMVz/X9wbTVYp5NHf1mHmNt2fOAkvNocgQgBYXPrujH0Htb/BW5jlKfpyuEz6aWDrqexyRegu0qE+x0NEQbweNju0VM6jvyW0dzl36DRqaOjvuxrblYgHSPxERn7WJ0uqTmGFJIImVKeguNrexa/PKCPEhDJFjEoKWGiqP5Acy+29xAbUaVwxCcYAohl73GNzQ+V5R26047k0DMKmvdMjoJ9s7LAWV0Krt48aNrHhLcB23CTiNr2MDgyVrIQgimW+NviFREhjR+MmfDWTrtRXo4oGwJU7PEx0UleOAb6p73mY6Gaqljm3r0AssHdrwoQNh0Va4LUkeNAvpM25FDE1CkoiYYzB4f2O8Py0uqCQ2xw2+XRh7vD9T1Ls6Y+0K452N8IHJ1BmZ7NKFntLN3x2wXaW2tKedLq4TqSOMtGKwWFd3rHQxWbyvNtly/klYBz3wRWvRuSnEtbhBiiWVYC6R+I5a9LaSolOmiSUDGhk584ImarTP4gNOZRo+R94psDgSOSHRq+N8TPBsM1lJTwv0EK4rX4CKzOQZaHyTScow=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(64100799003)(186009)(451199024)(82310400011)(1800799012)(46966006)(36840700001)(40470700004)(41300700001)(82740400003)(81166007)(356005)(40460700003)(40480700001)(316002)(36860700001)(47076005)(86362001)(70206006)(54906003)(70586007)(6916009)(7696005)(8676002)(966005)(8936002)(44832011)(336012)(426003)(5660300002)(2616005)(478600001)(26005)(4326008)(6666004)(1076003)(16526019)(2906002)(83380400001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 07:34:43.3238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a346850b-7a3d-4084-7e1a-08dc2165ed23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9006

Do not log using dev_err() in case of !sock, which causes null pointer
dereferencing.

Also remove unnecessary check "boot_cpu_data.x86_model >= 0x00", which is
always true because its an unsigned type.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401292056.qkUFS09Y-lkp@intel.com/
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202401291311.gzMCj6SP-lkp@intel.com/

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v1:
Correct the email id for Naveen Krishna Chatradhi.

 drivers/platform/x86/amd/hsmp.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 1baddf403920..1927be901108 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -566,17 +566,15 @@ static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 	struct hsmp_message msg = { 0 };
 	int ret;
 
+	if (!sock)
+		return -EINVAL;
+
 	/* Do not support lseek(), reads entire metric table */
 	if (count < bin_attr->size) {
 		dev_err(sock->dev, "Wrong buffer size\n");
 		return -EINVAL;
 	}
 
-	if (!sock) {
-		dev_err(sock->dev, "Failed to read attribute private data\n");
-		return -EINVAL;
-	}
-
 	msg.msg_id	= HSMP_GET_METRIC_TABLE;
 	msg.sock_ind	= sock->sock_ind;
 
@@ -739,8 +737,7 @@ static int hsmp_cache_proto_ver(u16 sock_ind)
 
 static inline bool is_f1a_m0h(void)
 {
-	if (boot_cpu_data.x86 == 0x1A &&
-	    (boot_cpu_data.x86_model >= 0x00 && boot_cpu_data.x86_model <= 0x0F))
+	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
 		return true;
 
 	return false;
-- 
2.25.1

