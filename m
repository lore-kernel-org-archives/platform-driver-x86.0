Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8794D3BE8
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421295; cv=pass; b=Uz6hOutLOn5ArgoOh7J1wMKEYyVWbwuZ7d2itn6SkAASqEf9UU7xQQuXxc6Wcp3uZPRHLIGDSOGA5S2oNKi90No39JTxk7fz+4lGcxRieZKwUdYy5PMAiEcG8smFSbQesf35NuLqQqYqIQggeXhXNaA69deLV3jR/i81og4r0qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421295; c=relaxed/simple;
	bh=sr81G1l6hEDb1xGFNozvyAB92DmKQlAoBI/KVoCDSoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENxwVlKQ9CNKdx64pBiR5EeMnzdsll0Tn9U5bWJbFOWu7+FHxYsPLonvOTZfqhLLJ2bCSLXCaEZKQy+gstQsdwMfixHGG4kTmBj1FOaD96Gt9x2il+2PlMZ/xZdQ3EM2n1fXnFbJtKVN70vXjmszdV6Dly+Aev+6B1MU6oTONvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSHkxma6; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSHkxma6"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-917c04630c2so25744716d6.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 07:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792421293; cv=none;
        d=google.com; s=arc-20260327;
        b=lWhxLTQU4qyO8CkJcqQoYEGNE6UB0SwZ/rBp41de33Q4Pl+9sQQMui9ZfYu2/FmSEV
         AV3QA3wEjh+P5HWg0cRLcsEMBOF01b2aGc584JqbbE75pgVgb2JL5h84R14eX9GjWy2n
         5/VbB4VatvKugDAOgaJZK/cAonTK7kmDeMdA9Vy0Jr47ENJTRdKBwNuJ3h2DYQeKl0Ns
         hs8FZfmyiAraD1AuGVcU+9mvheANTDwQqcUSP6uWjCVQlZ0Fd3gT9UumXthDHusgXPxg
         9N4q3lFw2xn/FcUKaSiK8j+aSVElOrtNFot6hriw9GhpKUHMyp983Ni894OldYpXjzzb
         uKzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sr81G1l6hEDb1xGFNozvyAB92DmKQlAoBI/KVoCDSoI=;
        fh=0UpvMwpOGqcRSOQNM7dvZGTK59u9GO4vtcpM5wqCk3w=;
        b=j+lpO3pt62i5VLvMykCyKbDakzjcBSlAPy9KX195imPWvrg5i1cB7hPdBxiqu0xGWc
         zANfu1+BQVnHRygzZXh4jghAgZnQlJ1msY6EtwqpO9iMzx97SvdoH9yJlMWxZsoUjLlA
         E8BTIACilA54Ci+s6n3wVMRkD39lNu6sYrYrSiE6HQlg9alUyix8TC65zDTUw8bejW1g
         e5dWxl0DdwYvWdLh4LGwl1LmJeMCU7bXe2qAwkf9Cs5JYUT6iixuETiFJc8n/XN+WOx9
         S1rkaAiMn59XwnpCY/jpcQmCu5xQyR9MoffHe4W4biL37/8bKGWVbSBKDJbPoVer6oAq
         CnJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421293; x=1793026093; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sr81G1l6hEDb1xGFNozvyAB92DmKQlAoBI/KVoCDSoI=;
        b=XSHkxma6BTDnT13+x5AWBYnD/5668BqCyFUIwVqRS4d9l+lRr6vivni/uVTf6PPL1r
         a6jcrh56+CsT38D2X0SICw0g6El+S324MzWVsKi6Q3HvBIQI1jh3T2zhImma4tYPM6ZD
         PoHq3iZzekh1g9bmJyfEDhfK8DiNlYCglrF5ZFxIjBoqiEFFNrT5Sex4IgtLiQUmLolG
         3ArS/SFwSq4bGZ8BISUvbyGkH7f+ZIc1ljtug6LIUGHfEGI1Xaw3kdYz4r9j4vhU7SIA
         GwSBhXj5YCIhJ6Ir/BvceLkecUuhF/K+vMw1DH/fDFSkxfhpcqtp9bAbCIRlkXiDvAmN
         AnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421293; x=1793026093;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sr81G1l6hEDb1xGFNozvyAB92DmKQlAoBI/KVoCDSoI=;
        b=wryle+nlRNbSJh4on8dF9a6K3mDUAXJfO88Z2cRROAy852jfZQPdGhOO6eFWX5EPGa
         PmrQNJjaHG47xu16atI+yXeOHJyyVXyMdP7xc7ByDE9zCv0zS9lNb0mHPKDRT57Agpt3
         Uq5WdUxSeiDF7eNZ+F4+q8RXU379osV7OwN1LHrjGPG4z58NEIutpNCjkcICRt2w4m3I
         7JE/e5Hr0e5gL6GaevAOh2yyxEc93xtd8xbspn1yD2C8T1hQbttsuPWAZ0/OyiYr9cQP
         0QoSpJKR+sKiqQw/vA6XphHcdUEEd/rlBlHl0DAIQaVmmo+SZ1wKqjjGrbtUCR9/jtAW
         JO6A==
X-Forwarded-Encrypted: i=1; AKwUvByNlDqT9BZ+4aKW/Pi+JXXBLk2CKdD0XzpcG3R7Fm1zOsEzi7EMiP8brC9SHeQ2ddbKXcqgNamQPGPNgbss4RsTPi8b@vger.kernel.org
X-Gm-Message-State: AFq9FYLeia2Im1sbbdMjpgutcJewMFx54LolU5ngJrGDQUXRcD2fSGfz
	N6jUT87B+wFPNm/qKNmlqIZ/5YJucilCIxwzJdGiCu3Gj44W7facchJRGFRSyRQ91X9xprYkbo6
	lb7dzKoJJ3II2sDyHMb57tSepA57KKkY=
X-Gm-Gg: AYBFou1Y1pm3762zbcWOMkRk/5vt7g3NDKVSdxTGkzrfzml+UuhGOck1yDMe+aFON3X
	p0wfn9V8KqPkf52OEGRExYYSVnB7o5uiTLLW2qEF+6KiwtARZ/6JTvE1B79elq8tnPgHnwiSK7P
	nYoyr6P1Swe9LPfKARW7FhSdVeV6r13SO/OC4Lasd0Ji4Q2te8Q1ttFW2QnDnCizrxbMSTIXpl2
	pdSDSoJDvUzio+ipV377k891eE3eIVampP7FQxD8Ul5zwOkXeaJWDFzw/CHMXcsaYnq9aUprrb5
	CK9ie6l7Jhm2XpWB9VDa7RRcKR+Pxq76WCvVQlpV+XCoUrG2vgiMhjOV
X-Received: by 2002:a05:6214:20a1:b0:917:8ea8:cf48 with SMTP id
 6a1803df08f44-91bdefcebc3mr137859616d6.11.1792421292969; Mon, 19 Oct 2026
 07:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017-zenbook-duo-keys-v1-1-45f72d3db5ed@gmail.com>
 <1a35e100-010d-4327-afe5-1d2496ad7e24@linux.dev> <CAKspSoNJxEcEH1AwXHyNY5cWVvCQ3LN0fcZ8d9ajAoShdBMRKg@mail.gmail.com>
 <ddf53c75-80bb-43f6-9e48-629b49a6339b@linux.dev>
In-Reply-To: <ddf53c75-80bb-43f6-9e48-629b49a6339b@linux.dev>
From: Victor <victor.gillholm@gmail.com>
Date: Mon, 19 Oct 2026 16:48:01 +0200
X-Gm-Features: AclHuK81zGARuTkywifK9g6jYxkCdd38peFdUhidq_nESAH0fApy0cojRf-755k
Message-ID: <CAKspSoMNC_V40bDXzB8noHJG9F2FT8L0eUmh0-Ks1fOngRG62A@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: map ScreenPad and Task Swap keys
To: denis.benato@linux.dev
Cc: corentin.chary@gmail.com, luke@ljones.dev, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 10/18/26 22:05, Denis Benato wrote:
> Alright, I see what's going on. Then yeah I agree with this decision.

Thanks!

> My remaining question is if that screenpad-as-touchpad is fully
> software emulation (like dialpad on newer models) or is actually
> something different that can be made in driver... I think I can see
> some code using hidraw to send special commands to screenpad
> and I really want that inside the kernel...
>
> If it can be made in a driver that would be preferable. Guess I will
> need to take a look at asus_screenpad... Can you point me at the
> correct repo?

It is fully software emulation. I have made a ScreenPad plugin for
Omarchy (Arch Linux with Hyprland), and the touchpad mode is part of it:
a small helper grabs the ScreenPad touchscreen (ELAN9009) through evdev
and re-emits the touches as a virtual touchpad through uinput, so
libinput treats it as an ordinary touchpad. Nothing is sent to the panel
and there is no hidraw involved, so the hidraw code you saw must be from
another project. As far as I know, ASUS ScreenXpert does the same in
software on Windows.

The repo is https://www.google.com/url?q=https://github.com/gillmania/zenbook-duo-screenpad&source=gmail&ust=1792507315199000&sa=E
(the helper is service/src/bin/zenbook-duo-screenpad-touchpad.rs).

> Before doing anything please be absolutely sure you are running a kernel
> with that patch series included or you will see the same "inverted" issue
> after inverting the bit only to chase a ghost issue wasting a lot of your time.

7.2.5 still has the old update_screenpad_bl_status() with
"if (bd->props.power)", so what I saw was the regression your series
fixes.

I applied the series on top of 7.2.5 (all four patches apply cleanly)
and tested the rebuilt asus-wmi on the UX482EG:

- the panel stays on when the module loads
- writing 4 to bl_power switches the panel off and its DRM connector
reports disconnected
- writing 0 switches it back on and the connector reports connected

I repeated the off/on cycle twice with the same result, so the UX482EG
does not need a quirk once your series is in.

Best regards,
Victor (with a lot of help from Opus 5.5)
