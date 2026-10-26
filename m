Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013195;
	b=cXcHEJy/Q0cM4afaF2cobm/qkIPj6ajyM1E28r8s2o9s9x4yBZw6NZrwAH3KdQCAVkij
	 QEzZHtTg9QRv8Qduiiwlo/tCU43RLs58z9ylH7purNZkmzZv1PWEhOXKWISfFeS26n0V+
	 AS8OmvyVrxvrUav7rCrFPCZ4f7JHklcrTwb5SOnui49hITTJPoUQiWgcFKWA2EvSXqmF2
	 sd/S+HieuWCHlpEpgTnseqMKfTYWG/N2Ykptuh15flG8tfUkfTold/ujkWZGQrrEedBUn
	 4y3keq5UpWbOlgh1o9dbuVZTLIe6d6GdrjMvWw4ioIMiyIEeVsey0eCA7BRAQQ7gBfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=44FELyA7Kt+MCPXIDXpQzdpRkek5ze01af2IV4Cf03E=;
	b=xJ4EAJ7z5ZA7jlyHqUDXIaBNMhIV3Nls/k12HtFpN2z4wgONRlGKn7e+2Im3m7ZvcwE4
	 VIFW2RPSxSvhj5iCT5LQ439Fc9k8F1HIUuFrJn8mCtJqx9qXEMDKSE8IvXU6c2Nd7ovVu
	 zNophCY6AZ1gOtnHMREfDfqimoMMrUbqpi6NtBlC4wfanggucxki7v2YDhf9UaYr9ZkYW
	 X+ca+DlhoU4Q4iqnBS5/SX7Xkhe31ECmZFB9MELI8I89JQEyj6jpFp/qpQr1gwBObO33l
	 lz5UuhmzmcMSmnPe0b+89qMomaydqyVY48hrcSsPiPi8uM8auTn03/HONmp5AN2vpNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LZhkHCHv;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8260606B951
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 11:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8260606B951
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LZhkHCHv
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ccca948203aso792194a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 04:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013194; x=1793617994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=44FELyA7Kt+MCPXIDXpQzdpRkek5ze01af2IV4Cf03E=;
        b=LZhkHCHvsoG0TDM8rkXqEt0JDM3s5J6afDon/fYUgfIwEUn8yS69oKHbD0ldlIdw3e
         xIzEwVnyQwxbSeEJVpqIsRwfOjVj2ldoL1gglmDlrrTtUz/G9qiFigfnhIH2QYaG6oNL
         PSnIp6dO9nTMmwhu2b9yRm5xfS12q2J9zCuLzCJqeUOaXLjmOOl6iE9XeuzQjKvL4275
         6njJwcXOehJHOUvvMOGPpHNZ+aah8uZlwciGDWIzl+e7nSn65CGPLYLj2ZUaNgKG1kvt
         lixrzQwpqJaNdZPxh9Ea/DCrsnLdFcHMcr7iqos6oCnK7wPT5gRH6uscec+S7t1nrLnx
         8Hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013194; x=1793617994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=44FELyA7Kt+MCPXIDXpQzdpRkek5ze01af2IV4Cf03E=;
        b=DGoNiiw6621wLNjW0EAUnSnCKdi/o/bP3cQiAygwp5vsynre6pEFvvz/XQh/TF3psm
         11/Pxeq8qYHIT75CNwEhdE4Fp28WaEqd9KQKHNNmjt6zul5Oo8uKvGPnYTZhvsORxw+s
         0Up7+zEMSFUXlJdBX9wb43iyIrfXhJPdwOGp/D7Y2CaHQgGA9gMaBrDxE1OjMLgZCmlM
         8l5TMW+z7/DytzWwu98C94RI0xtAtFXJPeJu/JVRqL4F+G4RGeQga2CIvOdDrW/5HmnO
         oNh0YIEBWn7QNs2BPtZbp/2JN8C+tUiVeAUKau6om024IKdPgu8a0DvTdo5jd8xpSU9i
         cqdA==
X-Forwarded-Encrypted: i=1; AKwUvBxVouzEbrPYnp1kDQBT8ydVBHhdeM6bjIYtJJ24zI5L62bZ7WbzCxts9U748m6TsIB0s7ap1cjy+SBClDwy53q6zfRt@vger.kernel.org
X-Gm-Message-State: AFq9FYJhBTBhiru54Fu0TR3i9zP/WIH5Ld8I88fF4uABW2tHoGtWtR8i
	x4Y+QMq16v1dtQY4Cy6+6U0CmC3i8Lg7PkxMtP6S5Kzjmd5T0eJ/taHv
X-Gm-Gg: AYBFou0NMLcfUwIMKu0pn/K7eKH9F0ew1bNFynKGYLhJ2hi5MbMaSo+kbStPV02gpsF
	Gucew/CCLfiRxXnpDT2EjxHsNprdfi6sS0JJyGh/VfWoPFN8DvJt5uG5Uf1eRq31w3EcHh2Y25u
	oWyJT3WjXO5oVBRNKLTOE9sdDYzGWqW6sLNYk0EPsIQZ+zw4YNCmD0wBj+vkAN92Utzbaqzj0SI
	1VXsB8kj3lBlJIWJlfRRgl3lIOM8sao6RQvcAP3e/rYByU0svX6+R5Mp8zlvjFzsWYdO0dI29p5
	MpKm1S4lRHQMnSlmRtVHtk9ds5caiMu9WWd0LeIwewYA+Frl8F0XFqGFI6+FP27f4siGHtM84N+
	cBxr2SgJULCbBKwnypjqK+fHfFzdOo74bQbPJ8z+XNHq79GFZ6PgKQNuuSVQGwWOZdKnuqbHqt3
	QybwUQbBIAzADdutPd+phrheJ03uWvZNsSC1urgO5bC9Q1D7Lp1RETZKRKqn+iM64PRJNFT1qnx
	1y6UcHvaZ2c4RnIAFxd74/Ne5KFHsp87G+3L4Ew
X-Received: by 2002:a05:6a20:914d:b0:3e0:dc12:8908 with SMTP id adf61e73a8af0-3e7cd50c6c0mr5002050637.81.1793013194179;
        Mon, 26 Oct 2026 04:13:14 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::8534])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fdfefsm1128535b3a.50.2026.10.26.04.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:13:13 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "Lee, Chun-Yi" <jlee@suse.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthew Garrett <mjg@redhat.com>,
	Marek Vasut <marex@denx.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: acer-wmi: fix UAF after accelerometer registration failure
Date: Mon, 26 Oct 2026 19:11:03 +0800
Message-ID: <20261026111103.4158855-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When input_register_device() fails in acer_wmi_accel_setup(), the error
path frees acer_wmi_accel_dev but leaves the global pointer non-NULL.

Since acer_wmi_init() ignores the accelerometer setup failure and
continues initialization, a later driver removal or initialization
failure can call input_unregister_device() on the dangling pointer,
resulting in a use-after-free.

Set acer_wmi_accel_dev to NULL after freeing it so that the cleanup
paths do not attempt to unregister the already-freed input device.

This issue was found by our static analysis tool under development.

Fixes: 1eb3fe1d3b6b ("ACER: Add support for accelerometer sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 61ae622c93d9..26e17aa04abb 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2681,6 +2681,7 @@ static int __init acer_wmi_accel_setup(void)
 
 err_free_dev:
 	input_free_device(acer_wmi_accel_dev);
+	acer_wmi_accel_dev = NULL;
 	return err;
 }
 
-- 
2.43.0

