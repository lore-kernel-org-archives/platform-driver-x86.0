Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F123B7767
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Sep 2026 10:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777155; cv=pass; b=Qwie8MoCLcN/h0F8w286m9ECFS/mPVMwG+Ct2LcvH/Ig8GJLgAQH7/u7d0Si0TzRD+W4sDxZLWZrwlGQHd++5WwnWkyDyA8C7S8RU5WUzYJBLZw8A0SJsp2WEPFs5HmN0VyxIsKLzdOGo47HNDK6W1XIjBnEJfyYoS09+tMFvp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777155; c=relaxed/simple;
	bh=X1qWDgE4nF+kcB5zeHXPeP2a0sHwXZUBovy4AQQ1Zh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ux77xB2gqFMN8UXLKQ1ZfCeYTVl2nZrhg6XDXfKt1Bzij+CtFtpX84/J929KDvdVZ2WFwG+HZaDebNROmtXWRaO15Se0K2lMcAIxQJmoDthBCcVi8J1vZNhREBcovto80lh4+MTE9K7KTN6fPVoRZloPQ9dKL9eJssHFF+B1u7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZUgWUGN; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZUgWUGN"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c250c6a6a6eso437227766b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Sep 2026 03:32:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788777152; cv=none;
        d=google.com; s=arc-20260327;
        b=mGWS9anwJjeSwYVr+10xyfKCjDQ0FIupi84ayFn9fTQ/OendOdnkyVhp9uoEb+zZy/
         kKLAE7dHP5arJ12aOgRSUmcU9yjJbHkKtRA8O/Bi7583AddPIFpu+idMmKmCLFKpdwTs
         UxbML1KnVOg/pyWm9Wd8sK8GA7LeNoB/BIJW+CKMu6pw/bQ4DQZTzshChUJh2IfWX0ns
         VhBiiew3xi/q1GZYch9zCbfbXcVT585sd0VlwE+ScU+1G9bQWJ09vpunUn4v0zahLrWx
         04pO2ADMXoSKEzwzrkOYrK4mM/S4xKhq/7cs1ho3KzGxrgNmuw52+vRRm7+Er05H+EfI
         DW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X1qWDgE4nF+kcB5zeHXPeP2a0sHwXZUBovy4AQQ1Zh0=;
        fh=48h2xMTJ4ILj9xZ7KMts9jW5it0R9aL1dCIzeE/vWm0=;
        b=LmyPJu5Wqly09bK6PToeX8blSSZegCI1gGTRUBsnGelTPmF6csVQyUr9CAn7hoAi4P
         JxPf+f5vmLsu3MQyztolSL1xRT2GvnyHL8X6Ui5x1vBdSm84xUOk0OJGCpJxpnWemYQR
         NZW7fZhQWvxTMR+zOnUJCo8ucQpYYEjskhDGbo4DvXkewLezu6mGxfS6Hxn58d2kePdE
         9XjcaB+obx7to195ZioGk0D5s+y2We78zIW98s+UIOBq7I9ArFA/cP3eiDSGUhh7BfoB
         EB0HBzLMkg4d8qhmiKJJOwIKOjsfg0XCq4BCEnT/Un+YhxZmItsvuwyG6sB1b1JbslSq
         r3TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788777152; x=1789381952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X1qWDgE4nF+kcB5zeHXPeP2a0sHwXZUBovy4AQQ1Zh0=;
        b=aZUgWUGNhSKdU0nIKvkjb6Cw5yxj90QoLBEyhckqRrB0qA3hfhbB1fL0tnrHadsB5U
         LG7IjEYz0rDxcSvEFjVx7fvlbg3pDh7h3v6v+K/BYz94ttnmlbq0JpSX6TUNgm4PwS93
         IJl336Q5xTPjTQMAxlxOcW0n4z7iqZ/5eSjxpnFB68XlcwftBFdG6iFBjjbk44f+BjOU
         uLjPES0qhxiDcClsu2cuU6Ws5IwGyt6nbF6KY0FFTNsMM4JyMeC0kEAYKcFx0xprScCz
         8PodESrmtgT2HIXDHuW4B89WO4BTwoagjV3daDkEY3yba9yVoHHgDlNrTot2kAkN2Fuk
         +H5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777152; x=1789381952;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1qWDgE4nF+kcB5zeHXPeP2a0sHwXZUBovy4AQQ1Zh0=;
        b=ZyuWJesflcAKqZUi5IrsGTkBWTxtLXojFPWXM+39A5E/zMGZZHPKvEp7JDQoU1L+hG
         g3FJxx2x+1WQmmQwz1gV59ui+GJ9iYRvsJFc03D/G44nwnEHhgt7v9SRLgQYt0J3klUL
         JjKAMTdEIIvH9JWH6ddxN1qxMeaOWA/YZMvZLxm8QhTlcr5oFL+o4IVeMEj8kaotqzMP
         /BCu5oF7SLf+G3CDxhlzviipXOQzVC0hLGBol2GEj0fidw9RU4ygn6NiskjeJM1EhIrY
         /VE6W+etwu1U23oMQz94Mc+MhvaMnzYCQoZgu6m+AITTHbEy9zyjWq9j+Af6YsfKkz6f
         q9Hg==
X-Forwarded-Encrypted: i=1; AKwUvBxFMtF9bG3taepLjjcbgvTwYK/Y4lzT6fi/LtvZmDV1f9ogu8CeRPzTVl0iHfafMfB4A2VXPncVsQkNra5/qbNXQhYS@vger.kernel.org
X-Gm-Message-State: AFuF++mpte7Tj0GTmgx1bk3bJcfDJo2aolr74pL/gLo2In/GrJmIW2Ub
	68dSS6RtaMv0kodQTL29p2xhtYyImhnb1zF4QKDW5RZbT4viuet7tZ21yPspHXLHoWqcSpx4e60
	Twyy5JNhwXHnNDiLaE2+BOMqUMkoIF8U=
X-Gm-Gg: AYBFou1frCiYNlQVeGm8xDo25uFCPIghxT6gpYrcA1G0eFwWdU1rX4KjoGirEJoyMia
	4SzR2lWrGv7e4uBuPZDubzm9TEqW+kRCwuhCeQ7njXQ0q9MMbVbyu6Rchqon8GakgA4vU2DCYse
	abfXIPH8JSSoygGtd2LQljie54tsuKsIygE0s+a4pilgtW5zeXRtyIweYHNmMHhqx5YK0nDIhAT
	HfvGYulFDmFk0iQSxLOToNtrfH1UFZzjNKOS8XciNpIy+2RUr5oX1D84k1J4Ln6eckFQGpA2FZZ
	SpvT1FrBv6ciFX5bIt+vOk/3Ccqoescojg++3EnNL790g7p+Fa8On4CecNYBjWBqeybcYGiH7Ck
	idk92GMEdgboK+OWU+sJ4Qqp4L9vyvAGVPco4LCrFcWCquIKWuvfaojYp4idOw6OqD4bpFOee+G
	jomLVoZeXTrG22kwTiQ9eTREvT1JwTVsM=
X-Received: by 2002:a17:907:9490:b0:c26:19de:9ae5 with SMTP id
 a640c23a62f3a-c2619dea790mr625724566b.36.1788777151897; Mon, 07 Sep 2026
 03:32:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907084319.351688-4-blum@kernel.org>
In-Reply-To: <20260907084319.351688-4-blum@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 7 Sep 2026 13:31:55 +0300
X-Gm-Features: AcwNN1WOOJgn8-p9-C3jUkiPvWDFmRlO5oCRAvc2gPgeLyW6w8fr-M5Dv74RW9U
Message-ID: <CAHp75Ve4pcd=KHcJpGW9qtpNJLwWsQjf-FzoNtkxdryVfUB6Vg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add and use supported/unsupported string helper
To: Thorsten Blum <blum@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 11:44=E2=80=AFAM Thorsten Blum <blum@kernel.org> wro=
te:
>
> Add a shared str_supported_unsupported() helper and use it to replace
> thinkpad_acpi's custom implementation.
>
> Changes in v2:
> - Add and use str_supported_unsupported() as suggested by Ilpo

Suggested-by?

--=20
With Best Regards,
Andy Shevchenko
