Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A59328B5E
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Aug 2026 02:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786589877; cv=none; b=EZp87ZBg5Xa6K2ce7ZZ/StH+uESRSV+pprWZrd/p9HthsdQeO+aEotLGlhjetsvFCVbXDa5zshXXnqZNZkQBbf6ARSLWRRgpIbIJNiyKI8Wpo/WiJUso+Pmxzq87zGuYI71uBaWyFpz4aV7/T+BoyJfoIKxsoaVTR03FcndKhYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786589877; c=relaxed/simple;
	bh=MRVZLhqECN/6bq7hUPFuPgmN1e8vpRmFgF1p+CAfNPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7HzVerMymvjGqgohbGbN0eo+WAAcwax+dZ5prRrd61y+cu1y7CCEU7cDnm26Sa4AmgVzFkA/aCPJhQLhk1Os2+Bu2sWgTR7YgMFkUO3ZV4amoFRD+ws/TpgnmEw8GzJnc8gRF1mLpiLY4ntppJ1G5IG/QrZaKpWISc+YPO62Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifFiW1xH; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifFiW1xH"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so1885472b3a.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786589876; x=1787194676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+GWENBjDWrJEgL5CdDa2/cfWBjrCiB4j8gWnZOgbQY=;
        b=ifFiW1xH/Hqw9yPHXjx7ViShdIMP6Hzbsenk/OoMDEORDsn1sVwrojOJzhyT1dMBgc
         0QRNRckq4Sj1ov3Hu7YPDkEvfadziQTvvJG6wa9L1HO2lL/8nxTWO48ISyc2vDQLF1rT
         Y8d9gx0fJivswTTR0uqAJ67z97++nXx8UFChqTT/zk9k1hGWGGehZUpxMIoT2j5J3zIO
         JpdcESzM+p84Ve7/t8JL0Ys0aygpG614ZDzP58Yon/C2O7+2pi6P1Z7IAeCa5QvuvXqB
         7SoAxLhY4HFmJqzfNt45R/GOB/KwO+QY7lfGIamK2sAcnnjkIYZ725dEe+hySRL4QblE
         9Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786589876; x=1787194676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1+GWENBjDWrJEgL5CdDa2/cfWBjrCiB4j8gWnZOgbQY=;
        b=iFBuRHRtDN+VIVdPj3UdT4K01Hfs+qE6RxcjvBOP39yxg6zsS8NXksqxc7kDxQyqFy
         KjFAssjckbN2Fn2eY3zyZveKN5sI2mDMXFrTGtMPZUyGiRg+zJGzUc/4SYjPWppsYphg
         aQZEsR3F9sgZlqDV/WcN7xvPCj7J1+IjXuEa3ah+jzH+fVJeI19BOhWB9mBFZHfMttJB
         WeWmtjLg+5rfRr1c16K1tuElKNgdObTazA57Sk81Vjvo9Vg6Cs0/QPyX6dDyIpLmisZ6
         VtNt9WskMnkcAjFuhB3bKWdxfngrqni05dhJu1/X8El+JAobCUf4tIi9RSXQwy9VZMuP
         Y8vQ==
X-Gm-Message-State: AOJu0YwhhrTQ9Dvku2FruioI66IdyjvSmG/uutZkuUGvgO11FZCqYHHK
	Q8FnIfqbV6wzpuISWxuV67XIEVcmnRMgY1b7YLtWudomhhG7s9Zm6C6P
X-Gm-Gg: AR+sD10w50gP+sAsxjkml1yygGhnJgV8eUbmFW2iZYtbkv0bfeBpEQ+aFkyczw0mXvt
	c3ak3OLzODfIubsvCOUfgalTehJpOX1rYPz2Avi6Pi94vxeTSiyuuF4Szjyebz7FcBbn0NoeTUI
	KY9TOhW7cBeNmyYAukF+KwC8Osy/TxEY6/aVsKsfoN4kJQ4UCcax21/UfNevvIugggyzrMghtcL
	fCOxEd5R+YcYPQ3O9oGnKDjHoGmtQj2sMotGsQGG7up5Evw9KKe3lglpN43C2pQodIrlSrdFZuK
	EfSSl5FJnqwv8AQHNf4eigWH8PVyvnaeKsAPm1m+k73vl2VAqu0DwmWflRpSKR7sm5KKkD2Rpmg
	KQ5gC2TfeWCB2smFdUPa48P47dqwBSdXKC2VlAoBtmEN9lzsiLwCWAkwo8zqSe2PfkDi9tW2O2s
	TZ+p7/Z7KmiOrprST4393l0wmTbXCzKBuW6HCqCEw7I5vp4hoVDZK1OOjRTd86wBpIGYzsW03fb
	oyerUtxnT/vvU0BeDA=
X-Received: by 2002:a05:6a21:7002:b0:3cb:eca6:ce5 with SMTP id adf61e73a8af0-3cc5539af60mr3916877637.24.1786589875490;
        Wed, 12 Aug 2026 19:57:55 -0700 (PDT)
Received: from sonic ([177.181.237.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebcf66340sm2097470eec.13.2026.08.12.19.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 19:57:55 -0700 (PDT)
From: Hilgad Montelo <hilgad.montelo@gmail.com>
To: Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hilgad Montelo <hilgad.montelo@gmail.com>
Subject: [PATCH 3/3] platform/x86: panasonic-laptop: Fix sentinel write past pcc->sinf[]
Date: Wed, 12 Aug 2026 23:56:25 -0300
Message-ID: <20260813025626.24266-4-hilgad.montelo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813025626.24266-1-hilgad.montelo@gmail.com>
References: <20260813025626.24266-1-hilgad.montelo@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

acpi_pcc_retrieve_biosdata() rejects SINF packages only when
pcc->num_sifr is strictly less than hkey->package.count, then
unconditionally writes a trailing sentinel at
pcc->sinf[hkey->package.count]. But pcc->sinf[] is allocated with
exactly pcc->num_sifr elements (valid indices 0..num_sifr-1), so that
write needs num_sifr strictly greater than package.count to stay in
bounds -- num_sifr == package.count passes the existing check but
still overflows by one element.

This is exactly the case probe()'s existing num_sifr++ workaround
("Some DSDT-s have an off-by-one bug where the SINF package count is
one higher than the SQTY reported value") is written to accommodate:
when a DSDT's SINF package count equals SQTY+1, the workaround makes
num_sifr equal to package.count, which is precisely the boundary that
overflows here. Found via UBSan (array-index-out-of-bounds) on
hardware where HKEY.SQTY returns 37 and HKEY.SINF()'s package has 38
elements: num_sifr becomes 38 after the += 1 workaround, the loop
correctly fills indices 0..37, and the sentinel write then targets
index 38, one past the end -- a silent 4-byte heap overflow on kernels
without CONFIG_UBSAN.

Tightening the rejection check to num_sifr <= package.count would
avoid the overflow but breaks probe() entirely on exactly this
hardware, since num_sifr == package.count is the case the off-by-one
workaround exists to support. Nothing else in the driver reads this
sentinel value back, so simply skip the write when there is no room
for it instead.

Signed-off-by: Hilgad Montelo <hilgad.montelo@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 0afd6b8..cb79ddb 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -466,7 +466,16 @@ static int acpi_pcc_retrieve_biosdata(struct pcc_acpi *pcc)
 		} else
 			pr_err("Invalid HKEY.SINF data\n");
 	}
-	pcc->sinf[hkey->package.count] = -1;
+	/*
+	 * pcc->sinf[] has pcc->num_sifr elements (valid indices
+	 * 0..num_sifr-1). On DSDTs where SINF's package count equals
+	 * num_sifr exactly -- the off-by-one case probe()'s num_sifr++
+	 * already allocates a spare element for -- there is no room left
+	 * for this trailing sentinel; nothing reads it back, so just skip
+	 * the write rather than running one element past the flex array.
+	 */
+	if (hkey->package.count < pcc->num_sifr)
+		pcc->sinf[hkey->package.count] = -1;
 
 end:
 	kfree(buffer.pointer);
-- 
2.53.0

