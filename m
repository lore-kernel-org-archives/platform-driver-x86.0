Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753969;
	b=SOza+bdzB+knImdCdzzoZ3bQhAo+F10ASrqX5ZtLuysyGRA+dhSjURFJSINCtf9e+yxQ
	 WI2xpH5hxyNHsmJDHlAn1x1uPlI8xlKiIyfTc3hrFZCqJ8xpbQsrq+7XP1+Z6zXM6LcAK
	 mUd+2m+89fel3SqZyqS0S9rHZB5Il1CsTJUTc2B3EGb12dr3+rQFkNyIVGwkovcp0y3Jj
	 JqQ24Sm+0Arsj7ZV5ndKyk62gkr+JrHtHiGPN2uEQqtgoVeiGJyrkvkXM05hVvH7rYJbr
	 tQCTHVircX1jG7b+/71/jbUbEhqWiA+SOBLxbU5u1VtKDMIqj6d2lJVFMi63BtDXfLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9wan7/G8S4UB5GznKJoS+f2YKxQ4KsBioj9oqflOV7o=;
	b=PU8Fq5X4V0C3/BeYBVo0IBmM4HEZye4oEIlB9jbljjMi4M251TFTmHnMcpOIMpqz9Yz+
	 4oHVXzJpJt2QonM6oCZuC+BYr2iJKQbe/wIppokhHsCOc2ffqcHDM3sK3qPTcqDrRV7C0
	 ft6+GUfgthMultOryxF7eUzek3i+CLyR6pTjlBY637UduqkZIZIRRU2gaCbZG64LqgKO/
	 8lAScfWCVcwI0F9aGR/V0kpmdEixXhTS65n3YlXz9W1cW9jvmoK+v1NZkM51D1gRezAOf
	 MRQKSgDjgRziPqou2jmFPCss60U+LADJRd/1pkwc3229NKSON3r9zxFMNs3Cr3qaAyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TA0Xf/52";
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB91606A327
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 04:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB91606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TA0Xf/52
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso4583585b3a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 20:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753969; x=1796358769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wan7/G8S4UB5GznKJoS+f2YKxQ4KsBioj9oqflOV7o=;
        b=TA0Xf/526I4RQgqo925fVLv2MqNnBpADfW9+sve7dvu/s7PRVUY6H7yR53MDHiVHSA
         cnHrMvfH8KMiZYoJGA7hHW66vWMscRDFzgzpLSztD719/fDXSxcJ+bKTlAT/selsGfnM
         lsrovSZMBCOOspDUJLPruCI9ODTKdHVuTgcvB/LmBhETkAV3/Fm6Jqoh26F3XU7fZVzR
         Hjt4+9tYQaosnWHt3g7jb6s63+seEHoheOZlg+4u7MAvDuC4g5ueOY3YrsE7j+vxi8Qi
         dqKoalApYqfB2+h5S4W2jMitS0v2V3+Z+9MFAIxFRkuRSewJ0sMQ2df9bdYSopaBBgJa
         BXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753969; x=1796358769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9wan7/G8S4UB5GznKJoS+f2YKxQ4KsBioj9oqflOV7o=;
        b=aT9ZquNlanhD7YFyewXMtH7hALJIqamA4Jvk0RkzNBVZlSjlUnZBC1E66WOMus2UMN
         c/AL48B0METq73owVrVEsNYCYS2V/svnKc7lCo4ucS55UjzxTG7Q9Jp7eOvUXwzz6a0a
         jZzKkgaLk20WQj9KhJkd1hdcgu+1hk9iV1E0JWWK0I3q1xz2HnJ+5lm2lkzr0HbyilcD
         YN3iFSk4p9GLBzoRwwYhV1gRJAQwg7t+Wo9UtFinlfm6zNOShs9/YgnqgqND0xHrRjfo
         zZDQsYtl4rITJJADgPbJGxVk8po3QlM2Iaxchr99kDOJZXCNEe3DoYQ0/oz1nDvzwqVm
         78Pw==
X-Gm-Message-State: APuU4Z/7hxYaNFeSCJOBxwjvGldUqRagdlnzDoLBzU5Y5HNGO9eZtfTO
	6ssQV9TmleXLu2wZoqfJkL+FRnHg10br34+dFals5OJ+rOOtkkc+EiEffKJEBGu2ucQ=
X-Gm-Gg: AZFdTZdFbPYBz74pLd+rlF1kEHrHvC1kYs2yjAchVQGMPEie1mOu4EXIoEQXNZDXxxr
	T+/OdRezK9Insie3ri8fy+xIGcj/Ea6mRQFa9BilU1kefM+GNEohkjxmZhbMioCw1ULWzQIeeMZ
	Xa5dxn396tkItk80gtbQNELVBfSdRfDedx7qqd9mLkAHzL8iHHsTFH4HDKtFPTixyWi53lWTvLT
	6YRjywgArQtIbgOYoKIkpHjuwSEhsLTHOdn1oViOtDUJAPUbEMP1qU21jFbJmAgTXDQQxaZQjK/
	jYPS0UHrOS0K1auEkBW3cCFkGUyxuFTfXsLH+IwnSysR0CChsI5BNa8z5GXyDQt53Ig85D2GmNm
	5Q8TnKXLQcBTNG4snrtPAEGd0UmBsi+loLNhrmy+znXXLS4luazTis6E2QuxVvjzF1aBJa0Eolc
	G9uma0f5emi3zaJRuZ+eSJGWZxHWVetUl6xSXTpLgVoCB2ttG8/O7ieAEkbf9FDns5OnR32wTOk
	EzMHiZL2wFXNGXrV04V6y3rUL2W3J9egpP4c0jTq++e8KIh9qSZcZlpIN1QZMcsESsgMVfsW8xw
	q+zb0w0Lgxyfavei2J3nMOB+udAqtxHgagWDGWyzhTuPJGX165ZPg2GFlweb94sjXP6x6GE=
X-Received: by 2002:a05:6a00:c08a:20b0:8c7:f59c:e82e with SMTP id d2e1a72fcca58-8c7f59cee72mr12535360b3a.36.1795753968591;
        Thu, 26 Nov 2026 20:32:48 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4c43bsm11468690b3a.26.2026.11.26.20.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:32:48 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH 2/2] platform/x86: mxm-wmi: remove trailing whitespace
Date: Thu, 26 Nov 2026 22:32:45 -0600
Message-ID: <20261127043245.132189-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127043245.132189-1-artem122novak@gmail.com>
References: <20261127043245.132189-1-artem122novak@gmail.com>
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

Remove the trailing whitespace from the blank line in
mxm_wmi_call_mxds().

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/platform/x86/mxm-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/mxm-wmi.c b/drivers/platform/x86/mxm-wmi.c
index dbc5e35ec38b..c9a3d1cac65a 100644
--- a/drivers/platform/x86/mxm-wmi.c
+++ b/drivers/platform/x86/mxm-wmi.c
@@ -46,7 +46,7 @@ int mxm_wmi_call_mxds(int adapter)
 
 	printk("mux switched %d\n", status);
 	return 0;
-			    
+
 }
 EXPORT_SYMBOL_GPL(mxm_wmi_call_mxds);
 
-- 
2.56.1

