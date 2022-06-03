Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D49DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Jun 2022 17:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344176AbiFCRC5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Jun 2022 13:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344177AbiFCRC5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Jun 2022 13:02:57 -0400
Received: from mail1.bemta33.messagelabs.com (mail1.bemta33.messagelabs.com [67.219.247.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EDB551E4D
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jun 2022 10:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1654275765; i=@lenovo.com;
        bh=1XwJ5MKvplvlvAcGIWizrxrjY/xE4tMFAH56NGQqopk=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=SmugUGjx8W4WoHMlfbfFaw6gszUAANIaOqvTw3w9NME/hKDrrcGtcplkcFDRQ0u21
         OiyHWi3Uo8il6VvBxqJKWavQTGV3MXi9eSUpPgA4DNwNeBTb/JEatO/PzYqf2yVUpa
         DlxV+k/oCEaJfCKaL64t113owYbjJj3Ha/TJqCKDq9aPgF2xdpjv5sF5nGEFvOAZ2w
         /ZSFWGdpXKLIfuM9D4xaq6v+iZZCAZ1LgEFPlUyt5P2q2vc+tNQ/K288WItgCVGYqP
         FQtfTyACJstxtZZiZ7H0bcjP7WMUEE53a8/ow7WXzlQ3MUklNXBrK8vL6K0A6By+u2
         x9zN1bJBPUdYg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJJsWRWlGSWpSXmKPExsWSoS9VqLvFbla
  SweVHlhZvjk9nsjgwdRqzxeo9L5gdmD02repk83i/7yqbx+dNcgHMUayZeUn5FQmsGesnTGUv
  WC1dcWTSe7YGxn9iXYycHIwCS5klHi5ThrAXsUpsXOzcxcgFZHcySUyed48dxBESmMkk8fv3M
  yjnAJPEvDuX2EAcCYHjjBLdh9YxQWQ6GSV+vDrFAuH0M0m8PLqBFWSykMBjoLIFARCJW4wSS5
  vPgiXYBLQltmz5BTSLg0NEQEbiw1pPkBpmkEmf15xiA6kRFoiVOHZtPjuIzSKgInHmXg8TiM0
  rYCNx6PcyMFtCQF5iw/xeZhCbU8BWYvLOZ2wQi8Mkdp98zghRLyhxcuYTFhCbGai+eetsZghb
  QuLgixfMEPXKEr/6zzPDzGy7dJsRwk6Q6Pn3iA3ClpS4dvMCO4QtK3H07BwWkPslBHwlWhttI
  MK6EjMeT4EaYyPx9sYWKDtHYtfnpVBj5CRO9Z5jmsCoOwvJdbOQXDcLyXULGJlXMVolFWWmZ5
  TkJmbm6BoaGOgaGprompkDKb3EKt1EvdJi3dTE4hJdI73E8mK91OJiveLK3OScFL281JJNjMC
  Uk1LkzL2D8dfKn3qHGCU5mJREeVUWzkwS4kvKT6nMSCzOiC8qzUktPsQow8GhJMH72mpWkpBg
  UWp6akVaZg4w/cGkJTh4lER4TeWB0rzFBYm5xZnpEKlTjJYcV7bt3cvM8eDESSB5bf2CfcxCL
  Hn5ealS4rwfbIEaBEAaMkrz4MbBUvQlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8+SBTeD
  LzSuC2vgI6iAnooJLXM0AOKklESEk1MIWWz9f2/Ffm0H7FNTjXd9WyWwmqLQWKv16sSnx8KVB
  170S5ZaxfV86xnj2lRaUmJ0x4d1PkhvWRdbNPW7UcVg5fHsA1W/Ra2I6qNe+u673cwFudM6Po
  rThv92El3VjHN3cdvi+5nyX3Idb5Is+7KxNUr3P+87fN3z/xVz3zVj0Vq2jrvd2r3YR/LOZjt
  xYW/Te98NAJkxW/RJNkp6lx/Jc9qt0bxrKjomFh6df3n3x6v0RsMQmbGfOO75bN27qo9xGz2x
  VCt//9+ZM3v1xjOfuLF2uqu6eoFb5P63p87YbjF+3wswtcG+KMnk46q7rM+dI/m5AHrB8sTM4
  pzIz139e92z/6W7O2SuDN70eLViixFGckGmoxFxUnAgAftxv0TAQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-5.tower-715.messagelabs.com!1654275763!5955!1
X-Originating-IP: [104.47.26.113]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31138 invoked from network); 3 Jun 2022 17:02:44 -0000
Received: from mail-sgaapc01lp2113.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.113)
  by server-5.tower-715.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2022 17:02:44 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtMBKrwr0ugwLp40zBuZC0oFGuR62SY4KJ4cUC/1ozuXu4zXbFqpQaK4e4YMtkDWq/iWJnPUvQJdTDu2gcMSVIU9eWU/uFsL0ibhclLDD6MLuzSgKoiptpIX9Wl/xPtg+pf0Mv3KRIC7mb8y60NRWYORY3LeKQByWH6bWf4LCis0wW/EBxwpFGW0aJsPGuWuB0hyXuLzBGXDU1IbzgTmAdvcNoA1gibV0oJz1U3FIFmdik7/1rS4vwUjs3rWSjVT43DzPXaTfwye03thKkG25GJzgBzp+oRYd8xvU4f5Eh05KVun+9H5keasPCMwDuqfPGWNxJ7G3GcaDOukn9T+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XwJ5MKvplvlvAcGIWizrxrjY/xE4tMFAH56NGQqopk=;
 b=lJOOU/X3MsGlQBBMU69aWCTokh1QFjFfd/ad/tQzBh2q50Kc7Ouf2SY002BQVUY1QazU9KxUgZZk62o3uaMhbYMe8lletgeyjFpkArmA+wgmDkpoyBQu8HdgicgRJaj4wqqb1H7tVGI16ruVYbgOkOSecHnDYXAkU8FOqSH5B1XkJRb3pW90TDBolSWvFGjhdc3nbunhQa8zjkDZ6P0L91Up2qRbHOrgWz0YteXiAwF2hLEemDP1VpIMD+A6cImEcxSRTFHQpexqDXyPm+5aT/+eR8pADxdJr/WhpM0adTmaxRjBOfpnSp+71i9InvGpJBY15QjaGpGNPIvi5oxa0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SL2P216CA0100.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::15) by
 SG2PR03MB6777.apcprd03.prod.outlook.com (2603:1096:4:1de::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.4; Fri, 3 Jun 2022 17:02:41 +0000
Received: from PSAAPC01FT061.eop-APC01.prod.protection.outlook.com
 (2603:1096:101:3:cafe::e2) by SL2P216CA0100.outlook.office365.com
 (2603:1096:101:3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Fri, 3 Jun 2022 17:02:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 PSAAPC01FT061.mail.protection.outlook.com (10.13.38.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Fri, 3 Jun 2022 17:02:40 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Fri, 3 Jun
 2022 13:02:38 -0400
Received: from z13.home (10.46.51.79) by reswpmail01.lenovo.com (10.62.32.20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Fri, 3 Jun
 2022 13:02:36 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 2/4] platform/x86: thinkpad-acpi: Add support for automatic  mode transitions
Date:   Fri, 3 Jun 2022 13:02:10 -0400
Message-ID: <20220603170212.164963-2-markpearson@lenovo.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603170212.164963-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20220603170212.164963-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.46.51.79]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf099dab-688f-4f4b-c8c7-08da4582deb4
X-MS-TrafficTypeDiagnostic: SG2PR03MB6777:EE_
X-LD-Processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
X-Microsoft-Antispam-PRVS: <SG2PR03MB6777C0A87B032EF2A2070145C5A19@SG2PR03MB6777.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: layH/DWzmG28uIZO+JX+EH4vME0erH4JtWQfTpkscrv7qQmRN3gITTNI8Aeh72pMc+jB0xsVmye3XZ7KJJLYydr0aiU8lbxH++T+M+6p9R4XZF484OarhcQu4gJO8TTrZ8BdiSfQaM1KEAylcieCiwSyv5rq8TtQoyik3h4+Kg9Ter75JiRzdkh9mh7sHpUEiyQwORDOBK18PG86l24H5KzXEkM78iUE5u3H9rtlUST3FdBiXYyv9u1mT3COw1yLlcW2YLsdi90PnCHL7sTnJTkwnMizVNKj4IywPXyG01nPKT7nXFR+dC1QP/Jt4NJcmzWIBhqRJmI0aoufd9SY+GU2I0tdNWQAnMfOpghCWzfFlpDah8RYaQfUn8BSrBECrGUn5k7HNRvk/jrg82R6ZjUufU3g90Hgrz2xc9UTwPptq3Xt8XkWwDCb0RbsvqtItQTo148TPgsd9TOXGJUfZN3cRz2bLxIqphq8uvr2JaZ/Mr8L2h3qnve66Otbglgk8ASXNLuv8GMmEd/Y+QPfPjICYTZdjX6aseCmGKblFotRXWg3Wv0svPIjur4jv86Nrx4m1cLMLKXAGlL0wzDsLoIxoy6dg66MIWmAccI213in4cio9U0NizSGYKpvtQD/yaGWQaJC+z437lIZyXLa73L94iT1JcLlW2sgNMdwrg75fmiSxQf21qmBsKrMS+2jT585oh9Ex9tOeTAQFjW6qg==
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(8936002)(5660300002)(2906002)(47076005)(82310400005)(336012)(426003)(36860700001)(6666004)(86362001)(7049001)(316002)(37006003)(40460700003)(54906003)(36906005)(6862004)(83380400001)(8676002)(4326008)(70206006)(70586007)(6200100001)(2616005)(36756003)(81166007)(82960400001)(356005)(186003)(16526019)(1076003)(26005)(508600001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 17:02:40.6270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf099dab-688f-4f4b-c8c7-08da4582deb4
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT061.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6777
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some AMD Thinkpads support automatic mode transitions.  The actual
transition logic doesn't live in the `thinkpad_acpi` driver. The events
to activate this logic come from this driver though.

Populate these events when switching PSC power modes.

Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 5d1e0a3a5c1e..2df290cee0a1 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10266,6 +10266,7 @@ static struct ibm_struct proxsensor_driver_data = {
 #define DYTC_CMD_FUNC_CAP     3 /* To get DYTC capabilities */
 #define DYTC_FC_MMC           27 /* MMC Mode supported */
 #define DYTC_FC_PSC           29 /* PSC Mode supported */
+#define DYTC_FC_AMT           31 /* AMT mode supported */
 
 #define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
 #define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
@@ -10278,6 +10279,10 @@ static struct ibm_struct proxsensor_driver_data = {
 #define DYTC_FUNCTION_CQL     1  /* Function = 1, lap mode */
 #define DYTC_FUNCTION_MMC     11 /* Function = 11, MMC mode */
 #define DYTC_FUNCTION_PSC     13 /* Function = 13, PSC mode */
+#define DYTC_FUNCTION_AMT     15 /* Function = 15, AMT mode */
+
+#define DYTC_MODE_AMT_ENABLE   0x1 /* Enable AMT (in balanced mode) */
+#define DYTC_MODE_AMT_DISABLE  0xF /* Disable AMT (in other modes) */
 
 #define DYTC_MODE_MMC_PERFORM  2  /* High power mode aka performance */
 #define DYTC_MODE_MMC_LOWPOWER 3  /* Low power mode */
@@ -10298,6 +10303,8 @@ static struct ibm_struct proxsensor_driver_data = {
 
 #define DYTC_DISABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_MMC_BALANCE, 0)
 #define DYTC_ENABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_MMC_BALANCE, 1)
+static int dytc_control_amt(bool enable);
+static bool dytc_amt_active;
 
 static enum platform_profile_option dytc_current_profile;
 static atomic_t dytc_ignore_event = ATOMIC_INIT(0);
@@ -10380,6 +10387,30 @@ static int dytc_profile_get(struct platform_profile_handler *pprof,
 	return 0;
 }
 
+static int dytc_control_amt(bool enable)
+{
+	int dummy;
+	int err;
+	int cmd;
+
+	if (!(dytc_capabilities & BIT(DYTC_FC_AMT))) {
+		pr_warn("Attempting to toggle AMT on a system that doesn't advertise support\n");
+		return -ENODEV;
+	}
+
+	if (enable)
+		cmd = DYTC_SET_COMMAND(DYTC_FUNCTION_AMT, DYTC_MODE_AMT_ENABLE, enable);
+	else
+		cmd = DYTC_SET_COMMAND(DYTC_FUNCTION_AMT, DYTC_MODE_AMT_DISABLE, enable);
+
+	pr_debug("%sabling AMT (cmd 0x%x)", enable ? "en":"dis", cmd);
+	err = dytc_command(cmd, &dummy);
+	if (err)
+		return err;
+	dytc_amt_active = enable;
+	return 0;
+}
+
 /*
  * Helper function - check if we are in CQL mode and if we are
  *  -  disable CQL,
@@ -10462,6 +10493,9 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
 		err = dytc_command(DYTC_SET_COMMAND(DYTC_FUNCTION_PSC, perfmode, 1), &output);
 		if (err)
 			goto unlock;
+		/* system supports AMT, activate it when on balanced */
+		if (dytc_capabilities & BIT(DYTC_FC_AMT))
+			dytc_control_amt(profile == PLATFORM_PROFILE_BALANCED);
 	}
 	/* Success - update current profile */
 	dytc_current_profile = profile;
-- 
2.36.1

