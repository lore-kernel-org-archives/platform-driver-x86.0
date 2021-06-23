Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDEEC48BC2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 20:02:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F0CB6112D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 20:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhFWUFF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Jun 2021 16:05:05 -0400
Received: from mail-mw2nam12on2076.outbound.protection.outlook.com ([40.107.244.76]:5852
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230103AbhFWUFD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Jun 2021 16:05:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EymB+iau1wBvS4AbmdvyaE7UKalTTG609q2caqdyf4yQjQD4jps6WmmQJxi6PYyvm8BAwTbKKNNa2Rw4YohHdboxum3oWzqTV8+Lxl3Sfq/GkrERcN7/Hc5XVKvUJR3lkwiO/u48R4xPGhM7QPjgNO+aaqx9iNElxwluv0NzpvIpGSJMnQzuwnpVqD7//EQLvtD+HWdnB2mtVtuks9kdpPMHhj4SaTxBZ2AMlB/BgqD7okH/Rksl07L8zDRnwxrylGJGsiR20zaDfl6v/ismPwAXd153rrX7/nQmsTZMVjGDSiLMD36aEtBAqEpkVBrlDk2lRYkGh5NiUp/xzU+g/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyhSBWDVOeaYaP4ou8DiTqm2YP3x3H5phfNBTXVmc8I=;
 b=nAAks3FD9Erm6WMKIGlxBlea/Afg5AFbmfNv1+N3c5XvHspDJZTOPsvCtrA3zg+Q8VPVuvyu3RW51aDMx8JLJ6+T2slIi+Z2Ndpfoornoxts6OFXig9Rwa75CzKG9E8FT3rQAdPEgANDWVOano7AA6DZQE4/rx6VqKT9wyjSnZKJytEM8koVEMK4QXbz3YtvZPebvgpp49QedT4xAzGwhPqDxMl+g1sPhb5/x/YXU1Rpwtd45ow1ZdIH6UQ7ZSDUqa+giAh8ing/qJIrEQPu9N+e3Of/BuFVasrDcrNtIRLFUGLMppDssDJagR2WjsBOqxa0gANdSyqU9XDvAQdWTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyhSBWDVOeaYaP4ou8DiTqm2YP3x3H5phfNBTXVmc8I=;
 b=kQX8rTRKJGQA/4Ec4V15TUWGMXXZgE67P7OjvYW++F57ezi02S19LG5qMX7MvBGuUwzo6AtMBYaLVCyU3Tn0ClIzQi7FaPOCgkfTmT75RDO7gL1zJEd36MdvZkOffLabONnxN9MeVZSNB/6z4MVTvkUIc+HMPD9IyLI6cozvfJ8=
Received: from DM6PR10CA0015.namprd10.prod.outlook.com (2603:10b6:5:60::28) by
 BN6PR12MB1731.namprd12.prod.outlook.com (2603:10b6:404:106::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 23 Jun
 2021 20:02:42 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::5d) by DM6PR10CA0015.outlook.office365.com
 (2603:10b6:5:60::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Wed, 23 Jun 2021 20:02:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 20:02:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 23 Jun
 2021 15:02:33 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 7/7] platform/x86: amd-pmc: Add new acpi id for future PMC controllers
Date:   Thu, 24 Jun 2021 01:31:49 +0530
Message-ID: <20210623200149.2518885-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
References: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8abc2287-4711-4f5d-4728-08d93681dc52
X-MS-TrafficTypeDiagnostic: BN6PR12MB1731:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1731C7C2C52870E457AC2FC49A089@BN6PR12MB1731.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XlDZcq6Zvp5e+zgf34WtOv8I/nQVKxTRby0NqaxfwnOTI5Ywp9LhPJU/J6FIA9e8UK16JRpNNt6vZR/7wP8cIrqMFDlPgYP0nhpdT4zZoCbOg/PxPyeP1XrQ8FixzgfIJ7RI+8Uz93Bd77WL6+BBI+0Bbv7LhEeiD+mtE9FIx08J7yC0H1Z3mmPq3T0FgskRgJ47gWQ1R8wzJTi/yKG+01eBIlhb5Rljswy2gl3CdjHxIYoPwddOsZcGanZtGfZRYlenx0oXCc92kliDrms+gAy54/50O5xZxEEskS2Mg6tj1IDctyNp9anK0GKZVs5dFbwKqZzsdemamhsAIJQVqbYViWzNLAJVAtjdv0LWoayFX1nQdcMwAGKyNP/sr73K5zjsc9+nydZlzbOCDe5k3cZu1acvJIMeqiAoRy9WWSke4m2HxsL+dCTNPT8x61bTga7nXfNMeSwGxVCkHxX/C3r5zqj3PAQeT8YEueQOcIRh9dJxjTngeEGuT2WI1aTzPej0sv9aq3l+ro7Ky4bff9HJbnkbKO45oigbvxPIikal8TW6+TQJLKI5YyrxT8Fd0IjZ/19DKZJO1JRApSgqwTW0cJ85rC3FQm8J0nMyuetx0EJtIub2asSCBWvru1elAqksl5VfERiNK+bMRc9KU8cVk3Z9tEC7XWa9GnqNHAOI/3d3Oquh+PL8+VIDxEWW4P8926qAKpQnY99ciEszgFXkjo2Lk9HVvmc0g5KI56U=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(1076003)(498600001)(16526019)(26005)(4326008)(186003)(2616005)(81166007)(86362001)(356005)(110136005)(7696005)(54906003)(70586007)(70206006)(426003)(36860700001)(82310400003)(336012)(36756003)(47076005)(8936002)(6666004)(8676002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 20:02:42.3547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abc2287-4711-4f5d-4728-08d93681dc52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1731
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
index e024fd36bd26..c26ac561c0d4 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -68,6 +68,7 @@
 #define AMD_CPU_ID_RN			0x1630
 #define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
 #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
+#define AMD_CPU_ID_YC			0x14B5
 
 #define PMC_MSG_DELAY_MIN_US		100
 #define RESPONSE_REGISTER_LOOP_MAX	200
@@ -309,6 +310,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_PCO:
 		return MSG_OS_HINT_PCO;
 	case AMD_CPU_ID_RN:
+	case AMD_CPU_ID_YC:
 		return MSG_OS_HINT_RN;
 	}
 	return -EINVAL;
@@ -354,6 +356,7 @@ static const struct dev_pm_ops amd_pmc_pm_ops = {
 };
 
 static const struct pci_device_id pmc_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_YC) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CZN) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RN) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
@@ -444,6 +447,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
 static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0005", 0},
 	{"AMDI0006", 0},
+	{"AMDI0007", 0},
 	{"AMD0004", 0},
 	{ }
 };
-- 
2.25.1

