Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCA8C433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Mar 2021 17:50:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A41BA64F93
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Mar 2021 17:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbhCKRt3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Mar 2021 12:49:29 -0500
Received: from mail1.bemta24.messagelabs.com ([67.219.250.113]:21234 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229459AbhCKRtB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Mar 2021 12:49:01 -0500
Received: from [100.112.134.46] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.us-west-2.aws.symcld.net id A3/71-28581-C085A406; Thu, 11 Mar 2021 17:49:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsWS8eIhjy53hFe
  CwZbJVhZvjk9nsvjcMZnFYvWeF8wOzB7zTgZ6vN93lc3j8ya5AOYo1sy8pPyKBNaM7bPOMxW8
  Uau40hPfwLhUvouRk0NI4D+jxJINUV2MXED2a0aJaXevMIIk2AS0JbZs+cXWxcjBISIgI/Fhr
  SdImFkgWqL57RVWEFtYIEhi+65mJhCbRUBVYvGdLjYQm1fASuLug6ssILaEgLzE/9ZTYPWcQD
  Vnuh6zQOxVkbj/YAlUvaDEyZlPWCDmy0s0b53NDGFLSBx88YIZ5ASQOffmCUCMTJDo+feIbQK
  jwCwk3bOQdM9C0r2AkXkVo3lSUWZ6RkluYmaOrqGBga6hoZGuobGRrpmxXmKVbpJeabFueWpx
  ia6RXmJ5sV5xZW5yTopeXmrJJkZgaKcUtNjvYJzx5oPeIUZJDiYlUd4MPq8EIb6k/JTKjMTij
  Pii0pzU4kOMMhwcShK8X0KBcoJFqempFWmZOcA4g0lLcPAoifAWgqR5iwsSc4sz0yFSpxgVpc
  R5n4MkBEASGaV5cG2w2L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3H8gUnsy8Erjpr4A
  WMwEt9lIFW1ySiJCSamAqEnywUWvW/NXMKyY9mGTDeaD79G17/y/vtqrzSq9cc16TV2nn/HeT
  tk9MEHf+9cim+lvB1O8eTdbz65aF9R0r9Pt+5eS2lhDLs1ua7uSX21nrRdyVme1yVCNU2V4yb
  Jvizl6znsB28wnfOPgSNk6ojmX8dd+368HkSZIqXTtusfgbVrq+j37LJBy7ymV/5YEFLNW7BE
  4wa6vsU1EQfmekKlK25MeXxvSpMbrX37vK6233ip7EkzLrgNvrSNesPfIJ4ofnXfnFt3eaxzz
  rLZprtN6FOqWvZVVtLba8WMFeZc/UduGblwZf/y/BC5tOXnp59sLWBJs/UzmeiVqJnbod/U1y
  tvYT1pl8e35ff3VXiaU4I9FQi7moOBEA9Vv1k2gDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-2.tower-346.messagelabs.com!1615484938!2663!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20913 invoked from network); 11 Mar 2021 17:48:59 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.12)
  by server-2.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Mar 2021 17:48:59 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 5675D883C23D56FAE3C4;
        Thu, 11 Mar 2021 12:48:58 -0500 (EST)
Received: from localhost.localdomain.com (10.46.59.53) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 11 Mar 2021 12:48:56 -0500
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] platform/x86: thinkpad_acpi: check dytc version for lapmode sysfs
Date:   Thu, 11 Mar 2021 12:48:43 -0500
Message-ID: <20210311174843.3161-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.46.59.53]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Lenovo platforms with DYTC versions earlier than version 5 don't set
the lapmode interface correctly, causing issues with thermald on
older platforms.

Add checking to only create the dytc_lapmode interface for version
5 and later.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 91 ++++++++++++++++++++--------
 1 file changed, 65 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index b881044b31b0..f7de90a47e28 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9845,6 +9845,11 @@ static struct ibm_struct lcdshadow_driver_data = {
  * Thinkpad sensor interfaces
  */
 
+#define DYTC_CMD_QUERY        0 /* To get DYTC status - enable/revision */
+#define DYTC_QUERY_ENABLE_BIT 8  /* Bit        8 - 0 = disabled, 1 = enabled */
+#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revision */
+#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
+
 #define DYTC_CMD_GET          2 /* To get current IC function and mode */
 #define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
 
@@ -9855,6 +9860,7 @@ static bool has_palmsensor;
 static bool has_lapsensor;
 static bool palm_state;
 static bool lap_state;
+static int dytc_version;
 
 static int dytc_command(int command, int *output)
 {
@@ -9869,6 +9875,33 @@ static int dytc_command(int command, int *output)
 	return 0;
 }
 
+static int dytc_get_version(void)
+{
+	int err, output;
+
+	/* Check if we've been called before - and just return cached value */
+	if (dytc_version)
+		return dytc_version;
+
+	/* Otherwise query DYTC and extract version information */
+	err = dytc_command(DYTC_CMD_QUERY, &output);
+	/*
+	 * If support isn't available (ENODEV) then don't return an error
+	 * and don't create the sysfs group
+	 */
+	if (err == -ENODEV)
+		return 0;
+	/* For all other errors we can flag the failure */
+	if (err)
+		return err;
+
+	/* Check DYTC is enabled and supports mode setting */
+	if (output & BIT(DYTC_QUERY_ENABLE_BIT))
+		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
+
+	return 0;
+}
+
 static int lapsensor_get(bool *present, bool *state)
 {
 	int output, err;
@@ -9974,7 +10007,18 @@ static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
 		if (err)
 			return err;
 	}
-	if (has_lapsensor) {
+
+	/* Check if we know the DYTC version, if we don't then get it */
+	if (!dytc_version) {
+		err = dytc_get_version();
+		if (err)
+			return err;
+	}
+	/*
+	 * Platforms before DYTC version 5 claim to have a lap sensor, but it doesn't work, so we
+	 * ignore them
+	 */
+	if (has_lapsensor && (dytc_version >= 5)) {
 		err = sysfs_create_file(&tpacpi_pdev->dev.kobj, &dev_attr_dytc_lapmode.attr);
 		if (err)
 			return err;
@@ -9999,14 +10043,9 @@ static struct ibm_struct proxsensor_driver_data = {
  * DYTC Platform Profile interface
  */
 
-#define DYTC_CMD_QUERY        0 /* To get DYTC status - enable/revision */
 #define DYTC_CMD_SET          1 /* To enable/disable IC function mode */
 #define DYTC_CMD_RESET    0x1ff /* To reset back to default */
 
-#define DYTC_QUERY_ENABLE_BIT 8  /* Bit        8 - 0 = disabled, 1 = enabled */
-#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revision */
-#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
-
 #define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
 #define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
 
@@ -10211,28 +10250,28 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	if (err)
 		return err;
 
+	/* Check if we know the DYTC version, if we don't then get it */
+	if (!dytc_version) {
+		err = dytc_get_version();
+		if (err)
+			return err;
+	}
 	/* Check DYTC is enabled and supports mode setting */
-	if (output & BIT(DYTC_QUERY_ENABLE_BIT)) {
-		/* Only DYTC v5.0 and later has this feature. */
-		int dytc_version;
-
-		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
-		if (dytc_version >= 5) {
-			dbg_printk(TPACPI_DBG_INIT,
-				   "DYTC version %d: thermal mode available\n", dytc_version);
-			/* Create platform_profile structure and register */
-			err = platform_profile_register(&dytc_profile);
-			/*
-			 * If for some reason platform_profiles aren't enabled
-			 * don't quit terminally.
-			 */
-			if (err)
-				return 0;
+	if (dytc_version >= 5) {
+		dbg_printk(TPACPI_DBG_INIT,
+				"DYTC version %d: thermal mode available\n", dytc_version);
+		/* Create platform_profile structure and register */
+		err = platform_profile_register(&dytc_profile);
+		/*
+		 * If for some reason platform_profiles aren't enabled
+		 * don't quit terminally.
+		 */
+		if (err)
+			return 0;
 
-			dytc_profile_available = true;
-			/* Ensure initial values are correct */
-			dytc_profile_refresh();
-		}
+		dytc_profile_available = true;
+		/* Ensure initial values are correct */
+		dytc_profile_refresh();
 	}
 	return 0;
 }
-- 
2.29.2

