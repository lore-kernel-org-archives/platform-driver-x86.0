Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE4A393DD3
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 22:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787608912; cv=pass; b=g3bEfg+eGWklycmxg+6dxs6j2UGNbj96eFrJEuAAtHwLBo1bWpYUctPSWiW1Z3jcRInXnxcI7U0UXam0Hxvg+EakpgEvSt31JKdbfeYOiQKXZvFB7N6CrXtyUcLsvUIuPFhmxB/v39NmenO6U82b8OwVtI6GAicwlj9XHnhd13s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787608912; c=relaxed/simple;
	bh=sLF3qFb7K+zvz0kcFMEnkoirbnuUxrHy722g0dKBchM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dkQJycYdjsQ/VIoqunJz3zYW+zUTyon/UIsXTJz3/BF0+ztDeR74bZHALS/hCp1anwPrBi3ReMM7kMz6Fd8acHHcsdwCxlXMG5RYwM0E6a8GQTu4esi+tIumoJinH1aSHotRML3/Lec8UGOyZe8383wDNRkRlwnUDCg7PmZnwH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRbKhluu; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRbKhluu"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c167aa9500dso615103166b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 15:01:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787608908; cv=none;
        d=google.com; s=arc-20260327;
        b=L/mctXirrlqu6/SCNKR2+f9gD7N5Ccgp/1lPMawqIl3W01SkhE4LrDtEh/huZLbO2K
         fbgSsv0b3kv3JgRF9tidBYrf5oqW9TLegSKKA5J1xaTbQRbLXQTuGQZitRYsqFEy2vNV
         f3nWFT7HNw9ENFkpmy3kFWG0vC15wWw8EZNBWyTLpKsFbdK2iNpWb/6dK6haBNBzgSue
         CEP6+KfkcsuoZIlYAZkCfqznxmlOXG+SdoX89mQH6kqJxGZBO8r/SvYgXyhsmu9Trvdk
         sQ7g4k8jssetel2/yRWqlH7fChJutcoUHVXa1/5CuO1BtCA0klZ8oPijwjX/4kmNC2dc
         yX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9O8TZ4Zc4yxkoz+/FkAzEcOMlvTnBsH4M7ONLlz9Sjs=;
        fh=SM9F8t4ksxhWRrR26kf1wNgGa4Prfz4ADLp1/K6UliM=;
        b=k23AuoLtqETUgH3k7bmMeHOkzACBtPDUGIHKniBjXmopmCJzsZwF0VrXhG1oizsVqI
         RrLgQN+fe6TZHzRmV0ghqqIMQXRXjvJE+2h8VyNVxmIGm+xBfwAPCAroIRJkYk+HU8Uq
         x9Z5UN2V6Dp4g+Py6QUBkafLhhjMFtoO8rfw064JNL9WBh5GHmhUhbnX4R1Walx+77P0
         6XQYjCnqcJpQOAiWUFfSn9Wfd1GHym5nQSBEm1HVkEMaial53gsjLqRZsYhwxHWfRzvD
         QowJ9cmTtOd2exrwq60ukyzkq23VBLue1oJR5F288vcyo5fRJunns1uQcRobeLAm2uEI
         xAjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787608908; x=1788213708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9O8TZ4Zc4yxkoz+/FkAzEcOMlvTnBsH4M7ONLlz9Sjs=;
        b=QRbKhluudO13w9Zk6DR28k61AAyzk80hP0LwdCF7Xc1n5wICUfOEILTGEK5x1JgCVg
         QsYK6P4Iyno6AKA0TM+D9+4ig5G+r6vp+DD8KDqFI0rPbZeCvfbCQZA6gZGu8bBxXPgW
         FTP+5BDsqSvRDdL9bPr1xVgYIyo8YuqRk4m2f/XfvEDx0moPwN15ylmzJ4NP+7se5ub8
         gomQd3QjBzikjCjPXWoDOh3ASn+J/BAx4sTAH090M/q3X3ZnHckqpO8ug0Qvke8NEmjO
         iA6f1HNHBOJpaysoj5YNIworDVOZ6rdQ+FORC6q6k+4U0Hyftx3MHQJ/HPGCJsR4sCrx
         WqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787608908; x=1788213708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9O8TZ4Zc4yxkoz+/FkAzEcOMlvTnBsH4M7ONLlz9Sjs=;
        b=nQQQxr89BvxAPOUEKjrG5Ub/QrBffoscNKw8KnkF4lRFibpacud+FXwV1dEHmPdBL/
         tWUySVNcxVl0P6sFz4B8WRJYIt3BYj1rwKaDh++VilrJG+AxhH6eN+WIzDqHrY4I/g81
         6ZD9Kk/oHe5sEF7mNTfg5MW0JSv35jyCBChvI1JXVr8ApYLRyUoQZfZVMvPTr3ZQDarL
         T0rztJfweWuKi4S6Pwe8pWtnwWrAjFQO7D6HUMCF4ypm4w8WbckjQaL4VOnKwZP1A66u
         EntAcgnhOqs44HGTBx4l9Pp3KMiyjgRJrgcFbybhQupVOD1qxfS1r9gsKMBy+eUdV//g
         30DA==
X-Forwarded-Encrypted: i=1; AHgh+RqRg2n/ZvU7e6ZZqykXrKXPpCT/121SPFaJh5nh7sbyZS/hlsbr5Qag0YBDWHVH4RNHTo2xvAajkQJ9CChfKRHMjKQr@vger.kernel.org
X-Gm-Message-State: AFuF++kKV7r+SppQe8ZQYJPm2ARus/U8SRdLtuflZqP8Ccc2vMLt3biN
	BvAGcasS7fpyXBHNthkbBYj8g93BX95Cvx/Ne341Z0OdRTXtsmikQE07SkM1ApiSCR94Zs90QVQ
	G3g1QAkMMiDOAK9o4Q6Dhny3jC0mZaHU=
X-Gm-Gg: AR+sD10ZG9wllbRLQIf9ywcX5JnPQV6MVbWg8HzDnfvjzJR0TMp4bbhOaLozwyVzzLm
	shpbvV6SJXltjWUJF5sxbfft5mwciFmTZt6d+0fABnsLDBOYbcbgdVn7igcTn1jQag3tCtDPqmc
	SNSx+ksDEPcYvuer/jUQXjGC4w0yidKMZrnWtAjXhXwuw9Z2Y+bn+4tRE3aj0/796f0hKrF8bNQ
	gBa1Jl7flWCS4acBUgFPWEJXFb3lQjvAtyzSaksUmxSEwfGK1ZQpyEIZY2QENW5Sop73eTh/rXP
	IwqnlujrJb87mJxuP/0ByetoBkLFiAuZtSe3xlmrLpP9Hc8ElHBZ3EIik3NSQawPHAxz83zMriZ
	iP4JW+x/8HG1w29rMUjOc9nT/0GQs
X-Received: by 2002:a17:906:3e5a:b0:c20:2165:d74f with SMTP id
 a640c23a62f3a-c246a6ca4f5mr2710815166b.22.1787608908203; Mon, 24 Aug 2026
 15:01:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH4cXPgq6hUiGqyk4BDYcbnmjLxRM_2uM52uzc2kCF-jDc5Q7Q@mail.gmail.com>
In-Reply-To: <CAH4cXPgq6hUiGqyk4BDYcbnmjLxRM_2uM52uzc2kCF-jDc5Q7Q@mail.gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Tue, 25 Aug 2026 03:01:35 +0500
X-Gm-Features: AcwNN1W5UWcxE7Y2mG69xDHnTZuT4iSd9qTJ34mMSygYk4rnHMfWANVNCNghFAI
Message-ID: <CADqcGBnbq9FrTz5R+=4W8n+xkWdeaOgqy2DfiOFDJX9DW4Jjfw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] hp-bioscfg: fix attribute enumeration on older HP BIOS
To: Luigi Maria Vecchioni <luigimaria.vecchioni@gmail.com>
Cc: jorge.lopez2@hp.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luigi,

Thank you for the report. Good to know this affects current 2026 HP
platforms too and not just older ones.

The AE_AML_BUFFER_LIMIT / WQBE error you are seeing is caused by the
hp_bioscfg driver requesting more ACPI package elements than the
firmware provides. The fix was merged upstream in the following commits:

  b0e2af3ec94e ("platform/x86: hp-bioscfg: warn on element type
                 mismatch instead of failing")
  40e10e6cc8f7 ("platform/x86: hp-bioscfg: accept reduced ACPI packages
                 from older HP BIOS")
  1d143d78299d ("platform/x86: hp-bioscfg: bound ordered-list parsing
                 by the package count")
  e0ddfd77c0c3 ("platform/x86: hp-bioscfg: pass validated element count
                 to package parsers")

These are in Linux 7.2-rc1+ and will be in the 7.2 stable release. If
you are running Linux Mint on kernel 7.2 RC you should already have
them; if not, upgrading to the final 7.2 release or applying those four
commits as stable backports should resolve the issue on your machine.

Thanks,
Muhammad Bilal

On Sat, Aug 22, 2026 at 10:02=E2=80=AFPM Luigi Maria Vecchioni
<luigimaria.vecchioni@gmail.com> wrote:
>
> Hi,
>
> I am writing in relation to the discussion:
>
> [PATCH v2 0/3] hp-bioscfg: fix attribute enumeration on older HP BIOS
>
> Message-ID: <20260704160759.236249-1-meatuni001@gmail.com>
>
> I am seeing the same AE_AML_BUFFER_LIMIT / WQBE / hp_bioscfg error 0x3
> pattern on a recent HP platform:
>
> HP Laptop 15-fc0xxx
> AMD Ryzen 7 7730U
> BIOS F.25, 04/20/2026
> Operating system: Linux Mint
> Kernel: Linux 7.2
>
> Loading the upstream hp_bioscfg driver produces:
>
> ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Index (0x32) is beyond end
> of object (length 0x32)
>
> followed by:
>
> ACPI Error: Aborting method \_SB.WMID.WQBZ
> ACPI Error: Aborting method \_SB.WMID.WQBE
> hp_bioscfg: Returned error 0x3, "Invalid command value/Feature not suppor=
ted"
>
> ACPICA tracing of \_SB.WMID.WQBZ shows the failure with:
>
> Arg0 =3D 0
> Local5 =3D 0x32
>
> I thought this might be useful because this system is running a
> current 2026 HP BIOS, so the issue may not be limited to older HP
> firmware.
>
> Regards,
>
> Luigi
