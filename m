Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F6D30BF4F
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Oct 2025 11:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761736593; cv=none; b=d6ZMbbIMyCbkJITrl5izgoo2F4XwOLKQaC47IY1+HfynLDZtYCqd/Q49rA5noRWp2Z/bHsXTUWPFdUZYJicICeZc/e7jdVvJwrwZMP02gvucwRDXX/SyJfOuHBOn9vi91GBZM8Aa+VDTpQT5WgC8+NG2nkHYWA2xbnsgJS0oItM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761736593; c=relaxed/simple;
	bh=xeF25thM2PZPH5jzTzq98NGYuyp2mVeCEN2oT8n+yjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkWvDO9GyVG/JvyZCEIDaFivQqJa4GcGjid86FGCzUnQrkM8bIsUXnX95LaxR7WLifoE1C1eYxYPaD0KU3f3FBcQM6d5ipUNlANnO9wgn53vF8lWvJpXVE/03idTRDWwfD5HRUmIyMD3bgMkgSR0oTie8SH1Twy/RJUQcfDBGe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cNCyeeSy; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cNCyeeSy"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-591eb980286so7491379e87.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Oct 2025 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736590; x=1762341390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeF25thM2PZPH5jzTzq98NGYuyp2mVeCEN2oT8n+yjQ=;
        b=cNCyeeSy1c/ns/q2ev1M1GRICHpQxKU3b0FsCkG670ToMDntZwMdj0xQiE5v4fNqcg
         MMWjtjENHlbFgHbIalUWWaw97BBFsloJWhPGBPa+ywJF0ZtV6ai0YCIUpXfVdgktGDu5
         8agU3FMUyzEXO8EPq824YTnHkAmlJI7DG1/zHMyEOALP5SY6Kn/6C6Hz1LJ7UUcs2gFt
         9ubSzwZh2F7B+wg5xiaenquYpcKJ6oyrz1UIGaCS+McKsqIU+noZ2ToJDqp0/q4Y28Ht
         nlB+DsU+QAkVxOEQgAV7EZW+xw9CgbHIpsTjO0KOlW/hGeHMhChrElzuHJXUr+10ZdK3
         C6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736590; x=1762341390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xeF25thM2PZPH5jzTzq98NGYuyp2mVeCEN2oT8n+yjQ=;
        b=R4XvGf60nYjrc0AAEIPerVgZSPBqYy0X0UYlafNMO+TDegTgeBzVSOYV4YJvsAcTHX
         xTTayaxTZYqOGQfx9Dd0DDshlGokGbByPEdwzRuz5EtzwC7cCXAEyldgx953p6CFlBgT
         FJsImUg6BKenCauwY4VoArp+D6+CEeGigM5Sr5N+9DzWIoO/caQWPR8R2biDuM4f93uW
         32S+tw+0uC0nzSkmeHet34D54b8Njz3s8KD8Lwghjzd6xtP30GPVVtc3KrHbyvDz8S2T
         0XmPCHwNY/WJKf1etZrmBLCHR3pAb46gNFUzG9LDAVm9AGhXfFTOXSRZv9V3WROkETX9
         CiiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyoyNyH3VM6rilouoOdgCoUJXQ15CQ6LEApYnYZ86GuofuLyYAliFW6MW2PehjzKnSSzNj1R5DasCwChWAQewPEBOr@vger.kernel.org
X-Gm-Message-State: AOJu0YwkyZ4g0FXKHbYl9oic3FCkykh5nzDbaL4Rmka0g5tjvFierEaE
	m8aCyx/GVaQb4oXrH6/LUN0yPhFMvIWf7lLZ57cYdr2D677nY6XzhzhcYxfz3Th8XbuGcoQWOAb
	1ZxDbJdMoYBlw3yNanwUYUBwqhaa6R9Hgav+9RIwkSg==
X-Gm-Gg: ASbGncsU+6G/TXiD6DBZ4n16RVI3OzQB/1BkWJcOi35pNKL4ubjqds69GH9hMUOBlwf
	b662fmRWUSyyywBvVIvGKy3DM+Q6C4ZMambDpyPYDE41xY0HbvHPfw6QD4R5tFfSVDvarlZQZSl
	pNReZVVdpEjafysmlYbl2bIVWg1A0mPyHJrijKtrPxNiEKX++YbTLPG37WpDcN+N/HWweQ8NEsw
	1S7ljuW4dbscbvzGWt7S23CjyzWXO9Etu7fVVyYDSdsdF5uKu/F3QRkRVpq5/7eWLwMq7n7XhMl
	EVqHvJxirEOLnDu5
X-Google-Smtp-Source: AGHT+IF/PPqVroPx/2tFULvtimKphv304ar6mv/wspGSpJtcnQw2H6jG9Ib/QTIpk1kNC5MMvSUh9nk2G1XqNVILan0=
X-Received: by 2002:a05:6512:234a:b0:55f:3e82:9c7f with SMTP id
 2adb3069b0e04-594128dc455mr1078602e87.51.1761736590136; Wed, 29 Oct 2025
 04:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029062050.4160517-1-raag.jadav@intel.com> <20251029062050.4160517-3-raag.jadav@intel.com>
In-Reply-To: <20251029062050.4160517-3-raag.jadav@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:16:17 +0100
X-Gm-Features: AWmQ_bn6vqgzrVesD9W2JQVivGMWV4bU1ue1SAUFnBIzZij3ttVsyd0m_kSvm1E
Message-ID: <CAMRc=MdsF6VoKrHBgikMreS9LDNhdwMVRvr=TrM211O37YuFqw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: elkhartlake: Convert to auxiliary driver
To: Raag Jadav <raag.jadav@intel.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org, 
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 7:21=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> w=
rote:
>
> Since PCI device should not be abusing platform device, MFD parent to
> platform child path is no longer being pursued for this driver. Convert
> it to auxiliary driver, which will be used by EHL PSE auxiliary device.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
