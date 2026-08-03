Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78EA41BA7A
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767484; cv=none; b=OcsCtqD8pircNY+kLcne7ywUN5dEBzzxU8Qhjtywwunm4etJ5o0PjjhKwpXKVUR6LnZ2wVvxGdMSzciJvEmuTriDYCHc8hYgQfnxcLDRIz84HOPxXzZ1OW1N0B4g+6XuT7e+6xsnnRk/IUZUMaflRaQ6+s+Ba3m+qFO6o4gvFqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767484; c=relaxed/simple;
	bh=mT7/d7xo3H3nfPCihbxPgzMZLfcDW4NzWBe1wQtzgNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hWgDb2ymLfpQARuggPUsecDO1nAkdxjhFFPCLFuka6lC2I9znhy3gpwjLyKfovvxiXkarJYaJ5BQPEEzyXA5nxLdlFDCG1TDz/RBjyVUiRfYWiYo0GBU8SiUOuySd9pmq+inpKnuzU7xHD+fYb6pjZldhGO+3LjWsMgrdL900gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANrB3e/9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANrB3e/9"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495437bb891so18187645e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 07:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767480; x=1786372280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndb/ZrZ5742Zc7Zv5as8TFdneRJ3/39sqxXLaYsiR40=;
        b=ANrB3e/9knuho2yGnbBS9IRfJMdYTHIUw3cmM1zHbIQh6Y7sE7h9bGXTPABRw+97Gw
         LLyLGNzYMC246eakAqUaNm16ZG1IbalAUQw/BNsNHgZMu0y4gUvrW7fYc25nr9fgXHdP
         7ItN070XYaOOQJy7Bjb+AkajxFq5HVeOG1F3uCyC1Zh2mgtIJlN6b8mCjp+KTPnBizZK
         54/pUPEnpsa8ZSSpNhRNTkMlm7jWDXLmfPame+pA7QK8MXvO13vJVNljUSIaCBxf0CSq
         IchSsLaUN87Zr9tEixt3G+qLOxFKPCOfeWRbbB13YBjjqD01CDwtX/ZT7owFmd9RVziA
         kaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767480; x=1786372280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ndb/ZrZ5742Zc7Zv5as8TFdneRJ3/39sqxXLaYsiR40=;
        b=ayAVAkSXdYVHR3Uz9283EZphxh9/dZyqSYl5a/MsZLfCtz0XKQY6B4+I/nEMBy2UhO
         c5F2IfFGKcJfICbwAUlQSxW2W2QgJ+KuYR+hKzOw2GpVmvo/Xa3iUwHNdjIY5QCuBppe
         ekeFRNBMLZzygTecf/Yp1kM6EmfPOCb0TI5HCugHX8vew+eQVXxFMEgqHzjfd8LF19wD
         Z9RpOxFJe7eg8UvqKVWgDQR4dEPQPwnuOMpL+idgatn+CGJOKG4lq+R07dxXCHt4BDXM
         NsGab4kSg/BqcQur2YVqpZ/M9aYM4ZK1YtGjbVUd0STYSdbFsYb6STMO3zMKRIqdpShA
         ePCQ==
X-Gm-Message-State: AOJu0Yx7DpFNXIzZ4HtBsikEGBcnDz9svH7sdUF+z2+Z+Xj8L7pzo3GS
	XRaTRESn/GTRWlEDrWAJ8izL+SDo1mn09Fo/u03MV/jFYvQxRIDwmcq+0nH9+sQ3pcs=
X-Gm-Gg: AR+sD12wEzkQTXs5RnqO4nqetpMzkvzsfmf+pmMUTEbxcqC9Dw7soKGm0IpQVr08T6F
	SSPpmchkF9iCoULAZoUGRly4XE38f3TF292WMCeI+jq/Qa+qcgePuwS5W6x6mylQWC+mIbsygPH
	RPDR98gTx+RNbi/q+WkGVjSu6jn/U2iNY9qR8f4EUMwIt2fpUi1YIoU2CgWIF/PACts0+CZqoit
	HLjLz+bWKqilrYhV/vZMZ7KCZtISsLgOj8Lplayqx8OxRQ6+X297WWv2aInWjfp41UsAlUzcAbc
	S7qQYFltnizGbFoYekASgnS2YVK2ng1EWjBSwk/WNjJKJ5Z27AqbMaO1/iKYnRFvgAtqkBs/iuM
	Qvg7AppOzlOuHTEroHjBRugbqCgT7S1qR1yPlMWOsOOTcBgoT+7EHrTdMkAo4RJxxjJqMr9lE+q
	/9IjZ+dyS9HMwG0VVSCbZGiRKh1pFIuT6JIanN4fArtRoWYhVvopnci4DPJiwy8yQFTn9B+ou1O
	dVMwkKR6poAImPJizmS9z6WLGDWr6SVBzjclq4MUA==
X-Received: by 2002:a05:600c:a42:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-4980eba0a6fmr208709925e9.8.1785767479778;
        Mon, 03 Aug 2026 07:31:19 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b98284sm236575295e9.12.2026.08.03.07.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:31:19 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	meatuni001@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 10/13] platform/x86: hp-bioscfg: advance elem past consumed array elements in int-attributes
Date: Mon,  3 Aug 2026 19:30:33 +0500
Message-ID: <20260803143037.93105-11-meatuni001@gmail.com>
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

Fixes: 6f2c06d5a467 ("platform/x86: hp-bioscfg: int-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
2.55.0

