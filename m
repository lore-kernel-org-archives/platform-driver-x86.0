Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7F445FFB6
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Sep 2026 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777268; cv=pass; b=JOPz6lH57vLvrrXPxvYPd3gz0Ft6d8kccJ7//rIKNPG4TkijI/r7LkWiwlphhx8ZlN52Gbbw4yUVukZnzCkBkIG/tibtRwANy3Oso0eUyiy4kvCc7kgvOsewxjFwOM+KdD97IeGH5PT/IMkFtn/2vqceBg11IMqKml/ARVeuCK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777268; c=relaxed/simple;
	bh=+yS+OWDWHgj8L1bOSAbU79jIY2VHoZj62mLc+Oc2Vlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ttfv8PWheK6Z/rwp02YGuxMJl5DQmp7ljA+cXiMQn/0CEPHw/IRZHo5eotN5W9/HyErbSWzQUri3RO4ovutSNurMvqkbuUF2Cmw2F8hqprbOZ5Rk356qvr9yGGqZAASG623LZ8b528baEaCGx5Xab9T3w2QEdrzkIkgAg8aWAf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZn095UM; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZn095UM"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9c60b9so1963666b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Sep 2026 03:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788777264; cv=none;
        d=google.com; s=arc-20260327;
        b=o6z2hkRq49TNkNVqlVUwn1zwrQfEZDmPTiMFsvtb1+g8fbAIJ0YlBZwMkWmYB7/2U3
         Hhh+3z9k5DKf+5ervio4dvqaDiKE9PnmtI8pJZLivUYLaz/tAgfq7111x/d/I4RdSyB4
         sFNEEy9IgGEcgrSDeT9/ICQeigUQ1Tah4OjOTY+eTwkFyVO8PmEwnwbWR7ZWXYbrIBlA
         9tGosktT5C/M/NUom/wFrfyQl5FzwXfRY1Er5sikKQL5X0qDCFqljhDZ5xRSy5I/NC6o
         FFk69c1nVgo713p9QypZnf2TKZFDLkAo4bhfy8r7Hm9w6qQOZk0miDNpgmCTIe1FhWbl
         DyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+yS+OWDWHgj8L1bOSAbU79jIY2VHoZj62mLc+Oc2Vlk=;
        fh=PdtZ2pha6w7HbVXeCiWOJK+5Qw/eleFL++Qg3kvINwk=;
        b=REvoSbB2HJLVszE/HPAc7c27Bb7sVrdyjzYrBpMvhA/eTt7Ax7sHG/3QViSbUDwnwl
         /GpiKwyTJp1RXzVxII2FC8ZM06hakOfWy1HP9c/HumgWADULuS7zIaVr7LjGa2pM9E7c
         2NrVXNu0a68Jn4AwsIeOf1/DLET9rj+4tgY8muXp8vDzBdxb5ZAIgdm8ePGJ7mkrjIYh
         aTc+Iuqvkh0ShhrvM86ag9ifSaKxXIV5Nkh8fEQHJxLJBqW7ll3EOEDr8LS11SJtuUPG
         KHliy0PmuPuSK+T2DDT7X81YSPnF+cDqirEe5Qy3JGh9JUroNyttpIJGTOZ/r6Ig6fWf
         xFJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788777264; x=1789382064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+yS+OWDWHgj8L1bOSAbU79jIY2VHoZj62mLc+Oc2Vlk=;
        b=IZn095UMZppKejO7xWluUfNsRQLG6pAamNXLKTIH8yO7tK/QVLuFjrwSdRrBorK/1/
         nAYqJdjWITzkwcm8+S1MY+Z/TYzPDSvgaDNCij9ZKn1Vf4ziNGArQCDnbknFXi29vkJm
         7FQXbeKLq5IWR0cQ62+OElB1VDCEPLFcUMG3C4xunXDYNST+jfWnPMQ1rDVr8YPQLUbT
         xwdEgaDFTh5rd/L55cZFMYjbh7z04qsMGNBwy2Am6jmbjPyvlHI4ZPQ8gFv/nrU/Nzi1
         Eft1RbDsdx38C8W8Jfv5SKAEdbwbCKRVud0dOl7wGwP9DN3MrSKKWkE9H2mJ/bw5RHzX
         Bopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777264; x=1789382064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yS+OWDWHgj8L1bOSAbU79jIY2VHoZj62mLc+Oc2Vlk=;
        b=spmH9rXa+me8RgGEc0dyfoZipI4S7nxphafEZlmM0YKRcboKeXUpC+wSP3pJnWh3M9
         sY96ns/g/i4p1BmpDJKOa97bZ6yeio85qUVBt1K+kMTKOWp6OoD3uS2Zp65zciGMylNu
         bZyqpWknR9mfpKHNu0PUGzNOP21Ipv8SdIZGTdyl4GHo07PSccYTeQu+GgstQvUaIcVC
         kLtPmdulBUYBtjrbMBN6rEBA8n2znsZvPP6L3tazYdOMoEgh82aw1Hqtcmu0qSI2263s
         GrSeSFsFNbVTVZOLkDyFza5kmLF2Ue2qPxP4hotZ4ESh7vMLjQj7IDNGxHIOvsQNCLUi
         Yrew==
X-Forwarded-Encrypted: i=1; AKwUvBwI2LGoM0jR065ubu36rWQvM9jhiWEXt62sSM/UbT6GbPXwIkvZc5Ea0SSh/evKvcQXDBuOQCRmlGAKJVbJ5b7J3EgQ@vger.kernel.org
X-Gm-Message-State: AFuF++n+wmFzymiuW6hSImoDm3TFx+WAM+FMT6deqgTaeLOQUd0P7GT5
	lvkqk781rvI8fLbHtP2bF3x9Rw2v80qvXs8TzeFJV/dqzMjdqgTtMVrPoj9rzu/cAHOSH3qxzAP
	FCjxMBYsMVSW7D7+XUebLhvlxCPzTcUg=
X-Gm-Gg: AYBFou02KcPUTGYgQybXoWGUr8t65kXc/7O3GZoOiRVfacXy94UGof9LezidGQKd5E2
	cyZgd9PkzEfnvbf13j4F1RI0UjxySmw7rDqFH2d74ZZyID5L7wIu4K1L26Uyh5hd+cZtQX0udgg
	4oB1Y5KScrmYoxtCiIoJPwumyz0UP9CIagVi8pLeDvBzAvH8na6V7MMFwYXgL8jA2Wwv8RqVBKD
	BOdvEpeWh60/QaPhttC1PxdgVrMXNJ4JaByNg+OQLfHVKHhi58VuZhptXnpwcT/wgXUJdJdaWJS
	6zvDkDJbdyzkmyN0TmBV1jkqB8NGqNM7dX7G/7DnygfhbnQstSvdb7/hcn/oGBF1dCt5xENBQGa
	udGBekKypevude0pL8yI6/mvgtNfQxdGM6xnH6jrtyj2PjNJSzMNjwV8aI0uejbV5LPSstrIP4M
	2ao2RGdz17AgHMpJIrOYyGYVrfjDSS6CAv
X-Received: by 2002:a17:907:3f09:b0:c25:f7db:4bea with SMTP id
 a640c23a62f3a-c290446b88cmr6398466b.16.1788777263623; Mon, 07 Sep 2026
 03:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907084319.351688-4-blum@kernel.org> <20260907084319.351688-6-blum@kernel.org>
In-Reply-To: <20260907084319.351688-6-blum@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 7 Sep 2026 13:33:46 +0300
X-Gm-Features: AcwNN1VffgvnaRhRlD6uHBYo6Fl574uE4g4_q78txLgAdLn8cRR-VrD4lzKeSJo
Message-ID: <CAHp75VdrNu_7JzfrXFEv=ALoY4x07xD=Um8NxyVPNdiOk2fmGw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/x86: thinkpad_acpi: Use
 str_supported_unsupported() helper
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
> Remove the local str_supported() function and use the common
> str_supported_unsupported() helper.
>
> Debug messages now use "unsupported" instead of "not supported".

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
