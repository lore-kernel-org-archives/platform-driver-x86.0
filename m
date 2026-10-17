Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E7015E5BB;
	Sat, 17 Oct 2026 18:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260868; cv=none; b=fFpHnU1cqV79oSUe+qMjb2K8l+5OnpkNhRrpvuIppRgeYdkmISs8t+gEdzd6hOix4PaYgIYKQYvS4/sCYmmzNor8Ywf7nURaSlcBm80ToH6bsnfdu5oES3Ci/Ny/PgTF/7IswwkTFtqrISxGBdlCkJokIgcPIiWFtiZrh5HOs/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260868; c=relaxed/simple;
	bh=9mOJ3mH/ufgYZP+a2SybiuR4ozeTI+XdGdHG4Jzf1VQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n0v5uVhM06wRu5QbShcvz2VZmr5Pdimd7wkvsSTSdwUj2Kas185XNkaltWbKkYxQsy9dttH0MtieCeExZ0jdeaw7YipqhVvba+sYUv9R1W2wh3z5Cp1y1q9QqC6LgbooAQcleGsEI/vQ/xl/lJ/kQBmHRN/VhiYRuiMFEAGSyxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jy5rz0QG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jy5rz0QG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98334C2BCF5;
	Sat, 17 Oct 2026 18:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792260867;
	bh=9mOJ3mH/ufgYZP+a2SybiuR4ozeTI+XdGdHG4Jzf1VQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=jy5rz0QG5QYPd9XRbf65zOOl8tHrq5N1gW4GlnTY83gtnZ3RTKazqeKaHsrrm2KgS
	 svTefLehfxUV3Lw2RDbW81MGH9zraW+9FBgvwLqZyET3fj+lSBsC5//jxHghafhSol
	 N4g1isY4efDoDN3yQU+duJl/pzPM9BLiS1olljY+VYZUJTZ2KFAw1ukfLtkdsRfTER
	 VocWZOPs8YE1PeT4r8pNCxq4jDC+bLjE17Ty1jinVQbfWofR2giS5IGwDRS1vDl5wq
	 /cQZxNnObk2bIe03+sTmsjqfc48iapdzxKfLc3AFC+SYj2NtJwjCefrzNizvhXBOXR
	 U8faqtAHWn23g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E1ACCF2C9;
	Sat, 17 Oct 2026 18:14:27 +0000 (UTC)
From: Victor Gillholm via B4 Relay <devnull+victor.gillholm.gmail.com@kernel.org>
Date: Sat, 17 Oct 2026 20:13:22 +0200
Subject: [PATCH] platform/x86: asus-nb-wmi: map ScreenPad and Task Swap
 keys
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-zenbook-duo-keys-v1-1-45f72d3db5ed@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJCwjRqxgXFH5gJGlNR4xAu
 LtVlt/ivY0UUaB0zTaKeItK8An2lFE7Nn4AS5dMuckra2zNK7wLYeJuDjxhUa5hXNFfyuJcNpS
 yZ0Qvn//ydj+ss3ugff0+tO9fcy23MXQAAAA=
X-Change-ID: 20261017-zenbook-duo-keys-7e0b3f94354a
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Victor Gillholm <victor.gillholm@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792260866; l=2859;
 i=victor.gillholm@gmail.com; s=zenbook; h=from:subject:message-id;
 bh=6M3/+PEfY8fXb3qd10LtNrTk5fn9SKJDEffvIOgCHXs=;
 b=scn521DZ4w8eaVPtdBD2nLMX3gBL/11Zo5At0nSm2J5VHoCgnsTSDI3GLfAB/xQ6wE3KZ6FnN
 ZLWn4aDLt35CZpmPnRqcbQyYGtzSVPAnSN27+zkvtBXpIEWCi2DKyXV
X-Developer-Key: i=victor.gillholm@gmail.com; a=ed25519;
 pk=eD1INWVbRo2RgAKLHQOmsC14YPzQqjCdECtcWSZ9mg0=
X-Endpoint-Received: by B4 Relay for victor.gillholm@gmail.com/zenbook with
 auth_id=1224
X-Original-From: Victor Gillholm <victor.gillholm@gmail.com>
Reply-To: victor.gillholm@gmail.com

From: Victor Gillholm <victor.gillholm@gmail.com>

The ASUS Zenbook Duo 14 UX482EG has two keys next to the power button:
one toggles the ScreenPad Plus, the second screen above the keyboard,
and one swaps windows between the two screens (Task Swap in ASUS'
ScreenXpert software). They emit ASUS WMI event codes 0x6a and 0x9c.
Neither code is in the asus-nb-wmi sparse keymap, so pressing them only
logs "Unknown key code 0x6a" or "Unknown key code 0x9c", and both keys
are reported as KEY_UNKNOWN, so ordinary desktop key bindings cannot
tell them apart.

Map 0x6a to KEY_F13, the same keycode hid-asus already uses for the
ScreenPad toggle code 0x6a. No existing keycode describes moving windows
between screens, so map 0x9c to KEY_F14, following the existing use of
KEY_F13 and KEY_F14 for other ASUS-specific keys in this keymap. Both
keys then emit distinct, bindable events.

Tested on an ASUS Zenbook Duo 14 UX482EG: with this change the keys
arrive in userspace as KEY_F13 and KEY_F14 and the "Unknown key code"
messages are gone.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Victor Gillholm <victor.gillholm@gmail.com>
---
Tested by building asus-nb-wmi against 7.2.5 and loading it in place of
the stock module. The key mapping was checked with wev: before the change
both keys arrived as keycode 248 with no keysym, after it as XF86Tools
(KEY_F13) and XF86Launch5 (KEY_F14).
---
 drivers/platform/x86/asus-nb-wmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 3b0f3346d..c6eb525ec 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -641,6 +641,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x65, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV */
 	{ KE_KEY, 0x66, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV */
 	{ KE_KEY, 0x67, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV */
+	{ KE_KEY, 0x6A, { KEY_F13 } }, /* ScreenPad toggle on Zenbook Duo */
 	{ KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
 	{ KE_IGNORE, 0x6E, },  /* Low Battery notification */
 	{ KE_KEY, 0x71, { KEY_F13 } }, /* General-purpose button */
@@ -666,6 +667,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x93, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV + DVI */
 	{ KE_KEY, 0x95, { KEY_MEDIA } },
 	{ KE_KEY, 0x99, { KEY_PHONE } }, /* Conflicts with fan mode switch */
+	{ KE_KEY, 0x9C, { KEY_F14 } }, /* Task Swap key on Zenbook Duo */
 	{ KE_KEY, 0X9D, { KEY_FN_F } },
 	{ KE_KEY, 0xA0, { KEY_SWITCHVIDEOMODE } }, /* SDSP HDMI only */
 	{ KE_KEY, 0xA1, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + HDMI */

---
base-commit: ea40f1e9f07aab937b9a217633be7a1f66260394
change-id: 20261017-zenbook-duo-keys-7e0b3f94354a

Best regards,
--  
Victor Gillholm <victor.gillholm@gmail.com>


