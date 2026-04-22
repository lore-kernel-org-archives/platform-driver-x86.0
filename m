Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEEC3246EF
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 Apr 2026 08:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776848311; cv=none; b=c9qB6nFATxpsodaPQxC19mF2RMoQmNhmFFGiqoEdTImQmk0K4vyKIC8OoJdCj/0zVZFv41277V8Dau8kIIU1BpttSlqhnpnaWkEdX5mtOkU58ejnQ4/vfDWShNyd5GzTJ4Liitx8ZxhimFjWCSCHynhutBB0ywLx5OO4O07g8t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776848311; c=relaxed/simple;
	bh=d87sOmcTokHUTPnZf+NbkTViZfopdSpu42V98QWXKvE=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 In-Reply-To:To; b=hvQBz6pTpxXBfPtc4yM2NUpKTO1m0R4ma66RUDXmWcMNrrzkr26kzdV5UAgVeOjHEfQ4iVuOEls4UoAVsrNk+wwuYxAPJERxofXs848k1qqEJh/BX81DvbmDtFx4sficl9pXaHxQWU5oMqrdDA0qVrUgOByYydkXo5HvCjSxHOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5SaS3/K; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5SaS3/K"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8aca0469204so51180146d6.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Apr 2026 01:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776848309; x=1777453109; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:date:subject:mime-version:from
         :content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d87sOmcTokHUTPnZf+NbkTViZfopdSpu42V98QWXKvE=;
        b=J5SaS3/KtAiFNTPddJFZ11SQtgzYsKLOiUNRV8y8/9ANu1RYJi07igZDDJ+ZFtDvIZ
         AZpj/fidGIu5ZaDUDuEBFlLYwkhhSfUaflFQ7hs0ptqyWtG3A8LuwWB9KGrXUdfPX5K1
         0squYXuVPuoU6+nWu1P/BDnQj9T++15Z7wRxUycWXnEU9wF8n3XtQ954O69o6srLVqpZ
         AiRwWmh4iST7yjWD28wiPLjqmnyNWg/isohRA/bNjpIFuah6Dl95Jl/0fYSVyulsTnI0
         Q0v/zWl5fm2z0w0q5xEVvk96j/SQa7FG3tSGZ7rysxcw5Cklty1xg0UMN3RyuRTCzaKO
         M5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776848309; x=1777453109;
        h=to:in-reply-to:references:message-id:date:subject:mime-version:from
         :content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d87sOmcTokHUTPnZf+NbkTViZfopdSpu42V98QWXKvE=;
        b=KcO2RY4n75D4jxG6vFH78eB0mTvnAJCZOQYoi1HNkuYgD6YwbW/19lUHfx7SwYbLZi
         qUkU9NXx1ydxWD8SRuTxorz9NcSu8gdtWzZ+pOFudXoATKTut0xD0Yd4MmL9f9yKqyXY
         IrUyB/R8HVethx9GF+gWU9/r7NzoL/z1la5hQabDjJ10YSjceFlfzX71PIR0WliQoPgt
         RofunaDg5pvq0IyJNsPToF9rSKDQpoyFNGho6U1HYjIN6QaxLG4a/8dAuddIjoc/GnpS
         9SHssWFN+fhCnIxOTS85OZuMqCr8BlsAuir/076Ym83ya5wsBBgASc/jWrsqjrq9jhfd
         6OcQ==
X-Gm-Message-State: AOJu0Yz9yxcEEesBGjAu/FNkkLTjztOwn6icv9t2bUChTZ9qfVkqfl45
	tZWFbOm3U5tUqMB9TizO5N+yl08RgEn16/vhAeTCkEB2AFYdKbjW+Na5OhwIFg==
X-Gm-Gg: AeBDiesdQWuZyvyhO8grSwBKQ17hYpHJn36cxereXrs7J5deOiQakcSxtQgm9C9Q7fF
	oqZuSJxeRJVniD5o529gy47gRXkHajY3ORUN1n5R9bukgZbzF1NcY+oQX6d9WllMKpkr4JqFCcH
	VK52fyUGYL/Qzcvs2CqHDNAaa/P1sS7tZ/Ngwxaghvb1/X05wJdfBASm0VBIzxfLxNj6fk87hoi
	GSNcZ8Eo4XrB6YXadIL8VAdutRJHBkyUfJ0VPHiiaxyLrW54gF3UftmUB7N/yFhtvJcPARUbF3C
	0jr5faKmM5lUE3QTbgXEsWA3UlZ1dBYl1mlorQccVUt3GhcGcSAxf3mQT1kD+nSH7jfoyGDnMoF
	8/VvST8ifivNn419k91h9A+/Yr1k09G+rUBL0LiY2Gh6MJtnqtZD8EZzL/9fnVY5na9rHv5cw2r
	lxw5sHthK4/En9JNaFhk1RwRB+bKDjSuBCC1Ukna7KqakqpoSAC2qA6vUcNrcrVe/unEs=
X-Received: by 2002:a05:6214:c8a:b0:8ac:b9e7:a969 with SMTP id 6a1803df08f44-8b02803ec53mr344677856d6.21.1776848308739;
        Wed, 22 Apr 2026 01:58:28 -0700 (PDT)
Received: from smtpclient.apple ([2600:1003:b115:ea8f:c9bc:db06:3f44:8235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae5c44esm124614936d6.27.2026.04.22.01.58.28
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:58:28 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Ben Young <benj.n.yng@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: hp-wmi: Fix thermal profile board classification for HP Omen Max 16 (8D41)
Date: Wed, 22 Apr 2026 04:58:17 -0400
Message-Id: <F31E9DCA-7E18-42D9-AB70-EC6256188187@gmail.com>
References: <4ae4d7f9-f1db-4394-b0d9-c75dc39afcf8@gmail.com>
In-Reply-To: <4ae4d7f9-f1db-4394-b0d9-c75dc39afcf8@gmail.com>
To: platform-driver-x86@vger.kernel.org
X-Mailer: iPhone Mail (23E244)

Unfortunately - the fans do not change speed upon terminal commands. The HP-=
WMI is properly loaded and recognizes the board, but appears to not allow an=
y level of fan change. Do you have any recommendations? This is important to=
 HP laptop owners.=20

Thank you!

Sent from my iPhone

> On Apr 21, 2026, at 8:18=E2=80=AFPM, Benjamin Young <benj.n.yng@gmail.com>=
 wrote:
>=20
> =EF=BB=BFSubject: hp-wmi: Fix thermal profile board classification for HP O=
men Max 16 (8D41)
>=20
> Board 8D41 (HP Omen MAX Gaming Laptop 16t-ah000) was incorrectly added
> to victus_s_thermal_profile_boards in kernel 7.0, causing hp-wmi probe
> to fail with -EINVAL.
>=20
> The fix is to remove 8D41 from victus_s_thermal_profile_boards and add
> it to omen_thermal_profile_boards whitelist instead.
>=20
> Tested on HP Omen MAX Gaming Laptop 16t-ah000, BIOS F.21, kernel
> 7.0.0-1-cachyos-bore. After the fix, hp_wmi registers successfully as
> a platform profile handler.
>=20
