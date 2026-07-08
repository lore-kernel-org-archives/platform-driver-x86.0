Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7F441CB45
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jul 2026 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525745; cv=none; b=rsXb5m77Bjhq7DwzkP71l3ssBl87zL5XwpAvt+rw86dXKQvzAjR38OJ9IwUkn6n8ZATtvf9NFGrRD7Spwo9XrR7OYMyrA9lJNZLCcNvDktQtERrvc4AVFDdNDupKy4CZNpubNoGTvnv2weoKovARX6dR3x9wZK7/KC0i3KNcbhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525745; c=relaxed/simple;
	bh=+fb2hm/AV+gpBOcwwKZ0VASVGKm3XP6ZLpjp9sYFqfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L1xrvqdk1g2KMKasvZNbKNTcsxPgbIm7OnWygjp+WVY3nQQt3fxZQc0x3xNvtodMxhj3bHCUrVVT+c2w2YfWvtgQHv6s49eh4uwj+t9u0NWRIGSSUjxvKoEHHuF331+eWFnXpweMYkebKr+erqBCgdSZ8g+KuNus1OFpfBArV5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCVFg0vE; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCVFg0vE"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1276f8414bso101724166b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jul 2026 08:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783525742; x=1784130542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWjcO3quzBLPCQpyEkYQryJlDPpxypgV7KUttYaLljc=;
        b=tCVFg0vE8SjqeX73phKxLJdwORjAjBov0SFnBJxL5VAlKDnjn+qfjAmxSwpBUBTEtS
         xZ9vySE7EDsJzTcWUoU5gZnLxmLg0lj/ss3zj9JaI5lAV7nhV1dRIEbHwRTqQz6xn3TY
         bItr2zHbVWrrvJ4s4YUumBY2XYQsx4f+HREw316kAL/uVAZbdRqiIgAjHaJEAieu6mZg
         HQA6Nt7oM6GKeaJI+g+iNw5WDoln3643MTkQ/N9qs5GzSaz6wuUine6180jR4Zh4n1r3
         35gkjlaiRCRuYjq21IIsstw0RLZsAdX6IcZu9dA+oabNn8jyNnefHmzbwLvjtJMtl26K
         J+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525742; x=1784130542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWjcO3quzBLPCQpyEkYQryJlDPpxypgV7KUttYaLljc=;
        b=RU5C6ZiYFWPwNLaZaD5zmd9gf9nmFm0c8UemsFnUWI1gJBBaje6HSY2E8cLMWwl4jp
         kopCR23i1OW1TySJALxLZzcEaVLX9gU8Azo8FWqWuYrYQ8z1DQVEq4A8loUS+NTZ4/vj
         gMwzCDpc8uD2UZEVyLX5d/KZum7ljEexjuKejdG9AlhReoqJQRYyx6szsVP5iemtt2Gg
         GEZVWj/uDCheRn4swb4yPqbDRB6hOSB51lL7cFvLz+kwHddVxMa0erelNds2rS3Hp84n
         JdA+VIyzCTm0UbH26rjujoyCMtYFo0gO+yl/b9kkuvGCfKo2oV+gn87imIjHGbyd/TIf
         Azug==
X-Forwarded-Encrypted: i=1; AHgh+RpWfFrziU/qKy/V9Zqb/rexyisbu3U+g0AuyGInyUsBFGchtNYrpW8wyz+xx4/a95et7bRfaz2Na6KHTCRkYTrTXOGZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxKYnBh5JuVJcU/aIuBWuUs3q0xGeEXXC1zAvy4Yk5AfYTTqXPW
	TRFiEbqYUgs2+OxL4MlJ9nqrJfWaCaFEKdda7rBjT4XmmpSwP9jc0GL+
X-Gm-Gg: AfdE7cmsjXxUi7XdF/QYEFA3iHkaFr/Gi1pkO/rW3mskVfd1jXrzcsfBAGkEvEYt41f
	t3Y4rg1Eftk4cVNqp5CV4RqMtiejUaIH3GhjAV04JcbhLnqK0bz1A+QicLX2I1i+GDdbRqaZKS2
	twJ4dpMWxoeCb5/JtOr7NKPJExxbqyrZIBoc76nP5YDw6vsXZDuM9QwWgjy7tafOGLq6X3GcfGI
	1VubIWCzCO0BF9NF3MKjZW2UQ99jvr7btReWGNq8JUdNvsj8e2TBxHb1r4siBpCiEeXUrChbyhQ
	7IZ1LkCnbFMLd9DqMvakmWs28GcVz2rVwwLtCbRFo8wucT3motllS5At2nHXhgju5AF9OOfP/AM
	l07t2i+ytb/5K3igVDCLKHVVdRhgDxb/rsBkMqd5CF5jkxJW7e3/g9YGOyEC6Ued9qp9VsWHGJU
	mt5TCgYoCxtZC4vQ7Qa4/WwnoCtQ9f3Kdc/GIT9Av3vtcj6MvjeSZ2laTADuR4B/Y=
X-Received: by 2002:a17:906:6a0f:b0:bec:fa92:d36c with SMTP id a640c23a62f3a-c15ce1884e6mr147647666b.38.1783525742031;
        Wed, 08 Jul 2026 08:49:02 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69ac41d7ceesm945125a12.23.2026.07.08.08.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:49:01 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	jorge.lopez2@hp.com,
	linux@weissschuh.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v4 4/4] platform/x86: hp-bioscfg: warn on element type mismatch instead of failing
Date: Wed,  8 Jul 2026 20:48:45 +0500
Message-ID: <20260708154846.12356-5-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708154846.12356-1-meatuni001@gmail.com>
References: <20260708154846.12356-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_populate_enumeration_elements_from_package() returns -EIO and aborts
enumeration of the entire attribute when any single element has an
unexpected ACPI type. This is observed on HP EliteBook 840 G2 when the
BIOS returns malformed ACPI data following a failed WMI query:

  ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Index (0x000000032)
    is beyond end of object (length 0x32)
  ACPI Error: Aborting method \_SB.WMID.WQBE due to previous error
  Error expected type 2 for elem 13, but got type 1 instead
  hp_bioscfg: Returned error 0x3,
    "Invalid command value/Feature not supported"

Aborting immediately discards the attribute entirely.

Warn about the unexpected element type, free the temporary string, skip
the offending element, and continue parsing the remaining package
instead of failing the whole attribute.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
index 3aa2c440e0528..b834303e5bc79 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
@@ -163,10 +163,11 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 
 		/* Check that both expected and read object type match */
 		if (expected_enum_types[eloc] != enum_obj[elem].type) {
-			pr_err("Error expected type %d for elem %d, but got type %d instead\n",
-			       expected_enum_types[eloc], elem, enum_obj[elem].type);
+			pr_warn("Unexpected element type at elem %d: expected %d, got %d, skipping\n",
+				elem, expected_enum_types[eloc], enum_obj[elem].type);
 			kfree(str_value);
-			return -EIO;
+			str_value = NULL;
+			continue;
 		}
 
 		/* Assign appropriate element value to corresponding field */
-- 
2.55.0

