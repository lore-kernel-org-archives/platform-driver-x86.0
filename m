Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793350606;
	b=Fnv9sRRkI/60HpxnTvKxiS7xJBVAQUcAc8ypgLaCkBCvQX5gUICqZH8bvwBseHydbyge
	 IoTjqGZeM2/4mUJdHz4Da9NjN3hzKclGxdOX00U7Ow5yN2Uy2B/RLfvM0CFfYUN0yx/MH
	 MgNh6eWNRIxSch6kzhi6td9uQFFfL1HnFjCdbySEvH6/3ZleKLujynMpFdqpgnmLq3WdO
	 1euCK0wfsWAYGVICdd4lWwnLDSRuVdFUVON3+mxGLmPGEXsiei7RuDXMWRUuwDmSR0QH6
	 A/BkrNDLFrQVQKB7wK2QUFeNSV3gSrrrXCgPund3IT02sECZzkIKZLwxajm/8pm0FXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350606;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gWmoXQw8Wf5NvoN23qdkKZUrhi2J9jvdIIsbCyGL8xs=;
	b=2q10jPrrfxwdO4Hz0QUUtRKNJqjAwmgXBRm4G0w7OyAvhKsWUn5XYU5PRaVel1d+xEU/
	 N3oNEcTXDdGey7FuMuKK+/HyH+so5IENjFo71F1BQNPTQ06D+6GqsHQGdGKgUUywpKsDu
	 KeOzJMzj36JRZkn8IfxffoAI5LOyq2kQc6uPdfjPrB4JMZfYchOypN7LxEoiXH5lZxMPu
	 ner3E0kTIHJeXYNusgBM2y+fVV+jb550Riu8iYtQhKd520gCauz1jPNM5sWXQfOnnvBjX
	 vZ9Y7L8VCDA8G+FUY7yIOc9E19g55xK22o8rKCwRI5N2HVLQ5t/Sy3g05s3lyI0VbGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EScQNKtv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6825F606A322;
	Fri, 30 Oct 2026 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EScQNKtv
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793350606;
	b=vvY4q1Crdf2e8CCCpuVQHP8FFlP1vsGFFLAqMbZsENwm+SqWJ22iccTKzZDneLgOXU98
	 HZq/U7ZhrtNfLUKpNn9eKAMmsGLXVjpw7lNGIUThGKOfgSwCwFeNpcyr/JDYSIwvBXsqa
	 MGqZLVKaMfaMChyOaPpinNEbxrtCId7ht3/FGnJ4xEF9pKKYy+NcaXRJgNqop+h9AqD5Y
	 UyvKX6+Rrs0bx6bcarce7+OFtSHF1CiAidBmY8LXjq2p3zbjYP6fZpo0+XKFTV6pSBe9D
	 C4KuXD6qpRF5vzs2h+fUwbjC20zDLYJt46hUosl9kYGpSrNbevS6R0x/WENVLDZJHjw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793350606;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gWmoXQw8Wf5NvoN23qdkKZUrhi2J9jvdIIsbCyGL8xs=;
	b=ghsB5OWDFVm35U4zlD/ZgumbP8lrZtYB7T2yMcvUSFjKfeQkcNkFI/9Y5nXPf9naMDWQ
	 temoXPTEiTebpNF7oPeyFL6L4Oh73uwxZdqPRwp43zhS969gUhtuFgcJJmSa0yTLrH9XP
	 i1QzYOBlQHjS+B12Xr4SOp/9le8MWDA4CYdzc1wCgisRE9it6H1fhjq9UTs8NBqFp8ThH
	 UHPa7rI7yCwHIrtEhGHhCU3jBu8F6pXrjoONwAY0OYZzpm0NjIS8up0fXcWRFSWHCo4t5
	 OeHk5/92t/anPWptbFnRUV+XW4PLj7901Ib07T7fpCuj5vvP08t+cAZRMi1SKRRdwRg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 600DC1F0093A;
	Fri, 30 Oct 2026 08:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793350606;
	bh=gWmoXQw8Wf5NvoN23qdkKZUrhi2J9jvdIIsbCyGL8xs=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=EScQNKtvOW/RfwH4OROBk0anOwlRmFi2eAcmFHQ6n05jOwupDvsPFtJHOFP2u1qQC
	 ZAek4xJg/oQ84VH/C7x17h4aR5rwR63nV8+fLuDwqXcV7lQSmNG+U6M3ZhuMitIc/V
	 Jj0kHhgqj2dafFbUEELzZyVV07B5p2CWvVA0vZoDZJcZMEW2VvlKQ5duu6R5dtuWOn
	 asY+p3byUyvqdb3hAzMHjezlgJAqI9WS2/nTvP15aK1/rYkcy5jVwSiDpmHC23wdTV
	 a5W86avoFtmbpv+zlKzW+254PbHc+HOQomr8lhBUJWm3KLBgWkbBlD07jclkLdjjX9
	 z6tIXnr7rdgUQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AFABB436F1;
	Fri, 30 Oct 2026 08:56:44 +0000 (UTC)
From: Sercan GOKMEN via B4 Relay <devnull+gokmensercan.gmail.com@kernel.org>
Date: Fri, 30 Oct 2026 11:56:44 +0300
Subject: [PATCH v2] platform/x86: asus-wmi: Skip keyboard backlight
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
Message-Id: <20261030-b4-asus-wmi-b9406caa-kbd-readback-v2-1-ca93bb9039f6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0K6dgxtkVBX3sOwmHYGqAiYFlBDu
 LugJ3D5kpf//iIiB89RnJNFBJ599EO/gTokwjXY1wyeNhYqVblMlQKbAcYpwrPzYE2W5g4RWks
 QGMmiawGZCmVOmgptxLbzCFz517dxLX8cJ3tjN+7Du9H4OA7h/T0xy937pzdLkFBZrZlMQSTzS
 92hvx/d0IlyXdcPA1Ri6eQAAAA=
X-Change-ID: 20261022-b4-asus-wmi-b9406caa-kbd-readback-aed82953d839
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Burak Goncu <burakgon12@gmail.com>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sercan GOKMEN <gokmensercan@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793350604; l=5986;
 i=gokmensercan@gmail.com; s=20261022; h=from:subject:message-id;
 bh=LMEzwt/5NHrzRt+KkV5MARGp4DLm+R9ldjK5gN4qr6I=;
 b=TjCJTox6gEShP1NnAbClN4EksQLQpz51RuNL5lrJveLze78AteaCLsE5G262VvKzOfhziZ1Sn
 VgDLTtFyLLOAan6uZPmqhQTrSTi2MtBOSTe79syUQV9P6/PQraEuUGY
X-Developer-Key: i=gokmensercan@gmail.com; a=ed25519;
 pk=nFIlLCcGouUfBov8xxW0K4qUtEjdhJniMOO8WCSqghU=
X-Endpoint-Received: by B4 Relay for gokmensercan@gmail.com/20261022 with
 auth_id=1282
X-Original-From: Sercan GOKMEN <gokmensercan@gmail.com>
Reply-To: gokmensercan@gmail.com
Content-Transfer-Encoding: 7bit

From: Sercan GOKMEN <gokmensercan@gmail.com>

On the ASUS ExpertBook Ultra B9406CAA (BIOS 312) the keyboard backlight
query DSTS(ASUS_WMI_DEVID_KBD_BACKLIGHT) always returns 0x550000: the
presence bit is set but the level bits are 0 regardless of the level the
EC is actually driving. The DSDT's DSTS handler for 0x00050021 builds
its reply from constants (0x400000 | 0x350000, masked by the KBLT flag)
and never reads the level from the EC, so no query variant can return
it. Writes work: DEVS hands the value to the EC method SLKB and the
0x80|level form the driver uses steps the keyboard through all levels.

kbd_led_get() re-reads the firmware on every sysfs read and stores the
result in asus->kbd_led_wk, so on this machine every read overwrites the
cached level with 0. The visible effects are:

 - /sys/class/leds/asus::kbd_backlight/brightness, UPower's
   GetBrightness and brightnessctl always report 0;
 - systemd-backlight saves 0 at shutdown and restores a dark keyboard
   at every boot;
 - the Fn backlight key on this laptop raises ASUS_EV_BRTTOGGLE, and
   asus_wmi_kbd_led_hw_event() computes the next level from the cached
   value, so after any read has zeroed the cache the next press always
   yields level 1 whatever the keyboard was actually showing.

Add a quirk_entry flag, kbd_led_no_readback, which makes kbd_led_get()
return the cached level the way the existing !kbd_led_avail path
already does. Every path that changes the level (do_kbd_led_set(),
kbd_led_set_by_kbd(), the hotkey handler) keeps kbd_led_wk current, so
the cache is the only trustworthy source on this board. Match the
board with the same DMI strings the accepted SoundWire quirk for this
machine uses (sys_vendor "ASUS", board_name "B9406CAA").

With the quirk, kbd_led_wk keeps the level asus_wmi_led_init() read at
probe time, which on this board is the same constant 0, until the first
write. At boot that write normally comes from systemd-backlight
restoring the saved level; until then the driver reports 0 whatever the
EC is driving, as it does today.

Signed-off-by: Sercan GOKMEN <gokmensercan@gmail.com>
---
Tested on the B9406CAA (BIOS 312) with Linux 7.2.3: after the quirk,
brightness reads back 3/1/2 after the corresponding writes, UPower
reports the same value, and three presses of the Fn backlight key from
level 2 give 2 -> 3 -> 0 -> 1 (the ASUS_EV_BRTTOGGLE wrap), each step
read back correctly. Re-tested on Linux 7.3.0: writes of 3/1/2/0 read
back unchanged. Compile-tested on pdx86 for-next (c339f4010dea) with
W=1 (clang).

The patch is also tracked, with the other B9406CAA upstream patches,
in the community support repo for this laptop:
https://github.com/burakgon/asus-expertbook-linux/tree/main/upstream-patches
---
Changes in v2:
- Shorten the subject (Burak Goncu).
- Say that kbd_led_wk keeps the 0 read at probe until the first write
  (Burak Goncu).
- Move the test details below the cut (Burak Goncu).
- Rebase on current for-next.
- Link to v1: https://patch.msgid.link/20261022-b4-asus-wmi-b9406caa-kbd-readback-v1-1-fb33ed98dd16@gmail.com
---
 drivers/platform/x86/asus-nb-wmi.c | 21 +++++++++++++++++++++
 drivers/platform/x86/asus-wmi.c    |  3 ++-
 drivers/platform/x86/asus-wmi.h    |  5 +++++
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 3b0f3346dc..894f622c89 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -93,6 +93,18 @@ static struct quirk_entry quirk_asus_unknown = {
 	.wmi_backlight_set_devstate = true,
 };
 
+/*
+ * ASUS ExpertBook Ultra B9406CAA (BIOS 312): the keyboard backlight query,
+ * DSTS(0x00050021), always returns 0x550000, i.e. level 0, whatever the EC is
+ * actually driving. Writes work. Without this quirk every sysfs read
+ * overwrites the cached level with 0, so UPower, brightnessctl and
+ * systemd-backlight all see a dark keyboard and restore level 0 at boot.
+ */
+static struct quirk_entry quirk_asus_b9406caa = {
+	.wmi_backlight_set_devstate = true,
+	.kbd_led_no_readback = true,
+};
+
 static struct quirk_entry quirk_asus_q500a = {
 	.filter_i8042_e1_extended_codes = true,
 	.wmi_backlight_set_devstate = true,
@@ -167,6 +179,15 @@ static int dmi_matched(const struct dmi_system_id *dmi)
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
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index b33ebdb21a..725f827a17 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1975,7 +1975,8 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
 
 	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
-		if (!asus->kbd_led_avail)
+		if (!asus->kbd_led_avail ||
+		    asus->driver->quirks->kbd_led_no_readback)
 			return asus->kbd_led_wk;
 	}
 
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index b45f81b38a..4f010f6349 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -52,6 +52,11 @@ struct quirk_entry {
 	 */
 	int no_display_toggle;
 	u32 xusb2pr;
+	/*
+	 * The firmware never reports the keyboard backlight level (the query
+	 * always returns level 0), so trust the driver's cached value instead.
+	 */
+	bool kbd_led_no_readback;
 };
 
 struct asus_wmi_driver {

---
base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
change-id: 20261022-b4-asus-wmi-b9406caa-kbd-readback-aed82953d839

Best regards,
--  
Sercan GOKMEN <gokmensercan@gmail.com>


