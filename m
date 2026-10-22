Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792674054;
	b=sACqZunJSwdzTCAuYEG/gOwirV6oZ/s3wh8A+Q0ozReq+MX2zJPAFCCrdCbk3FyrXNW+
	 zRJiBpoFAI04plis5/ws4DB7qUR1ibpMeCX8/j+tbovHHLqNATdJeSpaB/kstASkQ/1BK
	 5H3dvo8I50KEVb46ac3Ec71yeX/kUL5wx53LfrJKki81UX5rL/xtQqwkiIKf+XwHiAxw/
	 JCgtwRgC1JWyMSN2wCyf2VTTRTlbU2zkqa21QCubt7Gt3aGhSa0mzqXRGH8mlS38dshVO
	 GfWT8SxTWmspld4YxZiBa3/Xkc0TkOdHzcxLGN4b0A/YnsFYrzl5JEUp3jqQwg6aG5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674054;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tcvsiiLHqQEogFe4jcE5sMu10sQpK4YUcpJ25LK0ci8=;
	b=Z7K0l0fvdpxg93xssfaBHu1gThrn1OKWWjOwqQ3navaMvH0nqWT/6SB0mHtGZ/0vPaZ2
	 R0Mmh4O5aDGvDDlOAkFEJnB3oJ0vYZ+t4DSMPraofdkNxvx/PFOKIKDN3NRgCZwpjvFsW
	 LK7LJnCFvB6YIDMerNPb4HFWG2oxneDhDya54nq80XhS8zTDTz6QWK9N4xLJruxJTZVk1
	 HFGAaT0yf1VXMoqRCoXJmnElkWPPkdlneabp2U4cMTUvcAulwPGBPahvReQd2DoUih4HW
	 LzN77nRYPrJaWNKUnFH6GmpvRpMPlEv5f++py16kZqrqbGI/nPNMwHWPvzc3rwvyBqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P/AD3ZZx";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1079B606A319;
	Thu, 22 Oct 2026 13:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P/AD3ZZx
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792674053;
	b=W2780CmNb6wtpNBbQ6IAb8t6EIXmOJOOfIqodVhqd19nS4FB4CbdxtI3jrDtpifMD0Bc
	 Z8VgNT/6eIoPqpMxeA8TJ+nY9Z6xPXFnqarB9PsnxB6FxgE2pYyZ6IIhw4W6VYIbaJosf
	 h2O0OnBf30coWkTXS9g8KVgGskpWRQ07Z8JEa6yzSGMNspRAnf7MPI7dm47di5CJ9eLeH
	 EDrBu5DrTqimKK35ZaMwlzlFWVm3j0kQOX+wxG9+COnb71+Hkt4MouVk6Pcj5EIhwW4bJ
	 h0ZUnn6MVOTMbUGma661xDFefVUd2cK3LaIOpSmIoAVaK6FDq/UPwQGdOkTE/VnjIWQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792674053;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tcvsiiLHqQEogFe4jcE5sMu10sQpK4YUcpJ25LK0ci8=;
	b=Ix2M+HgeFV7UQ6powAIwjBZYoC+d7p84csTADk553xg45CrtxhyNT6ZdbkaS1ZhMVpVt
	 6UfVbZgY5NzUk8MISJzJHarnAvQ1ppyMF1RT6Qx/iVveE2cS8ZM85WZ0YYs9P5xZYeEzz
	 X1iSw6PbQxYuYeaR/yQ8ydyxkwo4/xwKod9pXXUQCB9eWwsHnTEacobkt7Y3obvlqK9Ws
	 VDmZYXKQ706Kjd2Byl6MmfiKrkHxuSQC9yRH88zOWpTNflVRQrcO7RoSer9H5vufKEpuJ
	 BOytpKGHnlLxytwGorICUrMssrQavWauux+XXLdSDqg6QUNCxXxHlpRuUk2BorB1p8A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23B271F000C1;
	Thu, 22 Oct 2026 13:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792674053;
	bh=tcvsiiLHqQEogFe4jcE5sMu10sQpK4YUcpJ25LK0ci8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=P/AD3ZZxEoLjPbsbT+O8X8ePsJfD2jFxIDXbXN2jSLM70AQR2FoE/+SDZ6hpcHytG
	 ZOh6DgVh1Ifr4bKhpKsa7wJg9jRYkIycP3dtpSHBkYOxBXpq1VV6mQ1+oT6YgvgMUX
	 cChKJ5cttWopr1IatETt+s42udkrFiGUEGoWjbUSGmN+LpoWCZcxw3haAp6Waf9JQd
	 jRWB/308JsPp5Oba1eiz9Wj5dc0Pe9sRc/NDckU3M8IQRQtC2c7Qm3EPg1b10+UPaL
	 cTNRn+/YgK80O2BIc1MZFcHcUOjFqsWzIw1vsVmbBlj15OJbcdNkEr9/OkwtaNfr9o
	 RlDMo2fYiYOiw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 790EC43397;
	Thu, 22 Oct 2026 13:00:52 +0000 (UTC)
From: Sercan GOKMEN via B4 Relay <devnull+gokmensercan.gmail.com@kernel.org>
Date: Thu, 22 Oct 2026 16:00:52 +0300
Subject: [PATCH] platform/x86: asus-wmi: Add keyboard backlight read-back
 quirk for ASUS ExpertBook Ultra B9406CAA
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
Message-Id: <20261022-b4-asus-wmi-b9406caa-kbd-readback-v1-1-fb33ed98dd16@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQ6CMAyA4VchPdtkFCTMVzEeuq1qJaJZRUkI7
 87U43f5/wVMsorBoVogy1tNH2NBvasgXnm8CGoqBnLU1Y4IQ4tsk+Hnrhh867rIjENImIVT4Dg
 gS+rJ75vUNx5K55nlrPPvcTz9bVO4SXx9w7CuG/Khba2FAAAA
X-Change-ID: 20261022-b4-asus-wmi-b9406caa-kbd-readback-aed82953d839
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sercan GOKMEN <gokmensercan@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792674051; l=5290;
 i=gokmensercan@gmail.com; s=20261022; h=from:subject:message-id;
 bh=fSTmrfZTjXJhJvDRdGbk0K/+rwI2QBECNtaYIr3fMRU=;
 b=QxmCus+1hrgSGoq6KlRU6n1u9s+4iePiNgCTGkltxKKVejqhos/B/9600VXxtAZJ019OftfT4
 a7biuSGhUQdAdxCD2n1EDzB/o3Cv1Ecz3leVubsy0yrtiz+dvVNfTZj
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

Tested on the B9406CAA with Linux 7.2.3: after the quirk, brightness
reads back 3/1/2 after the corresponding writes, UPower reports the same
value, and three presses of the Fn backlight key from level 2 give
2 -> 3 -> 0 -> 1 (the ASUS_EV_BRTTOGGLE wrap), each step read back
correctly. Re-tested on Linux 7.3.0: writes of 3/1/2/0 read back
unchanged. Also compile-tested on this base with W=1 (clang).

Signed-off-by: Sercan GOKMEN <gokmensercan@gmail.com>
---
The patch is also tracked, with the other B9406CAA upstream patches,
in the community support repo for this laptop:
https://github.com/burakgon/asus-expertbook-linux/tree/main/upstream-patches
---
 drivers/platform/x86/asus-nb-wmi.c | 21 +++++++++++++++++++++
 drivers/platform/x86/asus-wmi.c    |  3 ++-
 drivers/platform/x86/asus-wmi.h    |  5 +++++
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 3b0f3346d..894f622c8 100644
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
index fb1d4a085..19a0b3a0c 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1966,7 +1966,8 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
 
 	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
-		if (!asus->kbd_led_avail)
+		if (!asus->kbd_led_avail ||
+		    asus->driver->quirks->kbd_led_no_readback)
 			return asus->kbd_led_wk;
 	}
 
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index b45f81b38..4f010f634 100644
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
base-commit: 893018d51f27ec0449155b0afe371aaf65380630
change-id: 20261022-b4-asus-wmi-b9406caa-kbd-readback-aed82953d839

Best regards,
--  
Sercan GOKMEN <gokmensercan@gmail.com>


