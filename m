Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCAF2C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  2 May 2022 19:12:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232655AbiEBTQA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 2 May 2022 15:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232124AbiEBTP5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 May 2022 15:15:57 -0400
Received: from mail1.bemta35.messagelabs.com (mail1.bemta35.messagelabs.com [67.219.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA20B7F
        for <platform-driver-x86@vger.kernel.org>; Mon,  2 May 2022 12:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1651518747; i=@lenovo.com;
        bh=+f9hvlYfgy6vlh134yhwjT5mkRs9pq4ThTiQT+6nbQY=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=xZrzAQ8eC6btmKeVeFasR3SXf2dtsDwDNzmXcXJX60dyYeVSqiNOFbRsxcSGwqf3K
         5+GfPT5IxUpWypMqZlzzp2sf6XZYVmHjdPcA9eB0OEWywOjPElWWlIH79xwap4vuMn
         vhWo8MQNwCQsSrMUaWCH94Psm0QnQhnUILG1kZAlfItTlQ4IGfppAarDS5Z3S+jXm9
         38ZMG4hKddnENUCLrN6Edd8ahdXlO6CZOs47BPgKB9biPuoV94wyOPo+bd5rbPfZup
         wXoIx5Lqh51+g6C+9PoyX7FL2HP4jJjv7no5Yo/mlDBWpskk/4/tAjorjROA0Ug0cq
         kp8jCaLWwPcGQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNJsWRWlGSWpSXmKPExsWSoS+VryulW5B
  k0HhIz+LN8elMFlN397NaHJg6jdli9Z4XzBaH3k5nc2D12LSqk83j/b6rbB6zl9xg8fi8SS6A
  JYo1My8pvyKBNeP3pBfsBW/4K65Mu8HawPiIp4uRi4NRYCmzxIEjv5m6GDmBnEWsEv/+p0MkO
  pkkJs+7xw7iCAlMYZLYeOk+C4Szg0ni78dzTCCOhMBxRonuQ+uYIDKdjBI/Xp2CKpvAJNF0ZA
  8zhPOYUWLd5ndQ014ySly+eh9sJ5uAtsSWLb/Yuhg5OEQEZCQ+rPUEqWEWaGCUuLlwBQtIjbC
  Ai8Svjl1sIDaLgIrE5/WvwGxeAWuJ06//MoPYEgLyEt3//oDVcwqoSpzpegxmCwHV33+wBKpe
  UOLkzCdgcWag+uats5khbAmJgy9eMEPUK0v86j8PNVNRYk7jXEYIO0Gi598jNghbUuLazQvsE
  LasxNGzc1ggbF+Jhb8bmUF+kRDQlTh42BEinCOx5sxmqDFyEqd6zzHBnLxz422WCYw6s5BcNw
  vJdbOQXLeAkXkVo3VSUWZ6RkluYmaOrqGBga6hoYmupaWuoYmZXmKVbqJeabFueWpxia6RXmJ
  5sV5qcbFecWVuck6KXl5qySZGYFpKKUqetIPxe99PvUOMkhxMSqK8dWoFSUJ8SfkplRmJxRnx
  RaU5qcWHGGU4OJQkeM01gXKCRanpqRVpmTnAFAmTluDgURLh5REESvMWFyTmFmemQ6ROMVpyX
  Nm2dy8zx4MTJ4HktfUL9jELseTl56VKifNaKwI1CIA0ZJTmwY2DpfFLjLJSwryMDAwMQjwFqU
  W5mSWo8q8YxTkYlYR5O7SBpvBk5pXAbX0FdBAT0EFN6bkgB5UkIqSkGpheRB4qb535f4nr595
  vzVYzonZZbmh/Ni83I+/HYtfPiw7wTTRrTE8QO6vzaXHX0fYTTX3hHIlOO46+ab7wsq1N3eXz
  hIJHs8+kn/7qVRk2M2i3d9KDcvd5tT+ZLlw2MZ4vecS99o9FvdT5Z4c/TjTRkOC+OcukgHWb1
  9utSak3Dye8Uyy5b+dR+9v8mXgCW/PBhdpyfG9jfTfLC092TTsn7XF1XVKA051pSf+7ptqcv2
  Dlcjf5WOyrU/yrGJzn8ZezX+XdlPnzxtUFXX/kl9n3nNhVeyKfwyL8yiWNmDUf1bv3ik44MVn
  o17qzZz6ExyX8NFzcWPVfRE96g+0foaTeifqKJk/19S9Y7p/t2btBiaU4I9FQi7moOBEA9i5t
  LV4EAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-15.tower-636.messagelabs.com!1651518745!65899!1
X-Originating-IP: [104.47.26.111]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4792 invoked from network); 2 May 2022 19:12:26 -0000
Received: from mail-sgaapc01lp2111.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.111)
  by server-15.tower-636.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 May 2022 19:12:26 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erlNQ65YNRshpk0kcVeHnK2x1lyLOeADhGh1tCP62VwN0PFimtamXNhNWOpWDTjJqpeGGPNMnQqCKlzjSRdgcCFaDsqf2GaKO1pB61OdvEyCt+HvUHKXo4r2y2semtLBsWGcKWrLwD0CkrrtzMgonNrhZiu6TxIJTvBWs9CE3nSCADzKfSYkqj1w+t6n5MtdmFi4NCc55/4MinLAexa29yOnZNiX1XmfZWoPU2ZwNVkADe6lG3ou2wHE/1/54eCBcIs4QmqoEz+LZLdT8LceX+Khngdg/DcLSuEBHJ3GHb+5DCN87fReyOt+1t3wLE9ewW4nac3zO9UBf12K84ulqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+f9hvlYfgy6vlh134yhwjT5mkRs9pq4ThTiQT+6nbQY=;
 b=WhMGdLaFzcKoquzVZcOzpFjacD4sJ21X31Z0KlMsmzSTj2flQUKIaT0vmxWeQ8vNW71UCkYtFHTV7GzD9z1WGNwHNbEG9yTqvqlQaoSl0OCPm1Xetqcg9gNHhitDMB973RdvQ5P+akKLWwNdoxor+TxdM3tiKzRMBipGxUt0D/xNktjBO5+BghllWRjljnC2/YMfquOY9ZPlwPIq4udXcSBRdocX9wYDK3tEdaW6U+n16cZZyE4xetEmdlF7ux6/vssal6kdWKNGqD4NGIyWVYM1+VDHnSUl8+HCz50YklKXuG2bBiDBCtPGtsXEwlDGGzACm4OYATddBv0CDGrPXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SG2P153CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096::15) by
 TYZPR03MB6470.apcprd03.prod.outlook.com (2603:1096:400:1ca::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.7; Mon, 2 May 2022 19:12:23 +0000
Received: from SG2APC01FT0061.eop-APC01.prod.protection.outlook.com
 (2603:1096::cafe:0:0:a8) by SG2P153CA0005.outlook.office365.com
 (2603:1096::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.1 via Frontend
 Transport; Mon, 2 May 2022 19:12:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 SG2APC01FT0061.mail.protection.outlook.com (10.13.36.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Mon, 2 May 2022 19:12:23 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Mon, 2 May
 2022 15:12:20 -0400
Received: from localhost.localdomain (10.46.213.103) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Mon, 2 May
 2022 15:13:26 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>, <lyude@redhat.com>,
        <thomas@t-8ch.de>
Subject: [PATCH] platform/x86: thinkpad_acpi: Correct dual fan probe
Date:   Mon, 2 May 2022 15:12:00 -0400
Message-ID: <20220502191200.63470-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.46.213.103]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3fd242e-3e17-4b18-59a0-08da2c6fb042
X-MS-TrafficTypeDiagnostic: TYZPR03MB6470:EE_
X-Microsoft-Antispam-PRVS: <TYZPR03MB6470414CD788FDDEBB74E594C5C19@TYZPR03MB6470.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /cpZMrE6EgamD1cjfpgwusj50Nyf2b36eSUiX84mvfCRjWgagUBBX3S/4VoK3dvACleiG62SrI/f9pyflK1DyT09LdjDNGSRZob+Wy7d1AvBYS9Q+bzuo2BvGqPjg0FwmWwMwratPIvRin5u5QYE45LdNsNbFSBX+wIM/HIXC8Uc/DDrHIDPPKy8a7FjAczf5oFZzqq4TbnVEaHF1tKe3CzXYrzrh6NoWgk/8yfGKZG8Fg6QBkh5V4v4tcGbrpgZcvW2mPMIFI0tG1tsiiebaDhEePlCtKO5Ipt0F3Jqeky+tRhaWKEzYBH3EAZywdk0tbTGmKzUk9nW8oOgUGvv3cjNHdiQaPt9tyS8H70U4pZimzuLtFTezJgHw6IBQbhxt9ilk7/v4yvlmXoAl/jwS1diEzLaCfVBiYmAoyCz05aD+s1YdaxE1WM1P41yuWCKHWY4s8TYZVLZ0K8QFMmnBlh2KcKW4R6QnvE4Vdaro/0DWfkqwDvnZZxikEqYuh5KZ+1kxcWtgkeBnx05qjWbmEipCc8IcDXqwO6IZExy7N1FQ6512QlLBSg9Sq+lPPTlVe6JA8nBD17lWOpsuBM4MD2Rv2lsb/Sq6TxCJeKz9lUZ68adxhKOKG/2gZ8yiUGE7+V4tsP7LFU3qYgeiABVYiPjZqnRGCAI1hV8jbSWhk7bo8tANCPT7RR18dR68Pp3o4q032rZeb2yYmhFAeHyLA==
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8936002)(5660300002)(7049001)(37006003)(356005)(508600001)(81166007)(6200100001)(4326008)(316002)(2906002)(40460700003)(82960400001)(83380400001)(16526019)(6666004)(47076005)(54906003)(336012)(1076003)(426003)(186003)(2616005)(26005)(36906005)(6862004)(8676002)(70206006)(36860700001)(86362001)(36756003)(70586007)(82310400005)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 19:12:23.1164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3fd242e-3e17-4b18-59a0-08da2c6fb042
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0061.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6470
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There was an issue with the dual fan probe whereby the probe was
failing as it assuming that second_fan support was not available.

Corrected the logic so the probe works correctly. Cleaned up so
quirks only used if 2nd fan not detected.

Tested on X1 Carbon 10 (2 fans), X1 Carbon 9 (2 fans) and T490 (1 fan)

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index f385450af864..5eea6651a312 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8862,24 +8862,27 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 			fan_status_access_mode = TPACPI_FAN_RD_TPEC;
 			if (quirks & TPACPI_FAN_Q1)
 				fan_quirk1_setup();
-			if (quirks & TPACPI_FAN_2FAN) {
-				tp_features.second_fan = 1;
-				pr_info("secondary fan support enabled\n");
-			}
-			if (quirks & TPACPI_FAN_2CTL) {
-				tp_features.second_fan = 1;
-				tp_features.second_fan_ctl = 1;
-				pr_info("secondary fan control enabled\n");
-			}
 			/* Try and probe the 2nd fan */
+			tp_features.second_fan = 1; /* needed for get_speed to work */
 			res = fan2_get_speed(&speed);
 			if (res >= 0) {
 				/* It responded - so let's assume it's there */
 				tp_features.second_fan = 1;
 				tp_features.second_fan_ctl = 1;
 				pr_info("secondary fan control detected & enabled\n");
+			} else {
+				/* Fan not auto-detected */
+				tp_features.second_fan = 0;
+				if (quirks & TPACPI_FAN_2FAN) {
+					tp_features.second_fan = 1;
+					pr_info("secondary fan support enabled\n");
+				}
+				if (quirks & TPACPI_FAN_2CTL) {
+					tp_features.second_fan = 1;
+					tp_features.second_fan_ctl = 1;
+					pr_info("secondary fan control enabled\n");
+				}
 			}
-
 		} else {
 			pr_err("ThinkPad ACPI EC access misbehaving, fan status and control unavailable\n");
 			return -ENODEV;
-- 
2.35.1

