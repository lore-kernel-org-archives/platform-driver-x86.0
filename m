Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B93396579
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 04:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787114601; cv=none; b=Ifms9wXZNdPFTzEJvTYCe/hIRkV3oyeYr/Km6plmX/FsKuRlcFO1mpGghCLeqz13UbviX/wHOxiUA9g8+1Vgq8Tm6JHQqfgzn7rwmG9V+lEAHcszYRfz6bozUNjBxG/15+eLK1SSq3beFmBev+7C0V4A+Wk3jJqUqo3ZePpOJuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787114601; c=relaxed/simple;
	bh=3p8nsUd7qlvVzT2l/j4s3amj8vttU1zsbwrO2Nxfhwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z31yBVcf1PIWPuJosXEu+JzjoJFZmIBr0Etfex3SD9cZwBNfkBwDnrTFV1NIpbvaQIFcTLUX/qIGij1b8Vf49ECfBHGm3Fq2GvTZezdbacmRT6Z/lU+Dmmhoew5W6rupSujUFwPvSw6kzD+0n0iyAzIManDyZGlZoadWRnqG9yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHGjekWb; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHGjekWb"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4af7283bf83so402474b6e.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 21:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787114599; x=1787719399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fdFKB7p3TyV0HdEUssTYCprIHjhjF1KGWr++KCGxiw4=;
        b=iHGjekWbqZV8uUepxAEXVAduayb02qrcAXEXX2qD/eW6k/wQ2LHREiTRPcvs3tbgnt
         zkXSRHSt9lPOccxsTl/HG1ytSFh5dpem6ry63AZYvJc9QEQWEQoRvAt1//e6cG0UkAxd
         T8TcVcvvVmTY5u1lrEsEBxsxxnaFPmZNR7rTV7S2m0Clc7l5ghdy0kKWF0SJOBzkvH3M
         FMY+w5LUkYyGTa0N8C65ppEaPtq/oFFKAykUeA33/1pnL8jQ+oguZ6FxhEgqu5TU0ZM3
         OlbKJ+BfqPHGn/dLuikPFs8rDw421JinYZMq+P6QkUdBl++EzuzbXVXxUnJeAMt+XaLl
         6M1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787114599; x=1787719399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdFKB7p3TyV0HdEUssTYCprIHjhjF1KGWr++KCGxiw4=;
        b=p6WMJYTpZUInGK69XWM+dE1MQ4Coad91HNL+M8JGrvIptNkYHP5YQyHGeu3ksyKJvL
         2pZeYDkoys7cKBlz47rSILt6k4W5PbN2y0zZea70BO2c5JhMdUWw9uSbFaJh3CHtQwR1
         n6FMOPwhLirKEqUvXZC5E4CnDtOKwaVwTBMGgb2YqmO9d7MUiDTLxl2omhA6zkH3ANj1
         qkDg3Z3cqHCkTh8G2sjmXb+reF+LMsNmqrRcYpo5AsBZry6X8oaLtMnLG8Ya23nN8EQa
         n9p6qqxRNzyft6Kzf9cQD3FckvhFxOhSZiqA+uDKpYyoE1dsK/xQJj163/6e/QlHfRi+
         I4Hw==
X-Gm-Message-State: AOJu0YwBrqfq2XFGlNbam29f8nQMvF1DQGNK4J9vALXAoxu0wFI/vsgt
	Ko44/VGBxwdVH1gIZfBp+g51Qs/I7LhM9RskaM8NB4ean8mLeCN/fN+akPeCjq9l+g==
X-Gm-Gg: AR+sD10FmsayDyetVxETKYZCayj6HRYMofs0Bh+NM6PzN7gyyD78HXvaK+4evROtUqv
	y7dCZM18klAqBSIdXlGDJGzZ8lqvZ+bH2ZvVgBWU6rVI3bsLNTSyGinchHYVaDV8wf634zA2cmS
	/pD2WhufA0PCe2c5xmFVhl8j1JW32Ket9GdGoT3KK9zjgYLhdGa7A3URAIw4l8RW1ixWOujcZp9
	pXzJlt1sNw4P4MDyTCmeKvWFu2WG9TMOF6sCY8Ac4shO7cmu1OKh96/nApe+b/TVqdV9t1+LnkS
	CWYlvMrKdSD4KbMh1WfL+CbezQ5q4E1QXa+/8+l5U72dlvLRZhCtRnLlw2zGKXg5dPeVE8j8W6l
	IyYX1Hekq80qHAU4mnqQpHH31QXgjutpvSUibaKYKqFIgfQZbY2No/3GJEV/oWuYEexphcgpB42
	UQACb06LJ62zSAu0KCW86Etg5PreZDjQng1G8JDfGE4dGbm+JYP0xS4Q==
X-Received: by 2002:a05:6808:1487:b0:497:df42:1dff with SMTP id 5614622812f47-4b2bc8b7448mr1810748b6e.1.1787114598836;
        Tue, 18 Aug 2026 21:43:18 -0700 (PDT)
Received: from 3511.tail24ee18.ts.net ([2600:1702:7a3e:17b0::3c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2960e32dasm5146932b6e.15.2026.08.18.21.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 21:43:18 -0700 (PDT)
From: svav2021@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arav Verma <svav2021@gmail.com>
Subject: [PATCH 1/2] platform/x86: intel: wmi: Use sysfs_emit in sbl-fw-update
Date: Tue, 18 Aug 2026 23:42:50 -0500
Message-ID: <20260819044313.335043-1-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arav Verma <svav2021@gmail.com>

Modernize firmware_update_request_show by replacing legacy
sprintf() call with sysfs_emit. When altering string,
corrected format specified from %d to %u to match u32 type of
target variable.
---
 drivers/platform/x86/intel/wmi/sbl-fw-update.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/wmi/sbl-fw-update.c b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
index 62c9c7f1842ba..cfef71f4f3284 100644
--- a/drivers/platform/x86/intel/wmi/sbl-fw-update.c
+++ b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
@@ -61,7 +61,7 @@ static ssize_t firmware_update_request_show(struct device *dev,
 	if (ret)
 		return ret;
 
-	return sprintf(buf, "%d\n", val);
+	return sysfs_emit(buf, "%u\n", val);
 }
 
 static ssize_t firmware_update_request_store(struct device *dev,
-- 
2.47.3

