Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D90D349CC1
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 22:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795386; cv=none; b=LW3eCKHQSuEQaenEuOb670gSws3Z4t6fJchWWn/oa5MTIPDdmAeo8pRP9+I2mkvGfe5MhPZHX7yahrxERf2m3+aFd9Jc5WJblz1qF6FBw1kb/mMxjcfSiyYQpvyFdmLFbkPhSKNtA7YoFDQTUCta5FJSQEctf7tLUXQbr4voHjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795386; c=relaxed/simple;
	bh=ODSEOHVW4KYU9xP2cIISQVh2g4cADrCkR6ETTeHmPoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZtPr3M6ax1fnm8kbT3ZWaOeCjy7JVOXIwYAyJQmF3IGi47E0lvlRgS1DYfSyUDOcI1+c4nl69FmBztDWQj++W5/wWt7k/d+XfwTpLO4NfnjXET4S/6xKji5eZwHkG/mw1jSNozEpqfr1Lpom4FUU41QH+N8PYvFLVGjnKUThHio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8bXM6do; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8bXM6do"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso2578574a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 15:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795384; x=1786400184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtKu0FT85uYm4ILu5Mq1OuaF/iNH/TftNn4lcGyvoLs=;
        b=d8bXM6doaHydHzm6dzFOTn3SCRvyLcTVDpPyP7wmAcp6XXXCw/36DwNmzblGsPzaES
         Eh+WCh9n4xGq6/afaevwQOqTX64K5FmseuGSgMkprXgJ3CTC0LBAxh2s2m83ksTnUIvw
         T5FMqPBb/76hIPjmC8/c30ri1kuGX/f8eb8Yy/tFlPfZSiprQNVZN5zLRz66ZBaxVpZQ
         Z3bmLyGO3hzUypiRpiVHqYGRAp8+YkwFx3RAMxRTvtDEHX5QQbxlcWCA92L1MHYkZLVB
         S/KEZzhqncWHVKzUa/qRPxQkxGSW2KFwbl+fv41gUsYWFEgp3O+wcYo8n301rE4dQjij
         aeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795384; x=1786400184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gtKu0FT85uYm4ILu5Mq1OuaF/iNH/TftNn4lcGyvoLs=;
        b=ssdjSh3vnMhjbYc2FfTZrZZrSLaqBWOTBZLoZ+hshZ/zCVQsZQhxTe93rs0nrikqVp
         EozlBYEQgXWY1PEcQJMypAYskk0OsY6f77ZV+EVF5gKVAT3UdyHVNPk9HXpoifOdF/k/
         kCB4d35SNieARIX67aDrIv6WOIvqfSxmKCX17gu79UYRyCy63k9FSOC6Er5iS9Kz4gAc
         9klL78Wu+NPHltVor1+rOxmENfUcMcd/hSIC5mb/w3xS8ldAVYOMIB/eQb8+0562XgDN
         2QohSOqGEsU1iI8VhggXdKUvsine+sB6iAESYOTGXh2ReDOcm/qKKjX2hTiiAZNjoTnT
         2g1w==
X-Forwarded-Encrypted: i=1; AHgh+RrpeoThyXrIsOm+DSShzZUoPEty/rhhQzDEVdYVq2GW0cLYaF63c6aLf4EhjJSOe3XlP9U/u8NueLcQf0kZ76dIlVOK@vger.kernel.org
X-Gm-Message-State: AOJu0YwOyTLke/h8kYWYf5DGYy7EhWYKXUGWZis4jUQokXX3r4Ga9lKI
	TthZH2WOiYF5aDOZpORcwNrrrTE8uLG/V4DwH62+OFwGYIPta06sdD9A
X-Gm-Gg: AR+sD11LQNgzUlu7YnqJydUJW/2Iz/xZLSpqbRjs+N0Wxx8O1XAagblAKs9XxcMsWNT
	Y9zUZZ9/0R6IKQIQc9Bt/VD1vbyKQ13OyfKu0tJs4x61Rt0/BEyPGzX54VRZESmMvmtA6lotj8/
	fXotpNi+JZ9seRvHSsR3AT7OBBOlWZG+WHjcrZZzV4rdczOCh3J7QDUDLu1EGPODlVLMLEM1DtF
	mdM2kH8WgOCblfDVqyFolE7QXsYOa3NjDH+yv0s5ZBXqwhJDo/YmSKPp78vjrmhEoW7zDQOSEgB
	6h0hA1xG8ka1DrPIVqlB2AoVCXKPP59naqQjtljPr+tgU564KJOp6XjKWXduPDNhmQ8Oudl1E5o
	NNPDOZExo1CRzE2xOpsR2cwRyea07U70Czqwlgn2FKzn/gogSoNsfRhjY9N40uDenJ47vOSFncW
	Bb4vkgYTO1XoIjTPWaa78SKjJRNFxqms1HaFOHSrADN6947YwIi96q+RHbt2eXl1Z1u8K0J8N02
	izcCfwC8+cV+miffVzlr6Mf/fd6wP+lO9HuwGsDEw==
X-Received: by 2002:a05:6a21:696:b0:3c3:a7ab:135a with SMTP id adf61e73a8af0-3c92a749b53mr11060704637.20.1785795383620;
        Mon, 03 Aug 2026 15:16:23 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm38685666c88.1.2026.08.03.15.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:16:23 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: lkml@antheas.dev
Cc: W_Armin@gmx.de,
	corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	kuurtb@gmail.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: [PATCH 4/6] platform/x86: msi-wmi-platform: Clean up devices
Date: Mon,  3 Aug 2026 15:16:12 -0700
Message-ID: <20260803221614.59324-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803221614.59324-1-derekjohn.clark@gmail.com>
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current driver has multiple minor mistakes. Fix them all in one
cleanup patch.

- Device names are inconsistent/incorrect for the quirk table
- Per the Windows DLL, PL2 must always be at least 1W higher than
  PL1. Give PL1 and PL2 different minimum values.
- Copy buffer before write to ensure payload is sent instead of stale
  data

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/msi-wmi-platform.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index fdc2f6f4ca7e..35cd35fc6446 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -124,8 +124,9 @@ struct msi_wmi_platform_quirk {
 	bool charge_threshold;	/* Charge threshold is supported */
 	bool dual_fans;		/* For devices with two hwmon fans */
 	bool restore_curves;	/* Restore factory curves on unload */
-	int pl_min;		/* Minimum PLx value */
+	int pl1_min;		/* Minimum PL1 value */
 	int pl1_max;		/* Maximum PL1 value */
+	int pl2_min;		/* Minimum PL2 value */
 	int pl2_max;		/* Maximum PL2 value */
 };
 
@@ -229,8 +230,9 @@ static struct msi_wmi_platform_quirk quirk_gen1 = {
 	.charge_threshold = true,
 	.dual_fans = true,
 	.restore_curves = true,
-	.pl_min = 8,
+	.pl1_min = 8,
 	.pl1_max = 43,
+	.pl2_min = 9,
 	.pl2_max = 45
 };
 static struct msi_wmi_platform_quirk quirk_gen2 = {
@@ -238,14 +240,15 @@ static struct msi_wmi_platform_quirk quirk_gen2 = {
 	.charge_threshold = true,
 	.dual_fans = true,
 	.restore_curves = true,
-	.pl_min = 8,
+	.pl1_min = 8,
 	.pl1_max = 30,
+	.pl2_min = 9,
 	.pl2_max = 37
 };
 
 static const struct dmi_system_id msi_quirks[] = {
 	{
-		.ident = "MSI Claw (gen 1)",
+		.ident = "MSI Claw A1M",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
 			DMI_MATCH(DMI_BOARD_NAME, "MS-1T41"),
@@ -253,7 +256,7 @@ static const struct dmi_system_id msi_quirks[] = {
 		.driver_data = &quirk_gen1,
 	},
 	{
-		.ident = "MSI Claw AI+ 7",
+		.ident = "MSI Claw 7 AI+ A2VM",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
 			DMI_MATCH(DMI_BOARD_NAME, "MS-1T42"),
@@ -261,7 +264,7 @@ static const struct dmi_system_id msi_quirks[] = {
 		.driver_data = &quirk_gen2,
 	},
 	{
-		.ident = "MSI Claw AI+ 8",
+		.ident = "MSI Claw 8 AI+ A2VM",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
 			DMI_MATCH(DMI_BOARD_NAME, "MS-1T52"),
@@ -1131,7 +1134,7 @@ static int msi_wmi_fw_attrs_init(struct msi_wmi_platform_data *data)
 
 	if (data->quirks->pl1_max) {
 		err = msi_fw_attr_init(data, MSI_ATTR_PPT_PL1_SPL,
-					&fw_attr_type_int, data->quirks->pl_min,
+					&fw_attr_type_int, data->quirks->pl1_min,
 					data->quirks->pl1_max, &data_get_value,
 					&data_set_value);
 		if (err)
@@ -1140,7 +1143,7 @@ static int msi_wmi_fw_attrs_init(struct msi_wmi_platform_data *data)
 
 	if (data->quirks->pl2_max) {
 		err = msi_fw_attr_init(data, MSI_ATTR_PPT_PL2_SPPT,
-				       &fw_attr_type_int, data->quirks->pl_min,
+				       &fw_attr_type_int, data->quirks->pl2_min,
 				       data->quirks->pl2_max, &data_get_value,
 				       &data_set_value);
 		if (err)
@@ -1259,6 +1262,7 @@ static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const char __user
 		return ret;
 
 	down_write(&data->buffer_lock);
+	memcpy(data->buffer, payload, data->length);
 	ret = msi_wmi_platform_query(data->data, data->method, data->buffer,
 				     data->length);
 	up_write(&data->buffer_lock);
@@ -1266,10 +1270,6 @@ static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const char __user
 	if (ret < 0)
 		return ret;
 
-	down_write(&data->buffer_lock);
-	memcpy(data->buffer, payload, data->length);
-	up_write(&data->buffer_lock);
-
 	return length;
 }
 
-- 
2.55.0

