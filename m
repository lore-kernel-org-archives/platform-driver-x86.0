Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6E92D73A7
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Dec 2025 20:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766177902; cv=none; b=AczB4NKBfd1LRcKstCpE3Lgb5iSWgTzF6cDRjPFgrph/ceLecBJLTwvxyOpFoGSWAz4pfxhw81S2TXEuAV7hXLphrQLro+573Nu0I9kjcRhSU+W81FWHkT1/6SOQsg+oFnDIYaQl5M4OPFFCig/whsEpUlM1JSR7/p8ZJXL5pL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766177902; c=relaxed/simple;
	bh=GI0vwFm7IpACeuQ0a/1FT/Ls1BnVN0WU4IFXbwr2GMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kDeqc+mpsP6uZ7KOeGFGQdAU1tc1eU65EW/1trXaB4hLumIOoXW4zxht6WoqR9y9ZTeYbJjHNp4EhAhrJj3Ppe27fb4nWd9Q4ya1LdrDhJyHxwloXn8SueCx9BUFjOm1Xb63lzkGXS1kAbH12y0zE1C7FVcXPDPC/k/FhiI9wUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdC3FLXp; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdC3FLXp"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88a367a1db0so33827096d6.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Dec 2025 12:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766177900; x=1766782700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2mHPlSnjBcdFaDnCQucul1Ba9bLMUO55RhPO6dSnwA=;
        b=BdC3FLXpHekyYdRqG0JNkrtQ6VMJntaTp1wZIRDx2hilL3WSKFWny3Wv1Gnb0ge1RG
         49UAx82j1pjjMV484d/T5k7WbXe0gtm6tjJgiXlLKtE5yp46UzFkp9LtfXL/GOuPz1XK
         4uhut8czMFz+0Esm9wyXeRRSAYhFr8lEn+PDxegTyxdx4JXw5emDA9oJJJ+cQL4L8Vqh
         PJLrdTTDCMKNYYqkWmfprGFnCuEJ8asVmPXCAtX8nVhaWISRwOnHoLKaBUR+3PdUE4jy
         FxrJA3b7EUoh99qeaqmlMhy6OXUBg1HNO+aD8z82anFZ4VK+hMm0YuuxjTGmL8vi3QwY
         xipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766177900; x=1766782700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z2mHPlSnjBcdFaDnCQucul1Ba9bLMUO55RhPO6dSnwA=;
        b=d4chPgLff04dLZXRLM9WgQbB90lbnx9fpb1h6tj0xsndYluQGAtdGinNo6LYbEi0xo
         IzA3ga3F8JYasOnYaG/CpEpCdTcEt6zXp99mYh4dJlyNN0cX15W1pXpvzAHQXRG3n2k4
         cnlpdhdNjpcx2QulmEeygTK2D7roKTgHDQl/slP4O2rgsbEMe8v5V5reITbyzMuv1H6k
         4JyR/2NpDkCy97qT9aNgWPuWy4LgWGiinllY3iz1c+wgVfw3zzO5r/pGL2TJi9SnCXCY
         eMfSyzGz9k64TnkemVPzeKmRDmYvvl3LiJiMa6epSHX+FrTPRBnsGLHq/dcpBxh4QdWP
         H1tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbepsH5jc2LqiH4cTFzeQ/Jt7Si62FdjNjYRd9T7T6u/sz7cIE//fg7ezUqyVHjWZsdAWXerBoiMinEaYm5S6X+TAF@vger.kernel.org
X-Gm-Message-State: AOJu0YwdxOeCP6XQRQQ8MZNqd3EnMw28LA0sNJFyrpjcbMZp0x/wefY2
	DEHUwSUThw7jxnmtpvfwW5FmyY/S+9XNAc/DTdSy8lRQipXMnZYU2VWnVNmV5F/QJ0jqFqrEDjs
	Sw3kykXDNSYz8CzdBA+Hpiir14YMGCg==
X-Gm-Gg: AY/fxX6DfC3VC7hlr5Cia6GjQbvoi5ko+HuGyLfS2lsWOa4FR+t4HVTwvdcAnb8SKl9
	qRaVqtnksuUT7PeuZc8LUYrTQ29nnKu8vq87aCEHy9JZ5cAlS+PuJ9WEfUNtLbIiuaMrLDSlNTj
	oQ3ZZ3drgh4xFcSfWvUNRZcsGkze2VVY9OCDGXDSun1pmp4+CpW2Y71is00lXF/mUnm1Y7ofIVk
	04plFrOYX0kQ/7fu9Soa9Ok7k8Ruey3lhVAOx1LTuPk5jybNNXtJUw48kKXUSXQyHtpK/ExYWgx
	hY/gbB+3h/Y3+7nOH0kOtJoSOBc=
X-Google-Smtp-Source: AGHT+IE5zXTwVQxrbaPXQC3VXCOoLJhpKpR4tXpdb/7cIMJryLXfVsLBo2c1bVuuXPFjDhO95WFjskd8XdCTxgQXiZU=
X-Received: by 2002:a05:6214:459f:b0:88a:2ce5:a049 with SMTP id
 6a1803df08f44-88d8491cb3dmr66535756d6.62.1766177899802; Fri, 19 Dec 2025
 12:58:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
 <20251218-surface-sp11-for-next-v4-2-7bcf83c1504a@gmail.com> <9c7115b2-9f31-49e1-a2cd-2071b84fb85d@kernel.org>
In-Reply-To: <9c7115b2-9f31-49e1-a2cd-2071b84fb85d@kernel.org>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Fri, 19 Dec 2025 21:57:42 +0100
X-Gm-Features: AQt7F2pKwyReFTFBW1AkMHui4zZvwtcdzXVXBUuKjfAtNTDFOhMAD_POvY0snFk
Message-ID: <CA+kEDGGsmANidzkMV4=Dhr_tvTYKYNyrU1TBDja40tZ3MygYag@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	ath12k@lists.infradead.org, Dale Whinham <daleyo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 19 d=C3=A9c. 2025 =C3=A0 18:38, Krzysztof Kozlowski <krzk@kernel.or=
g> a =C3=A9crit :
>
> On 18/12/2025 23:22, J=C3=A9r=C3=B4me de Bretagne via B4 Relay wrote:
> > From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> >
> > For some devices, Wi-Fi is entirely hard blocked by default making
> > the Wi-Fi radio unusable, except if rfkill is disabled as expected
> > on those models.
> >
> > Commit c6a7c0b09d5f ("wifi: ath12k: Add Support for enabling or
> > disabling specific features based on ACPI bitflag") added a way to
> > support features set via ACPI, including the DISABLE_RFKILL bit.
> >
> > Add a disable-rfkill property to expose the DISABLE_RFKILL bit
> > equivalent for devices described by a Devicetree instead of ACPI.
> >
> > Tested-by: Dale Whinham <daleyo@gmail.com>
>
> You cannot test a binding. Building and other make-steps are not testing.
>
> I don't even get how this appeared - wasn't here before and there is no
> trace on the mailing lists. Can you point to the mailing where this was
> given?

We co-develop and test this patchset with Dale, I missed that Tb:
tags shouldn't be used for a binding, my bad, I will drop this in v5.

> > Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.co=
m>
> > ---
> >  Documentation/devicetree/bindings/net/wireless/ieee80211.yaml | 6 ++++=
++
> >  1 file changed, 6 insertions(+)
> >
> Best regards,
> Krzysztof

Thank you for your review,
J=C3=A9r=C3=B4me
