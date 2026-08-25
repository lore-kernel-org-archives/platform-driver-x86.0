Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5723B42C3
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 19:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787686593; cv=none; b=pv9Rv5l2CTMUf0gpd49UzFt8Fr1cuBiXQGp+Mq7MRwzJjsa1aMKaeP9d5CTpP/KnERZgaLxuf1yHaK3lPcbgUVskAz2lnsXBhOCumEW8D2Z5J8tk2CTYZV0Zh8fx3NIABwMPpvS1QB6SoPUwNG7T4g+fs6Dc3RgFPjxNzgtZIj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787686593; c=relaxed/simple;
	bh=29Xh/vK/vKYDoiR0wGwbxNp6DMh5MDA7D6PZ2uSfbUM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=p71rpEzB7s+zwDXSqZeY4fvC7vBP2tmWzKfAkB/NsQmIdIZm/Cwl1zXInbs1U03rsGAJoPWt45YMdfzWMs2NJOpqSKEu0B4fJWQwDJWv9fR9KDBvcRgxZRjGxCQZBAin5EV2fHhTKfijIJ15a+7OkijqvKFb1AoKbEJLf4O/Ctc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=davidstephenson.net; spf=pass smtp.mailfrom=davidstephenson.net; dkim=pass (2048-bit key) header.d=davidstephenson.net header.i=@davidstephenson.net header.b=z3JY9MsY; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=davidstephenson.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidstephenson.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidstephenson.net header.i=@davidstephenson.net header.b="z3JY9MsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=davidstephenson.net;
	s=protonmail3; t=1787686583; x=1787945783;
	bh=29Xh/vK/vKYDoiR0wGwbxNp6DMh5MDA7D6PZ2uSfbUM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=z3JY9MsYrxos/mc7M1aQcPJ+xMVv+fuBqn140Kss6bey5P0Zci03nxe572Zv0zN1c
	 jrK5r3pud7RE6y74ZnAbuMSbFQhPuoZIsx2AdOOXqtbST8x30ZtooZqDE0MydQWZaj
	 Jk9I1UTEIKnnqBX5N87Kx51ySDSBZEErh/CwXGSHa1IaPU4x4hKmJ9ivlVTLeZcADo
	 cv3XQa/AB9hWo9wzI+q+qhinsKCWoKkXRDDGkUNAwmqJ/pkYXVE7Ox9bALXChSLbmB
	 WfS+4XuSUuEmpfkcC93Qk5iuspm9EOdQ7Cqe2DVfni+d0FCq+65GRti0Eibtn8h9Nv
	 tgzlAR7Q+4y0Q==
Date: Tue, 25 Aug 2026 19:36:21 +0000
To: Sebastian Reichel <sre@kernel.org>
From: David Stephenson <git@davidstephenson.net>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: [PATCH] platform: arm64: thinkpad-t14s-ec: don't send KEY_KBDILLUMTOGGLE on Fn+Space
Message-ID: <20260825193556.133277-1-git@davidstephenson.net>
Feedback-ID: 197172805:user:proton
X-Pm-Message-ID: a72af546a45307294f11fa04650b63de288f60ef
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On the T14s, the EC already steps the keyboard backlight when you press
Fn+Space: off, then low, then high.

We report that change with t14s_kbd_bl_update() (brightness_hw_changed).
We then also send KEY_KBDILLUMTOGGLE.

The extra key is the problem. Desktops treat it as "please toggle the
light." GNOME calls Keyboard.Toggle() and changes the LED itself. That
fights the EC's three steps. The on-screen bar also stays empty,
because Toggle() always returns 0%.

thinkpad_acpi on x86 already skips the key when the firmware changed
the light. It only uses brightness_hw_changed. Do the same here: keep
the LED update, do not send KEY_KBDILLUMTOGGLE.

Tested on a Lenovo ThinkPad T14s Gen 6 (21N1, Snapdragon X Elite) with
GNOME. After this change the OSD bar tracks off / 50% / 100%.

Signed-off-by: David Stephenson <git@davidstephenson.net>
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platfo=
rm/arm64/lenovo-thinkpad-t14s.c
index 5590302a5..22d20a907 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -488,8 +488,14 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *=
data)
 =09case T14S_EC_EVT_NONE:
 =09=09break;
 =09case T14S_EC_EVT_KEY_FN_SPACE:
+=09=09/*
+=09=09 * Firmware already cycles the keyboard backlight
+=09=09 * (off / low / high). Notify userspace through the LED
+=09=09 * class only. Emitting KEY_KBDILLUMTOGGLE as well makes
+=09=09 * desktop environments toggle the LED a second time.
+=09=09 */
 =09=09t14s_kbd_bl_update(ec);
-=09=09fallthrough;
+=09=09break;
 =09case T14S_EC_EVT_KEY_FN_F4:
 =09case T14S_EC_EVT_KEY_FN_F7:
 =09case T14S_EC_EVT_KEY_FN_4:
--=20
2.55.0


