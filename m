Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27873A9639
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775924621; cv=none; b=SpvKkVJ9LxQWu/ioPWuKBTGra4HNDh0C7Grq132y/PS+rgNibXdVTcvw8kKPA3JiCsdWfS3wzyqoxz8ONY2OGdUHzoYrwJOFX24hnbd2pRyIPD4IxyL35po01cn/+Mlbn5ow6al+X5dQjwlvlhlOZVYcLrZOXXmypOIVqvbe1wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775924621; c=relaxed/simple;
	bh=as/Y6rgrCLbxvFJK4woRt4WCiXpZGU5Bmcl75dpz1Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PFME6tCNlTel+hdgS/8Dw+bMSaR6NCg63j5dRl/FYGP2zZiCghwCne7h1z7qmQ/4qcGawyrdpfmazJmpQQxA48qNuFqYvSUC8/UmgRTdHG1KeugbLzlPbNfS0uGXi+VBfoQYR59MyVkuuKNKAzrUmj8hszXB5nmW4NrPhuSczwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhA+C8EK; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhA+C8EK"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2d7bdb5ffffso718443eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 09:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775924619; x=1776529419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Epvlpqxnk7CA+C9ymJCfGqy8SHrtqDJZ4fsM6TY9RM=;
        b=nhA+C8EK63vA/lCT3ei+/e4Iojle5HzxgZoPE9+317fXrJyyVzVVDNsfj1V+ROVftI
         FYpmeRbjVWaU+2fXDGfcEdHYzAGHcQDNuHApB0Iy7hXvTqQT2fWOdp7Y2kjk+8iM3Gun
         ng45l3ssKI2dKiZTx0bhKHD+cOuQloaYdZaOh7amDnB3SYlx1nHdAVL9mynfieWFfvDt
         QWwF/bWR0Aw1z+gkUqI3B1pF5q2IwoteVS86yoDE+nrUVplOB/i6MMbLtnYTqG3SnItl
         cWVjRSH/zGd5YCGOOKDCKaqOZMU3PKdTJ5M7Br7UALiv+F66mroK/DeoSUGTdRx4GPAU
         Gy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775924619; x=1776529419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Epvlpqxnk7CA+C9ymJCfGqy8SHrtqDJZ4fsM6TY9RM=;
        b=qW1gtEnYl2UFZhFrY/diFJyYkn0NDMXwNHMvKCWgYiPArxP8fzwOJN1gLn2cNfk/tT
         xqwvli9mXYwRi96slA44Opv7ckamPHYScHBywY4pEdLYCjLETWRjG+GmsX7xvVk2o7xo
         8EM8TDHLCAtMQiwE6UTZGXyobt24jTPF1fyml1Ip1F19jHuFLAgtCa2hibjDqzBhYAZA
         O8GV9MSdCScTVWqxy/vmLUviWHqYFpGOL6j/atxtqElpBuuUY93s4knyV3C+Fxzg6w2t
         j6BYT3BRM/R5i1uXybkVvhOZauW6sRREixWtweA9MTFzINgd1opQCOD6cK0YYfxwGO1I
         RUjA==
X-Forwarded-Encrypted: i=1; AJvYcCUCf2VpRq74/gVm9R5slYmU/Eu9D6rg1kwkG5GlKwwt750eMncUuwELHMeWp0jSckb6huR4F7mmkwlzlKD22wKL8TKH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx6I46yrdIzx1qBaPopy/axSqTz0Pkwv8dsq1olJW4qfQF5fB9
	AGmRmxSd4EbxGTvX4BwSNmMLkrdZ56rDXaoCaHKGGtcH0N3KjTsZWXHb
X-Gm-Gg: AeBDievdVqDI8sHH6QBQ0BwBjt/qpdR4lsgFKC1/u77HLU9DS4yrswHfsOfIHaziEes
	JWOeY6EBdtw4U6fvK6x2CGRTYocBwh1/20gK5u2/3rah9hWrxL4zLuEO0jfwd5D3u7A980onDWI
	vZ3OBCSK9AiLbnHUOzSF9RWd1EK4CC9YMAms0h7F8NlElwZnbfik6hPFki41CZmnhAvJZfzFixA
	oTA9giD1AUDN8VJPsXozLoJQ7JOs4jVXaVAO/tyT8hB6A9+iCDlaY4N+3jo7+aqACJRQJmCj33W
	+KR3Bb/7E5aMNuN2TrUCHXnok071rUe8noeL4NtbXb9gvpaVoODisqK6xWQPTLxgdQ0UUPzJCk+
	/o3ZL7lyu7Io1rLa85LJG9KKFHrgS23ecH+w8g8MFypO0qQbc6Wm5jR+IG3UegsTHWyRWULyoE2
	B1UE4ujIz99Laf+2G2mhGe5oa97LWNE58uMSgy89r7ToMhaMlMJkxmGM01IpwUIDqZEEhF0Kjhg
	OI0XdRZMC/Iicc=
X-Received: by 2002:a05:7300:8c9e:b0:2d3:d3f:2429 with SMTP id 5a478bee46e88-2d583ed5c11mr4689989eec.0.1775924618851;
        Sat, 11 Apr 2026 09:23:38 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ce46a65sm9358907eec.0.2026.04.11.09.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:23:38 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v9 01/16] platform/x86: lenovo-wmi-helpers: Fix memory leak in lwmi_dev_evaluate_int()
Date: Sat, 11 Apr 2026 16:23:19 +0000
Message-ID: <20260411162334.25682-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411162334.25682-1-derekjohn.clark@gmail.com>
References: <20260411162334.25682-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rong Zhang <i@rong.moe>

lwmi_dev_evaluate_int() leaks output.pointer when retval == NULL (found
by sashiko.dev [1]).

Fix it by moving `ret_obj = output.pointer' outside of the `if (retval)'
block so that it is always freed by the __free cleanup callback.

No functional change intended.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Fixes: e521d16e76cd ("platform/x86: Add lenovo-wmi-helpers")
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%40gmail.com [1]
Signed-off-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
index 7379defac500..018d7642e2bd 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.c
+++ b/drivers/platform/x86/lenovo/wmi-helpers.c
@@ -46,7 +46,6 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 			  unsigned char *buf, size_t size, u32 *retval)
 {
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *ret_obj __free(kfree) = NULL;
 	struct acpi_buffer input = { size, buf };
 	acpi_status status;
 
@@ -55,8 +54,9 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 	if (ACPI_FAILURE(status))
 		return -EIO;
 
+	union acpi_object *ret_obj __free(kfree) = output.pointer;
+
 	if (retval) {
-		ret_obj = output.pointer;
 		if (!ret_obj)
 			return -ENODATA;
 
-- 
2.53.0

