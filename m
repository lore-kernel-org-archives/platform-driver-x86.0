Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795544414;
	b=qQjmIQyW/hH76kHF0QOhumSp/NLJ0TMkhdXBReRj9FOdNU8nV0cvhUn0ewUsiJooEgj7
	 NDsd1bxLRgC0bzOGwLzdD8QV6Uh51Vd7xs0G0bXjUp/fyXTWLVe14/cyAnqcLZSWRyB7z
	 nT14G3Q9tWe/yvQDJQ0T0+emqfrVKMIvBfiHlpeYq1nFlrVP0GMs8BhyCLgExa4PnH/WJ
	 WkUHJ/ho3kDHKaQnhwrHg3/zu8RbRBhvzX5z7FWZAEiCktavZuNoJNtOBn38o9szEkmxB
	 wXpsb/7rGwBbE773Hj1G0NM9YnStrmXj7jBhtSd2n+0VL6JA6bQ0FmC2V2dPEraaCMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544414;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=bKpgatmxUa55yxAWRxpgGdPKA3RPX5U3wNy4QwwxQFI=;
	b=VyE8U7TInubIy+D8AOsM9OY9rjmqwPSrL3av13Myp62QnWcc/V9qr7etx9quo5R34358
	 uqquTJy/SNgNKiaJiScc2kSczX3haVPw0oOzl2KUnb/yavQqOUy8wLsH+w4WSEtNh6R12
	 uzDrG4agu268jwRDZUdppBKt19+IhYbJSOAvbjC6ivKQBVH2jE6rRFzUbYSj4xNXxRBXF
	 gC509+2wzyDv3OvIpAOhKFvs6D20E9IWoA0QXfs3cUADSOU3trdk6ogNw/HzIW6WPTcHI
	 shWo1PxDKvZ0McsRva9wf9RwY6vEtw7D0xtGyEDIoPjtnpIBnPaTJOgNQDESq1c1O6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=VrUYcqdd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72EC606A695;
	Tue, 24 Nov 2026 18:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C72EC606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=VrUYcqdd
ARC-Seal: i=1; a=rsa-sha256; t=1795544286; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P67kMpT2JueENBhkVaz424MZHMp/hnGaLz3xZUrE1CfT+9y9eEuZi7CZry0NUrJsDx87PWxmnkXDC9xBgsChRtgcPmMPweNHjcf8mLSC+8G7v4FFWfDCW+EqbKz41D3xD/T4rksxS4QaIx39V8yjyAtm9HKyuPuv8IYQbPQuSDs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795544286; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bKpgatmxUa55yxAWRxpgGdPKA3RPX5U3wNy4QwwxQFI=; 
	b=hrzRAvj4sEssqT1s67mLZ4Gr+Z9RhbTAyUb1y+yr+Qu9X8twAaaOMGtLoBC6mSkj8QhUuERuK93t7MQZ1lfUr90Ww+PGjkNJzO4M5NDCyXP5emz5jutIZLeuGmaj2Ol2T77kBya8ZplQStccCt+KfbQdkzknO6zrFf9K/El7M1k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=VrUYcqddmKYKs+d7kJcvQOegQQkAQFB2MqkluCSm7Y6cAHh/YdgclH2JmusBkmPptn9Y6QHbKI4abm2OhqGCxe4bEuuNB4Oh6r/M6+PckFZ+S2zrOiTkESm3Y+k+U5qT4nswiiwFrBW9viyylyt1xDXrluPBQlOj/m2P0iUsMES+F024lW3MHGjxwM9HkSyJiM6WK/b4iIyEJvGqnB9Ws+wb7+ix2w7zC3xabkDpDIv4xlLB9CZU4xtUOJOqsCWqipESesopqJZaPYb+/qFUBnAMQ20rsZ34IjaU3vfwISzaE1wjelJj7okx1zDGF2M30AYuEIY8WpeRhRrEOFffmw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=bKpgatmxUa55yxAWRxpgGdPKA3RPX5U3wNy4QwwxQFI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795544283120254.4060037016501;
	Tue, 24 Nov 2026 10:18:03 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Wed, 25 Nov 2026 02:17:02 +0800
Subject: [PATCH v2 6/7] platform/x86: ideapad-laptop: Trigger the EC on YMC
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
Message-Id: <20261125-ymc-82yl-v2-6-624bdcb3c50e@rong.moe>
References: <20261125-ymc-82yl-v2-0-624bdcb3c50e@rong.moe>
In-Reply-To: <20261125-ymc-82yl-v2-0-624bdcb3c50e@rong.moe>
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
0x01, which seems to be randomly chosen with trial-and-error and turns
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
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Fix typos (thanks Mark Pearson)
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

