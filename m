Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3335940E8F8
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 12:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599851; cv=none; b=nkgOuguUhK+J/VI+igl8YezRwJzVm7DX2XQoEGuZAZOCpriOLN6oEOcghvOF8X0uaZtxwVHBP9q7WpCgRgY7uOe0wu9GsUvX21okAwlFmfZX13uG13wxTaFgnvs2iZZ8nsM8XQeUak+dP0r7wQ8Nqw5RR+krr8zl9NR3Au7Uo/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599851; c=relaxed/simple;
	bh=3vZYn63jO85z8Hp///6/uHOKRfTTdQhNaMz+dKNjsYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0HWzA0SVzevggcxOP6LEPhGeQc/cyLsQ3YPwdGU+lFAE/CmuH4A0otzHp5OqzPzIv6du83FYOxgEw5qMNF6sz3Ic2ICpIwHBy+uHAEXjj3dx+0T08ot15HQ+T4kEl17lhpSNFcCXajVOC6tdImkF/rp7oSegX56sPXkT9Nl2Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxt8iewi; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxt8iewi"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8484f229529so1154213b3a.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 05:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783599849; x=1784204649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOGLhMAud++pKwP7Eo7DJkqYywsW7ZGwYsnZ953IfCc=;
        b=mxt8iewi5iCVo2DkXUNpkiBFGpzsyvyDyX2boEBSAikEvjJJwgR6EaMOEvsI/cHnPY
         J1lACH5uM98irHZsrr7A1g8eVJDzm4EU9C9RqSduM46C9wZbyOAqo4rnWvI+iQjzFq5O
         r1vzMzrXqn5Nk9nUU0YYI9a5/xuQHFgnOCbxyeYZ1UOFMK73Zdkcs2WUFpXkzhob1EDS
         Aict77wIaj9j4TIsOifL0V9PsmYTPG4GezNmvGgikYRZVHcLl34dYWNJ0FdtS/9bCaLu
         uIdtsG3DllrndtGSvSLLI2bMv1CpDJ7SFWh2+z+X+LU3fW+fnkX1mjQe4Q+NkMCM7lhy
         NEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783599849; x=1784204649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOGLhMAud++pKwP7Eo7DJkqYywsW7ZGwYsnZ953IfCc=;
        b=iWmBtC2bx4dqUS+AoKVC21fIOU1uCD6NEnoDO1NPYMEcCGZ6KnaovMWGaHIS0hCbaC
         5UcHObxNfHjXAeJjOx0ARkMtqLA9c0VDXHrfl1x3eYF/C03Hh/kHdYZRvcOeWTL0UO7o
         IwO11RjM2Oa1ZZWOIa1ilCBLjNTRVGByXFlKE+hV+wunzKAEynl4FiRiFRWQnxsCuaFb
         BtOh5lWuK61lZGsQl1Z08zjR+OTcjeejqaqLRaDhehO/Jyx0tXA9z9UV/1EYw4ItNbLT
         Jd7iu8AYA1q0SpwUR13XH/2/kTVd4LnLh5SG4Igkg6mayly0o07ijSRlVG5AZxnzDKvf
         E9eg==
X-Forwarded-Encrypted: i=1; AHgh+RoaF0oTd516DUpWS1rS4AP7zmuOX8P9pEtWCtVChcyuYi2cefjE1JMsAgp7EadpwjjGATdhqxqWu70pWhEkfi1uXs1C@vger.kernel.org
X-Gm-Message-State: AOJu0YxbPr5pJHmeuqZvlwJ26KJgY0k5rbvW2O3a/U611AVByQeCazrp
	c4vwErrEthh4NwFDL0QndlsKhVP78C9HCPrW0qotI/eTtVepu1Ubh0w6
X-Gm-Gg: AfdE7cn/ywGpzXQeoonWalgJdbZR5K+G1pNBga3qD8eBgXD2oijl9/T61c4Pg6CDi3i
	3gxEaVQqKpoXS8rqh33+LoYmvdOC7PTBwCaoJhmW43AZt78/3QPBVpDJN+JFLktPLNFCQLS7ASM
	lBNdkc8k6fZcJ1O1fvmcXSqlapflEIdjc8YVRbMbBi14M8xQrcFj3J4RuoWJCs/0cj0fTCXp2OV
	s9XGhP/95vk0ii2rJQgzBIgzD/1Yg1xpPc51ebyS6hINUbQIPfUfVuCpjnfKBqsNxcaHt7TTQGY
	YwaFq3cXbx56x5j1HkrPsY4CxUgGhpeTcNN8//bmG0aAy4670hDE+PbmMzJwXb4/Pli1jcn6mRq
	Ipl+7wi4tN5Nq/E3Js/4DIsH4n3YHvlXVVMxo0uXw4WNoBmMhJHXQyQvCJw6m5eo=
X-Received: by 2002:a05:6a00:2e24:b0:848:425a:4e31 with SMTP id d2e1a72fcca58-84842ede32fmr6680850b3a.24.1783599849345;
        Thu, 09 Jul 2026 05:24:09 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8484f973c4bsm1672517b3a.25.2026.07.09.05.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:24:08 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 3/4] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Thu,  9 Jul 2026 20:23:36 +0800
Message-ID: <20260709122337.17417-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709122337.17417-1-qby140326@gmail.com>
References: <20260709122337.17417-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new maintainer entry for the bitland-mifs-wmi
platform driver

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6d9b69c1df4c..b92bc4816fa6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22768,6 +22768,13 @@ S:	Maintained
 T:	git https://github.com/pkshih/rtw.git
 F:	drivers/net/wireless/realtek/rtw89/
 
+BITLAND LAPTOP DRIVER
+M:	Mingyou Chen <qby140326@gmail.com>
+M:	Gladyshev Ilya <foxido@foxido.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/bitland-mifs-wmi.c
+
 REDPINE WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-- 
2.55.0

