Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648298;
	b=IxZc1ziwb1MsySjoqrbflp7+EnJ+azCqQWOd7rTWNAIX/k20jz2/EXNvOmdYOaNzB04R
	 Qqrfuyb1hSHlz+DfU+BhhLLvMFN6ZgSR6hLSzfWERAX+5I/wChU8/XqQGG2J6sXVnpxUf
	 6/9wwLjUxaLS9Ye45p+jbGubf4H8HYdiDaTRJaceCTAlyAQw5DFEpYAg5vTwFG9TBbiY5
	 dcC72Y1noVgS+Vi0MXupoS+p8bzX/6SKNB5EAZZWM5ENVHQ44/dESzJedGZKm+m8Fx9t5
	 rEJhg6cs7Mx3JQarAVjwAaD89PfwZXW54S56qb4ZQOcDrAmqoDmtbaV1gwuHELy4epA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=kOt4u6kmeqJwLnHO9krQOCVVCUBfYUR7mdfB8lBiBco=;
	b=PXkQrM0N1eTwXTR9EqW8YlVoLWqiexQbTBlrjrA20GRWSv/mmBj3kz4XhLaIZJH8C6e9
	 P1W9E9dV8dN7XkN8yv2q7D/h7d5t+7J6E6uFyn+jxRobD8uSA+y3FNb5pXJFCLLuRNHQM
	 GjzAJgv3z1i2gkoAmNHa81AMnaA/zfiXKW7RWeZ6dXHa6mjd++x4Vxf9dZNK/qJbNjGBO
	 Lxe10XYcMe0L9KyD9qwpOQYF9AD4v+orvRRSEBKC9O9Hqi+pgenR7/Q7HkqaJalv6ywpS
	 3+OAYwZ5pemBgUHoz5ehkvbZXJXqF7ocsr/7SvrfguA8eJPT9ViCPEqhZPfQT0o0aIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vt1dQngd;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0321C606A331
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0321C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vt1dQngd
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38431138772so8309574eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 15:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648297; x=1796253097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kOt4u6kmeqJwLnHO9krQOCVVCUBfYUR7mdfB8lBiBco=;
        b=Vt1dQngd9PVZy95Eefs0BcOZV2rR9e4rTVBllCLhg4ChIUKR2raGYXgyz3pzp3rML7
         VocROAwgqpzT7Vq00CHSgF5O7gIgNLtiBPKn9X8zwylfPDaSWQN1AaFyLU5ZYUdNIMNP
         uEeGVQjRMTXvpUPXvp/hx14Z/PfJBw00hG5Ga6CaawXIofxAHNVMkMNPUPZDPeJt5s12
         kvQ4fXIlWNiPJfdZ5R2zLJHB0I9Esi08SArw/7AinHveuoU4XdnR4oVt5P6xeMRsZhBl
         Xj6IJ6hF+jDgTwrIxK/Wxtf6hNarT9pdT8YGUpe4nd3vFmSFmwIt572HIh9Sn0VEy0VE
         97Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648297; x=1796253097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOt4u6kmeqJwLnHO9krQOCVVCUBfYUR7mdfB8lBiBco=;
        b=IFxi/D0xqrJSeYWnssGJezV/yskUNV+/R4hL4m6x/0JuY/FKisFpFT1mgulbFQveTX
         WP+529Od4BaNDzwjnS0O8N3PCnVeVmGElO5+y6nJAcvEcloO69rgMwBUr9JchN3/y9lr
         8fx/wOtGneE2CbfA5oQKdujWd5crY8jJBpGGCStm00AW3L2aPOA9LzIEtBXPwwMKOe6F
         0AuwWqdaLa4l/OK6y13fwewf1QhxHkyab2vbF0lIpqds+uFuwprGMHUKUMcw0i9LTtk2
         0F3ScLEdwaXw1BJhOoqtsElBYQPusfIGnEVAXRB9etYFpR1V5HN4Lv6J8GqYB0S8VYda
         of1Q==
X-Gm-Message-State: APuU4Z+6wgMUnQvv9EeGhZFanu0SRYWtTBzjXxjwqZb67P/QyqwpuOXJ
	rV8F1oIsqTnAiUI8Fav6qlGz4LpOy5JYpkZJI0+XVM1qhFuldkYF5qceIoioEg==
X-Gm-Gg: AZFdTZfFlkyqlRWsXK/rRRosgFiL+7/+0eJAipO2zvYu87gtfwNGPPey9JYqZ/eKWml
	pldOpJF3QtCJWbrZWWTTag0LbF+lJyAHQYO9zWY14S2VOiRbpIeiALAjjsOlaniyIVYrRqppqCY
	hyDPbyec27b4gV5a0HPWSKJXBQCVLPk51vAEsFrDJRkJoAztSH5BS4sVpsda5yTKzOjegg6lZ4w
	ToOsmvOJ687CG2tIELD1vBMvb4AXQTtLx06GwTJ5lWAsQSmsE81l11WgBGOV6ZmT3VhuMo7wNpg
	56Vz9dCBIL+PVKoXaTb9npyKeZqRVHZZX2SupElvuHQKB13xRJt3rUZ/wWqyBACZ4scdgVqbgGQ
	UOqjpJ29LxWl3w5bfX2L2dccO1h1/irGPqzHm2vfcHYzpgtk9KTu6YFWgXSRPOo9dQAPokP2+bp
	wgAVQRwfz9CX4weL9GNCKavFUSQO2RkPYKJTQ0IMOXnphzZgNDbOnGQva0PYZuvf0UYY28E7TnW
	k7Nz4k1aS/wr7Z3lYEetWV0pwHvIsQxBKFB5k4pbkBwO9/GhnKp+86iy0z4MmUakktyK7RHLXPW
	iDhKyloTGMUdCsCyaRVjIoQU+SZovbF+Hps+Fu+ksUmt71D3rmK4OcmaDKCMejhR8SwPlH1fsWx
	h3uE9YoMBizCvmpK1AA==
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr21778101eec.2.1795648297132;
        Wed, 25 Nov 2026 15:11:37 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm64430145eec.26.2026.11.25.15.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:11:36 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 25 Nov 2026 15:11:14 -0800
Subject: [PATCH 1/8] platform/x86: thinkpad_acpi: remove early exit in
 hotkey_kthread()
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
Message-Id: <20261125-thinkpad-acpi-hotkey-poll-v1-1-6dee57519c2e@gmail.com>
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

hotkey_kthread() starts with an early return when tpacpi_lifecycle is
TPACPI_LIFE_EXITING. A kthread started with kthread_run() and stopped
via kthread_stop() must not exit before kthread_should_stop() returns
true, otherwise its task_struct can be freed before
hotkey_poll_stop_sync() calls kthread_stop().

Remove the early return so hotkey_kthread() always waits for
kthread_stop().

Fixes: 01e88f25985d ("ACPI: thinkpad-acpi: add CMOS NVRAM polling for hot keys (v9)")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1bccc21ee29b..a586113ab1a7 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -2451,9 +2451,6 @@ static int hotkey_kthread(void *data)
 	unsigned int poll_freq;
 	bool was_frozen;
 
-	if (tpacpi_lifecycle == TPACPI_LIFE_EXITING)
-		return 0;
-
 	set_freezable();
 
 	so = 0;

-- 
2.56.1.839.g22a8290db9-goog

