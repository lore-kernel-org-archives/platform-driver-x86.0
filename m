Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E25EC32772
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Aug 2022 13:31:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237215AbiHWNb5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Aug 2022 09:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235972AbiHWNbk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Aug 2022 09:31:40 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA27163892
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Aug 2022 03:32:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BD4EknZy1+WLAF3pupJ813lAOUOH+2WmsMuLL4B/zU7Uu2B1SgRSM0xDU7idtrBMAi0XivVsowZP4LvvDKR7zYG9ert6xYxQMyxvqC0WTP6eoT6tsMO9tRZdmW+yUbB/s2YBw//Fxlbio96j3CNmbDOt83zvwKu8c0IQ9cCF0PpFDhksXTzGWMh5AaADGlhJNSwVg68zMIv3pUz9cIuTMLlsnN3OiNvG+UUMqft9en1pwtUx9jVH/gLYBMdB8+wfo1b80jKogyHUvWN+r9FiP42nWbx7S2Ej68KDbRljaOVg4xRVIqeVsXKvz1eixXweT0eGmbkVbpBAZCMTrckvRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxJRJKux4CJ18pJSBM7y9sKwo0sBWkD7jizDLQtEuiw=;
 b=isTfwDzL2F7mWmIMd7daEFturYIbZ1kRJVmQTlacHmDJkWZr7gqKBmuqnAM97JVK2pSQI0ussn+s+Wkjao+mHNp4BrOOsrXPUoPq7BHex6nEu7cGxWfrjDNfCIxv4pmpAYFZmy4foKcquvIB4gRadt3Xh4HtikhGVfxkq72V6JNsL3t9J+b2na4nU6vCsnkVxOVmOsBdpGzYplWRYoHt1AkQM0rf5xG8HoLNWmFlIhrXYYd9CxAEX9rX8xU+cNvZaUBJdZpgkbqJ675CUbrz2n6FH7tcwEoQ93pPh1TxYJLQZFcGCfPnmQplhjwvN6JltRghrlJ8cMBf4pIlAK+PJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxJRJKux4CJ18pJSBM7y9sKwo0sBWkD7jizDLQtEuiw=;
 b=bG8UXollz1pzhutJwnRovm4SHUbUvr/FNbbtsWyKAt7a2NdgK+H1sapibSrPXiaBmDA1zY6Pgm3XQa4lk2YFCmrUOUBnGcKhNBF8GlN8YcQHaYsg8gPsZHwqiGpFtSQqYy3wKCsj6tZ9gUw64V7V8DxKQOnwEwYMVFzBPLNawiY=
Received: from DM6PR02CA0072.namprd02.prod.outlook.com (2603:10b6:5:177::49)
 by DM5PR12MB1369.namprd12.prod.outlook.com (2603:10b6:3:6f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 10:29:49 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::7b) by DM6PR02CA0072.outlook.office365.com
 (2603:10b6:5:177::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22 via Frontend
 Transport; Tue, 23 Aug 2022 10:29:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 10:29:48 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 23 Aug
 2022 05:29:46 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/4] Documentation/ABI/testing/sysfs-amd-pmf: Add ABI doc for AMD PMF
Date:   Tue, 23 Aug 2022 15:59:12 +0530
Message-ID: <20220823102913.4181217-4-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 387f8fa5-a4bb-4b5f-55e5-08da84f2680a
X-MS-TrafficTypeDiagnostic: DM5PR12MB1369:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2W8LRZW0LkXSpVyzObOblqgd2cRAgcxMr/ELTs8p5hBU04JhgmnN/3WrivBfvjVNXU3eLogXeSQD1NopZPgZ/bSEpqsVNgYrbQxf2tvBKlgNLYGWiGnuqQevq/ImOTLQFd+LbmuteQaHHsxZJFYQzIQmCz5rceDrIwfOTm76Ue8dQldXek2Xr84a/lbuwzTt3eTS4US1tr0oh58P5T2mEOCshM+7jwruKSbpX6AZZ4moLmsAswQBM4hGY7Tw0w6YqBPz773TUCxqsUcIU/lPSHo0ODF0fqWDcXeYA4OdTLqu9tWR3HbpgZs/T/pDMBIY0y9BFsAf1PS21k6QCeWg+Erp1gAyfaxofac3Cj6TmwqosSrLftn420pnbmybk0NXO4mebrUJnYrjjAl2hL9SOl4HQs0lzHNX/6TASVpGC7m6jyZZnSbLaEKG9d5QPstW7XGlPcvR/pWi0mRgrjQ7vAgcp5MyZXup1XLiARMsluzBLFu2toq/BLL+ayB4yYxEORX2vnBJoRP5ShArodnZPElzMFh41RZQPUjH5SQGiJ4UTxUgxry44c07PY2FAKRXFAGEaRV8djpI3PO4ZkFzcmwptMlVBdPA5kfk7cURkkn1w+rc1otftSXQ+LTncOU34EwE8hheyohbZSSylEUsPAcYMLSRg8OomZyUXXT0EPqilh82oblQyvtOtCdhHrG0QWfLm6l/STy2yIkhn3RDeLooBACjeDeteDJPWB47Umsr+tIeTnFUz++umzHYQgYc2G0K/FOhiwQe4zCou0Zb/WWmNHaLhdJjs2mOJudWPT02HcIQbLc0ddxzbPGrpGxg
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(376002)(40470700004)(46966006)(36840700001)(6666004)(41300700001)(7696005)(478600001)(16526019)(47076005)(26005)(336012)(8936002)(1076003)(426003)(5660300002)(2906002)(2616005)(40460700003)(82310400005)(40480700001)(316002)(110136005)(54906003)(8676002)(70206006)(70586007)(86362001)(4326008)(36860700001)(82740400003)(186003)(36756003)(81166007)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 10:29:48.7868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 387f8fa5-a4bb-4b5f-55e5-08da84f2680a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1369
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

AMD PMF driver provides the flexibility to turn "on" or "off"
CnQF feature (introduced in the earlier patch).

Add corresponding ABI documentation for the new sysfs node.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 Documentation/ABI/testing/sysfs-amd-pmf | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-amd-pmf

diff --git a/Documentation/ABI/testing/sysfs-amd-pmf b/Documentation/ABI/testing/sysfs-amd-pmf
new file mode 100644
index 000000000000..5935dc549185
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-amd-pmf
@@ -0,0 +1,11 @@
+What:		/sys/devices/platform/AMDI0102\:00/cnqf/feat
+Date:		July 2022
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:	Reading this file tells if the AMD Platform Management(PMF)
+		Cool n Quiet Framework(CnQF) feature is enabled or not.
+
+		This feature is not enabled by default and gets only turned on
+		if OEM BIOS passes a "flag" to PMF ACPI function (index 11 or 12)
+		or in case the user writes "on".
+
+		To turn off CnQF user can write "off" to the sysfs node.
-- 
2.25.1

