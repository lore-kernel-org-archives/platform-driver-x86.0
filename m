Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5428923918A
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733336658; cv=none; b=W6x/LxKgMwDBehK39wrXihsiBnBX5OO8Df/4vALBeU0qUMNdLCRir0ISLBaFFSmgQmxGV6ISPUOEMHrFe6JU2gOUkUdgWDmHKmLxZXy+7KGZejIHYwmJakqA8lPjKiO6hvUVhJ5RhmiZVEqQEery00XQ99nw5WXzCabnYHb6W/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733336658; c=relaxed/simple;
	bh=qkAsxzqbDgvuFfal+02fXqeULJUd5U0tUOQuh3quxe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iTwUvalFzEuI7oizPNKnHztn9KCeM1CiTThIyIa1rQ31VZ7xpKzfXataBOAY/FZWEoeCkvHg2GJVgkm28wD+VJMOm/ztGnRnOoVOTBe/kbem1PAmD4MB2nlsGOS2BuW6fRttI+aCoz7GZY7BQpzLxD8W3RuI0nMFaYSyXzrfYtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KK9PJoLJ; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KK9PJoLJ"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d0e75dd846so5404262a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Dec 2024 10:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733336655; x=1733941455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRetZTPNxOXMzPZ9T2wErtrI5vXs4SiY/11l9IQdZq0=;
        b=KK9PJoLJ12Hd7PHhEMS74GZcYrXuT5CD/eau4LaBCDKrpsNvXdHmOO6WWO19Hlxp0p
         NH509iy3ZXeeN+WB14mYqZlJlpy8gqFR9s2c1xGSSCcYEyZJ6bzKmtNDtHq4eJnDFJ6d
         P661I+V7QNVigD+f+U1Towm87EJjIOue3ILe2KRCrCeGrytkXdrHAAdMddnsjaPOQ9e/
         Zrt3Y+j7rTiW4cB29naKOuxZUlhkiYgLZZTED5df16IeOuT9CJt/Xk5t+z05SWlGDvbw
         1GiO6UYb6t+Tb105QfZjs8A7zyTEpe8k47IMB3wpiRXaGLyNMlyXYK7Kt+PSrP+gz6Ks
         Z1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733336655; x=1733941455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRetZTPNxOXMzPZ9T2wErtrI5vXs4SiY/11l9IQdZq0=;
        b=uTOQWbSGwZXbcvg5OTqaVOvz4GnLsMaKw3X7CqG6wJUUJQrGHxZmKL1drAG66GJCW2
         smA7tCDZ0sZ2QgjsLzqbSppMCpuyE9Fa6Umilt/xGLSLIu8ItNYttEB2Z/l+jlrBZff6
         JTyyI19VUNrBgtPZT7VF5edHgxrNjuKqclt5ScOJSJaLrVGVvlTW6fAbeKkMA/Y9pWeP
         qnyEzlJPgFxTFJRZAGkcBLZY7cXwEPC15n1fzjeCUbe24FzWwraBKsrymTDI8RKrxYmB
         a+S9DPCKhH2xqFZ1C2+TktoQ9RJzYcxqWSzw8uy9tOK/tirs2Qh7ip4MEPH61XKLMa11
         8MsA==
X-Forwarded-Encrypted: i=1; AJvYcCW81zhIAZE6+IJaCZBkDYap5a2RUmgi18E9FI2cqwr8+j4oLTx4qR+D0VnYC73GOIv/AO4nAcVWhpv34EtmH86c/B0q@vger.kernel.org
X-Gm-Message-State: AOJu0YwKy1Uk5os81BVq9pJhS+7O097qR+y7xXK2ehz0PYM/2DygO2hg
	7uMY75qFXY44EuKKNDjIr43w1cjrfct4stSYPHduiaz8TFwHdt4wfspxOkDRzoUjnv/yMgPdRVR
	GmcDZMJ26EWoYfKQNqM2NZdagN5Q=
X-Gm-Gg: ASbGncs62vS3DsLP5cm1ZG+rI+8bUnFJrIyP3XCNsVe5Az0Cf1vAtfVNu/MR9Sqj/k3
	T3X9uaGfu8r3UkPASjObS7V3+i8F1E1s=
X-Google-Smtp-Source: AGHT+IGVM741errqsueizTid7zTtxkH911VtqIe2exjiq3o8jk+dYs3M8DSYNA0IwiGhDhazYd/gv1jHsFIrF5ylE64=
X-Received: by 2002:a17:906:3183:b0:aa5:3853:553d with SMTP id
 a640c23a62f3a-aa5f7f1acb0mr612907166b.46.1733336655330; Wed, 04 Dec 2024
 10:24:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128154212.6216-1-hdegoede@redhat.com> <20241128154212.6216-2-hdegoede@redhat.com>
 <Z0iRuxcNnPMZptK_@smile.fi.intel.com> <95b952cf-d3b9-4ba7-92a0-6b1d240fada8@redhat.com>
In-Reply-To: <95b952cf-d3b9-4ba7-92a0-6b1d240fada8@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Dec 2024 20:23:38 +0200
Message-ID: <CAHp75VeAax_cbOc8AkYr9W1+pqY9rnZyEqdSqnh2koGCtkuPXg@mail.gmail.com>
Subject: Re: [PATCH 2/4] platform/x86: int3472: Drop "pin number mismatch" messages
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 7:36=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 28-Nov-24 4:52 PM, Andy Shevchenko wrote:
> > On Thu, Nov 28, 2024 at 04:42:10PM +0100, Hans de Goede wrote:

...

> >> -    if (pin !=3D agpio->pin_table[0])
> >> -            dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d=
 resource %d\n",
> >> -                     func, agpio->resource_source.string_ptr, pin,
> >> -                     agpio->pin_table[0]);
> >> -
> >
> > Hmm... Perhaps move it to dev_dbg(FW_BUG) ?
>
> I'm not sure there is much value in keeping this. If we do go for dev_dbg=
()
> then the check should be changed to:
>
>         if (pin !=3D (agpio->pin_table[0] % 256))
>
> to avoid false positives and the need for that IMHO already shows that
> there is little use in keeping the check.
>
> But lowering it to dev_dbg() + adding the % 256 also works for me,
> please let me know how you want to proceed.

I think dev_dbg() might still make (a little, though) sense. But also
add a FW_BUG prefix to the message.

--=20
With Best Regards,
Andy Shevchenko
