Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E11B3F1AB1
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 09:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811537; cv=none; b=sawjMLS4RziXzUnqMJssyf5SiC5rHW5ruBQzNUW87NrRHPVPBGhXWdoIDbpJYa46bLUBmvkDUeCCsjg2hXxMOJiyyRsOhV+2kwNF+mRikGjZ4vJc/8qqZAzDje8rpQYIsiHwbwrkFLSkml1xT+tiRA2J2QOOEnVGYWxmKQ7FIc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811537; c=relaxed/simple;
	bh=g5HORWFcPCLFYArQh0ZlP6gh9rXUyz3iN0kF5mYR/10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N92If+FgeRJODg4e7ePQLRA4d0If4EJ2eDeNEvU1lp/E0kV8SovG+xV11wsWvTTJAR0Py4JLEmvLs+3n254nCe0LV8I1hAVH5u9CIoA6XxlYX389KR87CbamApUPBmMKYBEu6jbEOyENORRfqz9fQgUniMrcbMbZyN6F0w3EqAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZIZqY1QG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZIZqY1QG"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-473ba028d46so1859835f8f.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 02:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782811534; x=1783416334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikMStyHUovO8d5AW5IoKm8cxVKJWFQGP3UsxrRjAtIU=;
        b=ZIZqY1QG5Csk7NiVsjZXJRrJbY+3gZJvHxYj2EEIXIlgJ77vO7aIuY8J/ZNJe5cPvi
         dcoluVxLIgiixtBK23+mCxZ9OhC5a3aZMKVbQOjgZc02DPNBcaa7Gfqp7ZHNOmm3b9rj
         KeVFcGm0y5ubxqOTyM4xx+bcZJkkvQT9uX8XOBQfrfuPOKHltEEowlKiXIwp7jxuYG1+
         SPQn40hyv3kIqBm2L/3SPTTulTEnTTdZtMKiBa2YXRNqqJbN+e2EjnIVO6fsMH0Yisa2
         rb/UVyRJT+ZPSQX1L1by3SzQ3RsNziD6YDgUi8rQB8mZzt6Ol6psUArCV94JSeqv7Uxw
         Y7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811534; x=1783416334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ikMStyHUovO8d5AW5IoKm8cxVKJWFQGP3UsxrRjAtIU=;
        b=l7gXpqZxrJnN3mblog5otJVR89XDLoxnF5idibPuRl53mgjH7bRbqQ146aVdL7JlMS
         uFOTkE6oRwe5kq/3jAQEwKKE6+uI5Hqw3zgjRhUQ25SCCP4PdTLxn1h6dGKVjuQyCgo8
         nHKisf88tjzQEzN7/83ZWVnJoVwoq4PzLsLdRQHl90aJVVvi3/+JSDk/06m7MNFFYNuY
         r5lpAzkzWjxBaoUL/T5QejPsIMCA9aYPvyp01lxv0ZR1y/MCY3W+9CDbx2ciAbc90kHY
         XLgBVPIeGyDSisnCfGSz2VKj2+wG0zW8z5wYdd6alHOo4SLKTwP3uP0vy36I876plAiT
         caaQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFXhR2Zp7I/KTusqxsz+Y/9u3W3ofakm39e+aJp9I05dLBu1lwgukzgel6nLYEtVq5kAMiJxyvZLLD6UzJIzpfxxaI@vger.kernel.org
X-Gm-Message-State: AOJu0YwekrEj8444C4waY5aV/XTtOznUg69EnCDy3w93g2il2OlD/W/u
	l6fwD1Vg+xK/8AoWvmagBdoClqgx3AEDVKbM/ltuClGg+DS2FfkSLHteBsbaB+aqCds=
X-Gm-Gg: AfdE7clSNylJAq6XC4G+onNtyDMG7u+dpJqU+SPD7lxH5+U0zuwtN2z4v9FdFNwHIC5
	UPaj4JDsW25JRiIx5EeP9X2kYnh7+p2qvl0JZyWt8rr5HJfZHVI+Lu+pYVWxvknxs7TMbtZCTJf
	Ms4fr8hTj+wsuSHesxcHTx9iuOeOaxp//cMaR9ARLKhB71jxgKcCOHTrIt+rUtYV2jFF3GHsw4U
	Cyle3IjLlnJ8aFfRLZOX7usfxpxkvk9b+w04y/t2HbL+0tu9VvLYLcgxov6L6OPFLiAbuJWfUxY
	NiJaHKLdfqO+tLT8PKnORKsWckEVwhoi+yaJrlz9bxruXxThLbChPXr/GK7YSSm9qxBS9nbiL+o
	eTYvcL0rH1slE8tvibX3Hp1yAGX7Zaj6NUYhyItUpurpELGuPeUjvv1fhK0s1MnrP1lNu/N+EWu
	bMNVUQj3YL3FbVuOKf3zkNUeEbVl5ebXb08SGpCmi3lSodUZhXSOzCNrCaHDqJjzMV5ihtPKfmn
	GFqDFzSDHLNBBI=
X-Received: by 2002:a05:6000:2dca:b0:474:6a5b:85f4 with SMTP id ffacd0b85a97d-4755021c1e7mr3383424f8f.5.1782811533735;
        Tue, 30 Jun 2026 02:25:33 -0700 (PDT)
Received: from localhost (p200300f65f47db042c439d749f38355a.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2c43:9d74:9f38:355a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4756636d2cfsm6721652f8f.17.2026.06.30.02.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:25:33 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nikita Kravets <teackot@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH v4 06/17] platform/x86: msi-ec: Ensure dmi_system_id is defined
Date: Tue, 30 Jun 2026 11:24:25 +0200
Message-ID: <600c7ab3263dcb8cee39b43dbd313eba8abef376.1782808461.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
References: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=g5HORWFcPCLFYArQh0ZlP6gh9rXUyz3iN0kF5mYR/10=; b=owGbwMvMwMXY3/A7olbonx/jabUkhizn7rDPxUlXr2flLg05xK7S/rBTrerD8aLQF5sz6t8rs hdOVcnqZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiWx04GLZcKbfXYrsTp92W /Iqn2aRce/rvgIWn7rDdi2A2mjv1tbCaWMOHf8ffiJp8uBcucvCEX5t24ynNu5tezPxhEGLcpHj YNyuq2Ss5Xs7rlem7xmK1JpHfe08czZp5T1OA/0rck7qzHKUs/hdTDi3LrH3OHvAzbd7TxUKxmY tzP34LYp6SkLAqxWXyg+xTh7RqeR2LmvnrVX4u7tygq1rsyvm4NGyhxprllZbP62R7IsTEw4MK3 k+JVzJZfkJd2HhK4VYbpd7gpRfWOhlsfjf9hu31DYXiaktktc/fu73qP9OqVafkeKa1im4S+hke w3EmTNruGOvZkA4xncUlTo6ro9R5Z0fPSpXw6dt9tvIVAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Currently <linux/acpi.h> includes <linux/mod_devicetable.h> and thus
dmi_system_id is available for the driver. To disentangle includes
<linux/acpi.h> will be changed to only include the header for
acpi_device_id instead of the full <linux/mod_devicetable.h>. To prepare
for that include the dedicated header for struct dmi_device_id.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://patch.msgid.link/0998f0a790036ea630bab82a8b78af79167c3e4a.1782682124.git.ukleinek@kernel.org
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/platform/x86/msi-ec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index 0157e233e430..dfe4532ebe56 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -23,6 +23,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/device-id/dmi.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/string.h>
-- 
2.47.3

