Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DB3C71147
	for <platform-driver-x86@archiver.kernel.org>; Fri, 18 Aug 2023 12:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376973AbjHRMwH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 18 Aug 2023 08:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376980AbjHRMvy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Aug 2023 08:51:54 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398361988
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Aug 2023 05:51:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpzuRaDZV48wN8obg3RdBqyHFTOKFc6DmC2156xHVqF4je1dtqIprbXyeE75URTqACTIwAamu/cqgPSp5Qp7OgyDlGDwcJS9GR8H8ghsNgInJpXFarkj7Oi9MyP1UbWo1voRNT3vJXsSCAEvUUyPc1vrqY4fwgqdKSET7D1EGQiKyLE/z/syuTsBBNW9jKAFAQmrTP1kdPamTAwzISexu8W8o0tVn5ojHOGAzMJvrwu1oNyHWlP7XVEyHe4vF7ybSBoQpq4Xz3CWXYjpO/eXRk7lh7J7/AMRDc7jf5xURs8A87F9el3KJcX4TJdKf/W6GBYkTqZCdjZKOu3edxqNXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PqIuTXyNJlcNz9ImjiTDGwK7QZnfJpRuSuy0BRUm+4=;
 b=Y470dXZMhpXFiUYL07KDxzq8LP9Yt9YO9OSnKbIY9fijRd9XjkWCdZ7HSYx6e79dS/5ZHovNIGOSXpvFihPQ6UIgsdL0IdsGEh4dsBg38NU9iUANAyM5v0vQYmLwJ84trVYbOSgkwQFlRfYYX6iT861JcGMYMn/Wosb8Gd1h14Ih3ExTY3zegmZquUc81JZImd8Gezlj7/IbIrJirkpPqHD6ZNQRI6EfR5JiiWdwmoOEuDkgvMiPn4EW4oFJNHwfF1ZkevsgeJUeqQDQ8AqxMkW++mLlTiGJexrc7z/1+L/FhSCoJzFHjCKTBcSNLfXnYW5kkOcugApsFuS4dt706w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PqIuTXyNJlcNz9ImjiTDGwK7QZnfJpRuSuy0BRUm+4=;
 b=DCyOTkS6L2iPNX/o6py40WDtci6e5xRM7Ip1smTH7KktkxCXeEwzW5Y8OsRCh4FBpdSMxcuiVuVD1vnW3OUPE9AqnLedgrkAoChFSI7pE1cvE5lbHKXc+rgye+SFOuH1UR9c9FgbJtEGfLsUB6mYP91XapVRoqStIyWWm1pXTas=
Received: from SN4PR0501CA0105.namprd05.prod.outlook.com
 (2603:10b6:803:42::22) by BY5PR12MB4306.namprd12.prod.outlook.com
 (2603:10b6:a03:206::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 12:51:48 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:803:42:cafe::f9) by SN4PR0501CA0105.outlook.office365.com
 (2603:10b6:803:42::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Fri, 18 Aug 2023 12:51:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 18 Aug 2023 12:51:48 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 07:51:46 -0500
From:   Suma Hegde <Suma.Hegde@amd.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Suma Hegde <suma.hegde@amd.com>
Subject: [PATCH 0/3] platform/x86/amd/hsmp: add metrics table support
Date:   Fri, 18 Aug 2023 12:51:16 +0000
Message-ID: <20230818125119.1323499-1-Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|BY5PR12MB4306:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f1a7626-ef9e-4a1f-8b5d-08db9fe9e2c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6EwcKmxdVMDNLeqiiFh7GmJoJoyiwk2Xh+bLLHAKoanH6GI0UlCSd+ANFpAYcHOKkufzxMl/eadhxHoCUz+iPBsWlAOvI5IEFq8ZjAy8/21dWZskGR0nE19bbN/YSJUTQ1EuF3/eOzlqUY31+iLjaWeEM1WdT3/IacQaNiVtqRcX+Sc4KVZb0OOYakNf9nFf38vkf/xZfNyPunF4u4Le98IvFhyDDQd5AxbYhnYz+BONW3kJ4IIeYbW+kI9pRhLjChBF+eaj71MTCkYbnO7N/TzbPGPNKRWjKzy4V2YK836ckFx9bGEHd4PDx14+GbyFB7PP9AA8Lphv0xC3wnyI4udNBOOKf1dMckitZiJMn54S4tvpaNAGnOWS+axiXUvwcv9FAbHU39TF0tScmYJakNGwWzgmpsT9eqvnxZFo6Nx2a1OzPjnHc1Z9BD43sayP/yWsT2dqGzpeHGmQs1lgXScyJapwJXmiGJyxjqk2gVKPAaYOFWa5QyLl+K0QHUnwmYyqgtfpjAsQQS4NkN3Abx46iWYOZwsaDgwqY+qlgFLC52PwEd/0SfuCeofTiwM7vjnirlMW1CNSmbA5fRZKng4tWQRxO8bL+p+W9vFF+xLBcHGzaVjkU+g2GKYhSOprGSDpRVy8AB0NqdkjfXlIvRRuHZjnxBrH6B5Sqzbhwn12QJ+pYVvwwFwzmfStck82QFJeROzzNtWYGZjSFYuOR/8THP3lZBmPA8NCLHc6v5V6zPSbXghcltPF4957t1jI5DDmNR/teysP1ROCkdJxPA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(356005)(40460700003)(316002)(2616005)(36860700001)(426003)(1076003)(336012)(16526019)(6666004)(26005)(7696005)(47076005)(83380400001)(4326008)(5660300002)(8936002)(8676002)(2906002)(478600001)(41300700001)(70586007)(6916009)(54906003)(70206006)(82740400003)(36756003)(40480700001)(86362001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 12:51:48.2963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1a7626-ef9e-4a1f-8b5d-08db9fe9e2c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4306
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Suma Hegde <suma.hegde@amd.com>

AMD MI300A processor supports metrics table, a structure of data shared by the SMU to the CPU,
Which provides a bunch of information in one go, this reduces the latency in telemetry and
adds atomicity to the information.
The following modifications and additions are needed to support reading the metrics table.

1. Create a separate platform structure for platform specific data (such as socket index and lock).
2. Create binary sysfs file for metrics table which can be read by userspace and decoded using
   hsmp_metric_table structure defined in uapi header.
   	2.a E-SMI library and esmi_tool [https://github.com/amd/esmi_ib_library]
	    will be updated with API and option respectively.
3. A general patch to modify logs to specify failure reasons.

Suma Hegde (3):
  platform/x86/amd/hsmp: create plat specific struct
  platform/x86/amd/hsmp: add support for metrics tbl
  platform/x86/amd/hsmp: change the print message

 arch/x86/include/uapi/asm/amd_hsmp.h | 109 ++++++++++++++
 drivers/platform/x86/amd/hsmp.c      | 206 +++++++++++++++++++++++----
 2 files changed, 291 insertions(+), 24 deletions(-)

-- 
2.25.1

