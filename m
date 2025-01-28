Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47A81DE89B;
	Tue, 28 Jan 2025 19:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738091888; cv=none; b=M35/sGxqIbDnvYo14WxQOqrIFysoJkcaYKJwvFn3iITD7AgaopwuDledJZMMC+h9qFe2OHMB5UKXM8l2+QWhcXnLmE7Afb/SJ/gVgnemHI3RTqvibjKTwiCTjNbXvmwYlE/8fI4c7v2bzyEHUkV+xDWZNOldzXhjOkhQF3hNPhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738091888; c=relaxed/simple;
	bh=8OhhLl4Vx3PLMhVYqtpPgEulJwvqh3pI+Ncbg2aNwmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=frgtwJOKLIIxWAIYts8pDOGygE6TupmycUJOfbcDjZEdvqrRoRSqIvYUUNhF/7sS5Pv4mDwOaogOfUvPilpZFXXxVF1B8kw7+ljl2vjxkQ/uzHXxIDpSiiUAa6SQazPSStQWFpbrvirksU0T0wnNyV5OiteN30CBwH2xkn32tC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-851c4f1fb18so153011439f.2;
        Tue, 28 Jan 2025 11:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738091886; x=1738696686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OhhLl4Vx3PLMhVYqtpPgEulJwvqh3pI+Ncbg2aNwmE=;
        b=AmosMw8eJvaNMtxV4VF6wxLtNAHfJNWlwjw/FogMvxkX5eLH8l0v4d/WFK3Zqb4aAW
         U7exySJ5l3gX5Fe9X+EjYPr4w2zq9YnGh2WCkBBZ55Cgda7m2v34yn6eeCSIKkwyEZrs
         u5FtKNwcu1f9feWEL9PIAfekTS08MV8Ss3IbCm70HAL8vmCOeTSqTZG8P6liR3MPbsvH
         Po+eYYQTcR2askwKeKnSGVgn3AtMPRx/85Dd2Ofy2LVxrFnT5V+B1rf7Pdl10p21UwmZ
         fDRCJ030vwOqijYR2nK/rwZqQKAqzlYexBSYn0EtMuPg2R2oWbrBt7RFRGmWQMNJNe+W
         9oow==
X-Forwarded-Encrypted: i=1; AJvYcCV3dD46Jt/zBU/h+LOUoFzFuSIBevuinFUzGfoJiso2NFlh2/c5xisArmK9qCOQlgb2Cb98BFAzfSw=@vger.kernel.org, AJvYcCV9de2egIUJet0hLjuL2fX/RQAr52+7RcjWJXBX7prEFfnw89Njs0WbyQCcE0PICyuGisIgCjBtuydXGYpc@vger.kernel.org, AJvYcCXFwbNJ5dsy9olsB/ag+KFv5OmunHTi/0DKweENQuWBsXNqCsrwI5/WRmVr0YvHn2We9wXGTjaDXNHNgspo3h4XSA7OaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMY0PxdK2pUKIQc89AYgUveraTRueXME/bDD2ql2IUmNGUCEjT
	jELn29KLefGsK1z9v1wdWc71/8xJvkSDKa+aUYnmfBITAEg26Ezk5FjyMXNUttY=
X-Gm-Gg: ASbGncu4Gf//sp2r/dmFXjqHXSlYStCG29i7/Rh4joVu+mtabEQOp0Az/93rXNoOO2y
	0EMGdcroVL67Be9/j+LtXOo5Oo40Li4Equ26Gd+NTGk2b+NlCMCBFERWSEbaTIL6DqTGx7U91VU
	cn5rAwLFLUWu0G3DxtLGcZFXLwig3mK1m1IafNeBcIGicECitC1OqPRxB9zsPbrK/kKpU1WpUXi
	QozYfRbR/JHaro4wToL0FGH+DaPoX0rWiofDUI+6tuXp6pWjFqh8+cbiVR26nmrdEPLSgM6lxzt
	pO6X9MJqR22EfXZj+XMUP2Wp6h/LkA/O0BL3PFmwphZIPIsEydnPAsJ8lKxG
X-Google-Smtp-Source: AGHT+IEesSbRpE31Mu71qJlrFXgJPYG8LKRa/INW1GZ+U38Sd0Qj86hvPUnrl5HjD4pbkBHw2CKtQg==
X-Received: by 2002:a05:6602:1696:b0:84a:4f3a:fa2a with SMTP id ca18e2360f4ac-85411100c65mr51608339f.1.1738091885722;
        Tue, 28 Jan 2025 11:18:05 -0800 (PST)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec1da31b81sm3307134173.52.2025.01.28.11.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 11:18:04 -0800 (PST)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3cfdf301fa4so9684515ab.0;
        Tue, 28 Jan 2025 11:18:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYBzVy9M6o4RjrCf9L3AMYQY7axZjvtLIwd22QNKylm2xOggU56BqsEsjPKkKm6rOjirYd9TEgGU4=@vger.kernel.org, AJvYcCWnhPM89DhMiAPqgnSqI5yzqPABnMXHpKLAdpLywRNJdSPZtHmToYfsN6IqlBo5RnU29/d1ptoyc4/NEMpn8qNqobG3hg==@vger.kernel.org, AJvYcCXH+isVImOcjLtjPb0bZo3DbxOM0skejphjGKuYHI4ue+/NUE4fhn1sXcdrqywcjP70h9GjDTcMEFilReHR@vger.kernel.org
X-Received: by 2002:a05:6e02:98:b0:3ce:7fc3:9f76 with SMTP id
 e9e14a558f8ab-3cffe3e527cmr3513855ab.6.1738091884575; Tue, 28 Jan 2025
 11:18:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118202632.8352-1-josh@joshuagrisham.com> <e67bf708-be8a-4331-b250-d2f31e38536b@t-8ch.de>
 <CAMF+Keb5UzEUeim=33JR=Vv8qK7xqGn_jjNdtZMQTFtrpKrgSA@mail.gmail.com> <D7B8WVUD7F4B.1BL2WE2BNRCX6@gmail.com>
In-Reply-To: <D7B8WVUD7F4B.1BL2WE2BNRCX6@gmail.com>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Tue, 28 Jan 2025 20:17:53 +0100
X-Gmail-Original-Message-ID: <CAMF+Kebx4sU+0p+pFaH1Lz4q1xApM8iS9UAYP=sZnE2GDa32ww@mail.gmail.com>
X-Gm-Features: AWEUYZngrz9lEFuBRh-H1wNKkp4N_HGkDO6g5cGrCKBjGN6lb_FqH1mnMy4Wv1A
Message-ID: <CAMF+Kebx4sU+0p+pFaH1Lz4q1xApM8iS9UAYP=sZnE2GDa32ww@mail.gmail.com>
Subject: Re: [PATCH v8] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Kurt Borja <kuurtb@gmail.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, 
	platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Kurt!

Den l=C3=B6r 25 jan. 2025 kl 16:06 skrev Kurt Borja <kuurtb@gmail.com>:
>
> Now I understand the original problem better. I didn't consider this
> possibility when designing the callback.
>
> While this is a fine solution I believe Thomas' EOPNOTSUPP solution is
> the way to go. I think positive err value would be the safest but you
> should wait for the advice of someone with more experience.
>
> Aside from that I really like how the whole platform profile sections
> works now. Good design choices :)
>
> ~ Kurt
>
> > <snip>

Regarding using this positive error code internally within the module,
I thought about maybe adding a comment to galaxybook_probe() before
all of the inits which describe this a bit -- do you all think this
will be helpful or is it clear enough / does not matter and can be
skipped?

I also realized that maybe it is worth to describe that a specific
sequence is needed for doing these "enable feature" + init calls to
the ACPI methods otherwise some devices were reported as starting to
reject the payloads if the sequence was not followed.

Based on these two then I have drafted a comment sort of like this to
put in galaxybook_probe() before the init() calls:

/*
* Features must be enabled and initialized in the following order to
* avoid failures seen on certain devices:
* - GB_SASB_POWER_MANAGEMENT (including performance mode)
* - GB_SASB_KBD_BACKLIGHT
* - GB_SASB_BLOCK_RECORDING (as part of fw_attrs init)
*
* The init function for features which are not supported on all devices
* will return EOPNOTSUPP (positive to differentiate it from upstream
* error codes) if the feature is not working and should be ignored.
*/

Does adding something like this seem like it would help make
everything more clear (especially thinking when new refactoring comes
by other maintainers in X months/years/decades, it would probably help
them to know these subtleties, right?)?

If this comment (you all are welcome to suggest wording tweaks as
well, of course!) plus the few other small tweaks make sense then I
can prep this to send as a new version. But I am holding a bit in
hopes that the 6.14 stuff gets merged to pdx86 for-next so that I can
go ahead with implementing Thomas's new power supply extension
interface at the same time.

Because there are multiple variations to these devices, and there were
some small issues that users with other devices found, I was
thinking/hoping once all looks good for all reviewers, including
implementing the power supply extension, that this could be merged in
to for-next and then I can ask a few people with other supported
devices to test this revamped (and in some ways completely refactored)
driver directly from the branch so that we can try to catch any other
issues that I did not see on my device before it is proposed as a
candidate for mainline -- does that sound reasonable?

Thanks again!

Best regards,
Joshua
