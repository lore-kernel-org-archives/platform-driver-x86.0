Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632422;
	b=Ac9CRhKoA7TH/8u7HbkVexlPXQ+gdbKOH5D9ut+OcQbcDcxrN2MGEK2NqhLDPjCAIt9N
	 EHpgv9nbaWVS8jk0BLxGL9kNk4WEmDIFaV/247ShjMnhu8U6jdI5wfwNn+vEYC02f9oW/
	 5TKZHC1AalLVuy4SuAH5ZxFoEq1UX7gIFckIWkA+EnZOn/umJSQ9vJ3qwq9sXQe2eB16C
	 oX2B3KwSgvXi3KO4CcCf3PG4uS9abhWvyEqwGuHLrvvK3675q/lrJA93VEz/AH6NwW0eW
	 j6Qh2rmwXASyC98xYlk9cbVQqKO9Ofj8epmQDpneOpNcmWqunrFO2QdjjsV+PtiJ75w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DRu5y9IEIWHGb7/eSUxJjK+SiC3Y8A9DyNTgcIJk/P8=;
	b=dmw7UjzGIz4ovZ59xvIrVPEFtxr9gs6lDY1dAOl/0ZYVxGk0792BuY2FqqkIaPHHTUiw
	 shIWGM9MDZDfty2E/VYFusbY2jas00DQ0nEj2dMjK3cUznjzw2OcXpvTIa7bGZgQjkgM+
	 0oV+6g4OEHSLv+533wHeYI2JyUhhOrdM7EmbceoJO+PWGTnWSpLXDn29MOTJLSd9gbB1d
	 6xFtgJlTE+NDRJFd7nUu9thb7mL6oHUYfZlYlhYFMpXwWe5poyiOr4IQaU8ncym90zZdz
	 +pavtdVApDOtoH6wVscnGQ+eClonXwzKnNmLkqm5ReFbZN64LbJLcT+8gJ8Rv4EURXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HShl6aUg;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3D36091CA1
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 15:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A3D36091CA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HShl6aUg
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2eb0c699769so10624365ad.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 07:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632422; x=1794237222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRu5y9IEIWHGb7/eSUxJjK+SiC3Y8A9DyNTgcIJk/P8=;
        b=HShl6aUgVwrE59N6fYNuPaLhljDz5RBWdUG0z8ZGXIScUNFAPcqvIiSX+RDT5CkC6p
         xwbK7hFveHiKl5bchzg5pSDGwriUIdGlB6SGyilI9GriHdVIJJrE3CoClQ8T0OaNodp/
         LZ6RLj3Z5EJ61EFXgCwYmzUw60uR0kkePsX9zth7cqPQ4rYI8TD7hw5pJGw0m7EquCBX
         OQ9KVxH61w8rw+OUfpPPiS1KKnFzek5pHZuNHx/wC7TrMl7AKf+C0hWZgvNokJcz1zeN
         HG48roWZXt2TyscMS3NrLBruVnwhMQK0tESLiOFiF2YUMPwgAukoTDc3NWxt4ubcKBZg
         ZCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632422; x=1794237222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRu5y9IEIWHGb7/eSUxJjK+SiC3Y8A9DyNTgcIJk/P8=;
        b=jZ61T+yqSwPlxI+wkmqi34ODaoxYHsCwOT8z31lK384dpMy8EHusiCJSmWupTvfjr/
         rsFur9dJ965BC+KaIeZ0ufIuQvYztnPWtdcHI/5MRHYZZACadesXb9znPuqhnEq2o2D1
         LDR7N9RpNL3cz/MlcecuYXSPXQUZLlvPRDAfrv+4DwjHYFqL3uSNZ4jn9L7wbHB4k7nq
         Dn7UzW1nUts2I/8aTBjqdWhvynS3ogWW3IQZuVdqSoL81m0RIPtNBE3iVxw1Lo5BuHaC
         SU8ZOR4WZ9uYw+pscF2Xat7vM1vmyu60wHIxtMlReGt0wcuU1Imf0upwCa0nl1RT3EPh
         FXHw==
X-Forwarded-Encrypted: i=1; AKwUvBzS1rpTF3BQQlXAxrYpfr28NhdshxoTXmjBJ1tT6cXzG6bSwQ4gYRyV3vfYhRbfy8WvEdkbM629+FGFXbCWhJIL9+p3@vger.kernel.org
X-Gm-Message-State: APuU4Z/XdIYyBde98YocWEF7vT6sRh/YkbONAF2nlABQB3+U+4jCNkBs
	q4r9+ToFRGw+7uTC1DhnDwm5ZRFdOHzdU2BCA7xgBoOuS2CwjIKQw/Ia
X-Gm-Gg: AYBFou3GXUk153O6tK/k/6pL6AYWO+TbHPPCpmyaVrl+OJ00WuapYmGU/nVMvtZ9QW1
	fuoO9i4BlJ/KqxIUz+Wf3deh82FHqgi5M7Hm9gACvAQzLRqn1uftF7hyPwKIoX4z5jMxKbySls7
	oAbv7a/n/O9kz3PrOOt91qPqBK4g+9d4OYFIELJ0iI7rzLSWebPI+iMMCYORd1K1tyZWcoxgozH
	+0kw0UUSubnFBkvaNzSR67p4Y14cSXrN/fu0uraOi61hinGyjDKBkVXaPl1m9Sy38p/DCaaAyZF
	0wizE4oM11EVSt28hAlMNsLaAenVlWjFE2zvIaM/xLDW5eUIn8z6xiFcsRBhRxOTuSp5gunjZmy
	ZYGA/yBUdt2IN/+mtAbRXhkIXVfGgC1XUJxosno6rZc25LxClkEiHIrUHFhbhIidlDfUta10/eQ
	X0f4fhiO84YPR0vtR0rnpQytUiZ6g0O+Y0XhdGomF2CRny61z0F41yvRkLJDJ/hKnVCo6CqQSCf
	fNm9D9xPf/YNmxza8T59wM3uqlvnUyjDOW4M3kadvJpzG3r7W9mo9VirheajaZQp1UUD+GngnIK
	3CE5Pj1F2oSyIJZ47mnkmNh1Q6LguRhkfOcbNUAvlw8NQUyNnhc2bVs=
X-Received: by 2002:a17:903:2f06:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2eb3650da0cmr99597675ad.54.1793632421903;
        Mon, 02 Nov 2026 07:13:41 -0800 (PST)
Received: from ThinkPad ([240e:46e:8710:e4e:e10f:cd51:e533:58a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3924c93fsm30567675ad.34.2026.11.02.07.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:13:41 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [RFC PATCH v2 1/2] platform/x86: thinkpad_acpi: Extract kbdlight_notify_change() helper
Date: Mon,  2 Nov 2026 23:10:18 +0800
Message-ID: <20261102151211.40701-2-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
 <20261102151211.40701-1-kmatzkaczor244@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TP_HKEY_EV_KBD_LIGHT handling in tpacpi_driver_event() reads back the EC
level, updates the cached brightness and notifies the LED core inline.
Extract this block into a separate kbdlight_notify_change() helper, in
preparation for reusing it in further changes.

No functional change intended.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 41 +++++++++++++--------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad..3260eaa62 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5313,6 +5313,29 @@ static void kbdlight_resume(void)
 	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
 }
 
+/*
+ * The EC cycles the keyboard backlight level itself on Fn+Space; check
+ * the current level and update the LED core state.
+ */
+static void kbdlight_notify_change(void)
+{
+	struct led_classdev *led_cdev = &tpacpi_led_kbdlight.led_classdev;
+	enum led_brightness brightness;
+
+	guard(mutex)(&kbdlight_mutex);
+
+	/*
+	 * Check the brightness actually changed, setting the brightness
+	 * through kbdlight_set_level() also triggers this event.
+	 */
+	brightness = kbdlight_sysfs_get(NULL);
+	if (kbdlight_brightness == brightness)
+		return;
+
+	kbdlight_brightness = brightness;
+	led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
+}
+
 static struct ibm_struct kbdlight_driver_data = {
 	.name = "kbdlight",
 	.read = kbdlight_read,
@@ -11581,22 +11604,8 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		/* Key events are suppressed by default hotkey_user_mask */
 		return false;
 	case TP_HKEY_EV_KBD_LIGHT:
-		if (tp_features.kbdlight) {
-			enum led_brightness brightness;
-
-			guard(mutex)(&kbdlight_mutex);
-
-			/*
-			 * Check the brightness actually changed, setting the brightness
-			 * through kbdlight_set_level() also triggers this event.
-			 */
-			brightness = kbdlight_sysfs_get(NULL);
-			if (kbdlight_brightness != brightness) {
-				kbdlight_brightness = brightness;
-				led_classdev_notify_brightness_hw_changed(
-					&tpacpi_led_kbdlight.led_classdev, brightness);
-			}
-		}
+		if (tp_features.kbdlight)
+			kbdlight_notify_change();
 		/* Key events are suppressed by default hotkey_user_mask */
 		return false;
 	case TP_HKEY_EV_DFR_CHANGE_ROW:
-- 
2.56.0

