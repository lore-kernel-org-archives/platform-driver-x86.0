Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5E013AC5
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 06:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708065725; cv=fail; b=YoVLbT4YS73krwYRV1zvt7VZyjXOJ7zwH4ZDkpkdtjXHTcpwNxIiKPXq5yGJGNbIVf3UCY3xxzK4418cXvThB6sg8+rp+dtnmbUrfE0xwCSn/tyqJAfjz/Z4NN/Ol2fS1LQqsFFemATdsxTYo36Fcb1WoLd+g6xH9usaMrkchsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708065725; c=relaxed/simple;
	bh=d6BG0P710oRpKiXOkrwm4wi+/2bbL2cKQOWftf0XV0c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sBCcYivbQGTzWi+FlrQTADMrBwq1Cp/kwiA1LkKhjby4HOoodaA3gN/SsyvGMVy7OKJ/Yqtw7xVuxI09KJrHnh9K8LSXB6QOQsLXFEMn8iZxxA2ipLY8IPhP4wvdrHMtjj7Yp5g90ZVN6n0NvGpjaZ/IzydJEJRszHDHn79F6wE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Y3othr+u; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Y3othr+u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsR0Gsh9GwKYqDTdHdyMe07yyOb8RnABDvQjNEyfo5I/vyH6sKnmSP85qG3VaH7fCQxsrg9PKKDa/3F+7nuKNywZM0VfcTkVvpZkmDNaeOqY6YwkavpBayKN4zhbfoxwdBhcXT56B35lcw6e6/DY0F+XZ1JEwoUwf2bmOp/wjSTYHZnOrSHrltfd0IEwWarQibz7utm03VObBTrHkFwDFXRqiUE6ZPubZQ5WYZTDdQRDJ9hpGA2GGrqPF+WpBLe0yAEsWP1ll3/t3My4FzU96v4+KrFzAXhzxRQrn08+anadI7nk0nzPeSd/ZWWOQfhuGS01+sSBZWcD6dGXnTW1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oykjvVhJ/8VIeeX1qoPP/dNROUxhtIugcssuqWlWXfQ=;
 b=WgfIcZVaZQK7OtN6Mu1e+dfEIdxAGh4PvRldgrgSpdMQgEhCQkhrfUBotwzYRVC9rrcqzQWdLzntMEckArFrxTUUQwuB5gv66MjavgPcwIaQ3Phj12uz4tCMRDh7opYX+AWEeEt5NsNbCJeCih/SuG+ScKr9K0bG9qL5vCuuVZQyB/TzHi7udh8zSu3DY6DH97D3v9GkOsufjQIM9Sd3sly8CDpVtiJv7Fql5JxJaZL1887LU5IHfYZHPiZEpAjOLL3LXK0OqP+80WsJiwlpRj9zg+sQmcloefHX5nt9MH5FhyhqqRHGlFhX8WdXFO5jnwHAhICBuNmm1zwbGrSC8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oykjvVhJ/8VIeeX1qoPP/dNROUxhtIugcssuqWlWXfQ=;
 b=Y3othr+u5beLU9i8qwuqAgPvE3HhB01zykM11wRRJ1dTzDop8oLiqZaDD1iHSHZCoBg6Z3Aipoh87QCjfvGEzff0DvelGZOSOCOTRyyj4SfhSVdXyGr0RNLZ4ITaDVv+lgNCqh4q1jwPBZjnUC+sdTwmK7ItsmQhgiESzNJl3zc=
Received: from CH0PR03CA0185.namprd03.prod.outlook.com (2603:10b6:610:e4::10)
 by SJ2PR12MB8875.namprd12.prod.outlook.com (2603:10b6:a03:543::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.12; Fri, 16 Feb
 2024 06:42:00 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::a5) by CH0PR03CA0185.outlook.office365.com
 (2603:10b6:610:e4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Fri, 16 Feb 2024 06:42:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 06:42:00 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 00:41:58 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 2/2] platform/x86/amd/pmf: Fix TEE enact command failure after suspend and resume
Date: Fri, 16 Feb 2024 12:11:12 +0530
Message-ID: <20240216064112.962582-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240216064112.962582-1-Shyam-sundar.S-k@amd.com>
References: <20240216064112.962582-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|SJ2PR12MB8875:EE_
X-MS-Office365-Filtering-Correlation-Id: dca19f17-af70-48be-f8d1-08dc2eba60f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i6qWnw2JMeALi/0gVEih3nl+0NXT/IQKxtu2Huz+7/N4H5FGm/jmJHe1IVzlioF+n68DN4jttL+QncLhSSIbKBoFq0tc3N9atO9aP0ish23MX1gFUUVP/ag+VuzcctvFITDtMii/I0XWIihuTuVz7/70l1/CdtpTKjtaKeWOc4f0Lu7Y/+xK53krY2g1XhvYFv243NyY+79BgyLjOBLrj72vmguFijjxrVWhejFovpJX4i1W9CK9K45Zt6sz7mOHFv240bL61wgP6Vv+hPwuKLSE2xE8Ntfr+75j2wDovwAegMVGqJ+hxy8f8qxARXF73WGLzhj7klrlyQwirpvYuVYC4utGhTJJ8Kb+fNhuax5lmm4lEl6nxCW9HBJy7qryhTgbolikIVnq73l2SZuCb8ilMiYfZhNJWCXXI35SB0UFLVrNdcdHrsGdW9umCjdOi+ZNXas48v9sq0WJPjFeKYlhiDGh7ZCPhnuZwjm1v1xfW69oSW7qKWJRcIAOYnX7BuRKuzHgzPD/ZquDvZafRzpebnE37Iu9UJBwWR5x8Yp9dBhfpFb/a3pTHGCYdoX8tNFJfIYT1fFSPpakcH8xp2fPvNwyr0Z8lQBqArX8RzrSCwfGQGMsbugfyeyczDsxgTtSyHFsy3iFRDt83xKdBWy2RiZ7TlaQcH49Pg5gKmg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(451199024)(82310400011)(1800799012)(36860700004)(186009)(64100799003)(46966006)(40470700004)(83380400001)(356005)(70586007)(70206006)(82740400003)(8936002)(8676002)(4326008)(2906002)(81166007)(5660300002)(15650500001)(336012)(478600001)(426003)(7696005)(26005)(41300700001)(16526019)(2616005)(6666004)(54906003)(1076003)(316002)(110136005)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 06:42:00.4735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dca19f17-af70-48be-f8d1-08dc2eba60f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8875

TEE enact command failures are seen after each suspend/resume cycle;
fix this by cancelling the policy builder workqueue before going into
suspend and reschedule the workqueue after resume.

[  629.516792] ccp 0000:c2:00.2: tee: command 0x5 timed out, disabling PSP
[  629.516835] amd-pmf AMDI0102:00: TEE enact cmd failed. err: ffff000e, ret:0
[  630.550464] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_RESPONSE:1
[  630.550511] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_ARGUMENT:7
[  630.550548] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_MESSAGE:16

Fixes: ae82cef7d9c5 ("platform/x86/amd/pmf: Add support for PMF-TA interaction")
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2->v3:
- No change

v1->v2:
- remove enum smart_pc_status and adjust the code handling

 drivers/platform/x86/amd/pmf/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 1d6dbd246d65..853158933510 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -296,6 +296,9 @@ static int amd_pmf_suspend_handler(struct device *dev)
 {
 	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
 
+	if (pdev->smart_pc_enabled)
+		cancel_delayed_work_sync(&pdev->pb_work);
+
 	kfree(pdev->buf);
 
 	return 0;
@@ -312,6 +315,9 @@ static int amd_pmf_resume_handler(struct device *dev)
 			return ret;
 	}
 
+	if (pdev->smart_pc_enabled)
+		schedule_delayed_work(&pdev->pb_work, msecs_to_jiffies(2000));
+
 	return 0;
 }
 
-- 
2.25.1

