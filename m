Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41967CCA482
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 15:01:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233876AbiGLPB4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233453AbiGLPAr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 11:00:47 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2070.outbound.protection.outlook.com [40.107.101.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08DABF548
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 07:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAwtR/FcePqaok5sp70/8UkENMn+aRsL2KQOuNKELvOd+xMcZd19o3WvbU9UCnOafj5wbYtcXnwbisc3CUO+iHL3cK3nY445x7uMli0jL+nZ5X/vCG45O9E86Yt3tf9fALWecYEbmXQpiTE9X8H12ohhqxbWJK6mBTH9Hve8vDpJb5pdeE0IWJjriZ5ctOOj79pBlwYVJHmkzp6bJW60usvh3E7DMZ7pOHuVTUqeZve9T3IOTarQiF2e8ZG26KxovxX0FUKV1TDxN9553Y0YZL61uQmZNUgO0NprCaxAdBUzBXEaGX46Clha+NHwCK1e1dIjoRBPXlHOfT1iGCLeHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puHjw8Bo01ajFB5te7A5bxNi9c2SgKJzhwupItG8PFk=;
 b=Fl9/Vs3w6zUa0m8of1XOJsscClweDDKoga3E7BepAdr5hpfRxklkviIQRqAxKK9Xfdz/CSAQJ2vYMQEEyfJskyOTPrxoXYpRAtgkRByjhbs5lMKji2YgDYULxAjIj4AxHxugbx+lPFJgcZmsRTyj5sLXsdZH1nggfCMHFk7UlP3j74XoaZIf+IUfEjHqaOYC6GJrcFZ3GZBR85HKMAWk8oEAxDdV7SHEY3PUk3jYWby95XR5Ij7dSeaYWSv3beXByBfOgz9LchPA6kehIL0ON5AtDvCOHHNmmUkawpBX2rP44O3HlO2W4lubavbBWWCffYMI6JLUFU1YDRA4WRVUBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puHjw8Bo01ajFB5te7A5bxNi9c2SgKJzhwupItG8PFk=;
 b=wEBu7Pn2mMrv5P54G9myA/r7maskm28NxXLTf48scCpb9mrof5Qbi4HW1T+lNQdMA4eZneF/rJ675WLFROXv6G6EaazvX8TiIDsDGA6FE2dIgnFIFNQ5i1xfE9k/bDgAhmQqNBnjj+znUfaYQp9jngZVkLtVLYLAhEeMfgYqMo4=
Received: from BN9PR03CA0434.namprd03.prod.outlook.com (2603:10b6:408:113::19)
 by BN6PR12MB1585.namprd12.prod.outlook.com (2603:10b6:405:9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Tue, 12 Jul
 2022 14:59:31 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::63) by BN9PR03CA0434.outlook.office365.com
 (2603:10b6:408:113::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.19 via Frontend
 Transport; Tue, 12 Jul 2022 14:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 14:59:31 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 09:59:29 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Mario Limonciello" <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1 01/15] ACPI: platform_profile: Add support for notification chains
Date:   Tue, 12 Jul 2022 20:28:33 +0530
Message-ID: <20220712145847.3438544-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 330b7d97-0c78-49b8-b318-08da6417205f
X-MS-TrafficTypeDiagnostic: BN6PR12MB1585:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IoXlq07HMQupuy92l2vCSHb0v1IoB1XtSYpd3C9SyIoo7c6kWOTUG/QDC5x9DUKnbiSvJMteDk2n+p6xZmFvhfPpcgcL9AjbpNCiRrbuQuHzMT7C/4uvOZccN+VVEPlhqNbV60lFnS6p1SjXVz2A4ysvbM47UQF3ilpx3IgQBpBUkmNRbnDXMDm4t6CtqGh2bve6b4mviPvLVN6NKzlRWJ8DxWWWz5J9ZTUx/8tgU8qdF8AsOyPrGKnvIDtPeyMkOHkzfDTAMP5wAxiI5KqKvZmO7tvOlieYbBe4WL/I74ncdPzX2sNsQcfcqHbRqQhFKc3LEdUXt9YJ7WKZDaL4P2DnmzEfawozrgRYXC0gILdUdLZTDZaTqewPfBCptU7pdQs0jQpgUvNYta6Q82Vog8U7ArvIc7iqMgDjMVFQ5Bgq2ekFF1OwwWYeQ0W/i/iaj6RR1OgDj9AgSJxvL7FXXXW8xRI6w0aFY+2jHlGIZWXK9OeyopDeG4lUsDyCmWQZJ1iiwp8IvGGKtsCgJrAwLsUqqNpk1CtezfdSB1nVviNLT5WCzi0vCi1ejRzUEsK+GOu55WSKhXxiDQFkC2a2d8kQVnqhPIXtfejRmUS86QZ2ruZLUQv935auwBmWhDUKnP5u1m8lbSsCVPaW1o5/nBRNAcWz71xXwjyAhZT0a3I+M1U6Lw/bmmaHFbzCHlsnmHcLo++1gJS5I0MoUOqkBO2Qd1FcU7Je2FSw+xDG9VyUy6XJ+C1N3MbWf3BMEMybHZTzYmg58NmDvJc5K63tJmTfDA4XqpKdnzL/LGXw/tdiwzDNFa2VNJRbpy5ejhp971ZR3hbhtNTNO/FlJ9aREj5RYmhHYDtjUi/7VHV20H0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(376002)(346002)(36840700001)(40470700004)(46966006)(47076005)(6666004)(2906002)(26005)(36860700001)(40480700001)(478600001)(110136005)(426003)(356005)(36756003)(82310400005)(16526019)(40460700003)(83380400001)(336012)(8676002)(86362001)(70206006)(186003)(1076003)(54906003)(81166007)(8936002)(70586007)(4326008)(41300700001)(5660300002)(82740400003)(2616005)(7696005)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:59:31.5733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 330b7d97-0c78-49b8-b318-08da6417205f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1585
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Mario Limonciello <mario.limonciello@amd.com>

Allow other drivers to react to determine current active profile
and react to platform profile changes.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/acpi/platform_profile.c  | 26 ++++++++++++++++++++++++++
 include/linux/platform_profile.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_profile.c
index d418462ab791..7e12a1f30f06 100644
--- a/drivers/acpi/platform_profile.c
+++ b/drivers/acpi/platform_profile.c
@@ -49,6 +49,32 @@ static ssize_t platform_profile_choices_show(struct device *dev,
 	return len;
 }
 
+int platform_profile_get(enum platform_profile_option *profile)
+{
+	int err;
+
+	err = mutex_lock_interruptible(&profile_lock);
+	if (err)
+		return err;
+
+	if (!cur_profile) {
+		mutex_unlock(&profile_lock);
+		return -ENODEV;
+	}
+
+	err = cur_profile->profile_get(cur_profile, profile);
+	mutex_unlock(&profile_lock);
+	if (err)
+		return err;
+
+	/* Check that profile is valid index */
+	if (WARN_ON((*profile < 0) || (*profile >= ARRAY_SIZE(profile_names))))
+		return -EIO;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(platform_profile_get);
+
 static ssize_t platform_profile_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
diff --git a/include/linux/platform_profile.h b/include/linux/platform_profile.h
index e5cbb6841f3a..2395be670dfd 100644
--- a/include/linux/platform_profile.h
+++ b/include/linux/platform_profile.h
@@ -37,5 +37,6 @@ struct platform_profile_handler {
 int platform_profile_register(struct platform_profile_handler *pprof);
 int platform_profile_remove(void);
 void platform_profile_notify(void);
+int platform_profile_get(enum platform_profile_option *profile);
 
 #endif  /*_PLATFORM_PROFILE_H_*/
-- 
2.25.1

