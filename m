Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DB5C433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Apr 2021 23:32:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6B0661279
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Apr 2021 23:32:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbhDFXc3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Apr 2021 19:32:29 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.1]:45425 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232362AbhDFXc3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Apr 2021 19:32:29 -0400
Received: from [100.112.2.115] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.us-east-1.aws.symcld.net id A0/D6-44756-38FEC606; Tue, 06 Apr 2021 23:32:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsWSLveKXbf5fU6
  CwfK5GhZvjk9nsvjcMZnFYvWeF8wOzB7zTgZ6vN93lc3j8ya5AOYo1sy8pPyKBNaMfTd7GQv2
  S1Vc3PONsYGxT6yLkYtDSOA/o8SXjlesEM4rRon7114zdjFycrAJaEts2fKLrYuRg0NEQEbiw
  1pPkDCzQLRE89srrCC2sICVxI6WCcwgNouAisTJHUfYQcp5BWwkeo5XgYQlBOQl2q5PB5vIKa
  AqcabrMQuILQRUfv/BEjYQm1dAUOLkzCcsEOPlJZq3zmaGsCUkDr54wQwz58qk7awQdoJEz79
  HbBMYBWYhaZ+FpH0WkvYFjMyrGM2SijLTM0pyEzNzdA0NDHQNDY10jXQNjU31Eqt0k/RKi3VT
  E4tLdA31EsuL9Yorc5NzUvTyUks2MQKDO6WAqX0HY+ubD3qHGCU5mJREeefNy0kQ4kvKT6nMS
  CzOiC8qzUktPsQow8GhJMGb9wYoJ1iUmp5akZaZA4w0mLQEB4+SCK/7O6A0b3FBYm5xZjpE6h
  SjopQ4rx5IQgAkkVGaB9cGi+5LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5uUGm8GTmlcB
  NB0Yp0M0ivFJnM0EWlyQipKQamIJFJzm/6S6pzl+Wdjfh9v7z9+dzvGSwD1s2Y0Oo2s0DVyc4
  M9odW65sfO7mI8m++dF7BM8dKWl8lcEuVW84deu7EBETO3O1ZicvabN3fXcYH+2tvbWpfPKcU
  6dvzZ8fsP3O9GS1zUEV/+3m/ZsS5mJ0Inxh4p07HfJbviVWccTX95deNbGXVGzp1nks6mw931
  Ehhy2ANbznRWCSrY7SunfPZ8wK0OJ5Yioo7rjmmZxVn+P7Nc33PHtVX5f6z07ue524KfSDkz6
  f+t78Dw981nQf/2Y2KXxpb3rQPMMjf/fJV7bosLNkV3hdi1Fe7q1+I/OvXL4Vx87wmyqORatY
  aoz+/9XO761cXa3htFtOiaU4I9FQi7moOBEAbUGoymkDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-15.tower-386.messagelabs.com!1617751937!176507!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8182 invoked from network); 6 Apr 2021 23:32:19 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-15.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Apr 2021 23:32:19 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id A04B6FA043EF495972CF;
        Wed,  7 Apr 2021 07:32:16 +0800 (CST)
Received: from localhost.localdomain.com (10.46.192.8) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 6 Apr 2021 19:32:14 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v2] Add support for DYTC MMC_GET BIOS API.
Date:   Tue, 6 Apr 2021 19:32:03 -0400
Message-ID: <20210406233203.232860-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.46.192.8]
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
Changes in v2:
 - remove unwanted debug code

 drivers/platform/x86/thinkpad_acpi.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0d9e2ddbf..07de21941 100644
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
@@ -10271,6 +10280,16 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
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
 		/* Create platform_profile structure and register */
 		err = platform_profile_register(&dytc_profile);
 		/*
-- 
2.30.2

