Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648300;
	b=wuooMokBnSZQzEfISA6vgklDDmS1HKApiQcOdNs4TRnSB3qwNCvsh3NNPijX4JQoie+A
	 xQKnTCQVE1A589SEE+0HIzU4Iru2sPFCbjjKqpq20j4JYobAm6HvNzr4PD2mKnZC9hLHk
	 NFf5CLQBkKk/WHEHgWivg5vbLNWFD8tsZTuRykyL5AHax7noq0t6MN3OHj+FWuGKMOYqu
	 4JQgpfpdpmUq7+Uk+p1KBhAHzbos+jIXYr3/jbawIvgjdyUod/OqWKt0xnjPyxEBrZQPL
	 cF4niQs3BKJa9ad9k5iYZLuQdaFN35aTWVtpqwRpjSdkfqz3AQpPKMgaiZERnxWrvqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=yfHRcLA9grK+62eWIG5EUtvcBspL1bneHzPWyn0hru4=;
	b=v88oudmsOuTs0Vbd3k0aXHr22fdi8erg+Sm4T12D2T2C1e3mDx/eRLDarSjlC6JSHmQY
	 pui0fbPxDdJCuXQkI+ul2lEgBzX6ULl8hfYyb2EnHuD7cPYBKWVtoa9njZkUcPwIDWLf7
	 YJodhpyGkamYbsTpf1j8SNU0BKJGYJoFgojkaJjs2F0sRTGJuhtwcUCcCY94B8o/Q5nDY
	 4//F0k41+WvT/BfCDkbo839a1+HaFTJNqXlkDOZ+RT89Mvqy0f/8A95eICHwOBCdSP7yX
	 DF1ReVBVESpDblmDNtwMrLlUJ7vO7MqpCVw1vDd4OVkJm7xaU6SuZkAOcBE7UTAayYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kkyoCB/o";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819E2606A337
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 819E2606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kkyoCB/o
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386c71feeeaso2729752eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 15:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648299; x=1796253099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yfHRcLA9grK+62eWIG5EUtvcBspL1bneHzPWyn0hru4=;
        b=kkyoCB/oFa+yro5QsU4YzUxLek8zwfJCZbFAhEnMbnOlm4YiHrAvMHtGPCXgw6jLQr
         7tcTep7MpGUKCYZpD+wJqUaCrT9rc7cTBd5LnWxxvg54JxbM8RPaO1ueTPt3UeZXTNik
         K29l4KscI8NWKZDwsC9C1kiUHL0B/cRxSiHQKop5cU0CpZmjG7PibfGjqA+6k/ufpGAy
         eijYc0eG48nJgtMXAw02jGa6A/XTWIaEIwtVuvg6Abyq4xaFzvv5jUKn+b3hTejmMUuG
         W2BU0YiCGWQvkIzs0pYVm9D+qwtGKtA2FgU4qj8LNB9oUtBrBct8Sre3M7R4UVoWNK7a
         MyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648299; x=1796253099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yfHRcLA9grK+62eWIG5EUtvcBspL1bneHzPWyn0hru4=;
        b=pX65+0Fowxsc7Ejo+SwWn4eZti/qDWUOTsavD4D1QVKnWbYF7c32cV8Ma6T46nYW0E
         qzTkKCWX2siQyHkn7dYOX986I7IGYM7lXqpeXLHgVHMzPLy7ad0TrxNHPhZRQWoH6XhQ
         lt7W2WNdILSZdhLtKJ+AxHLrDWraxLFShhmv7aP2jLZWEthiRlPVuOilNVR1VEhY/sps
         qS6AxGmOuDhvwD7wmKNPGo9I88gtuehizN9fV2NJkdq2MPrDWhCxoRG7u0gPQIlDNkCv
         HUl4CbPPQLsIdPp2JGN8CllIW+1UNf8TcRq5L5c8r0+x9QiligDwdwU83/YcEMRfWRUR
         qzLA==
X-Gm-Message-State: APuU4Z+kMEV5g4VC9t6RPj1q3Ed3YR1bKMg1NJI7qAJbnl/uIKfVlWJ+
	Lx+puv+VGIhXRCmEyaUIYWmPRg2VEXj3Gw4qUXvJVPcLuZL8KceAA9iH
X-Gm-Gg: AZFdTZeFgepiQBsQJOIdH+jsyefiwmpvUnsiRIhidyU24bNS21GIu/YXufxGXb0Jd/4
	VvCDe/Po/j7nZBjhFf1TJtnPyh54H0KSH5byjAExjs0xy4RPP+O8pG0ZSaNJIo6TrWhSl1EAchz
	QEAABY4LPZ4WnpC7GpWoUh2ngY+ayvNrBSWT3L12i0lOvPgkJmUqczQsK3VXkY5isQxwAbqHCpP
	jc9ILtYX8qxVTTgizWi6Ls+XjYpmmuSohDQa6rX1FZpLxglLJY7dnOLa7BWeQsM9Xea1RrYtvau
	yCd7C7+z74jpFFN6li1D3Qicy4EGClhwrejM2fEFhVHTQWFU8LTiBZMD3PJpLyBMVtQ6+H9+PGh
	7fLTTWa+m6TiakNfrQxisI4BLpTVP5Yli6165d8ys4uDvYVWjuC2/xXSEQkZzDVQ+XTkGgQEtsg
	hGj3mvTQ0UGEbtE0eNieXEKK9MDA/N4w4A3Fo0VedyrEVLrPM8JTuqDYa7+fT7PSY5mDgQzP6iZ
	nne0DwNsCTHBV6r/cDH2/pzEdEsv2OrzuPKUrCbQ/ASpb/SIyVbAYjGnWo8Vx/mWp6qd8bylhf3
	aKouCw4nPh9xHQwu5H5jU4Y40yZpQO4MpXADp8WCEBD57RhOOWjUKLSOMhRwICIJhA3eWaWk993
	Xg7o7yQLRxUNN6UDYcw==
X-Received: by 2002:a05:693c:600c:b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-38570451dbemr22322723eec.18.1795648298582;
        Wed, 25 Nov 2026 15:11:38 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm64430145eec.26.2026.11.25.15.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:11:37 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 25 Nov 2026 15:11:15 -0800
Subject: [PATCH 2/8] platform/x86: thinkpad_acpi: drop dead -ENXIO check in
 hotkey_init()
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-thinkpad-acpi-hotkey-poll-v1-2-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

hotkey_mask_set() only ever returns 0 or -EIO, never -ENXIO. Simplify
the error check on its return value in hotkey_init() accordingly.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index a586113ab1a7..659a2c5d1982 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -3572,7 +3572,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 				       | hotkey_driver_mask)
 				      & ~hotkey_source_mask);
 	}
-	if (res < 0 && res != -ENXIO) {
+	if (res) {
 		hotkey_exit();
 		return res;
 	}

-- 
2.56.1.839.g22a8290db9-goog

