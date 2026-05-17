Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87D7330D22
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 18:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042639; cv=none; b=suaS37EPIfZvEFj6Ozwn66YmrLIrrnEK6HvhIMkYnXXdiYJHJRBFWrvD/C4fEfQXW2MaF6GPJ/iwdjhd/pPJKf8Z8NZhRX5L/jal78neF7TWRft9ZBFoPf7H9VpG8RuQ6SuRetIOtSzEnyaEMGJzSiBaSj5R7a3s5/KZVuAAvZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042639; c=relaxed/simple;
	bh=ouF+4HwZ7jpEwU92f7hcfbu0MRmlC+gUU51wFobtCe4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PpQW9EQv4BZxVyw4wevtKCNHa/fazgYDkic8wBT6qHOTa5D3pMlz1fR/OI+do3fqDrdw0lGyeHwUc7x5zhF5A3XG8q/E80qq0WmZ3LDq1Tfg8zYEyD3b8U1F09tP+W/iLq39LccqlGC+Rwbtey0oLm+QoV8gzrvwxuhhDzD8aXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev; spf=pass smtp.mailfrom=ghoul.dev; dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b=Y9jE65Po; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b="Y9jE65Po"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail; t=1779042617; x=1779301817;
	bh=sNN9uH6YYrjidO1MTd5BcvC2Ek7w5V5g0O9KimcNTog=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Y9jE65PoHYkdk0LiJHJNHiwtjWBjKrJHzW6HV4C9ZOFk7imr1bXC+oS8g4UA4AX9q
	 s0Q6Uf4yQpa+bbpTJjrqFhkNljfiqG5Wm45QB9ge2DNzSmzvZTgQgTQPG2Gv+wnKLu
	 qwsdQuz1ohjwsUV2Gfttad2ss7iENmDcMl1A2FCWnCmfypCtxVpxAKFrwuNIXnGpuT
	 kxEmAofNMllVYa1YEQWHfGO0aWe10Q3ThNNFhiRXwkQ6wXafcpmvxJUQeRrN0HLKbn
	 sYupnCHD2oMqv4bVxE/dSt7Hav2RylZ73eD2wLZHnVJpGMTTGmBXVJnUr2gPOR0xX7
	 ls2haFRbUtA0Q==
Date: Sun, 17 May 2026 18:30:11 +0000
To: Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: [PATCH] platform/x86: asus-armoury: fix mini-LED mode get/set on MODE2 devices
Message-ID: <20260517182957.11069-1-yaseen@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: cbc532239b26216d50ec58563df95edde7d3e95e
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The mini-LED current_value attribute does not work on devices that use
ASUS_WMI_DEVID_MINI_LED_MODE2 (2024 and newer models).

Reading is broken: mini_led_mode_current_value_show() fetches the mode
from the device but then decodes a literal 0 instead of the value it
just read:

    mode =3D FIELD_GET(ASUS_MINI_LED_MODE_MASK, 0);

So mode is always 0, and the attribute always reports the same thing
regardless of the real hardware state.

Writing is broken too. The number a user writes is an index; the value
the firmware actually wants is looked up from that index in
mini_led_mode_map[]. mini_led_mode_current_value_store() skips that
lookup and passes the raw index straight to armoury_attr_uint_store().
On 2024 devices the firmware numbers its modes differently from the
index, so some writes are rejected with -EINVAL and the rest send the
wrong mode to the hardware.

Fix both paths: decode the value actually read from the device when
reading, and look up the firmware value before sending it when
writing. Older (MODE1) devices were unaffected because there the index
and the firmware value are the same.

Fixes: f99eb098090e ("platform/x86: asus-armoury: move existing tunings to =
asus-armoury module")
Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
---
 drivers/platform/x86/asus-armoury.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asu=
s-armoury.c
index 5b0987ccc270..495dc1e31d40 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -370,7 +370,7 @@ static ssize_t mini_led_mode_current_value_show(struct =
kobject *kobj,
 =09if (err)
 =09=09return err;
=20
-=09mode =3D FIELD_GET(ASUS_MINI_LED_MODE_MASK, 0);
+=09mode =3D FIELD_GET(ASUS_MINI_LED_MODE_MASK, mode);
=20
 =09for (i =3D 0; i < mini_led_mode_map_size; i++)
 =09=09if (mode =3D=3D mini_led_mode_map[i])
@@ -386,6 +386,7 @@ static ssize_t mini_led_mode_current_value_store(struct=
 kobject *kobj,
 {
 =09u32 *mini_led_mode_map;
 =09size_t mini_led_mode_map_size;
+=09char mapped_value[12];
 =09u32 mode;
 =09int err;
=20
@@ -414,9 +415,16 @@ static ssize_t mini_led_mode_current_value_store(struc=
t kobject *kobj,
 =09=09return -ENODEV;
 =09}
=20
-=09return armoury_attr_uint_store(kobj, attr, buf, count,
-=09=09=09=09       0, mini_led_mode_map[mode],
-=09=09=09=09       NULL, asus_armoury.mini_led_dev_id);
+=09/*
+=09 * armoury_attr_uint_store() parses and sends the value from the
+=09 * passed buffer; hand it the mapped firmware value so the device
+=09 * receives the translated mode instead of the raw index.
+=09 */
+=09snprintf(mapped_value, sizeof(mapped_value), "%u", mini_led_mode_map[mo=
de]);
+
+=09return armoury_attr_uint_store(kobj, attr, mapped_value, count, 0,
+=09=09=09=09       mini_led_mode_map[mode], NULL,
+=09=09=09=09       asus_armoury.mini_led_dev_id);
 }
=20
 static ssize_t mini_led_mode_possible_values_show(struct kobject *kobj,
--=20
2.54.0


