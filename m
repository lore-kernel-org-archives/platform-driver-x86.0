Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE3C3815E1
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 17:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743909; cv=pass; b=CrwhLHX4BinBZJAOayHR9BEOx0zooLjdtRyByDwJmukXwmWQxrKdWq2RAwZyOlYuFNske8z/B9xM15vckN4ecpJ5IOG/VGYZU1UxODz4gRNrD/2F6c6AyJ6Dlq+uJPn85z7oLC1r7+p/AborOiphmLF7YPkYg2qsjTiZg/z/FnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743909; c=relaxed/simple;
	bh=7WnklQKwtUdTSIRN4U3QhmYW34d43G7HcFFXxmCxRZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PS4glpL3dUgJAyw86PKa+JMf1d0TLBl/IEX1B+7EFQBAkVkajCSbKWzDNsrWXP6us2W7cuGpyI9UMM44zFap1J5+cAy8DRYc+4izUqCR2/rgcZ0+QcbmSjsGU/NBxydhBFoK8Jh3vhiqNRGdzbqhV27bOoRZF4bWvbqhlkUoNNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9CWhPjT; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9CWhPjT"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b86ed375d37so122277666b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 09:18:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770743906; cv=none;
        d=google.com; s=arc-20240605;
        b=BMLSISIPheZMGsEanxQqwH5RBRNyzF4sQ3MsPkaNSeOJFy9/eoj/F7Hhsyzz0ZC02c
         OJ6ON6Vfq84HhkEsgRyT5HPVO8ne6HchAwieTENGb59SroOGs4+cCZrL6OTknHzoklbN
         DbK/YtsF5n+5svbXPtJbWNn7lw+1PFX4IjAw0ziCB4tu7N2PD17R3IaQGj3WqLAT2Lag
         xRUT6XJnHPUKgXEGQ3kW5xM/3TYAfiNNIX7udenI248k/HJ5uOSIZU7cwPEKmyvO3ntp
         OeNhX/wIguS8wSIOEZAOwnxymCGAyE1xMGCH3lahDdTXctTrKzScxFi7Ycllai4VOwTB
         FeMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vAfv4veSfCyqprnUcHKYtIl2H508y7M1EiobAURhngE=;
        fh=kshJHtfQGr4bPBpNbfnxSWdIuP+TS5iPsDe19fIoft4=;
        b=Z5U6PppMSOyRWuGbHI7kWP5HJKSY1cyIWCHWVUZTZXDkYtMu/cWGw6I8Z0yJGEfOAB
         FH4VJUpgf4ubM53kgjSPtGyaCJ1Bf71tm72E2pobLWrnTdNiDCE4dsf24gpRs8k4e4+S
         2gZ2+Nga+yuK2ge+WJVH1FR2jBEckRC+1v3EkJIi+ks+AQjRaj+JeA1aDVWsXmk4YX8y
         znqJj+8r+oAhkFKWO8S71+0XsWKA+T2wEBmpIy7giEaJXqdFunFGc7htYW7lV8o1F7hu
         DwjI+H6onTnRT1Cry73yxwyLQkFtgtZX8TMFNS9aQ2IyQmh2atrxX/X/Hgyb77KkOr7T
         I6hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770743906; x=1771348706; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vAfv4veSfCyqprnUcHKYtIl2H508y7M1EiobAURhngE=;
        b=V9CWhPjTjgsI9LLCKRipuoiH7W3oLPjzmUYme7gFPud5fh9MZ45dF2ps8dZztun1Y6
         fH1duqgLDKVxJFw/yCDqZ50E6pv2NxYX6DxHBbUehsW58zVh9esUtCTtf4fbGAR8kcUR
         +w75aceLGxRO9s25WT4k6FGvy+gU42hErIaz/m7bqEogD2A/6wcF9Oni1h1AZcq002gf
         xxHHO2i7cIf7a6GhsRo99M0mxxIEksMtmeHxFZRTzCznajmYzkTjbx2uaa709pPV1in0
         24vd2LhC5uWVF3V3eqB8aYWUQH8RXyvUM7niQhIU3c88R5rAEiANDGIAvRsR2ebqHeOb
         YXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770743906; x=1771348706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAfv4veSfCyqprnUcHKYtIl2H508y7M1EiobAURhngE=;
        b=HGa/RIpTkVbZi3H3MK2/UxgMTg3Majo5QDMj+tm8o2HByZxmepYnaCPsv78dCz/UxK
         jfhxEBf2Sq9mtu1n/QQJi1zlDnU7dBgnt97Nd/qWhjTLyVllpW7dOxih4AxMJLxdMBHF
         fnzVyAvZEZyTmZmXZkj9KbJVwBhMLXb5efeLcXTx6YnepL8J/9e4D4+BDQLfUmaFjFD0
         JZW3CWTYIj/NA5Af7gcZAnhsKEswO7AjxtbCg5SiQjY4CrjrsApdxa22TUggU2N6fSw+
         lp5vA3WhCmz15y1GVmQO23oYB6uV5t/gXObjf9aNlfj0gnfQpAMIHWZobCK37gVCe2zF
         DMPA==
X-Forwarded-Encrypted: i=1; AJvYcCW8A/RZlqDSLK+kS7XQYGhURXaMhWKaZLaVRGQkyiVpKVdjvMf2W1v1TJ/5NEGvZ/qrMp25InhYAIv+xeMgWIfbGbL3@vger.kernel.org
X-Gm-Message-State: AOJu0YzdR4Id4NkIf+nL14bvPfuxmkus5oBDP8XgSySkr8etTEfTuhlm
	GsYoH3aZkJOvI5Z6Gf5x6xeTMN40V6klgOtvLiObr2bhQ9j2RbjCYgVlRsp7BpZEXwgccEwhut5
	ShLm5Nt67XrekZxenzlSQn96C5q+KBWE=
X-Gm-Gg: AZuq6aJcV5c40AHPe59N6IVmVe1j41V8+8lOEVeD5FqX8TcZ+bYyrRR5TPlp61OQ6DU
	wgxc/TVJSEJMwRGHx1zPndhv0Rx4DnrrlHx776iWmH47cnqpdngjoJ2SjGVjd6Zuxm+9ay8BLtM
	TC80W1eTyP9hesoTK54kzNxrvB3q7AosVQORkdo3HtYE6h70C/olyznHK7bS/MDkbkNejc/IFLR
	I+AXTjh5wxlT3E1NXDaxrcDIRNobnX7EpPpNWGWmlLDxgeKT1AQNDVHZYvwkRk3qIPcUgU+jVMy
	7mFv4a8=
X-Received: by 2002:a17:907:96a3:b0:b8e:d1f3:4744 with SMTP id
 a640c23a62f3a-b8edf4139c7mr927177266b.55.1770743905839; Tue, 10 Feb 2026
 09:18:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920200713.20193-1-hansg@kernel.org> <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev> <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org> <978f0855-7d77-413c-892b-7ca9cb78e9ce@kernel.org>
 <aYpp_u5R9JefpLwG@jekhomev> <43eb01af-a1b5-42e7-ac55-53343a630143@kernel.org>
In-Reply-To: <43eb01af-a1b5-42e7-ac55-53343a630143@kernel.org>
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Tue, 10 Feb 2026 19:18:13 +0200
X-Gm-Features: AZwV_QjD465NqO1zZafpVCAlQ3a6_aEVNZQATNg9ML4RsqyaELPOnxuXJBd6f-I
Message-ID: <CAKWEGV5HTgV26NwfywWrnPP32gnepeWmBvcjOLsfJQxVb8xkQw@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
To: Hans de Goede <hansg@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> Hi Yauhen,

> > https://github.com/jekhor/yogabook-linux-kernel/commit/538313b69483c23afc455571ef638efcea767031#diff-282276fa1330b08656b929c6e956308a122423888b8f07a1d1045e61a813d8c2R159
>
> Oh nice you've patches for sound now :)
>
> Is this working ?  Any plans to upstream this ?

Yes, sound is fully working for YB1-X90 and YB1-X91 on 6.18.6 (there
is a workaround for broken GPIO swnodes matching in stable >=6.18.4).
I started cleaning the patches and preparing to mainline but ran into
the problem under discussion.

-- 
Yauhen Kharuzhy
