Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FDB149DF1
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jul 2026 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783866884; cv=none; b=p4m3fzSyoq/oTffqbBxF4wJGYYqNlkOT5qPtjlgcZs64wEAKVsVOtxp31aBceHcDhR5Hr3sKi61Uw9RJx1D3OA1SQb8juebx06FZXBjN+H0v95Jh1qbhpCIS+ZRhsz7XTqJxIoMVX0ZPKHN0NA05t41ZXOP3QgDemvjyCpXAVzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783866884; c=relaxed/simple;
	bh=OuMvMBGS0bZ0mLrjxPk3b1aAgCwGaMH4119vIAcG9FI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KmBlDRZ+MEiBh48b5txV80aAgYu7uYPVQjE5Se2ysTdtcMpci7OAH4UphmL/wfQvIwHWzyJmmZrZyqnGD9Rs/+xKwtmnA23Z8q7uJVlL7jU+ZOfm8RHE9vOT3fIOb+/GJ0BCEMHsWqTk1UxuoJW1AgOdXBNGEHgPgOIKBtfBOQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dewqFQ06; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dewqFQ06"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c83acb86eso22534551fa.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jul 2026 07:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783866881; x=1784471681; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+q3pesqHhVPoH4qHl2fMkGfEscAydEZ1ZV/KtRLR9A0=;
        b=dewqFQ06rqQOjMEje5h+f54RWAtuTy5O0hx9+QNdXGr06YeywDIdKG6YuG1a+bQmie
         +9kMPJQwxzPrB+oputSaSBfGJJAe5ZkS+5aHinrFnzbfgtnXN9rvaVVun0wmkGOIEtem
         mrRHOWoQnjxm+SV9nAad+MiS8wa5vdZPo7omryU+BdgHZ28MOD8br51SZFOpLv5Ylq2m
         pRD0TArVuub08vXz95tOKMmSDOx4D31lizCSSZDvrXW+AqeqEwsgHVQlXMqu1C/TAVUf
         dTTIusmvwiJXjjRwSuVl4Erq5WEnVvdraqbKCaei3bwWlMhyZFVuwo3bm4I6gxz9Gzr9
         Y36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866881; x=1784471681;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+q3pesqHhVPoH4qHl2fMkGfEscAydEZ1ZV/KtRLR9A0=;
        b=R9ToQb5SfyHHPInQlCZZWVjlZp3oLP58ZQmIKwuQR0i6/+2G6KGiMynvTLaqi1nLrG
         E+NQVL1kt6MoBZOe2WWNOeUcmRAdh67LlcHzZY67TT/SDw5nnB2hMZd2KyM4dmmwDhJ5
         d8evZS0rux9VjI2LGZS0Qtd8/2F7uT9V9sCEhMznvhSjoN7naWOSuut+M7owbEwnZsTk
         Tq/5zz1F0YYmkDuT6bsVjetsJie6u6MgXkk1acjI4H60L+mouPbhHxJNLL96NMlE4Sih
         5v+MVpETeNUWr4YhQr5wcMDCWjr1EPDDpTZ1FPLX5s3yMy/cSqraiUwsEE0+KPJjRwac
         gltA==
X-Gm-Message-State: AOJu0YwCT84xUibTHn+XlYOox9WWu5srGp1XC96VtdVP5u+RPBJWXrdk
	oZNzUpDvRzOyFbKNm1OUe3MqzO7FQLc0AsVdbvgb1tdX6RfWYxgNPdBmmZSbTbkD
X-Gm-Gg: AfdE7cnoZDRt4biOgn5TKaM1GxuvE8Bo1R/GEuZaYaZqGD8WbsemX0vFqBSiMza1Jp3
	Ujw+1Nj6xnE5on4fmhIqnoRuQ+2a1trA88QtPrTG0/8GVZwqXQ4THIUWElqImsWWlV0fc+aBmvx
	X97Mn4fmaZp+PF5Vlx7KOvpXY/WkfPWGRHlZ5wg2P34x1xEkyEYw/S0+kuXiZcu6Y7IoXjcn9cr
	HxtcqHppSnVzlYntE0fj5wwFfwR+y3iKGJP7DhNDVQL3I/GiPgA0knGzGaDNMzDF/MyQ4wkikd4
	Bf9jEMCWpmkhqvwV1Zh48Un0FCpdR1DX4GoFHYJJK6rqAjWKRbRQ/SruT/zQwrGFtPXnizvlQ8r
	Bmr8miuN1MW9ZSTAns5dHEXpR46zCGPpZyDUDQJRB7owxNO6jqlHGh2PHMQFTDhKMMaOlkMjX0D
	I0I8Lgy2YusTo7KZoE2fW5K9HJYFtGxyTMpFFY6LhK4fNf/AboGAdYZ23add417drdHHHQIUtW
X-Received: by 2002:a05:651c:2122:b0:39d:4014:12c9 with SMTP id 38308e7fff4ca-39d40142737mr7918771fa.9.1783866880685;
        Sun, 12 Jul 2026 07:34:40 -0700 (PDT)
Received: from slasherss-ideapad-l340.localnet (public-gprs314626.centertel.pl. [31.62.116.67])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849180ddsm21344571fa.3.2026.07.12.07.34.39
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:34:40 -0700 (PDT)
From: Jan Szumotalski <jszumotalski@gmail.com>
To: platform-driver-x86@vger.kernel.org
Subject: ideapad_laptop: Add platform_profile support for IdeaPad L340-15IRH
Date: Sun, 12 Jul 2026 16:34:38 +0200
Message-ID: <OSEVhC5AQ9yvDspKVkNPlA@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hello,

I am trying to get the native performance mode toggles (Fn + Q) working on my 
Lenovo IdeaPad L340-15IRH. Currently, the ideapad_laptop driver does not 
expose platform_profile paths because standard DYTC methods are missing or 
failing.

After decompiling my DSDT table, I have mapped out how the hardware handles 
the performance profile switching internally:

1. The Fn + Q event fires method `_Q13`.
2. `_Q13` modifies an Embedded Controller variable named `SPMO`.
3. The current state of `SPMO` can be evaluated via the existing `HALS` 
method. When `SPMO == 0x01` (Quiet), the `HALS` method flips the `0x2000` 
bitmask flag (Local0 |= 0x2000).

Testing via acpi_call confirms that evaluating `\_SB.PCI0.LPCB.EC0.VPC0.HALS` 
changes its return value by exactly 0x2000 when cycling modes via the hardware 
shortcut.

I don't know how to implement it into the current driver, but I am willing to 
test any fixes on my end.

Best regards,
Jan Szumotalski


