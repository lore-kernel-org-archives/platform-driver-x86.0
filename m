Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E3622627
	for <platform-driver-x86@vger.kernel.org>; Sat,  2 Mar 2024 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709398915; cv=none; b=qSTZ8ysbgKFrqS+kjsKcVvi8N/Nmn8GYPo+eZM1FEGBRuWUOrLHFUTR0Ro9//sS8+Guh/XhInyAN9fVvEGOAr4Dkd4E2SrOT3faOW1m5yhH5xFjzO1euRl//2uG/2RboehYUjBkbPGnHLFSiPf7/j/LgUnJrw7E7Bah7ZHYOaPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709398915; c=relaxed/simple;
	bh=mgtNdTqzkaN8N4V1/T55LN0NAswMFpKEgTXlVE+QKcw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Pd6kwc5lKNQFb82cUTioRw+ozbAMTqqtVUsGYa7+io9lBfVwi04wGxU2JD3c1mkRGohvB//l1+d9hYOJ45NiVSwPc4hIKseoSYsKx/G4yPMP+hymRL1PmX09ZVagVweLGGz7fidU098QmSzdHO2NSnzG3GvYacJR8FDV3Srgfug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=KplvVdEy; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="KplvVdEy"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7881ec5d2edso10991185a.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 02 Mar 2024 09:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1709398911; x=1710003711; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3M/d53LufZMh7nY9lLclzf68ULaBUxwU4N1OOUPIPtk=;
        b=KplvVdEyJA4SilYY7t64Nsb9cLpFJ2QiI1IlIxQP2lWLaGKeXI8OnaTGc7oNv3i6f5
         QRDetY8PRIjwtjlZeUq+Co7v+hBkDsFfUJ/JMoUygIDju533j7Rdfcm2iEmMdC+T+cvr
         jbkevcPi19ngRAyg9z/duIBF48R1f3Uh+LwXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709398911; x=1710003711;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3M/d53LufZMh7nY9lLclzf68ULaBUxwU4N1OOUPIPtk=;
        b=IosACd3clFGCcNtaKYVilt52ghoXhOMWWHElgZP91nwCYMYWK1kntm4NdY2Ni9Y/T8
         8/p71gpbZmhvAt3x0TapqfulohvZ3zQ0YfKSMRtPdBe1Uh55mDAg+dskBQhpW037na9D
         UPmEHKvVL/Dv8oGShtYRBKqbROn8EhdXYVqX0U2j25xsSFXw9dsr8diiPZ5lpKY5KcKX
         jGg4W7vRny/iHU307fvhTbhB2V+OfqlSfhezT2tPZDR5hk7KQ1iRyukXuT16cXVUR8Fo
         sFjwJN6MgW3rbsxOHsQ+m1qOg8NALtS95KfOIos3jVCiev03HX3qXJl8uizxA9h1BZtg
         dz4w==
X-Forwarded-Encrypted: i=1; AJvYcCVAOwpmQKLbxYaQMePYD80Cjk5lSDx5VhRKSB+lb5W1JeA2bWxgPf18vxvrQMVkAvwAxLJrjbYSO49HABLhuGuHRf0HrTThAeO+u090/ZrsabZB4Q==
X-Gm-Message-State: AOJu0Yxa+0e3xWSACFdSAkrs+whESsooNpPp7a5nDy/heZY6HcwL74Gn
	1WCfPC2BOBdSP7j+e7K4uIdKAzz2CxwjZJQP6AOUy7o7LQwSBBWsOfvOL80ZJKo=
X-Google-Smtp-Source: AGHT+IH7vngvYZmQZRUy7lTviPrFi4edHwk1G1lnR0on/W8OBU5z7N3PNSLpsQkk8LB3/I70w+FnRw==
X-Received: by 2002:a05:620a:1a1b:b0:787:f097:45f1 with SMTP id bk27-20020a05620a1a1b00b00787f09745f1mr6236196qkb.33.1709398911366;
        Sat, 02 Mar 2024 09:01:51 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id z8-20020ae9f448000000b00787c6ed9a68sm2684871qkl.91.2024.03.02.09.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 09:01:50 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ivor Wanders <ivor@iwanders.net>
Subject: [PATCH 0/1] platform/surface: platform_profile: add fan profile switching
Date: Sat,  2 Mar 2024 12:01:46 -0500
Message-Id: <20240302170147.13026-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

This patch adds functionality that switches the fan profile when the 
platform profile is switched on the Microsoft Surface Pro 9.

Previously, the fan profile was not changed and that results in poor
thermal performance. This makes the behaviour and functionality identical
to what the Windows drivers do. 

A plot of the different responses to system load, as well as recordings
from the SSAM bus can be found at [1]. Based on discussions with
Maximilian Luz there this patch proposes the following changes:

In surface_aggregator_registry:
- Rename ssam_node_tmp_pprof to ssam_node_tmp_perf_profile for clarity.
- Introduce ssam_node_tmp_perf_profile_with_fan that has the has_fan
  boolean property set.
- Use the new ssam_node_tmp_perf_profile_with_fan for the Surface Pro 9.

In the platform profile module:
- Rename ssam_tmp_profile_device to ssam_platform_profile_device to make it
  clear it handles more than just the TMP subsystem.
- Rename the enum conversion method to make distinction between TMP and FAN
  clear.
- Add enum and set function & request for the fan profile.
- Ensure that if the module's has_fan boolean is true, the fan profile is
  switched whenever the platform profile changes.


[1]: https://github.com/linux-surface/kernel/pull/145

Ivor Wanders (1):
  platform/surface: platform_profile: add fan profile switching

 .../surface/surface_aggregator_registry.c     | 36 +++++---
 .../surface/surface_platform_profile.c        | 86 ++++++++++++++++---
 2 files changed, 99 insertions(+), 23 deletions(-)

-- 
2.17.1

