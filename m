Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129F02391AA
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 19:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733339744; cv=none; b=FrOcBAr+SpbU7pBpIO3It3JXgQ7HUHIemd/XjYTliKxVJWbtnGildbhIjnPVsyoQOaa6Ue3dQJiZiL/tFpISXVtXhEjPwvF0OjCGpUJFwgO2FtfZ8rMne2N2+xpl/I3QiIFDczYy1PyEh5S7BZzuPCReze5bZzcdfydAvNUWvIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733339744; c=relaxed/simple;
	bh=TRt1FBB1Mrd7UksUqZ6lSr7s28rNYcxwF01snXiqdzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ditbKPoTgd4BnCpoy76l8J50G+cQK+6uZUopgsm1ZzEu4ryN/wni5rKBvjsRZbhz70YEoQfd092o9obpFpgftg8PXU3ud5dyysgsIKE4PdUflZ2AtS2UDYhwffHug4LlTKvrgqGjJWzNRLwkspKuzA7JCXv0u70ixbR4GjM0FD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AY6PgTmy; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AY6PgTmy"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso9489966b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Dec 2024 11:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733339741; x=1733944541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRt1FBB1Mrd7UksUqZ6lSr7s28rNYcxwF01snXiqdzo=;
        b=AY6PgTmyrJEBYez49t3A9yuZ9u923dHKA2T3MwfFf7RswwlPq1wyOc4dqh3EY7CmF+
         rC+S5ffAup+A04YtPWQbsaCkzM3KJASDgLExhpHqHxFhI9C1ZflCvnsECBYw56CeIrM5
         KH0zwdE5HicR2Buz5UJELR/v87ADg8NUKw03HoWddGnCmwXggIOawjMS1MCAk2pdvRjI
         8sUXQLwXpV1aXkF3xYhkTJ9VrgZg0A8CDACAiFPUWenuqWNeVVQNAjxRendu+5KZga7B
         uUzsBXrh7kRxzMvWUGyiehwTJy61N0yVeDStVorHjsNu5p+uBKJLjxV15eMTv5gSYaHm
         vBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339741; x=1733944541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRt1FBB1Mrd7UksUqZ6lSr7s28rNYcxwF01snXiqdzo=;
        b=U6cf5AFApnFok50E7N2oxXGPumK5zLip4o8l/XQpCWTqeQM5bXp+oGGAQqP9u2Qpuu
         S+xXruIUOtcXd3PNXPgyLakkGUVIh+SmGyS2IO7eV8SpLcnxKuafNZicZa3No4Oxl0yr
         Za7F4VHqWBqCBMCo/ClXQhibR/gtXMjeEcnhd+P7b9Rr3fLkvYOwkp+cM1+O+LhMIPj8
         GDeNqsneiiwxfT5B6JEHBlnJQKcdypjcgOuRBpDvD0MSIBN5g9GPK315ICR4uZCablXv
         SlkZtEaUiKgAspijJVVr8T7GR0kTGetG0NttUu3Pi63kBImo2ntaaYQ6DSYKfWk6B7pZ
         mQQw==
X-Forwarded-Encrypted: i=1; AJvYcCXzyvE7Vq79XjCMHmLiE1sxExL0wMPKNQgkZfbE661VnecourM5AFobwU6AQh6onRpMg23tbTEqirqc8iTG3mH79MGV@vger.kernel.org
X-Gm-Message-State: AOJu0YyGsqBD+ICb4QYfVfvHyVMAME1CYrZtcjEzRItaBbQrjPUIJZRG
	XyvPNukan2vvyjNGgqkesMnGUmaoZDg95YsQ4X016jKBFYlcwaZ2GK9XE6zggGc0BnqBRBxcyQT
	36KuiBllD68aV/W5LQzXBHuZSFesOhuaX
X-Gm-Gg: ASbGncsYgtb4xe9p+4G/d+bO0PcnsqecdWVkKVY/yITC46NurYYPpYHHbnWn8b2SJgu
	lT2xF+StywzSjjcmp5VuzYQ3qZAKAKz8=
X-Google-Smtp-Source: AGHT+IG3zxNRGTugLaqbACpLIbYY6X3DLBfyRuP0AbZzQrGcXnF7MIVMRvNOL8R2MlOImriNZlZn+EmtI3QL0oF3ZNA=
X-Received: by 2002:a17:906:cc4d:b0:a9a:423:3278 with SMTP id
 a640c23a62f3a-aa5f7f2a12cmr770430066b.49.1733339741105; Wed, 04 Dec 2024
 11:15:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128154212.6216-1-hdegoede@redhat.com> <Z0iRlZPFYItHIV7_@smile.fi.intel.com>
 <45502fa4-3b9e-404e-8494-a9a2101f1791@redhat.com>
In-Reply-To: <45502fa4-3b9e-404e-8494-a9a2101f1791@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Dec 2024 21:15:05 +0200
Message-ID: <CAHp75Vd_jz-_r77B-oS-Z55+x9EoaZ+mFzrhG3WYL2n=6hXFbQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] platform/x86: int3472: Check for adev == NULL
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 7:40=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 28-Nov-24 4:51 PM, Andy Shevchenko wrote:
> > On Thu, Nov 28, 2024 at 04:42:09PM +0100, Hans de Goede wrote:
> >> Not all devices have an ACPI companion fwnode, so adev might be NULL. =
This
> >> can e.g. (theoretically) happen when a user manually binds one of
> >> the int3472 drivers to another i2c/platform device through sysfs.
> >>
> >> Add a check for adev not being set and return -ENODEV in that case.
> >
> > But what kind of "bad thing" can happen in such cases?
>
> NULL pointer deref oops in skl_int3472_get_acpi_buffer() during
> probe() when it tries to get adev->handle.
>
> I guess for v2 you want me to reword the second paragraph of the commit
> message to e.g. :
>
> Add a check for adev not being set and return -ENODEV in that case to
> avoid a possible NULL pointer deref in skl_int3472_get_acpi_buffer().
>
> ?

I don't remember, but it sounds good to me.

--=20
With Best Regards,
Andy Shevchenko
