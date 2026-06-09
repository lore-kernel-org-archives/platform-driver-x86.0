Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BEB41167B
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 21:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781040400; cv=none; b=fZmlPmVobslhnoyP2Zuyly0KfUwI+gbSvQuzhnilbnUuqVniqRKfsz5idN9b7DXD2Ji+alpb+aJf++uqt9v39y1kCwt2JSMK2b03SHMSV8KBmrFY86Cl9lgjf1X/oihu60rpfbtB6K37agWvm/q3miFxnVyVOwC47OBfoyDg/vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781040400; c=relaxed/simple;
	bh=RjcmqHddOPJFPlXAo7SY94la3yf/PIGdxvDHfx5w/Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q3FqzCHB+uR9AXeDj0QZejT7VhNI5JWTvYOH38ngaiNNShFLuiP+ZBkweW/+QpROtSUluSupVOIef2da79uIo+AI9knePAo7DIn2h7zBwPS/v9Suyw/PWfIJ7rqSg+6FfEnKTklpijtveft+vBBK2Pw6nj5shu9EpoCnc1BZ4Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaBhmIRp; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaBhmIRp"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51761d27612so71406901cf.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Jun 2026 14:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781040398; x=1781645198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q5PI7NNO6j/SihoDeyAbVWZeOHgS2VkuRW1R2tonY8=;
        b=ZaBhmIRpH1mNM3B7H2hsntKtF/ioI/t+KeEY3PrA/mabHu5QBCNuCAbdKwMPAWct3n
         5nGTHlu78eR0tahcLNvgqs2Itv+MzH3zOMZjye+QmQppyf8Wwq2rI60C+j1h5TyDp3SG
         2HzcX3x3E+dD9zQJfoylrc8/x2du+Oj7XzOvHZJjOgzfZ49ecBVsj5t3nlhcrdW7mM0L
         CNXdtqsKag9EtYBEN7fuKg8PzT/fFO6XfXnflpUYeOt3Bx31Z5PE47ddIeddELpMMQLQ
         lkhiewndxoCKOtHg73z5rnak2Z0m9iaWAwmyg0PjIXWSWO9gOSF5YpwVYc48jOJxet1X
         mgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781040398; x=1781645198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5q5PI7NNO6j/SihoDeyAbVWZeOHgS2VkuRW1R2tonY8=;
        b=SpSvMO0WlC6gGiIv5G9xe+5uot6SmyZ3HToutj2kXatqordGUFCLWH2NMD1BMRGAYK
         Xze81ajRB2K8nWN2nm1Y8RATOjRqRupCi8Rzs2mEEBHCe6pDbdjE+0OvOkbC1tu3el9b
         vKvHgj3zh+mE7v1sP0rJyEdgnlrfgHbkk2vRlcOtH64o2nbnLimHMimaLw/ntY1zm/0Y
         1e23NmDQy/JLbyQrfWnrktPZ+c5frVxVE85U233nJehn39WhJ9yRx7eq77gCnQhzz1Dx
         SpuuYH63exFpTMPE56BOBb54UGygTHrsbyt6lFOpxoCfQ8MrusbJqbQEtby8izTL0k82
         kntQ==
X-Gm-Message-State: AOJu0YyMby3aJMSFQmggJEszle5wIhghBmDxDzBpNTTZHU5djnnKWH0W
	zQcNYjIRH5G4vlsklXka1PmVb9bMZyYhgZdEGK4G5tJ2VoeMoeFZWfjsMet3y0QD
X-Gm-Gg: Acq92OHRpu7YPOSvrygUn6/FM3M2/z9j+Rx303aQUszxLTAVJHQX5N3pkyRywMwRuZQ
	8aw4aI/OPwqHE2KKfBxUMWerJoGlpNbTZBJVxKwJScASWJIWvfI6X6md00HOFRZAvxuffqyCnyo
	ta/Jx8R0KcMtXZf3Y4+NFhcfKK350/HKmSprbGqKX4aSG3A/NzGfc8RdjkFH+H6vP3pb+k79OW5
	XueWGvjusnIzDZ4W+NdQOfkN27cxSyMzK0u+C9fzfPqKq1x5miocFIYLAvYO4ifct6KLB03T7jI
	3gQXUkT2JNXk6lVK0OkAaifdRIkSW7XENjI8sHtVDzCm8G7N/IE4nauER4k9NNFOybCl6XHXtkD
	MdTIquPe0pFekCoh7SmSXkdYX0xewJ1A2dliKRQ/GluiKbbrZscDr5QVcUbMDEUKpw7Ob7D2Hz1
	rOL1iTWfuWqvhATE+r3Yzz4ee7ioBASvVrxGxkMjGT1xd03bUPR/b8abAmyPdInkGas1mcHRomr
	STLTRU=
X-Received: by 2002:a05:622a:1f9a:b0:517:8541:8b70 with SMTP id d75a77b69052e-51795c614d6mr320278931cf.45.1781040397949;
        Tue, 09 Jun 2026 14:26:37 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdcb3c5sm226713036d6.21.2026.06.09.14.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 14:26:37 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: johannes.goede@oss.qualcomm.com,
	mpearson-lenovo@squebb.ca,
	ilpo.jarvinen@linux.intel.com,
	armin.wolf@outlook.de,
	linux-kernel@vger.kernel.org,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v7 1/2] platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
Date: Tue,  9 Jun 2026 17:26:30 -0400
Message-ID: <20260609212631.925943-2-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609212631.925943-1-carvsdriver@gmail.com>
References: <20260608215205.678182-1-carvsdriver@gmail.com>
 <20260609212631.925943-1-carvsdriver@gmail.com>
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
