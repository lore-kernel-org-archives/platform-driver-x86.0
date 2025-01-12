Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5EB1B3948;
	Sun, 12 Jan 2025 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736693750; cv=none; b=p4HiQjun9D1fMmTMitsFXAacqupqMFfcU0UHY5ihtJ3TKJqzGa0X3s+vrGYKLISfV4Yok/kQqpPJO225znHnoJB35YDONf2W1lZZdgVLW2RCs4aHeZ/ldsNs7Rbw9oSQGKWhi0w/d+iRUBzLDXPP2iyKT0PPTxQAzurDFNohrkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736693750; c=relaxed/simple;
	bh=FDmREfO7PMjScLzw5sSaajZTiTDi3UEZix1Gsf978Os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oI3mlTSCLaWD7lseX5tEkv5Dsc0yflrfPAs2jLGdZaZ2SEh8AVoRFrICJhIz09kijFUsv3fvXxarE7cCrKHJslhXP4kDGC34G/g9j3/wl7Ex1b/NVDL7I8q/13N3gWhAdj+YaAkt5u959VPJgNHW6x9cszC3GPp7pBFuGpc3/wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-844e10ef3cfso273976839f.2;
        Sun, 12 Jan 2025 06:55:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736693747; x=1737298547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vse7xuZPxrPLauoOP3T/gZFtNVjbCeqf3nzrtSDbGOE=;
        b=t7J+pavGjR6mhRyYo63/jAlhgF7T2qoSv9h2isgFByaBeyZqNKVg01HeHNlkPcRAVy
         d9ysTUqNPspy0qdrg1d8RAr+t1+B1JKSijwsqXFQpkjTLk133bJvH9c1zDSbCNd9rohC
         rJOA2mrTzHaR0bafby0pVWy25kv4cVtNYajFQSjPq3cntI/1r3mx+iJ4da4xz3JRsVxd
         rdMDc4BF+xw2mwgTakm06L8bYv5R0H8XdHoI4Es7MT7bujzKAn+g+j7eDIIM3ScBOGtB
         X9OJst0JWDgQHXz+WsQZyIxx/jyiVNB2lQoLdMHzvGfrh2/8OSK1g855WnJ1a/JTiQiL
         8bEA==
X-Forwarded-Encrypted: i=1; AJvYcCWd0mTiDPkwwiIjtMhIazVrX7Diut2ee/kX5dFU5/l9zKvUXv6aKrGzMBXfnZj16gvxS/V0XjksnIKQfZf0@vger.kernel.org, AJvYcCX6y7K1078q4xLHdV6/m9q4jTP7mNZr8t6Ebwn1HyWTeN/XucgYRLOdhp4184EdCUt63JQWhatmqJrqkcsfFFIw20b8cw==@vger.kernel.org, AJvYcCXPHRxsY+6E2XgZydAkmkZxNrXeqmDetO7gxFor4k3ALGaa1dFpc3t58OkUqW6LvXzKCu1soljFnCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDN3lo6oXu2bVdLXslztGSOMf9phPOV9tue4/Bhc7QZco/DVpr
	fOiUXW7kg0pSVEZJb2W9GlO18+pTDayIBtL6/S6Vh5Gpzi4/tSwW1mvfRaW0
X-Gm-Gg: ASbGncsnvm31nd4jVWzCnI+PTq4x4N4bLIYND0fU5UwhFJ1AXaX/0Bb8J3jPDhcq8j6
	86b5/eg/U7klrM+mVEiQVhfEfvSXdJ378H1sZscbNC7+fCmEIPc/oumwMABHbmLgDsAqTUbZ2jQ
	LObrWJDH2diGblypN/wKgGyA31NZ7j25w2vw4t06VeuNoSXn8xNZM+gDtP3YaReO/KCuYQw3iUx
	DR8VsjTJgkMVQs0e2WMEwppjhMoX4kD+2TBKO9fWebEXIrvEezFjM9v9fGhotVaDNwviR+KLHcX
	48PDclL+M2z1u19+eUw5ytUabQ==
X-Google-Smtp-Source: AGHT+IETJJwtVnjezjmEG/a90hH2QXun9/7hxi/khI86ZkEzR7LjZ7iD/7Rujm6Rf2a9IUEa16Jm+Q==
X-Received: by 2002:a05:6e02:17c9:b0:3a0:8c5f:90c0 with SMTP id e9e14a558f8ab-3ce3a9c68b2mr130274775ab.10.1736693747596;
        Sun, 12 Jan 2025 06:55:47 -0800 (PST)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b62c333sm2193501173.71.2025.01.12.06.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 06:55:46 -0800 (PST)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ce6b289e43so5497575ab.3;
        Sun, 12 Jan 2025 06:55:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULR8cAcXD1QnmSuYjtnahJafQik8VTbW6xqWoiix3SGhXc8u00GS5V239dszPbWkRtOdENKIv6erQ=@vger.kernel.org, AJvYcCV1mxM98u7EZbCWi0OtHpU95papboqM0mj/NLM5RoWC41JPdNXXesAgoCMM9Q6lovcTPu6a4VAEWJCVZ/uqTBxVrCTW/Q==@vger.kernel.org, AJvYcCWxZhKdNdxml2RY2uUDwEDgCv2A77GpyCdGhF3tjDuAM6Qu+fwmPjO/SIMoqxEphXeGd2X0XQWs+KOm7FCG@vger.kernel.org
X-Received: by 2002:a05:6e02:1a2c:b0:3a7:7ded:5219 with SMTP id
 e9e14a558f8ab-3ce3aa7c938mr146206745ab.21.1736693746564; Sun, 12 Jan 2025
 06:55:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109220745.69977-1-josh@joshuagrisham.com>
 <30f6644c-bf35-dd5e-4f1c-d1f1915b97da@linux.intel.com> <CAMF+KeaN_FXjEHOw72LD7GgfFyhjjXjY+ask4vxd1jV+zXn=Mw@mail.gmail.com>
 <rseoqwcxpgrnnub7spna4ped3mjlgtke4tet4cov37dseqid43@i23cikzwn3ac>
In-Reply-To: <rseoqwcxpgrnnub7spna4ped3mjlgtke4tet4cov37dseqid43@i23cikzwn3ac>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Sun, 12 Jan 2025 15:55:35 +0100
X-Gmail-Original-Message-ID: <CAMF+KeY41DWXGxfKOCcFAr+WREodxQdtpxp4i3T3fY8NnLZ80A@mail.gmail.com>
X-Gm-Features: AbW1kvZ59cgk-XZIbGg_riSKH9ouaeeHVb-OZ3mZ0eb-mizzBu8Pkrx1Bx5MHcU
Message-ID: <CAMF+KeY41DWXGxfKOCcFAr+WREodxQdtpxp4i3T3fY8NnLZ80A@mail.gmail.com>
Subject: Re: [PATCH v5] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Kurt Borja <kuurtb@gmail.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	W_Armin@gmx.de, thomas@t-8ch.de, Hans de Goede <hdegoede@redhat.com>, 
	platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Kurt!

Den l=C3=B6r 11 jan. 2025 kl 18:15 skrev Kurt Borja <kuurtb@gmail.com>:
>
> > I am glad you bring this up, as it forces me think through this a few
> > more rounds... basically what happens is that the device will always
> > come up from a fresh boot with the value of 0x0 as the "current
> > performance mode" as response from the ACPI method, even though for
> > most devices value 0x0 is the "legacy" optimized value that should not
> > be used.
>
> Is this 0x0 mode real or just a placeholder value? i.e. the device always
> starts with legacy low-power?
>

The performance mode 0 is a "real" value in Samsung's ACPI and
settings services/apps, which maps to what we are calling the "Legacy"
Optimized value. It is the only Optimized value on older devices, but
most newer devices have the newer "Optimized" mode of 0x2. The "funny"
thing is that upon a fresh system start, the ACPI method to get the
current performance mode always returns 0. In Windows, the Samsung
background service/app somehow stores/caches the user's last-used
profile mode and then just sets it to that on startup, so basically
their background app will very quickly change the 0 to one of the
devices "mapped" values upon startup.

My thinking with this driver was to do similar -- use the modes which
Samsung has said "should" be used on these devices (with thinking that
they have put more testing into these modes and support them for all
of their users in Windows, so it feels safer and less likely we could
harm our devices due to overheating etc if we stick to the same modes
that they are supporting and using in Windows ;) ). More on this / a
big simplification IMO with my v6 patch (see below!).

> I don't know if this has been discussed before. If it was you should
> follow their advice instead.
>
> The platform_profile module doesn't enforce selected choices when
> getting the current profile. Choices are only enforced when setting it.
>
> I suggest that galaxybook_platform_profile_get() should map all known
> values to valid platform profile options. Something like:
>
> switch() {
> case GB_PERFORMANCE_MODE_SILENT:
>         *profile =3D PLATFORM_PROFILE_LOW_POWER;
>         break;
> case GB_PERFORMANCE_MODE_QUIET:
>         *profile =3D PLATFORM_PROFILE_QUIET;
>         break;
> case GB_PERFORMANCE_MODE_OPTIMIZED:
> case GB_PERFORMANCE_MODE_OPTIMIZED_LEGACY:
>         *profile =3D PLATFORM_PROFILE_BALANCED;
>         break;
> case GB_PERFORMANCE_MODE_PERFORMANCE:
> case GB_PERFORMANCE_MODE_PERFORMANCE_LEGACY:
>         if (ultra)
>                 *profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANCE;
>         else
>                 *profile =3D PLATFORM_PROFILE_PERFORMANCE;
>         break;
> case GB_PERFORMANCE_MODE_ULTRA:
>         *profile =3D PLAFORM_PROFILE_PERFORMANCE;
>         break;
> default:
>         return -ENODATA;
> }
>

Thanks very much for bringing this up! I think for me this has been
the kind of problem that I was just too close to and a bit stuck in
the details, so it is good to have a total re-think like this, and
this kind of feedback is very helpful IMO!  I was actually thinking
something very similar already, and then to use this function to help
drive the mapping both for init and for the "get" function during
runtime, with a much higher reliance on the built in facilities from
platform_profile itself to drive the behavior (based on the bits set
on the profile handler choices for example). I have a draft of this
working on my device now and will try to clean it up and get it sent
as a v6 of the patch shortly!

> Also a quick question. Why isn't silent mapped to
> PLATFORM_PROFILE_QUIET. Are there devices that support both
> GB_PERFORMANCE_MODE_SILENT and GB_PERFORMANCE_MODE_QUIET? Are this modes
> different in nature?
>
Yes, they are different modes and often both present together on devices.

Silent =3D CPU (and possibly others?) become severely crippled and the
fans turn off almost completely. Due to this it feels like "low-power"
is in fact most appropriate for the Samsung "Silent" mode?

Quiet =3D CPU still works mostly the same as other modes (think we
already start to hit Intel's thermal throttling here, actually...) but
it is apparent that the fans do not come on as often or spin as fast
as it does in other modes (e.g. Optimized, Performance, etc).

In fact the only case I have seen where they both are not present
together is with the Ultra devices -- they usually do not seem to have
the "Silent" mode at all -- assume this is to help with their image of
being "ultra performance" plus maybe to help with overheating risks ?

> I don't think CUSTOM should be used as a placeholder value.
>

Noted and agree, I tried this as a quick test and saw very quickly
that it was a bad idea :)

v6 patch coming soon-ish (today I think/hope)!

Best,
Joshua
