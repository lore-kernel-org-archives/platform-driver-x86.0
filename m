Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C6E185B6D;
	Wed,  8 Jan 2025 22:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736373668; cv=none; b=U8sjGhpcK6EeuvioV4Q2pbZzpSmJ+u0ygE+BNxuC0ns3OLHAfZF0SGn6wbQvNgQb2DpKn0YQlDAIcJ7JCiI8ACPQwIXpAgss1tsva2mMTue8lUgctsZu3ZNslMna9QrXx/Hig+PjPrbxUUVRuaa7ve1+CbwEeMZwdWmqjHyC19s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736373668; c=relaxed/simple;
	bh=/x9HyJZbl6uG6TWcTIoRF/X0BeWAu+Hv5BGPosVlauc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UIJUbUgNEN0t/dVh6E9VFUuY5nmS8U9IIKY3JQ7VOeede2VaWniZMcLxInXrysD0EjLvuTUaBms/Usz6Wi3lTYyDOMp8G4hbLGhXTU6sVINrIzTI57vuhMlIu3X0ufi+PT4L4dUTngM0ItGCU1jLgXL35aMWPeQ7zf1ewJfMOB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-844e1eb50e2so8547839f.0;
        Wed, 08 Jan 2025 14:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736373666; x=1736978466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/x9HyJZbl6uG6TWcTIoRF/X0BeWAu+Hv5BGPosVlauc=;
        b=KR0mRZardMLepweaqAK5MPvhIJOmns5l1rbMu0KuK5xhCuXzOxej/QOOcnLDv1OQRn
         MoAdBwep0SOVwyLVYLo4VUQ+YwG45/v64Ep2GlPJUbE3d2c1kZYfcsk4c+cKA7bA6Lww
         29vmaywvk//d/2RATuUPJCsrlp/iF17huiK5uBbX7gUWnMqaule6ztx9HHTPbWpOyHOg
         8CjrAyBLoz1h0gX3RtZ8+1Z40EZIR06/U4I6SwhI3bSf+spxgswpX3WnxUXlJqERJBnG
         bWCGtkIBAhwBu4Bwy/2X9bImR2SBp8hA8c/VNdxcK7N6h/7oKGjynQ2De6vIjHXSGsLT
         BARQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1t6yWFvOCZKe7OPDqw9rxD/DAhA18+0bmEqMRk5R4yHUR1uGASiFzsyuQZm5+5cOe+XPLtzeogv2FwSkMmkA9Fct4bg==@vger.kernel.org, AJvYcCWwvmdcHfGvqq65jnlfnL/wfy0WoZwdh0wd8ryTvEvuioWBlGLSpW0V+th4r8XkCHf9WIXFsFe5wYD2ocxa@vger.kernel.org, AJvYcCX6opmLJ1OEGazt2EszGQyA5zBr7YfBRPf7RfAlXstoWVcq78kQc5JJU5PihG4JpQUA8PO5x1h01Yc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWpQkxdrXc5jBdIWiSPlfjL0XhZeY2Q6c5SHTD75Am2N0S+jGn
	7Pd3FfzvFHm/DpEbG8cbQXGJ9jtzvFrYVYO0zvBjxubaLIquJRHYa1MXR4wbvg8=
X-Gm-Gg: ASbGncvrU4zXte2QcS1/MftmK5lMA3Jdwsbd/V6UFwxrTw8/XrkyBDPMbDCdL/ZyKbU
	7/8ceIB1w+nkVfOuWnMCiYcVkB2HCGtb2i18snKJnSl6ZTJKKkJl8Z+EI2XxrLBgCmyGz/pTEIJ
	0vKbLHEiuQQmL1QLReMgBWv1reMtiIR4FU2kejDFjrDpaYQNo3xpXUQ+IuSYDKkZSIGDj96SQLH
	5FM6v+IpKdh3KR65Lf6ub6+S+NjEzjNFiVmhukKtc+0tlRC81R9eunuiAwBqLL0OZY3KXQOCXYR
	3pwDTDssXcACEJ7M5kc8Tg==
X-Google-Smtp-Source: AGHT+IFIM+A2NW3gEyE5KvXGub3uq2ldyvUi8QX0jiBVzcIQhHzXVekD5zUs+Mw/NHMVTIGq0J6gzg==
X-Received: by 2002:a05:6602:2d96:b0:843:eb89:9655 with SMTP id ca18e2360f4ac-84ce01c3bbbmr416594139f.15.1736373664799;
        Wed, 08 Jan 2025 14:01:04 -0800 (PST)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d4faef087sm1335539f.6.2025.01.08.14.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 14:01:04 -0800 (PST)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-844eb33827eso8803539f.2;
        Wed, 08 Jan 2025 14:01:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUmWBCRluIALSZ8c4Qftopu8mWVtneHwwlWlYst2lyMcpF6cHuaLilh8PTAztG+ruGDPF99SsMOy8=@vger.kernel.org, AJvYcCVd7CRZn+gJVFh1gHtu1HLpyO+sW/pf04umtWLvM67IegSJTiTkjKMNZGnM49xqPEw1pPL8F+on95yfW9HEuS1g9dPmdw==@vger.kernel.org, AJvYcCWr2/teGLKkFrDLuOttUwhBZvslQsxxYvVQt183KHiLB9hDBxmQ084b3oC4hmnsRTms34WnjHsP7uIi2Bwm@vger.kernel.org
X-Received: by 2002:a05:6e02:198e:b0:3a7:8d8e:e730 with SMTP id
 e9e14a558f8ab-3ce3a8ec729mr26607735ab.22.1736373663907; Wed, 08 Jan 2025
 14:01:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226153031.49457-1-josh@joshuagrisham.com>
 <0fbe58a9-ecca-437f-aa30-9d3a17c2bd43@gmx.de> <CAMF+KeYdshNex2h4kLJari=kXVxgcOZw7GDutJrV6vKC0PTe6A@mail.gmail.com>
 <a8011f0f-1d44-42ec-9089-2da31f3852e2@gmx.de> <CAMF+KeZm8LCGsCZ9bosNYRCbv847CcZr+0mWeZtDQsk5QFRuyg@mail.gmail.com>
 <9f257ca1-946d-416f-8741-247592b3866c@gmx.de>
In-Reply-To: <9f257ca1-946d-416f-8741-247592b3866c@gmx.de>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Wed, 8 Jan 2025 23:00:52 +0100
X-Gmail-Original-Message-ID: <CAMF+KeZ0xOdu3LADEeAHAC22=hZFQXnkHM3oxko7E7urNisfGw@mail.gmail.com>
X-Gm-Features: AbW1kvaIajHJzeALyZUyc2CcStPy5VJhoUsTJbLOMIFdzV3tkpe2Eg0pWkejtVE
Message-ID: <CAMF+KeZ0xOdu3LADEeAHAC22=hZFQXnkHM3oxko7E7urNisfGw@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Armin Wolf <W_Armin@gmx.de>
Cc: Joshua Grisham <josh@joshuagrisham.com>, ilpo.jarvinen@linux.intel.com, 
	hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Den tis 7 jan. 2025 kl 19:56 skrev Armin Wolf <W_Armin@gmx.de>:
>
> Is this non-ultra performance mode any different than the ultra performance mode
> in terms of performance gains, fan speed, etc?
>

From what I can tell it ramps up the performance even more and might
even also ramp up the performance of the GPU (these devices have a
second dedicated GPU) a bit more. My understanding is that even for
these models, "Performance" is considered a high performance mode, but
that "Ultra" is like "super performance" ?

Fan speed I think is mostly controlled based on temperature but it
could also be that some thresholds are adjusted etc. All of this is
unfortunately embedded within the EC so you cannot really see any
voltage, clock, etc, or other differences on the CPU when these modes
are used, even though it is clear from basic stress testing especially
with the "Silent" / low-power mode that the CPU has been severely
limited.

>
> PLATFORM_PROFILE_CUSTOM is meant to signal that the platform is not in a well-defined
> profile state, usually due to manual tuning. So please do not use it for ULTRA.
>

Thank you yes I also realized this a bit more when I read through some
of the proposed changes to other drivers in the mailing list!

> > If this is possible, then my best guess for the logic for this mapping
> > in samsung-galaxybook could be changed to loop the "supported modes"
> > forwards instead of backwards, and just let the "legacy" modes be
> > written first (as they seem to always come first in the list), and
> > then in case the non-legacy mode exists later in the array, it will
> > just replace the already-mapped legacy value with the new non-legacy
> > value, and thus skip any kind of condition-based checking/mapping
> > entirely. Is that sort of more like what you had in mind?
>
> Can you be sure that legacy performance modes are always placed before non-legacy
> performance modes?
>
> If no then i suggest that you iterate over all supported modes and if you encounter
> a legacy performance mode you check if the associated platform profile slot was already
> taken by a non-legacy performance mode. If that is the case you ignore that legacy performance
> mode.
>
> If you are sure that the order is always the same then you can of course simplify this by
> iterating forward. I will leave it to you to choose which one to implement, as you seem
> to have more knowledge about the underlying hardware than me.
>

So far the order has always been the same for all devices I have seen
from users in the community, it is just that certain modes are or are
not present in the list depending on their support. However, based on
your comment I think it is maybe safe to add a bit more logic just in
case the modes suddenly come in a different or random order on some
new device. I have also now simplified the mapping so it is mostly 1:1
with one exception: if Ultra is found, then I map it to performance
and re-map what was Performance to balanced-performance. Otherwise and
for all other devices without Ultra, it is 1:1.

I have also tightened up and streamlined the logic a tiny bit so
hopefully it will feel slightly more straight-forward in the new v5.
This feels like an ok compromise if we should be using exactly the
profiles which are currently available .. how does this sound?

> [...]
> Thanks,
> Armin Wolf
>

Thank you!
Joshua
