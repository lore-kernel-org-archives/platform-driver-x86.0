Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781051;
	b=1PGHckCEx3dKxGbsafsLUpaUOLt5wa6Ga57PDizl7ZYl/5Zwz4lwxwWVxC+eDhLV/qUF
	 up+HmO4wyh5qHAeO9AMMqrCWM+n+5AVYx14Us96m4QLC7BcU6Yhft38YUuBo9b7rJnXn9
	 nIYElgqCnXT0a26xWowMy1zXA5Z5aOXH0LUPeT6S8QIow/duvflwvv6fKxTDgsO8avsnY
	 IPbq6Xq3l6X7GobKZJToh7foqt0AcXgR770kpVgq0OmOjMSOmUtVQHncxIj/v+ZOsvcLh
	 eqa+gmHpMgG2ZGK9Tqz1pslHKzhU9NvVbUXzqJFUzhxyJtboLi4KaKVZhUIiKH2XRvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=J4z7YTm/HmymP5wjcBtsKuR1HCPYnY6zL96h41EyxMo=;
	b=J+BfKVQ3JLzxP/ZEM/cYPGnHMhmzUXlOTwMsYpoeWmb7ORpE9QLNGoPbMVYO4CMxUVcB
	 o9kQuJxdYvD41dwp7lDqi2J7r9IswxZaXj55dP1lW5LP4Erj6LTq/4IrUoSF3KkKnTXuC
	 h7cPdacLW4T4M7qUZOeA1rdRv3eI4nl6zJQmTD+My+8VBaqN5I//zbMFjD3yUuPUA8wMu
	 2cFQiqOmpkSYE3PDJb/N/cVKigdITZXJvq4clgvKksZcIT4IP1EwgG55WCDhbqLWgfbTa
	 ObtZIm7WJhd3+3B26Sjx2aWop1o294n6PpGC7FjuE8jGUm/FNSKEhSc3vAx7ON0MQTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YeOF3RHO;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEAE606A31C
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 12:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BEAE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YeOF3RHO
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3adfcafaabbso74397881fa.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 04:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795781049; x=1796385849; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J4z7YTm/HmymP5wjcBtsKuR1HCPYnY6zL96h41EyxMo=;
        b=YeOF3RHOL/+1WOWZjLZLtB6OFpF4s9Vqclg5qL2ZDaODVF8zrh1p+fd3MNRxkKmIFj
         XEqXT1DrxW4WIl2/pevOt6QYbvuCSq4AGHn4/fYYxD0EfPAxp/37Udj9JL6R+VWXYU6A
         kTfMqyes8/Cp5z1qxko6tFyQaj0cd2ctUWBeXvtyLMpc7HPFmIdjKj4+lHFC7ejycpOs
         YsO2bIVTy+TMk3scHaXeEz4sL4nlvrTzotigewuVoSMazGQvDrQPOmZ7094jnNJu2//d
         sLb8wd8hvG7qnwrnuT3KDRrsCBdwy74j1WvPLd6m5AXLFyN2lz8l73q2azf4QM7tHtkI
         Xcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781049; x=1796385849;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J4z7YTm/HmymP5wjcBtsKuR1HCPYnY6zL96h41EyxMo=;
        b=iOqtKu0oYrD9amgOaBXKN+8wiCGKJYRnCYSNhu80sewdfadhsbVIPKizbBJTsH9lmk
         ooyYzPTO/mJZ9aaGGBeapkKQtbSD6cycfF1Qzva+UOv8a9Rp4p7dJZWRQFwfa4WG4sZJ
         SFpYPRAE0ac5td9w1WrtZl+uC8e5pY5O/1W5xZpBcao2HFD3g8AxorW1PIbmfSiL39Pk
         8+QL2SHLMOIQlaLpaTVBAxD+ytkL7v+GfyID2IqkKmHiNRgFMxrdagcKtGgTmig5Nzsg
         UDCgPXAZ+yitJ41e7UDUasRxhpR2pd2dZN2FFvm+joD3oNn4c9qnFvmZK5Hv82OXuWVv
         FOJg==
X-Forwarded-Encrypted: i=1; AL+hErEeL/83woz1z9vncPYG7AL3jhHeeQLe83GjNTyMjDGC9IuTVWh1Pl/blU7BT4KiSKemrX1pzhpvFPRGPbzNaLYbajFm@vger.kernel.org
X-Gm-Message-State: APuU4Z9GAq6p2lygay/z7439VDS8SbkK8X+BC52tIkr8tysGFs8rnwPP
	XAq0Ozhys9zBfGThnBeVZzmtE+Kv6QdgxqNEOKWPscUkG/BGT7pGxe3D
X-Gm-Gg: AZFdTZcEVJPJ7+HryFaIyLgBc2tiIR1ylJGCawR9Lv5AqbFrzkInxSXG3SlvXSg+1x0
	1JSgEyzplZ9yKCn1B5c4jUNudj5WhiANgA5iXlMjRdamezujV5hgiIaZkJIOAky9OtNtn8xqfPY
	vmIBnHI9vZ6ZSC4tMBxADHIpkwJ/JEXBLOWlKFaHCeJKfEtQcR8HGuzNKagwXGWhphIg6kqHKpn
	Do/Ex/avcstznsboSeYfU5baZrRbHX+F5HPEsnnChdSAZ3fg8dcUb/Q9IG8y4zMCh2sqLfzZDXo
	DgC4zni1TfHNj5K8KZrHmEzlWe5AzXeb31rW1TGamfCp2loUdV7NY0r7PVgJZ9xbuvtt0ZX0ahR
	9m1x7rMDMBYN1Gi3O6bA0yPiKcg3WEFQIMCE4cbx9u8AIRy1ZHKmP50YInWjd1Vp2qLnUImqeKM
	/nswgWLCzRc6OsCVjxb5p4cRBe1V1+zrRslWM/CeAwcNjzuBz2i2x+NLa4S36GtreE7CnxPCDHr
	aGG4lPI3GHXtZM7qQ042zcC6K4rwoyuBrjm0xT3O77R38TwX58erMHFl6YAipm2BQSlGP1YFYmN
	9oXljxbcEy6S58o4C8bSb7eluqNdxqKcOGFwWm6Cs7xgdQAB8XMyjCPtyXgs/kSkOLtDUYMIfFU
	cDkzLN/5DZZ+TnQfRtdtVJVko54anQusliz906tjCu+3jGkg=
X-Received: by 2002:a05:6512:438e:b0:5c3:23d0:6651 with SMTP id 2adb3069b0e04-5c323d06e4cmr2144052e87.19.1795781048441;
        Fri, 27 Nov 2026 04:04:08 -0800 (PST)
Received: from [127.0.1.1] ([85.97.71.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm47438875f8f.48.2026.11.27.04.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:04:07 -0800 (PST)
From: Sercan GOKMEN <gokmensercan@gmail.com>
Date: Fri, 27 Nov 2026 15:04:06 +0300
Subject: [PATCH v4] platform/asus: asus-wmi: Skip keyboard backlight
 read-back on B9406CAA
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
Message-Id: <20261127-b4-asus-wmi-b9406caa-kbd-readback-v4-1-9bfadcdb4293@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOwQ4BMRQF0F+Rrj1p+8aYWvkPsXht31CMkZZBZ
 P5dhwWJDcub3Jx77yJxDJzEfHQXkbuQQnvIoRiPhNvQYc0QfM5CS10qqTXYAiidE1yaANYUsnR
 EsLMeIpO35HZA7CttpugrNCI7x8h1uD43lqtXTme7ZXca4KGxCenUxtvzRKeG3j97nQIFtUVkb
 yrvVblYNxT2E9c2Ytjr9IeI8hdRZ9GRQWuNRFN/ifgWlcZfRMyi4rKaTanGmcRPse/7B42pVd+
 IAQAA
X-Change-ID: 20261022-b4-asus-wmi-b9406caa-kbd-readback-aed82953d839
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Moad Tarrih <tarrihmoad@proton.me>, Burak Goncu <burakgon12@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sercan GOKMEN <gokmensercan@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795781046; l=4682;
 i=gokmensercan@gmail.com; s=20261022; h=from:subject:message-id;
 bh=vs+gF8r5ReWO7LIjCGgXuPE/JnzduMohQVHYdMynTBo=;
 b=9jAAbAxotf1ozZ97NxC5LkaajJaaFcrvl7/tqUno5UQEIK00Rek8Y/l2QkkjtpHVMYKuLMWez
 1VY77U3Z2qZCW/mrT4i/p8Nvod0UYo9ESjoesMLRcoyPHLroU4eQva0
X-Developer-Key: i=gokmensercan@gmail.com; a=ed25519;
 pk=nFIlLCcGouUfBov8xxW0K4qUtEjdhJniMOO8WCSqghU=

On the ASUS ExpertBook Ultra B9406CAA (BIOS 312), DSTS(0x00050021)
always returns 0x550000: the presence bit is set and the level is 0,
whatever level the EC is driving. The DSDT builds this reply from
constants and never reads the EC. Writes work.

kbd_led_get() stores every read in asus->kbd_led_wk, so each sysfs read
resets the cached level to 0. sysfs, UPower and brightnessctl then
report 0, systemd-backlight restores a dark keyboard at boot, and the
next Fn backlight key press always gives level 1.

Add a kbd_led_no_readback quirk that makes kbd_led_get() return the
cached level, as the !kbd_led_avail path already does, and set it for
this board. Every path that changes the level keeps kbd_led_wk current.
Until the first write after probe, the driver still reports the 0 it
read at probe time.

Signed-off-by: Sercan GOKMEN <gokmensercan@gmail.com>
---
Tested on the B9406CAA (BIOS 312) on Linux 7.2.3: brightness reads back
the level written to it, UPower reports the same value, and the Fn
backlight key steps 2 -> 3 -> 0 -> 1 from level 2. On 7.3.0, 7.3.5 and
7.3.6, with the same change built as a DKMS module, writes of 3/1/0/2
read back unchanged.
Build-tested on review-ilpo-next (6fc627bda235) with W=1 (clang).

The patch was prepared with the help of an AI coding assistant (Claude
Code). I reviewed it and tested it on the hardware.
---
Changes in v4:
- Rebase onto review-ilpo-next, on top of the G814FP kbd_led_no_wmi
  quirk (Ilpo).
- Link to v3: https://patch.msgid.link/20261123-b4-asus-wmi-b9406caa-kbd-readback-v3-1-1e6875af3703@gmail.com

Changes in v3:
- Rebase onto review-ilpo-next, after the move to drivers/platform/asus/,
  and use the platform/asus prefix.
- Trim the commit message.
- Drop the comment on the quirk_entry field and shorten the one on the
  quirk.
- Link to v2: https://patch.msgid.link/20261030-b4-asus-wmi-b9406caa-kbd-readback-v2-1-ca93bb9039f6@gmail.com

Changes in v2:
- Shorten the subject (Burak Goncu).
- Say that kbd_led_wk keeps the 0 read at probe until the first write
  (Burak Goncu).
- Move the test details below the cut (Burak Goncu).
- Rebase on current for-next.
- Link to v1: https://patch.msgid.link/20261022-b4-asus-wmi-b9406caa-kbd-readback-v1-1-fb33ed98dd16@gmail.com
---
 drivers/platform/asus/asus-nb-wmi.c | 15 +++++++++++++++
 drivers/platform/asus/asus-wmi.c    |  3 ++-
 drivers/platform/asus/asus-wmi.h    |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/asus/asus-nb-wmi.c b/drivers/platform/asus/asus-nb-wmi.c
index 9b2a4b8298..ef8d6bca57 100644
--- a/drivers/platform/asus/asus-nb-wmi.c
+++ b/drivers/platform/asus/asus-nb-wmi.c
@@ -97,6 +97,12 @@ static struct quirk_entry quirk_asus_g814fp = {
 	.kbd_led_no_wmi = true,
 };
 
+/* B9406CAA: DSTS(0x00050021) always reports level 0 */
+static struct quirk_entry quirk_asus_b9406caa = {
+	.wmi_backlight_set_devstate = true,
+	.kbd_led_no_readback = true,
+};
+
 static struct quirk_entry quirk_asus_q500a = {
 	.filter_i8042_e1_extended_codes = true,
 	.wmi_backlight_set_devstate = true,
@@ -180,6 +186,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_g814fp,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUS ExpertBook Ultra B9406CAA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
+			DMI_MATCH(DMI_BOARD_NAME, "B9406CAA"),
+		},
+		.driver_data = &quirk_asus_b9406caa,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. Q500A",
diff --git a/drivers/platform/asus/asus-wmi.c b/drivers/platform/asus/asus-wmi.c
index d42efc6521..552080ff5b 100644
--- a/drivers/platform/asus/asus-wmi.c
+++ b/drivers/platform/asus/asus-wmi.c
@@ -1976,7 +1976,8 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
 
 	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
-		if (!asus->kbd_led_avail)
+		if (!asus->kbd_led_avail ||
+		    asus->driver->quirks->kbd_led_no_readback)
 			return asus->kbd_led_wk;
 	}
 
diff --git a/drivers/platform/asus/asus-wmi.h b/drivers/platform/asus/asus-wmi.h
index e53c6b3fc6..14f2c6c8b2 100644
--- a/drivers/platform/asus/asus-wmi.h
+++ b/drivers/platform/asus/asus-wmi.h
@@ -53,6 +53,7 @@ struct quirk_entry {
 	 */
 	int no_display_toggle;
 	u32 xusb2pr;
+	bool kbd_led_no_readback;
 };
 
 struct asus_wmi_driver {

---
base-commit: 6fc627bda235ac5b6f43b5f784b81d6c2450ae5a
change-id: 20261022-b4-asus-wmi-b9406caa-kbd-readback-aed82953d839

Best regards,
--  
Sercan GOKMEN <gokmensercan@gmail.com>

