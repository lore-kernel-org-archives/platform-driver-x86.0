Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E50643BDC1
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533543; cv=none; b=UkEe9mbfkFEhdcOn/xNzUS/Et1dBIuaqDhvm3h/sk0M0MKNRKnBjOvadhZhT4kJN+0S49mBKaYDRiGM2RO6joCUAQsgc8acmxDIzH0dGqzfc2tIYU15uh/iXmAhrjzPJFpRgmIGe6hlz8gES0lcTjKjZ3yU6vYhfTh0IDrE2KJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533543; c=relaxed/simple;
	bh=jIs7SBmbrIzpQPWUe7SIDuER+UB8eqmz6Q8ZK68R+M0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YmkXV1SFfNwJNugNWaevVjHeBHNtg87v3N5YzAm2o9O66fRzPmmsokHoCsrd2afnu99QzOa+fq00MdZant/6/+xbOQkOZENKeE0o1XjEQxXh8xTGLamgSYzJX5rehmig6BOEsYULUKbRfpkUhyDU+kOrPsSjO6VL10Y8Hhz2bCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxQN42Le; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxQN42Le"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4957eefd361so6070785e9.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 04:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533539; x=1787138339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vM2gdPuCkyOEMq/7xYv9p7Pxqs4FlFaCZ91sPS1S74s=;
        b=GxQN42Le9+jE4vuEAj9Fc0uiESfs4mmBaDbPbbUgzhV59YjjLCbxQp912dLeFtO3Dk
         4pfHu2qX4BXioPnFsqSOg9Id8EopLagEreYJ4/JN/jawQ/JjymfmBD+yOuayPz4eT5Lv
         USMxugUlpU46PaLbHJiNikOunvWkGXVOUrOOtjOSVj3cVi7Lx+G8lnKjnkpWNpnyltrb
         ZaS7y/DtXUn9BSLwQnwsdH56CFLOHAT9lW4PMTzIQM7GvPZ41jhALhAsGzcQRyjtm7Bm
         r3+iS88q4JiHAO2HA54TWu3WKXCnBZ06hW3exht9BALgoRzbzoZkmYlwm1wOPGGfxQWy
         nuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533539; x=1787138339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vM2gdPuCkyOEMq/7xYv9p7Pxqs4FlFaCZ91sPS1S74s=;
        b=EulIE/UvpOitSMhRJTHGyncl35PMCd9nHD54uQ1zGCttGMJTlAAZnJTHpuxhyftRu+
         Y8Fdi7Au6zJUWgGX18GCD4OvYMgk2Sb30EEagKSun45NpCx2+okuQd1HmFGmiSyv192R
         tqJ1PEuLYC9bSniyk4EQCkE0vwVFUuIiauINss+WI9vBX0FdLQkJkg1xSQhJEGtQ6EEh
         f6dO7HTx0z3B0Q0uhRzwnfs+ofTbrv/xzIGnDtESHqfC1/jijDd8AyG/Z3jSxbRVKTzu
         6VHQ2y/SHgMFXM37OtZjfidnutQyvd6SylWLlbOQ+CpXzXXKR0vcP2aTjEdfCzmtOAoZ
         hJsQ==
X-Gm-Message-State: AOJu0Yxu7vJI3pSXgL3N+efEfUoebgKY6V6G6Mk55z7J/LUkAJYyMaaO
	Al6h2iKfU0jg55gzSyMOLLCG3Y9VJJNQByf7YbctSAskuSz1T/cVidzwpVGdMFpg
X-Gm-Gg: AR+sD13a16rFamkxEKY3DNYN9u2lkAUq5Z5M7Fxl+OpBN0KWIldogNU3jh5zNG/nUSH
	Q8+3peeqDTvCzOhnSjF58cwihkwM3ogJIF4LTlXAF9+jGszQyroRW90XZ4ed6mugyO4a/PAtekC
	7GtItlfzQURirccuLxez8ulHzMc3rtSZT9rOofscg0nKK4yT/P2l8/Hh5olSK5teFJ06aP0LpXd
	T1BM6xoZoTToU0gTeic6uRes5hlCsV3qbxAKAE2a+g2sq4gci64M+T9mDt+eMCYnXiV3Ylsbb1p
	W2pHvVydO+lXLW/qOOlqpUnVUoqsA+jf+Ubvhpn+1X3ovjO/IxpnNfUivwD0O+8Qd74xZFV8Dfb
	HEBiQLw3DkDzVD3UKB2gr/azeqb8wj2fqE32vt7g90M17r4ormP2RaOeOvl1ZxZm8o6NuC18cEr
	iQnDRHN36Wd2kiJXhQEU3ctbz6mZdoKahOwNZYUFb9Y6o/Iycr60mPIeRGvfA+KO4fgC1B3cw59
	cqng6robQdVi1DWbHoXdVbSbpsbQskjWy3LY4NTCQ==
X-Received: by 2002:a05:600c:468f:b0:499:4892:e84e with SMTP id 5b1f17b1804b1-4997c14569amr44988515e9.11.1786533539249;
        Wed, 12 Aug 2026 04:18:59 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d702c9sm6670072f8f.34.2026.08.12.04.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:18:58 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 9/9] platform/x86: hp-bioscfg: advance elem past consumed array elements
Date: Wed, 12 Aug 2026 16:18:29 +0500
Message-ID: <20260812111829.172273-10-meatuni001@gmail.com>
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

The outer parsing loop in each attribute-type parser advances "elem"
(the index into the ACPI package element array) by exactly one per
iteration, but cases that consume multi-element arrays
(PREREQUISITES, ENUM_POSSIBLE_VALUES, PSWD_ENCODINGS) read "size"
consecutive elements without adjusting "elem" for the extra entries
consumed beyond the first. The next outer iteration then re-reads a
leftover element from the array just consumed instead of the next
real property, and the type check fails on that stale element,
aborting the parse with -EIO.

This produces exactly the failure visible in dmesg on the test
hardware, on every boot:

  Error expected type 2 for elem 13, but got type 1 instead
  hp_bioscfg: Returned error 0x3, "Invalid command value/Feature not
  supported"

Fix by advancing "elem" by (size - 1) after each array-consuming
loop, so the outer loop's own "elem++" lands on the correct next
element. "eloc" is intentionally left alone: it indexes the logical
property schema, not the physical element array, and each array case
is still exactly one logical property regardless of how many physical
elements it spans.

The defect is identical across all five attribute-type parsers
(enum, integer, string, ordered-list, password), which were
copy-pasted from the same template when the driver was introduced.

Fixes: 6b2770bfd6f9 ("platform/x86: hp-bioscfg: enum-attributes")
Fixes: 6f2c06d5a467 ("platform/x86: hp-bioscfg: int-attributes")
Fixes: e6c7b3e15559 ("platform/x86: hp-bioscfg: string-attributes")
Fixes: 4b2672ec71a3 ("platform/x86: hp-bioscfg: order-list-attributes")
Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c       | 4 ++++
 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c        | 2 ++
 drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c | 2 ++
 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c  | 4 ++++
 drivers/platform/x86/hp/hp-bioscfg/string-attributes.c     | 2 ++
 5 files changed, 14 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
index af4d1920d488..43beb639051e 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
@@ -227,6 +227,8 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 				kfree(str_value);
 				str_value = NULL;
 			}
+			if (size)
+				elem += size - 1;
 			break;
 
 		case SECURITY_LEVEL:
@@ -280,6 +282,8 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 				kfree(str_value);
 				str_value = NULL;
 			}
+			if (size)
+				elem += (size < MAX_VALUES_SIZE ? size : MAX_VALUES_SIZE) - 1;
 			break;
 		default:
 			pr_warn("Invalid element: %d found in Enumeration attribute or data may be malformed\n", elem);
diff --git a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
index d96e160953e3..5373af71549a 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
@@ -243,6 +243,8 @@ static int hp_populate_integer_elements_from_package(union acpi_object *integer_
 				kfree(str_value);
 				str_value = NULL;
 			}
+			if (size)
+				elem += size - 1;
 			break;
 
 		case SECURITY_LEVEL:
diff --git a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
index 704c69c18146..6696255738ba 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
@@ -232,6 +232,8 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
 				kfree(str_value);
 				str_value = NULL;
 			}
+			if (size)
+				elem += size - 1;
 			break;
 
 		case SECURITY_LEVEL:
diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 6bd56d3f5bd0..9b989ef756ea 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -321,6 +321,8 @@ static int hp_populate_password_elements_from_package(union acpi_object *passwor
 				str_value = NULL;
 
 			}
+			if (size)
+				elem += size - 1;
 			break;
 		case SECURITY_LEVEL:
 			password_data->common.security_level = int_value;
@@ -367,6 +369,8 @@ static int hp_populate_password_elements_from_package(union acpi_object *passwor
 				str_value = NULL;
 
 			}
+			if (size)
+				elem += size - 1;
 			break;
 		case PSWD_IS_SET:
 			password_data->is_enabled = int_value;
diff --git a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
index fe5a9a3a4ef1..5abec8995911 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
@@ -233,6 +233,8 @@ static int hp_populate_string_elements_from_package(union acpi_object *string_ob
 				kfree(str_value);
 				str_value = NULL;
 			}
+			if (size)
+				elem += size - 1;
 			break;
 
 		case SECURITY_LEVEL:
-- 
2.55.0

