Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C25C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Jan 2022 19:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233971AbiA0TEZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Jan 2022 14:04:25 -0500
Received: from mail1.bemta33.messagelabs.com ([67.219.247.2]:15373 "EHLO
        mail1.bemta33.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229612AbiA0TEY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Jan 2022 14:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1643310263; i=@lenovo.com;
        bh=lOoOtIVOYPjl14sPXZnlxDA1EAam6WWvyuQ+HyAmVRU=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=Qacl52BkqNTM41xfdQWSli16hPKbbD7Lu1DSVKafhMy92Myge9qyTILnML0TUzuaO
         3e/92SMGumuTBjeAS7HmpVivUXg4Xn4+9RHuEcrBDFDcSy1Qjzg6z3GeHIor36bT4t
         fXd2b/KyHMyZ4RrAVAqf6ew+fHvAitwpRoCry1N6JFkX2GYJ6m8btS5m1uoggCDfZK
         de16t1WfLvqXE23RLEXwawufXJ4rOsDDugQTW+NbVVdFX8jalCN9XlQ0h2u44qH2L+
         f+UA9120oQGPm6osjU71V6dH3LX/GzaOLhHBdFuRhAoHLm5LzVWAQ3QF6WY4yEzgir
         9ow3XzQh4LAdQ==
Received: from [100.114.66.72] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-a.us-east-2.aws.ess.symcld.net id A2/0D-29462-7BCE2F16; Thu, 27 Jan 2022 19:04:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEJsWRWlGSWpSXmKPExsWSoS+Vobv9zad
  Eg/39yhZvjk9nsjgwdRqzxeo9L5gdmD02repk83i/7yqbx+dNcgHMUayZeUn5FQmsGadOT2Qt
  OM5f8evtJ6YGxj88XYxcHIwCS5klVn76yQrhLGKV+L7jBCOE08kkMXnePXYQR0hgLpPEypmvm
  CGcw0wSX/cuZAJxJASOM0p0H1rHBJHpZJT48eoUC4QzkUli6d5GKOcJo8SWnhOscM7fF6eB9n
  BysAloS2zZ8outi5GDQ0RARuLDWk+QMLNApMTVR9+ZQGxhgRSJG88esYHYLAKqEs3LtoLFeQW
  sJFauegcWlxCQl9h/8CwziM0JVHOm6zELiC0koCJx/8ESNoh6QYmTM5+wQMyXl2jeOpsZwpaQ
  OPjiBTNEvbLEr/7zzCDngMw80WgKMT5BouffI6hVkhLXbl5gh7BlJY6encMCYftK3Lk5EapGV
  +LM9Z2sEHaOxNmWO1A1ahJT+7dA1chJnOo9xzSBUXcWkutmIbluFpLrFjAyr2K0TirKTM8oyU
  3MzNE1NDDQNTQ00TUz1zUyMddLrNJN1Cst1k1NLC7RNdJLLC/WSy0u1iuuzE3OSdHLSy3ZxAh
  MPClFzt93MJ5b9VPvEKMkB5OSKG/Fo0+JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4b78CygkW
  paanVqRl5gCTIExagoNHSYR39WugNG9xQWJucWY6ROoUoz3HhJdzFzFz7Dw6D0h29SwEkpOO7
  N7OLMSSl5+XKiXOWw3SJgDSllGaBzcUlrQvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmPQ
  kyhSczrwRu9yugs5iAztp2BOyskkSElFQDU+iU31PbX+rY/l2QIWPYp7HG+eGVOFtr9rnHg3o
  rcsOeb1O3F/yRkB57v8Nv47TuGu+YwyFn9LaFcMxe6y5lPzv7t63rLgatm8ZHXOuv629OsNDv
  XvD8V/F1wYozBilJ6s7VhXevxaivzS1WvvE/L6onxEb75/onvBeZwtVubdD5mCittl/wm/v/P
  gULR8Ogql37tngu42w/vOiDp82sFbsMjOf0LQ2SfHK57/akQi2DPy8naU5Y5L7h85zCSTvuvI
  /awfKl4eGsgInLV5zpNZSp7OkJmPN45s+D/zapzeMMkuJxeLvQpFnkWKXGkupPB2N2Bza9qha
  0ehjKfiya+bK48Jd581cHq6Uv+WZ4XImlOCPRUIu5qDgRAKPYgTFVBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-15.tower-635.messagelabs.com!1643310261!5554!1
X-Originating-IP: [104.47.26.104]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19445 invoked from network); 27 Jan 2022 19:04:23 -0000
Received: from mail-sgaapc01lp2104.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.104)
  by server-15.tower-635.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Jan 2022 19:04:23 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/qHOR2HwYLSk8KqVd8W54hghfdxt8DDKiH2rpLPumol6jwr9cO1KpYvaGcAOt0e1vre0bcJpmQkMhv5ekG8S7ZZakiX9NGzo2BKs+WHLFexv0HEsJQhnWrau+/n0cdk3o4iiV5B8oBzKKsK18JBwyB0nDJCh0b2x8L610mI4E7NCEMe9y+odhrO6MkSLZFcH5g6ctN48BQn2yvFVPr+9+7/08Zp4qTE86VJX418qOvwy3fDEmQ36eUvM7uf0g+skqs7z/SEYgUD8V7boKzceHmqJGT/76tUBhwHJgwOaR1+YCUeLo/WRqgAUD2RuhvIu7cUV8CJRPeqghiPlOTInQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOoOtIVOYPjl14sPXZnlxDA1EAam6WWvyuQ+HyAmVRU=;
 b=fDn/Z/ETUU82Y7/iWriwaHLDK0RW/JyjpoyrickdEMjAvZ2RUjYwZe0br9y9ODsCtCNIr4T7YgFQtEsaDQSke7jXRvC5tDcjXkX+kocnN5KcHaVvS0CEA6qAQgZ+Dl8dbBVv0cz2pmyRxbnnV+CJD4xLvEXpNsQDIRVhuu5ea3REE1I5Yz0XWjV5JnpPhuUENVw61JKqU36jozaB2Os2OtXLezHcVYIYCgrgxaUbEpQB82NVwOcpd2NFLby7BrbeKs14Kn7YeW7BcSm7+YKXe73Uo8dJ1efj1RGbl+IysajH4R2rXb7eaFs9udHtnrDmnYjQ2lcBG8L/dFUSxhT+/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from HKAPR04CA0007.apcprd04.prod.outlook.com (2603:1096:203:d0::17)
 by SG2PR03MB3500.apcprd03.prod.outlook.com (2603:1096:4:1e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 19:04:20 +0000
Received: from HK2APC01FT050.eop-APC01.prod.protection.outlook.com
 (2603:1096:203:d0:cafe::53) by HKAPR04CA0007.outlook.office365.com
 (2603:1096:203:d0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 19:04:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 HK2APC01FT050.mail.protection.outlook.com (10.152.249.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 19:04:19 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Thu, 27 Jan
 2022 14:04:17 -0500
Received: from fedora.Lenovo.com (10.46.53.52) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Thu, 27 Jan
 2022 14:04:15 -0500
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix incorrect use of platform profile on AMD platforms
Date:   Thu, 27 Jan 2022 14:03:58 -0500
Message-ID: <20220127190358.4078-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.46.53.52]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e064360-9f33-4983-f29e-08d9e1c7d295
X-MS-TrafficTypeDiagnostic: SG2PR03MB3500:EE_
X-Microsoft-Antispam-PRVS: <SG2PR03MB3500540AE84D1C273C7F1F7AC5219@SG2PR03MB3500.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yl6JynP7KtzX2XnifsX7qqhUlnAenaVDH8kTd4ucQuAq1VJnWqM8O+SA7uNFzLQqICp9JQ84KDzk8xHMBDFo0jBzM5VPwnw1KdC5QZqbroIGFHH1S8D9bEBTdP5w6w14RqmuEjMceHO111Ci1EBU6mmYMX4R0JR9+sz2iSbcQ7R7eR8tCiy9l/3WW/vHA0XLGaat/n3D/CZ4ONAvtYi8ZztGaafj13yl5JHWeSXVulsVe0hgSd7juWx2Wzw0lk28WXtJ39+0Bw8vDJzHl739Rb9IzHkfCRAr85mUyAXGrQCug/L0XNuOGeTJ34Kmbyjqu4lFxghnZfo58G0L0A3fWZIcBeBmOhi+56DXDW6QTmQl2PAqbtIA2wjKtFcqxCBhaYP/0Ksjs92sW12jSmxn+9hwqZgTU+cuEFhaJzGDLetwRKQKirCwFi2FcaoNYUNq6KX3PBabPZOvgGe2E6wujt6w/pmXh4jZVH0U4aQBOv/FuB7FxHLiL8gMtf0qxffJINtGcdpukIuNMW5zbYyZLsa2bUL6tsaMaBpBRn7/feZN9ThbPiHjNbsOxC1MGSWDN1oTxd84B7rbvhvVRm/gOadV9u7Rj+f1mgcamOovUheLmS+Qpa/1TarRNfSJDkV6I3sBRzrh7G5NmYJ63ERcG8vphu2cviPNwqFew9EMtdq/OZ1H1RUQ10NkIsGhF90alYZT46QDJXrhFdgGc4Ygfnv5A3IeDBtBTP/efKOZF0U1AUI0rUpSpJxzFVqT8oGowQpaz6Oyw6MT8dXHlo8WpA==
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(16526019)(2616005)(47076005)(70586007)(4326008)(5660300002)(316002)(7696005)(8936002)(336012)(40460700003)(186003)(26005)(36756003)(1076003)(426003)(6666004)(36860700001)(6862004)(83380400001)(8676002)(70206006)(86362001)(2906002)(81166007)(356005)(508600001)(82310400004)(82960400001)(36906005)(7049001)(6200100001)(37006003)(54906003)(36900700001)(20210929001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 19:04:19.1795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e064360-9f33-4983-f29e-08d9e1c7d295
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT050.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB3500
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Lenovo AMD based platforms have been offering platform_profiles but they
are not working correctly. This is because the mode we are using on the
Intel platforms (MMC) is not available on the AMD platforms.

This commit adds checking of the functional capabilities returned by the
BIOS to confirm if MMC is supported or not. Profiles will not be
available if the platform is not MMC capable.

I'm investigating and working on an alternative for AMD platforms but
that is still work-in-progress.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in v2:
 - Rebased on review-hans branch to be in sync with latest
 - Return -ENODEV if funtion not available

 drivers/platform/x86/thinkpad_acpi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 33f611af6e51..5e4de74586cd 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10119,6 +10119,9 @@ static struct ibm_struct proxsensor_driver_data = {
 #define DYTC_CMD_MMC_GET      8 /* To get current MMC function and mode */
 #define DYTC_CMD_RESET    0x1ff /* To reset back to default */
 
+#define DYTC_CMD_FUNC_CAP     3 /* To get DYTC capabilities */
+#define DYTC_FC_MMC           27 /* MMC Mode supported */
+
 #define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
 #define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
 
@@ -10331,6 +10334,15 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	if (dytc_version < 5)
 		return -ENODEV;
 
+	/* Check what capabilities are supported. Currently MMC is needed */
+	err = dytc_command(DYTC_CMD_FUNC_CAP, &output);
+	if (err)
+		return err;
+	if (!test_bit(DYTC_FC_MMC, (void *)&output)) {
+		dbg_printk(TPACPI_DBG_INIT, " DYTC MMC mode not supported\n");
+		return -ENODEV;
+	}
+
 	dbg_printk(TPACPI_DBG_INIT,
 			"DYTC version %d: thermal mode available\n", dytc_version);
 	/*
-- 
2.34.1

