Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792875325;
	b=X0yEgXtTyZqeWJK4PsFz7nNTNnd9ZZ4p71B/vUzyi9qYQtRfnsOBbFGI65cgaShvVAI6
	 ZPnxsjDHm3kPMcim2tg6TkTFeMAIdhCV2hEmw+RnsxtAt3MdiVBK1kb+j3Cxyh3G2GhIE
	 YJW+RYYsnojFN8YtZTL2Zm9j5ZomLOCq0f+SQexxVtrshhKXC2PF5AxFsu6mJ1n2ooKii
	 kPTFsVNQ7jIuW/jmjkwNeXhXK1u1kh7uUtvaZzFiLo2zpSOUwo4w50RZtpHC/NMXUvYdy
	 MP/soudQj2nbPJU0bu2qMDAbWSZmLuCGYvF+z9NzbaX2hpZT2tYd9w7D3P3LZlugoug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792875325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ve8WmCW8F4Rw5XzULuSdxjLcAQpU0NBVvl/d4u+KnPs=;
	b=KXmrfKn58I1E3xQ6OBdzYCS/MgK5IYqqKu5VJhd1xxOt72AazW7T+SHBlUJVAl5f0qR0
	 Q6/g/cNYE7Yok+4aNym+zGcn+UcDrkqpx90HS1Ywk7NdLuEoD61IMadf0+p6sTbeTispW
	 MDGn0BVkBpyHd7Nh71iXbMZRPiBXITEf8sKg1oFxK3ibDSux59fSA4WqVqYsYI8zXdYML
	 Eqxq/dZfPR/5T+FDMR8d6bGKpyqjpScigp9HDcBudCXV04M1rWaO68beSXfbmNmWruUce
	 K2Llcb2plSC6X/0NP8oANlVnSPZZQ50d4lQ3xY+X8TwnegksH+3AN8VxJw0JM37TLMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="K0MCJq2/";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A585606A31B
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 20:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A585606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K0MCJq2/
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so12871525e9.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 13:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792875323; x=1793480123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ve8WmCW8F4Rw5XzULuSdxjLcAQpU0NBVvl/d4u+KnPs=;
        b=K0MCJq2/or0s7v2cajYcC2plDUEAn1Ls2wm9tPSUUvWHqWvOe4XkO2yECI5t3bZbgf
         Dq4zmbMVpC1vZrhWnQ6Tuow+OhdHM5ExgOD95+F3y/+s6FDY43iu91Ei9Ly384RdLgjy
         Ro7scsjfFb9ljlQG0NvDvGATM3EdKD+QH5GJi+h0/bThDPNP9un/8wEMYuh1jxAwvKhB
         kauemy80VsUMMHiX97iR9Dmym9pQGya9zO/ngXTbEzHVl/g9undO8jaClzAANC8bkeae
         VvHeH7UjqsuBkZbTfcW4TPIxAFvJtAi5MWPmOCv0CqfF5rwRUUxOHpzHBN/RyXO4OhrG
         PRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792875323; x=1793480123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ve8WmCW8F4Rw5XzULuSdxjLcAQpU0NBVvl/d4u+KnPs=;
        b=OsaIi/xybvMccrQqT5Rguw7TVx/7kjP7PZI4Z1C5k17FMWPlsTqWzCE7MtEP454lDS
         uP+fZuyNLtWcsV/7Yzc+GL/bd6V/qgdskLBXUCQVl1wo8VSBdygocOOJ5/DAagiCh0Vw
         EOKtUaEqjn8TtTrhlzGPvAgy0TkKjx9B+xr4Y9XCvs8ofIJDnH/jQ1ZGVOScv1NyU/Qh
         GQ58dyNEMsZR7rnSstjPGpYPX1k/+H6ipGRpr0wOxgJw78NAzjZiPnbBH5X0p5KxUpGM
         M5dcAOZICyKkVdzvvoTRF/8yYPspt853jhewq447QYOebehnuVCc4k0Mq736cUPlWJ7h
         JV/A==
X-Forwarded-Encrypted: i=1; AKwUvBxtV4/ji06wMp5s3kkNgLHiMSlemFc7cY+AeYJRDAYi78HtTeb+qzAy7AzWEkPCIRANOiYhU6xocQy5Hd9H4ko/w0CO@vger.kernel.org
X-Gm-Message-State: AFq9FYLRTCwu0ykQQlfs9byZWHw6RnpsEgocpWAAOHtkqUz/vWhnlRU3
	nNuvbtPHsK7GQvOr25yS5l2UI45mnv7mgdAKW8fEOzLjrkOvtAQHheo=
X-Gm-Gg: AYBFou0iYqz+QqB/Y7wNQrZDlcarUWEtv2Gk/mB/JsYTwm7KvzXXhM7QEoTmxMz57PY
	u485WcwBRDvCY9mLq6AVESh9jS2X6XwrDOODM46AJrbN+1q0sBycC5JO1gwqaWWXEdI12EvXMoD
	1zdblSSyhC18vZzW4zWL7lnUSInUBkS4GEY928kQzkRNZZX9oluUk494A+6D1f7BlzSYC0VZnVW
	Bdi2iKZQijhKNrSr4dlog8DhHTiaqTU+lubX430l+uwgpTqhrq2bllK01bjM5YAsE2f9rD00eYo
	GHeyehwPtEuLaxZv96QBvWvt0dFc/rV3RUfPO0ohrFcOc5NlJACKHSR1p3IOrWWTzNYqQ0yttIy
	V6/087IMpvmyC2qLhkgo7XYGP+asSA7mmFkS/O7eo8kg4KihD7iy7p0Sa1CZs71fQlWxC+ncrjH
	F7CpkxNnaJek5WAcQrvFpA9GtVPD1NnkWh2uLzx+F8rxxemXIgE2jV5eqPnODbu6S0Hs0jk1ZI3
	5MAXvH/RiPrOqAFxFa3Yw8xX+E0z5Em9Q1/+FUuDJSosA==
X-Received: by 2002:a05:600c:198e:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4a35ac9d1c2mr50560545e9.6.1792875322481;
        Sat, 24 Oct 2026 13:55:22 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4ba7sm6202889f8f.33.2026.10.24.13.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:55:21 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Anssi Hannula <anssi.hannula@iki.fi>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] platform/x86: hp-wmi: validate WMI return buffer length
Date: Sat, 24 Oct 2026 20:55:19 +0000
Message-ID: <20261024205519.4029617-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

hp_wmi_perform_query() casts the WMI return buffer to struct
bios_return without first checking that the buffer is large enough.
If firmware returns a buffer shorter than sizeof(struct bios_return),
the subsequent subtraction on buffer.length underflows, causing
memcpy to copy a near-maximal number of bytes and crash the kernel.

Add a buffer length check before accessing the return data, matching
the validation already present in the sibling hp-bioscfg driver.

Fixes: c3021ea1beee ("hp-wmi: allow setting input and output buffer sizes separately")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 615b4cf6fc451..81c0acc874f8e 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -697,6 +697,13 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 		goto out_free;
 	}
 
+	if (obj->buffer.length < sizeof(*bios_return)) {
+		pr_warn("query 0x%x returned undersized buffer (%u < %zu)\n",
+			query, obj->buffer.length, sizeof(*bios_return));
+		ret = -EINVAL;
+		goto out_free;
+	}
+
 	bios_return = (struct bios_return *)obj->buffer.pointer;
 	ret = bios_return->return_code;
 
-- 
2.47.3

