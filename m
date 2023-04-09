Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C32C77B6E
	for <platform-driver-x86@archiver.kernel.org>; Sun,  9 Apr 2023 18:54:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjDISyt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 9 Apr 2023 14:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjDISys (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Apr 2023 14:54:48 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200122D4A
        for <platform-driver-x86@vger.kernel.org>; Sun,  9 Apr 2023 11:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDma9iRctY5lAcPzzrrlm9Bgi7ajXvbZQZrmxre6Iva4UtCv+TUAY3FkGs7W99H4JfZIFZFugMmGEfdzP9Metf31Q7wCx1TNkEIVde97MxRQ9JoAzz6+klLEU0Q+/qC161edwFvA3NnUljFuX6ueuzret5EJBlERfjcgDxQW3/UA8RTOAg0kdxwqQp+j02KW5l2dM+qkSCZeIoZxL0/+hZ/K436+4W31li5VWOmlYKjI0iyjfmTTgKlPy83PufnD+4WRVqzSFU6dU/b7So2wnbYgHYXFGqkOjzgbUtIW/KPpBv7RBxR+IRtQQggFMJ5ns0/ACsmG+liQ7+qrlmz4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ragS3yuTOC2DbNJh9sCiJhIazDLf41b1wdQ9YOwVkc=;
 b=a7zBpy3R334HZdgfh/083/V+GwXOrZ0Zo5nm7SHRdU+nqBxxOwhUviV3KasQL2fs34oQk+ODWKt8EAZ9lARtkBBXjiHCdt2ju6q5p48v8RXZAtgAA3Io9SiYfZn+z6FNDk68o7P7bpLP9IHdT+eAmc73HvdP1vHXL+Z7v9ATLOwcouxpj0/bFe4dGUzbMO0+hAj7IailsCIy8g6yIYpU9jZ6+sRPmVUbOucgN7kTcvnmrqmB3z2tEVcIXXKaOPwbyMJmuwWPS5Wj1zrJAvLFdVpAygX7nfSd9+4TLHdtMSqA6gjM/CqguAvwCLMcaBT6FrbeGQHLmJUA1fQSaqs1aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ragS3yuTOC2DbNJh9sCiJhIazDLf41b1wdQ9YOwVkc=;
 b=aqNM93A7DY/3LsP45RmDgrQFQTL+PnbbL8xPrlTrUlBL1HDLyM101DArBawHBoZ5vCt9Xb7tGm7JGwvxwfw5j36gZD0uyxn3KKb4K6COVRq12s8D9rUi44PKJe+mNmjtBQ5x/7VQglDDxO8BWQ4s4r2Gh4+8c0a+a23o7IL/qAY=
Received: from MN2PR16CA0018.namprd16.prod.outlook.com (2603:10b6:208:134::31)
 by IA0PR12MB8205.namprd12.prod.outlook.com (2603:10b6:208:400::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Sun, 9 Apr
 2023 18:54:44 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:208:134:cafe::4d) by MN2PR16CA0018.outlook.office365.com
 (2603:10b6:208:134::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35 via Frontend
 Transport; Sun, 9 Apr 2023 18:54:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.30 via Frontend Transport; Sun, 9 Apr 2023 18:54:44 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 9 Apr
 2023 13:54:42 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Mario Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH 2/8] platform/x86/amd: pmc: Hide SMU version and program attributes for Picasso
Date:   Mon, 10 Apr 2023 00:23:42 +0530
Message-ID: <20230409185348.556161-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
References: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|IA0PR12MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: c90ebf08-71e5-4017-5320-08db392be253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YcCqvjyNymCWwyjLE5GuPC3pKNzGNoCFiT0gGESMvUjGjk3QytKGGVJKWmPc3SB2sFtc7XEU8ygtynNwxfBk7kGu80LpqQ4/cI2vKkV9/C4K41paW/J8JR+mLkU6/y9Hf4ZLtqq1vmUfdBzGkI1EZh2MycqHhVpKNdrSvmzv/7Y2OtVhNBlveur7Niiiz0GxbgEAA3mBmnhuq3240qSr9wNWOh563sXjhVstRqMgl2bcttJnCPps9kO3GMgJToj3okeI+3bIEdxXZqk9Zm088xckFb0aCICm7wkZKxCJMWX8TlompCV+hfTsPEAm1v8e6Ge46bo92d2noX3ZSzVq9fNyJ6rzP8fwxtbM7RQcs8iaEHTHULbi//5oGcg4Z7M7tggOndiTNO3/clNF+/Umw6j77Y+EZpmqzesQ8dS7szMI1NPNO61zqF+C1jq/WwOmV7jMtdaeV2U66ehnXouSkIC1QHryPi/WdAE3R4DlUVWM4kIfBnE6NC+MbMUITZe4oBMMb8VB7Uize75CkwJBzOBaDXiDtE0ZNXBNfFzhhf+S0uMIwY7Hk6YlZYON/7ltXCIIxNEwFe3wytj3SQz76wYcBLo3j+D3SqWv0SUbJKViSkVnki9YtHSWM7JwTuTNdWR7lJrsInCtovf1J8IFw8sbD/tGyo7PuEe7tZj67lFG9S7KmmS7ArXz6jufJ3YZ
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(7696005)(4326008)(478600001)(54906003)(966005)(41300700001)(70586007)(70206006)(316002)(110136005)(86362001)(36756003)(83380400001)(426003)(336012)(2616005)(47076005)(1076003)(26005)(8936002)(5660300002)(8676002)(2906002)(82310400005)(40480700001)(81166007)(16526019)(186003)(356005)(82740400003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2023 18:54:44.6076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c90ebf08-71e5-4017-5320-08db392be253
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8205
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Mario Limonciello <mario.limonciello@amd.com>

As the command to get version isn't supported on Picasso, we shouldn't
be exposing this into sysfs either.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2449
Fixes: 7f1ea75d499a ("platform/x86/amd: pmc: Add sysfs files for SMU")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 627677c3a335..9f824ecd84c2 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -456,12 +456,31 @@ static ssize_t smu_program_show(struct device *d, struct device_attribute *attr,
 static DEVICE_ATTR_RO(smu_fw_version);
 static DEVICE_ATTR_RO(smu_program);
 
+static umode_t pmc_attr_is_visible(struct kobject *kobj, struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
+
+	if (pdev->cpu_id == AMD_CPU_ID_PCO)
+		return 0;
+	return 0444;
+}
+
 static struct attribute *pmc_attrs[] = {
 	&dev_attr_smu_fw_version.attr,
 	&dev_attr_smu_program.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(pmc);
+
+static struct attribute_group pmc_attr_group = {
+	.attrs = pmc_attrs,
+	.is_visible = pmc_attr_is_visible,
+};
+
+static const struct attribute_group *pmc_groups[] = {
+	&pmc_attr_group,
+	NULL,
+};
 
 static int smu_fw_info_show(struct seq_file *s, void *unused)
 {
-- 
2.25.1

