Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97861ECAAD8
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Sep 2022 10:26:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiIUK0B (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Sep 2022 06:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbiIUKZr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Sep 2022 06:25:47 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908E786738
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Sep 2022 03:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpflmirbE95uw0CiaUPqQhff/G9qhj0eu4VvR9+aEnTABw0G5eUmvNGKaGR6TmGdHnGlfOoxYGrC6DxUD9mjRzIERKbZ+SyOx+NhCIJu15CKj5uHKQFuLV8XXQhRMOBLpUh1gnl6I+NAnqLU8Qj7ozMGGXNoMQIvv3OAZkkPg215S2cdjH4qpgIDlx+f4E3eCLgpO4uwfGh0eWjVglnF4quXyZq4iR4ETTUlrTW1W5sqdfvjZAEgCMlaPW2/pR1XVM0fY9wGVkEvuHOO727T8yl8OGor1ZvczVj7f1/w2BJRQkcxQ9skTLALRonMxggX5lwaucAZPqn07ETmhi8lyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxRxt3mOF5W2yq6saybg4C1lql69U4PJJGFkW5gOKX8=;
 b=XLdRwOVtyJVirwE3VhAUIeCB7j3wkX+hvveqPpmrfGfCUWe8H+jsRWxMyUOSapTaQyzbm+5/T/+abulKBn9IizSCN4mduNJu9KRC5tlyVWpiks0tt6abFQ2yxasLElTe/7Uh9rt/aNSJGIiw+jkginZBFG4k2TBuuRygM7ytXskWrLQYsEuvVLzxo0Q2yIq3XPHkgrSIxxKbMLnvdkZGlPScQgS/fP3c3J8A1Ll8MOCjB2/vIbC3pGhz8gwkVsYfPf9S1Py6X0LhcqVEWYOETDRaJHmJWBlMJ+E2y7s0a3QXw1AX37GQVUuHPknkaFvGxO4eZq2ir+FOxxO7qE7Ovg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxRxt3mOF5W2yq6saybg4C1lql69U4PJJGFkW5gOKX8=;
 b=5qMq8XNJdF0hA//sUv4mY21kh+WXM3znoFOY4GEnR2mmtCYlO09m4A3jyl1DAN83PVtIvX6//BYqUFgn52ImtVomddt8vdPuPuGMocCoIoFfPfGWNSRokeA4KGmHjOjCmAMG9INOeZ3OT3Nr/RiTJSqCKvVyl2FJ5ZiAf4HAstQ=
Received: from BN9PR03CA0633.namprd03.prod.outlook.com (2603:10b6:408:13b::8)
 by PH7PR12MB5997.namprd12.prod.outlook.com (2603:10b6:510:1d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Wed, 21 Sep
 2022 10:25:41 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::7e) by BN9PR03CA0633.outlook.office365.com
 (2603:10b6:408:13b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14 via Frontend
 Transport; Wed, 21 Sep 2022 10:25:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Wed, 21 Sep 2022 10:25:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 21 Sep
 2022 05:25:37 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <mario.limonciello@amd.com>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <bnocera@redhat.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 3/3] Documentation/ABI/testing/sysfs-amd-pmf: Add ABI doc for AMD PMF
Date:   Wed, 21 Sep 2022 15:54:55 +0530
Message-ID: <20220921102455.1792336-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921102455.1792336-1-Shyam-sundar.S-k@amd.com>
References: <20220921102455.1792336-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT067:EE_|PH7PR12MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: bcdbc755-de53-46d9-31e2-08da9bbba222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2YskuTVtiKoBnme53dOSG4qKY2q3IIf+W0YzSFsAQuIF2wjyEzjkWM5ero6dIVe83ZezXzv66iAu7lLjdkdFtZ72CECRKqGk6NVK7rHY61i+ATFc15LYWJ6ratibbq04qkg2bTLv7xNZKhZMtO/aWyUgg3OrkhTEQNQlhyc5CAE8Qj+Y2HY8d961UXacHMvv4Y8fOZjdeMCpTAkXb4dTzu9HRb9TYLM/gGo/LSQ6Yi111IBE6rEyU3hpE459f/AmULO5B7KaU0PqzE25A96rJsIEBUS8p42Ub0UtDC2haU3lryAhr0oQZfgIdM9sz2FHxyJB9rETsPLwxUXqVUfbhFiA5qPxjeiixwC9DlZTBbsdquuKM/A3+7w47AzxbjJUdlHHcBAC0CBXZAWi0N7JHdpJ57KGi48fL3vPC68rQmmtEKdvH/xIjrgWM5n2bACJQ5eqtDOvsOsIuT2xuPqGu1cF+2NnE64wO9Lu3d4UpvyqGoADK6AinTa8Mm2SERMFAMuK4bJxm1SxDQH4kmdiaIIBfhGFcNggQq09RtZNS+t6VvMywUf4Ir8ZFgN+iHw5+vX2mnkGwaZx5BqytLVL7NR7RcktNGnffg076yZMeTtiaQSYpU5S92CSBkYv0wh5d0CSU2+1YFWz9mbQxXQIE3zPPU1PNqOkimn2R/ASGIe0blMePZ7NXoPdOIIKN1/rxgjtLWINYx431Nb/zYVWkP9asXIq2hzwFQpLvisu3hnQXI6GzbIHa7h+TW8jioXNNWb6gkH0eraoFor30Uk/8G/IrkzmmaTwTg2a+BTou4sIrgL8187IDzO3ruIK0KXeDiDRCMdc0+ZnC9sxzOfZDw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(41300700001)(5660300002)(8936002)(16526019)(70206006)(36860700001)(8676002)(70586007)(40460700003)(4326008)(2906002)(36756003)(426003)(6636002)(316002)(6666004)(7696005)(82310400005)(54906003)(110136005)(47076005)(356005)(81166007)(26005)(478600001)(86362001)(186003)(83380400001)(2616005)(336012)(1076003)(82740400003)(40480700001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 10:25:40.6904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdbc755-de53-46d9-31e2-08da9bbba222
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5997
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

AMD PMF driver provides the flexibility to turn "on" or "off"
CnQF feature (introduced in the earlier patch).

Add corresponding ABI documentation for the new sysfs node and
also update MAINTAINERS file with this new information

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 Documentation/ABI/testing/sysfs-amd-pmf | 12 ++++++++++++
 MAINTAINERS                             |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-amd-pmf

diff --git a/Documentation/ABI/testing/sysfs-amd-pmf b/Documentation/ABI/testing/sysfs-amd-pmf
new file mode 100644
index 000000000000..fec2be7178e2
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-amd-pmf
@@ -0,0 +1,12 @@
+What:		/sys/devices/platform/*/cnqf_enable
+Date:		September 2022
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:	Reading this file tells if the AMD Platform Management(PMF)
+		Cool n Quiet Framework(CnQF) feature is enabled or not.
+
+		This feature is not enabled by default and gets only turned on
+		if OEM BIOS passes a "flag" to PMF ACPI function (index 11 or 12)
+		or in case the user writes "on".
+
+		To turn off CnQF user can write "off" to the sysfs node.
+		Note: Systems that support auto mode will not have this sysfs file 		   available
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

