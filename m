Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9770643552D
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533540; cv=none; b=j/tkInRUNxjCWE6hAC89t5M/yu9hmHv4HijjbQtIdzi8uTCS9K31qwAPbkwwh0XL6SuNJqSKJusRBhTIIdZ74iJMmaSYD0f0CNQI2kCK5jHqOJz2zvYslHe07hFDdmk+ILreqKsZ69jKGw29iK5KCzHK0a/BHhn87LMnLOkps74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533540; c=relaxed/simple;
	bh=ZqVUWs3x1BgozxV3FrsSk7Lzh34dxSnwsmeX8ZrIYuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFaMqHpKbISiCVvbAp8o4u1XMupOnGengTeJowPkunTFwgOkLVowJ2o4CQMV7N86VgcNLG65e2Z7a2Pjtik6g+HCJa+m/c2Q926e3AIQhEB4P1e5/3bcQnTCrS2yqxh4Wv/UEqj7nqwP0e9U1QRyZnWTOfcgIAKJW42/qQ+eI7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PX2VFpLg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PX2VFpLg"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47fde295992so628577f8f.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 04:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533537; x=1787138337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGNNvpeBB2xFe8o+eAG+ITw+sBusoz0y2d8gJ/h4GCc=;
        b=PX2VFpLgt9rPC4lsIJ82yrS9XEqQVu+xI6CLJaQcPVxf/xvPlghy7hZ2Uk1LN2RlOT
         1UmyaM0Xb4bH+QEX1LL9yReaqG6UwD9THwbSFqYhB9VV3ecyUM2j7TH24FBM+ZGhtQc+
         F/Vc1UBZWvM3eAnMKR4/SZAsL9fST5KGYUyJQyaplCODubYJ/q4XiaDiP++KD1BfXqw+
         mIvneW+OkI5wFnkPSV6KpD4v6aICpyV3fLONVU6apzquqQR1n8UVboqjxfn58oJgLtvH
         JtVcVNbiKl5hI6RwcZgn4qTBYLj1s8tbFtxgzr43kZQuT+g6c7i0HKBTh3tI+UvkE9am
         0rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533537; x=1787138337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aGNNvpeBB2xFe8o+eAG+ITw+sBusoz0y2d8gJ/h4GCc=;
        b=oS2g4DI4I+SDhLAWjY975fElLK3AgAMauGwQJUeuKu+8jDmmiUYK26csAGtI/OJ29b
         ldcfVC5nQ4ID1jj4vTGoMt3+wcS7gJXkYQAMV/zXaOX2IZLcG2f2s1ZNX2kIszNQl6dR
         1eXXQekG/VH3ZyHfBgFfwU3tyr9FizxE6C2l3RANrUwEaGH7LkBwrEdXk2/RHXuuZfV0
         uBU/QfqXoKVc6oPc+eRkxvQImE1rf3PuM6sGifuQuA33fmMbQLmEnpbc0b2O5q/Z4DQE
         lvqH/ly0FI0FqHDr02Wwt8FKqg347vPgU84uxxRJ3Gy5fljLnmKaVzX2ZJYhGvgla4WB
         u4tw==
X-Gm-Message-State: AOJu0YxCyCrZtsroT8EJzaWKxGZeL6GFImdyViZhiAblSB0Nhg/S9x82
	vgog+b0SciRn+xRSPT2tkkqdiJTKZK7WI88AzJaZLimOIvebSf9yTpKUMuVlvVLs
X-Gm-Gg: AR+sD10yel3gce1iBMqK3UYR6unijo5TL0QDeOwqPdkfa9EdS4jDbeT7jJvfsXHFMBc
	jo1GRqFztaizXYEtNXP2WuE7UtOH704Kep8UmRMgq0AnpC7u+p485p25XpsP1GlKPkdYy/Sazlh
	+PFVaGHuWgoyunjxvq8o8ALsUpk/g0++fMCyHU7K7Cm99gcvMC6DfFHFrvgR8GlCUXZBuVtc7Po
	4RoTfCGBELUOnami5x0fs31at5ZTQOVUhoAsV+yo17J+ZQ8TdqjmovrJJYBI/fb2fhwRkFB7Ncd
	DtO3ZDBzy2+jcCmH7yZnQjPui4ZMZikQQjEIi2yqazSc8od/ZHt1OR0HaU+vAgBlBl/byZFL1Q2
	chCq3HKIBlMBdiNPG1Zr/z3HyBYMpZjBi2xY6N2lbZRWrnM3LxEZ/CwvKB4dpV1EasktmqRX7pf
	Rc/zW0bu/SE9vEWtot0v7G0xC+gvdJJkJLWlMqj5RN1p+UOg0LXRPT2d3OZRgGMgaLmxptYDgmw
	Btsqyul934QmHwbFJww0JTqIq5FeQxUihiO+0PopA==
X-Received: by 2002:a05:6000:461c:b0:47f:71a0:c060 with SMTP id ffacd0b85a97d-4814febaf04mr11662868f8f.2.1786533536719;
        Wed, 12 Aug 2026 04:18:56 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d702c9sm6670072f8f.34.2026.08.12.04.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:18:56 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 8/9] platform/x86: hp-bioscfg: fix ORD_LIST_ELEMENTS never being parsed
Date: Wed, 12 Aug 2026 16:18:28 +0500
Message-ID: <20260812111829.172273-9-meatuni001@gmail.com>
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

The ACPI_TYPE_STRING case explicitly skips the string conversion for
elem == ORD_LIST_ELEMENTS:

	if (elem != PREREQUISITES && elem != ORD_LIST_ELEMENTS) {
		ret = hp_convert_hexstr_to_str(..., &str_value, &value_len);
		if (ret)
			continue;
	}

so by the time the ORD_LIST_ELEMENTS case in the eloc switch runs,
str_value is NULL (it was freed and reset to NULL at the end of the
previous iteration). That case then does:

	ret = hp_convert_hexstr_to_str(str_value, value_len, &tmpstr, &tmp_len);

hp_convert_hexstr_to_str() rejects a NULL input with -EINVAL, which
sends this function to exit_list, and exit_list unconditionally
returns 0. The net effect is that any ordered-list attribute with
elements present silently ends up with an empty elements list, with no
error surfaced anywhere.

Fix by converting the current element directly, order_obj[elem], the
same way the PREREQUISITES case already handles its own array
elements, instead of reusing the unrelated str_value/value_len left
over from earlier processing.

Fixes: 4b2672ec71a3 ("platform/x86: hp-bioscfg: order-list-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
index f09489a085c8..704c69c18146 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
@@ -261,7 +261,9 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
 			 * Ordered list data is stored in hex and comma separated format
 			 * Convert the data and split it to show each element
 			 */
-			ret = hp_convert_hexstr_to_str(str_value, value_len, &tmpstr, &tmp_len);
+			ret = hp_convert_hexstr_to_str(order_obj[elem].string.pointer,
+						       order_obj[elem].string.length,
+						       &tmpstr, &tmp_len);
 			if (ret)
 				goto exit_list;
 
-- 
2.55.0

