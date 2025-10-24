Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40339202F71
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 15:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761320304; cv=none; b=V3X5vQ3G4RZn2S4TNE6BHq5SJCEpDiYUwClpu/j7CIQ9+NwIVvq+CvNWO5dSHunqcKsK8X3B7ZbaM8zFDQ8kcWwge1WT6LTZJe3JEubC7q5CaUFym5Ql+QIplFRDTKiWS6kmi9uZ7i5RukeF5S0pckAG7b//KiGyZCRngToNzRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761320304; c=relaxed/simple;
	bh=Im7nqYkVN8GEEntDxSLPo2i3X4Ms35HVdUb6rtJhWpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/ANBRFgYAn8qCQIPaYHvesMaaTZ5Qb5807WVvIlXptBSQ2UaaeBPr6NiWsLUCNN35NdxMJT0xIceT5AYGRzISl3ALiV81Kh5u45yp6ZD7Sq9vd3N92Oqnn5uR3zv1eBGirh5EnMHaKp7rL59zZn5NlNP9XPMl2sfpbXyyYZX5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=h1d8gqd+; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="h1d8gqd+"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 90C2EC5B0E
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 18:38:20 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id C2F97C0603
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 18:38:19 +0300 (EEST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 35CDC200A99
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 18:38:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761320299;
	bh=eE7WOkDVyRJiHeSEMjNbildsHJzwmYxdrSeSojss7+I=;
	h=Received:From:Subject:To;
	b=h1d8gqd+EfELmo3adA8EYxtX0OwFgYg8q9MOpt7wJRbeYpC2RbAjGwPb8r+e7Utge
	 CjonqCt4wFGSAp24ZXVEQezIdg4nzHwy16OA6XDTMUYjc7klPeQ31pDSfIawsGP9mx
	 bmjc7R2TLuOAw9NW+Fnm/vTRtNJhtSthn1vcfhxvHYCJawTTqgiY4f4hdYlGyUAF0B
	 Qsgsg3Zbo1nAFcc5NMJ14XPvVgLyUZlHP0rx24pjVGBLVeAPa16Zvy+4dGZlZsqHEh
	 i9IW0F8CM0pQpxwQSjlhFYNEc6Qa0KHKpE8P8P+bFqGbkMgTbZPsOhfMbuDxaHdlfT
	 +IQPwtbMDDobg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.178) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f178.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-378d6fa5aebso24212321fa.2
        for <platform-driver-x86@vger.kernel.org>;
 Fri, 24 Oct 2025 08:38:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW3E6voFDSZjPXeygXnNE8e+/66zoTY9VGHEYEUX2KU1bbr2V1GrHYjfWBfSTgtmM2v6bJPnRf7OHohiHHlasKmSdSE@vger.kernel.org
X-Gm-Message-State: AOJu0YxYf2kfzV22oxLkc9RHqi4Z9BGGo+b69Zmugw8dwYXKQTOwBQaf
	MAThewhUhCQebXqnLqwKolPgbfpUrGWcJTzLSVnLHziqop0uHYEFpbotW31tgfcDAr6N2Oceylw
	FFwuKxNJSveMFcqqWfTXi7yc117Zcx+g=
X-Google-Smtp-Source: 
 AGHT+IHxSuFU8jGxWLfAcRJMzub8OItIQWU18+63KmTH6NWzOau5ckGJVk7oQpzgy0uOuN89F0gjkZf/h8PYxxtz6I4=
X-Received: by 2002:a2e:bd05:0:b0:378:e12f:e5ed with SMTP id
 38308e7fff4ca-378e12fe7d7mr12930301fa.39.1761320298675; Fri, 24 Oct 2025
 08:38:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <c71c3ee5-e101-440f-9533-508d37d05d04@amd.com>
In-Reply-To: <c71c3ee5-e101-440f-9533-508d37d05d04@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 24 Oct 2025 17:38:07 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwG_uU_sA0npzj6u3Aet2exxMOWdJEi5GX72CSFZJWvyeQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnGAPB1e1DIOoCXwc5AzboX6ZyXgVQP0rByT5pDDuJuAElRJgJRdq7RFTM
Message-ID: 
 <CAGwozwG_uU_sA0npzj6u3Aet2exxMOWdJEi5GX72CSFZJWvyeQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] platform/x86/amd: Add S0ix support to the Xbox
 Ally
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Perry Yuan <perry.yuan@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176132029943.2412232.5809373912854332314@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 24 Oct 2025 at 17:32, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
> > The Xbox Ally features a Van Gogh SoC that on the Steam Deck uses S3.
> > Therefore, kernel support for S0ix was previously absent. Introduce
> > this support in three patches:
> >
> > 1) Add Van Gogh to AMD PMC driver
> > 2) Enable spurious_8042 quirk, as it is common in those generations
> > 3) Adjust the Van Gogh init logic to avoid powering down the rlc
> >     and tweak post init
> >
>
> Just to be clear - there is no need for all 3 patches to go to one tree
> or another.  The PMC patches should go platform-x86 and the DRM patch
> should go through drm.

Perhaps someone wants to test out all three. I will resend only the
first two next time.

> > This allows the Xbox Ally to properly enter and exit S0ix suspend.
> > Perhaps it also allows the Steam Deck to use s2idle without crashing,
> > note it is not currently possible [1].
>
> FWIW I don't anticipate this series actually gets Steam deck into a
> hardware sleep state because you need firmware support as well.
> But the drm patch will probably will help the hang that was observed
> which lead to the patch you've linked below.

That's what I think too

Antheas

> >
> > Currently, around 1/10 times the SoC misses the PMC hint and does not
> > enter S0ix, so perhaps 1 or 3 need tweaking further. It wakes up always,
> > however.
> >
> > @Alex: I tweaked the text on patch 3 a bit. You can resend it separately
> > after the issue with 1/10 failures is fixed.
> >
> > [1]: https://github.com/evlaV/linux-integration/commit/5ab73e9069017aa1b5351f91513ba540ce5905fb
> >
> > Alex Deucher (1):
> >    drm/amdgpu: only send the SMU RLC notification on S3
> >
> > Antheas Kapenekakis (2):
> >    platform/x86/amd/pmc: Add support for Van Gogh SoC
> >    platform/x86/amd/pmc: Add spurious_8042 to Xbox Ally
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 8 +++++---
> >   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c        | 6 ++++++
> >   drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 3 +++
> >   drivers/platform/x86/amd/pmc/pmc-quirks.c        | 8 ++++++++
> >   drivers/platform/x86/amd/pmc/pmc.c               | 3 +++
> >   drivers/platform/x86/amd/pmc/pmc.h               | 1 +
> >   6 files changed, 26 insertions(+), 3 deletions(-)
> >
> >
> > base-commit: 6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
>
>

