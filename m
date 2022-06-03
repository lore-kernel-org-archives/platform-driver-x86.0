Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D47C43334
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Jun 2022 17:02:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243045AbiFCRCs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Jun 2022 13:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235555AbiFCRCq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Jun 2022 13:02:46 -0400
Received: from mail1.bemta31.messagelabs.com (mail1.bemta31.messagelabs.com [67.219.246.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5640B6402
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jun 2022 10:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1654275764; i=@lenovo.com;
        bh=9pUivFiImyWzJWeniHebLKBDI/a3lUKxV8o97veGHS8=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=mBPqhPPtzirDiuvR06bPn1o4/i6kOTWCMt4kRej9XGsVQemepphrLFB3GFNmSE9GU
         ZLmrtUkOp7j1U5azYpT9njWai0Wpd9XRokfhgu8nOTnYqXetiOjdkKneyFxE5apaj3
         rHlaSZE9GMppjRU/inb2uupZNq03FMX9kQMsHnH8dWUV2LFRm4s1qU6tUaQpfvQ5mm
         VF/1zUusVO5b6I5pTTaWppKVM9Ux/Q122liU0uwbWWyPJ0oBHehpXvEOI8sDjEyV8i
         6hhR8TtxuW/Fkqte7ftdfAYlmqvg0Ji+623mjKm7PkUWVXgl/VaIuHx3LfSiKWyHsR
         aJErLuUrxiy2Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFJsWRWlGSWpSXmKPExsWSoZ+nrbvFbla
  SwdulLBZvjk9nsjgwdRqzxeo9L5gdmD02repk83i/7yqbx+dNcgHMUayZeUn5FQmsGbem7mQv
  aNWv2LtmH3sD4wqNLkYuDkaBpcwSLxc1M0I4i1glNh97xQrhdDJJLOqeyQbiCAnMYZJ4vWwlE
  4RziEniRONf9i5GTg4JgeOMEt2r3CESnYwSu7f+gGrpZ5LonDMHquUxo8SlU2ugnFuMEu/6Hj
  CC9LMJaEts2fILqIWDQ0RARuLDWk+QGmaQUZ/XnGIDqREWCJTYteY3E0gNi4CKxPLv/CBhXgE
  bif7L91kgzpCX2DC/lxnE5hRQlTjT9RgsLgRUfv/BEjaIekGJkzOfgMWZgeqbt85mhrAlJA6+
  eMEMUa8s8av/PDPMzLZLtxkh7ASJnn+P2CBsSYlrNy9AvS8rcfTsHKgbfCWu/tgHVaMrsf7zF
  FYI20bi7Y0tUDNzJDput0PVyEmc6j3HNIFRdxaS82YhOW8WkvMWMDKvYrRMKspMzyjJTczM0T
  U0MNA1NDTRNda1NNRLrNJN1Cst1k1NLC7RBXLLi/VSi4v1iitzk3NS9PJSSzYxApNOShFz9A7
  G/p6feocYJTmYlER5VRbOTBLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwfvaalaSkGBRanpqRVpm
  DjABwqQlOHiURHhN5YHSvMUFibnFmekQqVOMlhxXtu3dy8zx4MRJIHlt/YJ9zEIsefl5qVLiv
  B9sgRoEQBoySvPgxsGS9CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrz5IFN4MvNK4La+Aj
  qICeigktczQA4qSURISTUwqW02ndvz2U4tZfvaGXJrzVmLdjx2UH8g8SRA8bdzckn6RSWGq/v
  K9H4ZTMjTb2dueHlzb3yR34tc2SunzPuOPl3XK715x8ESTwfWO8Wnvs4OuVRu57Lp+KOeHRGn
  zm/kyit48WH96v6NDm0ZCQJ/t63LiRFsW58Yy7bO1MtL9Oxi2YJPp1lncJ/l4Fp1q/WRbPQau
  2jvp7ybzBbZaU/eeTWmX9D4SaD7Cr0l+osK/Zf55r/+ey/CuD/S9/0d3Qnc/0IWhOScr256+d
  u7YPcevoBzh84Li3Kv1/nT8VUpm0Xz4Cq3R9fmOi7g4U5wXbzimza/fPGjm2KPJn1mrKl1Xf1
  7etKx7T7CsdYLdf+fUWIpzkg01GIuKk4EAJDRkCVNBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-8.tower-706.messagelabs.com!1654275762!27338!1
X-Originating-IP: [104.47.110.43]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18553 invoked from network); 3 Jun 2022 17:02:43 -0000
Received: from mail-tyzapc01lp2043.outbound.protection.outlook.com (HELO APC01-TYZ-obe.outbound.protection.outlook.com) (104.47.110.43)
  by server-8.tower-706.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2022 17:02:43 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuHVQ2NNW3blTYkEeAiQiGlmrnsEMGF9Ac7Pmqxku/Mj4ApCh5+m69N0jauxcA1QwI9Vq6JmJXFVjVuucWxioo+BItZeNvrc7O2RfmHc5HDQzmIN1pOc6682+QNcSmBGUOv7bAfTv/vbWl0C5N2i5j7UscMrAkCb5FSXxPSV1axr65aqm98/ugXkOjBD7pDK+gcqQfz9zCUcYOp7CxCXJDeMODnDc2iJSIhgSvl7qo0DTuZFuo2Unc9GVwBj1KePXbrgwQVxiJwPbX1evfYuLG9Tlp0L3r+VSxhTet+Gi9+WVldyfiERtdsS3CwTMMQx4qTka3dRqZbA/7GcvqDB5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pUivFiImyWzJWeniHebLKBDI/a3lUKxV8o97veGHS8=;
 b=OosClg9bTs5V4CkheZghC0e2fkRXE8gqCuA4myc0ukim1Co/3oCKu7LEyvnOud4GvVsxSKQLysVMNEUx0GL0vKFukniAGTiCNAHynJkL56Q1vbxug8UhZVuOBfxtbUz1QfxPNRodvcHFguNq2To0YpwmJLkYSioh918/dOKB8yAWkGtUn0j5WnPZ27GqhE+SEdYoVI5tjHe9K19j34pujVoLN8tH3wrDJy21LICk+HUfT3r/DFgHa90YGFDiZW+btXtNLoTGYSwDglWcIsjqcXWlgEAIg34IZoeIbb3RF8duwSXTfNz+wVIGbjV55EfkV3wzRa4N6IaFEqihy7BaZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PU1PR04CA0013.apcprd04.prod.outlook.com (2603:1096:803:29::25)
 by SI2PR03MB5195.apcprd03.prod.outlook.com (2603:1096:4:108::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.6; Fri, 3 Jun
 2022 17:02:38 +0000
Received: from PSAAPC01FT048.eop-APC01.prod.protection.outlook.com
 (2603:1096:803:29:cafe::c5) by PU1PR04CA0013.outlook.office365.com
 (2603:1096:803:29::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Fri, 3 Jun 2022 17:02:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 PSAAPC01FT048.mail.protection.outlook.com (10.13.38.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Fri, 3 Jun 2022 17:02:37 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Fri, 3 Jun
 2022 13:02:36 -0400
Received: from z13.home (10.46.51.79) by reswpmail01.lenovo.com (10.62.32.20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Fri, 3 Jun
 2022 13:02:34 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 1/4] platform/x86: thinkpad-acpi: profile capabilities as integer
Date:   Fri, 3 Jun 2022 13:02:09 -0400
Message-ID: <20220603170212.164963-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.46.51.79]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 028d4c7d-cc22-4f0c-39ff-08da4582dd0f
X-MS-TrafficTypeDiagnostic: SI2PR03MB5195:EE_
X-LD-Processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
X-Microsoft-Antispam-PRVS: <SI2PR03MB5195AE943229A30FF84A050EC5A19@SI2PR03MB5195.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ypsr5bAmT5X7imo07XkJuNro5mfXDKep6vCkt7lGghanpXtNM6w2mwQZaV8631fMka/jbcq0tbzc2dCEXh2APDDo1iPotCYHlw2G/4woIFISf8MsUnjsFdfL/2Hzz1GnyETzN/solKkmXcnHwDcT4E1r1UcxGuuUYJQjPAxNvMn2rqoy4+OHiY3itg39lYa1OR104BMfFHtN5YMQy8v0ujOhMkbE2cYFg1PSgC/G50vZy42qSr8CvBefahQNly5kf+5Msu6dHfPw1JeYUCVPEf7G9RCKfbh8Ppcr2MFP+AW8XlujbLDNZpC3Ik5jHpWniGD+Vz3U8Ijl6Woubc7X37UKfZOCSai5tRjLXYMDoF0bqwMe07ROIEuGzFAJOLTmWygr+5pjEvPgy9CzOLILzS+a0jESZgxNh19CXPTqmmMhJCLQ2kDALPScx00DkGOTsi96v202FtU2o/e/P4RLy6TrpQGzzL4Pd29Dna5Y6M52P3JWDX5oOsng+VfI4jZOrQQbUdfGIFXQq+yvkZ6Jagvwen5BFIqC0Dwqujr6uuZlEkQZYR1/kSv5HHcC6mbH8/rIV0680zYoWR0j2x27PgFxic4Ihab/IrRc3oeZdYR2XNC6y9bq8Px9n/qpWScqbX7rn1vcOE3H9rzbQN3hI8kHE5cVz2iQ4aVwk239I95k1BhFQwMAiRT32OiJ/0xfgLjhi9z/8dC/aS5J/sjCIyPdcMY8N+rH/N9fhKaqpYGlrWwdVZPhOTYRJ8x4l9YaT+F6NuHEUb/Cg0b6UfYwcQ==
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36860700001)(83380400001)(26005)(6666004)(508600001)(36756003)(356005)(82310400005)(40460700003)(82960400001)(8936002)(4326008)(7049001)(37006003)(36906005)(1076003)(2616005)(426003)(70206006)(336012)(2906002)(186003)(8676002)(16526019)(316002)(70586007)(6862004)(86362001)(47076005)(6200100001)(54906003)(81166007)(5660300002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 17:02:37.8643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 028d4c7d-cc22-4f0c-39ff-08da4582dd0f
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT048.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5195
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently the active mode (PSC/MMC) is stored in an enum and queried
throughout the driver.

Other driver changes will enumerate additional submodes that are relevant
to be tracked, so instead track PSC/MMC in a single integer variable.

Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 45 +++++++++++-----------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index e6cb4a14cdd4..5d1e0a3a5c1e 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10299,21 +10299,15 @@ static struct ibm_struct proxsensor_driver_data = {
 #define DYTC_DISABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_MMC_BALANCE, 0)
 #define DYTC_ENABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_MMC_BALANCE, 1)
 
-enum dytc_profile_funcmode {
-	DYTC_FUNCMODE_NONE = 0,
-	DYTC_FUNCMODE_MMC,
-	DYTC_FUNCMODE_PSC,
-};
-
-static enum dytc_profile_funcmode dytc_profile_available;
 static enum platform_profile_option dytc_current_profile;
 static atomic_t dytc_ignore_event = ATOMIC_INIT(0);
 static DEFINE_MUTEX(dytc_mutex);
+static int dytc_capabilities;
 static bool dytc_mmc_get_available;
 
 static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *profile)
 {
-	if (dytc_profile_available == DYTC_FUNCMODE_MMC) {
+	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
 		switch (dytcmode) {
 		case DYTC_MODE_MMC_LOWPOWER:
 			*profile = PLATFORM_PROFILE_LOW_POWER;
@@ -10330,7 +10324,7 @@ static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *p
 		}
 		return 0;
 	}
-	if (dytc_profile_available == DYTC_FUNCMODE_PSC) {
+	if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
 		switch (dytcmode) {
 		case DYTC_MODE_PSC_LOWPOWER:
 			*profile = PLATFORM_PROFILE_LOW_POWER;
@@ -10352,21 +10346,21 @@ static int convert_profile_to_dytc(enum platform_profile_option profile, int *pe
 {
 	switch (profile) {
 	case PLATFORM_PROFILE_LOW_POWER:
-		if (dytc_profile_available == DYTC_FUNCMODE_MMC)
+		if (dytc_capabilities & BIT(DYTC_FC_MMC))
 			*perfmode = DYTC_MODE_MMC_LOWPOWER;
-		else if (dytc_profile_available == DYTC_FUNCMODE_PSC)
+		else if (dytc_capabilities & BIT(DYTC_FC_PSC))
 			*perfmode = DYTC_MODE_PSC_LOWPOWER;
 		break;
 	case PLATFORM_PROFILE_BALANCED:
-		if (dytc_profile_available == DYTC_FUNCMODE_MMC)
+		if (dytc_capabilities & BIT(DYTC_FC_MMC))
 			*perfmode = DYTC_MODE_MMC_BALANCE;
-		else if (dytc_profile_available == DYTC_FUNCMODE_PSC)
+		else if (dytc_capabilities & BIT(DYTC_FC_PSC))
 			*perfmode = DYTC_MODE_PSC_BALANCE;
 		break;
 	case PLATFORM_PROFILE_PERFORMANCE:
-		if (dytc_profile_available == DYTC_FUNCMODE_MMC)
+		if (dytc_capabilities & BIT(DYTC_FC_MMC))
 			*perfmode = DYTC_MODE_MMC_PERFORM;
-		else if (dytc_profile_available == DYTC_FUNCMODE_PSC)
+		else if (dytc_capabilities & BIT(DYTC_FC_PSC))
 			*perfmode = DYTC_MODE_PSC_PERFORM;
 		break;
 	default: /* Unknown profile */
@@ -10445,7 +10439,7 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
 	if (err)
 		goto unlock;
 
-	if (dytc_profile_available == DYTC_FUNCMODE_MMC) {
+	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
 		if (profile == PLATFORM_PROFILE_BALANCED) {
 			/*
 			 * To get back to balanced mode we need to issue a reset command.
@@ -10464,7 +10458,7 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
 				goto unlock;
 		}
 	}
-	if (dytc_profile_available == DYTC_FUNCMODE_PSC) {
+	if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
 		err = dytc_command(DYTC_SET_COMMAND(DYTC_FUNCTION_PSC, perfmode, 1), &output);
 		if (err)
 			goto unlock;
@@ -10483,12 +10477,12 @@ static void dytc_profile_refresh(void)
 	int perfmode;
 
 	mutex_lock(&dytc_mutex);
-	if (dytc_profile_available == DYTC_FUNCMODE_MMC) {
+	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
 		if (dytc_mmc_get_available)
 			err = dytc_command(DYTC_CMD_MMC_GET, &output);
 		else
 			err = dytc_cql_command(DYTC_CMD_GET, &output);
-	} else if (dytc_profile_available == DYTC_FUNCMODE_PSC)
+	} else if (dytc_capabilities & BIT(DYTC_FC_PSC))
 		err = dytc_command(DYTC_CMD_GET, &output);
 
 	mutex_unlock(&dytc_mutex);
@@ -10517,7 +10511,6 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	set_bit(PLATFORM_PROFILE_BALANCED, dytc_profile.choices);
 	set_bit(PLATFORM_PROFILE_PERFORMANCE, dytc_profile.choices);
 
-	dytc_profile_available = DYTC_FUNCMODE_NONE;
 	err = dytc_command(DYTC_CMD_QUERY, &output);
 	if (err)
 		return err;
@@ -10530,13 +10523,12 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 		return -ENODEV;
 
 	/* Check what capabilities are supported */
-	err = dytc_command(DYTC_CMD_FUNC_CAP, &output);
+	err = dytc_command(DYTC_CMD_FUNC_CAP, &dytc_capabilities);
 	if (err)
 		return err;
 
-	if (output & BIT(DYTC_FC_MMC)) { /* MMC MODE */
-		dytc_profile_available = DYTC_FUNCMODE_MMC;
-
+	if (dytc_capabilities & BIT(DYTC_FC_MMC)) { /* MMC MODE */
+		pr_debug("MMC is supported\n");
 		/*
 		 * Check if MMC_GET functionality available
 		 * Version > 6 and return success from MMC_GET command
@@ -10547,8 +10539,8 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 			if (!err && ((output & DYTC_ERR_MASK) == DYTC_ERR_SUCCESS))
 				dytc_mmc_get_available = true;
 		}
-	} else if (output & BIT(DYTC_FC_PSC)) { /* PSC MODE */
-		dytc_profile_available = DYTC_FUNCMODE_PSC;
+	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) { /* PSC MODE */
+		pr_debug("PSC is supported\n");
 	} else {
 		dbg_printk(TPACPI_DBG_INIT, "No DYTC support available\n");
 		return -ENODEV;
@@ -10574,7 +10566,6 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 
 static void dytc_profile_exit(void)
 {
-	dytc_profile_available = DYTC_FUNCMODE_NONE;
 	platform_profile_remove();
 }
 
-- 
2.36.1

