Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF4651FCA5
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 18:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793110; cv=none; b=Q6PHT6NmQu15pjRnXg3WbH26rCJtE10gYW7kvivt1BSO6gEkr3avhLjDrwuoDXluPvE/M2+h4EbZ8sEalEsJB8a/u6bt6zAYsIzmcX4q0OC+FzcOTPL1D7cK+BVuqT7GFPyF8E56uDmhX/EWInh6Y2rNz8bARsokvMT/TBj9140=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793110; c=relaxed/simple;
	bh=vb82kHMjF7H/YB24C3WEANZjxyP2t2ChYpOBcIucziU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGGvOeULePev67NwdpxFQo2ZPew9FsJhJMziHllHGQA759amumLRPfXcRMkCeGvYckJZiS768mEZib1TbVCXWSTSeAjyQ5+OFIy4VmMbfiKrmx15YEeWaGNBkUxlq/PCw83IoyAsb9TFc5KCfQyCn2Kk4xJy22OI8Jl4Ys6mc88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y77D/LRT; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y77D/LRT"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so36247005e9.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 11:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793106; x=1791397906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GhPsWLlSgMSNkt2f5+GEEY7rdFcZVTICkbFtx1WQ/w=;
        b=Y77D/LRTMTasnQv5DHVfBKif3mOkS/d4BgGTJ0frbx2mygRmuodrMiPAsUodJRnIYW
         agqDGC9MUefM2mJE0hvV9lc0Pk5p69naYsVhQInvDhnZzR6v1v1X9uZEBv5EA2wtOoOM
         xI3UH4goebRubWgp6iu+DHufBmzUK81AKMxud7pW60zNZDOctyOliaE4W2o4toIITLfZ
         sBka+pnPKgjnbm7EoD6gjr7zujW5h1YIuGIF0XSfGdnA24l1DboCL6ih/vhzAxuy0NJt
         vYp8epcu4x+SaEb1qOHupeDHB1mn2Jfhi0wzsbLOebckJJxCDYE8PZoZwdfPrFyOg+Em
         U2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793106; x=1791397906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2GhPsWLlSgMSNkt2f5+GEEY7rdFcZVTICkbFtx1WQ/w=;
        b=wCSVFAaejjmRn9pYN1YC0dUvdQfLdcw3cpTHR+xmIU9DrqamO1yvNVmEgkdD5kWuWr
         NbQqDj9UxxfbbCenWW2acuigY0j3R0OL4Hwtyo35IfpCE/cqtvb94q25toOIqJkRSSj1
         C8y8d8zgx7Lp/UUmURmwd50rvhPQwrd71EunzWNNgzg5+uO/jGu/m4K7gCMGVfsA6g0T
         CknZ2jPmSCIeZUzzeLLwiAycg5L0aILkPHUlR6JQA+XQBmJzd2OURFbP5V7YUaOlqAPn
         zx1TX6eGKNagwSRf5F5fS0YoL4LWPKw+El7/RRdsMtpTc+S2acU92kS6UQqf/Vv98L3p
         YcVQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4lq+6RaiLkiTSQYt2adMzRMp+vE6aNL5dSfEEc9ii4cjfovYs1GhJlp/PGXebchAtCMAX7UJFJkNtw6sH5H6ucTdh@vger.kernel.org
X-Gm-Message-State: AFuF++lHHnv4sg/EVAsvHwATZpbRwcxCZWviywaKlISNuGKx3CP0p4dM
	2CAVrV8ZnZaCyO+f1J7UuYMbGB5MQlHb16wI7Yn5v0fOwo1Naoahs5bn
X-Gm-Gg: AYBFou2uAtXHPMnSH8EKr3xyfMsKbk7VNroEEsZZgO/QTnYKdcv82pY2cwW+ex2KElf
	5pA8tNhG43Vd3410SacYS/CwOtm8mI4KqsGNxpKWMu5xxNs69zpljY7RSgAYQaJmiFtmg4imXPp
	m5v3ojubbLOrq4tV1ithnfKFRyHH0Xz+/eFlAtGamq4l7yZpauXwaLKtXJYFbWgvCvP3oB6ZzRO
	yoRoOXH3MLrDDt9KqFHtZO8wTENnNq6RqQS0P2sWpj2xeGWsXmdxjJeMVTjkLT7ty1+D/lqujYH
	d4BCIuZ/WLjmtUjraEm+KLBMKXv1sjjt9ZK7bPyQfR7WovYTJur5+MFkSWRwwa5DZE87qoUOYOF
	lBGZ/QxJ1u5arLZrtF7OysJChATHdF6sJZ9YQ8jwmP7DcqQqjZH9GRmLzJkuOfBhrMkSAKzuB+T
	PltpLUAjaDOuTnsw22l4drtaYX6YKv0YKQ3iE2rGosH3eBjF8l5ZuWciRlIT5sqSAIrFD6eQbrs
	0KlbEWoDl2slGz4rXZsru4T4W10x9hfgUVo/FV1qH267/vW6je2
X-Received: by 2002:a05:600c:3b09:b0:49f:bd3c:bc23 with SMTP id 5b1f17b1804b1-4a01b12bedbmr39716805e9.30.1790793106089;
        Wed, 30 Sep 2026 11:31:46 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f90cd4esm3294525e9.1.2026.09.30.11.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:31:45 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v3 3/3] platform/x86: hp-bioscfg: return -E2BIG from validate_password_input()
Date: Wed, 30 Sep 2026 23:30:18 +0500
Message-ID: <20260930183018.49629-4-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930183018.49629-1-meatuni001@gmail.com>
References: <20260930183018.49629-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

validate_password_input() returns the positive INVALID_BIOS_AUTH on
rejection. store_password_instance() skips the store on nonzero ret,
but its final "return ret < 0 ? ret : count" treats the positive value
as success, so userspace sees count instead of an error.

Return -E2BIG for an invalid password length.

Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7): writing 999
bytes to current_password returned 999 before this change.

Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v3:
 - Return -E2BIG instead of -ERANGE (Andy)

Changes in v2:
 - New patch

 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index a9e1786..3f4c45d 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -70,12 +70,13 @@ static int validate_password_input(int instance_id, const char *buf)
 		length--;
 
 	if (length > MAX_PASSWD_SIZE)
-		return INVALID_BIOS_AUTH;
+		return -E2BIG;
 
 	if (password_data->min_password_length > length ||
 	    password_data->max_password_length < length)
-		return INVALID_BIOS_AUTH;
-	return SUCCESS;
+		return -E2BIG;
+
+	return 0;
 }
 
 ATTRIBUTE_N_PROPERTY_SHOW(is_enabled, password);
-- 
2.43.0

