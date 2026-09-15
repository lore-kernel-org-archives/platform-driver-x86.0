Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F4A406834
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 17:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494393; cv=none; b=hGpYjzif3i2y2i5g20QLfF6mBxUt48sxotnN7gl6n11gmX/CNaSrM23sqVOLpmNaqodRSPCD627ShiGd1d47RtXLG6vOrzbD1u+Cx6wDYnZDAnR8cuUe/zNNwJp82PLM/Ki0F9Aygzhj4Dg57KWwivKi0dTz7VpB8NvQtiMRTSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494393; c=relaxed/simple;
	bh=WlQBNU+LBHOTy12vRSd1ePrcpVEBbXkmEd6JKJ3g0u0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EiDShrmbNt+0f4AiqHrWNVSqPXtdiKw+BHRR4xiphC10BV33AHj8I9HLxTeSwNo8l+lgBbnYXwyS8OtmeEjwhXOSyQzXI2TFVEkX/qTbiOWQcaXDNXf61v6OPv4mnJM9E6Vg1tuQL1rYGheH29p72xT2cqSlWCuWcLeOjGeTNP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCDBC/8O; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCDBC/8O"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so493245e9.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 10:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789494389; x=1790099189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kHhQGy3vIUJSO4i7ji0MZ5Fg5auge9rgj23eZwGEys=;
        b=NCDBC/8OzeEsXDsKqGiYKWY0M67SdVEOP+jHaM+EbBm4wpV5Uh0p31rg3UE/NJMnpJ
         pRIETjBmOdgrRnE4YwBvc2JcenbXic6PPLBF9HWhg5x8eIlRYxEFXUyj/3CBvQ/Jr0n4
         cMPWrrFBfHFDOCDLh2b+fx1E1FmcEh15YzTLuTwFitosgm5dspjAm9wD4dM9pbt2hRBq
         f2bZ4yeRK/ZQZf5re6AJX3+pcU4btcfnLf6Rt0zxy5jVWfMoiwOR07fwPhtScDxdnA4r
         eDITvnakX74wbLOcoT3AEqGJzsA5GHqMqkzltG7meBoE7DWdE66Gsjf1wCDN+YUiOMjM
         hdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494389; x=1790099189;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4kHhQGy3vIUJSO4i7ji0MZ5Fg5auge9rgj23eZwGEys=;
        b=G5Klhj99HBrQS4CLq3tHYwWwNgT7SToJruA017Yv15+g3jD/a8qKWTh/bawAtwT37Q
         kMb8F3h/ef85/WGOrzWDUII7weW2Aj3Wjq5zdn/UrZcPdYrdNU9HymJeUP09GghO+nfh
         +qjZZxAykr0f3Feg7s5aH6JfVpdEMTWz9HLSZzgVnIZP54sLsLdiFnSToDYeEQjktxAs
         YhL/XAO5DweTLFwbqt8Dz7MBs/JTK2FBlMXv5wMmuffxXfXFOPDh7czRJN0FBYI8uJp/
         qVeeMnM0LyNm+I/yt81aiWkzoiSOZXmbw+dUE6qzhedEfAjC3Fny0p5V7l856m+24EVF
         aNpg==
X-Forwarded-Encrypted: i=1; AKwUvBx5xizmR+8LnUvhr0thpK7Qxnqt7KJswSThDo4hAAPY/CuvpmKQ1RYT+2+SUN+4Q8vBQcoT68BrA/45Qbsz9+lUF3oI@vger.kernel.org
X-Gm-Message-State: AFuF++kZN6TckyFzALCq2kQjDZn/grFupwjuBIvS/NLhjf/6cvS3PCqq
	Cz8YCstsd8XiuBzLs8mQbxzhPQNItQ6hsmpT3yyiocPpA3wNXcVyhHbM
X-Gm-Gg: AYBFou1cMyIdOShbik7LTO8V0PbCXaz2wrrXSM4Vb7Z2NUB7VDrYY3A4ldKua/LY868
	rbsPDCjY8eYMADXfhmWMmwJABKvdD1oFRoTQY672rSjqBK2uayhaXVFKJJEvD0rZJMLev75isOB
	wFAvHuZTkWj7bYl+473W2whtBNtyqQHUnBGqU26uDuv8khiBEwMO0fzbZDdlzuDKi6wlxd2RWjy
	e6ZZ7lUZjh02NVjLl9h7fP2Q2B0T/YcBAnRTn18Z+5+I8T7tcNHbhJf04ll8MreZxSt6sK4KARI
	Mm7puWUbuk6/TR01239hFdjdAcJsKM/NsvFm5ThLVOMwRFIH+eHY77tokbsiTPxPFyUhke94siy
	IG/ORTjh9wYCAQjRVckRlC7+nMek0lqKs0ERRKGAiukr3Hgy2mNGuaYJn5xGv3QDiOEjajN8ejt
	ulp040mpsYMVZNmZ5CqCeHDFBVj27R5inSvxJWVJou+DzoC9m2GFA2vjhPgBwYK67EnztC7c4ha
	SSYEqsEVZmd9xSSEvj0kYBqnqpxaSuSa9ZvnUS/Pnq6qDOtxCab
X-Received: by 2002:a05:600c:860b:b0:49c:fea1:f792 with SMTP id 5b1f17b1804b1-49e7a64889amr101393015e9.12.1789494389380;
        Tue, 15 Sep 2026 10:46:29 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83fc3da0sm3415955e9.1.2026.09.15.10.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:46:28 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] platform/x86: hp-bioscfg: fix slab-out-of-bounds write in hp_convert_hexstr_to_str
Date: Tue, 15 Sep 2026 22:46:15 +0500
Message-ID: <20260915174615.63924-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hp_convert_hexstr_to_str() decodes an ACPI string made up of
space-separated ASCII hex-byte tokens of the form "0xHH". For
example, the four-byte input "0x41" decodes to the single
character 'A', and the nine-byte input "0x09 0x41" decodes to
"\tA": each token is read in a five-byte step (four characters for
the token, one for the trailing delimiter), and produces one output
byte, or two if that byte is '\\', '\r', '\n', or '\t', which are
written back out as a backslash followed by the matching letter.

The output buffer is sized with kmalloc(input_len, GFP_KERNEL), the
raw encoded length of the input, not the decoded length. For
well-formed input this is generous, since five input bytes never
decode to more than two output bytes. But input_len comes directly
from the ACPI string length reported by firmware and isn't
guaranteed to respect the five-byte encoding, so a short input_len
can undersize the allocation. With input_len == 1, only one byte is
allocated, yet decoding still produces at least one output byte
plus the NUL terminator written unconditionally afterwards, so two
bytes are needed. That terminator write then lands one byte past
the end of the allocation.

KASAN caught exactly this during BIOS attribute enumeration on
boot, triggered by a one-byte encoded input value:

BUG: KASAN: slab-out-of-bounds in hp_convert_hexstr_to_str+0x6d8/0x710 [hp_bioscfg]
Write of size 1 at addr ffff8881032e5d81 by task (udev-worker)/520
The buggy address is located 0 bytes to the right of
allocated 1-byte region [ffff8881032e5d80, ffff8881032e5d81)

Size the allocation to the worst-case decoded length instead of the
raw input length: two output bytes for every five-byte input chunk
(DIV_ROUND_UP(input_len, 5)), plus one byte for the terminator.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
v2: Expand the commit message to spell out the hex-token input
    format and decoded output with a worked example, and explain
    exactly how a short input_len undersizes the allocation, per
    Ilpo Järvinen's review. No code change from v1.

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 22c198680903..42331cf90581 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -442,7 +442,7 @@ int hp_convert_hexstr_to_str(const char *input, u32 input_len, char **str, int *
 	*len = 0;
 	*str = NULL;
 
-	new_str = kmalloc(input_len, GFP_KERNEL);
+	new_str = kmalloc(2 * DIV_ROUND_UP(input_len, 5) + 1, GFP_KERNEL);
 	if (!new_str)
 		return -ENOMEM;
 
-- 
2.55.0

