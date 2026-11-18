Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986592;
	b=z/aRjhZoA3VjvDziGj24HIGR00RBPIXWABqys3FmfXKAKbFvdacshW9Rnm4aAfsVe6Nt
	 yfoO/I+SKhXmkTewHystD+Szar0Tx3yynRV9YKJDr5MT47c0CdEOpBg6f3g8XjOyYUOKU
	 XK7Sj6+JgsCmvE+96NtwjJ0BFzkeJGZNmykx1u5trWmceNTqRnM0EDHu3VMUzwO6gdytN
	 edX7r9gzhY4j9mzRE1pUfD1tCNRso5KoF0bqs8DITtdDEwPGyfIvHLswkgSt1GwzbvLUx
	 k0Dexnt+eNVXQM9TrmXYS2lxR9vJXzgxdLA2WRQv6WZd2cT7qmM4SwJnYvsthNrZwTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b8jhD9NyOgBY8U4+x22CAnEoBAUGT7c8YHeC5TZXIJI=;
	b=oW3HQTb5lEMe1yBBN/x/elcZmB0I3sgfJcQ+XcnNOE+uUrbKMUhJJklJPWc1lPRRb1eg
	 0LTdq8zWq0ufrvItnIE+2fynkYg4ypnGL/3aJC6+9GIqEQJY5FmrGWoj/zbtt7mUz/jRW
	 8eTolh+/gHiPSsXd12MWoChqlMPYd/ZondE7RqYhC+EfHQHWdPNXwNLjw208TukgNXK6S
	 XMo/zjHhWYc7XgETqmgtUpXSPO4fxOwnkSiRsOS5M3zAn0IhEEmbvSTkcTPB3h3gyVib1
	 lYkfTCp3OgEFJOlX5XbT5S9xjscldu0DpBY8cdbCQRqVEyG26sBzVDZu6eaMUDe23sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1frDFoe;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6A6606A32C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 07:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C6A6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1frDFoe
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1262011a91.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 23:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794986590; x=1795591390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b8jhD9NyOgBY8U4+x22CAnEoBAUGT7c8YHeC5TZXIJI=;
        b=Z1frDFoem+7o/vGx2nbbSolor5KaZatEeUez6FRBzfmKkNIGkihGO9242gyljdFDrw
         P67bp1EjuAjEpwpwMw7T9kvfvVNpt7vjBOgI3BPtTAIR0Y8e8LFuUjX/COS7qFddQs/C
         vK5twTT7XHWS/D93Fvp9IF7aK8f4Ct3iV26cEJzS/V2VSERAZrxC61e4yDZiZKC3/dMn
         9iklpy1phor7eFJOg9GogU9VlxAVTnVRqA/SARD5y1Ok0c/MKmumhOkcsi8tFv44uEYw
         cm6cdKCA3F0BlaAhc66siWJbWTOOueL+xRIz4YMwbOgvvyeHJiNn0ib1MTjMgprZIeYb
         TyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794986590; x=1795591390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b8jhD9NyOgBY8U4+x22CAnEoBAUGT7c8YHeC5TZXIJI=;
        b=SlUM5+Ah8vUbllSdq9HYKqL9QB678pi7q7KbAnzbsfKLYYatVKsyPWm0cIXkQf+wuB
         o+Iq8EF6R9Z/uwD0e6PhzBSB0HUQtJti7+8fDaRZQrILNUz00KaKsipEgaXoh6amOzt/
         3bcF/jSxQvZDKTTDoyhUm0MKVuw0g/KHL8MWDsefu0hb8EO5xLxq9dVT25nC1ty+BA3j
         nH0t0V1umuGZJFEIZcj+lFjhqXBqSIj7QDhMk+JnJ2GbzONfq76ADdOCEC65WWgc89V7
         87iXx4kC2AkA4abWoYJggbHn1gxQdyPK7MgyKILbQjs+pyNpvWqYSQYsRGtJF4a5S7ak
         pCBQ==
X-Forwarded-Encrypted: i=1; AL+hErH88Tnh8F/vNjqCQI5c6Jt8qklydh10EH3N9zNI0n9MMra2ZcM/f5ARzC0rs/QzkFxr5F0tW9ejXPFPIPuOWSRwbCKO@vger.kernel.org
X-Gm-Message-State: APuU4Z8x3AfT+zFVvipPpNXAG1Oa0Q1NTDqfOKUVCfeFKCFYLAVm3sbX
	1SorO6Gxj3X2Lx4pb23Lp6llKYEAXC6rQIHhbhuymm+U/8lXUe0LXIs5
X-Gm-Gg: AZFdTZf+HZGAuyclvBgVIajG6mT/+y4afN8/xEcQ63eqcM7Oy+L0hVcxZf8WCd5QhQW
	9IszCJS1w/p+I8gS6VnzsiY2DrFQ5ttXcpk/sLPfIllhkDZV4SiQTQs4kLX8I5U+b959GS3VAKw
	vf/SYDPCw7f7/LMydw7e5l9EO8pd5XaF4cT7AkvNn/kNfdVo0Iq0rkRi+7EZEHsGvgAJ2K9K4hQ
	X21iQp+XQkwwetlbGLSxfsWZoUerwiExw2JsjbTl3pZn4DmnVhPJwfb3SdZIaXJa5bUU6wS3NxF
	x1K/qzklG8NSxnutemfE9N7aNnUcyy1mLrb8+yWWzk3Zcq3Ms5x8LAOntlYaIBPZaJY5ZVuzWO0
	ooBRYE1Zo0wI1pwMrz0hHxu3HnlkoyQuApRgjL38R0+7wugC5LzDfnGaWMPZDG7vtRmXiHoy1c3
	6iQ8oYA2frT5rsJJXz2YpHYPZj26nbOh+A4xtPKR1CWPnKQgDDNzORDkKZF9aJ4dieVOXxwpzPb
	l26XcqDlpssiAbDDOf9oQyOGu8LrVQu6bgImqusL+Z0I7uYx3yQGy8StrEp49nIhQwIiC8NtwkA
	Z+ih29jMmPEiY4CYsFW2vD25ef8hfFPXimrJWpyMdf2AxpVT1IYlNgn24mHX3gDGet1fRg==
X-Received: by 2002:a17:90b:3147:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3b3d07bef84mr1108974a91.15.1794986588823;
        Tue, 17 Nov 2026 23:23:08 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56c9c2csm1031783a91.3.2026.11.17.23.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:23:08 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Prasanth Ksr <prasanth.ksr@dell.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] platform/x86: dell-wmi-sysman: fix heap OOB when scanning for a newline
Date: Wed, 18 Nov 2026 16:22:53 +0900
Message-ID: <20261118072253.896390-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current_value and new_password store handlers copy the input with
kstrdup(), which stops at the first NUL, and then search the copy for a
newline with memchr() over the full write size. If the written data
contains an embedded NUL, memchr() reads past the end of the copy, and
a newline found there is overwritten with a NUL byte.

The copy is NUL-terminated, so use strchr() instead.

This is the same issue that was fixed in hp-bioscfg by commit
ea146aaac690 ("platform/x86: hp-bioscfg: fix heap OOB in
hp_enforce_single_line_input()").

Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h    | 2 +-
 drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
index eb48ced55823..808ff9e70add 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
@@ -144,7 +144,7 @@ static ssize_t curr_val##_store(struct kobject *kobj,				\
 	buf_cp = kstrdup(buf, GFP_KERNEL);					\
 	if (!buf_cp)								\
 		return -ENOMEM;							\
-	p = memchr(buf_cp, '\n', count);					\
+	p = strchr(buf_cp, '\n');						\
 										\
 	if (p != NULL)								\
 		*p = '\0';							\
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
index be939b731063..9677811436bc 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
@@ -79,7 +79,7 @@ static ssize_t new_password_store(struct kobject *kobj,
 	buf_cp = kstrdup(buf, GFP_KERNEL);
 	if (!buf_cp)
 		return -ENOMEM;
-	p = memchr(buf_cp, '\n', count);
+	p = strchr(buf_cp, '\n');
 
 	if (p != NULL)
 		*p = '\0';
-- 
2.43.0

