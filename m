Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426931;
	b=4A48vvQAeaobqx1xxtIntQTc08VN8cVLT65lOIIZgw646GQZXyUMz9Hemz1dtb58E2DJ
	 APQv/xpjrOLchQE/b0Ety9WEcibWhdXo8vpYDFC7ViA2uBLpphVkV/iiboIcFm4U3VL2f
	 rVO7U7kNkCH2F1wHMLubMVEzMAcM8EFrDMi/j4pjApQkmNiGjKI17/6cBWsI5Vq9+Z3gR
	 zaZ/HMBIADhGghnt+UdfUhHQ0miFzqK5rRL7nyAXjxiWGSTpJ/ubSwqc0ltTGrhu7Ktyx
	 iQekORX7cudoJIE7LYCb02p5ydF2jOLQL9BoVj0TKVagR2Qz1RocRgy9Z22MZSbH0zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Uwclkd70WMb7Wc7NZ9jA+4hNfpuCqx21LkN7LDxWsVQ=;
	b=T8Rtp/7ATmFPSa8qtcLLkHlDdx8gHvsIjhevr6eD2N079u4AyKIZT1DARMRsQCmLuwO/
	 I3JBeidAVvlm7WMv1bKodA6tzhrF4PzwB3lDa/RGcQ+I+G0sTDRYKIt7+ZRe6fU85y9am
	 7/DBmQCmUZ80EjjcjhvqYFlhTG7FA7ROfvq8JJse+IlJIXwz1s12J3zfDi/KSia0QWX8Q
	 5WY7y179K7+UKgZu0zPKKXFTjnJcp5Q1S3eXYgvRGysd3gRjqX/uWpiGBKYnofiB1dJW2
	 LQGyLzmJ3wcC4tjyxVZa/ntqkeWL1QQZWaaoKgCTC3Cl0GeplDmgQw77966o56odW6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AuIktz7s;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFE7606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 09:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCFE7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AuIktz7s
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so1504925e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 01:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795426929; x=1796031729; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uwclkd70WMb7Wc7NZ9jA+4hNfpuCqx21LkN7LDxWsVQ=;
        b=AuIktz7syzWPH8OqGO16+pChAtFpQRDoo2mpuAl8u9DlWKEE1sUfsFHoShkvM9Xu5/
         /EgCzn0IzHxG0v0ShzWMyJ01cLLfUpp9T82HK1JL57Kzx7JmkVZ/yhwnNYB/JXw0g91+
         p7XzdwZmdZ3wAJBBPHzC82JB96Dol6T7MUyH6cdkx3/iaMEa0m1GqEz5WyRMnut8vVGf
         gJpeTQQlkUrFTktXNgjfm82CqfmmjV2wOhRKL/cSncWKn8xoMeRxHk3e8y25AzFCu/06
         aHoiAaFCitU3Xqj7a2cD0ARHGjQaMdlcOLmVd0Ni98GC8tF9jZICJbUUSUAkJoTk9KQ9
         KlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426929; x=1796031729;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Uwclkd70WMb7Wc7NZ9jA+4hNfpuCqx21LkN7LDxWsVQ=;
        b=fcLH0QscGd2E4U/3XoND87HcBh2s9t9er2GsQy+EF39a7gUvQn/oyxM1ekeEO9RLJB
         lp2SEBB0Wsl/El+FoBeIeA/DjjE7T75QLFxbshgzYCPB2xvmYkJzsGa3XtdJskfbMeos
         07pMa5nvsfshIRsg1QTKsBqrqvii3IgJ4lCkbbkfxKkO+K+6f629urmYCJXYbjMa5MNn
         i9gpKdl1sL3/NkdxQdGstu4rZP7I4pC93Bv61e/P0qj+/Jy8iRMROBs0RSAQJkn60h4w
         VKg78aAY1xhvCkLKh4vuGXPPhMYMer+6fup2z81zhP4BMbRVF1t9Gn+tRKUQHSdf9iag
         2RMw==
X-Forwarded-Encrypted: i=1; AL+hErGoAxuHTG1/cb0OD+fF1d04AK3iURfhvoyD70N/USfLVGgx/pV3yYwMuBt5oKJOxphUc/OV6e70PWpRMARQ8r6ObkYN@vger.kernel.org
X-Gm-Message-State: APuU4Z+AvDEGzB6YxobO9d/UOqq35h0jRX9zX6uZcWMimHgKbFiYri5j
	ouL11Xz8vHwLGrcgUnEkrTaHEkJtAoAWUGvobJZ9zJ9n+b/Zd8/GTXo8
X-Gm-Gg: AZFdTZeVH18FyH/KOJt0m3V2yLuNyXdtj04J4UYOcnX7HIbsVmjvlPxwBMQlfgazU6d
	iS66Eo50Jc9A1piFcgNT/Sv8VV/GRkijHPlq2xvC3lUZcD3ip6r/Od+krnWQSXCfMOSiCaRQXuM
	GF0jLEUsegCs9xX1vJdIts/VU4F+G4bKBVsus+HLRC2dj/ThNldlGwEJv9bUR8fEHNXRP7yYXw1
	sFX37w6iqHlacIW5BP/ooxNbglQdU1ln3Wdev0HODus+n4U40vWMmYYLwcVb06YpU7gNX6lMTyU
	8pzNMEXGScwYle8uFMMXlBDQL7KILhOMKkK8AlvTM47R77W2ozjrwUSYaTM8Rpp1ri9uaI+lvoJ
	p7i15HtUwD1x7Edmtm1MVGXypzaZSXT8sElk7sv6htsLtvE6+VHYTH+34cgSGKOFveL+jotOD7g
	q5Wh43BEFdTKV8HAeI4mZeR4u+/IRGx9VtiradIzY9vi0yY35UGKM9LqPQcxy9W59Y5UZ66Yfq+
	P/XzWd6rHGMtHueHqy5iW7bM3OVGbByvMfoUC+aF08svyTHlX8c1XsW6lTZBIsuQNQXdSNmYMs/
	HHYKnMW6FFn49FLNrXcokfI5W6pY1n4teJBQKy6dbkzEhM8IYEtQ5hj6wcYX4/V+Tj3N3NZ0y/8
	jgnRR7OuEn52B3BrKB/qvnRZYcoB1AO9D1ggpsCChruNscXY=
X-Received: by 2002:a05:600c:3f0a:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb8880cde7mr213486475e9.22.1795426929109;
        Mon, 23 Nov 2026 01:42:09 -0800 (PST)
Received: from [127.0.1.1] ([85.97.71.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm334955785e9.7.2026.11.23.01.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:42:08 -0800 (PST)
From: Sercan GOKMEN <gokmensercan@gmail.com>
Date: Mon, 23 Nov 2026 12:42:07 +0300
Subject: [PATCH v3] platform/asus: asus-wmi: Skip keyboard backlight
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
Message-Id: <20261123-b4-asus-wmi-b9406caa-kbd-readback-v3-1-1e6875af3703@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOyw6CMBBFf8V07Zg+kFBX/odxMW0HqAiYFlBD+
 HcBN7rT5UluzrkjixQ8RXbYjCzQ4KNvmxnUdsNsiU1B4N3MTHKZCi4lmAQw9hHutQejE55aRKi
 Mg0DoDNoKkFwm9V65TGk2e26Bcv9YG6fzm2NvLmS7RbwsSh+7NjzXE4NYdv/0BgECcqMUOZ05J
 9JjUaO/7mxbs6U3yA+j4r8Y5Wy0qJUxmiudfxmnaXoBUeK9lDYBAAA=
X-Change-ID: 20261022-b4-asus-wmi-b9406caa-kbd-readback-aed82953d839
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Moad Tarrih <tarrihmoad@proton.me>, Burak Goncu <burakgon12@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sercan GOKMEN <gokmensercan@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426927; l=4769;
 i=gokmensercan@gmail.com; s=20261022; h=from:subject:message-id;
 bh=V/Am6+fbXbJkDo7e2qx/4cM5ZZeA3AaF52oI6Qyyu4I=;
 b=hmm8VSWeyUoWR4KByn1xNXfl0UiZ+b8uLlR2Wn68E3ZDfBIp/X6Iv3RHGNigB11rn5TtMUMgE
 oT2Wn5Q176IBSL/oj4FXCWMQCo3crvT47YZ9un1BnWH+I6HbgEMbvXB
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
backlight key steps 2 -> 3 -> 0 -> 1 from level 2. On 7.3.0 and 7.3.5,
with the same change built as a DKMS module, writes of 3/1/0/2 read back
unchanged.
Build-tested on review-ilpo-next (2268d837dea1) with W=1 (clang).

This conflicts trivially with Moad Tarrih's G814FP patch, which adds a
quirk_entry field and a DMI entry at the same places:
https://lore.kernel.org/r/20261116-asus-wmi-kbd-readback-v5-1-f2f170836bf4@proton.me
Applied after it, only asus-nb-wmi.c needs the two entries merged.

The patch was prepared with the help of an AI coding assistant (Claude
Code). I reviewed it and tested it on the hardware.
---
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
index 3b0f3346dc..420fdced34 100644
--- a/drivers/platform/asus/asus-nb-wmi.c
+++ b/drivers/platform/asus/asus-nb-wmi.c
@@ -93,6 +93,12 @@ static struct quirk_entry quirk_asus_unknown = {
 	.wmi_backlight_set_devstate = true,
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
@@ -167,6 +173,15 @@ static int dmi_matched(const struct dmi_system_id *dmi)
 }
 
 static const struct dmi_system_id asus_quirks[] = {
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
index b33ebdb21a..725f827a17 100644
--- a/drivers/platform/asus/asus-wmi.c
+++ b/drivers/platform/asus/asus-wmi.c
@@ -1975,7 +1975,8 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
 
 	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
-		if (!asus->kbd_led_avail)
+		if (!asus->kbd_led_avail ||
+		    asus->driver->quirks->kbd_led_no_readback)
 			return asus->kbd_led_wk;
 	}
 
diff --git a/drivers/platform/asus/asus-wmi.h b/drivers/platform/asus/asus-wmi.h
index b45f81b38a..72a43586ff 100644
--- a/drivers/platform/asus/asus-wmi.h
+++ b/drivers/platform/asus/asus-wmi.h
@@ -52,6 +52,7 @@ struct quirk_entry {
 	 */
 	int no_display_toggle;
 	u32 xusb2pr;
+	bool kbd_led_no_readback;
 };
 
 struct asus_wmi_driver {

---
base-commit: 2268d837dea13a78639fa3dad60472bb67478709
change-id: 20261022-b4-asus-wmi-b9406caa-kbd-readback-aed82953d839

Best regards,
--  
Sercan GOKMEN <gokmensercan@gmail.com>

