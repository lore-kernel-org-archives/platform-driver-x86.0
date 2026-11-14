Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794622119;
	b=NP4bUEL4VDLJG1XiTZMbKvXsazOV3eTP4FVKMplb4bFwarWrHZaFfi9scVSTLp6iGFnn
	 sve3ClsDUPcK/ZWj/IhzYUB/l4Ur1Ex5TJtxLkFgE8dPmF8b2DAjYqOSKoLQskga5FJ26
	 eU/BmoTOJCToE92ZAKPuJeSFpKdoWVpWxgkOJSL3npcfYNQJulSySoNFqjlzBjSvmoFd6
	 XzITzoAiDYdL0MskCxhNRgUWviGuTuFnDmzTPwetVUv1JZ/h1sFjP3JNi3T4+jC91jfbZ
	 CSjksbPx0AMzXPGGCS47t3eDtACNgJdHycQkQs6pFNVqEf2MQYtBwGAl5Eala6CL7cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794622119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XeTY8NwbUCIb5XggB4uHl0AKr+krf2v/zuQTgZl5q1I=;
	b=rfEmK7M5z9BMWl/K4FuhSJ/6oEpjUy2aiYu6zU/IKU578HXellTHskTvLExqejmEBLxg
	 Ye39KBgqQQTsT7sW1VU+xVhSWURoKCRAhOrjmpFoQhwSo9MzXVGf9Gkkp6/qyOGJ5a7w4
	 m7OAPIPHPkXClmmRUtYtFHpGdwgHfdAJr0/lf/WDcHQ7e2k+oHU/P2E9bxoibt9Syihdk
	 mM68ej1sHn4NIo5u/w1cmLFMWfh2Rw2YYQAfmqxE8yN1wIdCSz4uxRI0EWDr2Wmpf1J7x
	 9KHmIuNuJy8MUBUZPt3nqEGpwX/5Q1y7CsQ6h+/0A/3JnXv6WDHVG5eAL8XnvL8v1/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uuOZEsG8;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77706606A89E
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 02:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77706606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uuOZEsG8
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3704d30b84fso2147127eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 18:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794622108; x=1795226908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XeTY8NwbUCIb5XggB4uHl0AKr+krf2v/zuQTgZl5q1I=;
        b=uuOZEsG8WWZxqYAyLJEbOteJLzRbKeB1yMqlQVeytRpsEwgTVKMITpypNt3OnidQoh
         pZCQk0AvcA4scQvJEQ47GwY1deGsW3iMJea2R/8w9RkuFQfsJHfbOn1jpzO/wskJ9ule
         B7tJFz2W/txKyLhqx3l1uCgrgj0XHPur6PYwJHuFOlt1py3U3+H8XizQeUzZGEPuqWMj
         iPG6MenxfXP8YXrFUG9WCRk0OEsXbFgKJSVeXHmaLQEH6LhmJGOSXBKkg2kVEDGaMHVa
         AWT3UjUM9aoW6kZsophhX16E+Ked4761jH6+GYO0zxj6eE89xCJulsQf0MIVTL9/+9Z6
         xGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794622108; x=1795226908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XeTY8NwbUCIb5XggB4uHl0AKr+krf2v/zuQTgZl5q1I=;
        b=SpNzmw12NTCsgIs9WZvw2pI5sebkZuDBqo3BS0CYxglx6YoCazCI3LuU8v+fR+pAAw
         kxNcKXADqoqMunR+o5KlO/l4QwfUJCnD3wzf27JSSRmGU7P02TT9nmy9aZTXhUEAE1xp
         ImiC8Yvmbf9tUIVOAkPTpbPuw2rcWAbSXKwsCpMYXUPqh0OD4yKa0udRgTzo+AiQeMen
         8kc5m98HaXOAHP0iFV8qHYH2LxTiww210uliF4gwy7OXxj1TjQ2CF1Rv9jyfl8nKFY/i
         6PRg9tYcIRuAZpTBySi5ZubDwfhr02/us8b/0JbeP3aZlkEO5p69RAH19ItdNK9dSFq7
         0wCQ==
X-Forwarded-Encrypted: i=1; AL+hErFX7YKztMEg3RSVHMX832F8/abfLzg5QJM+5Pw+sHuJMrSz8AboIZUejRmLt4bZETh6Vk3q39Ph5h9W4Yc9T8LM7uK7@vger.kernel.org
X-Gm-Message-State: APuU4Z/d5ytgUfzmQUUbYHskKwM/Utb/OTi03eak3Z8aFnokfaqzCVg7
	5aEusfDXf02x3oXKjZLZPaQOVKNN16g0tJn9b/o1BUKO2ZflPFYL5GsJ
X-Gm-Gg: AYBFou2uPuQcOsttjvUC5DzWDFbU3VWfbmegr8mGb+v58Xj4RN4+iw/yrrrEr3nWf6R
	jT49K/BXEsyBzlqhAbsE2Y9WxeC6oTHT2Hll5k/AaobAWqCoLRzRgE0Bh+I5FMRu+BHa+4OOoMF
	cDVopQmY4nTjRL3R3zptdY0ctbZdIt0W2tbePWygDtvfMCvwvP0Q6+QGcVSVUi5QxJ1ocVYQpBA
	D/OUxcTNzpTIJQmB3ipSlqoIPk707SKHH+ls8/SfFTDzp/kxDw8RM06DTwxbcWNCG7RfWq6Kx3+
	KAJZdbY+PInmLAPGfamchuW/vpH+TBsrn4eFUoND3lbKIkD9/wKZg14CidEEwQmBCcZoRk4SkLM
	JDNSS0uJVytQi2kxsIBTWPdD8LHl/U1fSRhWpN9+vdFbd2ZBDEriCcoK7ON/dlXjjCpdToONtLN
	9FBI3IK/UiiEhvHZ3QSK0OZObjcsaNmHLwj3w89wmtrriSIjD5UrFLbWWf1/Jld5UVUff3eHQ5v
	GDlDgNhfAgeT1O4DMi8tMQqumyTOy/W1HQBbnpMUgNpR1w91b4brKidIRcH7TWaitja4z0y/FU4
	gplnRl8RnSfNi8pShCTVpCsxbkxeKn3mOn1frwDPPfQjuOXDHVPUSQyZxFI0dx1QuUn9dPSwVm5
	0bNj386bAb+yS88ml71v8P6YNj5483F+/yC5HCu1Uf9h9HzoM1UCKSL8fZIxxR9qA7q6FQ13yTn
	WGZb0=
X-Received: by 2002:a05:7300:f544:b0:36a:1788:3d1c with SMTP id 5a478bee46e88-3796879f0bemr4131136eec.34.1794622108507;
        Fri, 13 Nov 2026 18:08:28 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm18875218eec.21.2026.11.13.18.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:08:27 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/2] platform/x86: dell_rbu: make usable
Date: Fri, 13 Nov 2026 18:08:13 -0800
Message-ID: <20261114020815.75539-1-rosenp@gmail.com>
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

First commit updates the API to one not disabled by default on many distros.

Second commit fixes upload of firmware more than 4MB in size, which is most
modern ones,

v2: remove Co-Authored-By: tags

Rosen Penev (2):
  platform/x86: dell_rbu: Use the firmware upload API
  platform/x86: dell_rbu: Allocate large monolithic images contiguously

 Documentation/admin-guide/dell_rbu.rst |  25 ++--
 drivers/platform/x86/dell/Kconfig      |   2 +-
 drivers/platform/x86/dell/dell_rbu.c   | 161 ++++++++++++++++++-------
 3 files changed, 131 insertions(+), 57 deletions(-)

--
2.56.1

