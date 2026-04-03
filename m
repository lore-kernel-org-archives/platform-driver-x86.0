Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B202F3C3C18
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Apr 2026 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225484; cv=pass; b=IknIa8vn7kR3GP0pnlADRrV6My7EgnQqLD9jpAP+RzJgrNxDkF+jGbkTpJkEz60jUEEjn7uoho0qBodnrdPipC3HMUVds8u9wnfBw/b8BgCzUZQIpprZekg3oX7Zp8gCoT3xAWKNfET6kjW4ZgDrF2kLt2IBhtJ/50tB/MOliYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225484; c=relaxed/simple;
	bh=IFY1epPJRbr7ePffEFt3cbANBhQ7V7M3EN+QpXKABqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TddpGOB+6oeGOZX38k4+DUdC9oVzbNl4QAR7rDm8Mn63Q95RDk3I6YY97uJahZ2C22kodcpkRolcbUDkiAR/bVy5sxaIzht1eLjeTDSLwdKmWBp/YandLySbkIw6A8NWRoC4MRvmS1k4InLLofJQI6pquGQEbtVC111H5z+VrK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joyfullee.me; spf=none smtp.mailfrom=joyfullee.me; dkim=pass (2048-bit key) header.d=joyfullee-me.20251104.gappssmtp.com header.i=@joyfullee-me.20251104.gappssmtp.com header.b=NK88hXH1; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joyfullee.me
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=joyfullee.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=joyfullee-me.20251104.gappssmtp.com header.i=@joyfullee-me.20251104.gappssmtp.com header.b="NK88hXH1"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66e129e457dso1807840a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2026 07:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775225481; cv=none;
        d=google.com; s=arc-20240605;
        b=a4T5MbH/+3AaeG4JVSb9QOSSuneOCaTiCgXGnYvA8DpKH+dFr69wZfly0mpnqBJ2sG
         mwcp31CkQDqJfk9L2YzcRZMDooYgcBbLUp1SxYmCOrPOjXTq7pkhR+DC9dCs0D6qrbnV
         7T/sRd4rErfZJnFM/wGcLBSH6mJcfLkcj/y2GtzBWKFisNWQ3snFvY6RIbzmg/ik1jbF
         K+TIEzO/z9mCnRXdj6xTvJYniHsOasv52YIgyyxd6HjR2/mmy+4R41T+eSORZdxof1nd
         myvNf132p4HvIyFp0HMzw7EE8xg/q9yX4VWVb3SsWE98dyuVRKknxJoSiMAxiRDIG8AO
         4j7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9XosnJ0YUN8ejBUAFunXeZZtgn4wh2tVN1eGiMvblyA=;
        fh=89rhhixn7jbhSryJmuJMIxGxEhh6/Dw9ZMvS+L+nIBk=;
        b=ARziL2bmlXbSHJYVlSaHsOmrFK5QXWKrvbxV8mHMFxmbxrH2lPj5HYIdN5vN6jphl0
         +75FAtkCAOa9nN6L5z/pJMxsGps6E0HK9L3U344Z2G03iUw2OLdwBfFoc7qJvfTw6lBp
         I/M10HTyh788ua+bFOd16WKUs5OiWK8GR9T+cvodXP+auOKKeT3pNYTyjnlu4BH8e8H4
         Dt2OdJyj9XBnh72BOjqheVLJRXOYK9MiETYmJ4j+tgoreKLDl4JfXQIV8Nge84jXsNhV
         jtPdF67jh0/tYdUJiCiyKY3xT/EEMpsMfPcQbZbiVuY7YEHBbcGZtwWdD4/+N3lIZjK4
         rjKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joyfullee-me.20251104.gappssmtp.com; s=20251104; t=1775225481; x=1775830281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XosnJ0YUN8ejBUAFunXeZZtgn4wh2tVN1eGiMvblyA=;
        b=NK88hXH1Ygrx1vKvCdh7xU2Y+1GEFrtXvXFBPSYk9UPFU3RK8GvaufNoSz2z0RMIsX
         KP6YNObykukQcjUPISvkYbUgWGa+LaVjZcdA+lK8G2HD4vpIGvfmItx4YzX7QcuY1Fxc
         ZAeZLoqzq3s6zZ7DNC7MHJanC5vj+hdV7RzBVVp4NG9LNlEEPTYoDjSjSNVnnwqjsqX7
         Y2tzj0Itr+IBVh5/DpoBXHbDBi+V+QKJvekTHjKjJELz2AvMntdVHoZRD2sdtZhHMvkf
         Pn27yqDVWnbUH8XVdxOmWV4Z+rFqqF3v/aB4XRSIUBNbbX6IrclBGb4iawMU8NxANhyS
         iSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225481; x=1775830281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9XosnJ0YUN8ejBUAFunXeZZtgn4wh2tVN1eGiMvblyA=;
        b=DT69uo0jVwivqVXdGXs9yFMxhX6iVdyYXkvpPUoNHAwNc8aqiqgAmz1fHHjKfEECez
         fYtXTQ0JTjkZWI3nO3y1Zlr4gPi0/di3k3SjWxoepEn4girwGoBOpDuA5wI8fvzepfms
         chOMsfZN9YSrJmZjX+llTS339SYk0rnyzIsJbhkE+dKUGPids2Y2qKU3hiC2DUKxne+t
         rA9M40t0ktW3wTiMGvzZ39/smUPU/mHhZzL/UjdOcBbT62QLzrx0+otPuqdzhzyQRz/0
         d4dtSpZKUd4lXPajX2Q6vRZO6QEdxNjJA8cBJGJpXNbeW0oSU5B+wC2ln6XsgTpg+qVZ
         NfKQ==
X-Gm-Message-State: AOJu0YyfKGGlstE01/mkpgpPeJDAQTLXpTV4Dil7VxCqu6auuIxqBnqA
	gYHcxbHlQWJwf/mOSxEJ3fRoJv+o2t/HOU0RSCRTN2aJnorZMO1RLfB1UIktW5L3e72tsnUDkxZ
	HrlNbVdaSUJFGwM1eVd5y3qzOW2yRfC5UGhhhgQ3abA==
X-Gm-Gg: AeBDieusK8aeKEP4PsUkBKNW3CXXkiGLKDw0serpG7e7aAc3RuBYRDgNWbCjozEWY7n
	TkxjtuqWAG2+ySqe+/ZVt9vm//Gpo93a713FnLIoATuGpDYluDRdaGEWRd8FQrTStFVCSyS/Y7k
	cZfJHZSvtQZpWyWzlebltC7Zd/G0RjtSaUOJaExRIyqRCp7WIQ9sMZuCiqIkqnpV68yJVaHDZlQ
	X6inwtuhw/YsIcPqn5/85F20U1M18i/beng9Kg/oTgSVjHk1hWPEsYKsiDG6Zkgs6EsdIF2vKc7
	nHFEYw==
X-Received: by 2002:a17:907:6d05:b0:b98:8e42:95ee with SMTP id
 a640c23a62f3a-b9c67b9e36cmr144796466b.46.1775225480967; Fri, 03 Apr 2026
 07:11:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADj6jrgK+sRXoNaYH90Rdc8DYEFK2iSF4vkJC=KE4UaZ73y67A@mail.gmail.com>
 <a935b2e3-e11d-47ec-af47-7eb7e86a9dd0@amd.com> <CADj6jrgcuz=Bcp0q7BHVizVeF=C2r_8qXw7r0Mc5X9Vd8uWK-w@mail.gmail.com>
 <4192851c-20d1-4185-9f63-32c66ed2a664@amd.com> <CADj6jrgse2NksUgkHUzTm0332ba4qnV=0QOJAnupS=Lr=5hh4A@mail.gmail.com>
 <4978c9b7-00bf-4562-baae-098bd0d09ba4@amd.com>
In-Reply-To: <4978c9b7-00bf-4562-baae-098bd0d09ba4@amd.com>
From: Joyful Lee <joy@joyfullee.me>
Date: Fri, 3 Apr 2026 10:11:09 -0400
X-Gm-Features: AQROBzBZsF6vCnurIxo_LP4rU-VgtPOhiDWv3gF24onCXf_ue1uebeHL-8ILQ08
Message-ID: <CADj6jrh2AT6vvQqujB5UN5tfcQ-qdDKjV_7fK18zsqkHpFTMzw@mail.gmail.com>
Subject: Re: [BUG] ASUS ProArt PX13 HN7306WU: amd_pmc s2idle S0ix corrupts AMD
 1022:150b root port, NVIDIA dGPU returns header type 7f
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 9:23=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
> To your questions in the original post (again sorry for the original
> knee jerk reaction):

No worries. You are right to be skeptical.

> 1) Yes semantics of how AMD-PMC works are correct for this platform.
> There are lots of other Strix designs that do everything correctly.
> 2) Yes; there are FW dependencies that are design specific.
> 3) There are no quirks for working around this bug you've found right now=
.
>
> I believe this issue you're seeing is likely a platform firmware bug.
> Whether it's AGESA or it's ASUS firmware is unclear right now.
>
> I have not seen this specific symptom you mention on other systems
> (including AMD reference systems) so I am /leaning/ more on ASUS firmware=
.
>
> I notice that the BIOS you have from ASUS is quite old:
>
>  > bios_date| 03/18/2025
>
> Any chance there is a BIOS update available?
> Unfortunately ASUS doesn't always make flashing in Linux easy, but
> hopefully you can find a way to flash the update if one is available.

A firmware issue is what I was afraid of. That 2025 BIOS version 316 is
the latest release for this device. I'll reach out to ASUS to see if
they have an unreleased version they can send me, but I'm not
optimistic. I'm still in the return period so I'm feeling a sense of
urgency to either fix this or move on, but I'd rather try to get it
working because it's a nice little laptop aside from this issue.

Your first idea that the kernel could be racing the firmware prompted me
to try a few timing hacks--really just shots in the dark like inserting
a 2s delay immediately after resume prior to the kernel touching the
devices--but no luck. While I'm waiting for ASUS, I'm happy to try any
other ideas you got.
