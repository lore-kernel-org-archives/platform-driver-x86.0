Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5899B370ADA
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627419; cv=none; b=hXRV+tvU4Q1KaB7qHpM+dJ312RvvOWNEkQOFyaLPpVGXGAziWJQ3m7OPbHhKf4E06OA7wis38wa1fMzYv3vhyTlpWPAH7HxQkquE8PH4LxYZsoe9vvMdPmC4Z3YY0FqkZj7p5rOr8QJPcE1UbdSh4qCHq13vJEXEtn7lFK0QCWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627419; c=relaxed/simple;
	bh=53zzevfhLRfzp4Pi+BoUZp7QMN9Kqtv9gHxdKvhhKmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FF3jXFS8VKSkpPMpv6+yLBPqIXOOtheEFnVGoLtyIQIzcdcQdiWk8AlWOJh43FYBnqsqF5uhtJP2WWegeAnKyJmkBjv30+r5LumC48NeV+n23jo6e21KQiNH0bSEb0eobXurhauUTwjd3fi4TF3QyrIWXBYXYkn0FXdkuxKbS7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IiyH0bkp; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiyH0bkp"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso410426f8f.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 03:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791627414; x=1792232214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vv7xplMcNA/1o71Kg6dyTzLFviywObxA6/BxiVUK+X4=;
        b=IiyH0bkpIt+lgACHYDOAxRKrlJvt3T7aw272CCsbEIT/U5A9OtAeZTLz79tXZU0iqY
         0LzQGL0FxHqpWHvVIUUYWBz6oCF0YGHgdc7/essNyhmxoWbdjv5xB94mBdzhit7Ew3R1
         9Wu0aaHg75X8cR5FhWfdY4RocIOjBaw9grk1nuXlbjTN5/9Fl9RXIY4AmFaz84tKo/gQ
         wcw6yf3o3DtW3W4Ip4l+H7YrBEmehMWhdl0A0SOf7RQpJoELqdYa5jkbaV1xuvS/xWdY
         wOXsi9toohVwS8DsoD3UlWQUJBJsZS4ARaPZb3tZMr8bHJLkYP4R1IFGRNzvlrKqQEcF
         VSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791627414; x=1792232214;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vv7xplMcNA/1o71Kg6dyTzLFviywObxA6/BxiVUK+X4=;
        b=1GkK6j3n913KcUaGAJQ0OFE+cFUEDu7orPA52ZoYd8gAcQFzUqIkhkfnm+JlACtQ8X
         lEEzOqmFrVCA6tkYSFgvthEgO9q4266LkHECNrsHh5V2rAC4dw7XRobPvNpWKM2eGjct
         C8KGUTIMflDz9S7p35Ws/QZBM2+FIanwtN4L/vB9uVPhGmitDB0VvSgOw2RRAX3WUWYL
         B92acpzm66gbZ9IiDuWd9gISZjiMTkYDJnzvnvVK3z8mCMF2fT0gajmCRxmba4BN9yzT
         O7RZXwXLsrG3eW0tCjuDDbVdz/CXjOc+VPZUHeNbsAx9Rm6Ip0kn7JG5COzA+6G9P06t
         s6EQ==
X-Gm-Message-State: AFq9FYITBlZzd5J7grkKYxdE9O7gRyWQA0ryao24AXh52ug1Wkg+OXCb
	sLOs5uizY4Fi75vD6HSL8W2azbhU8n1LbjgK5a7w72vHDKGa6TlBBk0RHZ4BLVgJN87vxIsf
X-Gm-Gg: AYBFou2+TOnWRf0Zd5hUjnhmE6A+mzdFATzHip9ZNZ8YaOwnJe1qNZtxvjKOebo2uAS
	Jh9CfpoW3c6MAQpzRcBhsF1GeQ6wyvA9d1kQsJhzkjns5jwcjGD7nFBLkpmnOVQG7HC6TlU4bVU
	2LTafK28LeJxgoIAqnw94LsLYr6+qfol/e6MmZHb6R+AoMqvembmPi6jGsMvMLAABg19mkM4BXc
	JsqIvU9P0hoYTQQoykTWgK7NAlxNoQLbdR9MyhiA9wseCPNhzP8AalGGneiHSTZCmjFbuEKaZhV
	d4AiU4N1eqD5/8bJtIeSTBQLsqwfOM2IgTjqmgsftHg5kBc0c9NIhj/N2EYbUBKNlLZdR2v9lDy
	so+ItbuTsVe3wLzQ/jRZq/S4kfQ8Q1i0IefTjaA8uw93zHdbHqojatCw5AyIpP+NxdRPeM2vAgB
	t0Zdgbzj5/qaByicp4Oqz50SlyPNMF5ZKvd4muQV6iUPjCDiwaVB75r27Y7dk=
X-Received: by 2002:a05:6000:29c3:b0:48b:948:c720 with SMTP id ffacd0b85a97d-48dbaadc125mr5307079f8f.11.1791627414059;
        Sat, 10 Oct 2026 03:16:54 -0700 (PDT)
Received: from ASUS ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c38f4sm9417856f8f.27.2026.10.10.03.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:16:53 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	luke@ljones.dev,
	denis.benato@linux.dev,
	benato.denis96@gmail.com,
	corentin.chary@gmail.com,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartu Alev <bartualev@gmail.com>
Subject: [PATCH v3 3/5] platform/x86: asus-wmi: name the TUF keyboard RGB state and speed codes
Date: Sat, 10 Oct 2026 13:15:59 +0300
Message-ID: <20261010101601.888709-4-bartualev@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010101601.888709-1-bartualev@gmail.com>
References: <20261010101601.888709-1-bartualev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The TUF keyboard RGB attributes encode four power-state flags and three
animation speeds as bare BIT() and hex literals inside their store
handlers.  The speed codes in particular read as arbitrary hex until
one knows they are EC firmware conventions: 0xe1, 0xeb and 0xf5 select
animation step thresholds of 30, 20 and 10 ticks per phase, which the
EC derives from the stored byte through a lookup table.

Give the seven values names and use them in kbd_rgb_mode_store() and
kbd_rgb_state_store(), so the handlers state what they mean without a
decoding comment.  No behavior change.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 5cc71bfac841..c5c0fe92cea0 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1047,6 +1047,10 @@ static DEVICE_ATTR_RW(gpu_mux_mode);
 #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 /* TUF Laptop Keyboard RGB Modes **********************************************/
+
+#define TUF_KBD_RGB_SPEED_SLOW		0xe1
+#define TUF_KBD_RGB_SPEED_NORMAL	0xeb
+#define TUF_KBD_RGB_SPEED_FAST		0xf5
 static ssize_t kbd_rgb_mode_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1080,16 +1084,16 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
 
 	switch (speed) {
 	case 0:
-		speed = 0xe1;
+		speed = TUF_KBD_RGB_SPEED_SLOW;
 		break;
 	case 1:
-		speed = 0xeb;
+		speed = TUF_KBD_RGB_SPEED_NORMAL;
 		break;
 	case 2:
-		speed = 0xf5;
+		speed = TUF_KBD_RGB_SPEED_FAST;
 		break;
 	default:
-		speed = 0xeb;
+		speed = TUF_KBD_RGB_SPEED_NORMAL;
 	}
 
 	err = asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS, asus->kbd_rgb_dev,
@@ -1115,6 +1119,11 @@ static const struct attribute_group kbd_rgb_mode_group = {
 };
 
 /* TUF Laptop Keyboard RGB State **********************************************/
+
+#define TUF_KBD_RGB_STATE_BOOT		BIT(1)
+#define TUF_KBD_RGB_STATE_AWAKE		BIT(3)
+#define TUF_KBD_RGB_STATE_SLEEP		BIT(5)
+#define TUF_KBD_RGB_STATE_SHUTDOWN	BIT(7)
 static ssize_t kbd_rgb_state_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1130,13 +1139,13 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 
 	flags = 0;
 	if (boot)
-		flags |= BIT(1);
+		flags |= TUF_KBD_RGB_STATE_BOOT;
 	if (awake)
-		flags |= BIT(3);
+		flags |= TUF_KBD_RGB_STATE_AWAKE;
 	if (sleep)
-		flags |= BIT(5);
+		flags |= TUF_KBD_RGB_STATE_SLEEP;
 	if (shutdown)
-		flags |= BIT(7);
+		flags |= TUF_KBD_RGB_STATE_SHUTDOWN;
 
 	/* 0xbd is the required default arg0 for the method. Nothing happens otherwise */
 	err = asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
-- 
2.56.0

