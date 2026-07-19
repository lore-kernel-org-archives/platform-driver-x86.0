Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AF919AD5C
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jul 2026 09:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784452186; cv=none; b=djQXSDFVNebyCFX5qvI+GbOrggGgvbj7XIa949H+FNX+2GSHQPoa3DzgXDjAg7IBsndWX4vlzRmJHR1u6NPjv/Txh4nk+DK16g0sguqsZk29/nBJiijtXX9XGOv6Y/XkfkbIGKJH0WYixpo/4/lA4XXs1b/GmSX18sIL+5nOweU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784452186; c=relaxed/simple;
	bh=J2wITQx9DAE2Cymn5q41CBXk0oUKrOmdB3ePRluadbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=os5npaNAgsFMTxOpoEgcGhmZ789PW6qMkP8yfTUX01p80BHQr9gWFKClOhe+Xh67QVcKoG2ENUBtRNKrzK6CXvetaNUnCRgV66JJo7mFnRFWqtZBWShIkIu0vZVB2dAUf7WbbdK+H4ftcbGT4tSGBYoimBhLFv9uRXDXOoIuVnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzhqJnhm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzhqJnhm"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so43978445e9.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jul 2026 02:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784452183; x=1785056983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jP+FexeabQancmJmT2xPEDbbgyWKp58PTaOLgL4edyE=;
        b=bzhqJnhmUZviWIh7ratZr/jWynYvmEfIeWbLRHPvM/52xiTKI1bxaTpJMgVaI2SvlX
         OkEqc4yBasiFWDYHEJ1frKu/bYxpDQ5dH0DVR06m32/O7x3AknwazTnTW5MKfxh4+r6s
         euLTeDX5PCFoyUvJ0pVoJpM3IHFyOgsrp+6iVDb/JDiie3LON5aEYIqexk69rudNUd25
         GZ8KnaHgakSwL0qfa3WMbiNpU3nRSNeRfjRreTSZdt3ffi5sdgAyp7GcjVdjyE+tQLHX
         C1jf+v3v47KVhaf1Re3PiDcLMhL+F/rfsGLO+AAnYF6nxkCy1PQv5KerAI5WC/7J2YDn
         IEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784452183; x=1785056983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jP+FexeabQancmJmT2xPEDbbgyWKp58PTaOLgL4edyE=;
        b=lN54JeXfwI3wpD8mURL5cBgnyKy0y1B+ieLbxeL6nVVHNX0TWj82kYyXFQSAujJL/w
         1JK26HcLmsajhUdZ8v0lEEhi/rCrWenWNywwx0MadAbeVTfXIhnJ7y1vIKuVOV2qZKYs
         54myHqkP8aH5G0Vlc6Gi6YxrlkXgMUo2w1fDp4We5O8Ck/Sgw9cGNlmpUUr5kxGGt88v
         2FHeP4bwLGGOrOyNU46LqpIPN4Kc4PsLxc2FkD+v3YapdSpjeIWWfa0bpQY4KTkA6Q6U
         NIzvqR2YKsjTUY1hEEu4kxCAEg3QDUFg433SjXv8NIhWtU/UIyHkamFRMlb+az+X+ZQx
         sHcA==
X-Gm-Message-State: AOJu0YzfeJ+g7/+mKOvhxqO6Pym21uY3ACZskeVKE8Z5hKaWN+X00s++
	s4Ts9mqtQ5B6UOyNBJZKXzTZ0UVPZUYpwZ1WtJLyBweUyGVXGgpXxlrh
X-Gm-Gg: AfdE7clQWqnyILMXwtTVOk342sUdqVBNqlIpWdc3BWqgDDlwWxYP/UWc/D3DOWGddGz
	VdGowj47/9F8Psl/u/mp+6Q3HEunkJ43NEeRmlQ4/LVfROacL3p7KaKpYLVgZpACPB55FDMf3pW
	7OYO/IExYV/JTMSbZTHvqzJWCBhDPNregSGogc61QdTxSsVWtj2c7x55VkwsPWK5RyxfMPw4L8z
	gRnaGB89z5hoQ0Pi5fxZPnMd4qCgauOhsQjoSTuTiDsjo/oNdI+R4TXl9pjhzIHFELW9A96C+kr
	PbRgel0qpmKOfgyHzpnBlFDbD8ACoU8UumepGMmGnaKTw9HMxwudF0X/0+qPpBfR/RglxyV/blK
	Ztm93YEa0+AcAx499/GQp7cfzE/usr5La2vmrQmp2vYZZKXHufJ23GKuqz0R9blnsvK3SfKFbwn
	DGWPOtMKn4mkxLNTz9W1DBx7lcHJdq03k/Fr6XQ9KCwvpNv7s=
X-Received: by 2002:a05:600c:a42:b0:493:eed4:7210 with SMTP id 5b1f17b1804b1-4954a3ef700mr105036445e9.11.1784452182500;
        Sun, 19 Jul 2026 02:09:42 -0700 (PDT)
Received: from proart-px13.tail9ecfc0.ts.net ([2001:16a2:c872:9901:bd65:b9a0:e797:25db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c96f19sm202174895e9.9.2026.07.19.02.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 02:09:41 -0700 (PDT)
From: Nizar Al-Kabbani <nizar.m.kabbani@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nizar Al-Kabbani <nizar.m.kabbani@gmail.com>
Subject: [PATCH] platform/x86: asus-nb-wmi: map ProArt key (0x8b) to KEY_PROG3
Date: Sun, 19 Jul 2026 12:08:43 +0300
Message-ID: <20260719090843.66777-1-nizar.m.kabbani@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dedicated "ProArt" key on the ASUS ProArt PX13 (HN7306) emits ASUS
WMI event code 0x8b. This code is absent from the asus-nb-wmi sparse
keymap, so pressing the key only produces a "Unknown key code 0x8b"
message and does nothing in userspace.

On this model the key is exposed solely through the WMI interface and has
no HID scancode, so it can only be handled inside asus-nb-wmi. Map 0x8b
to KEY_PROG3 so the key emits a bindable event, consistent with the
existing KEY_PROG3 mapping used for the ASUS programmable/Armoury key.

Signed-off-by: Nizar Al-Kabbani <nizar.m.kabbani@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 8005c08..aeb461b 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -632,6 +632,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x86, { KEY_PROG1 } }, /* MyASUS Key */
 	{ KE_KEY, 0x88, { KEY_RFKILL  } }, /* Radio Toggle Key */
 	{ KE_KEY, 0x8A, { KEY_PROG1 } }, /* Color enhancement mode */
+	{ KE_KEY, 0x8B, { KEY_PROG3 } }, /* ProArt key (PX13/HN7306) */
 	{ KE_KEY, 0x8C, { KEY_SWITCHVIDEOMODE } }, /* SDSP DVI only */
 	{ KE_KEY, 0x8D, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + DVI */
 	{ KE_KEY, 0x8E, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + DVI */
-- 
2.55.0

