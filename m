Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505678;
	b=Kt78PGDUpckk+Nq4DO7PDZAjA/W+y5SaZVurSjlztjgOsyv92Zc0ZtFLcC/GGxAmX5GC
	 iDUFiqIWfCCpVhbdQuIonYmW670UoPyy7pjWDH3H73b2bFP4YQICzmhgKl/6nn8T6wjzw
	 BIuZeG01q+ynD6PGKno4CH0/X/IipZq5omlnZgrYG30bj9XKuGxW7VrtZBmGPcEi0XdZs
	 4G6uj/ZHFFe3d/OXenSsuc96/h3Ak9qdqpYcoNW1q3DFjlQO3GVHj2RjEvXxmaeuk3GT7
	 EV2/6AEXi/n7Lkeb7pzKAXboF/S55tAr3wzehjekGwIgdfFMDXMq1H7wd4pB/5ForPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fonscNQS4COatcL+WW/DCh1Xn6CqNyHho+uEL9p9pZE=;
	b=2R+gvCLzvSPZCKKXh7AYjbcVb3gRiH9tbUdHBzMECbNOItkSbPxp9vkNnRQEuOVGeGM7
	 BV8i4t1MdnrfjaXNwZZrC/abnsqCnh/1jLsXyos2agqR22sP7Ezw9T0Zum3aL9NltffzM
	 W7TQ7dgLCj36cofsilBKtXPkqThFMbYOA7ONhmTkoEzSVJe/lRtALfmu+RT8uc1CX4BIu
	 cm6YcI8rv37K9NkUP/cNiMgZ4XVuF6QFjXniQxUP8hxVxE+uup5Rvo6OSARNP9jJcVwdG
	 NprGEodOSYYUBE1zcHt3vh+gnWpjRqHQNYgJoY+j7dPgW0cUyICi2ql/LY/J73sIbqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B0jZaAl3;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181CF606B267
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 181CF606B267
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B0jZaAl3
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b0584ad71so2416676f8f.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505676; x=1793110476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fonscNQS4COatcL+WW/DCh1Xn6CqNyHho+uEL9p9pZE=;
        b=B0jZaAl37uE2jP+id9lp6+NTaAbKZcOWrK4Y21lj49LuQXcXcluGFvxCljc5fqOQgD
         RFiHcstH12W3nJDqOyw2jugtx0TSUpZW0Uy032suu330DqMGtmCe044cb6y0AJuCQ2qz
         IeaJ0C+NZPk56iU8RbLsfuT/7aUTD/nFWhCF9wgPOzbgJmBE14bwErEKZPu7l8/hJ8ql
         QF/eBWE/s0SRHjTyKQZrXLpMSCc9zcy81uEQm1sD64SzKcII7kXTvtrBwFr+kOHgrCjm
         Qm+BUz1VvWw/mU9SgDWHOdG9G8bXuiG1/6FYiEFP54gEUQIzmOXtivHrkjqf37ksHR3F
         /gJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505676; x=1793110476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fonscNQS4COatcL+WW/DCh1Xn6CqNyHho+uEL9p9pZE=;
        b=WTQUBCAJK1ElYYy7sSboHUFwVEjQftnR9naQngrT0PT5ujjnXOxP7vSHfIq3AqB6Jr
         EUfkI/LChyMWINcsOZJcjILHhB6N4dHHmCQGrZffYo7XZpVVpp2W1jJ4c7hUGdiBRvPm
         OuSIX+T5PUIYxivUreXosgXmIQoG44kSmmanxFpu/1T3rVQGf3XJ52IpEKf8IMN3L2jC
         l+Sp7v67Byf7O7n+nZ5UraciB350v6bcMCdNCUFwnlCd7inz7z8TXNzlxwwipvmGAUBG
         uAnvP9g1r2yR6AYsc4a0QhtYAEiSPSAMOhGGqC4HzLBsNAtX6a01Ygs6Nhx6uJDY3BDj
         WzNg==
X-Gm-Message-State: AFq9FYJPNVP0ycTRL/UM4SZIt8y60tfS+SBxQQjsbpk0eSXnfGP+A+tc
	adeefXUAxM3uMG/HuwB6I2wuT2fl6EABkD44sg+O9Jmud2ilLr34OnOF
X-Gm-Gg: AYBFou3ufbCU07Hk+Iu976jUiNGH0E0IjU6Q4OE1XawbasghHw7kFVC8BBG+ylSbYw1
	JZNQ95dzkteAliV2MtogppNCDN2knePQ+RvL7uq5gso4ArfA940KlpqnXUyqDkvVjML/rzULeIe
	fFMwu+6OFCRsyfEzNTNp/azAx8koNi2cgJihnsoJvCOXKYY0wIO29QU/hFUKlO4tfJfJ/gVxxDC
	7mh0CTpXeLQp6eQ0rri2B93/rvE2RZwBgBE9OanvsWr/AyTB0SJBLVz7psBi/mzA/QSzWDOKt6b
	r8JkbACCjKxytZm5llIAc5vMyAVFWuP7ATCdPEvmodAxqEwy9yT0u8T+MRCMB1+auAXhJsraVa5
	FYhCj62g5Z1W/vkNQ4v0u2NdQuSHy+ZWp/lFyATwWZMqBlbr2aD83nt825LQB2gy4jhKf7Isg2+
	fRsPg6mEwqf/c1crJmKrrqSofcTBElwxOJ1XukT6LT/DiBoqk0GhBscjhagWQ9Bs30mZByvTXQk
	N7xHF1ZNdC1EPmzWz2FP3JNywHkECNtc73ZKZ21rNjULqFHdic1VmIVFwLQVSznNAswbVEHt2CU
	gFaYU2sDcp3JIpPLkQCOx8X/rU/FaWTIfMZu0/TkkOM=
X-Received: by 2002:a05:6000:24c4:b0:48c:7143:610c with SMTP id ffacd0b85a97d-48e07fa0e60mr24326202f8f.36.1792505676409;
        Tue, 20 Oct 2026 07:14:36 -0700 (PDT)
Received: from archlinux.cern.ch (ppilicho-1.dyndns.cern.ch. [2001:1458:202:228::101:227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80f9cdsm6256287f8f.11.2026.10.20.07.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:14:35 -0700 (PDT)
From: Patryk Pilichowski <pat.pilichowski@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Patryk Pilichowski <pat.pilichowski@gmail.com>
Subject: [PATCH v2 2/2] platform/x86: msi-wmi: Ignore WMI events for keys also handled by atkbd
Date: Tue, 20 Oct 2026 16:14:27 +0200
Message-ID: <20261020141427.1580282-3-pat.pilichowski@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020141427.1580282-1-pat.pilichowski@gmail.com>
References: <20261020141427.1580282-1-pat.pilichowski@gmail.com>
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

On MSI notebooks, several keys generate a WMI event through the Wind
event GUID in addition to a regular AT keyboard event. Their event
codes are not in the keymap, so every press logs "Unknown key
pressed".

These keys already work through the AT keyboard, so mark their WMI
codes as KE_IGNORE, as is already done for the MSI Claw. On models
where a code does not also produce a keyboard event, the event is
already dropped, so the only change there is that the log
message goes away.

The Wind event GUID is not specific to the MSI Wind. It is present in
17 of 18 MSI notebooks in the linuxhw ACPI dump collection (2012 to
2024), with the same _WED structure. The codes are shared across
models too: the volume keys on the tested notebook send the same codes
as the MSI Claw (0x21, 0x32).

Tested on an MSI Katana 15 B13VFK: Fn (0x0b), mic mute (0x19),
settings (0x1d), mute (0x23) and Bluetooth (0x78) no longer log
unknown key messages, and the keys keep working through atkbd.

Link: https://github.com/linuxhw/ACPI/tree/d6d30c6ef6f4/Notebook/MSI
Signed-off-by: Patryk Pilichowski <pat.pilichowski@gmail.com>
---
 drivers/platform/x86/msi-wmi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index 5369ac28f4c5..dc56e8da0cdb 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -34,7 +34,11 @@ MODULE_ALIAS("wmi:" MSIWMI_WIND_EVENT_GUID);
 
 enum msi_scancodes {
 	WIND_KEY_TOUCHPAD	= 0x08,	/* Fn+F3 touchpad toggle */
+	WIND_KEY_FN_NB		= 0x0b,
+	WIND_KEY_MICMUTE_NB	= 0x19,
+	WIND_KEY_SETTINGS_NB	= 0x1d,
 	CLAW_KEY_VOLUMEDOWN	= 0x21,
+	WIND_KEY_MUTE_NB	= 0x23,
 	CLAW_KEY_CENTER		= 0x29,	/* MSI M-Center main menu */
 	CLAW_KEY_QUICK_LONG	= 0x2a,	/* MSI M-Center quick access long hold */
 	CLAW_KEY_VOLUMEUP	= 0x32,
@@ -44,6 +48,7 @@ enum msi_scancodes {
 	WIND_KEY_WLAN		= 0x5f,	/* Fn+F11 Wi-Fi toggle */
 	WIND_KEY_TURBO		= 0x60,	/* Fn+F10 turbo mode toggle */
 	WIND_KEY_ECO		= 0x69,	/* Fn+F10 ECO mode toggle */
+	WIND_KEY_BLUETOOTH_NB	= 0x78,
 	MSI_KEY_BRIGHTNESSUP	= 0xd0,
 	MSI_KEY_BRIGHTNESSDOWN	= 0xd1,
 	MSI_KEY_VOLUMEUP	= 0xd2,
@@ -63,6 +68,13 @@ static struct key_entry msi_wmi_keymap[] = {
 	{ KE_IGNORE, WIND_KEY_CAMERA,		{KEY_CAMERA} },
 	{ KE_IGNORE, WIND_KEY_WLAN,		{KEY_WLAN} },
 
+	/* These MSI Notebook keys work without WMI. Ignore them to avoid double keycodes */
+	{ KE_IGNORE, WIND_KEY_FN_NB },
+	{ KE_IGNORE, WIND_KEY_MICMUTE_NB },
+	{ KE_IGNORE, WIND_KEY_SETTINGS_NB },
+	{ KE_IGNORE, WIND_KEY_MUTE_NB },
+	{ KE_IGNORE, WIND_KEY_BLUETOOTH_NB },
+
 	/* These are unknown WMI events found on MSI Wind */
 	{ KE_IGNORE, 0x00 },
 	{ KE_IGNORE, 0x62 },
-- 
2.56.0

