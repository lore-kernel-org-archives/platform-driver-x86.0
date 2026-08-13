Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11B33E3156
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Aug 2026 22:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786659482; cv=none; b=kHYVmynRu7UCORrf2Spltyao2p96WKh5SyBvt5abd/wHGUoZQbzA4AczCIYz7+EaSiqE0JeMKGS3j8eXeMnSs+/yeZ1O7iSmqhWAKlnN4KNOU2CN/LPjyIKQBaZ7FVamv0SGpgFOf8+aSlMkucbkZPpEO1FeviArcrPsyB3cR24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786659482; c=relaxed/simple;
	bh=Fx11ZzcEMDx+XWvgLsyL/NzaNa77kctud5tY5T/YvMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rDqpVvduPS4W8gm+dMiS8lmKIqZfy5qeb0HHHjB4j+4Ua+XlzdnjGjBZ5Xu7pWOrUTKOYpglYP+x7a6HS3NJMo/6WsdAtkjfTsaLIReh/4IqCy0n6XHO39dyIMZXsNkwJ6H20ygQAYl44xRISqb0Jzq8Bnm9FOYMTfv5WvFmnp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgyAGMgu; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgyAGMgu"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbee846deecso354509a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Aug 2026 15:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786659480; x=1787264280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6kwzuj7mx25GPpnRY6pHNhOgcyjHMHZYoHK7gFZt5W0=;
        b=DgyAGMgucPEotkq2lpIAYvp06ZAK2t16lOcL+r2uXDhrKPpabmI5d68w3+t0D4iXbj
         /F95tQUB33RAhm7vhszOYNNfpf0uX0cLNn7UwgP2X/mUFWFZknSVQztEyzMJAPNlEYLE
         o4JuheHbQNRxJxFEUB83uVFK3YWttT+ypyX/sVSBJtke7CB28j1bUIvi6i4Gh09lqMSK
         pOrDwHpsgnWY/Nz7im306L/YZlqGalki3gu8NXaSA/btw8ONv+Pgp86fPgu7wklJp2Cy
         117pwgPycO/zWWQuoG0fr7ReEOWRAEr7aov/MIJ+xWWyRQzTmkl4SJaCgPpxWJ7XU59s
         F8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786659480; x=1787264280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6kwzuj7mx25GPpnRY6pHNhOgcyjHMHZYoHK7gFZt5W0=;
        b=P88J3V4qHFytEx5jpTnUcoDYDviGNU2G3ot+l6TLKjwWLZUZprI8ruxJrxJN8nMpWs
         BaZ0ADjrWstL48078HjpXxit1o37fmThnlS/WuPDgNyZJaNBLJtW8AvsD0hYc3t80SJ4
         LseTlvKBEyu4WP0a+TvqjRijkNx/yadcgE1Ls+AvxN/36Q9OXGMaZkqt4MPYQlmtPMx0
         vlgh8cfXx1g4nK0Qjk9yKiTZnfMqXN/LrVa+vrJLrnDd+qiSorczvfuDOpDmld5KwVx2
         bbmClzKx+33uS7Zf4Up9Zjy+5F7Ubs/u31WN+WkJQmGbpzSIgD7uXc9ELgivv9hwP8xZ
         YNsw==
X-Gm-Message-State: AOJu0YydCtW8uH0C7K3zyZrtd+0hoEepZT6/8+JA8DQAHggp+ktWeqvx
	/4218y8eF+nY/n64SHF9/E7uacgZr0jAIt1LquM8/NWuzkPwQfGoCgQS4jOtJugy
X-Gm-Gg: AR+sD12zT1WFsI7rRLdbdMqio07B9aqNdUwSfFArEEiHszCHLkTOWovBRePjZ6Q86fD
	/OXukpJvvjMQCUk/E9pehvST48nEkqiNV9DdCZxBW4CPqHgFHEdYgMCJfoZ6d6FcHUuw55lNlRH
	jYCh04to1GaWQeuVu0ggBte6ciNnG1E9fklDvyuGvHgpjBvlp6+wAopgmXzHHuFv2MKlODSGg4Z
	NInJynjBEmVfLaEMP8ZIUUlI/5TUu9zYwvBziirqZrjq5Nz6gIH5B5o5aniYts58HyNo0rWSGgF
	zs9rMtQFsQwDOjCzcm1CVZntEhBxlKeH+5032gwe37vxb5UGU5Cn3+hxDZSGJYM3VCFaNZjUOeM
	EmamJ7gmh/WDGY1Fsvz++rw5sofTLpHEzH/xPOd0E15E0CKhPn/qU2H61KbM68aeahF2zB0YuqS
	NorCtm+85DF20UsV0pXvXQHMFKRkd4KEfQ4yY+Tzohrgr18KqoE2ombAP1vXcAOnd5mqD4Y1Wur
	zA/k+g4xr6sD+lxRys=
X-Received: by 2002:a05:6a21:2d4b:b0:3b2:a809:ffe with SMTP id adf61e73a8af0-3cc71a2d522mr1308747637.14.1786659479811;
        Thu, 13 Aug 2026 15:17:59 -0700 (PDT)
Received: from sonic ([2804:18:167:9e8c:e6b5:fa0:d068:30e3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc667bfesm11463318eec.2.2026.08.13.15.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 15:17:59 -0700 (PDT)
From: Hilgad Montelo <hilgad.montelo@gmail.com>
To: kenneth.t.chan@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hilgad Montelo <hilgad.montelo@gmail.com>
Subject: [PATCH v2 3/3] platform/x86: panasonic-laptop: Fix sentinel write past pcc->sinf[]
Date: Thu, 13 Aug 2026 19:17:44 -0300
Message-ID: <20260813221744.25668-4-hilgad.montelo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813221744.25668-1-hilgad.montelo@gmail.com>
References: <20260813221744.25668-1-hilgad.montelo@gmail.com>
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
index 93e6511..9511440 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -476,7 +476,16 @@ static int acpi_pcc_retrieve_biosdata(struct pcc_acpi *pcc)
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

