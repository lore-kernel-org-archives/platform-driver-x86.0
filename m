Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D677E41B8CA
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168387; cv=none; b=L0e894WAgrqPkfH936i+7o4LJhp7XKDmMV/UJ5J6cKDmcboOD7x/rUGa/au8j1Id7DPbXN+EPLqHMTRqqNZOmlWXp4kaL2ZlYIApAgU55znLlLPkbYyjVU4S3T3AWVWYbOGvD0lH0oy37xLelLpZsu7IVHMtrnhYnoHOjJn8NjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168387; c=relaxed/simple;
	bh=TD4XUS6zybk9U61zmSU3P1MtmpnLFgJQ/bxrTRjLYS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=og9lCTr7Pj4/Td4uJF+4dUc1HFyqRf3POR1AM+iTrMQobmDBEhiaeGO7PIfayLS72uJmOXdX8emuy3NYCEZuTlHG89+KEYDUyep6QXhwsOAy20bXaV5HKLPNhlumcw+R3XGsT5gLFqFixxQig7QZ6Dk17Icqin5KEyLfVrDElCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExbRk1dA; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExbRk1dA"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8692a856865so402716b3a.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790168385; x=1790773185; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TD4XUS6zybk9U61zmSU3P1MtmpnLFgJQ/bxrTRjLYS4=;
        b=ExbRk1dAAwSwEyE1ABuYIA3J7px1iQ3y8sgN4c3A3x9VvkpPneNRe7j1a02xN06kTd
         3NBFUXuLhbMomg2yaP5kfVEh4NSrYiXZNZN4wz/rp/O32PsRDqtSgVx/ZdN4euRUoh76
         Hc8E9sAlA/J+y+NMSVgkqfz0NXh34QvyFThXtwB72dZKvhAqpf7yB3J9pH0WuqQxRmh0
         7vPAzKIoVx13fdGxbufi7yMs21w4Jq10dv9osF3eYmQnbNORGmVB7fQ+K6J4zBTsQyE3
         cGTWUswr8vpcoXALR7QnjlbxfD2z+ILqus3S9QIh0FU5qDyrdlvUJX7c4CdmrOLtUmzY
         Dghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168385; x=1790773185;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TD4XUS6zybk9U61zmSU3P1MtmpnLFgJQ/bxrTRjLYS4=;
        b=LlVKkh4dSh5mMlzrLf0l8r8vu12PjMpsYELsjAz/eysdH6Rctm7+1GWc/IqWMojBjm
         FrofsmjmdPbWIkJvZcmkIJfB610Zbs9Ss73PciweVfQkub5SDicyLJqjFzPK5RrYRFe0
         k9zkXmvKIKn7oW43u/Y6QOGEwOwlU3+Xurd0SFpgONy5xLXt/8rSOU2Kn5uET1Fssj53
         6WQggW8fR/llvaWOTGbGX7PIAIU1Hkofj3cNGf1GVOKNIpBDg8rXJkvgcHb7ZeChi1N3
         hqxQ0xV+3FgAbsUcAPIuEIBS3kquBO6HB8zImB6x4bK++GKZINolaZr3aahxuv2ykMtj
         EE0A==
X-Forwarded-Encrypted: i=1; AKwUvBzxqB25czQOJHI4tXaaF4mD9XBtX7oUjbgPDMx83mqnjEg13qDrdw99tuOv9fddaXBjYTtCvgh2cj2iy8x1jsm0HVaV@vger.kernel.org
X-Gm-Message-State: AFuF++kLgzUcAmFRajIIduWSE3FKl9CG4NLxfG4FUlRaBotRaZMOsb+s
	DABUNI8wKgmOe/wz5njBX0guDj8Ad5FQ1eEYo+fFIQAL6EChAl/MgOHU
X-Gm-Gg: AYBFou1Nd1Xo5Pcb+FMPD08RJq/PG1s6ebPYxUpsyL3MP2ZuegBHbravlNp5jVhBkav
	FNboTfzvzppFOfOCBD13WLQ5awGApoH6pxQppJ6PVbIUnXYYJfWKhNyToiK40RWETDl3AT2vj6p
	GvjG83Zm0HeXlns0K69qvKB32SnwNhMpymTh4lNMtNHj067vRby95jbEFnb5AD0Gq9vEsVFCCws
	3rKZKXyGpWYizCJemTC52kvbD0ubNXRAHpJA0UYn2LEBfA+2TvkS4Bs59hmFVnjA5geb7UsldcN
	HmfqxlCO0/YMvFPt7mkzhQJRVJCOwYiPxV5RZqMOvB1VpLzs66BBczqMBe2Sqif4Njhum9QVsDj
	tYEBhXJNpci515nbDB0wKvIjQqZ48uKFQR1bFaBSQoriJHhJ0sFbScP3MdrwTSxhGQIm4kcMPy5
	O7cgZY+GPxCjlCBDucU0E7WJD+jUickLwoy9KLD5gMYhvMFPw6KkUfPLvAV1/GFSe+MkyREQ==
X-Received: by 2002:a05:6a00:4214:b0:87c:3650:6f29 with SMTP id d2e1a72fcca58-87d1ba9e55bmr1912460b3a.42.1790168384696;
        Wed, 23 Sep 2026 05:59:44 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cfbfd6esm1171555b3a.20.2026.09.23.05.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:59:44 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Denis Benato <denis.benato@linux.dev>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Martin K. Petersen <mkp@kernel.org>,
 linux-scsi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>, Derek J. Clark <derekjohn.clark@gmail.com>,
 Marco Scardovi <scardracs@disroot.org>, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: Re: [RFC v7 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver
 for ROG NVMe enclosures
Date: Wed, 23 Sep 2026 12:59:36 -0000
Message-Id: <202609240122.ReplyDenis.lhw@gmail.com>
In-Reply-To: <52904b48-a5fa-4872-b9bf-a05b1b7bdea2@linux.dev>
References: <52904b48-a5fa-4872-b9bf-a05b1b7bdea2@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

Hi Denis,

Thanks for the context.

I have read Marco's Dynamic Lighting class series (PR #17). The
direct frame and palette interfaces map cleanly onto what the Arion
needs: its colour tables are just small RGB frames, and the
enclosure firmware effects map onto the class effect controls. I
will coordinate with him on using it for the LED side, on top of
the verified SCSI handling this series carries.

On the open review items: the next revision will isolate the DMA
buffer into its own cacheline (a real issue on non-coherent
architectures, as the bot notes), and I will take the time to get
the full pass right instead of rushing again.
