Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3171E49B
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 May 2024 19:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715542408; cv=none; b=JpxRVWv529Nxaxhe48nQ9as5Ja6uZwwsMN7FjBL/BPL3v7ydE11PjZl3HnuNQAQgqBuOABFynkEGrLFAyzhlgR3V9zchUVTuu4DB5TahOaxGYajGfMTNv6uEdtSO3XSUgWRGtTE6VX6VgaKZrpYBYWfrfL/6KsiTtv+UKxl3/3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715542408; c=relaxed/simple;
	bh=rzU1/ktgt7GXfoXiSQpDf8FklTVopmbDFW+SXGhjcHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZkHdLajdcj1/vUsgFHQ7/HJoRHjrPGmN1T3LStF0eSGKxPqyL9WBKN1PwAoDxCAab+8yBPgpIqz7u9OwSIuRgFfcKXKjCQIDCBGNIEKOo/V5sdwJSDZj22JlhV3jyTLbz7uUGqSGm1ncEQTB+bhUf9pRMwJGiMVTU4/G0tPZM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzY0t7k0; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzY0t7k0"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a5a5cb0e6b7so139884166b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 May 2024 12:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715542405; x=1716147205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPbb/ndu93CIrieLQrrw9oAfYz6zGI1nbYd4v+MxDpY=;
        b=UzY0t7k0GFYAuvDAZjvQwjYiAacrL6SHl74VbCw2Drv7JXSjir914uWN7/Yf2x4ltg
         /ZNxiyCyAohPA7dFPFLEAO8QFM7FiEr6cIG7R8rmk1PbansxGJ0L+tgdQw0FhVUs1pUQ
         XwMCPzpkrv+or9F7HTuZM6UIt/bX7ClDXg99eF6+F+cCj7qXs/K7bM05p4BIQgmBkCXg
         nBj5GcY7Wxsr1ayq9CB7NvM3mAtMvQ7/oAXlCq+eKjFMHCm39ubyDxxnfhFh1RGgheIP
         Fv5mS6T3AwOO1HX7HECvx7SY/xZ8T6gj6YswYoFm8KVnyFjKhVdrVzuBVyHDSKDiH8VA
         sdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715542405; x=1716147205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPbb/ndu93CIrieLQrrw9oAfYz6zGI1nbYd4v+MxDpY=;
        b=j4yWe1SfvaiJ4hkjaSv0S43qmcOZlQ6kvvqIBZE0GXRmTu4sAMsN/FAxd0Rri0p9Za
         4paeL3VLQqnXqMXH3c1jCv9MjxESvAfq4+igDp5GPrA5lbJ67424GlLO4QLIX6iLMRDh
         ATra8FHQeoRtWYrCOcQ9hTb8uja34nYUErtZQMFydFmuYX8LgTNy1a215MCq44MZF4WW
         UDpiHhU9ePERWwDbSkGdKE8qHYJVzOmvQLdVGvgS1ta80S5TK+rTO7hdbYhSregXBb7G
         SAvCghez370yWk73EoSCFudmdboDmUXGiOjrGd4duQ37b3x2gdvslLQSKYo/5i3T2omy
         ijig==
X-Forwarded-Encrypted: i=1; AJvYcCXhjUV1FbJPDa7WgTPVAR8pPWFcSS7d7XfkAWaciYe0JwVqeLBxxdk0lllCub4YsvcpvB8HWQI9GUczIssUv9AFZtN82KwkHinhqVxW0HgMPdGOEA==
X-Gm-Message-State: AOJu0YzFc48Qt8RY3JwRxn4V8LGk9GlMkelQgFn9CoyOXEWvTQaINyGQ
	50bW8lg6IpsDZpSolhmZM4InLOKaWddXyDwh/d+MvloASWqtdJqVQ/miehRYJg8p0BPkGKtz/ZG
	9hs4pvlsVNy1xaC+ySKso9+90GImRApeD
X-Google-Smtp-Source: AGHT+IFgL8u4dqtLwpSxbxXKpuof0Kn45VRkptpmjmHsgkErsD5dlZj43Zqkv4N2tj7E0FxCepLeG6Xr+81yY5GVdMo=
X-Received: by 2002:a17:906:abd0:b0:a59:ba18:2fb2 with SMTP id
 a640c23a62f3a-a5a2d5cb382mr461327866b.35.1715542405162; Sun, 12 May 2024
 12:33:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240512162353.46693-1-hdegoede@redhat.com> <20240512162353.46693-3-hdegoede@redhat.com>
In-Reply-To: <20240512162353.46693-3-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 12 May 2024 22:32:48 +0300
Message-ID: <CAHp75Vccu8gse93ZcYGq08eoMtJ5+vGTWOs2yvBkSSit783bzw@mail.gmail.com>
Subject: Re: [PATCH 2/2] tools arch x86: Add dell-uart-backlight-emulator
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, AceLan Kao <acelan.kao@canonical.com>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 12, 2024 at 7:24=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Dell All In One (AIO) models released after 2017 use a backlight controll=
er
> board connected to an UART.
>
> Add a small emulator to allow development and testing of
> the drivers/platform/x86/dell/dell-uart-backlight.c driver for
> this board, without requiring access to an actual Dell All In One.

...

> +++ b/tools/arch/x86/dell-uart-backlight-emulator/Makefile
> @@ -0,0 +1,19 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Makefile for Intel Software Defined Silicon provisioning tool
> +
> +dell-uart-backlight-emulator: dell-uart-backlight-emulator.c
> +
> +BINDIR ?=3D /usr/bin
> +
> +override CFLAGS +=3D -O2 -Wall
> +
> +%: %.c
> +       $(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)
> +
> +.PHONY : clean
> +clean :
> +       @rm -f dell-uart-backlight-emulator
> +
> +install : dell-uart-backlight-emulator
> +       install -d $(DESTDIR)$(BINDIR)
> +       install -m 755 -p dell-uart-backlight-emulator $(DESTDIR)$(BINDIR=
)/dell-uart-backlight-emulator

Is it possible to fix this to (at least) honour `make O=3D...` cases?
(See, e.g., tools/gpio.)

...

> +/* read() will return -1 on SIGINT / SIGTERM causing the mainloop to cle=
anly exit */

Interesting...  usually we handle error codes, such as EAGAIN and
EINTR from read() syscall separately.

> +void signalhdlr(int signum)
> +{
> +}

...

> +               fprintf(stderr, "Error opening %s: %s\n", argv[1], strerr=
or(errno));

> +               fprintf(stderr, "Error getting tcattr: %s\n", strerror(er=
rno));

(and so on)

Wouldn't perror() call be better?

...

> +               switch ((buf[0] << 8) | buf[1]) {

byteorder.h is part of UAPI, you can use it, but OTOH it might be too
complicated for the small thing like this.

> +               }

...

> +       return ret;

Hmm... Hopefully you checked the possible returned codes, in user
space it's only a positive 8-bit value used.

--=20
With Best Regards,
Andy Shevchenko
