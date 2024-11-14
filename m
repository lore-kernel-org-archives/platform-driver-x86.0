Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92E5198A0E
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Nov 2024 20:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731615575; cv=none; b=mIjHlIfNiiar9Rae2V8dF9HC61xu2n7isuZ0LhvaTjBDCnqSC8qZyyBcU936tlr4/cIYoYN+rJCgVUGbJL0zs6T4Ho5fAyMojmrtNs0a4HJvCLdv69E9AbkODNnt1b7LZDbiDp84Yvbe1FV+lmcwnHgq6sSqthhl9x2LCxGDUPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731615575; c=relaxed/simple;
	bh=Lo3mCaA/sIGR8lafFL6H+F5qOeZm3SBd8+sPfp795HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7yniwkMlXFp5APurmR1w78Mr2COLulDlpT6yqNHOh6ooDYiNy2o/ljSAAvbHjqxi3jv7q78+SsrZaATm2Dh+IBeUXWHaxwIpL/7mzELQrzbX1KE9OA9DTxejhAalczklE54Vt8n45FpVaex2KlMyrWpguQBjWTcZD7ZRLHfowY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0H/7JKf; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0H/7JKf"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9ed49ec0f1so190063366b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Nov 2024 12:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731615572; x=1732220372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lo3mCaA/sIGR8lafFL6H+F5qOeZm3SBd8+sPfp795HE=;
        b=O0H/7JKfm75YS5yA1Q2oEvfw1HQtViZOl2BiFn3Zui3zOsM36k/achVb6jyHlSaiEr
         wHU4onQeCKpoqQBZYUzSLqGlGEQ+nXd5i4E+9k2CR5EQIcv10tyntsb3D8nhmzWhyt3J
         llaVGVHmU9VUlLunEnBjApJPz5xAD36l5qCGuU74zT21N1QnxhYk8ZrlTG38R64D5yyk
         EYYl8ihUptmLXXwEXIoIlYPFgbnMsi6OazcvReyE3APY3NR10Oz038tgC3KHmqwFiSjv
         dmG39m4u8KnNuhMfIGyISWU5Hc6dSC2Y5TC9Cg5rWDM2qNNoDLhyAJayqHbbTm5pPhjg
         G4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731615572; x=1732220372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lo3mCaA/sIGR8lafFL6H+F5qOeZm3SBd8+sPfp795HE=;
        b=b3xMjN45y7/igBNgB1nwi5zqygEZARzAuW4aYn/S/tY+KAPAn4cLj/Z1Lhz6YZYoqG
         rMS4gPFxL5+rSPFyFisq6ZtTGCedNcq4Na4leEriUJg8e78FL6BxCTmlz3nDEBOn+Ttj
         qlZfRIJ3hujxX6mih4g3TOU8ZcroOwIjy/bgoODXmAyWn76APOsBapUqgo/lgvZ+lKYB
         kr4Kk4Yjb/ODbIn3I/nfkbLm7vTD/modERx4pmx7JcTD9rr0q7HvFA4vhrqxd41KWNap
         Jcc/4Sr53VX4MosD93ojgMSbaG3B2fd35y29XX8wFOCbXkPU3JSo2M8//vlWSm6xklQz
         e+Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWzx6T19MPeZxiG8A5IK530QaeB9sYU1imL/IxykQUMaHlbc6fby/xdLs1+gGXYC/WX0vAHodYahbHnB8g8YcntbPxE@vger.kernel.org
X-Gm-Message-State: AOJu0YwSeTc8xjy3Zqd7OMhJdygQITcziYqqQps3TR70yPyjtwP9eD+g
	FkeCxdEkvvkDlfPrb/+WdScnWoTS+feL2yyrqWXBtcOiC0fM/rhtgLPlW03soQculV7rG+AlUax
	hcGUPf6xQwsh64r5s+hrb5tzfwdI=
X-Google-Smtp-Source: AGHT+IGIinSoznZ3CYPzgTZa7pUfMrjxJmIpg9VI7L+iqceQdc+YVnb5GQZZpT7O7nz65lrjlaas8Z8p42+aavXTH74=
X-Received: by 2002:a17:907:d29:b0:a9e:b610:409c with SMTP id
 a640c23a62f3a-aa48350999cmr1212966b.48.1731615571728; Thu, 14 Nov 2024
 12:19:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114193632.110062-1-hdegoede@redhat.com>
In-Reply-To: <20241114193632.110062-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Nov 2024 22:18:55 +0200
Message-ID: <CAHp75Ve3wWo7jTNB06_+M+kcMqi_+gjmXY9UoEwjJ8XzW5ev_Q@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: p2sb: Cache correct PCI bar for P2SB on
 Denverton and Gemini Lake
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 9:36=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Gemine Lake (Goldmont Plus) is an Apollo Lake (Goldmont) derived design a=
nd

Gemini

> as such has the P2SB at device.function 13.0, rather then at the default
> 31.1, just like Apollo Lake.
>
> At a mapping to P2SB_DEVFN_GOLDMONT to p2sb_cpu_ids[] for Goldmont Plus,
> so that the correct PCI bar gets cached.
>
> This fixes P2SB unhiding not working on these devices, which fixes
> SPI support for the bootrom SPI controller not working.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--
With Best Regards,
Andy Shevchenko
