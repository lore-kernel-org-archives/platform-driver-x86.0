Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64A8C32774
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Aug 2022 13:32:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241347AbiHWNcB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Aug 2022 09:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241159AbiHWNbn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Aug 2022 09:31:43 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 098E716389D
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Aug 2022 03:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0b7vssDJQMpJsNZ5lNziybAPxTEjiAn53kf2ue+FW40fjA7bc9g3wUzxSeewEIb/Z4JqxnT31x79EV4k3m23wpkg4FTwMdvKzdrCPfrU3Htc+M5N7XbEWpiZ1yzb5HZD2I5q9FBoYLQNuLjbHxfiM0I8GXmlVkfLNVtkdy3/IOQ6Eyr5t+m3jLCqvKxOIceJ4rFqoQAV6VknGO5e685ckwUfO/JMO/f+bSVa78F7aZ4sZ8rd24qsoe3MbpyvZWugIUFq7tzIFphNqeUBmrKvvhh1FkRCV0mNwpcsNibkwL/hpZWYwCbH6sAleB/7ol8UjLLbWKixTjH6L+TobNq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJL2QtBKhCydE3bL2ffkK2MOQ1Ygg7QZ53zPMzqQ80U=;
 b=Bqso9ltgzlmW3eIq4iJIz+YNGPLPTBdoVSiV7QlXN4RSyyCKGkhTQNTZpNpySX8J1/hn5hfLtsITw9CxEFFl4IwRqCvU2u1hEJmrJEVpF1Yvl496x6msq+N1I35ODCHmjDaRDE+PQweavs6+DistoAFV7rXJZ0LU+j9uu4mFgaqTZV40uUK3V90p3Jwos6zyOuYKuXjqknwXqJOjpwL1qwAUoBZwPsOLtY/EeRqfnN1XQbUMHRrgZC5NPK7tkrKOTImOqYDzZV7A/X+73/IVVsN6dDSg+tT8XgZbkLxcAEgK6xiGKtQ4yqp/SIOwIfvFBM7fLpVwO/SuDD3LJcHfTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJL2QtBKhCydE3bL2ffkK2MOQ1Ygg7QZ53zPMzqQ80U=;
 b=pXSNdEM8hJ4xIkfQhe92WXt1HUo7kuHxzhyugvcpteNv5kJxPYRm659EIPvdKn3LHqIWF1kpN1Eb7nF4JmWi35V4fdEO5MJKznXOEjRF5V/jdadLuS+bepy6t9rOSaWjyYrpE7DMZlwWATmoUH+yhdFfG4qqMZxqRHsM4bppCWM=
Received: from DM6PR08CA0046.namprd08.prod.outlook.com (2603:10b6:5:1e0::20)
 by MN0PR12MB6150.namprd12.prod.outlook.com (2603:10b6:208:3c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 10:29:52 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::d0) by DM6PR08CA0046.outlook.office365.com
 (2603:10b6:5:1e0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20 via Frontend
 Transport; Tue, 23 Aug 2022 10:29:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 10:29:52 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 23 Aug
 2022 05:29:49 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 4/4] MAINTAINERS: Update ABI doc path for AMD PMF
Date:   Tue, 23 Aug 2022 15:59:13 +0530
Message-ID: <20220823102913.4181217-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
References: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2e96a8b-ec36-431a-eac5-08da84f26a06
X-MS-TrafficTypeDiagnostic: MN0PR12MB6150:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jV2rFJhrKwmIO8j6sY2ETJEj01yHctdZ3nsqtNKCOjfBues6k6MJT+i0qXQCJrsP9QX5JrZ3GnImwWQNoxUKJ/9A74qNYWFWIgOj/Q1/ySSmwx5R7d85pQIugaPMo2hqCPXA7tqnjwD/J6jnStI1KqV+n0NKPZGqSSM4XmmjV+qejdoeFAumrKx8xYVDw8LxJTFoJKD6s/3/NfL8Kan7+lL5DSNk7T9XzTjuTEnpeR1CTER0ukZcPEwBktcUz/aiHi79m4UkcnM3DoirvYGE1ZxVikKOY0bv/Aty2f/7xCZkYE1axRHqnm4VuIuIzStD4IpepGnvdMKG8Ja/wAtTZ2YlisSsaEaoa2B4sF0EuWxqQsIp8i1aToCBIaJJtrLJcrjpzxgYom0+clX+h5lEy2VZSVofG3fcocOmA9DWuG6UmmkEi5obPB/UiQNUw1nX8dRG12LEmWYRy6/TN0QaNz8DNPsPIBegMoF69HDfd6RG0XXiuOdplZ10yx5po52hT2XowXh+aX0YMv3pumf5movidtNRea6MCeZGHQFRjNuqEKndjvWXAhrKKYS81yZhc1iiHHz2lWW6N/k+Y/CT9IOznIXPsgWiH77kPiVtNf4kockGEEjndCg2hMQBtiMYIMGjVI3rOncuODYyo67j4JVhXeCbI4LAhWlL8sP2AIFPXkx7U1+WOHIddesO+kHNt/X5CqyIykd0bkiS0Z66GhqMuBSeMP+GPpXMd39u/xETsUO19RlArM1+3Vedrp5ZW9f1DGxZ4oaHf7ezFqH+5SaFKmNgbuR1Yti+OaQoWu6c/wo6kjaGHxOcwEa2BLkl
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(346002)(396003)(36840700001)(46966006)(40470700004)(426003)(47076005)(2906002)(83380400001)(26005)(2616005)(1076003)(16526019)(186003)(336012)(81166007)(356005)(40460700003)(86362001)(36860700001)(82740400003)(7696005)(8676002)(40480700001)(82310400005)(4744005)(70206006)(41300700001)(316002)(70586007)(5660300002)(54906003)(478600001)(110136005)(36756003)(6666004)(4326008)(15650500001)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 10:29:52.1043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e96a8b-ec36-431a-eac5-08da84f26a06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6150
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Update the MAINTAINERS file with ABI doc path for AMD PMF driver.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d74bf90f5056..255527be7e24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1026,6 +1026,7 @@ AMD PMF DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-amd-pmf
 F:	drivers/platform/x86/amd/pmf/
 
 AMD HSMP DRIVER
-- 
2.25.1

