Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1842533C18E
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 21:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955535; cv=none; b=fUrOggtkWhXAR2e3XtkmJt0lb2LsUIXUHeNoOR7bYSdijKmdvyQm81n7V6zqdXTvibPlsUkAEmQzGuaboymeCxIrhmmm2V8QCcIRjnhNXDDHEN/PNKrPSmmftJtOzf1MFy1N61rs+d43jYYX9pD52dtADco0MKxHoFPW20vPaV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955535; c=relaxed/simple;
	bh=RjcmqHddOPJFPlXAo7SY94la3yf/PIGdxvDHfx5w/Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eyyiBKc5IcM+wwRUaLkSt5pnZC6kGp8P3rzaY1XHQB6aATZpyDCngj1QN1bYXodnPph9joVPtaHEU9aZWG5gGH83Jug0jjpU9tbdkpWMkUy8nA6ZQqBiDdjBLtjAcn73LRWXuWO5FE85ffH6vj7QfckCcJlcnONdQU605cME53Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qd958M3g; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qd958M3g"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51776b4de37so39267791cf.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jun 2026 14:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780955533; x=1781560333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q5PI7NNO6j/SihoDeyAbVWZeOHgS2VkuRW1R2tonY8=;
        b=Qd958M3g3h07DQisPbPl12ksNRKxRLOEk/rld7LRjMdhrI14YhrGSwijUEH1DowVYn
         x2M+/bA/O+fxYhQ+XeauhFdXs2v7RzHmwNfqQqg083z+Wp20Qo/ZuGhmRCLahhEr7q58
         NemN19GSrfvqUZFNJe/vu2Mwdz7dzbhe7/0rx/s9FVRDRhM8kb7z8U0LzWsJHwinRd6n
         /fkfJwSb7m8jFktyc+iLCXLIYc4gPknD724cdNdG+3hkSaIiAcDq9bm/KVIbcF6S7WRW
         s2nhChOCuWH1o4bMn+LLqZMxM4mrgpa9yT8dmekUWgKEvpgdhKFe8QXHYwVH3vmaPnPj
         RB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955533; x=1781560333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5q5PI7NNO6j/SihoDeyAbVWZeOHgS2VkuRW1R2tonY8=;
        b=PlOadMc4VQkkCgaVu/PqsDC4NgSZMJHlF/zethAnMQ0wVnq2YBMhHO9UEr4abBmL3e
         gDhuZJK3ugphC5ayckUKZ7Ecb+TI9GF1pT/mIN5GH2yzhxv70omA5QrQvgF+Vgu8sba8
         tytIW7IuwVfUWwkmHCXnThnEQoFRejOWecKtfFDBuSCnHKKnNgQSg3Ia8m0ishaOewsd
         YIvWG5EXGOZD2vdh3G7DNye2msxNTrtliIX2K2iI7Qks/YvJ5InzSwA6g6Bq/Ru8Xdd/
         VzL4tv+tdRdndoX/Z3LJGjJ/YtJEcxiMSvj1yReXNRhMIOAR1hRNI9nzfjl+8VbAiGfQ
         XJ1g==
X-Gm-Message-State: AOJu0YwoOJwpBB+QkkTtcD5vX/CjKFHt5MzDBpT4JyuJKDiQ+vkvQ2uG
	nVzH3LJAUylCWB2pEHJ/TQeU+7UwC2jmod8anoic0ygMeB0RQeyDuLBwrimNwBiO
X-Gm-Gg: Acq92OGwonWpY0VBB/KbeAHcr5vyj9Irok7fK90vuAjiolcaQ8fI9c9XrspGI4G9dB+
	JAqYSTV5Z8Ux5FF11qbCEw83neaa3o+s84GnvEkU8+xQQQTQ1Rg/ySbSDGyLvRGS6jbe4avk7HN
	aECbGbi4IcxmXGLQ81ZoKLEFkwiOsLljR03grbsjRHbAmjP85EGnmqDgxA/JN1VfMba2i5nUofA
	QFKuQKGpGYtuLJW6kG+kFkJnwVK62cwXrO97cjRJSZ5wYnyGgZnWQiA1p8Lfr11aY6lJm7I6oAb
	83U2+MQqjTXrZqVVm+fn8sjqBZa+Hb/iUUgwd18DRQkSQwkLLMbxYnWk4Zc6sNxmEewmV/PpkmN
	6JHuT0dMIOxDdt4owhDtafhTCcOor38KDfz413dkZtxt3ghobJ1MHPcfUWic18RUaFBowNWRKqD
	rjZfwapn2FIW2WRUQcZaLGVEGWj390xQviCo6DheziTdKInRokx3HzFjEHawU+T3extaneOc3ji
	nwMedg=
X-Received: by 2002:a05:622a:4c0a:b0:517:5d30:3c44 with SMTP id d75a77b69052e-51795bccdd5mr246929491cf.38.1780955533057;
        Mon, 08 Jun 2026 14:52:13 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775e27cc7sm165003741cf.29.2026.06.08.14.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:52:12 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: johannes.goede@oss.qualcomm.com,
	mpearson-lenovo@squebb.ca,
	ilpo.jarvinen@linux.intel.com,
	armin.wolf@outlook.de,
	linux-kernel@vger.kernel.org,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v6 1/2] platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
Date: Mon,  8 Jun 2026 17:52:04 -0400
Message-ID: <20260608215205.678182-2-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608215205.678182-1-carvsdriver@gmail.com>
References: <73c27728-2f07-41c1-82c7-fd6f46c89f3c@oss.qualcomm.com>
 <20260608215205.678182-1-carvsdriver@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book 9 14IAH10 (DMI product name "83KJ") has a dedicated
yb9-kbdock WMI driver that registers an input device reporting
SW_TABLET_MODE to track the detachable Bluetooth keyboard.

lenovo-ymc also loads on this machine and creates an input node with the
SW_TABLET_MODE capability bit set.  For input switches, the presence of
the capability bit has semantic meaning: userspace (e.g. GNOME) reads
the switch state at startup from every node advertising the capability
and does not expect more than one such node.

Add a DMI match for the Yoga Book 9 14IAH10 to probe() so that
lenovo-ymc returns -ENODEV on this hardware, leaving yb9-kbdock as the
sole SW_TABLET_MODE source.  The ymc_ec_trigger EC write, the only
other action taken in response to a YMC event, is guarded by a separate
DMI table that excludes this machine; no other functionality is affected.

Signed-off-by: Dave Carey <carvsdriver@gmail.com>
---
 drivers/platform/x86/lenovo/ymc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ymc.c b/drivers/platform/x86/lenovo/ymc.c
--- a/drivers/platform/x86/lenovo/ymc.c
+++ b/drivers/platform/x86/lenovo/ymc.c
@@ -23,7 +23,23 @@ module_param(force, bool, 0444);
 static bool force;
 module_param(force, bool, 0444);
 MODULE_PARM_DESC(force, "Force loading on boards without a convertible DMI chassis-type");

+static const struct dmi_system_id lenovo_ymc_nosupport_dmi_table[] = {
+	{
+		/*
+		 * Yoga Book 9 14IAH10: SW_TABLET_MODE is reported by the
+		 * yb9-kbdock driver.  Suppress lenovo-ymc on this machine to
+		 * avoid userspace seeing two input nodes that both advertise
+		 * the SW_TABLET_MODE capability.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83KJ"),
+		},
+	},
+	{ }
+};
+
 static const struct dmi_system_id allowed_chasis_types_dmi_table[] = {
 	{
 		.matches = {
@@ -100,7 +116,10 @@ static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 	struct lenovo_ymc_private *priv;
 	struct input_dev *input_dev;
 	int err;

+	if (dmi_check_system(lenovo_ymc_nosupport_dmi_table))
+		return -ENODEV;
+
 	if (!dmi_check_system(allowed_chasis_types_dmi_table)) {
 		if (force)
 			dev_info(&wdev->dev, "Force loading Lenovo YMC support\n");
--
2.54.0
