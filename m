Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDCBC433ED
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 May 2021 18:01:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CF7D613C5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 May 2021 18:01:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232633AbhENSCi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 May 2021 14:02:38 -0400
Received: from mail-bn8nam12on2088.outbound.protection.outlook.com ([40.107.237.88]:41664
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235320AbhENSCg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 May 2021 14:02:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8KjKtZ2mQLRMXb8vB5lgoEjCebeq8nXbW5nlk3gPr5goCIBr7E4hrcjDY9BJbTBjSrkV+I7YFBy4qbBCCMPGKFXUiKQUnl+ISJs2KaFqsNPbGdFhvcbAUoZ0j9E/80qbXue/hXYwBM/wzwMmMudyK4jiF7Mx44Evb47di/tF0X5NkGKhFdJ+COYVjwvhQ58OBzvvtcD/ql0Jvw3g+S6v0uoSywIObX5FJ56GYvlZozw5vw3M7rSfcA/csFnupNZGwnEVQTI1jQZpOW1wBj32xIzPcheYEFQGwMQf7qbxMYrI4mCLVhDeV2nTXFsnSri/O7RMD+1/fSZPp8igEw6Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AbHLhe8EBHJOjSeE+Yc24RUUNZ6BhEeO7nbH1uCKTQ=;
 b=eFxZfB5zJfAjESKaiBYsSBXCSRx6BoldMvHQN7WX249eoKizn2m2l0Sy4yg+9k3c31iHlHD8pk/JfqeQ1nZ3JHxv05bCVwgzEqYSA3h8q4iQG5Vs7OCA8wMQWZxclvN+1LjB9M3M7Y/gl1fSM68rhMQNn3LewHsuPHDZvjZH1o3SKWEOMo5ZU2Duwk0XgYQKIVmZqxzuLufxFvuk8zId8tz1ra37N7IcCSc6XiU7o4rfXtVYpLN5o2GUikWUERf+qMdXXgob+f0vj1GsKUod7kJlLbuCKDfYQ9sESfET8BJckR9QAQ8zeklSv9ZS1+4qXi9npLWVXgbTystmUpRVpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AbHLhe8EBHJOjSeE+Yc24RUUNZ6BhEeO7nbH1uCKTQ=;
 b=B74koOB+powOltgS0nWtRexBCPu0xgLfF7n12c+4EFwJyr3SwumWDm1Kk/1bWYpMqyfUyXD++bWVE7iGdC2k00dhOdOH4/dJlUgi8u7Ct+kbG7Xs0NQTfNpYiBdmTPUYPbnwF7P/z7BkzLtGHEnJJWZvAbZFUTpIr9E02tS/Nco=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL0PR12MB5553.namprd12.prod.outlook.com (2603:10b6:208:1c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 18:01:23 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::59a9:442b:2e42:99bf]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::59a9:442b:2e42:99bf%5]) with mapi id 15.20.4129.026; Fri, 14 May 2021
 18:01:23 +0000
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86: hp-wireless: add AMD's hardware id to the supported list
Date:   Fri, 14 May 2021 23:30:47 +0530
Message-Id: <20210514180047.1697543-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MAXPR0101CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::22) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jatayu.amd.com (165.204.156.251) by MAXPR0101CA0036.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Fri, 14 May 2021 18:01:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e2cfb60-0e73-46a1-7f26-08d9170248ae
X-MS-TrafficTypeDiagnostic: BL0PR12MB5553:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5553D4194BB6225DD6E87D689A509@BL0PR12MB5553.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wip0M8G5YI+OUeoUdgL2wYHME12UJnLY3aTWFN74usfqKTHm83JDH16SWJwAxTcwtjyxPIwn0N3fMxyArFiF/oySisouOQlSLm4SubLEbNWt6dOjDEfTYYbNGSRS4Wj+JajWF29pUv8nsOylvakdUDJ19arVo+MtxBBjUTeJ9QtCw2ZGJi+xDRig+o30yGO2s3c7qy/g+ngR7WsffV8gXgafPKKObUvijbDdoSBiDgOFPc6OjbcIF+RoX7oRQKWmrp2SRX2r5EGKLKG1td/r7ptP1hp4MnJhHYN1b77u4+fM+U+FUB8qIFK5Zbuki3GiS5kf2Ppx8zKnSUe/QiL5Z1mVI3BSciYGW9aNrrkIUSrg9iAP71zZofonJHCXgdNKYSQZXbt9Q5KjVszBVdokrhytoSLYtcfUjKocvLtLEzSIwwsVLWUdoM/Eb6kpPmXfseaJpN+H1Dy0nnIubmvHY+7WT5JM4yklqh2GFsot44Nc9ToO9QjvRivHfcQk0GZhcGDcTtn+GOXNXOZ64eT3RnA3U9/aerToFN/BtM744+IF1LauhQq8c3ErQ/dwslQ8acuzKejLIM7fPp/lWR3gsDUA+YiEmO+q0MRDn5e9iws1qX1tCEIlkoRj5GH2Jvd8GX/Z7hc4XIvg7vu8A0lVRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4744005)(6486002)(26005)(498600001)(16526019)(4326008)(38100700002)(2616005)(66476007)(7696005)(956004)(1076003)(5660300002)(186003)(38350700002)(6666004)(8936002)(2906002)(66946007)(86362001)(66556008)(8676002)(36756003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vDbzj67JRwd2cKJON3WmwGdaQwSZ58TJGXQWzHWNEpdQWpWA7vCyzmIeCxYs?=
 =?us-ascii?Q?e17UVpQiZzxhmGPv/lvtL98zFSYpF/CMZAu1rIXbhneTKWyl2ETNAydSjfP7?=
 =?us-ascii?Q?jEux9O+YARxfBU5qXRpehsHbcj8LgCH4NzgdFbkrivl68UCPmq7uWQIlHPHE?=
 =?us-ascii?Q?3FGYRH+71PiizbFaWP5MRD2CFgUHMH4XeRgfNnwoArlzeEKd7dza8Djd7IpF?=
 =?us-ascii?Q?ambZqXNHN6f9n5h7HZz4Bw9EnKkiEoStG6Dz5dnXIVYDznJSkan2aEzX+0R/?=
 =?us-ascii?Q?AS51lKC+mrHufZf3Woej9qlSZcS87a8GgnXljnKGJ45ZuXf+U6auG3/nU97p?=
 =?us-ascii?Q?6zgtGRAwWZ+DNoHqg674WYZQa572FVJay0vDwV/ghzQuwrwa3eosu/R1dqHq?=
 =?us-ascii?Q?vurDagb0O5HKt9xDqAlHsEfAxK/QqFIqJ+SXq7TUhCCQfycaDO3dnTAlrH5w?=
 =?us-ascii?Q?lMztAfVGgD7dqVEiK8ku8Yf0iGoiiCUB6ASAS0haHb6m7/rYGIowObrIotkQ?=
 =?us-ascii?Q?MTzdnjx8qgG+4Vdyt0Kx7X6IYleOER30zXRt8hqEBS+MkBQdymS1Utpi314p?=
 =?us-ascii?Q?dxHU/b46Me7cLiJbAXucLVXKIrrjDPWU3r3ToBkA4OwZh/2Q4atAN7kpy4oZ?=
 =?us-ascii?Q?YCiYfz/0L3Jof31uQsAaeIN848CmUpp2tRckpYc81mqGQ3pHrJ0f7sAuyaT1?=
 =?us-ascii?Q?XDtZ9a0XUoVhmi1R33nNeXqVhS+3/XcSMyDisay8t4RCdvoxZU7nkdZ2SQsR?=
 =?us-ascii?Q?IOLxzk00vugW17Whtp94rheC7QrcD6ywxMLdv7TLOHChL/99BTx38wKJjMkS?=
 =?us-ascii?Q?g+WueMUuIKHBTuMwCWMCCKjZTtApzRVyInWhzGvjtS/Pz1XhRXE7jIL0sf4j?=
 =?us-ascii?Q?q8k3k/4P3Yzk23VzjLaKG3ZozU2nWmN6yWSQ4QYu0ijXbPFVIwKA13YclTiC?=
 =?us-ascii?Q?MG5A28viaVrY1AlU1/KuF/iB9J4urrxCCN9sTr0dwP/Hb36hwLMRob6TKtuI?=
 =?us-ascii?Q?9joHpmedlK/U12k66va1CgLHyVtBemMCIadq9x7GDfRTH2VYA9C0JSMH6/0a?=
 =?us-ascii?Q?D9gdcT8cW2LYNonpqwqb2z2ITUuFXJgH1Qn2ipuHz7eqCdwrQ4hdObHogh00?=
 =?us-ascii?Q?/Wrj3aH0bo/nFeERZSIhQFOpZWIZjc39a26FpkPvZ8JMCxVvYjVut1Xymc69?=
 =?us-ascii?Q?2KRv8nXOfn+uoLRnoQ8WEGZDztWXpa6BGNIypFNiP8m5rPXa3DGHb1nTb9d2?=
 =?us-ascii?Q?OimNSlQUuGR3SrDRTuT7Fx2O1zhVZXJf1oGIDIPNskXwyI1r0RWBEU4fjmvS?=
 =?us-ascii?Q?3H6l9Q12ZEwPr2SCRSgt66v5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2cfb60-0e73-46a1-7f26-08d9170248ae
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 18:01:22.9650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8c4OICPS5Sw8z//KByEbOPqpLjoLx+FfhpOFjCeo2hjayRl2KlNIGbYTARrR5zPMcx0WDB1bUU4NM5iaa/srKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5553
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Newer AMD based laptops uses AMDI0051 as the hardware id to support the
airplane mode button. Adding this to the supported list.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/hp-wireless.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/hp-wireless.c b/drivers/platform/x86/hp-wireless.c
index 12c31fd5d5ae..0753ef18e721 100644
--- a/drivers/platform/x86/hp-wireless.c
+++ b/drivers/platform/x86/hp-wireless.c
@@ -17,12 +17,14 @@ MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Alex Hung");
 MODULE_ALIAS("acpi*:HPQ6001:*");
 MODULE_ALIAS("acpi*:WSTADEF:*");
+MODULE_ALIAS("acpi*:AMDI0051:*");
 
 static struct input_dev *hpwl_input_dev;
 
 static const struct acpi_device_id hpwl_ids[] = {
 	{"HPQ6001", 0},
 	{"WSTADEF", 0},
+	{"AMDI0051", 0},
 	{"", 0},
 };
 
-- 
2.25.1

