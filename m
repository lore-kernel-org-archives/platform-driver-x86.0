Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D6D3A2576
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 14:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767492; cv=none; b=M85U6ccZ15Vsmj7XgKqSqmVWhCQ+tUhjP/S4cCL3C6izD0tqwdwqBuF9KMuP46X3Q5jTK5LNqfnZc7UlAgf5BYMF21+Lxn6Z/bXLOpawrTG3pUk4jBDy5esLSsJmfdI6dHomtzaxSUZMG8Z7mNyAGbsVdnldJUnaJpIokAnCBvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767492; c=relaxed/simple;
	bh=arXYzsOl1OkfcjkMtMDJ5cgQlgHX5faJ6mvfLb2jvRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gnCN4humgGNVGT8U+04QwCNZHJ6j2nWzRIfcaDEn0QWnRrgo5Sy8fxovaJ7SrV+e6O85ibcN6QDdRhwmk7yRfBOOiNl7VAqjo6Q5fdGAuTrkPuaNQ/E2VtWhcBoHqFjeTHOu3R1pBAVC7Vy7UeQfa1oVyKAOpe8216q9pmfZpo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5lIjtaF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5lIjtaF"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so15860325e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 07:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767488; x=1786372288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRYAshv6bCkW3StAMRtfaFS8SltMPequV+AOq12EztQ=;
        b=Z5lIjtaFUtk11Di+K4rJ6WBu0izPFWDpllTVnWYsoZj7PbzNhUWFWXp5lDUM+ONSLg
         lJ1Xe//gpXw3okce53z2Mp0C6lYW+18smRhgI+gXA0kO0n6ABlqi4awZfnyqJa0t5ZKU
         GURyeB5nVGoZuQHhnwjzlykpjXPbjRoHM4YIvyQfjyWWzssClxOfZgXKsiSi0ODi2R3g
         lU+85YZLwQiNVz6jK7HM0ClfXuEcUh52mLbJyTZtuxM/BKMOzTODHy3xzBLlIaDBQCA1
         LzqNjQhSfyxsU1xCrZsi1T8OO8/mv+WMucUZcuQKjkTInQAKSrDAdFrAMLOsvaLZZJfh
         0O7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767488; x=1786372288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRYAshv6bCkW3StAMRtfaFS8SltMPequV+AOq12EztQ=;
        b=fkllcyEMpK0b2Ghlt/cAf5LAwxGby8RC6iVeYlsDP7pfpCae3ieehIHzn/jAixHoW9
         A+N8UI16jr7s4Xl198d8Y7kxEgx41RL7WDnyAbt3XiJDoEbrcX3eJbxYVpaDqwvdSo1k
         gzyzwtbal6duSInaRdCoYwxZ6UIAfe4kLp24YAj8unTh7BhwJSzTf+pMNa0wORvrIkUS
         8eom5RLwIyN9Rnp9hrSIO0aiY5E+RcpSWXoC7mtGJO6WazXvvQ7HKg83o3uxLPOXu/pF
         2jbOLcuRCIAvBbzNfqQWNRI/FZRiIHaSVBYM4uKKEXp7ayd/pKcjSlENXJK6VDgk+4xc
         4lLQ==
X-Gm-Message-State: AOJu0Yx0PPVKeJbfr0cZfuEITMjb4Szw6tegJzHWAm8l5RnSpNcs4cvm
	s3vCrU/YnCTVCJDgya4kc5TBB5Sxcy/8FTm7DV+m2V45NBywCSHU+d+4LGXTnxTQK+k=
X-Gm-Gg: AR+sD1371kQDvl+S6XI0AFEAc2rgYrCzcrpLlAXrWPn2d0dGIFOqz5bpJZkML7br4LB
	A6BlYPN7ntQ+MpdxSOkluCgUXDBhQ+842G0FqCZqgbOtRvsWVINLsfaL4O2tlFNxYa1sE+rwaPP
	CXWjCIGhpjrYLhAPZ/qX99GWGeRvt0ybtlSe3bVmM5wKuQWMGJxkHL1NsRZpJX3GoqhAKdVRjVz
	0mWLOfcvktRD9tViwciElHHkwBN4i39JuB1ngKQxDOSpqdUpGLQiQUQCObBgX57EreHILULOCbf
	syEtwmg3veZRNs0U6BkI8szjcMK1pBNklvAHeuveyXaU8LHu2IfhimwzbkviZcTD6+uP6obaUea
	AAiqKKtzwRKQMaXAqsf1zqWiR6x4EqbhxO7yjJUDWfu7NuoGtlieX8/dEzJXAuGkp5mRt+gMQte
	0BI/uDsyyOrz0hOAZJ0ViSTQxxOfyYcmSTwfA49EPF5Vgg3QD50sJ7wPzEL3pDigthKYeoBw6pX
	L+WpCFjZWaTvguO86X3RQq5GZPEA+FiYOaQFYoOnQ==
X-Received: by 2002:a05:600c:a42:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-4980eba0a6fmr208724155e9.8.1785767488101;
        Mon, 03 Aug 2026 07:31:28 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b98284sm236575295e9.12.2026.08.03.07.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:31:27 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	meatuni001@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 12/13] platform/x86: hp-bioscfg: advance elem past consumed array elements in order-list-attributes
Date: Mon,  3 Aug 2026 19:30:35 +0500
Message-ID: <20260803143037.93105-13-meatuni001@gmail.com>
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

Fixes: 4b2672ec71a3 ("platform/x86: hp-bioscfg: order-list-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
2.55.0

