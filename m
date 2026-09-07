Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39594457A6
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Sep 2026 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777118; cv=pass; b=T4p31Cbb39GDPBpJ/tFTkBT9oKkzZSUj7cfjuyjGC0DcxZMzlJ5WToclrMI+P0A7hFhXG518jdwnGYeMp8ihdbimck7+hHdjdU9a4lb9ckHAsW1QdJ3W5y5OhsfpnKuZyLf8T9KIHFhP3A8zqgp+FCGag4kMpf5a37DES9qP0zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777118; c=relaxed/simple;
	bh=Xw+HRlcvjW0U6P6qm17Nuk1JE3pIENaL9TJbCB4UHJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rna6tkOo7G6RlOEJnhAO2EF0g51TaNsYY1VSS8EFUJo3twT5UYqfmd26fu1WNADxvzwOkZwA/iGCZC6ujKYuqjMhrX2xTAdNsfVpd+WbTSdqd21s68323xRlZUVEcPaASoXq09l52IP6JbW/nGNH+7/e7MQcSnpnlVxGR1TY1HI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwiq/BqH; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwiq/BqH"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso4548463a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Sep 2026 03:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788777114; cv=none;
        d=google.com; s=arc-20260327;
        b=sfG2ObmuTAOrVxU9r5gp/v8VuwbtZptqXaxsOlpPextNY8RqOBSeZrey0CkiNBGIcP
         EDMYaBiv74fNpwbbaXNk/gbotNqH1LfvSM4TkNlGRmZO7XhfCL/RlEnn8Z8ACpMl3FEl
         sV4dt94dbPKbVJd5fysVDd0T4jDvICDYu5uhE9zcssti8rVQydLN8nRoXt2DaeDdyE8j
         vAaIA7FK0uNIgLkjUYyeEtbdwRWHRDmH2IoxfMD7PiJQKkpSSUkg7tdw0TahRyYwzB+A
         5P2qdHU3PUqGYvU+N4Jazo//up7Hi+cdQri/Pdvyt5F1PLlV0AQlcEcfpMeJRm5rhaLt
         Xz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xw+HRlcvjW0U6P6qm17Nuk1JE3pIENaL9TJbCB4UHJk=;
        fh=2NWCmT73LPLR5mi7bX2s8rp/ns7F8x2WwWk0IcK9zoU=;
        b=ffk1sVgf6/EdTlWKT3aM0gEmQ6DyAez8gpk82wTAWTTwc20AWgCopqj1BP194F1HDv
         mBtHjLilI9EzsRSam1zi1SazenHYZUKgKFyVA7AkGVPxH7gIdbMQcg41dR7a0XAE/KKz
         udJ/ZHK8g1aZEOh+qFMEVIFmgx3XSA1g9qon5XPyHusGA8tA+6Tm7EHxuCQ5o/39kaI6
         ISSfx5jdI+yYWgmPotVRI6/WOLhde0pIvTZg76CCr4Z72DP0ffsIaM/OEEe76dblCg+1
         VagewU6kWBNAw+e9eHdmFUc/cYdgXYekM4KHvAHLpHpWaxwOJZ+qUe8Vk9GjFROVvL31
         pnyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788777114; x=1789381914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xw+HRlcvjW0U6P6qm17Nuk1JE3pIENaL9TJbCB4UHJk=;
        b=cwiq/BqHqSn+EpVYUEp2vsqmAtWZIr2X071/991/3p6FU1kQu0Sb6s1EK9i11exsqZ
         7hVqvtkaDdnWFKvdYTUuJiBQEH2mkj3W851jsUhFcFIftFd60YILwZ84GOHtJBEfDQmC
         FIykK08Cs6nSOu8rxsZJrmn2E3WuT0ArxkRnA3SKzN2JE2REoK3CZbh9tnTf8mqo3GH6
         sFjzTWUqSRjxvVdILLSAcPwtKlyBPuCxwIUAgnpNalMYme+i+BmncE3HdheUq3duX+FJ
         xhtNfMDgOoaWOBQzxxXUbGpyu/oYyZkhUAMJXjTR3fuaShjYcbv7aqhRXR9ywxVm9I2R
         1o4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777114; x=1789381914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xw+HRlcvjW0U6P6qm17Nuk1JE3pIENaL9TJbCB4UHJk=;
        b=Iov95EswaBrY//I39xtqX4IgqCvrc5d5Q3OR5771o270cEQ/NByInt1DiFmu25QoTX
         lGFaOCWpxj5YzMChsuj4RJjPHNgmQ/SAJIb/zh9bs82BbI3F301b6+sRLRLDqskoB5vs
         Eu5OwSpLGhgRLDMcsNuW9pwnfCwmdLEQ7RioU146guAcecd7u6nm5nny9udVoesWECdh
         tm/+92Nklmijfx943DvApl5ounIMZyoJcLCefhzREqUtCYPL5gr5uP1SrTSfkEzH4fEy
         Zt9kkpDZvFvFlhh9Fz26k+Iq4btlXAV7cyCfNvGk0GCNKmm0gPYKhqPWbOSU+LZqBT14
         c9Ig==
X-Forwarded-Encrypted: i=1; AKwUvBw/Rai8rmX6L9aaxjkowilc/NpTxcWCv3+Pv4vwKuoNjX81dTof5vCKS8ODBhhalqw8vHFMa0cwrOZNozeXkrOcD4XG@vger.kernel.org
X-Gm-Message-State: AFuF++nUqV2cupoGTBG8FXXIcPMvRpVsolnO9eLuYAg3MZIotYOLlbuz
	TGXQcMvY26b1JcyVuSCjM15JfeFI/RJ3RGjUdXos4nbGleGmUd4NSy5LmGqa8Pe5WxuBstL8+lC
	1u8/EPCa3SQfCMiaZAm1nz8N4+xC4PiOUo0oFbfacFw==
X-Gm-Gg: AYBFou1S7EhPCv26It/8QIGHzrHLTKLrp4YDuAQtbE908rZruuNihtnPlOBpC7PyosW
	w3mSJKyYinviW6haAMAUzRrNU3Iv5/YNegNUgnVhnu1HgF3uDqUPEbOGWWgIPHaGhuFlLqM7WX4
	Wdm9c1mijynnesUIK4wX6zqjrsJSQx7t/nzKEiGWhrrJX5DYVmA3on0sbb+qlh52KEvzmjWKuFr
	AKSOyDzpXvLd4IbW3Ncg2ibwAGBCAeRHaY+aFAUSLpi5BAN0zy1Ii8dvNgS+4+vwZZrZas76lxs
	tU3yr9NIb2lYY8GLFGem6HL9dIKT8uDdJ7DZJrP1QJo56w5/EPqwGmH0Y4sCADHo41gA8IDN71/
	xoJ1YcjreapALxT06P3OUNkKsWW5eoVoDgFWo3C4ObN05IS8Xd362qq1o3fHY1UG1MkqzSd3tLu
	g9FMC3aowPX7aynWnm4uH2OQU0ycUuSKg=
X-Received: by 2002:a17:907:3f98:b0:c26:19e3:e988 with SMTP id
 a640c23a62f3a-c2619e3ef32mr701672366b.40.1788777114250; Mon, 07 Sep 2026
 03:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907084319.351688-4-blum@kernel.org> <20260907084319.351688-5-blum@kernel.org>
In-Reply-To: <20260907084319.351688-5-blum@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 7 Sep 2026 13:31:17 +0300
X-Gm-Features: AcwNN1XM3d4ZDElQn3iIlQ6JTOd1vgZ6JbjOD4PpwcxjalKvdLb1jFd3p8gSdWc
Message-ID: <CAHp75VfwuHeoLhj1NHUMNTAjih=runLhp89-k=NgUWGA0RLiAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] lib/string_choices: Add str_supported_unsupported()
 helper
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
> Add str_supported_unsupported() to return "supported" or "unsupported"
> depending on the boolean argument. Also add the inverse
> str_unsupported_supported().

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
