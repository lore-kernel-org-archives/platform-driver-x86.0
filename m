Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A528C433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Apr 2021 02:23:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEA8F6128D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Apr 2021 02:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243354AbhDFCXe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 5 Apr 2021 22:23:34 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.5]:28740 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238828AbhDFCXe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Apr 2021 22:23:34 -0400
Received: from [100.112.131.172] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.us-west-2.aws.symcld.net id A7/F9-44762-E16CB606; Tue, 06 Apr 2021 02:23:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsWSLveKTVfuWHa
  CwZcZshZvjk9nsvjcMZnFYvWeF8wOzB7zTgZ6vN93lc3j8ya5AOYo1sy8pPyKBNaM7381Cw5J
  VexfNom5gXGqWBcjF4eQwH9GiVN9LWwQzmtGidvvvzF1MXJysAloS2zZ8gsowcEhIiAj8WGtJ
  0iYWSBaovntFVaQsLCAucSKp8EgYRYBFYnJK36wgti8AjYSJzfdZgexJQTkJdquT2cEsTkFVC
  XOdD1mAbGFgOrvP1jCBlEvKHFy5hMWiPHyEs1bZzND2BISB1+8YIaYoyBx9tB7Vgg7QaLn3yO
  2CYwCs5C0z0LSPgtJ+wJG5lWM5klFmekZJbmJmTm6hgYGuoaGRrqGRpa6xsZ6iVW6iXqlxbrl
  qcUlukZ6ieXFesWVuck5KXp5qSWbGIHBnVLQqLiD8cLrD3qHGCU5mJREeUvUshKE+JLyUyozE
  osz4otKc1KLDzHKcHAoSfByH81OEBIsSk1PrUjLzAFGGkxagoNHSYQ3eztQmre4IDG3ODMdIn
  WKUVFKnLcPpE8AJJFRmgfXBovuS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEebuPAE3hycw
  rgZv+CmgxE9BiqbOZIItLEhFSUg1MYvMeLtt0p3jFoje+6ge2//3+/gSH5rOXwklrEie/rFlv
  /en2/6WRQuLvNofaP7FcLKV+kC3eLuLTxpqKDJ8Wx9XzpgUtESgLYooynvT+lp+S9sZ4hhb1F
  MFmk61WKba7Y4UEbydcP73npWFV6E/XYNkXeydflW/a+yMyh+/dhPcfvtZ/+La4+oTpY7E9lf
  5F/hdl3x2O36T8s0vS3u4S3/7HszcaL+Jl/PpWYvJOFkZXm8caJlwbukIfLnF+dcr5UO2G+Av
  Vgucb7+3k5qqa7i5X/8XzhP/edt+FF25wyWQvmLdvxptPu/sst17XfnjhacCN+4Jb2OvfKT71
  P3N7294ghgccs43ic9uPCrrvUlViKc5INNRiLipOBACMsPhnaQMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-25.tower-326.messagelabs.com!1617675804!58464!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24774 invoked from network); 6 Apr 2021 02:23:26 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-25.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Apr 2021 02:23:26 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id B6962EEB1E5F4A47FC9E;
        Tue,  6 Apr 2021 10:23:23 +0800 (CST)
Received: from localhost.localdomain.com (10.46.192.12) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 5 Apr 2021 22:23:21 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] Add support for DYTC MMC_GET BIOS API.
Date:   Mon, 5 Apr 2021 22:22:15 -0400
Message-ID: <20210406022215.199998-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.46.192.12]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The BIOS team have added a new API that allows us to retrieve the
current performance profile without having to disable/enable CQL
mode. Adding the changes to use this API.

Tested on P15 and X1C8

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0d9e2ddbf..4eb1ad443 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10050,6 +10050,7 @@ static struct ibm_struct proxsensor_driver_data = {
  */
 
 #define DYTC_CMD_SET          1 /* To enable/disable IC function mode */
+#define DYTC_CMD_MMC_GET      8 /* To get current MMC function and mode */
 #define DYTC_CMD_RESET    0x1ff /* To reset back to default */
 
 #define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
@@ -10066,6 +10067,10 @@ static struct ibm_struct proxsensor_driver_data = {
 #define DYTC_MODE_PERFORM     2  /* High power mode aka performance */
 #define DYTC_MODE_LOWPOWER    3  /* Low power mode */
 #define DYTC_MODE_BALANCE   0xF  /* Default mode aka balanced */
+#define DYTC_MODE_MMC_BALANCE 0  /* Default mode from MMC_GET, aka balanced */
+
+#define DYTC_ERR_MASK       0xF  /* Bits 0-3 in cmd result are the error result */
+#define DYTC_ERR_SUCCESS      1  /* CMD completed successful */
 
 #define DYTC_SET_COMMAND(function, mode, on) \
 	(DYTC_CMD_SET | (function) << DYTC_SET_FUNCTION_BIT | \
@@ -10080,6 +10085,7 @@ static bool dytc_profile_available;
 static enum platform_profile_option dytc_current_profile;
 static atomic_t dytc_ignore_event = ATOMIC_INIT(0);
 static DEFINE_MUTEX(dytc_mutex);
+static bool dytc_mmc_get_available;
 
 static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *profile)
 {
@@ -10088,6 +10094,7 @@ static int convert_dytc_to_profile(int dytcmode, enum platform_profile_option *p
 		*profile = PLATFORM_PROFILE_LOW_POWER;
 		break;
 	case DYTC_MODE_BALANCE:
+	case DYTC_MODE_MMC_BALANCE:
 		*profile =  PLATFORM_PROFILE_BALANCED;
 		break;
 	case DYTC_MODE_PERFORM:
@@ -10165,7 +10172,6 @@ static int dytc_cql_command(int command, int *output)
 		if (err)
 			return err;
 	}
-
 	return cmd_err;
 }
 
@@ -10222,7 +10228,10 @@ static void dytc_profile_refresh(void)
 	int perfmode;
 
 	mutex_lock(&dytc_mutex);
-	err = dytc_cql_command(DYTC_CMD_GET, &output);
+	if (dytc_mmc_get_available)
+		err = dytc_command(DYTC_CMD_MMC_GET, &output);
+	else
+		err = dytc_cql_command(DYTC_CMD_GET, &output);
 	mutex_unlock(&dytc_mutex);
 	if (err)
 		return;
@@ -10271,6 +10280,17 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	if (dytc_version >= 5) {
 		dbg_printk(TPACPI_DBG_INIT,
 				"DYTC version %d: thermal mode available\n", dytc_version);
+		/*
+		 * Check if MMC_GET functionality available
+		 * Version > 6 and return success from MMC_GET command
+		 */
+		dytc_mmc_get_available = false;
+		if (dytc_version >= 6) {
+			err = dytc_command(DYTC_CMD_MMC_GET, &output);
+			if (!err && ((output & DYTC_ERR_MASK) == DYTC_ERR_SUCCESS))
+				dytc_mmc_get_available = true;
+		}
+		err = dytc_command(DYTC_CMD_QUERY, &output);
 		/* Create platform_profile structure and register */
 		err = platform_profile_register(&dytc_profile);
 		/*
-- 
2.30.2

