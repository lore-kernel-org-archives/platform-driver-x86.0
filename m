Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB630CCA485
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 15:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233343AbiGLPEW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233589AbiGLPDR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 11:03:17 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CDA9C1656
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 08:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjfBJ+DYuo4ltaYb7dHOQMoa8yKJI1z6aVNJFY5VJeqyEWzM8KgTUThuVDF0K6EAuKhNn0i4Rqlr10Cb8YtZpkTy5B6kO388VV/X0ddSpLdO+uw2jSjZVbNCbSpiN9+AUwnGzuuiy23p1Bz6HE4e4dBmH8lExUrgfSuC0ygyRx7ufl7GVAile0/frVMw9mQYiqcBeBd45llDn3zHl4GDcfvMa/C8QU+3XCGh4wezbhS60TYdsLlhQZNhPLQ6rKxC3e3QQr+UHcv5BlcBRxWWzREuCPVHGtsjbg4ehHhPhUU0VLsOcV5iFJnXv4T5HWDBn182KnfU1zYcelflHTU9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxJRJKux4CJ18pJSBM7y9sKwo0sBWkD7jizDLQtEuiw=;
 b=IEhljYUvgTLtntC+McP1lMSokKqn5weT7WamcYdiO4uj2NMG7g0eyQ2g3wi74Rtj0sUzfS1EjZHLbRa4xZ5VXsTBwZd9JNUqWlul4a9iaWtT5rlBhRjhW9D8UWOVc/Z178njjMJJH7yPHQFzrlyxgAuvZh+xSoL7KVTiQFWgHqqTU90/cVzmVEsG9t7B+LIaiu7cHnTM2VrqpdBVifMX6aLw0OQp+2yurFNg2WfRsPLc+CRvP9xbYnoYfjEundKCLCyor+lU1ymMqGzNFZ4TUGT3HjcZiZ7Oh2DpoVrJ2K8LXKCYM+3oQ31s0E9S6DggBOUWeJxDZJy2nkBi8tkPMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxJRJKux4CJ18pJSBM7y9sKwo0sBWkD7jizDLQtEuiw=;
 b=lQDfeE5LmCu2WT6Lky7SaNfd/izEnSkbgEYtr3Ui0+CSyfRrA163kiItoxuacjtnRnjnw3ktaCd8WjFspc7VNIm/3z01MYUM3wmcXJ55NJgouM+VjQdfGy76qCQ+Cf+ctQesmfKrGoIZ7GPCuD1Jr6EMn6/xIQNmEN4TQk8HTQc=
Received: from BN9PR03CA0442.namprd03.prod.outlook.com (2603:10b6:408:113::27)
 by MW4PR12MB5644.namprd12.prod.outlook.com (2603:10b6:303:189::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 14:59:52 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::c0) by BN9PR03CA0442.outlook.office365.com
 (2603:10b6:408:113::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Tue, 12 Jul 2022 14:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 14:59:51 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 09:59:49 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1 11/15] Documentation/ABI/testing/sysfs-amd-pmf: Add ABI doc for AMD PMF
Date:   Tue, 12 Jul 2022 20:28:43 +0530
Message-ID: <20220712145847.3438544-12-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: f5fc5ee6-a37d-4f2e-5de2-08da64172c89
X-MS-TrafficTypeDiagnostic: MW4PR12MB5644:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jWmM9wCItTxI1Jr65uJCNFKjRS6Kclwh9AZ5QGU8FRkLxijYKfi3rsFrEG1RTPH5syvjNB4FU3XfSUAUC1nXZeix2dYQmWQ1WLvE55jfM20RwuOBATpDKmWtya5gSuqiv12sDWF39IOAz0vZVNGMmpO4vI7dC/j4C7ZknoUSZORSaEmQ73DYhpTuAYLnTyyY5AYff/PBQhGubJZR/W7cY6DiEKJbqQwD7gZwdNjLbnXvPV3IzZfeSzOfA5nAMTTFaiwa6C3s1gNUDnW9YRiPLD9yx43cduX22fZm1bws8BG0mz+so6s/7GdH2niDZiWRWQnX/DG67BFwWwYmXFnoEj4qsxXZUwSCk0r6IxKDNmab8tF/cXIXMm3Czw0OKZwjsY1aISC2Hpd/WVUb5k/vHVUvI56fPGy6oGGMMy57d8pQR+HA95iVU1Q3AFquPwGO3U+LA1mqMPJjhE6WTDv3GTSGFlEFdn1x5SI4yJgGhyhJDLewv+L81ZP2MYMvpCyYx05OXFziy/D4K6usDUWo+SU0nSQg/9Qyo1Ha7BGWR/7uo6c8TVOzmKDX2aGdFI45VrhT5QMxuOUvFN3vqpaZij1db195M9Q63vkrg0L8cBjw2RgZREB67S0EENIF0ovYgTnrr7TI6nLy3XA2zSgMKI3KqiwNQjmqZNxdyUGJLj5ABPt/e4Ng4RqLEfoo33FedEJfhvaISGjfR2R0lF4NGSCPJ90NlRCfiRVPwIUXnY7S9yd67/eZUadMftcTZMg2WCGfpGE0z4me4zg6bIFdw049FZinO9q7y7qxktZx1cd16dm4vPWmNo1Kx9ewGbJ0e+10c8MR2dZpi/adBhwnuLVAuEQbJ3Qv0cmXDeUVews=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966006)(40470700004)(36840700001)(54906003)(6666004)(16526019)(41300700001)(40480700001)(478600001)(82310400005)(8676002)(2906002)(110136005)(316002)(7696005)(70206006)(86362001)(70586007)(4326008)(36756003)(26005)(40460700003)(356005)(5660300002)(2616005)(82740400003)(1076003)(336012)(36860700001)(186003)(426003)(81166007)(47076005)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:59:51.9790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5fc5ee6-a37d-4f2e-5de2-08da64172c89
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5644
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

