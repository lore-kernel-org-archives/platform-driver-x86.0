Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F6733987
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 17:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734973892; cv=none; b=DAgefv0R+EKIeyGKon2cpvLruOy7r0UNHchDhvsEKgTGjoU3nj1kKUVpgQQoYCEVfXQ4FXoaShoSTpjV6o/X05pSptYmahS/F4GNV3LdQkDqXUzQ8Hf/jk+8LJFZhzIkO/5yRCZSYx4yUZ8WGy00LVzHINaGhWNL/y3k/Z4cjlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734973892; c=relaxed/simple;
	bh=yrf8leQeEihXwV3nFjA1M7/Yf0N2uOxU4xOp/IJdFa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gx2oR/VPVhjDLIB4qkuIGSkCe1zp1XzFGaqli8Mu/2DvxYJQHy8FzoiQfqPbk0lbDdFFWmRWfBD9ZlpQB4P6dKM8HQN+AmlMKYE/XqkPTUlHMVxZNAwzMHG1bBE5lM9YYJtt9YyvEEHzAUh8VBzu8wPqb0yNw5rcmGpcHeRfnyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsWE5D1V; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsWE5D1V"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso7244783a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 09:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734973889; x=1735578689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxnkN++5zriu5UwmZ2aZkMCNM5tPxkxZV2F4iz3WWnc=;
        b=CsWE5D1VyNLL/6kHG4cJG0HEx9T3zryXnEQg63ir3mE6AO4Us9sZAr69Gfw0biRJGt
         fOvmW5V0NonIIkAp5gHuaqdpVZcXjIemX2MR6pcKh3vGsTF7+9rNlZj8UfdhwufzIfMI
         Vlc4gsNP8FaVWrtbDG7ygTyDqziCpmQqjfXWg4E61tpsci5u8n03mbg7N2HYcD8B7zFj
         KBsx1bsojfmtruaTuJLZYFkx819l8wAgrw/afMBk2DcIWRXo7II5fwg0ld4tW9maqspJ
         jDDLsi8nJqFAaFxTrhxz61vSjV91YCWRVCAjxtmA2tF5/+XhroZcuJnQ5edk0bIEyCoB
         WyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734973889; x=1735578689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxnkN++5zriu5UwmZ2aZkMCNM5tPxkxZV2F4iz3WWnc=;
        b=fGz5/OXeWFMhQ5WpcZm8BcG+QykErkmBenstLykWI5LXsu5lvh2tlrOS1NceJwNsK3
         61UOUdmy90915iATd9t/yn0/9M3b44R2btmuHtvVFXapvPRi/uWrRX9geElgu92Ciuud
         qSj0Vk17qwE0WXK+i8PdN6XS0axQ4XjbPqARHxIUYM5vbsDOy99BnCK3Jss7DvUc0J1d
         dtlNWyCDZ8dfdrZRnroO8XJn0eI1jbILVBuJ/bvLZbslI5DrXlSKQzEP1nvgAxZ56l3j
         QG7LwscPMUkMLGH+x6pjCY1LnCW0KztzQe2lftR4uIY6GqeuyIGl6ZTv5331OJPKih7R
         LNVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqWSVuVDwaKhfwG78tJIabMktZGxZFKjOZmOipyBKI/dpTWsno3H0i7PYDl3Bc8czrTwAgrHviuce0I8B3lRT/oeCR@vger.kernel.org
X-Gm-Message-State: AOJu0YyBxr2rc86S1v0llPaEybWnYlJtrKBX5vJEYKf/oENZfmmKoQx3
	3TPkbrHPUVQbP04FMAN8o1UudUvReJ33zwDT4CiGc0/+pbTy/gNGgk5QegmAEeszXYD+LQ3cRT8
	dHOjizg8QfLIzcDtgvpcxhB4Wgfw=
X-Gm-Gg: ASbGnctxNhrOy5ou1VahEQjeRUADo3ShWnUqGxYkQGfwWf1wALX/LjBH4216Ixr/QFh
	31bNPS+qEHyzI5icQmV++Gp7kz8EbOIfvq+KcFw==
X-Google-Smtp-Source: AGHT+IHSlN2ZseCUEEd2llRyAP9bvSWCSfOXxsKim9+5JSgcfm6qF+8Nf8uyFbqx5LwgkFrU499XGnzCcjbtvJC+TDE=
X-Received: by 2002:a17:907:97c5:b0:aac:431:4ee7 with SMTP id
 a640c23a62f3a-aac2883fe8fmr1339469366b.5.1734973888399; Mon, 23 Dec 2024
 09:11:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241221111103.26124-1-hdegoede@redhat.com>
In-Reply-To: <20241221111103.26124-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 23 Dec 2024 19:10:52 +0200
Message-ID: <CAHp75Vc1tTo1TO7H4WHt=JWV-FYJHqL0xV95kmyh0VEV64cbBQ@mail.gmail.com>
Subject: Re: [PATCH v10] platform/x86: dell-smo8800: Add support for probing
 for the accelerometer i2c address
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Paul Menzel <pmenzel@molgen.mpg.de>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 21, 2024 at 1:11=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
> of the accelerometer. So a DMI product-name to address mapping table
> is used.
>
> At support to have the kernel probe for the i2c-address for model

Add (?)

models

> which are not on the list.
>
> The new probing code sits behind a new probe_i2c_addr module parameter,
> which is disabled by default because probing might be dangerous.

...

> +               pr_info("Pass dell_lis3lv02d.probe_i2c_addr=3D1 on the ke=
rnel commandline to probe, this may be dangerous!\n");

command line

(mind the space)



--=20
With Best Regards,
Andy Shevchenko
