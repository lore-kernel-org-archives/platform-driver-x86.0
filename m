Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596531;
	b=lCPutQ/RZAHV2Jtu8R8SiuVPG8JhphfrUP8XctLIlvEXcFZjDiKh2v2VHkwVg3GSVMuT
	 nvwFNWorZPJuiiHhi2j9XU+o+enHRRO9tWtScAhcUsqA1bjYKL9FXZ1W8wQG5MAZoIOpO
	 24mlKDznSjUw4UiotnMGOU2Gh9cDfn/eDTLS0NyQ9S+8r21jvbWO9qL6DkQ/2nSVGgHDj
	 LxHAp3IKrroFMLqtkLncw9O9Z5iusZZDVClzvYEsy/ohhti2SYSGRaLlBeS07rx+ZFk26
	 L9ItzhGUL/NfvIXCkjOkkhai0paAbfq3tUrI54DsVDDCMbD3dDAhf9imtT1n7sCVhNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KYbimdOwOl63d+7wp1vo3YGYhOkGT4gBAhDUpoy46hc=;
	b=0ucR6qE5Jy4AV/0CexTops5y9lMOXwicJwRbCw3LX6fLC7M/1xC5NA8qe4Bw00cwxYZZ
	 M2EmFu3rjTwdhZqUcTAkF9TvlDjFQjUDRPkI5kK8Z+Y03VGLDvMluR6GbWDuD/fSS3qrE
	 rgCgntoaMxvKWIkFna7SvvusxtTZEM5NJceT6rw9DyivMGggWta+TmTWLHzYLz/eq/ADN
	 IO0WPUSfI/hJNhGMSq+aHpoun7uTJhlt3fmJzNPsVxshoCm6HC8HjQMHUB1rV70XlNbf4
	 gBSjFsukHzR0171UMVd0JAQF8b7xjnVCn+dNxGcVzx+XX1LqewWvw6uHm8vbHmqRZNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k8vjLZwJ;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9299606A31E
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 08:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9299606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k8vjLZwJ
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so1097619eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 00:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596530; x=1796201330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KYbimdOwOl63d+7wp1vo3YGYhOkGT4gBAhDUpoy46hc=;
        b=k8vjLZwJQHbJ0xfLxYW3/F1Bm/CoIYmr4ybpSQpgHR4Xf6kyyklq329m184NjX+2v6
         GlkXrSizVvaENNvcb4xtT3giGsIQHlKLCuyUU3SuHqmJB09F3yblxq+KvcBb7Ij0Nh4I
         pXMXJi4m+I5xcnTIXem6gai9gUl6GF+eJkkK+r6+g39FK7gOQbGfnxuOfkatFjTVMLw4
         nPjzSrhgz7OSmhFeLqx+La1nlOODf4SppVozH9t1u2E+Cba2mGelk5OG7JszxjVOibKd
         wdD3Sa5C9XueuCrz+UEncTF33qJ0bBXtQznIpaNiSsXEudIJg/5rULa3SYsD2eTr2G7y
         UMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596530; x=1796201330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KYbimdOwOl63d+7wp1vo3YGYhOkGT4gBAhDUpoy46hc=;
        b=M2wPyoNxO5wJ3l2jZ72meV7x+AKXGfyMaNKy4tX0UN8VPr8lMKGskHqqwkHSZLugQL
         9myPX7Y86Jr6jHJv163rt71MZxKEbPAJ1RZGi2UgHevi48hsk6iXfZ1mzzAxHBVrCeQF
         JwPDlQeuL+FgREOEjx1Gz7OLAhAYmaHN8nFi4sT43g70Y83nH0zU0lmk2LZIyCT/Z7NU
         3nidcPOWk2AHFKrITyPd7zF6HSFluXbENkJTZ3QO6jrjtv4aewQQYPg+Xm1egZI9QQUt
         Mz94KE5Zxrx4VDkL6ETJsH6iWkcCka3dbv00I2lelzDFqPxseuC15AatY48u4EfobbYg
         mYuQ==
X-Gm-Message-State: APuU4Z9hC1uilLVgY9IAXTB2IufVjPwJd40nSqKQ6E2naxxeF0FssAhg
	NC7POifbMUQMXqddBFnWQ2qPEceHm/DuEuXxqWK3sV8Rj+aeeFtau7ZC
X-Gm-Gg: AZFdTZe1wJo4VDW3RSK5yzs+nThsaF4L10AN3wYkrjNAI/8vsrcXDJ0hYn3VKFFczup
	QhHe1rgd4J/m7XwTj/+0kqAETTYeOZS2MaDULxWmGsZEKgaZORXAwiLRwHcp1K6P1p8k5QoZ5rr
	AxW/x7KBNr22W1jFT55V/sCd3O8R7+CRCvnbr6jhyDb3X/LsM7ndw3OLtCLZsFgSEMxslabyy8i
	q2+uNrGq8AcvUexLRUMe30qxF2PVElxAlmvL89dg40pkowoShpuGy/JtgtV/rI6EMKbWuUBS5sM
	hNeRGdxxyIRZhWIqwZbJNgYKAcx4/Ti6JL3CasuyRJczySY9oe9dEbivEP6QimbNFJMxAhfczwK
	2Bmq9lg5kAjy9ruzPgZuHIPgAD1MwTlwBHSPfPtRzDPpsBzzSGdJAdubvUDOrmJyuMLEMwdW+5N
	z+TeX7QIq5k2++P1X261KYrunWThWEtDi4h5MOJOZ10+KDQcfC1SpCiM0PQkmxTst5UHqag/Mbi
	cv95ova6x/Q7QbMWD4aB5eufcOXA4oTxh268CNV7iuzSXNmUieuLdQ6z21lX4vfV3F7uTpPuQC9
	7iNQvlX3uiL55JUc6S/pXXDAiObA
X-Received: by 2002:a05:693c:69dc:b0:386:aff0:6109 with SMTP id 5a478bee46e88-386aff061f8mr9394037eec.2.1795596529898;
        Wed, 25 Nov 2026 00:48:49 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18879252eec.9.2026.11.25.00.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:48:49 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Subject: [PATCH v4 2/6] platform/x86: thinkpad_acpi: Extract kbdlight notify helpers
Date: Wed, 25 Nov 2026 16:46:39 +0800
Message-ID: <20261125084644.137506-3-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
References: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
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

TP_HKEY_EV_KBD_LIGHT handling in tpacpi_driver_event() reads back the
brightness, compares it with the cached value and notifies the LED core
inline.  Extract this block into two helpers: kbdlight_notify_level()
takes a brightness, compares it with the cached value, updates the cache
and notifies the LED core; kbdlight_notify_change() reads the brightness
back and calls the former under kbdlight_mutex, like the original inline
code did.

kbdlight_notify_level() expects the caller to hold kbdlight_mutex, so
that the proc write path can reuse it with the brightness it has just
written in a subsequent change.

No functional change intended.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
Reviewed-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 42 +++++++++++++--------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 31d3721bb..b4b3d7dcc 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5267,6 +5267,30 @@ static int kbdlight_set_level_and_update(int level)
 	return ret;
 }
 
+static void kbdlight_notify_level(int level)
+{
+	struct led_classdev *led_cdev = &tpacpi_led_kbdlight.led_classdev;
+
+	lockdep_assert_held(&kbdlight_mutex);
+
+	/*
+	 * Check the level actually changed, setting the level
+	 * through kbdlight_set_level() also triggers this event.
+	 */
+	if (level == kbdlight_brightness)
+		return;
+
+	kbdlight_brightness = level;
+	led_classdev_notify_brightness_hw_changed(led_cdev, level);
+}
+
+static void kbdlight_notify_change(void)
+{
+	guard(mutex)(&kbdlight_mutex);
+
+	kbdlight_notify_level(kbdlight_sysfs_get(NULL));
+}
+
 static int kbdlight_read(struct seq_file *m)
 {
 	int level;
@@ -11593,22 +11617,8 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
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
2.56.1

