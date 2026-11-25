Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795630242;
	b=v/KjXa4yOlaOfh0vHbW2lyWWnTQOicBD7V7tLQZg7W4AAL2KIDlWATMWDFHoPOLmwKpx
	 YUOKb/+r8TY8q/zmZuqvzABRUh9bgj8NE3YqyMubyBsnF0h+attTzq2OWULg7toMMiwUN
	 dTlE6RpbdfukWe2fRpNLae1YXDbe+cdOmYceu3CL8QBln5yebIUFQiKgHsgxiWJOe1oQi
	 3nTay16ElGk6J0Y3BXlDCe6YdZeLy7p7D5ZWeSmV3++7m/H4+Shxb1IzkMXyh2PRlktbb
	 jz4GJgffFY0JX5Rqck41K5D0g3GJkgs3fPmit6rcSHZdtk1svY7XqFg0HruEfD0qTfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630242;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=KnukXOraUYTBmjtLj+qxsYe0H6kS5idlE9eneUElOfM=;
	b=QoLkwnQfy4Dr0j88xKwvAg5rCnw0KobU1VuYlzLwjas9paKkIGNMXBGi7z79wBg1/2N1
	 Bvm4ecR7wecD8tUjjkAB81Ywaw8SkMlij2xt4sVa2DGBSllJUFaa7QxXQO9SHz9iQZB3g
	 nmZnna4HBcDixuGn4v503Y8LGR4QRbCrY0Zu12ifC4OMdrtq3d0bUFU1wGh2WITYoVcMP
	 90mk2WCC+BUEgIkPoX2zjnur0qC4zQIg9lXJ1Up+WoH9lVF+d9Gn6suufIHglMdRzlm+k
	 4y/QuA0aFwQR94Bq5gb+l8po3WXlx5oXSWvyJc9wmDSSl6zGR3LFkRXfBX02rH11VQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=hO6hjSls;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D83606A330;
	Wed, 25 Nov 2026 18:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90D83606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=hO6hjSls
ARC-Seal: i=1; a=rsa-sha256; t=1795630143; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j04aXaaKGMenXuq+rnE9cmHaO2yeIWjlHTVa2Aq6yyAxvOA9ZBGrMRTcK6YhZ0ktCNng1pYl5psGE2RC5YJIS1Fp+3blSSWbUILMHkdLVyzB6RS5Ibi9he5+1ViymkiLHn3UjGubMcpNjGrLQok7Yo+c/lwHU6JoRNQsGp/O/4k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795630143; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KnukXOraUYTBmjtLj+qxsYe0H6kS5idlE9eneUElOfM=; 
	b=k9f7wPpO+c0Sc0fwp0eff6t+YUv3grAkX935mHXsAFbkc9C/Pg3GyPiwFQXQbTU3nOzHafPaxAl9B+YNqXOPQQuR6nRWY6aVB/KstnjllR8qkR2hp4M8/eihFjOtll7Qsykikuwa+USzcg2ANwmjOVYZr+xJW3tR9yzIUzJ0kGg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=hO6hjSlsGXibut/Nlmf/VGiHX3yVyyDfn5OPbxxznUBYOsdtrcsxDRMBvjxS7RC1gFYBYF04Mz5K7BOs46+fAXMuJ9FEkxuiIBhVcXt0NOAg/92LEiyDkMMHDfSw1jKSGZOdh5PPFDVAZI5jKYHYCFbgx66znVv87BAifnuU8xgbb7AucpapfmIXnvsONszQUndTsuuYIy4yaNUXTUYbMsipeL3wQKxUKZjpx/cRSO0A0ab969caEjq60AhhPG1MJlA5HPCxs1yGTgFxgb+3H5O6G3+jzp3lk/0x9agdDeVSOpqvqSejFc83Fh+jkAd8gVjQ51JSylvG6AOFnl/eAg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=KnukXOraUYTBmjtLj+qxsYe0H6kS5idlE9eneUElOfM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795630140619893.9382389886024;
	Wed, 25 Nov 2026 10:09:00 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Thu, 26 Nov 2026 02:08:24 +0800
Subject: [PATCH v3 6/8] platform/x86: ideapad-laptop: Trigger the EC on YMC
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
Message-Id: <20261126-ymc-82yl-v3-6-e30842671ec3@rong.moe>
References: <20261126-ymc-82yl-v3-0-e30842671ec3@rong.moe>
In-Reply-To: <20261126-ymc-82yl-v3-0-e30842671ec3@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Gergo Koteles <soyer@irl.hu>, Ike Panhc <ikepanhc@gmail.com>, 
 Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc: Eduard Aliman <edialiman20@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mahir Faisal <mahirfaisalantiq33@gmail.com>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

Currently, the ideapad-laptop driver triggers the EC with YMC command
0x01, which is necessary for existing devices in the DMI quirk table to
clear the pending event to allow further events to be emitted.

Newer models do not require command 0x01 anymore (writing it is a
no-op), but some of them require other commands to properly synchronize
and set the hardware state.

It turned out that Lenovo's YMC driver for Windows (YMC.exe) writes YMC
command 0x08/0x09 on fold/unfold YMC events, in which "unfold" means
laptop mode and "fold" means other modes.

Adopt the said sequence and combine it with command 0x01 to make
ymc_ec_trigger work on all relevant devices. For the sake of caution,
write command 0x08 only for the known fold postures. For all other
postures (including unknown ones), write 0x09 to make sure the touchpad
and keyboard are still functional. Finally, 0x01 is always written to
ensure the pending event is cleared.

Reported-by: Mahir Faisal <mahirfaisalantiq33@gmail.com>
Closes: https://msgid.link/CAGAHqH6o0TUa1HXMrNV6e+HNYwU3xxHkOM665756n8Cp3AzhVQ@mail.gmail.com
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v3:
- Always write YMC command 0x01 at last (thanks Gergo Koteles)
- Drop Eduard Aliman's Tested-by: due to the change above

Changes in v2:
- Fix typos (thanks Mark Pearson)
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 60 ++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 91a8d11c79c5..f3467cd8df36 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -133,6 +133,12 @@ enum {
 	VPCCMD_W_BL_POWER = 0x33,
 };
 
+enum ymc_cmd {
+	YMC_CMD_CLEAR	= 0x01,
+	YMC_CMD_FOLD	= 0x08,
+	YMC_CMD_UNFOLD	= 0x09,
+};
+
 /*
  * These correspond to the number of supported states - 1
  * Future keyboard types may need a new system, if there's a collision
@@ -1870,10 +1876,11 @@ static const struct dmi_system_id ymc_ec_trigger_quirk_dmi_table[] = {
 	{ }
 };
 
-static void ideapad_laptop_trigger_ec(void)
+static void ideapad_laptop_trigger_ec(u32 code)
 {
 	struct ideapad_private *priv;
-	int ret;
+	enum ymc_cmd cmd;
+	int ret[2];
 
 	guard(mutex)(&ideapad_shared_mutex);
 
@@ -1884,18 +1891,57 @@ static void ideapad_laptop_trigger_ec(void)
 	if (!priv->features.ymc_ec_trigger)
 		return;
 
-	scoped_guard(mutex, &priv->vpc_mutex)
-		ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_YMC, 1);
-	if (ret)
-		dev_warn(&priv->platform_device->dev, "Could not write YMC: %d\n", ret);
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
+	/*
+	 * Old and new models behave differently:
+	 *
+	 * - Old: YMC_CMD_CLEAR clears the pending event to allow further events
+	 *        to be emitted. Any other YMC commands are no-op.
+	 * - New: YMC_CMD_CLEAR is not required anymore and becomes a no-op.
+	 *        However, YMC_CMD_FOLD/YMC_CMD_UNFOLD must be sent on event
+	 *        (see above).
+	 *
+	 * Take the union of the two by writing both commands on both categories
+	 * of devices.
+	 */
+	scoped_guard(mutex, &priv->vpc_mutex) {
+		ret[0] = write_ec_cmd(priv->adev->handle, VPCCMD_W_YMC, cmd);
+		ret[1] = write_ec_cmd(priv->adev->handle, VPCCMD_W_YMC, YMC_CMD_CLEAR);
+	}
+	if (ret[0] || ret[1]) {
+		dev_warn(&priv->platform_device->dev,
+			 "Could not write YMC: %d/%d\n", ret[0], ret[1]);
+	}
 }
 
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

