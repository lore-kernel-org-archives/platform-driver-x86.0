Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792991955;
	b=AmK+4M1EngZTVSzs+qIqRIkf5krZjvVLvkpCDvMfrol/NZ8FgR4Mc5kd8wp4oA24Gqsy
	 vdkQ08zX1frWjGXAxQjaIXeXyXqZdpiV/m4Tl1zwZaO5W6HuQnwperf62da3r0WeTaxyI
	 DvPBD9ZSsHU2yVGQO0q02Muil+R0fkN+oVGgb4vQZ+7j0SlXfL7w81OZ7Jm4pr14wZ+Vf
	 JroNin97YoBm7f7bp40vz+/lbxIgD/NRIQMYJYsXLOlVuCLfR4D2Z3rehyhq3ZzzIcNbs
	 8tSRYNTccG2n/dhP5+PTFBbMddadUyWM4WqTyEt4mmKxorbacO/wAi9E8rK9wD/Ujqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792991955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GR1SJvSKmvxCr2BjcQJzd+vqvhW2VA+xloz7HS/XgAs=;
	b=IEcShAig9lWVgsat7/KYlEivn5Sve/tuO7mBhy+dSylHLwJp4ngHJ1bxpbO4UrVhHoz3
	 ofavqIqRQ1HBE97TiMHJG7Lp+MInLkXgXglConISl40erVfH6Avr8GrvS4hqU62ybdDw6
	 +rkxuodFyDdAvL7RjWSoK6vxpTWG2T6p8KsN8i35or7X/kTe78cUJFeLjbOT37Ks4dXM7
	 EOiqT9kMmAL6M957px0TbvzIPbHBGilmmsiKRwy6ejD3kYgE/0brW0vY2kVy+8T7LmJcK
	 Q/m6N5xUoVxY0BX3caNJQ6exedRwVkzWmmkmGMsPMmmrl57DfvNyBUiVK3/jmyMWljg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kl88xs12;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58E3606A31D
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 05:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D58E3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kl88xs12
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1546853f8f.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 22:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792991953; x=1793596753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GR1SJvSKmvxCr2BjcQJzd+vqvhW2VA+xloz7HS/XgAs=;
        b=kl88xs12a4DUn4RWwpvSIEj9DqMyCBJuuTbiJsXrpo4LqeUWra3r6jxSNY77+hi+pH
         FC7WgVXm2uLm3iBRhJYyIztvONqSdTTJ7O0nMHc/Oab19AZGZi8jW0P/1oXKTNU6AfGW
         wBHqmmajV9PNZsB4tOogGUqXSL7ZO3LpqtXCxU1MR2muPjhBotIEwv26VVMIPj0MZJWz
         Kq8x110PyZj99fCIozOeXbuKCze4BMv6srieDTYZcdG8VLegA1Yo+/59OWaP56c/stFp
         fuXfOmqyySum8NxvFQiO1BQxREmRmqex/OA1a3NAnjmiZ/OyeZ0RZHNf4MFzVGVVHBr1
         uMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792991953; x=1793596753;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GR1SJvSKmvxCr2BjcQJzd+vqvhW2VA+xloz7HS/XgAs=;
        b=XEJAbnoQT18sZmgfTWLsbB5FxoA55eoioTnVT+LQXsEXHFZSafztupYaoqC8j0ANNC
         6mkfYnT/I5oSaq4J/geES3cBfIyDiZisWh2BtaBVoNxal/KetVOmK97fgOZLbn3GEzAu
         /PA2dwDyvfmRjBmMK24JvaqbV4x8PdeK7F/j/421fbUb+Vj8aQdoXIso+O9/Nv7U+smb
         9K/VhzbLNzQnyaaiwuejMTwJJUF2/fdID4vJSQqPCm0rKi3a5mU+Q9lE1VEZFA7BwVVi
         W3dVDNOr0ddq1+xFe0CiTS5ENSZVOEqkFxBoqAs670oP7UbZEs0hrt5ixWr7GjxsVyeF
         suVg==
X-Forwarded-Encrypted: i=1; AKwUvByL3xcTUnPu8SL8mvoz7LnCXDmVdw+mrf0NeBToy/z3vTsHDT201xooG0R9JqSInm4hhQYfCpojyLpgm/lfZYnS3csP@vger.kernel.org
X-Gm-Message-State: AFq9FYJs8PLfBBkYZnMh7fd+8hyLKTDpEy/dbsHoLhAJgFO+3JXe8Q1p
	ARisQ5e/JKQGT5bw7CyiiDikzQtqVhoTCxWoGWhXRgI4omy0mRpGJ7AM
X-Gm-Gg: AYBFou1wm6IxwZNKmx8nhR0WWdi4O74HmK0pikQXhJfXMjllNg2bPJpM9VNQTmmdFpx
	JtVxdvSFKQubeBlQQkaF+a8oUIiU0Prb8rf1GC5gR30Tf0vyFzq2+Vu8mAW1l95evYZKWeZbJPo
	cgiHstpqJkazwNAUjdbcAV5hVOHozcBWwMlIXq7JWXbRB/zbA2eS4WGzZkwcP5rL6vohdepq0Bf
	y2uQDrFzmyEEp10Urt3/bFyMOoK1L8WR1jI2z3nBnG8CqLzRf5xTpx4g3ezFXMxajns+6HTARHT
	51H68v788HJFz06Omzcy81moKy1iGjf8Vm2mmVWAkgE3LaLTWRDbYhu+ftcbPIweK73Q8VFMSIc
	uz3PmNpWsdI4/MozvQ9TlCbwPlG5ojbaS78ywYR8/qIDGda8jjSALaBfz+7HU0niDxhW8sMi4Vp
	gHKMkA1K/z4Pk5VVNFSGoaVn9JKfwi22YTlBJ8jtOKtK8RODRLQOUoGWI3jIStIpiWMADoIMNt/
	kCVtB1LC0wtoGBXLF1Xv9KB31dimAI0tL1mnVrWpQY5Jyqz/M1QuadWIk8dUnF2fkFA2szrNktz
	H6VdsNyAQ5eLv5+SAtpohaKu49fvtmXzfg==
X-Received: by 2002:a05:6000:2992:20b0:48c:7f94:8755 with SMTP id ffacd0b85a97d-48e3ed3b79fmr6670550f8f.20.1792991953028;
        Sun, 25 Oct 2026 22:19:13 -0700 (PDT)
Received: from fedora ([131.123.42.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm13667258f8f.4.2026.10.25.22.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:19:12 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: andriy.shevchenko@linux.intel.com,
	linux@weissschuh.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	meatuni001@gmail.com
Subject: [PATCH v8] platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input()
Date: Mon, 26 Oct 2026 10:17:40 +0500
Message-ID: <20261026051740.88791-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The input is copied with kstrdup(), which stops at the first NUL, but
the full write size is passed to hp_enforce_single_line_input(). With
an embedded NUL the helper reads, and can write one byte, past the
copy. Use strnchrnul() so the scan stops at the first NUL, and return
-EINVAL for a NUL or newline before the last byte.

Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.8): writing "A\0"
followed by 4093 bytes of "B" to current_password 100 times returns
-EINVAL every time, without reading into the heap.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v8:
 - Restore the comments dropped in v7 (Andy)

Changes in v7:
 - Use strnchrnul() instead of a separate NUL check (Andy)
 - Drop the trailing comments

Changes in v6:
 - Return -EINVAL on embedded NUL instead of limiting the scan (Ilpo)

Changes in v5:
 - Limit the scan to the string instead of copying the input past its
   first NUL (Ilpo)

v7: https://lore.kernel.org/all/20261024172641.19424-1-meatuni001@gmail.com/
v6: https://lore.kernel.org/all/20261016025352.230535-1-meatuni001@gmail.com/
v5: https://lore.kernel.org/all/20261007134711.473857-1-meatuni001@gmail.com/

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 876fc35d035b..435639e19c59 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -162,11 +162,11 @@ int hp_enforce_single_line_input(char *buf, size_t count)
 {
 	char *p;
 
-	p = memchr(buf, '\n', count);
+	p = strnchrnul(buf, count, '\n');
 
 	if (p == buf + count - 1)
 		*p = '\0'; /* strip trailing newline */
-	else if (p)
+	else if (p < buf + count - 1)
 		return -EINVAL;  /* enforce single line input */
 
 	return 0;

base-commit: 8667bd30fd033295b3038ce374c551d1059538ba
-- 
2.56.0

