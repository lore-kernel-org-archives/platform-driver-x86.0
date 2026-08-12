Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF944334B4
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 11:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533524; cv=none; b=O1tT7QhtnjJJHjGePZKdjKAVlvyCwr74Z9HR4/JhDRhx+UY7E9+6nJhBwvkeT2W0WQQ8+FgCIszQe3gSdSwa6TaYWi3K9S9iVLEUuipWeHQZ/4vRT51uGbADFLixqnea4DAcw8Vlj/sdRYzOtwAi96BQgWqySlPOIXyFoBGVIe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533524; c=relaxed/simple;
	bh=GXnVaGcOYcGeGF51vfhkksxSxm5iT6MduRJD27H8KxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nz2UImnGbVoyIV7E09yj//vWj12OgcvWAkW7tLR43bh+DaOG6t8uuMyWYZUUOm46fU9xnU0P5jJal8Txq50NPKn2h3G9Capu/1XUH8dfTmqH27/nJ/1N/y/SR3rLju2Okt/vyxvEmVeu4jIbdUvqpguuPQEBHg+EcxVwxZuSQm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBLpEhoH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBLpEhoH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f71156e1aso357030f8f.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 04:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533520; x=1787138320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRznYyon0XGUdVgbipyEvsqHsHiyM4eqeCRczfbwZQQ=;
        b=NBLpEhoHisei3vTNn620D1jR8HVSu9eBlNFN5zSLwKEICdz1JIF+tsgwOr9ueDu3c0
         D2rTx7iFOFnWn8HqO4aendeFaiZ3QAX/Gw+lhmrVDHH653d8lpTCTpn2KZwpwoZAaSuj
         MknykyhSrcllnMxRCgzQbYR8EJoDHLB93eBCNe8p7HmfiPeJDll90CHlAoUSwHObS+zM
         BN02A6ffudM+7YKi510eVnBM/2UXM49cQzBZP0WFIGcEw3++xzvIGuYCD0tn4FAj+0of
         tGYFoI8c0yDbqZo7eTohHw++CzZBGEbiRPGzkV1j9rIuLjcK9in+H3hji83bNORDVZVU
         IZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533520; x=1787138320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRznYyon0XGUdVgbipyEvsqHsHiyM4eqeCRczfbwZQQ=;
        b=L9Ra5O52fusf3kg+DxG8SmbDoJIhfHsZ4SJFczRHRziU8SUzm1cjGn7elR4FU6sXws
         eyr+i+VxtUCBe7vLroJEIeSJPyPIGifAQ9Carvof/Bi292VpA4cHNCarU1MUI54A9/d0
         lokJUIh4cN7KW0Qmfb/cR82HxWbhTkszjku+yhOr4z8ov86ib7l8QLQcB+qQ0/1S3Lyu
         cRQlZzPAWpfGcjF0rKA1CLXx8MCrO7tg727tHl69JJ16caDy6MxQhuDxULPm2EwQTMIh
         4erYdAUwGhJS6wcAeYAF7cl8AsocpKRXz2svaEvd7MWLRQ0ossT2q/iENsjBdddrD/df
         BKQQ==
X-Gm-Message-State: AOJu0YyUkPPj+H7o2TJQ31uWLMpwfQ0JbxH/0gouaVFAtEEUcOSDLLqN
	YfK3USh71Ha4GxZ5O0NRL1pR0UHg1DwC+CfDqi26CTwK8FCHqvdu1IqV10ELwIph
X-Gm-Gg: AR+sD12o5y8zpbAOuuqMjjWca/PvD02aZH0t4GBViSXwVULhdAHA2yYMIoSxgE1J3ph
	nDOswBTtFF44gciuG7L6MfL8hv2BmDz/R9hF0LJ51SW8HYWTOYnGU5ouleh0Z4aqh6Cq98rwCSC
	gnOMElbJhwHsLHRr5IHSyNVF0kodu4KbeCSikStFHpWQJPlthL7LgxbO4jE4f5TO4EP60tRyX+6
	Oel1CMYM6hoB6aFj06xCuO+lWKrtXQEvz4p5cQcswZDhhd6JUM7h+Ospf5pn7mVJU3HNsbfo1qG
	VRXSGkq2Pmw224r7ABNft/cUlFaxEqiZb2qw8BVuBkma3Y5zzRmJ5kGs9q6+I45X4XxGjshkyns
	0ijQFKzHvEoOMHHSTdx0KIQhOwxZriCfnHoBUyByWIZqBzw1Ne8pb8Qc893IMFAYKxMBIkjOnKG
	ryTdfzHodwGcQLHolIYND01DCkANbb/IPHQ2LN5oJoPDoRlExULQVbi1V1UmzGWYhYAUV+KYUUD
	BZfVE2LdrT8v6mMLdMpBlw4pE3uOlzAGmTB467Ifw==
X-Received: by 2002:a05:6000:470b:b0:481:5657:5299 with SMTP id ffacd0b85a97d-481565752a7mr2352055f8f.0.1786533519885;
        Wed, 12 Aug 2026 04:18:39 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d702c9sm6670072f8f.34.2026.08.12.04.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:18:39 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 2/9] platform/x86: hp-bioscfg: fix heap OOB read in sk_store and kek_store
Date: Wed, 12 Aug 2026 16:18:22 +0500
Message-ID: <20260812111829.172273-3-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812111829.172273-1-meatuni001@gmail.com>
References: <20260812111829.172273-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sk_store() and kek_store() strip a trailing newline from the sysfs
write before allocating the key buffer:

	length = count;
	if (buf[length - 1] == '\n')
		length--;
	bioscfg_drv.spm_data.signing_key = kmemdup(buf, length, GFP_KERNEL);

but then pass the original "count" (not "length") as the copy size to
hp_wmi_perform_query(), which memcpy()s that many bytes out of the
"length"-sized allocation, reading one byte past it whenever the write
ends in a newline, the normal case for a shell "echo" into sysfs.

KASAN confirms this directly:

  BUG: KASAN: slab-out-of-bounds in hp_wmi_perform_query+0x1e9/0x460 [hp_bioscfg]
  Read of size 28 at addr ffff88813c8e2b80 by task python3/16022
  ...
  sk_store+0xa7/0x240 [hp_bioscfg]
  kernfs_fop_write_iter+0x3e1/0x5d0
  ...
  The buggy address is located 0 bytes inside of
  allocated 27-byte region [ffff88813c8e2b80, ffff88813c8e2b9b)

Reproduced identically for kek_store, and at multiple write sizes
(28, 57, 201 bytes), each time reading exactly one byte past a
kmemdup() allocation one byte smaller than the write.

Fix by passing "length" instead of "count" to hp_wmi_perform_query()
in both functions.

Fixes: b2715aa2e135 ("platform/x86: hp-bioscfg: spmobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index 2b00a14792e9..4d94e48c1a4c 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -238,7 +238,7 @@ static ssize_t sk_store(struct kobject *kobj,
 	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_SK,
 				   HPWMI_SECUREPLATFORM,
 				   (void *)bioscfg_drv.spm_data.signing_key,
-				   count, 0);
+				   length, 0);
 
 	if (!ret) {
 		bioscfg_drv.spm_data.mechanism = SIGNING_KEY;
@@ -274,7 +274,7 @@ static ssize_t kek_store(struct kobject *kobj,
 	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_KEK,
 				   HPWMI_SECUREPLATFORM,
 				   (void *)bioscfg_drv.spm_data.endorsement_key,
-				   count, 0);
+				   length, 0);
 
 	if (!ret) {
 		bioscfg_drv.spm_data.mechanism = ENDORSEMENT_KEY;
-- 
2.55.0

