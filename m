Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753968;
	b=TaH/ytn91y4hG9pmSwfpL+oKSKxb7O3I1HLZMyEDbYagwG1eDkzOFwL4ID3MArvT76Af
	 k90bFoEbwxCpf3yzBqNy98ddakjDbyAqIpeUbjIY8jK+PIwB/3J5cOT0HOyq9blAwrGph
	 qY3a7XurcC8ZcpxuTXBhRaEBRH9E75Nh96TrQc3MM17xhFFG09Y1mwpDWc9pszKtcaOUE
	 p2T/y7eBBrYnz7jRfZDEO5AN7JFwiBZ4uRauUfhIx+N2cHBhs55zys/MaUxroB2i5LczY
	 tfuO4gyvh5ZGq2LO8Guqv++y9uotqww8bDOlUwpq5eNiE7PBy4W+bR/Hz02tPZsul6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mkWAaJcKCZd7YWMW2TW7OYqNZMDoM5K/uLexjGADDQQ=;
	b=Z41j5R/jeryDc5F7Vk5yQArGO5NxI0BJlJH8izoMiE3LBuyAJJxBPwvDu2mp64McwFCv
	 GjjWJe16YfiKUt030gRejFvyt5siE/3WtWTdIK9k7Ye/sCssCm2z+WCwonlg3xbJwCn0Y
	 WLL+Ykc28YjCdBOArVyZE+qqSsQs6sFr2hBoR9ATbL2hJnyWbtqaqEzMtjXdrLX0cySEu
	 DiVnodFRwOi5G9Bhxz52jNOvUpY6/gWIf6q2Hddy+z3i/0ppVyMBFYlL9UquHLQtDnHFq
	 nEKCQ9PqZ21L/nY0wVCl6p9gyjMSCisa0rUqIizKvP/Z3saaG1Ny+CHRBYI6ueBa51g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kI0W7gfy;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924CF606A31C
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 04:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 924CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kI0W7gfy
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so3811027b3a.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 20:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753968; x=1796358768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mkWAaJcKCZd7YWMW2TW7OYqNZMDoM5K/uLexjGADDQQ=;
        b=kI0W7gfy3Y0O9M9HqdiPktoDJsPo3hxPLOwvK9cg+/7CmcjvqYX0tT9mpqZIKBvpaC
         ZNpCYM4qxSd0WXKQOjbP7CF6XlJnrG/K2IY0B/JWwKcvY4jSy+NymIEa73Np+JLz5Ygb
         z5DpxtQrz4O97wRf/lldiA8ImvQBLn1SoH30DiLsP97FCYooWJEfTmw7NRone9hLIEfZ
         pIemgU55S7exfMOCo9Z0A9Xq27mdCXn/jK7WkR6Zrnuz3bIHLMuNoyF1cEmH+jiYd8Bb
         R9hIgdYRO5id927yfJajVmWQf5U9Bj5JoQfUW9PM+qpGhuETFpsIt+Wv1H05OISPpQLm
         7dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753968; x=1796358768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkWAaJcKCZd7YWMW2TW7OYqNZMDoM5K/uLexjGADDQQ=;
        b=GUwHN5a7RJ/Q8ntH5b2TZn0rOuP3zsQnwPMnkrtSxXuRH1mD9U+X2KcoZDdzYt0Spt
         HTmf2rB9fVKV3Qs64M6Q0chrTwFq0MTmldzmo6t5eU2NVlf9uAnY+Dqo+5C5Gk+GvSti
         uaRNgBe6pExyC4tBYEGCKgo80tARv/UJS7EXfQ0rtFOoFcHgs5lEZPJZcQ018bKMC3As
         nGp8vPLmUI4GNqVh8pH5p3av9wTc5JgIJi0L9gxBOhSdSR3rzMG2rCGD/F9fMJM8COgU
         gTsSHCpixPEQqf0W5HmQC6gRcBIScDkV0Rn7n28ZQBUPPAlnq2EwqU9ZHO1Cp4CS9oOk
         i1mg==
X-Gm-Message-State: APuU4Z/yu3Qyzvxe+eWHmutSG89Ku+WzxTiBE3Z4FvkBoGeuk8YCVUpT
	DWcsVwQy0+w+VWqnPF/G2/FfVNdE93geN4PCVVldLIypu8gEO6EdaCSrExVCG1+dVPQ=
X-Gm-Gg: AZFdTZcfcN+nCrXktE7U/tKRBXZLfe8d0s7R0mtS4+2gJad6GZPfcmIXhf8YIjkSLZx
	5bWFln9CyD+mRGKmYnczhTjTQGudvZq7OWpFqM3rZieyfkaR85mO2WeGXKjzTZ+WbiVsH4pV5to
	tDUL505DKFuJYfEgdM7l0NtyEdy15DMrkJLN54hv/Bl+aja4Je1LdjUTAGe5BJC38Uj2Sb67mVd
	mY1CqAQ7av7YRE78vnc7asMNPJPh4lfXzIMXhC5tl0O/eP0bZ8VamaoX47tCc3ddB41Wj9aauBy
	pEulWm2EziY+uzeI1zMvUiw8qaUI1Eyn19taYgrAiTf7m+/iiKRcTCPpEUkGAsQbiwntxKPGC3E
	MlmezHvwQO1/lpszSiJrskKf1zkx75kObOJKvy+WDVWp+wAPsHOfImaqhXmdoRV+ucXExfcnxcX
	0k/ehduqdPpYi9URhPOWrICFkI1jbj9cu1/oDyfKr7NjHFhEjP9Um5GIH+crkZsPSxItakJjcbD
	OPyilLKmD7dxqYcqXtIEOdwzTVIGcJi0tlN8Dvq1A317TpFUTINjs1w8eAeoC+t8txxePrtQpup
	PpbfUjhbCUQ8za6b6kMew+hB0ypxWd/stuj6/2cIEGeIIvuu4w==
X-Received: by 2002:a05:6300:670e:b0:3e1:dc9a:56cb with SMTP id adf61e73a8af0-4014d254816mr23219180637.17.1795753967872;
        Thu, 26 Nov 2026 20:32:47 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4c43bsm11468690b3a.26.2026.11.26.20.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:32:47 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH 1/2] platform/x86: intel_ips: remove trailing whitespace
Date: Thu, 26 Nov 2026 22:32:44 -0600
Message-ID: <20261127043245.132189-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Remove the trailing whitespace from the comment in
update_turbo_limits().

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/platform/x86/intel_ips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 636f4511127f..c7a4e1cedbab 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -707,7 +707,7 @@ static void update_turbo_limits(struct ips_driver *ips)
 	u32 hts = thm_readl(THM_HTS);
 
 	ips->cpu_turbo_enabled = !(hts & HTS_PCTD_DIS);
-	/* 
+	/*
 	 * Disable turbo for now, until we can figure out why the power figures
 	 * are wrong
 	 */
-- 
2.56.1

