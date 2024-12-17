Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E96D1F541E
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 14:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734444519; cv=none; b=CVIobcJZwjLkTVxStCNz7SyVTMtJF48plmlQOKuOn6ntFk4Y1GUn3k0wH41JHuFjNYeNAHcaIkicyw2yiv4ySuwg9PeDnmMY/W7zlO+cRmqb5AxJmjkAZCQgEXe4CmsFn/w4Kzi8YHlZXsnU+UlyLW0Kr0mTd4Dv+71Ib3yLrSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734444519; c=relaxed/simple;
	bh=jGW0026BXd1vGApqNs0btmpVNZLakv19aMfi05Mi20M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OXIHKUMbrle5px7AkIxK08/aOg3ZARX1KBuJV6Sf/taJO+KI673spb7yHxFYWgqh+LsW1xGyJ3zBFIoDf/lXlV1MkUb/Ls1CsjW8pUJiQWIQ9HTpX2RpfqzMq4kaLa87H81RokxrIAVWkn1H9Z/PWDenLv7W5CUq8wEU+qrFh7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NheA4pr5; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NheA4pr5"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53df6322ea7so7265515e87.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 06:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734444516; x=1735049316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGW0026BXd1vGApqNs0btmpVNZLakv19aMfi05Mi20M=;
        b=NheA4pr58mOwLlDv/vwZFyo3Ke7+LnhGcin5OQ7zENaFrT4pMsenJ9pS22ReXgHkai
         FKsVtPYDI9X9ToPc4GWYRVEmJSiGHyRv9oNZrPGyfwFF7gZsMuZ4bB883GJajvh47WA2
         JUR68YcdaXTCEE/eNrkBy+BvCswRitzf2lJNFCz9+PSWWTaxiSGbgjLMJ7tIlIRTEE29
         FYnImos5ES4L/TUH3DU36hFwbpcx7jgXiKL+xOVNY9rP6d3AkXHY68FnuaDRmtSCMY7M
         /4MglcynYQoBQhpuuQV4vjZaMV2Li+OO/pkbP6A86jT7wOn7PK3mfLEb3LzG/8DguOp4
         L8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734444516; x=1735049316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGW0026BXd1vGApqNs0btmpVNZLakv19aMfi05Mi20M=;
        b=SQSLZoS8bk8t1Dsf3Lrp4754fi+H5qgjzBtyT8vROa8zT5fiafBfqvoKtF4C77G2J3
         OXbz2AwIGPnfCnUlHtGrHLYWKYAwQKmRpOj0Q3fKdK87+Fgdq5lifQbQeCUh7+r8nmo2
         umLMjkMNi9Rf2Oyr0LsQmdYrtsOb/HhByEv4Uf64wLzLoz/6tyfWJUF1glGE8xND6z6q
         0mCkAboJBkCy4d1bxdjcFvzJpaMd+0mv93IOyBMVFUqWKdyrHVXE9klbEdFCWF/jxf5x
         6UIU/B3Y9YAu/JPIob/pKnrBrKo7ZMCC1Of2/OQ6LlGJxdE0N6AylW/yOimpgpu6Hbnv
         J/Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUnLz20nOAYwOVY/O+B9MZyHa2ndJqHIblit2Q8j304tXWdFwuqU/W0mUkFK2nmav5zaMqFGSEgFwsf94/iOSaMqHxR@vger.kernel.org
X-Gm-Message-State: AOJu0YzLrN9z8X7If2waZCNn32x2OqJJ6+GPDOR+471Db4HJXIyVEnWC
	lY0naCyn03liamEmQaFkswOs5UI2pr91unX2EzL0CPxl2DkXsIsS+21nGJhbHRHPmo/4K7wZbVE
	qJBotSovtpWfTgZsvVZtMh+Opa2Phdz5kzPI72yrfMEU2h1sAky8=
X-Gm-Gg: ASbGnct4W81+B1y/xzKstVc/uCJPmyBhPPYpD6MD02p+UrbGtLV6rD7WlIfjsLwBrmR
	7+buC2mDP7bTV8uVq0fBlvYFpybWlCziL7PGT4A==
X-Google-Smtp-Source: AGHT+IEDzg/1QaAryu5mZq9zNVQFdPIn9J7cRI1WtaDrnft45JXUSlTsAmYaTbg81Eind0y2KWBppD7S2SK1pxKF98I=
X-Received: by 2002:a05:6512:238b:b0:53e:350a:7294 with SMTP id
 2adb3069b0e04-54090595736mr6147916e87.37.1734444516125; Tue, 17 Dec 2024
 06:08:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241208-power-supply-dev_to_psy-v1-0-f95de9117558@weissschuh.net>
 <20241208-power-supply-dev_to_psy-v1-10-f95de9117558@weissschuh.net>
In-Reply-To: <20241208-power-supply-dev_to_psy-v1-10-f95de9117558@weissschuh.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 15:08:24 +0100
Message-ID: <CACRpkdZczWm4Fu7sNbcCCz2Ef73zAuJTJe_=0U1hZuFsyXooyw@mail.gmail.com>
Subject: Re: [PATCH 10/14] power: supply: ab8500: use dev_to_psy()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Sebastian Reichel <sre@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 8, 2024 at 2:02=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisssc=
huh.net> wrote:

> Use the new, explicit accessor to go from a 'struct device' to its
> 'struct power_supply'.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
