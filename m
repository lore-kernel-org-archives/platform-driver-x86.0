Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711C9261574
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 23:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753486786; cv=none; b=UuAPVL1u6z49+2NWfo37DduYmM/deUrHGewZAOm0DLu6qb7Cx4dllX/l9yyPRYJ71tQQRLi+gDWvHVUJ4xNXwMhBLDOg/bn1kfrrYqc5frnA9Nfv+AmhteZBCVeD3Ub//GHyegB7YqFQzSlRi/cRQYXk5D/t1XSMjUMtW7qAR6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753486786; c=relaxed/simple;
	bh=ENp0MAbfhyFMdiKxX5yT2CuR8vq6w7I7WzGENlZZbLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VFoNL7om16u21+fNZHWXsbobB/BshhfK61YMMcGeqlad3bK8WfMcy1YJ4crqAfpLnxUR5jYyVqkPZfi5KKIqEL18HzmuJj79yZijzWtEAiWQ1EXqxFNcqtEYaugOv9blkY0Fk14APP8K/ZsSnmuxS1hXrH4hAYb/DDv7jjQxfM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O25chSj2; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O25chSj2"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae708b0e83eso499743566b.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 16:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753486781; x=1754091581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENp0MAbfhyFMdiKxX5yT2CuR8vq6w7I7WzGENlZZbLE=;
        b=O25chSj25SzkSSeuVKFUoEa8Pwseyso9TA8nMAc8uG3bGC42w/nH7NfEvFhwIXGtRK
         bLqeunNhIl+ewfatGf4MkQRiADH1Db7meefEq8EJ+tw+M7P2vMM7T3J9rXubnxEklCQs
         OpmxYl2FjBqH3bxLNbzaAvIwZ85jrrR/aFx2Zgm7yqKMs/Q3ACkzIZEv9xkRVP/OQ0aX
         GNddvmJYItVKEVVDpYCncMcvrC/kJ8Ezp34MLCfF8MQgspS+IqudPxu3VwrR9y8Q/p8l
         DQT/pvmrIils0zlyfLhaPERVyJlZsLKtlGnvZsX/cXC8oUBX9iGCGCGfvKMlp7/ffFEp
         cjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753486781; x=1754091581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENp0MAbfhyFMdiKxX5yT2CuR8vq6w7I7WzGENlZZbLE=;
        b=bk8junBQpFzkxRWT1Czi6b6nlgOlGoy8AN+zbIJ+PiNIxDJldcvuJGNtG3DcaFmaAN
         g1Ujf4L2X/BgsuOZo8N+0igkq1CF7AU1pGvvU5kzOEkLxLFBdMgvqmeEnz/yP8z0iBIe
         ZHN8Ss38ABrvjBeQa3gJnNNVVZQYcJVIQvE32l/4IjKqQiXOQRrPxq10J8lsY80dZK2o
         XIkUIzgVsv/2lK4ZBbaGvuCrwcCLzucq/SPoNpM9x74JIOu2ixCu4MLvI4MnpK30NRT7
         or6QA/AUIpoe3O97Xm0FXamneLnNoumU3ze15mSyBcsNEzA+GL3uvH1Fq4jbo3jC+7xD
         LQvw==
X-Forwarded-Encrypted: i=1; AJvYcCUfee8J+w2BZfvK4+4E7efGahrlMGcF0pgQzYvrkuOJt04uh+KJCx7hGHxS3um+dNm6in/dYd65MYJp0zGmWrnLDRku@vger.kernel.org
X-Gm-Message-State: AOJu0YzKCjEYyo99Ejd4UuT33wFxEQOywROx+uFemquwSRpP7uZSbn6k
	N5h5wqwLPp/7cWJhVNcc79h9s6KB07X1xMwCXnSzUs5RopKw8Rv1AdpZzRq832ywsIdiWmp78ad
	AvZge6Jo6Rt0P/ACxWEOL8eJNihsRWd8=
X-Gm-Gg: ASbGncv+ANHDaN2LJSlT+5dJr483XIssl+o2kLz3YplK4sCRuMy2r2TY2gdHS4Bv/8U
	TUBflcsJ95UpNFGQQCGO29S0VKIfG8e/t/KDhZ7ZkPoejfRUgUDrV4mkz+JHB+bLSPrh7SBuzL9
	821+hQBXK7P2zVrV3T4lg3kXYs+Us4kBG+lgrbByMgxytkAuOwpd+iul8b8cGdiudw+K9Afs4y+
	nldPbVJHZ2cBREjtKJW
X-Google-Smtp-Source: AGHT+IEtumwNLY1cvOgxuusoeDiHj21WqU+AXPPhywUh67wTdqLTT8yYeeuLq0ALtTd58G2hiRyZfBqe1AD6h3HU0d4=
X-Received: by 2002:a17:907:3d8f:b0:af1:2d10:9b19 with SMTP id
 a640c23a62f3a-af616d05747mr408490066b.8.1753486780621; Fri, 25 Jul 2025
 16:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250725215259.402796-1-hansg@kernel.org>
In-Reply-To: <20250725215259.402796-1-hansg@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 26 Jul 2025 01:39:04 +0200
X-Gm-Features: Ac12FXyV4ldplLQjpQNgtWMCY8giay-KI1C5r6NRSor92KGol3uJvALlww7kE_M
Message-ID: <CAHp75Vebw6kjSm6T9OntY1YV0sod+zhA56wmoto=WV1ZynxxHA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] platform/x86: int3472: Increase ov08x40 handshake
 GPIO delay to 45 ms
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 11:53=E2=80=AFPM Hans de Goede <hansg@kernel.org> w=
rote:
>
> Hi All,
>
> Here is v2 of the patch-series to fix ov08x40 based cameras not working
> on several HP laptop models.
>
> Changes in v2:
> - Convert int3472_gpio_map to use C99 initializers
> - s/enable_time/enable_time_us/
> - Move enable_time above con_id for better struct packing

This version LGTM, FWIW,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

(one nit-pick in one patch, but it is minor thing)

--=20
With Best Regards,
Andy Shevchenko
