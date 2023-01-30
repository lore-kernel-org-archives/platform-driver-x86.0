Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD560C54EAA
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 16:49:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236704AbjA3Qtq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 11:49:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236494AbjA3Qtp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 11:49:45 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ECCA3D0A4
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 08:49:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wl0M5Bk5EjdsgRbECd7gJF1J7eZOapx9DF8/CRDDxY2Z0McsYHEG1BwJhmLOelXXM41EVh8Hyt7tr+iwSo5lgk87zgFuxLhRGmu7jmn6UNN6Bk24cJbeTQKAgUt/2sVaaqEIb1zQ1M2dSZNaHs+/rJV53MMTCNoc3Pii3oK99pZ3nNeOI9Orav9M5CRVXkhKekd0nK+Nip9/vZTCtFvLjxv8S6t+n+Z3zmcsPGFio2xN0sjRqxthiCizVbSE5RlPleHZa1mhWptvvGntQ1GhgLIsgJJ2KpDHJ0moZU+NX5osa7JLATBTrm2A6EhPQINu9W5BxnUKeqbXAHaYIwURQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiLjLbf25W+tnxMUwClA/DXcLG2Do+dvrejjyGvoOsw=;
 b=JeBbAIvClc2lz3gXLeQXBeg2Bjz62adzXrImjcgo5DRpClzvEI5cOXXbQuW1mOuF2rfZUAJ1FAAVzbJ1vUuMHpJ1xJF/DvewOMNoX8MMLRTmlsIKbglf+4OkIbj2h1u1k1/btfX35FDg0yDmSu4AcUwVEBlzyBnpoLkHymkj04Wcv4pDTS6hjFiEFgzaVeDXr6QZDaUo1Tg1z3uFaDljyvnHcMY48X9pAoTIoI7wfrs3vW1MpKvkqlaXmfbZsF4//XRBeLYlWlxvN+u/MkFo5DWQrIPiGgng0d/b88OK+g2KHpIVeEw10JlHPHo1xUyeKh04X2Mo5Pgg9aEMf8T4rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiLjLbf25W+tnxMUwClA/DXcLG2Do+dvrejjyGvoOsw=;
 b=DQO9NpG0PglyEzJCwj104OjFptSc8sp5S8oyF243OKNixRbC7LD1GlgG2iZbVE2tkvMbQB2X/fPZ4PJpwSoZjZEhZ/yTpktOy4j6wNeSms6cW/ZfZxNsZ4u/+aTR/uihkXw/5ZuCI/dSpa6UYrwWGvYsfGkS1DRH6l8l8RVJ598=
Received: from DM6PR08CA0053.namprd08.prod.outlook.com (2603:10b6:5:1e0::27)
 by DS0PR12MB7802.namprd12.prod.outlook.com (2603:10b6:8:145::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.28; Mon, 30 Jan
 2023 16:49:41 +0000
Received: from CY4PEPF0000C97A.namprd02.prod.outlook.com
 (2603:10b6:5:1e0:cafe::35) by DM6PR08CA0053.outlook.office365.com
 (2603:10b6:5:1e0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Mon, 30 Jan 2023 16:49:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97A.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.17 via Frontend Transport; Mon, 30 Jan 2023 16:49:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 10:49:38 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 3/4] platform/x86/amd: pmc: differentiate STB/SMU messaging prints
Date:   Mon, 30 Jan 2023 22:18:54 +0530
Message-ID: <20230130164855.168437-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130164855.168437-1-Shyam-sundar.S-k@amd.com>
References: <20230130164855.168437-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97A:EE_|DS0PR12MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 120cea53-5204-4b22-6cdc-08db02e1fb39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Id+7wFdgROdSMfHqZ/K+puTPCgmNUdxyPq8XC3Yva9jm5FUkGGMbSXmhTypN/6l7mXRkU4TTz3mo8S5a91fPVA8lbGuWMo4PuBC2sosFSnRwY5xONvcErwVuadrfXNNcZSi71MsTHDoRRD6O6PTrKv3lDRbJkrxePGqxeV7xHqEbc4CTDdaN4QtWmHhVeiU63QojuPaaYTtjRVSJUncLErKpnBTyUjR3fgdWt9iH82F6ZF3qQmb25dBet7LMC0sFVwfo364GpsXAViRZdtg6/coVGOSicuGgmfIPYbW0Y956gzoaPzOuvfFcRkltfuuqjKFFASzdVhl6iT5GUng8Xc3/rXVbthly8ZXAn/t/BNZ2R1cFi9Np0TcKoM4jb+YJ1mYVe+N3Vh3q2dMh2CP31ot3tuqPGRh8xLpc56YyA9ytIwrT7ahF2jxmfLq+mPnTcamHjZm6m4dg4jKM0HWN60FokgeFY5oPdoqrTaG0f7icqPp4MKdhM2JUVpEh+cGiuKjDWB22PSRWtElx4hXqqeDdROkkDDs15J7TpTHJR5lUpbII8MTLMiWvtrM4Sai8Rma6fws1OriVmiDxEr0ODdxxbZdhuQ32kQ3ZYJRfR7Pl4FkUh2f/t+77iOVd6HKxFeXqkEmoZfPKdHKVs9BUTetCgzGaxX6vCX7liv5wQJzt0jHGoHset5NRHN1JuVNHH9LALVrPdt+c7VlljXvWThgNcQVQPJpoTDG8EX7C8Qk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199018)(36840700001)(46966006)(40470700004)(36756003)(2906002)(6666004)(478600001)(110136005)(54906003)(7696005)(81166007)(356005)(82310400005)(86362001)(41300700001)(426003)(336012)(47076005)(1076003)(4326008)(316002)(70206006)(40460700003)(8676002)(8936002)(5660300002)(2616005)(40480700001)(16526019)(186003)(70586007)(82740400003)(36860700001)(83380400001)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 16:49:40.7705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 120cea53-5204-4b22-6cdc-08db02e1fb39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7802
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Modify the dynamic debug print to differentiate between the regular
and spill to DRAM usage of the SMU message port.

Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 4073ad9fe63a..9c8d04a591ec 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -590,13 +590,13 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 	}
 
 	value = amd_pmc_reg_read(dev, response);
-	dev_dbg(dev->dev, "AMD_PMC_REGISTER_RESPONSE:%x\n", value);
+	dev_dbg(dev->dev, "AMD_%s_REGISTER_RESPONSE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
 
 	value = amd_pmc_reg_read(dev, argument);
-	dev_dbg(dev->dev, "AMD_PMC_REGISTER_ARGUMENT:%x\n", value);
+	dev_dbg(dev->dev, "AMD_%s_REGISTER_ARGUMENT:%x\n", dev->msg_port ? "S2D" : "PMC", value);
 
 	value = amd_pmc_reg_read(dev, message);
-	dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
+	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
 }
 
 static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
-- 
2.25.1

