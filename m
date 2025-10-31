Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15042690D9
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Oct 2025 01:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761875816; cv=none; b=IyD2c7MFieUE6BOUoUybydEioStUj4sxXZ5Mw6eni53bW6+Hw+W5cx6qaifxu/cjNapZ/FpgEkpJHXpGp1TBigbxKXvs7Sv7DZtg/25+UFtMQmKGyTDgO41jJeBc9jJhvlcVx0o0DhWBAp0WykXQkUNSCJ6x0Z+5O8wRnXLcXy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761875816; c=relaxed/simple;
	bh=CZTds3X6aLw+PBJT8jGzhmUg8shr79vJ9ejoYot3ZlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdR+KWND+qRSjVXYK1w2SfZ+CNNrXU5xqKpj04pW9/MWMokFFqUUcJiJFmVThSGPGMI1tmMAy11FRgloLH7SA49KS1PnTZo6I55dHkvrGayz/2bujPzF7Goev1SWTljxuxl0IhHZp6NS5y/nECmeYEdPy6Y/DLODxhUlB8j5qi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2GBhAG4; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2GBhAG4"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-87fbc6d98a9so14309666d6.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 18:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761875814; x=1762480614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPm8hhAmizQjOcUpCPxb+6jnF/zsbuFZoDm6e8517P0=;
        b=Z2GBhAG4VhcpXutt27b2Ebwv7o+OqaJFRLv9ETTgAhQEi+XZkdqywVPGnGQuvqts/D
         lHrMtNzTFLiVe8FsbUmUzJzfxVue67cCrx8qsvP7MMGP73kyWsi7opaYkn3n+wY29S1k
         lhZEBsUR+B4f1iFMI3Dr62nlwZBQGOW6yBO3la9Waxd+iEkmvp+UqVraj3n1rJW7O8Ny
         kgXyKe3j0nUZPAJCPdlQM6PzUblMm3y4jZDEqZSNYF7zln2QwFJviRqah1kbzrDN6oOc
         rcf0G7XjReYjVEJ+JoXctgkg9tLQtkmnYZPHfHgnSKPB3l+uOUv/+Gp+v62ikXOAiCNW
         4B7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761875814; x=1762480614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPm8hhAmizQjOcUpCPxb+6jnF/zsbuFZoDm6e8517P0=;
        b=s4rZwDesG/p1GLyRQevqPzu9lkSh3iCS85i14/RxoBOyXTEPI0FkXygx9EqoQyl3kH
         wZVAS3AcwI0dEHPoMeEUt2N/zOxJRcgEA6OY0SAR4OGXOAHe4iE8ZzCPLtxH4Qa+r+VW
         nFyxWheyANqs9rsD80KNJLNuHKXhdLEojnzHPPZvXIGJyfQ4mNc9D5k1OsWlXbMttNku
         hlovgvpoTw+zO8esw7dGq1AiM8BLL1UDc1bcgHXRtvuTWTVUFPiFcrwGW9khWfSbNWaa
         TtHxTfLEJPG13j8y/r/wwyKUUDZqXE/1VmkOuDLiVCDegq+3mLDG1AZkT1k0jQFrPH1M
         AQAA==
X-Forwarded-Encrypted: i=1; AJvYcCVQqvfdqD7DjLVdn5da9dKqGwcL0XMhKERCjiSuM4HPCnGMdJfK6hS4nTp5g6SPY3ffoG/suTmdNq4026t7/NU5G9TA@vger.kernel.org
X-Gm-Message-State: AOJu0YzYgVCubfe9fIwfBvsozg/S6PeiY6JpYc/xqc/d6LhTti1qOsgm
	z85rOCMHP52VOpmnzOQhq5n7+xAmDkfZbM9plkHLXElIoZtLdmzGEHnCiSwGFI5hXaxNefysHKz
	bFo6KrpwcBaFs/H2xgtP7Mrc+B4aaZp4=
X-Gm-Gg: ASbGncuCLQdQC0BKSvgGQT/w0i8fJKdSsLpMg5hSHYzehYbM3Y6m2p/Hg+uc/PlMgtJ
	lPahZ0jPNL83/fTDjLTjXfqZMTg9dnQzgDybpLNE0pZJinlY4bD/OGxMJJ2PFPkQTqRmoS/Duh2
	r4BD1IXR9BYmO+0zK11I/nPlvH1p+dRrahojEn8uRtIgXXHLX4W2cZBMlRu6/U3F2M2W/odYLSh
	K61IMZlXvbnwpcZAWGsBhWEcl+CXjJaQ+2qpe9t5X9iboN43czpgN2Dr4Jr9aMuhtuioVlP
X-Google-Smtp-Source: AGHT+IGHRNW5ve9MfYrIumeQT60Oe/ZI51vPRQHltGYBjI9/W3Gf4lJ6TGxJq9jXE+9SVtlbRGsEi+oN5NDYG3LHztk=
X-Received: by 2002:a05:6214:1bc9:b0:87c:43f0:374a with SMTP id
 6a1803df08f44-8802f311f58mr22293466d6.29.1761875813700; Thu, 30 Oct 2025
 18:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030193955.107148-1-i@rong.moe> <20251030193955.107148-2-i@rong.moe>
In-Reply-To: <20251030193955.107148-2-i@rong.moe>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 30 Oct 2025 18:56:42 -0700
X-Gm-Features: AWmQ_bkH0rMtZc34Jno0rHVU5V9xM0sKsjwAUSR9O4U8i-gPZnLXJxpss0mop7A
Message-ID: <CAFqHKTn4tEqGpTpyaWEMUHvskRux1RHGxp89tWr1UeYgsnsV2Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] platform/x86: lenovo-wmi-helpers: convert returned
 4B buffer into u32
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 12:40=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
>
> The Windows WMI-ACPI driver converts all ACPI objects into a common
> buffer format, so returning a buffer with four bytes will look like an
> integer for WMI consumers under Windows.
>
> Therefore, some devices may simply implement the corresponding ACPI
> methods to always return a buffer. While lwmi_dev_evaluate_int() expects
> an integer (u32), convert returned 4-byte buffer into u32 to support
> these devices.
>
> Suggested-by: Armin Wolf <W_Armin@gmx.de>
> Link: https://lore.kernel.org/r/f1787927-b655-4321-b9d9-bc12353c72db@gmx.=
de/
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v2:
> - New patch (thanks Armin Wolf)
> ---
>  drivers/platform/x86/lenovo/wmi-helpers.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform=
/x86/lenovo/wmi-helpers.c
> index f6fef6296251e..f3bc92ac505ac 100644
> --- a/drivers/platform/x86/lenovo/wmi-helpers.c
> +++ b/drivers/platform/x86/lenovo/wmi-helpers.c
> @@ -59,10 +59,25 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8=
 instance, u32 method_id,
>                 if (!ret_obj)
>                         return -ENODATA;
>
> -               if (ret_obj->type !=3D ACPI_TYPE_INTEGER)
> -                       return -ENXIO;
> +               switch (ret_obj->type) {
> +               /*
> +                * The ACPI method may simply return a 4-byte buffer when=
 a u32
> +                * integer is expected. This is valid on Windows as its W=
MI-ACPI
> +                * driver converts everything to a common buffer.
> +                */
> +               case ACPI_TYPE_BUFFER: {
> +                       if (ret_obj->buffer.length !=3D 4)
> +                               return -ENXIO;
>
> -               *retval =3D (u32)ret_obj->integer.value;
> +                       *retval =3D *((u32 *)ret_obj->buffer.pointer);
> +                       return 0;
> +               }
> +               case ACPI_TYPE_INTEGER:
> +                       *retval =3D (u32)ret_obj->integer.value;
> +                       return 0;
> +               default:
> +                       return -ENXIO;
> +               }
>         }
>
>         return 0;
> --
> 2.51.0
>

Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>

Thanks,
Derek
