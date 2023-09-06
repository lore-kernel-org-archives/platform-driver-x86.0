Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0867EB8FA5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Sep 2023 07:13:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbjIFHNr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Sep 2023 03:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbjIFHNr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Sep 2023 03:13:47 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::614])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3227E6A
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Sep 2023 00:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Daqkapn4P1kuFDsoDWaabT308I9uQjZcfal96L1/jzghK8PyKSkA9TwkiOgW2nnZ383EqxFa9jI7jWUr0FJt36RUTUfK61DTePuC4vwyVbrVzd+nKr/RkcqGMS6GVTB044vVUefu+QN8feJkGoEU7A+bePTJJ6kyKNTVn8JC8UX+TnnTMXHRsQmv/RLkCak6Rtwp5IrwdijcqmsdgbmMzMKPa7+BBaQn6PjRjpHBVZ2FMoEki3pG9AH/dAHRWqijz4FOjGWBwfYwaQFfFbZ/dVewwnESx/IPQ8qoQom96mBItyAUMYrQypQ0FbnlDBnZdVDZuIyl7ve9slzk6WNH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ny8zY7Z0PJDFrKi6fqCVsXo5/7fgJtzjwk0+ZDJ3/RA=;
 b=NB/JxOlpjtCbSAAcFKHGILAEQXXopylijHYq3nhLHB3tf69t7yY/zeU1J3XVFCqdmpy/yvI0VRzdtq/xqSPKGe8O93NukOa/TS5AyrAAs7mS6icc5RMSGA3wxfouxRgBFxtEq6UQGXCDdKszuEngg4XN0te1BWwn6zyNAxQzJKkCxnS6X3wgNZB/o+L8IKAAsCNx8KAZBsr1Kyfc1sGtwm7l02NyEzWBSalhESxPOCNNNC+6apToZd4vHD6E6A8f0hEZBHBMUw5TX/5+Q23Oi4rFrqm72bF7stKdaEq+OE2f09MMSWbW5OPbh2YXW4pb33WQl+eDWNC5VHW0KtA5Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ny8zY7Z0PJDFrKi6fqCVsXo5/7fgJtzjwk0+ZDJ3/RA=;
 b=llPbzhWKUaFWOv7GtBIfL1mECi5SdxFWIn6jrGOTUL15Y1uYbfG1WcsUb1G/5O3osO1X6v637JOECER8igGR2M93HaRxf6yW63Io+3MSrtzUqLwXy7cs5RGu9w2nz1axjVp3hGaLfCp3urWt6zQ7ZdvJol8Emucuhr9KmKPM2xo=
Received: from SA9PR11CA0001.namprd11.prod.outlook.com (2603:10b6:806:6e::6)
 by PH7PR12MB6762.namprd12.prod.outlook.com (2603:10b6:510:1ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Wed, 6 Sep
 2023 07:13:35 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:6e:cafe::1e) by SA9PR11CA0001.outlook.office365.com
 (2603:10b6:806:6e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 07:13:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 07:13:34 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 6 Sep
 2023 02:13:33 -0500
From:   Suma Hegde <Suma.Hegde@amd.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Suma Hegde <Suma.Hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 4/4] Documentation: Add amd_hsmp sysfs file info
Date:   Wed, 6 Sep 2023 07:13:02 +0000
Message-ID: <20230906071302.291260-4-Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230906071302.291260-1-Suma.Hegde@amd.com>
References: <20230906071302.291260-1-Suma.Hegde@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|PH7PR12MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb6ed96-2a46-44e7-fc6a-08dbaea8c8d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vm9vbADcP2sXiMI/0A07hMy41iRxVByBNcrMA2l95VDZeqvcq4nTV64osv2gS5f1zTj/PgLMtH4bQExwI+VsG2IcxbseHBCdgJwcy3RDMbFpJrFHUgeNFBuxYnR8du6MFx3uhFFH2Q1aOCFS6Waz9VCH0wq/xMg0Qob+tZ4BZuz+HoI3Rwt7sFlvw6lbcKkXieJP58KMW3fVV7cckqc6DdwJ8v9rMHI3kOGQstDcGavfx8dK0330brkDS+QXuNK7Rvi9oEsq1Q+EQagYAp7KcKJhoopWUhOVRBcbBEuqJFDVzml4McXMXMGZl8Rh+kL2XYEWqXGWBSQvuipy5P+90EwWM7pptr2Jroa37qxelELKs3WfBxSxK7Mnt57q2CdY9KByUTmA8V1mEsY4aJe53Jvply5Jq9m6gmk7dL2y5y8rrD5MR9CTzOMsv5kpIFwowSY0qs0obGqY/gru6aD0tGLNNGGGasuQpcG43ORO4T0eovAtuqtTKjMFZ25oj1TPfywQ5S/obeGFPN8JgKew7HjtDQHLxdKnysEKQiodHwYMwrDs++YyZKAnuwgjOy/k6L8klM/SLivQevc2+krMyTcqqQOmx6W4lhyCVqMuQZeenq1Yy7y6jeWi8sdzPJppwDgbzZVNNewM6LOCP1sb/995PY7niIjaqxjgZmU27FVl9AJT54v3k/swQ7fsHXxklKrGmQBxey++q+XDe4HiijJuzOpUiAqGhS7SgkyQEns2ma2RfwE1+oMjBLaeXVUplXrFOSv0/5KjhC8Ty+GhMg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(136003)(39860400002)(1800799009)(82310400011)(186009)(451199024)(40470700004)(46966006)(36840700001)(26005)(7696005)(16526019)(40460700003)(1076003)(36860700001)(47076005)(81166007)(82740400003)(86362001)(356005)(36756003)(2616005)(336012)(426003)(83380400001)(40480700001)(8936002)(41300700001)(316002)(4326008)(6916009)(54906003)(5660300002)(8676002)(70586007)(70206006)(2906002)(6666004)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 07:13:34.9636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb6ed96-2a46-44e7-fc6a-08dbaea8c8d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6762
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

sysfs bin file is added for metrics table information

Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v1:
New patch

 Documentation/arch/x86/amd_hsmp.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 440e4b645a1c..e4f4978f758b 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -41,6 +41,22 @@ In-kernel integration:
  * Locking across callers is taken care by the driver.
 
 
+HSMP sysfs interface
+====================
+
+1. Metrics table bin sysfs
+
+AMD MI300A MCM provides GET_METRICS_TABLE message to retrieve
+all the system management information from SMU.
+
+The metrics table is made available as hexadecimal sysfs binary file
+under per socket sysfs directory created at
+/sys/devices/platform/amd_hsmp/socket%d/metrics_bin
+
+Metrics table definitions will be documented as part of Public PPR.
+The same is defined in the amd_hsmp.h header.
+
+
 An example
 ==========
 
-- 
2.25.1

