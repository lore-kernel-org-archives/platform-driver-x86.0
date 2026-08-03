Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A50B4137BA
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 14:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767514; cv=none; b=cCYVExzAib976tnoAZ82DCSm1RrWyHLzvncQ/gVq2g8wCfLnIqPIOjF7ejYZtCKmMuEAHcwm1TUe3Dw8be5XwBG+LeTiUZRJt//RrDyES/95YGdVtJjv/23TpKfaySxkxxvwmocn5wnB3ZA7EW50BOk1+4y8oPvYxIjQvaOLWBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767514; c=relaxed/simple;
	bh=mbTl1m4q/B0mmfJqUSHx3puQD1k3DIBxLZfuWKkL4MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LLyeFPIkxjWjudbgB6Q84HCqYonkmRZvAnwmjx7EEqB5Lwy74OryulAbzJ4JY2d7jgOCRaqofbYdLvskPHaRaOeo8ZWpF4ss5WlFiXerJIxLcJPA6/DiSUedx3id301mEfzyDfAyP/D0nf8rb0J1JPVvRZEFLnNKjNLzR2UmWpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdjfZmRm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdjfZmRm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so11959315e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 07:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767511; x=1786372311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNxBi0gHfRrbC33pAvz30lhxp0rXTHoZRpmh1XXR2eM=;
        b=RdjfZmRmmBhZ9tsnpwBd6w8YUwgsN8ToL5Q9opJKUCBxXA14Hu6m+UtOzkiE7Tv2zn
         v/PyYdmFxQJMc9W2vwaNc91DVbscaQvpELa7M4aPxKINXZJ3R1FPxEE1dGn9HQ3aiPRk
         OQ4xR2R/R8KT5bOMRhM4ssv9nRFMfOSUyi4G60PEV61GtgBpqqKL2NvKjue04J6AEkJP
         JBON4dO2S3RLTKGNwH4b2Xt96drEk7UTEQ0hIoLZ/iyv8Co+D3uxMWczHUAaqVFuKlif
         eMxmXSDK4lsd891EcsfeQM7M/B1DkO55raFvX4c78fiz+A17iZ05dhpafsbMMCg7EixZ
         9pDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767511; x=1786372311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNxBi0gHfRrbC33pAvz30lhxp0rXTHoZRpmh1XXR2eM=;
        b=KmnTJbFDAY8OOyWufw6KTusExUaMXqVEOqWMtzdhOFEBGy7iBQpVnWerHQJ5UI8iGl
         4pCzKixNMBuP0AGPPAT2JtJOTaHDhIFcWxFwPkViMUyhSEXlFN2St99libCQbHEwsFKm
         pI9BRl8P7BuGKkOLeS7Ep5F5j7u5UFXPdz7JibZSKhYBZTOfQd5TjY0AjRipDQHByRBP
         0WE1SrrSLg4TDVujeIVyBrVf/uyUPQ/GmfH2O6S040Ee4lvLYPADihsJtOK4uStWIMmQ
         dakwcxA6pLnI895RO4DoH27rORkoeWgIzqrksTLojxTirmCCyGIQNgDQQCtTSsl4WbML
         xomA==
X-Gm-Message-State: AOJu0YylE8yQVTPLJ2Zb0ZyoWRZRggFrtULx+Kb0U5Cyh9PCobF2I2VR
	wT8/CMSZ1n4D6GYtSphBdc3kbmj2G0RMIq62G/bxj5h2FfHuamDi0alk7oKaaDNsA1U=
X-Gm-Gg: AR+sD12ImiWQKpEaVG2Yhznyz6h5NydSMatZr3Ivdp4ksaS3bPSeX/6JeWKGjIv90AI
	kZRzHQDYiv/OV8sHEELFtuVtIUhzu5Rdpb4JXZ4A63MxpA7MZdg8rTXRADpAQPcqBWFB5nQdT+K
	Im7LmfsOFgPd00upDIHh1T0aUL+8GEmXwy2NDq019y3DVNii8MD0/pj13sJKmu0VZ9wDLYItDyP
	B4wNjs3RZ8M4ZNXRPPGNWD/y8kqO+E8jSWuT79yMUnS7UGZrXGotIuC3SSGZCRxC5HG1DGDJUIW
	EklkMOJoPaidwZQ21c+/hu/jD6i4sgXOq/4+FsWlFKDjzTsTRCIHWBUJQf467DKHIZZwUlbwFH+
	6RdnnHIcvyH898V8SVCt4luKR89zGal2HmmqjQj0SA21NDtZGnXzgU/m2pVH+iDQ9pJdutMJgPh
	//NhXY16tCDTHJq47zE3yB85qGkZPgOAvnqA9piznIoWQqQU76m1dWYSBOpFgNq+Ikc1gbFWG30
	M+KiK3x7ZaLqb7xJI+suPt+tLe0ef2R8EsRwR4D+h1kIdBOJcNq
X-Received: by 2002:a05:600c:1d1a:b0:499:49c6:bfb7 with SMTP id 5b1f17b1804b1-49949c6bfd8mr2265555e9.7.1785767482896;
        Mon, 03 Aug 2026 07:31:22 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b98284sm236575295e9.12.2026.08.03.07.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:31:22 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	meatuni001@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 11/13] platform/x86: hp-bioscfg: advance elem past consumed array elements in string-attributes
Date: Mon,  3 Aug 2026 19:30:34 +0500
Message-ID: <20260803143037.93105-12-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803143037.93105-1-meatuni001@gmail.com>
References: <20260803143037.93105-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same defect as the companion fix to enum-attributes.c in this series:
the PREREQUISITES case consumes "size" consecutive ACPI package
elements via elem + reqs, but the outer loop only advances "elem" by
one per iteration, causing the next iteration to misread a leftover
prerequisite entry as the next property and abort the parse with
-EIO on the resulting type mismatch.

Fix by advancing "elem" by (size - 1) after the loop.

Fixes: e6c7b3e15559 ("platform/x86: hp-bioscfg: string-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/string-attributes.c | 2 ++
 1 file changed, 2 insertions(+)

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

