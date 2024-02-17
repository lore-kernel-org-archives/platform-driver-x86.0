Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7165A7E11C
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Feb 2024 18:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708193429; cv=none; b=Jr7fE+VWvDUAPMgG6e80rHOV8iLO2lnW7T9rSpFC89eVU39BRU6fvtZs47eSarpRkIuITr9B5KQ+90o4qUkHwVJWCc9HCbuOcCo0qR1+7N+9b444bRTs9ueNvV+HcB3XSiqkkHnjy68ubW7DGKvChoe15HEKaXlChuSznidRLi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708193429; c=relaxed/simple;
	bh=MVgcwj9+YCeiErqsFrP+i//ouhYhA++XViLnsv9PqkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpaS9hHOoG30E4j9Z5CbW67CR0BzO00o1tfFQeFBh+7bQqF9PKzmSE71os07yfPF9CTqJBOyPgID2xYx+QE2ceBrSUVfqHrhJvEIdy4sQ3bOArcobNvAoGnBls1S0ZqtjtEe3Bw+bsg2GVL/oc9+TgNTNyTNk7cT3WpShy2fzPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7L7oVVW; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7L7oVVW"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a2d7e2e7fe0so577500166b.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Feb 2024 10:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708193426; x=1708798226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVgcwj9+YCeiErqsFrP+i//ouhYhA++XViLnsv9PqkI=;
        b=U7L7oVVWTuXX5UYIBrbPE9GYPk8+m3xlCnjTJs5WZ/iZt16mX3gPJ3tHBl9E377TXb
         BDy7fG64p9gNpFTHxmGYp39MJRTUUGEWbhLjeRsqyenXVXvVa6x6/n3pOWZ1S0sIiL5y
         yTZ1D9aFak8OfIFua7j1T56HwB0uMylprq2NZs2nXvdDlflBWh8OF6lYxuZb6pMjTn5j
         Kfb2I2geuQwExbvo5xKuc555VZ/81VpV+Op3I5sG3sDJVGW3oTqak/P1jsf+CxIxAU/h
         U9sDjv2A5VyJ431JgyHaR5M9voi/WS5ZPvOypDZNHuN1sdVKEg5svocm5dBp43Dx0zdh
         60TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708193426; x=1708798226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVgcwj9+YCeiErqsFrP+i//ouhYhA++XViLnsv9PqkI=;
        b=N/oF1KlDt958IRGfAPEH8atDHRyCZ1GJN1df7LxbOnrbM02ZWlKmfpFkZjOQKzTn1p
         otoYyj4FREhrzSa77yPP4AW5FCbKJK9GhEkwcRgVE6SbxznfcKQVWNMHm1uanACgcDMc
         yqej+tY2/1/eIjryd0TWUqRKlQZyEjqYbAYOxjt0hVqvRQzsY+s7/sEzffbcnsnWRprH
         DwCnrt2Q2zHv33N52vW/rZoUHy+t/lSfL4VIHcPuFRz2yn3FuHOGQkpj3nsKfEYbcsVm
         ND1L0a+Yr/G/IZKsCI8xnNAYM1IVBGvsbx3U4m7Lu5MyW1eavdvFpynqCTk73XQP6rNd
         e/dA==
X-Forwarded-Encrypted: i=1; AJvYcCVV1OHwnjTZXqZAB/ki00yRybpbM1WXCUv5bqtgduURhFiW+4718cKK1NRKerO4hgFhf7Z8dir6J/Zie9ZHAkQdpkYxh806hXSjou2HwTaA6XO4QA==
X-Gm-Message-State: AOJu0Yxek8uUZgzfIFdvfTeO/nB7WOsjE1iZuURhY+gJbqhKU+Bm+wRJ
	F0Rys1KfXIBYxqmm42Hfh0i0L2s87XtD6uguPjfQvs/2msT8Kv/NfY1F/FZNUZh1lrE2NuNwgoY
	OpaBwzUkVvj+7Cx3bZyzhTbZRCZVylznMN08=
X-Google-Smtp-Source: AGHT+IE8isgJIQzsTo2GHw/jXbG8wQ8dhN0cJPL0YmRWG3HDJLDc1jTTQJyDXYQDagkP7ZG4z1HxtwC/mFrBDARYz7I=
X-Received: by 2002:a17:906:b106:b0:a3d:dddd:5aee with SMTP id
 u6-20020a170906b10600b00a3ddddd5aeemr3943996ejy.25.1708193425547; Sat, 17 Feb
 2024 10:10:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216201721.239791-1-hdegoede@redhat.com> <20240216201721.239791-3-hdegoede@redhat.com>
 <Zc_Sf73kfss-c2TD@smile.fi.intel.com> <774d159d-0822-4205-b214-95ffab03a988@redhat.com>
In-Reply-To: <774d159d-0822-4205-b214-95ffab03a988@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 17 Feb 2024 20:09:48 +0200
Message-ID: <CAHp75Vf96z1HGWK9_tY=USAvJ-aJxAFv2cTjCAd3tkxe-ndd1g@mail.gmail.com>
Subject: Re: [PATCH 2/4] platform/x86: Add new get_serdev_controller() helper
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 12:36=E2=80=AFAM Hans de Goede <hdegoede@redhat.com=
> wrote:
> On 2/16/24 22:24, Andy Shevchenko wrote:
> > On Fri, Feb 16, 2024 at 09:17:19PM +0100, Hans de Goede wrote:

...

> > The above doesn't explain why the new code is h-file.
>
> It is in a h file because as metioned: "another driver is in the works"
> which will also need this.

Implied, but quite unclear. Can you rephrase?

> And the code is large/complicated enough that I don't want to copy
> and paste it. Yet small enough that it would be silly to put it
> in its own .ko file.

We have even smaller code in the separate module. So I don't consider
this as a strong argument.

--=20
With Best Regards,
Andy Shevchenko
