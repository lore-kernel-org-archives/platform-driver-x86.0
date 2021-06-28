Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C32DC49EA3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 11:05:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5442C61879
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 11:05:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232617AbhF1LIF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 07:08:05 -0400
Received: from mail-bn8nam11on2063.outbound.protection.outlook.com ([40.107.236.63]:11777
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232786AbhF1LIF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 07:08:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASbc3LB7IXS4U0NE1XQuWAdQo37hkGGAZicGbAD4ky0LtI3V0nsyK+ycwdFXv1qCqnIqA9dXNU3+ZILoLJeqiq+fGRaVvAtBbOIFonlCP2+UZfHy7nNU33xtUKxXY4w4PhweekTxbwODW0EWL2kbHRwPo/xLtA9yeS1t5onnIT+b3FIR/xyWwnWzQQyxvtGaucd579XH2vscHhfizC90+dsGXWDv7mjkynVcZE3BesusK1aoxBIlXK8qqUUMkF12Ed0LwiP7dumbCaoi1Cyuoe+lXTXJqId1tG+M2iAUwVrRoNAzOBTKbwTlhX2VBjXZ47yob6W8uo6jkmxgdvdMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4610zsJcT63PDF8hujatb4ZeV3pUYBKI81bzoflumbY=;
 b=nfPK9bJTzAQkKlThkAhl+zildE803q9H7HHK7N0L/TItrlVWQDXX0b6jm9axwnPAH1HCELCrxrzacHgPtLO2YQXfGZNI2nRtKaiWnCBxqhw7rWv0jPpeVmr2TbVH0bU2Rwegfqe9Mj5bICcaHZTv6c0Ywvy6nchbXiiMMGnr/z2GfCON/OvaOK1G7sWvfjOtQZ07Q4qUyPADVmwkReb19PbU77ZHJhzDlIwouQfYcVAIJh33JqRUnT48/kyOfFRkMUljiqbj2CUoEbo1KA1yZjRA3HBFM8vvqDwfU5WtTXQg9DQ7u7PCJ6zafYv7hOPmiIpXkCqdqbqzivvIJ5ZuzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4610zsJcT63PDF8hujatb4ZeV3pUYBKI81bzoflumbY=;
 b=k0+6gmfoq0N4/OT3+G5p5RViqGzSq8Fuqj90atXdTEc/bYjMgN6dzYk0zBRA8i2SsE3+YzqYAjDqh6acxIVvAsUhjR2ayf6KvfjZiEuRbpvS73/RuAagiTdtDL0+8m8XcXuIUqWaGKkdrqw41DqDNHHbfdhvvjVIBL+icpDmtGE=
Received: from MWHPR12CA0070.namprd12.prod.outlook.com (2603:10b6:300:103::32)
 by BY5PR12MB5014.namprd12.prod.outlook.com (2603:10b6:a03:1c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 11:05:36 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:103:cafe::fb) by MWHPR12CA0070.outlook.office365.com
 (2603:10b6:300:103::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Mon, 28 Jun 2021 11:05:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 11:05:36 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 28 Jun
 2021 06:05:33 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 7/7] platform/x86: amd-pmc: Add new acpi id for future PMC controllers
Date:   Mon, 28 Jun 2021 16:34:51 +0530
Message-ID: <20210628110451.4047142-8-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 264e1c85-b3da-4121-3240-08d93a24a837
X-MS-TrafficTypeDiagnostic: BY5PR12MB5014:
X-Microsoft-Antispam-PRVS: <BY5PR12MB5014D599C02EA277C7BB27D49A039@BY5PR12MB5014.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4JVlSxOiFmesu0/dVVpvoOo1A6Ehp2sBr1PRQuOAlfbshQPMjYFN9OH8M6vWe8AYmpL6rYm4OL1mhZN7tjSHxXI/QP9c4385GIFcYgNOwd3YgXcA/5luAzLEF6xETjJnRUwYGyt5c+lQrT4BMNJn3uTKh/ZyeKfk9B2BJ3c9kRo9zYoB402/jan35w2fxhMSh2DE3pi+o4D4SG8tsOESsgwHpn4nDadhE++jE8xNwHS2pTIRu5CDoVKj/rNXBvYS0MxtKrRNGwinz8rdQ8UqUQKuTLmo27x5vCgnbRL42PYimlJq+wlbe1kfByXxb20+pxHpd5IczF24f5A/o5Un/TFDOUYMXDe2bRks1rVto+Zgb8HhgMTfR014AVSKc/UHni/ot6Kz9IkChxajiEm38gsSZzmxBoFqdeBYCJWfPm26Yf5sUOFt42O9A5n7bzbkkNlWWlkZ5U61Lfi0AbplSOKFmcMQ3Ny74KJOHf1VCzwae89GYy0IARgJL6/sVi+yN5b4ZtbrP1j5BvtDXi7s5ngPgFWIovEI4LFXVijmlZCe2z+LyXclMEdYFWK9VAKkJOyS6KOCoPrU5Fnx+4YsXsa+JxqlNmXa4AgiRfJsp7QdvL7rGA13itPz2fLg+LB4U6QFtQptXrIemRDqw0vZh5tp1Oy1wVJzH6SM9p3aPZUhj7SteDmSUDkQPzOZ9YQ9Orld9+WFKaZESo5BLNpqqvRylcRMtTneS8JXrQ/JpZk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(36840700001)(46966006)(426003)(336012)(2906002)(70206006)(81166007)(5660300002)(356005)(6666004)(316002)(70586007)(7696005)(54906003)(478600001)(110136005)(36756003)(8936002)(186003)(16526019)(4326008)(86362001)(82740400003)(8676002)(26005)(2616005)(36860700001)(47076005)(1076003)(82310400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:05:36.3450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 264e1c85-b3da-4121-3240-08d93a24a837
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5014
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The upcoming PMC controller would have a newer acpi id, add that to
the supported acpid device list.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2: no change

 drivers/platform/x86/amd-pmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 3d815fb539cb..bbe77f9f90b2 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -68,6 +68,7 @@
 #define AMD_CPU_ID_RN			0x1630
 #define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
 #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
+#define AMD_CPU_ID_YC			0x14B5
 
 #define PMC_MSG_DELAY_MIN_US		100
 #define RESPONSE_REGISTER_LOOP_MAX	200
@@ -322,6 +323,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_PCO:
 		return MSG_OS_HINT_PCO;
 	case AMD_CPU_ID_RN:
+	case AMD_CPU_ID_YC:
 		return MSG_OS_HINT_RN;
 	}
 	return -EINVAL;
@@ -367,6 +369,7 @@ static const struct dev_pm_ops amd_pmc_pm_ops = {
 };
 
 static const struct pci_device_id pmc_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_YC) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CZN) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RN) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
@@ -461,6 +464,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
 static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0005", 0},
 	{"AMDI0006", 0},
+	{"AMDI0007", 0},
 	{"AMD0004", 0},
 	{ }
 };
-- 
2.25.1

