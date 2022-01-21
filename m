Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B134BC433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 Jan 2022 20:18:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232916AbiAUUSu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 21 Jan 2022 15:18:50 -0500
Received: from mail1.bemta31.messagelabs.com ([67.219.246.3]:20154 "EHLO
        mail1.bemta31.sdw.messagelabs.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232807AbiAUUSt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Jan 2022 15:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1642796328; i=@lenovo.com;
        bh=0a9aATtKIc8g2OcqfC/0G5fYhul0VDKyTwS8zU3pPyI=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=XaafFyAAU+tgAlUSfMjessfYI7emI0suosoW17ZWUZ38ghfEYZxhffIJ3VLyiAqvU
         G0dBEDF/N4FUD2xrfAoB59qeoqlANNQr6MMQmt/sbkcAw2/1jyMDQkurh7E0f1BxN/
         hfGPBZDnVBJKUp6YQOQSTwueQAYqyr5ZWIsI8qjWDwdOraUPRrfRw6rG77PDqKdqf5
         bcdyghRbLk72HsKZTBZ+yc9FmM8cKL67G5Vtx+xfTjPJ+debD9ukr4riJM2sJ0uwOA
         F9JlXe01YzM+iue6XdJ68fPPMTMItRNgQ7TGnl5RGnAkxHEeWArRvxnWefkSJ1EhdP
         CEi/Nrx/nu2Mg==
Received: from [100.114.2.76] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-a.us-east-1.aws.ess.symcld.net id D2/56-05509-8251BE16; Fri, 21 Jan 2022 20:18:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFJsWRWlGSWpSXmKPExsWSoS+VqftZ5HW
  iwZ/nahZvjk9nsli8fhmjxYGp05gtVu95wezA4tF66S+bx6ZVnWwe7/ddZfP4vEkugCWKNTMv
  Kb8igTVjwdstzAUb+CumTDrB2MB4n6eLkYuDUWAps8Tkhz9ZIJxFrBLda1rYIJxOJolF3TPBH
  CGBhUwSB/YtYIVwDjFJzDzTy97FyMkhIXCcUaJ7lTtEopNRYvfWH1At/UwSb+5eYIFwnjBKvH
  56ghnCecooMXXuIyaQfjYBbYktW34BtXBwiAjISHxY6wkSZhYok5jWDFEiLJAicePZIzYQm0V
  AVeLfiV9gq3kFrCQOP9vFDHGGvMT+g2fBbE6gmjNdj1lAbCEBFYn7D5awQdQLSpyc+YQFYr68
  RPPW2cwQtoTEwRcvmCHqlSV+9Z+HmqkgsbVlIhuEnSDR8+8RlC0pce3mBaj3ZSWOnp3DAmH7S
  kz92MAKYetKTFwxDaomR+LIwRdMELaaxK9bE6DmyEmc6j3HNIFRdxaS82YhOW8WkvMWMDKvYr
  RMKspMzyjJTczM0TU0MNA1NDTRNdW1sNRLrNJN1Cst1k1NLC7RNdRLLC/WSy0u1iuuzE3OSdH
  LSy3ZxAhMRClFrJE7GGf3/NQ7xCjJwaQkymv99lWiEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne
  eUyvE4UEi1LTUyvSMnOASREmLcHBoyTCe4MDKM1bXJCYW5yZDpE6xWjPMeHl3EXMHDuPzgOSX
  T0LgeSkI7u3Mwux5OXnpUqJ8z4RBmoTAGnLKM2DGwpL4pcYZaWEeRkZGBiEeApSi3IzS1DlXz
  GKczAqCfNeFAKawpOZVwK3+xXQWUxAZ/nefgVyVkkiQkqqgWlGyyZBdjsOKUa9eBdP/z3qAsn
  fapgPVAd+e/Px25u9ruu4O16orF8zTe9ndtq5Q347xCfqcs55fsXaurtf8MeGo0FOC5Tz+G/v
  CfTLnPozQk23+eeqzc5zMjazJP7b0XTqtJ9+qtl0+xfnQ42kpWsequrOSFrXzbz5z++by1f35
  QR/+Wd6weWLgrex3j7bW7e/bzOd/GrtvdlnV8zLn5wSLrZNMOTBpjlPL7yMeMjK/Wm6aIpY5Q
  sr3n2Ts+sCL8z8bqRzaHp62I+P3HpPNz1PMnf2y1qxsf5mqWXpiyrnz9d5V6/9cNzUtqjzzqe
  nN6yn7bJg3qTQaDxjrbKEyB+OjwGeDnXaiicubT+z7FqIEktxRqKhFnNRcSIA1Nx22V0EAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-5.tower-686.messagelabs.com!1642796273!4894!1
X-Originating-IP: [104.47.26.105]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24736 invoked from network); 21 Jan 2022 20:17:55 -0000
Received: from mail-sgaapc01lp2105.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.105)
  by server-5.tower-686.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Jan 2022 20:17:55 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TR71+7n/dB9NZojUd8+tWfXAfyQfNj16qRCfkEG3l0hlOUzIimR2r0kjpWea4qw1tuLQ5tRvduYw7z1bTXk6qXUPdSuusu1KDnxASHXM5qNsgb6j/zG3+p7ELg2ztn6L3irEQLjyfyeL+keMCq2XTBa2Rud3QS287BBUlYxRTztCa7vcZphOITrYS8dy9yzrOXSL65OGuRcRHjYsFakYAkSadc0MnOfxJds3PDYc2osQRFZAOVDcfIBGHAl2RWwTZnGrOlHzqx8iYbC7rIr41VSCljMECp67matHWskHBy+5cg8Fb8S5yPViCrpTj1aB4WtMBexwOK7foI+TFXaaOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0a9aATtKIc8g2OcqfC/0G5fYhul0VDKyTwS8zU3pPyI=;
 b=iqOpGxG7Px9qYdZ1j58xF1+OE4/bgJPuMcIuWULy9sHFqo+y9+X1b6CLWQ16g8LvKGOME/oVEO4KUFIyEOhNGpcMIvL324n3aISpLxSFaU1/rEHdKmyGUe7l4fe7yW3pxKbQmf2jy3JCrmGgJqe5vIPHuNq3PYb/md/NaCNjKCfMMoho3N2zg5XDm1sXkcCqF0rUzjsCUz0HvpRZPHoQDcPG2F6/qC/87OPEmTlM2IhCoKtT+RTAay9owU92nx/5ku6T2xqNK/4O4WRY3v3OSzPeLiC2v+h63+W6meerTArV63m46oOHq7sOqYZrGqtBu03orDvDgWc9xAhd1HVbGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SI2PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::15) by KL1PR03MB5683.apcprd03.prod.outlook.com
 (2603:1096:820:70::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.4; Fri, 21 Jan
 2022 20:17:52 +0000
Received: from SG2APC01FT0015.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:191:cafe::74) by SI2PR01CA0015.outlook.office365.com
 (2603:1096:4:191::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12 via Frontend
 Transport; Fri, 21 Jan 2022 20:17:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 SG2APC01FT0015.mail.protection.outlook.com (10.13.36.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.7 via Frontend Transport; Fri, 21 Jan 2022 20:17:52 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Fri, 21 Jan
 2022 15:17:49 -0500
Received: from fedora.Lenovo.com (10.46.48.215) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Fri, 21 Jan
 2022 15:17:47 -0500
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix incorrect use of platform profile on AMD platforms
Date:   Fri, 21 Jan 2022 15:17:22 -0500
Message-ID: <20220121201722.3423-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.46.48.215]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 647d2852-628c-4931-e6e0-08d9dd1b1a7d
X-MS-TrafficTypeDiagnostic: KL1PR03MB5683:EE_
X-Microsoft-Antispam-PRVS: <KL1PR03MB5683B38F6F1CBDEA9174F0F0C55B9@KL1PR03MB5683.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KfmmR4OunVCBjPazKJRa9Woqz5+VZoR6/PsfRj8fYi3L5XnFnqV8WuLtd+Ute79qlbpmps5R2n9HdyUHvKy5vsz5R8uZ0SzcFK5G/p/Cc92aVLVH3V46VY3kZVI/YgFx2pbDxKVrEYXGXbVepXUxCvL07qikZxI075ia7VHuWQinX9ztgWDI2PDByJSfk8rHe8LrJrh45pWsH2rnd3UWFBVsQeqT8a5ob+MRWhAP3DJf/HQPisUEmzNWCPWkdr/sCAp5g/FxjoKWS7JdM3UulMajxvZ2Ic0IgLzRfGGF7iEPVebRojwUxj7ynR1SV0sjj7BUVmUizxrUwhUEs0fxHkIRlDrHAnO+6VZGW7uFEaVlHv/9qPvjStlOa6kgZQnNz5oVvbZUT8sAcNDvWgjHkn4TJ4ik7SutVmcZ+OqV5HkHYrXb5c5oydtfU5n2i7A0fLtOmmUUG2E/3lUEwrfusqM6YI/cisHhRgFZqnDLNi0xShLEdx2E6+8L4MCCzhgOii33MS5DC+K3F4IoNsVrGzrsDXTC6vTSaG7SXzXntfFwXXWyCCqs93lumSX3Pw3DfsDm9UFskUKx/ct6EKPG/Ik0AuLjz5y6916PZH7T40jHlWXZkxLUyQstk6OKtHTnjzrd5eWHmIV4qlpyNuL7a/FWBU1C3qbTO2k/v9ztbK3jeg+hJfdgMkV4buRCPe5VfS+G0EvEuwp6iE3G2k75vw==
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700002)(46966006)(54906003)(37006003)(36906005)(47076005)(6200100001)(4326008)(2906002)(316002)(36860700001)(6862004)(6666004)(83380400001)(86362001)(36756003)(426003)(336012)(8936002)(2616005)(82310400004)(16526019)(5660300002)(81166007)(508600001)(1076003)(186003)(26005)(70206006)(82960400001)(8676002)(356005)(7696005)(70586007)(7049001)(40460700001)(36900700001)(20210929001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 20:17:52.2637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 647d2852-628c-4931-e6e0-08d9dd1b1a7d
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0015.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5683
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
 drivers/platform/x86/thinkpad_acpi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 9c632df734bb..42a04e44135b 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10026,6 +10026,9 @@ static struct ibm_struct proxsensor_driver_data = {
 #define DYTC_CMD_MMC_GET      8 /* To get current MMC function and mode */
 #define DYTC_CMD_RESET    0x1ff /* To reset back to default */
 
+#define DYTC_CMD_FUNC_CAP     3 /* To get DYTC capabilities */
+#define DYTC_FC_MMC           27 /* MMC Mode supported */
+
 #define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
 #define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
 
@@ -10253,6 +10256,16 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	if (dytc_version >= 5) {
 		dbg_printk(TPACPI_DBG_INIT,
 				"DYTC version %d: thermal mode available\n", dytc_version);
+
+		/* Check what capabilities are supported. Currently MMC is needed */
+		err = dytc_command(DYTC_CMD_FUNC_CAP, &output);
+		if (err)
+			return err;
+		if (!test_bit(DYTC_FC_MMC, (void *)&output)) {
+			dbg_printk(TPACPI_DBG_INIT, " DYTC MMC mode not supported\n");
+			return 0;
+		}
+
 		/*
 		 * Check if MMC_GET functionality available
 		 * Version > 6 and return success from MMC_GET command
-- 
2.34.1

