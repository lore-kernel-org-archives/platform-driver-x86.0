Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24792F6904
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Apr 2026 01:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775352882; cv=none; b=KEISDbej90z6r9PCLtyEhjPrEippoB6a1WAvIw7bXj7bgracWNbe4ukHTevvGPZX36D01svNYJ+kaVOxxvJHpXZgZimsVWroHo7dxjx6TGzjZEHqz+dlwaXdCSqfpYh5TuIraYc4n2vB9QCrD+/tDZjKO9zD4eRHaQ9oDVigpow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775352882; c=relaxed/simple;
	bh=BTO2POdT+ipv2cFphYkQKQn1cemYVuShK07SuB5qS9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l8hAoBsnjZOE7dZrZZoZHa0bUQQvdGMQsIy5qZrnsQqskXijx1tozuAqnLz1YXWStS4A9w1TxeKA8/HqXbosQZA4t+VCbbs4guBYOL4k0dInAcjVTbgPiA1oeTN6TEI0U71HlhAa+Vzp6JJNxfF9+H6g/J72OsRnLz7NLGyJyE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKMiaVbH; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKMiaVbH"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c766cf593daso2052215a12.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Apr 2026 18:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775352880; x=1775957680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTO2POdT+ipv2cFphYkQKQn1cemYVuShK07SuB5qS9Y=;
        b=XKMiaVbHE3nmeuZDskkhMfS8qBW8h5IOjwR7yrfdWmC0TywjzKCLdIj7MhOKEuvrJ1
         9PamdgD2mxUvH8LDBh7VVJQ6mSwd4amtKRq4lDvEerDBATWdkIXEcGsJurLZ3HROL/ip
         35gOFYk8U4tSKu2wVxfpPwvCWRHoPlQ4tamTbC+MVNGftHUu8yU0sKP/ttWMV7AYJgDV
         tu8nKPPpF1t0HlRYjBDSAHyEfr6oX8/UHB1fhHr2LHnGwybWHUnHZv6q7Dx562dKqDFM
         ORkl1RiU5paU/XsYpHc2R/hzcT8nsSwCrIGMJ8NkRv3aVH3fIecNcmaGfHcIju6K2Xu/
         yCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775352880; x=1775957680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BTO2POdT+ipv2cFphYkQKQn1cemYVuShK07SuB5qS9Y=;
        b=StNNGZzzKe4JJWo6oXL74f38rQCkf/btgFQrOUZ6R/uf36I1zGnS6R7FeqmWmPJrLM
         54pTbDmLDf3UsPgU8HVkTbiB5ZkHWJiLhNy9nWAG7hrdfTsOnobQS5iwJ8yznYYAMH+G
         xyESgp3hU5TqdMO8wRWixOumQYSoYRT9//zlSACMF8QQQdaUt1aGrOd4LEA4jtjjFUJj
         k+8yVXUhNaybZ9ZMaLaNMnsSDij6UGI+bQlC4vJph2iRwOPUiTwAfuWtfjuQbFF9y4vh
         UyJzUy4m+QWXPcL6cc4ov+/F5enWEHCfR1iIDPET4IgUSZ3XJVOUIR77cbTL/MmoFimH
         zpSw==
X-Gm-Message-State: AOJu0Yxc3kOtuAswhWBnEJeFzxXu99h/5p69mARWHyLLUbONipjso4ns
	YAtjLG2ViVEqu1kT/cSFAxiPe+Vd2gaTwm0xHsKYC1IsJewlEkZLhLgD
X-Gm-Gg: AeBDievlgVB3vG7ndm0A41xUE1WLiXwQ0blXAmxFFMsCL1DzHDMzAtHYQNm3M95YDAY
	w1UDhoY4HvUz0MTxG3jI3vuOMghgeMRzgoQlcsLiBtI8Cu3ZqVA0fgYh0VKfea318NOjhxUPRKK
	RWcQ61iJ8OX59tPkAHQjHkCor3kBl1YiPkHEQ42h70ta8v8g2cCBOc3K3wny2MRekuK/d10l3dl
	/qfNISoOrd/QHsMWkAlyVo7ThlrERFpfjsHetaLtXoseMg2zCrW5nvBeAHQzuiiVaxbBOBF0hZ/
	EDndTNGgAx6FY7NUyLdtBUL8LDm8Q5IW3zHUZ3TYd6Qi0swzDopGIDD7v9S0cB3v0A6p93B6vKD
	jRAitlt32/ohK/MVLuVnTSvXJvNpskItqtZaC14oNn9dAVuXlZ1LbwF8Hv6m2zGUvFi0cuQZpQX
	Gl6V7Buzi6miPFc0tEdzs=
X-Received: by 2002:a05:6a00:1408:b0:82c:d986:e917 with SMTP id d2e1a72fcca58-82d0daa3c66mr7092983b3a.22.1775352880043;
        Sat, 04 Apr 2026 18:34:40 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:7ae6:3380:c4:fb8c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b261b6sm11765724b3a.3.2026.04.04.18.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 18:34:39 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	djrscally@gmail.com,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: int3472: Handle GPIO types 0x02 and 0x12 for Lunar Lake
Date: Sun,  5 Apr 2026 07:04:13 +0530
Message-ID: <20260405013413.31970-2-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adFssnMzgbvKW3Ul@ashevche-desk.local>
References: <20260405013413.31970-1-vasuhansalia05@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasu Hansalia <vasuhansalia05@gmail.com>

Thank you for the feedback Andy.

Could you point me to the series that is adding STROBE support so I
can avoid duplicating that work?

For 0x12, I will add a proper define. Based on the OEM kernel module
behaviour, would INT3472_GPIO_TYPE_AVDD be an appropriate name, or do
you have a preferred name for this type?

Regards,
Vasu Hansalia
