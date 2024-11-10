Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB28347C7
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 Nov 2024 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731250472; cv=none; b=Uu1vld+m4mRma+CsNr//vtowWoHw8/KroiKG15PAlFivgYRC/1tDGlvsz5YLJZdtCZlC++pRwRGIqelILCicm2zdy+Q5WK6qUt8mZ65zVFRvRpnoj9ILRCjyI+nyKzbmEXCdt8FLwLBQAXCuB9ekkkESiLZ/Hd/+uTnRDhOP7PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731250472; c=relaxed/simple;
	bh=kWw4wSi8bvuDMOKm+lTLJwHNVj7JsUG3QPb6/0RKBzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dA11A2ZVolQOQ3ggJaCcvDb9bW+W2CCNPio9MXulreJ1oVzPZaEUMuEI3p4BfzeUUr/5HAV7oXqRZ+uXjZTNQjxLUCl+zDDob6161sN30KqUy5FaVgExQa22CLzEr//MUL+FCG92hR6GQgaVdvF5B4UXePdw+yCMYZcwOG9SCnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUs1ETfE; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUs1ETfE"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3807dd08cfcso3547047f8f.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Nov 2024 06:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731250469; x=1731855269; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWw4wSi8bvuDMOKm+lTLJwHNVj7JsUG3QPb6/0RKBzY=;
        b=lUs1ETfEJwBg84DGo2DlqziJy93aGqfHxpKAR8/TBNmVUg0SqkXufrLqZdHM0Dv9/x
         Wuz75nXq6Swbv2ZF2TvPrtzHZIPq7+syzcG4dmNzIizltqkksKR0y2DdYCPHQFoOEKwg
         DuoW+/33nub4J6Krg9ctbP/lbleZ8QygxGvg+ATwwcPIqhciTMyie5tCZ/BlD5zpwRr2
         SROEUcqs/yV1b4fafB8GmGkEHtAaAHLh/2tqiH57M2lNipS8h82GNrkczQ1WfiPS/vjL
         +HEx6ZR30MluEnJsHuEwRnZpkAhoPNOuHfR9UdH2kYdDmgJ47bZQDOPobv3lDUxPTdIh
         2+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731250469; x=1731855269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWw4wSi8bvuDMOKm+lTLJwHNVj7JsUG3QPb6/0RKBzY=;
        b=O5c0RG+pqy2XJzbTZMvEiGYSPoEGzcjtDMELBCflnFrbqkjB+qo4OH+8q4jmWaj5ln
         HlXRwirhiN/nGVgwdoDlcPE8PKTcw19pveuqppoSqd9ubzDnMZsCQihyfLT/Of/1mMjH
         K8x/mbtJO0j85RZLJznkEEFrHkrMepuGyeHKQ5XFHlmdW3XO12eIv8eS87BgMYQwYfni
         HGmmkMM3YmsBtDJpTRRGO30ehGcmea2LnYu+0itNudqX7zx/jwksbMS1DnNX4p2S+lnz
         GiFdzl0/0rn4O5jqeoPpMtDgvtHSGTu+Hqrbw9nYO5Rlcyfg0r0WYMDosUSE+MajxsXm
         ofBw==
X-Forwarded-Encrypted: i=1; AJvYcCWVIBLk7+FCCIlF2SCHIJvjOrMxqFZpxBrcFY8hA9Q2gjHYHPvRtFAienXNhBo34+emHmzYYRiLM/H+NMQ0aahiOznk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Ssvf8F+0TsQytac+dhA0Vf2pApkQ9DAnnrMloYr1CbPcVnuL
	C7k1NLdRQZMeklJEn0psiNvAIRK4Rl1E0U3R6Vlgv2vShPXo9T5XYDOnb5iO1BNBL9gkiudv9n0
	LWYfebTOserPETbYbe7OXQPHIEmY=
X-Google-Smtp-Source: AGHT+IEUZZ3D5R/8JgXIpEAOOz59aH2J6ckoqF+YubJFDwxXLlPupmoGcSBGriX74GxkrzO8zOuLaAmnF5B6KNxHnK8=
X-Received: by 2002:a05:6000:699:b0:37d:43d4:88b7 with SMTP id
 ffacd0b85a97d-381f1866b62mr9615360f8f.3.1731250468948; Sun, 10 Nov 2024
 06:54:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241109220530.83394-1-hdegoede@redhat.com>
In-Reply-To: <20241109220530.83394-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 10 Nov 2024 16:53:52 +0200
Message-ID: <CAHp75VctE1TYr-vREv+3CQOpNRpuS9XD+HhEAMze9GDJCskVBw@mail.gmail.com>
Subject: Re: [PATCH 0/5] platform/x86: x86-android-tablets: Add Bluetooth
 support for Vexia EDU ATLA 10
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 10, 2024 at 12:05=E2=80=AFAM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> Hi All,
>
> Here is a patch-series for adding Bluetooth support for the Vexia EDU ATL=
A
> 10 tablet to x86-android-tablets.
>
> Due to the LPSS UARTs being enumerated through PCI rather then through

rather than

> ACPI, this is somewhat involved. Just like how this special case needed
> some extra work for instantiating the various i2c-clients.

All seem reasonable to me
Reviewed-by: Andy Shevchenko <andy@kernel.org>

One patch got a few comments, and I still think it's better to move
the rather long functions to the C file at some point.

--=20
With Best Regards,
Andy Shevchenko
