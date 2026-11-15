Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794770956;
	b=zqoV5GaEigQSSRkAb2HNeWwl3xBWl7u5Kc+EHmXrZjvq03SZ6CuObbZuooNOe3SW8LHx
	 2cAvuJC7hP1Q1nt8kRIyjX8lT7J6W3x9avxpmuN72MzKYz4VNksP/1S18hL5NBisbxsBk
	 g3Chmn1dQ4W55Yxh2zkITg8qhMxlFG+a5bAlTJ1r4ewu0Q10yzFkk0JicTmB5qQZtznip
	 rV9zn37hnf3Vz6mXUeaa5n7nN5ReFyTUHHJw4DifYBdZf7j2EPvXLrtgAJR5Mbb0EwHRF
	 nAMFjUvB/AE4jwHB/2jXFWcp7LzeAtl7mF5cNAwjmC8y80uof0crUSkFyze61dRBz/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770956;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=Hv56jpEyFNcmLukHiB+/AwT2nL1lrQT43J9JrpDo44Q=;
	b=OutTRM1y7lAqlmn9SKqpNsX1ZXUAEIeQlAw3uw1HyiwFDRfSbjYoGYRT7jM+SRFq3Os5
	 fEH59JqoSGmXmjagEGNpXo4B2k0SUFlmZjKZQKrzkz+MKjaluGV4V31BnjzFdxvUVtsE2
	 L61IMtrxZnwTv7dBwDpK3ECNbqu12vUgZi/kNulMH1Y7OLEysxQOvOYzJP5KYfwkJkly5
	 bof84z+wYFwNpGy1fJH8+ZFCgxxq6ZVytv431atsfU0Rb7hSL0Cf/TuCKDV9DQZiwGSsI
	 AXMQED1ibaT+LQxE+OYT1mPp7b590W2P9v5wZBgOWPp4T7fJXZmkGVvG7lkax/OX85Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=TUx+wCDS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242EA606A8AD;
	Sun, 15 Nov 2026 19:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 242EA606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=TUx+wCDS
ARC-Seal: i=1; a=rsa-sha256; t=1794770897; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nvtb04WEiXsTDQZawmcOTnfcLzgrfBlapgjNAdolZfmANKIeYIf1aBray1cIatUl7ErSuuAEOhZyRNQnx57fbgZqR1RIBwIj6dTgqD1fIPw5bAsC/WqVA5HhgRF7IvwjgJcsBwhP/gjngroFj2VGdayzfEhEkDOIimy6omhqqRc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794770897; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Hv56jpEyFNcmLukHiB+/AwT2nL1lrQT43J9JrpDo44Q=; 
	b=aPE8IaW1ykdsjN8tcY8ZY/Peq1OeP7TS2FSMMUDIr0xpoCrXA0ROsGLyg2I/kmJjJczwAmXcum82c6KjfFQQkU0b6mbpMT43usKsEyobXNncHVPbOVUBREL/ebOxVojcvM/aMOwtO92rF9Zhp+SLNevX8u018Y/y6Yttl9Ga6wc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=TUx+wCDSAGb1xk0H6L/HOVXmHnr3EoYQHri6W0JET66fHuTCrOHV7a9X7FV7ofF2zWiX8dlGN7P7qtytd/Yf3sQytJB573Eqsa+vW+ycwFyNujZz9u2YxaNBDpP87QzJI//61L/CmJts+Ks6YbMHUUNGC/OMzY02NQxoqgVr/qVhbaL0TYEIebSUsCdnEBic5wpmWV7empuXZ7I4dg5AkYMYM+ZKI+VZe9Uc1rpe/0oU6HN/ankI08B54UMQVMc6E7U1hbaqNxmgV0Nz8zZbQ2mfTAWMgWKTz2zrNSMRYA5NUfp2mveFyINDtaAzY2Ub07vn6gx8RHtchhQhdafX1Q==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=Hv56jpEyFNcmLukHiB+/AwT2nL1lrQT43J9JrpDo44Q=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179477089501944.93221648530698;
	Sun, 15 Nov 2026 11:28:15 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Mon, 16 Nov 2026 03:27:07 +0800
Subject: [PATCH 6/7] platform/x86: ideapad-laptop: Trigger the EC on YMC
 events following Windows behavior
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-ymc-82yl-v1-6-fac1a2b01a84@rong.moe>
References: <20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe>
In-Reply-To: <20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Gergo Koteles <soyer@irl.hu>, Ike Panhc <ikepanhc@gmail.com>, 
 Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mahir Faisal <mahirfaisalantiq33@gmail.com>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

Currently, the ideapad-laptop driver triggers the EC with YMC command
0x01, which seems to be randomly chosen with trail-and-error and turns
out to be not a command for YMC events. While the devices in the DMI
quirk table recognize it, some other devices do not, making the
trigger_ec functionality a no-op.

Lenovo's YMC driver for Windows (YMC.exe) emits YMC command 0x08/0x09 on
fold/unfold YMC events, in which "unfold" means laptop mode and "fold"
means other modes.

Adopt the said sequence to make it work on all relevant devices. For the
sake of caution, only emit YMC command 0x08 only for the known fold
postures. For all other postures (including unknown ones), emit 0x09 to
make sure the touchpad and keyboard are still functional.

Reported-by: Mahir Faisal <mahirfaisalantiq33@gmail.com>
Closes: https://msgid.link/CAGAHqH6o0TUa1HXMrNV6e+HNYwU3xxHkOM665756n8Cp3AzhVQ@mail.gmail.com
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 35 +++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 91a8d11c79c5..4f9dc95d8c65 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -133,6 +133,11 @@ enum {
 	VPCCMD_W_BL_POWER = 0x33,
 };
 
+enum ymc_cmd {
+	YMC_CMD_FOLD	= 0x08,
+	YMC_CMD_UNFOLD	= 0x09,
+};
+
 /*
  * These correspond to the number of supported states - 1
  * Future keyboard types may need a new system, if there's a collision
@@ -1870,9 +1875,10 @@ static const struct dmi_system_id ymc_ec_trigger_quirk_dmi_table[] = {
 	{ }
 };
 
-static void ideapad_laptop_trigger_ec(void)
+static void ideapad_laptop_trigger_ec(u32 code)
 {
 	struct ideapad_private *priv;
+	enum ymc_cmd cmd;
 	int ret;
 
 	guard(mutex)(&ideapad_shared_mutex);
@@ -1884,8 +1890,29 @@ static void ideapad_laptop_trigger_ec(void)
 	if (!priv->features.ymc_ec_trigger)
 		return;
 
+	switch (code) {
+	case YMC_POSTURE_TABLET:
+	case YMC_POSTURE_DRAWING_BOARD:
+	case YMC_POSTURE_TENT:
+		/*
+		 * Sync keyboard backlight and disable the touchapd and keyboard
+		 * only when the device is folded...
+		 */
+		cmd = YMC_CMD_FOLD;
+		break;
+	default:
+		/*
+		 * ...IOW, whenever there is a chance that the device may be
+		 * unfolded, e.g., in laptop mode or any other unknown modes,
+		 * sync keyboard backlight and enable the touchapd and keyboard,
+		 * so that users don't lose input.
+		 */
+		cmd = YMC_CMD_UNFOLD;
+		break;
+	}
+
 	scoped_guard(mutex, &priv->vpc_mutex)
-		ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_YMC, 1);
+		ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_YMC, cmd);
 	if (ret)
 		dev_warn(&priv->platform_device->dev, "Could not write YMC: %d\n", ret);
 }
@@ -1893,9 +1920,11 @@ static void ideapad_laptop_trigger_ec(void)
 static int ideapad_laptop_nb_notify(struct notifier_block *nb,
 				    unsigned long action, void *data)
 {
+	const u32 *p = data;
+
 	switch (action) {
 	case IDEAPAD_LAPTOP_YMC_EVENT:
-		ideapad_laptop_trigger_ec();
+		ideapad_laptop_trigger_ec(*p);
 		break;
 	}
 

-- 
2.55.0

