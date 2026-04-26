Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2173726B764
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 18:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777228728; cv=pass; b=lQx6xSOlB56QmMH9u0IHsq9u8Ln7ihFDsY4h6Q+ga79VMgwZkqMvOZaG/ZHfppXXUXr+R/OCt5MMG58lrEmuecWI/LqDi+BUCFXSqPA3h75Ey/h8a3I9EMcAt5rc21NkZprS3Q3i7WoDCcyWzTXjly4RGpmFoNj4OQgdIAZRg/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777228728; c=relaxed/simple;
	bh=Gx8SauWUSCO6c2K3A5iLYLdD+56BUYgITQcSo9zHWEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qm8L1VRyptqbNU3wKcIi7p20OunsGZvuZf1rcj+7wrctrkQ9MGfuMAqIxDPoEzu5Bc4mkeBEYiwgG7ft2DeQR/XGe7836O6aKGbdRYKazOOmpC8IZiJ+wzjZMC04VaYX/6bDbtLJloKrdGYUzK1zkpoKcr55WSGWWx4iyj7N+9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qE0PbhGy; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qE0PbhGy"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-506a747448dso69993231cf.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 11:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777228726; cv=none;
        d=google.com; s=arc-20240605;
        b=XCXqBERxdwCmnFGjHCfBllzcdZQnprqFw+mtXcdOQWl8Pc4fg0FwyHgRNGB+eNxSql
         viZ63MiMbAEhOue3pfOkEn7QeJBA3AcW5oR7UsQahLVAAp0h+0sgzjs7FN+93UvYSbg/
         IGI9Ovsuft/J1imAITB5DtsvtvesMRTg4Lb0D0GdvoKhHJtRpa2qLCIov5S4DlMBgBbv
         qNyarsksJG8w79EUXGBuZ9NwHtHVqbUuOnSIu8ek+Na8ebe/9Zve5KZqz8oQzlj+vKsl
         sgz1CNUteyVo9WFuwzBk5iIOOO/C5HKzjfvdWdWe4eH5GoQq0OMynNcRM7s8MmfJesXZ
         9Qyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gx8SauWUSCO6c2K3A5iLYLdD+56BUYgITQcSo9zHWEU=;
        fh=aHNsEuUZzipaNHj9Qt73Mh8/nxd60k7E95rI9zCp5PE=;
        b=ZcoehbU3uTS3QX52MWE7qzlLVEfdEFJuwapT26g+EaddexdoQ4xCtCceqPu3rtynac
         FMIPDW9ohQXF0gYlUjPZtNVsRaEgaFPNKZU4arY/Q3dQJwXO77SIAhPbgPTFfMuhdB+t
         U7F42U0+jM6l9Ag0C5mMSgSpTUrstJ2B9Bg7BoDjO3QqmBAS/6/syCCUtD8voI6HM1nq
         4DTfzFqOS89NKkGLlAED+1gEizxskkkMtk0One3eyXtUs7t2qj8bc7mTRhd9xDJve1Xt
         6QEGQLa2w7j9kQmUaQpWZPgJJ29Y0kxTVcc2eoNgXzWb+/kCDAWXZFIvqKsGvZaDV26F
         xh4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777228726; x=1777833526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gx8SauWUSCO6c2K3A5iLYLdD+56BUYgITQcSo9zHWEU=;
        b=qE0PbhGyjUOxk991Ycnc4XWBt7dlwM5G+3+Hb41F88hStusf9LK24ysAq7G34pyBaB
         CI99pfXYhFv0rPTiGwJIYBTnhb0ncw19d/eZ68hDKtu9sLYft9LluKHRg7Vzr1ebVjLg
         4BZXi7Kjdz9lB7k3MJpm5XTw+T4svZy7tmt+RIbV7YV7hdk7wJkEBJjdKm8JU4J1yq4o
         uFNITa5nAEz7phIhd/L5iLh6YDwlZuJNoLwNYpMGAQvBYCcQcew89pSNQEXRWPYzBoMx
         RHANUDZiWBJqoPDgHuSxuj650GXelPi6gTRBEJHvzEKrfLXA/gpLd8zm09FsM43v41O2
         hl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777228726; x=1777833526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gx8SauWUSCO6c2K3A5iLYLdD+56BUYgITQcSo9zHWEU=;
        b=ogMcfgSSU+V3FyOajKdtA9mETZiDstuc+nE34Er5L/kGxzOenWejSC7tGOd9rscrW0
         O9L5WKPo1qISoXhYPeVXK4cemz8A5P0nQt+O+vU7+a2ZBAawWDZsNpK2La6rQoQ4l9JQ
         4ZbzUBbSJG5nz+5zm5GY8rWUEanZpQI9L53eRpBkFYipR8fFj8mpGBfbSS5Ts3iEaUCv
         JW2dpr4IFSbbMHNYQMJddYRHQITUbbSoYf1LxTT4J8nCGZP1g26DnZTmAG/UKM2RYvg+
         iH4qa6hqvnqfGQ4eXWvH1RvfBTd783S9VTgkXLMFRxsufeLPlDsHSXK1taoNoerNA3BC
         56ng==
X-Forwarded-Encrypted: i=1; AFNElJ8u8KsAWIZjFVe2eko6c+VVG1aa5t4rMPJKBQAFGWa4vBUlXwAU/a9EzG+/w5VD462AHGdOM46YaZWM20vNMf/FwcN3@vger.kernel.org
X-Gm-Message-State: AOJu0YwXTW8UlM7kqSEuvzMxaAQv4yClGDK+u0uxGUygkBikkxSXIbI2
	fVNv2sYJhZGopBoflYlm7a8WZ6Xnf1sRNz3KlCGoBPv7gjm20p5SuswgJLvHSxFZSJim82+91nU
	HKsL8vzUmfZW/cZdO03P6qystHgcgNYA=
X-Gm-Gg: AeBDiettzzt1gLqiDEDWBuxnFET19lRi3m/ScMKwFkME7vbZleiOzpjwbpt8ecQykNc
	18tI8I8TEmFRUGoRRWJTsEG5Kg0ATBGw6cnOiN8VuP44K2rKO/sK6GBZNjQMEoiqmCpLvbQxBMv
	8b+xcbUPRxxx0PdXV4WTLxBlErl7waP1ZlLBLVS0bFaCH20DKlmegz1uENi6zGI5I42977TIsd5
	LCjLAZGoXBLpe328hO1PphdbzFkns0r1J1CMvklGPLjpEfa840mFM0PmdcxABWrgMsi2Pq2enrA
	+OSsVuJ6uAj4J/ZVJ9Q=
X-Received: by 2002:a05:622a:1303:b0:50d:a8f5:d515 with SMTP id
 d75a77b69052e-50e36e93acfmr625479191cf.51.1777228725975; Sun, 26 Apr 2026
 11:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <673b66893c16ca31b403e7e7cba32e9b71a7515a.camel@rong.moe>
 <20260426174332.9981-1-cd345al@gmail.com> <F095C80C-C233-4A50-ADC2-EC932563E1EC@gmail.com>
In-Reply-To: <F095C80C-C233-4A50-ADC2-EC932563E1EC@gmail.com>
From: no name <cd345al@gmail.com>
Date: Mon, 27 Apr 2026 02:38:35 +0800
X-Gm-Features: AQROBzB0HtrbCxdgg67bFB7RwuiYLwiL3SOmZPEgvGSr4n4WqSDBGH18_gZjVz4
Message-ID: <CALoEd=GncBHeSOh7eqmVaJrKWNGLsFEyh5TsF87boSQgsDM0vg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: lenovo: wmi-other: Fix uninitialized
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, mpearson-lenovo@squebb.ca, i@rong.moe
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Derek,
Thanks for your reply!

On Mon, Apr 27, 2026 at 2:22=E2=80=AFAM Derek J. Clark
<derekjohn.clark@gmail.com> wrote:
> Hi Yufei,
>
> This bug is already addressed in a patch series that has been submitted a=
nd is awaiting review from the subsystem maintainers.
>
Which bug do you mean specifically? The args.arg1 uninitialized bug,
or the original uninitialized 'raw' variable, or the inappropriate
encapsulation?

> >I may do some refactor recently, and I'm happy to hear your suggestions.
>
> Rong has a large refactor series queued up to simplify much of the driver=
 already, pending the acceptance of the previously mentioned series. It wou=
ld be best to avoid doing any additional large refactoring until that serie=
s has landed.
>
OK, that sounds good. I'll wait until the refactor is done. I hope my
suggestions can be adopted or we can discuss further about the
appropriate architecture. I'm happy to hear your suggestions.

Thanks,
Yufei
