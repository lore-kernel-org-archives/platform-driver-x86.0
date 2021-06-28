Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B55C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 11:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C152D61879
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 11:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbhF1LIB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 07:08:01 -0400
Received: from mail-bn7nam10on2082.outbound.protection.outlook.com ([40.107.92.82]:41952
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232617AbhF1LIB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 07:08:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksrY38bYsxcNQfKreMBzr9SP7P++fg8zhVZp2/rrHlF3TJmva58rZrxYBHWhQ09GCMuvkfkKkDeLGzfBiSYkc7puWUiS7x0glgadNdffZEY7nHcPCfuFeVIepiDOTXmSbJ9LeVj7wFpjYjUzkP+naTA+AdtkLEMO7SJmVi856G3O3k2WfU3SxH7HfYGoPTwltOTFLiJhrRVtZfSXZEqcD7OFffoshRxS1vtEauNztUgaPKMl7uuU55KvIZ9q+/CneVQORFlvJcMY3w/r3KJdGAuwm7qLaXGvm3jfryqwOH/YFwgjPALfd4Jvb9ESZVM3i5PL++11kPZ3wYsmuYH06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8ORXjSLBERuJaPuYMD8r+Lshd/KEEGv7or9wTTMLsA=;
 b=Vbb9vwox/zpTChjt9WLmIEqencbhq7NjSbimEod6sSsQmRReWDp+dKBefVzJMGddbha7h2dhM4D8SsWmbrj1QxNppVIJVw72bQ6XtQLKNKYbH0N06neib+EvjSTJKhyKkGw0C8eRHh/W92Oce/+Ac0hioxwIaPYKak9pSn7djzMAmlRZwAdSKI+kidLdptvig6VEAfgi0cy5oh35GDkvJwg6UfiIdhLjW115FFZ/PrhZZrylOJS4Lo10N8A/7jbeb33wH9vRZUZqDXLawxmWWLzzVAVCZXEgNf/uq7V7NMdf8T4zYoSDB/z2UmN6g38uTRd7x0pMzWK8HwdEvHbdPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8ORXjSLBERuJaPuYMD8r+Lshd/KEEGv7or9wTTMLsA=;
 b=OzQXmMGG2yhArbzdSON5FKE5oYR814i+t15z145wYn1u4px+bLZpf5zigXaThbvJtSZs6uL2723ld1U4QnkaFBtMry96fSyAI8fg/e40sUUhVduuYVQw52j43lAt0PVXB5MOJiylt8LgqKY82+NzlQu4ePogqBZ5r4TnrqaGbUs=
Received: from MW4PR03CA0319.namprd03.prod.outlook.com (2603:10b6:303:dd::24)
 by BY5PR12MB4918.namprd12.prod.outlook.com (2603:10b6:a03:1df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 11:05:32 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::d4) by MW4PR03CA0319.outlook.office365.com
 (2603:10b6:303:dd::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Mon, 28 Jun 2021 11:05:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 11:05:32 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 28 Jun
 2021 06:05:29 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 6/7] platform/x86: amd-pmc: Add support for ACPI ID AMDI0006
Date:   Mon, 28 Jun 2021 16:34:50 +0530
Message-ID: <20210628110451.4047142-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628110451.4047142-1-Shyam-sundar.S-k@amd.com>
References: <20210628110451.4047142-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69d82aa8-98cb-4e41-8631-08d93a24a5b1
X-MS-TrafficTypeDiagnostic: BY5PR12MB4918:
X-Microsoft-Antispam-PRVS: <BY5PR12MB49182D2D9AF694F3B33CD0379A039@BY5PR12MB4918.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ffsrLOfTpq1q1298aBSCKz3/9VqwNPtB/dTUZGn5eK8Tb2vBgg+qppBBHUgQhZttvh92fG6fht6LiDn1xbO0swBO35LB1Dz3naxzjBoXzW+U+cAKe0tJbjmdh0oNOh8lOV8WPm5CvRa+ZgipMFigsN2VvQSfNLXzHob+Aih/OjYV6UC4Gm9/LNVZvHldJ+l8F7EW2S6wu87cvFu9nwEFm4gOgMNJsXCTanvZBnjiNI7N25U5uebjS7hRYmik+DwsVzc9xX5RZmd/wdhSNJ4deq00cB4IzMlU4ElgJo9QzLuQe+WNDstrSoJQtb9FeMBi9KRnWcI5+dAhMrNUC8cTuRcT4u3AXgDIhW+fLf+VdD6rhh7Ynipzh7HK0CSc/2XyYylZg/Xtj46vS/zQMXHWkOfBOGTOt92NyvguREFZ9U4bKadpvmWcOsrx9yXBCvtb1PJEtrRTAs8bp3c1CV7HijNOjmAr3c3yWRzVhfM7HrECcvD1jNNvnLzIusUDxYV/IE/Q2eZfoLEfNni5AgPvpLfD7n0JGVtFBD1SeLp3RkE7W25Awb5tnQn7BqAA5cVD/sDnXPyq20A7cvl0FGYTjIAhyLcr7beNFGXmb1daWtcZLTG/gVI4RFYrW9j/47svAxYXvoICd+Ik0x0iVprlwfJuWiZSmLm9o2lhOFfZ+hE3ZHTFNH/MW6AkuhxRF3cF5pmx2RXBrLr0JKyNUNqQwYhqgoD0dJkSDY9Rdm81IjI=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(46966006)(4326008)(8936002)(47076005)(356005)(6666004)(186003)(2616005)(16526019)(316002)(54906003)(7696005)(81166007)(8676002)(36860700001)(110136005)(82310400003)(82740400003)(1076003)(86362001)(36756003)(5660300002)(26005)(478600001)(4744005)(70206006)(426003)(70586007)(336012)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:05:32.1095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d82aa8-98cb-4e41-8631-08d93a24a5b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4918
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some newer BIOSes have added another ACPI ID for the uPEP device.
SMU statistics behave identically on this device.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2: no change

 drivers/platform/x86/amd-pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 31f6b847f200..3d815fb539cb 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -460,6 +460,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
 
 static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0005", 0},
+	{"AMDI0006", 0},
 	{"AMD0004", 0},
 	{ }
 };
-- 
2.25.1

