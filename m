Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4A0386C05
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779124513; cv=none; b=dt5MGLnkg3nqrhvMgSe1o2JQvEuCtpPMCnjBS6XmDXSFZ5t6SFpFjsv4+kZ1e1lbingT9yVrTgeRhmRusZiwPng9DPXewDiKtAIWlCQfbGRmCnWrnVl37eXvwO1p8vNLYxDj1xir6dB9T1uyKRvmJiUUtdZdjKL4ExIgHI2nSVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779124513; c=relaxed/simple;
	bh=sOJxMZchOv0WgrC6+6PbayYyvo16Eg4LJgmrDhVE/y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DZxY0QLJ1BeZK3R0w0hicd3AcgEPHTwU1mnNJ9VMlUtpC+6LHx2G1IuW1r8W75mKdQk3QgK3Dtrrj9h8zaGYZ8TsZb1RbI9bm0zrENGtX3hLyNzK61uSdCyHZRxX2yWq2BLjKmBngjxM1sCeTsAkld9k0ObWKKLg2FTk+rL1ebU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y6lYiGR9; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y6lYiGR9"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-910bb291688so328823185a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 10:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779124510; x=1779729310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QbJKB2lw5vG8p4X0Zp1dtcwqkjeJLsy09spRbfmWxU=;
        b=Y6lYiGR9f1sAoqAKxcMVjeV6b7rzFSk6qe10zKyCVscVFMiRPCeyhTvx/Zrn0Zn93j
         1tUzzOKAWZul+aMEEHhQqN/BXKp2IHtZfCyOe6C0COd7AXNEagTQ8v+exDOCx8qLYESD
         yYFNnZ4rmnXQULbLbOiVBjwgxTzMO+xaoJK78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779124510; x=1779729310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0QbJKB2lw5vG8p4X0Zp1dtcwqkjeJLsy09spRbfmWxU=;
        b=V2bWfePCf7lFR8frY6tId21E32FiKrQNBTONbm+RR+BrsysUMKguhsWB8EnhLYbrWK
         do+LOJcUCe7OgVZR/tE8dZ4npDxgU1WA863zAMykAbuc3DQin+IlDnygKQOmc2DfSGQH
         Iwlp5Y3awqbQIuBxP6nbmwIIQE4ee5K0ZFMVjC2Z2iM5MsSFMslrd6NGKqJX9RZ0/jhe
         H8F8eUZ2R4g7vX/zr/ERISvZqZb/JZ8I7UutZo9dqSEDtRS6lyG8hant3M8FlhKYJ2YH
         hA3pMQmi85lZoMetNcLHVmIMmaPO9NcDOhzut2fRHN81ztdX1vBzEQHAtr4JS3t1dC0G
         P7fg==
X-Forwarded-Encrypted: i=1; AFNElJ84ay8/9KVBDJM+zmekVAtu8msbfEMsljmBkB64pYYHC57jU9hqsXlJS9JIbyc0/GMZqxg7t0YaCxdvx+oLXJEWJ51u@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmb83HGgfquZ7RUOJV2lA/sqmvQONaUgd77UMxfW8+r2Ov6bfw
	wRTEqXZCwaxKkoln0Hk3cJezuvPPDrNw5C7ul7wgc/cAgigCIXpcBD2U0f76QlXbj+Myygn79di
	dIOQ=
X-Gm-Gg: Acq92OGuHHZiksd8foBJk6Zh3aBopQVjuuYGlGCs9IMi9utnt97USfbXgkptUb0Ybgq
	hEWT/tOEJkY7HHpV1WVll5l0loiHZ95VNom0pb+Q+Ojv9JFs6mb1ju2xHChxtP3jI3ICQLI0ysP
	cp4fVM/tjtkJC30rORpHb+MRcfLEDcxsaHf4hE6u1/R0COj00ihMgCb6G7w/xAL2loYY6pKMPpx
	I0Rl0eLq6agkdtj2icV/ZvtI8zftaDYrMTgCmgsRVCUZ6TC8oHCAdz48V+WHGw+/m2gRCpAvVoO
	FpvoOUdBt0Wbhy3laNyFtkUuP12B3vdX1heYCvbFvfQDoJonCjnRsbbdlzQgdmnU0749BRE/XEV
	idrkf6a6pByfIFhk6UTFds9ZxucAKUVJER9v+zt3pkaVDtmBfkWlC3F2SxwHusT95QbHR26W2d6
	PyOcNmnf+ZavTSMAqBlFrWFI7jm3egdbFb/UFSw7Qj2GowrVra+AY9M5tJuKeAPQ==
X-Received: by 2002:a05:620a:a196:10b0:912:1206:ddce with SMTP id af79cd13be357-9121206e079mr1616091385a.6.1779124509743;
        Mon, 18 May 2026 10:15:09 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca3608c424sm61925676d6.3.2026.05.18.10.15.06
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 10:15:07 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8bc3ef10cc4so38457826d6.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 10:15:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+amoy4o2xBeqJUDuObpFq0/aBhe+DoAfwxgUqgypUsMimRociJ3L0FpkYMAlYsTcz29i9AlP8VjoxN8NdG2kWEF0hQ@vger.kernel.org
X-Received: by 2002:a0c:ea46:0:b0:8be:1620:a95a with SMTP id
 6a1803df08f44-8ca0f67c3d3mr193127066d6.27.1779124505831; Mon, 18 May 2026
 10:15:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com> <9e749a3a483e4a3c684eac3ee6a4b241c94a0362.1778822464.git.harrison.vanderbyl@gmail.com>
In-Reply-To: <9e749a3a483e4a3c684eac3ee6a4b241c94a0362.1778822464.git.harrison.vanderbyl@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 May 2026 10:14:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W-T3gnhsPY1TPaShBcj6MtXhPntAm=ecZ8pK9aKg=LFg@mail.gmail.com>
X-Gm-Features: AVHnY4IADEBlAYng-Vk8ynfnLq-alsFZFnj4hN5gU5NdDYItYKJ7p8Mb41QcTng
Message-ID: <CAD=FV=W-T3gnhsPY1TPaShBcj6MtXhPntAm=ecZ8pK9aKg=LFg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/panel-edp: Add panel for Surface Pro 12in
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net, 
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	jikos@kernel.org, bentiss@kernel.org, luzmaximilian@gmail.com, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 14, 2026 at 10:43=E2=80=AFPM Harrison Vanderbyl
<harrison.vanderbyl@gmail.com> wrote:
>
> Add an entry for the BOE NE120DRM-N28 panel,
> used in the Microsoft Surface Pro 12-inch.
>
> The values chosen were tested to be working fine
> for wake from sleep and hibernation.
>
> Panel edid:
>
> 00 ff ff ff ff ff ff 00 09 e5 c9 0c a0 06 00 07
> 0a 22 01 04 a5 19 11 78 07 9f 15 a6 55 4c 9b 25
> 0e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 62 53 94 a0 80 b8 2e 50 18 10
> 3a 00 fe a9 00 00 00 1a 13 7d 94 a0 80 b8 2e 50
> 18 10 3a 00 fe a9 00 00 00 1a 00 00 00 fd 00 18
> 5a 5b 88 20 01 0a 20 20 20 20 20 20 00 00 00 fc
> 00 4e 45 31 32 30 44 52 4d 2d 4e 32 38 0a 00 0a
>
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[5/7] drm/panel-edp: Add panel for Surface Pro 12in
      commit: 02f48ffdf96c83ca3e6600fe5dec872b34b68775
