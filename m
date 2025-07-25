Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC64E40856
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 23:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753486650; cv=none; b=mM4ZQVXYTHgIQXqlQkDdmG/m7QFE0HaXHpyaswiTT5B1KpIxqdzMOuJvHHSm5uhyYbbF9aYB3cFEvCRmWQImKCp3noPFMFrIKT34efKlgAAawu4Yzc3FeiioVBVZW0IKmwlQw1r/tsSv2cj5M4jPfzVVKSu+I3YAPASJTsG3IA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753486650; c=relaxed/simple;
	bh=uhF2AgZtDvO7V2yUy7R0FuS5g5rhi/hQPDhL7ZhdwLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHt80pDjvps+pinWaEVBqjtYs31t7dE0xQH5w2KO+J97BYqsh1ocj7zmigPOgxcdt8aIch5JVo6eEW14eQENusVhws4J7yZCU4rgT68dn1SioT2E3o02g9ZW4rWkcEi/5UrNL+nwL2qaPsn/kIgYHGvHY0sOC1UJ9Pc/z5ZP8iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTU73PJS; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTU73PJS"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so567782666b.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 16:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753486647; x=1754091447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oq3+GBGT1gl2LbcO+29UpmJbUMO3A66Igi+a8k5XuJ4=;
        b=PTU73PJSe0SX+6cP9i8evYz2Gqzdn1/e+E6KbP+ACFrPcKaUNrNVLJCZ9+uqCOE8br
         EIKjn6+v5njTsUfHV7zN+v1g/DYJu/YmmWSQLOau5Pu7QdCq2ubOT3fVcwmsoNk+ybFC
         qiPW+stpFJDGIZ25l0mKtH1GKLZyUvba3E2RrUwy9YsPuXJqXeFz490grZlBmmpAJrdK
         Zm8QkoqUIanRdtk7Cpy8xvONPCwWDyz98Y0tzzRXE74MmpG60FtU1Hzou7ElKFoQoeHu
         keiALc9G4hEv42/k7NAO/QpbUqpB8pwxKhkz4n7TI3c+gZleQOAgxTMIGSyNKgD91jIx
         zRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753486647; x=1754091447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oq3+GBGT1gl2LbcO+29UpmJbUMO3A66Igi+a8k5XuJ4=;
        b=csSKqZLj6HM5moaizn7MImYOYWjGa2GuntXFrW7ziuzS4LIV8ezXF0CNIyLPbJSaoE
         7tmLZJjlFYMbwnoUKNx2WMtb1leC8RZJEX3XsaKwIGM5qZVj8yWOOt9dCq83yxZlj+eD
         w3IBnA5GsEizlgWuW01A6LoyhGwGL3Omk+JoK54vMG4li/v7BamQPqTc6RsY5RUmMRti
         tO6Ir0UFDYPmsxlR3q4rfXNu3rA57AamaYOb8p0mD66dvHQs7TC/gWAsSsUstkQ0HNvi
         pMGGoeas33FHgM23PRhoi6gusTt9j1jHeSeqCj8De5gDL3PczgSYqnN+uLeZYn3jtIvT
         pZTg==
X-Forwarded-Encrypted: i=1; AJvYcCVhXn3zrTrinD1EUZIreo7no5xYkyd6Tpy+FcgZBl1I7ddrTKbTQogVeOBa+e0JQSpnXfdRSlC7+8llEXzhNe64igSm@vger.kernel.org
X-Gm-Message-State: AOJu0YzMjSHAAxMft9Xt188D4m2E0R9k8qN1oYXIfiFCBZKJb1XBD7Nb
	rbUT62g9z5WCOJ1RvyYMUEizTZdrjMphtf6oihs/4SgYVQl/rYfX7oS2cJcr+MnpUWgzkXBy6er
	FWHbn0i4hV7pNfhNCsbD+aM8pC2fugZo=
X-Gm-Gg: ASbGncsaYOcl7+bo87Apbi1yuTfbXLzl1rfaEsJ8M739ZtOLQG+h2H+ogAq7hkR9yb3
	ZtHrJqadJqaLam08tWvg/GhYSySlEdxevgU5eqFGdL+2EygBbOsHA3sB6md3NwPPe/gbArRmFnV
	O/mLuWYECoK+r6uP3d2IEgfTI6JRP/y/bLIfByAcE4p2kSUp2Ded/ipY76LRQAB3HbLweRrUSS3
	CK3QVPTLg==
X-Google-Smtp-Source: AGHT+IEkTtDoVVYyZWpP3qaXkHQhESuj2FifuPisBln19rtrw/tdNPi3rx3fl4Q4ixkSfW1i210vXj5mUE3PQMzf4C4=
X-Received: by 2002:a17:906:478e:b0:ad5:2328:e39b with SMTP id
 a640c23a62f3a-af618f02ee2mr460737666b.31.1753486646678; Fri, 25 Jul 2025
 16:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250725215259.402796-1-hansg@kernel.org> <20250725215259.402796-2-hansg@kernel.org>
In-Reply-To: <20250725215259.402796-2-hansg@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 26 Jul 2025 01:36:50 +0200
X-Gm-Features: Ac12FXxpiUyc_HgQqh40XdE2hTEM-2nvPzVmWAtWoNg2e_fjyxJTL7nu06BIxRI
Message-ID: <CAHp75VeqPFPTvpJE_u12Jc+32F006fTm05CbJ9S4AQcFU6f3Lw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] platform/x86: int3472: Convert int3472_gpio_map to
 use C99 initializers
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 11:53=E2=80=AFPM Hans de Goede <hansg@kernel.org> w=
rote:
>
> Convert int3472_gpio_map to use C99 initializers to make it clearer which
> struct field is set to which value.

...

> +       {       /* ov7251 driver / DT-bindings expect "enable" as con_id =
for reset */
> +               .hid =3D "INT347E",
> +               .type_from =3D INT3472_GPIO_TYPE_RESET,
> +               .type_to =3D INT3472_GPIO_TYPE_RESET,
> +               .con_id =3D "enable"

+ comma. But no need to resend just for that reason, I hope Ilpo can
tweak it whilst applying.

> +       },
>  };


--=20
With Best Regards,
Andy Shevchenko
