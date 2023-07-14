Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAC9C001DC
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 14:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235833AbjGNOpZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jul 2023 10:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235487AbjGNOpW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 10:45:22 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2465F10FA
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 07:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTUNeLAePL5WLPU78p/rJ4zkb5JwMufqDBAsuFbkpKcFkHQoWqxkyEWURWe9QO5+kvsJfr0ASAGdryN8/GuIeiQZ3qTlIWAo82n1LVB2UohrEKgYvCamoBn+BhCPapYKGNW7golVPLXGfdDb9eFMeFN9obzvaMf2WaVzLdTrRtD6ztb7TBTmroAVY93yJDQA9NOeO6F7zGmL1RFQeN6Z7zBuxqqxwoj0t91l8WGZhBxzGvwspNQEfzJpzydJVPnolNj7FqeGvefZix3k57pu5g9e7D1ldXx8vlggBWbue8Hew6vhOYfweavXXmdA6/DNIvOe0vKjFHYmldQ+8MqUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCBGOZRZkPoNgbi0U2S/vMpROHcM1x6WjKH7p9/Z6N4=;
 b=YbSUdIVNz0uEBMpIse90/HMpxMewTf0S48e4gImCs54v/fP2ndS8JGxCO6r55mGXSImsFJsReced+A77YlOnEn4CCr6kB3eSfoJyT2RUakEOv3iJXLQTnxJgY8O7JSrm0kmcO11+4zRgaFRAGyAEp7xojQ4SrdSvp8gxBxTv2t7TtFB/BbY4v/OoOb+kOxUtnTKOeHcATp0vje7N1HCU4+DRCpZU5+KLqhq/tKVaJq6HovcVTfwh7j9Syl70EDYvV/bAwUuL5AHau114t9VDxZmCvOgCV9DrCpkJ/592RO1TPweJACpu8TgGKWXAAZJ9I5GlfawhN/W2+sY1iW1ajQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCBGOZRZkPoNgbi0U2S/vMpROHcM1x6WjKH7p9/Z6N4=;
 b=s7KSJ/G8zAS4UWi/PpmgODw4lW0lRKSFKCdEvHZmWTpJWYxPSnXimg9WfJxJk3n3S1Ui2uPve/eigAZeDv3R8Y8QZSZ0ZoMAA/4a3IZCqQGrCgsUV9NjNjZ2VSyithV4HmScsUnOmuFQa4kavTU6uWZUK+rk+th/GNUbNwpXQ8k=
Received: from MW4PR04CA0192.namprd04.prod.outlook.com (2603:10b6:303:86::17)
 by BN9PR12MB5258.namprd12.prod.outlook.com (2603:10b6:408:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Fri, 14 Jul
 2023 14:45:09 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::4e) by MW4PR04CA0192.outlook.office365.com
 (2603:10b6:303:86::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27 via Frontend
 Transport; Fri, 14 Jul 2023 14:45:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.27 via Frontend Transport; Fri, 14 Jul 2023 14:45:09 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 14 Jul
 2023 09:45:06 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/2] platform/x86/amd/pmf: reduce verbosity of apmf_get_system_params
Date:   Fri, 14 Jul 2023 20:14:34 +0530
Message-ID: <20230714144435.1239776-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT033:EE_|BN9PR12MB5258:EE_
X-MS-Office365-Filtering-Correlation-Id: 639d1b12-c087-4519-3b33-08db8478ec09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FYwFZ+qLyXurWSbmn0tg62NhRejPIDcgSsty5qZyL8CmdowZbePWZYVdo5MyBZFQXccG8MfNy7jVJWWDO9ZlwNpVxG4Qm8sd8PH5VcBNwBGY2XNDjiH/mmrvbt50mR5vcZVuBvLWb80cNo5XidMIJKnC4Iuha/mGUmmncjSu1WPZeoo++oTtXRsO3UYFtw0UzzllGW6ms2EGEChEE+c73Rdtxsh+/sohA20MzbrvuNAQl3sRB3oap8dV6MOki288bYa1pF938M1GyYsYVCcy5dDWf99qzG3NHnkAhvuxciaa863bmdMDmDLcg3mpZwEv5fQ11YHLBr2QXdDfL1fbyxh9VlBQrhnU2C6j5VuKA8sawTP2mdZ6wwQE/D4k37qakc5AcSynHj0hBjy2sKuK7fRdjkgFUNipcm95CNchdbyFtJM4OXyNM+bsS7nFF6AJX8swL6wp+PNt0ERMQWGekXEN+MBKP3SQ+b7IOlfbwBsF0QRycoJgqOhCs2/smAOCGpQmmtSdvLlP2+8ZV/0sqJM++CxYw69ws5JEUgZKTZD7V+7dBRixnkOXm0Dw5nOuD17Li3iv7cYNGp2yv9IqSHQGUz/MNKTHkm/BsaclTONFoRbLv925Q90EicWkeDMYvLLbkMGBjfMa+IhnDH3gl7wFEODnro6NGgj0OQmJOiXJTN6MN1bF7I7Luq5axrqf2sqyWpWFaCwZnSMh99L7ccwpJgFrKfsZ6csnDLcvILlg/snvVRtLOHANUu3+XmyqWtxB9fS6br0OdIsH1zl5nw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(40470700004)(36840700001)(46966006)(478600001)(336012)(426003)(41300700001)(36860700001)(1076003)(26005)(47076005)(83380400001)(16526019)(186003)(2616005)(81166007)(82740400003)(356005)(54906003)(110136005)(8936002)(7696005)(40460700003)(6666004)(4326008)(316002)(40480700001)(70206006)(70586007)(8676002)(4744005)(86362001)(82310400005)(5660300002)(36756003)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:45:09.2464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 639d1b12-c087-4519-3b33-08db8478ec09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5258
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

apmf_get_system_params() failure is not a critical event, reduce its
verbosity from dev_err to dev_dbg.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v1->v2:
 - Rebase to review-hans branch

 drivers/platform/x86/amd/pmf/acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 081e84e116e7..732b15b392ab 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -289,7 +289,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
 
 	ret = apmf_get_system_params(pmf_dev);
 	if (ret) {
-		dev_err(pmf_dev->dev, "APMF apmf_get_system_params failed :%d\n", ret);
+		dev_dbg(pmf_dev->dev, "APMF apmf_get_system_params failed :%d\n", ret);
 		goto out;
 	}
 
-- 
2.25.1

