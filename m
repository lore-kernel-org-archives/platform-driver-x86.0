Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44031ECAAD5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Sep 2022 09:12:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiILJM4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Sep 2022 05:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiILJMz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2022 05:12:55 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FFAB19029
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Sep 2022 02:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NB94Q/Fa66mW3eLKf5OKRFAhaD5JgQaRqyMCEbuwUXAwOBDBTrlwonNhETfvnNjiEz59TlrxR63ALPVFhkKqWCHL0cGLoGTinj8g2hDYSIgDiCim+Z0lxNluKgPkw2ZnCx7iosi6Q1PAmgVULjVqDwSBO7wOE/oenkj4HWSx8oGmbC42EFAff+SKCsOCxxZVYPqlVNGDz+s++8cSvjRsGeaqds/y7Xi7cM0l23QCCF/yXECj/iAnA9Waw10nWHnDJfO9VvZH0huZb+dvFwGScSrczibQJ2oTW/oBpGzfqfAb9lp7G3b6X2k+2T5L4Wjp/+WIrWQl2wEKDcyoAqMiEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSrZWa7TFboXiYyLf1pD93Q+Yo/QNpwdD8nThWkj1Bc=;
 b=bT9kuo7F+NJAr4PO9plA2hngGv5w1JoYjlsey9DwYfaAT2oJXyeFtFtfkzLgLmeF1gW/PkhvJDGcxBFYWYgqqj+pvDk/IVCIdqLZA3M8Zaqfni/6jKdgB8lKCn6WWsO4xLb6oofZB9HWzIafqxEIhKEyI6ErgkabYZkRjNX6UgnBhIWSSmqOYLJyw3xYu6pDAUyW3GQHo3VfSNgIlqkRda9Bb8UH7/HhhovQdd+e9rdxnANL/2FiLoctk6n2e94NrYoFdiDhRPxSufzajjChGbxxUYtUUCRnhYSj6x58YJEhhdN6qdUpD9r2nBXRt0pAnU3KHm/EtCPj8Fp6mKDWkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSrZWa7TFboXiYyLf1pD93Q+Yo/QNpwdD8nThWkj1Bc=;
 b=unyJqPIEfe8Zk2JKNHbx5X/kYXul7zbC5hLIXz+ZlhPHL98JZpMxDtlKD7UoB5J63/TEUKRQgMynr1sKmsvNrldKx2uRuZ3zbo6jGGtO9PcDBBHCFlcKpS0cFTVS/nyyrJzaRkhA9nsTSWQyg87jc4LgXF4rVarfm6xL+T+rJ48=
Received: from BN9PR03CA0964.namprd03.prod.outlook.com (2603:10b6:408:109::9)
 by BL0PR12MB4851.namprd12.prod.outlook.com (2603:10b6:208:1c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Mon, 12 Sep
 2022 09:12:53 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::e7) by BN9PR03CA0964.outlook.office365.com
 (2603:10b6:408:109::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18 via Frontend
 Transport; Mon, 12 Sep 2022 09:12:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Mon, 12 Sep 2022 09:12:53 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 12 Sep
 2022 04:12:40 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <bnocera@redhat.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 3/4] Documentation/ABI/testing/sysfs-amd-pmf: Add ABI doc for AMD PMF
Date:   Mon, 12 Sep 2022 14:36:40 +0530
Message-ID: <20220912090641.111658-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912090641.111658-1-Shyam-sundar.S-k@amd.com>
References: <20220912090641.111658-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|BL0PR12MB4851:EE_
X-MS-Office365-Filtering-Correlation-Id: b729236c-0872-432f-c387-08da949ef94e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LxrnFxpVSKrATqb/1n1jxZWPlCBsV/dnh+i/0qXiQeHCcxczKpk9N8IgUeVCQgFTtUOYam/a/103hGfJFb63AWgSXskkXWPJ9avtBFmhL9VrkopsftbBKC9FpiKu4gY9eXqPB//B0DVGDjLD6oqqJfrGe+NnPf064y2q0nH9aXkxvlm9K22jmWAps3fS94PDFPknBEnUwEDXNyfhMGdHcJlizJjMk0a0Ea5ZypHoE8jSiufS5/xIS6Z6SW6mh5nfLKHnjO+ahW1buDxw1HoAt3Ls7/NRt1SmeWAxVJRC+Vz9TfRVR9XE6nx1it1psJg8WdKiWA0EStCbH5om1arov6D3uEixEvIm1+wEaCmW1f8thX0oEdwl5774byX1gLPZWiAWmKeHIeyTld6Q0qxuGVrwq5MDg/Ji4pLcCu+zLeJvyEQzvnAGlGYToNQFgWHNfwn5HRzLKyGimZQs0KuBCDPaCqUej3EhjW+271br7y68xqkdCpTdgpVsQjsG7zLzXdniTV3yRDX3cqIAvsIHvkywYrqWkN0gLX6gnvt5knRcUMoFp+J+p6AHZ7hrkn9nPcARDeS9N625XDSeBVVyvu/5KqshHFEQwFYoY0ReENWpGpdO1LRIvg5krd0dS5OdWwFSGBvCr8yQqov925eTX+aeDMVzrQ1wrrnaN9HT8pLD9lBRgTddKP2yOJbC3UkCnYNM/DUOjs1vGOMec96Mb4iVDLsxiMjJ5KBPyMW+cKrS6krpAqmD1YA84x7g4KY2F3n6xyNGJdeVvgnPuBSXxqys3evBlehgg3YB3eZrtgKEaKPVLqFGQq42mGcfIZ9h
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(396003)(376002)(36840700001)(46966006)(40470700004)(36860700001)(40460700003)(81166007)(356005)(82740400003)(316002)(110136005)(54906003)(2906002)(70206006)(5660300002)(8936002)(8676002)(70586007)(4326008)(186003)(16526019)(426003)(47076005)(2616005)(1076003)(478600001)(26005)(40480700001)(41300700001)(336012)(82310400005)(7696005)(36756003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 09:12:53.3997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b729236c-0872-432f-c387-08da949ef94e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4851
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
index 000000000000..c75d7426c2c7
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-amd-pmf
@@ -0,0 +1,11 @@
+What:		/sys/devices/platform/AMDI0102\:00/cnqf/feat
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
-- 
2.25.1

