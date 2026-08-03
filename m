Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B17B3D7A01
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 14:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767473; cv=none; b=aVV6cInA1JXwlsvoXxcxBbstjzXqciDd8X2Pzkvm+X6J+Ku8yrtCCqZU66qsgqPwd9JXXVDzrCqb9924S6qZf0uTU/YJRrpuyhH9UZrhFamM88jtZhL67947S29gVb8oBj5N3bRHnDB8Y5zrAaqXN878svlDd5ayqzORg6wBch0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767473; c=relaxed/simple;
	bh=rhIU1zG+Cz1JEJ/DZCxK23rcEZYVi7vpJbqoVBA+2qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NqkhwSYp2oCiQuP+ubX31XJEUU8hLbvAYllnKD0LbtZfC7hWyrS/1rK1TnqWMOl7NKQCNFL7oVVRFO6hCiweIX/mdK0nb7Ty3EKptl2OUEhBTmMwg8HCi5B5pOAEZYbO9ZcDsu2hyNdQY+8d3WdwjNtdFg3Cii/hmNmToaZUj9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EN5AsLZO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EN5AsLZO"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4957eefd361so14968555e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 07:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767469; x=1786372269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzXAlvJrvz8VJKZL5THLFAhA3g1WFYpeVuZ+6qv41B0=;
        b=EN5AsLZOMn9+iUtyfCYtIKMbFvHptztVv+bPHFA279POyADHOG7dixnM1f0411liHX
         1PrbJZBzQIwEditG2W6wojAatIoBiGxAJd/wLzW/kS179E72gKahzvmNEdr2PUHZasCF
         /uNQUqpJbkQ89P/Y3YFc8EYUonMWW+Ti2KnKGvvSBL86ycM/ev7qHiO0plpvIbSrTDir
         hArKa/sM1Ld4W4vKlF86AIKp1P1m65B5WnJ1vkEQZJi2w/8XuEpWp1lqMgU2XXDYA15z
         MoflB0MCxFRLbu2mLz4rQcHentmwCMrUmlY82EnYk+iqO6meeg3u9jdeu4BYD0pu7crr
         FTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767469; x=1786372269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzXAlvJrvz8VJKZL5THLFAhA3g1WFYpeVuZ+6qv41B0=;
        b=bqe+Jex+xHKFYHwn7FTALKBPZNEWHbwBAvETD9QHY+fjKTzYeFbI7kYfTKncxb9eVP
         hbvP3KVAfbRylqfXqOKFy6YDPgv6Di1gOvdFyIea3UYZJAOtNgGrCsrgldXfZw6W80LD
         pdXo2L61OTHEILT3xSthc5w75x2kXpAvPqbCG52J8zUTtApQkLZOSQvQXJ0iRjzmnHQc
         O8QLHv4stUt1NO9DpLS3YOJmpw2uUMyA5KWPSYwZCwU8k+x+r5Z1/x6Jm/hN5mXY/QTB
         oA/slKREnNnFIwYYGwtg4m/t8xDrY+X5ZFTqVW8x4MUe48AD/IK6svW2homBXFMI9yHF
         Vy9g==
X-Gm-Message-State: AOJu0YxayM+3aWkRuQKO5w+yK9otsGEim29e28q7Q18iGOa3BbHyHO4V
	jNMphIGA740jerHzpRHx+lPr+X+tGnAX5Gu/2I6vQzYFNOwJRUlb1DOC/D7Scjp/uCc=
X-Gm-Gg: AR+sD120B2t8ZpDS41VSzHSn2nSYZHruPvrl8vdW5Cek97gi+P5ZN//1cPCsPztkcq8
	8pnrIcUjtVAqZiZ2qp/m5A5yrLugqa4xEimbK4fDIftaSNMxYXIDGFr+gjo4zb5gS/1JjA6WtFS
	7D5o06gibNs+A2Vlne4cpy76ij28ClmjRgVhfAG6V7hgzMFsozXj2IrbfDq8UYUd7c4Q7T3nL5e
	fC8swpLVSVkOfTEUyGDvfQHwFeD8w79P8GuzAZJ1BOPAfeUWDfO0C2RRwq8hCnfDX2aDP8Lnl28
	INOKWac3hxnpskGTvQRIJbyhXZYRmIUq+XtvDNGjVmpfaUoGPBZBE/87cinYaMRldewxmBjk37d
	GqxyIZjF+INHsEV3c3dwgWGtZL/LotzudEbg9wkzy8wiieHE8QWD81JwHVTtnSaV6oRNAPkGG81
	vbt8yuLA3MpWV29YTZwKCFRGNBwWVKZTAojeVOytIhDu38tC+pgAoTbtnKxd7D5Ew8oCQsK1CF2
	bc1pzjIjLKx0WHQAfYDq4TRnFSvzWOrUw9aexbLQw==
X-Received: by 2002:a05:600c:214d:b0:495:3e08:ad19 with SMTP id 5b1f17b1804b1-4980c653c0cmr169146715e9.9.1785767469327;
        Mon, 03 Aug 2026 07:31:09 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b98284sm236575295e9.12.2026.08.03.07.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:31:08 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	meatuni001@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 07/13] platform/x86: hp-bioscfg: fix new_password_store overwriting current_password
Date: Mon,  3 Aug 2026 19:30:30 +0500
Message-ID: <20260803143037.93105-8-meatuni001@gmail.com>
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

current_password_store() and new_password_store() both call
store_password_instance() with is_current = true:

	static ssize_t new_password_store(...)
	{
		return store_password_instance(kobj, buf, count, true);
	}

so a write to new_password is routed to current_password instead, and
the new_password field is never written by either sysfs entry point.

Fix by passing false from new_password_store(), matching what the
is_current parameter is meant to select.

Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index acb123985ede..6bd56d3f5bd0 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -123,7 +123,7 @@ static ssize_t new_password_store(struct kobject *kobj,
 				  struct kobj_attribute *attr,
 				  const char *buf, size_t count)
 {
-	return store_password_instance(kobj, buf, count, true);
+	return store_password_instance(kobj, buf, count, false);
 }
 
 static struct kobj_attribute password_new_password = __ATTR_WO(new_password);
-- 
2.55.0

