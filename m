Received: from mail03.loswebos.de (mail03.loswebos.de [213.187.93.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF46321CC4F
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Aug 2025 20:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.187.93.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755550228; cv=none; b=NDNV9N9UzckI7CPEnW7wddeD2Wu7JYZYB0JL6SD42G7Bc0st24BW0YYkPZbHcqmUkhmAdBVkE7ryKyzHVL0bmXfiEuFfzWOliPhMWJdmp8dTxX5qHVjZQSbKv11jGkFk9ZWfayimeL/7GiDnvStJMnenqSVQw8+YoJeLO0IxJOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755550228; c=relaxed/simple;
	bh=cNBISzRQEYbcWEl8xuvM9PQ4ny4tbZBnB6MD89yO6nc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L3LudwlM2uzbbFMDbi7ciOZtQKV6UjsAYDbmOzSS6OM4WjZX9gIX3JT5hTJPeLXryFKjSSHUWj0XjWGWNwCp7RgJgwXhX/v6CreDWXwc4cMz7I92hn/z9hjR/l9pFTLN5paKXUNH1e51hZTThFBj+wYV0c+QxkqlWTIPbNOJDwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protoco.consulting; spf=pass smtp.mailfrom=protoco.consulting; dkim=fail (0-bit key) header.d=protoco.consulting header.i=@protoco.consulting header.b=AYZ0mGff reason="key not found in DNS"; arc=none smtp.client-ip=213.187.93.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protoco.consulting
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protoco.consulting
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=protoco.consulting header.i=@protoco.consulting header.b="AYZ0mGff"
Received: from mail-proxy-01.loswebos.de (mail-proxy01.loswebos.de [213.187.93.160])
	by mail03.loswebos.de (Postfix) with ESMTPSA id A643B47F011;
	Mon, 18 Aug 2025 22:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=protoco.consulting;
	s=protoco-consulting; t=1755549841;
	bh=cNBISzRQEYbcWEl8xuvM9PQ4ny4tbZBnB6MD89yO6nc=;
	h=From:To:Cc:Subject:Date;
	b=AYZ0mGffd66BTKXepmSBeRVB/R/Fwl4yy0wNVdV/gXFKMtecnn8uxy+JEA9MeqDFh
	 YSkWwuyVg2DpcGwyq9xtD88rHb6Xfzx/bThK5MWSbCZBJlGtRJE8ADDv1SUfM8SvzY
	 BZqwb49FkfUCt5TtnmvA+MaiwKY/EdY8qdbi43ju7Ehv/bh7X9CwVJVtuADmuadyL3
	 f2QjAtc4XcdHgxV8AHjekkq9qYV7PVUA1aehPj1QTH7kkb+3eGEg2GzbVPvOk1ciGs
	 GMZL9JBDzuY7VeeI8RsggiudmRfa0u4TjW3ZYaoAIK01cych34grPSAdvK0WUl60n4
	 AL91da0OKe9Hg==
Received: by local.marc.ngoe.de (sSMTP sendmail emulation); Mon, 18 Aug 2025 22:43:57 +0200
From: Marc Burkhardt <marc.burkhardt@protoco.consulting>
To: platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Marc Burkhardt <marc.burkhardt@protoco.consulting>
Subject: [RFC PATCH v1] platform/x86: thinkpad_acpi: Add parameter to suppress invalid thermal sensors
Date: Mon, 18 Aug 2025 22:39:51 +0200
Message-ID: <20250818204353.857304-1-marc.burkhardt@protoco.consulting>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While moving an existing Icinga installation to a Lenovo P15 20SU I came
across broken JSON output from a "sensors -Aj" command consumed by the
Icinga check_lm_sensors plugin. After fiddling around trying to build a
fix in either lm_sensors or Icinga I found out the error was rooted in
some sysfs file that was created but threw errors while being read. On my
Lenovo ThinkPad the default fallback to 8 temperature sensors creates
sysfs entries like in my case "temp8_input" that fail when read, causing
the issue in user-space.

This patch adds a module parameter (suppress_sensor) using
module_param_array() to allow users to specify a comma-separated list of
zero-based sensor indices to suppress sysfs file creation (e.g.
suppress_sensor=3,7). Instead of a model-specific quirk, this provides
flexible configuration for any ThinkPad with similar issues and is working
out-of-the-box without additional models being marked for the quirk. The
parameter uses a fixed-size array based on TPACPI_MAX_THERMAL_SENSORS (16)
consistent with the driver’s thermal sensor handling (ie.
ibm_thermal_sensors_struct or sensor_dev_attr_thermal_temp_input).

Logging via pr_info() reports the number of suppressed sensors at module
initialization, and pr_info() logs each suppressed sensor during sysfs
attribute creation. Invalid sensor indices are logged once via pr_warn()
to avoid repetitive warnings. Tested on a ThinkPad P15 with
suppress_sensor=3,7, confirming suppression of temp4_input and temp8_input
with no sysfs errors. Bounds checking for uncommon values is in place or
will be logged.

The patch applies to the current
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git although
it was initially written for a 6.16.0 kernel.

I look forward to any feedback on the patch and/or handling of submission.
Please CC: for now as I am not (yet) subscribed. Thank you.

Signed-off-by: Marc Burkhardt <marc.burkhardt@protoco.consulting>
---
Notes:
I haven't posted on LKML or send a patch for over a decade now so
please forgive any possible mistakes I made regarding current coding
conventions or more generally in submitting this patch. The patch was
running for some time here with faulty sensors removed from sysfs and no
problems otherwise detected and was surely run through checkpatch.pl before
submission. get_maintainer.pl was helpful to find the hopefully right
people for CC:ing but I am otherweise totally unaware of any current
procedures or best-practices when it comes to submitting a patch.

drivers/platform/x86/lenovo/thinkpad_acpi.c | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index cc19fe520ea9..30ff01f87403 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -6019,6 +6019,30 @@ struct ibm_thermal_sensors_struct {
 	s32 temp[TPACPI_MAX_THERMAL_SENSORS];
 };
 
+static int suppress_sensor[TPACPI_MAX_THERMAL_SENSORS];
+static unsigned int suppress_sensor_count;
+
+static bool is_sensor_suppressed(int index)
+{
+	unsigned int i;
+	bool logged = false;
+
+	for (i = 0; i < suppress_sensor_count; i++) {
+		if (suppress_sensor[i] == index)
+			return true;
+
+		if (!logged &&
+			(suppress_sensor[i] < 0
+				|| suppress_sensor[i] >= TPACPI_MAX_THERMAL_SENSORS)) {
+			pr_warn("Invalid sensor index %d in suppress_sensor\n",
+				suppress_sensor[i]);
+			logged = true;
+		}
+	}
+
+	return false;
+}
+
 static const struct tpacpi_quirk thermal_quirk_table[] __initconst = {
 	/* Non-standard address for thermal registers on some ThinkPads */
 	TPACPI_Q_LNV3('R', '1', 'F', true),	/* L13 Yoga Gen 2 */
@@ -6313,6 +6337,11 @@ static umode_t thermal_attr_is_visible(struct kobject *kobj,
 
 	int idx = sensor_attr->index;
 
+	if (is_sensor_suppressed(idx)) {
+		pr_info("Sensor %d suppressed\n", idx);
+		return 0;
+	}
+
 	switch (thermal_read_mode) {
 	case TPACPI_THERMAL_NONE:
 		return 0;
@@ -11653,6 +11682,9 @@ static void __init thinkpad_acpi_init_banner(void)
 			thinkpad_id.model_str,
 			(thinkpad_id.nummodel_str) ?
 				thinkpad_id.nummodel_str : "unknown");
+
+	pr_info("Suppressing %d user-supplied sensor(s) via parameter suppress_sensor\n",
+		suppress_sensor_count);
 }
 
 /* Module init, exit, parameters */
@@ -11785,6 +11817,9 @@ MODULE_PARM_DESC(experimental,
 module_param_named(debug, dbg_level, uint, 0);
 MODULE_PARM_DESC(debug, "Sets debug level bit-mask");
 
+module_param_array(suppress_sensor, int, &suppress_sensor_count, 0444);
+MODULE_PARM_DESC(suppress_sensor, "Comma-separated sensor indices to suppress (e.g., 3,7)");
+
 module_param(force_load, bool, 0444);
 MODULE_PARM_DESC(force_load,
 		 "Attempts to load the driver even on a mis-identified ThinkPad when true");
