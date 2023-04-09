Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9CCC77B6E
	for <platform-driver-x86@archiver.kernel.org>; Sun,  9 Apr 2023 18:54:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjDISyo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 9 Apr 2023 14:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDISyo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Apr 2023 14:54:44 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2058.outbound.protection.outlook.com [40.107.212.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D042C2D49
        for <platform-driver-x86@vger.kernel.org>; Sun,  9 Apr 2023 11:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lk4DLL8SBSdtc3A6Gqu0ylw2+v1g7N4DEj7mDrw4rlJcwP1IXefogsGJmNWw9noGCFJ7zmq8TQnyjaa+VmmgI0+us9WrcAB7EIw+SoIVBtaF0Sa/xo+Kzh0cJF6LR6ho1ZSgug/amEheUMg31FCCcFid4wtgBeRZnFu6t6yFo8GTLKPr4lJADKegEG4NRapCCURP2sMsmVnmsmdy6y486fxzLSgQf7bA9E+ZAQV4I6Q4BJB92mr/8mxwt0vtQkAhUo+EvmlhKbLSv70ZfXiEaWS+I6lp1VqqUm0b4/l62KL5VZzT1ICiDtoAUE0lyUJWr8ySLdgo9LE4cuEfTwKkCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwnGmxsjcuBJHFbTuk7gsRLekRwM0bTqh7Gacvse+r8=;
 b=MUgA1rjgiglHz/6oDsmKDHV/HB6Yv2Azq3+05EMitgYjat2mY4YNDB4L9VGDq1kivG4XEVFLWxcEx3QSWQFktmmJMipDfPs1oi9VnZAnlIUmgBZxmde+gWmoxZIymc5qSdIHL1yqGgq+auu7S9WkHMiIU2V4/IlNN8MuaSOvmlPgDU5Cr8NpWaq6xFF6ROKte6AzmO/iUakyW1YBLWP+/Pyn6hwu28p8Fsf1PonnY3ABP6YkecbZT+HiyWhdqsoU7XzapZFnmAm95MKpm6nhsdFJ7nPNceWlFfnBNTuDt+9ZK3v4ewg4YKghL9jHv+COZurQI8ufp+5Nyccq/zWn7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwnGmxsjcuBJHFbTuk7gsRLekRwM0bTqh7Gacvse+r8=;
 b=psk0pBn3G9hG1zGfctMCEtrh03r/En+39OCfdmZkIYL6b10beh1D5YJ338+EqVfIM3UEBVLIfj+XoU1E4DpU6HGu6ZqCSbyik+cqOTRb0oLEGuWxf1xtL2Vo0rLq7HEKTnDC8SErussbGHgh4bCA4nv1RQlewZJIVFOopC38nFw=
Received: from MN2PR16CA0027.namprd16.prod.outlook.com (2603:10b6:208:134::40)
 by CY8PR12MB7415.namprd12.prod.outlook.com (2603:10b6:930:5d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Sun, 9 Apr
 2023 18:54:40 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:208:134:cafe::5c) by MN2PR16CA0027.outlook.office365.com
 (2603:10b6:208:134::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35 via Frontend
 Transport; Sun, 9 Apr 2023 18:54:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.30 via Frontend Transport; Sun, 9 Apr 2023 18:54:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 9 Apr
 2023 13:54:38 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/8] platform/x86/amd/pmc: Updates to AMD PMC driver
Date:   Mon, 10 Apr 2023 00:23:40 +0530
Message-ID: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|CY8PR12MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: bceda09b-2ff3-478b-f9d4-08db392bdfb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZElRuG3ohVYgwDR86HEpRudbHFIRzJWV3TaZMNCBSGyCcAdZ2pgU5eKDNYa5URgP5/p6xrBZxC1wdLMR+5nKngPnd0Ip/BOS0YeLJ8wr5NK70F1lnu9R6T7MZeL7CDa0iD7e4otgK0ZrRHvMkDZvP8jwz4VQnajPU4vJLBBOpfV8byALPe4Akpqp6xGAsncPAGWZllBeoNC2+hDDYe8dccT/Q1RpLPIlJ73KKqhC+aiDqt3fsChjpinbdnhvU5LyH6oSxK1XbKQZRcRGqovN6SapqOoo/w83iLoNVAfpcX8l0C7a+PY3ofikkPBH5OI/CG1Vnul7JL89NERc45wH5/SivXS/5WIlRGkflJZcTLp0SGgCJ1ouudJWuvjImxHIm2QYeUjamqJPp19zfZEyvwsqwkM2LBdy1uW5cG8crrzY1i4ujfnfxuhMNseoAT+i5nexCaXSamIorgUXjpjHdr0JSgj7pLgwIh+uqlUna0gp1rIl12rdI3k/Q0eU645iXooPIJbKDtfH1NMk5Wr1xe2Hy4b/s45G8MwgSbKMHtNx0vXvvJk69SWUmWg3zPtSt+IhVATNZz0miwFcKNkr4v3OdYeT2L9cw1lw7brfHbK4/y7gPim82sQUtWyPaLLJvqBtsie0APOIzycaYNauyEb1NfqCTzEVbyJEYHm5oQ93JH7lkfJjkV3mFQEwJO/Q0TH2iXDQJm6fx82IYtr/s208YjW0yUKeyC00LRkRWhk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199021)(40470700004)(36840700001)(46966006)(478600001)(7696005)(54906003)(110136005)(316002)(1076003)(26005)(16526019)(186003)(6666004)(2906002)(4744005)(15650500001)(4326008)(70586007)(70206006)(5660300002)(8676002)(41300700001)(8936002)(82310400005)(81166007)(356005)(82740400003)(86362001)(40480700001)(36756003)(40460700003)(47076005)(83380400001)(2616005)(426003)(336012)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2023 18:54:40.2013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bceda09b-2ff3-478b-f9d4-08db392bdfb2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7415
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch series includes:

1. Fixes to Picasso from Mario
2. Change the SMN pair index for driver probing & STB init
3. New command ID for getting DRAM size from PMFW.
4. Change in smu metrics table data structure.

Mario Limonciello (4):
  platform/x86/amd: pmc: Don't try to read SMU version on Picasso
  platform/x86/amd: pmc: Hide SMU version and program attributes for
    Picasso
  platform/x86/amd: pmc: Don't dump data after resume from s0i3 on
    picasso
  platform/x86/amd: pmc: Move idlemask check into
    `amd_pmc_idlemask_read`

Shyam Sundar S K (4):
  platform/x86/amd: pmc: Utilize SMN index 0 for driver probe
  platform/x86/amd: pmc: Move out of BIOS SMN pair for STB init
  platform/x86/amd: pmc: Get STB DRAM size from PMFW
  platform/x86/amd: pmc: update metrics table info for Pink Sardine

 drivers/platform/x86/amd/Kconfig |   2 +-
 drivers/platform/x86/amd/pmc.c   | 240 ++++++++++++++++++-------------
 2 files changed, 145 insertions(+), 97 deletions(-)

-- 
2.25.1

