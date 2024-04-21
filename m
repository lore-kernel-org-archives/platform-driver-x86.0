Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA8A3F9E9
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 19:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713726758; cv=none; b=IsWZX4thGh02zx5A/8xyCquwgM7DVSF+xQU1BEyLnSIWjVXi98bwRvz2T+jRHKCsXJUo7X5fESmlrL4cxIsUuz8TEsgyytAKVbm8MyFBd9o+djUW6bUbRTusWxnEFytijUitPiDigeJY9yt2YMWaZ64m97QSp8CMiDYM2uYksM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713726758; c=relaxed/simple;
	bh=h17DQdLEHvVK0iBY22rwMw0u+aXYXudk7dZE9IEStpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BcXdHK0XAMyFaBxSdhpzwMh3SJbH+WYhuSInTQj3ECINUL/rYO+zCtBQ57WnI7Q0lVAJkqcq7DEtKPycOaqh35Mm+W3px5R7hXPVhignxNQen2Ag1iMyFMsqP4+pj/AUGwrCHoLwm7MOP/axsN2UYa+0zYvr0HY0FrjV1lQIHZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bN7B3DNb; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bN7B3DNb"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51ab47ce811so3096820e87.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 12:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713726755; x=1714331555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcbdlQ93dl9zp9fCPydt3efKLbbxghMP3mJStSUfmfw=;
        b=bN7B3DNbo5Ma0/kwWyjvu84kC9mR/PX1bGsTEcBEvsiH0LBAFiFh+m0KPa69IQV9UI
         w2Z5mlUU03DWMJNGxdzVxwF34IwIDGHbUlYuSq4SI8yV4GQ3n8LuFKzeUkbnmvxj63Xw
         BXQ6vPfbEApansRW2YrmjThVwNRQ8SB8ahjzxEI6CDPvZPKlJf+eZuJlGwRwD/f1/KU8
         QrRreickXIAYVcRroC1PAPH1xq/dO2juRQjJFj5IEjzmTDxpj808N252PHTkT04R0tTv
         SSvgG7sMax3kt/655qnhnHBYtn56E1Qe1eaY7WnWKSxpArvlkjZhClC9nlFQLe5cPhJd
         uT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713726755; x=1714331555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcbdlQ93dl9zp9fCPydt3efKLbbxghMP3mJStSUfmfw=;
        b=lTTj9frkNS01qiKZPDo4FNWrEyutGvm1JkF2UWsUd479TAY9auDesuIgcfoKge16gZ
         NldReftnEVFV+F5TxMfsxCvFe93f7G8g9jFACYbWG//+QDtIsyUt3226bMiCiU/DJFMZ
         VFdnvmRx9ogdUKAOikxRuBp3U/IoUkoY1HJlN/JfVMCWrVzczDm0HEGCH9ns4kefpisq
         Mrn4ftUnBoTHsfxd3qEHn7IOr/dmNTCwy/O5s/cuFfFVvJGSItL+s2lfk8TJMiLZ5RKa
         mdZyqlhMc90LfE1q1wcq/CD6lhKSmLg2z5/cwlzbqqbYzZXXS1AK9uGu7wf6ZtSa4egT
         bVVA==
X-Forwarded-Encrypted: i=1; AJvYcCXH5R7jIo1ooW8PzBbl5jmhzsfgMmdEKkzChU80bGROsAkLa+0oBDbkXcwc7sh13quAFGG2lA7m64H1Zdg/amn90KBJGpCzGPLxO5EIaAqaa0h5Ew==
X-Gm-Message-State: AOJu0Yy2nyJmE2CYIeBIh1+ddbGkcxROsZwBn+oM9DzGamP4B9+hOL28
	9aAVI8sFiCCPEaRTEsIjuwuD2YKytcV7Hkdxc6TiZy3v+hZtCGqQeTfH2ScjDUALL/33m9+PHpE
	oue7dV6igVoF9r5dsdAhp8ts4rfM=
X-Google-Smtp-Source: AGHT+IGloMv88SsMs8qgtKGExI4Nuj1iD+hFe2x1gRi7jJQ6MWrH85Im3ypS5/GlLm7iSMxRU+Mso9QsIMXpQCpXanw=
X-Received: by 2002:a05:6512:2154:b0:516:be80:178f with SMTP id
 s20-20020a056512215400b00516be80178fmr4216858lfr.43.1713726754598; Sun, 21
 Apr 2024 12:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240421154520.37089-1-hdegoede@redhat.com> <20240421154520.37089-18-hdegoede@redhat.com>
In-Reply-To: <20240421154520.37089-18-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 21 Apr 2024 22:11:58 +0300
Message-ID: <CAHp75VeJaisUOt8DmVyNyEuHypkXYqBs4j3y+8EcinHt0L=TRQ@mail.gmail.com>
Subject: Re: [PATCH 17/24] platform/x86: thinkpad_acpi: Use correct keycodes
 for volume and brightness keys
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 21, 2024 at 6:45=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Change the default keymap to report the correct keycodes for the volume a=
nd
> brightness keys. Reporting key events for these is already filtered out b=
y
> the hotkey_reserved_mask which masks these keys out of hotkey_user_mask a=
t
> initialization time, so there is no need to also map them to KEY_RESERVED=
.
>
> This avoids users, who want these to be reported, having to also remap
> the keycodes on top of overriding hotkey_user_mask to report these
> and Linux userspace has already been overridding the KEY_RESERVED mapping=
s

overriding

> with the correct keycodes through udev/hwdb/60-keyboard.hwdb for years no=
w.
>
> Also drop hotkey_unmap() it was only used to dynamically map the brightne=
ss
> keys to KEY_RESERVED and after removing that it has no remaining users.

...

> +               /* brightness: firmware always reacts to them.
> +                * Suppressed by default through hotkey_reserved_mask.
> +                */

> +               /* Thinklight: firmware always react to it.
> +                * Suppressed by default through hotkey_reserved_mask.
> +                */

>                 /* Volume: firmware always react to it and reprograms
>                  * the built-in *extra* mixer.  Never map it to control
> +                * another mixer by default.
> +                * Suppressed by default through hotkey_reserved_mask.
> +                */

Hmm... While at it, can we rectify the block comments to follow the
standard style?
(I meant those which you are touching here.)

--=20
With Best Regards,
Andy Shevchenko
