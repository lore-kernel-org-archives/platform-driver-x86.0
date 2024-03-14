Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3BA385
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Mar 2024 22:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710455870; cv=none; b=peVyRhaR5poJHrqeg32yH9IHGUEjKHa4S9FggGyvGq6hXuxF37mHH00xGxe/Pj/kQ3RbVgBGn8mYRFTWpFgXG3h94lOsEo/I6vTVJ9gviPD1yOfT0svz4aDOUFs7dlNWJW+smIG+0mRFdO9S6xwBegMhl40oZsYPvXL3WuxrCk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710455870; c=relaxed/simple;
	bh=DYwGccQ3nzekMxwIlD+dlesOQ3m//0eGti0QnHKOE+c=;
	h=From:To:Cc:Subject:Date:Message-Id; b=n/8EyhS8TClMKPEGq+XiP1AfPw4XMuMyqsGdOM+ZWBe/aARHqhNXQUM9hnBn6T3J1z2gb6PjYRIy10d71HkR5BzwaSlqNve6hRVh8Dbl8wvSneJkh3PwzCt9YSSMwz0RhXKTxEsxHwRxrISS42EYDDDGByOTxiaE9aKxwXSIJ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=Y3uSTebv; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="Y3uSTebv"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c1ea5f29a6so759624b6e.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Mar 2024 15:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1710455866; x=1711060666; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVhA3coOgn/7Uvgol5ZvrCmIFQUcKJqMv636I1Hr4vs=;
        b=Y3uSTebvlyYRN3zw6oGbmEl8m6LT/123oiIaQYAbh/kc9CoUjvADidWaqAiaxjsn+x
         z76p3qG7whVMFHvvdlMyYag0ELTzuXpyKA7IpVgx2N2PAZE9RZRNZrT/jnclAyh+nMmm
         FQUBf0o898KhC4zlow7iNaYkozFXI/n60nitU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710455866; x=1711060666;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVhA3coOgn/7Uvgol5ZvrCmIFQUcKJqMv636I1Hr4vs=;
        b=vCj8kEura4IwRYuwoct0k0RZMf6m4je0eUtu+HQLypeKfxPzejjsTd6acNEmFCt+Rx
         +HUuLU2L2hw0svLE2uOPBiGXn2Aa6M2VLw5gF//ym1gBjEhBDeAw8abG8Njuz2kfASv0
         PkGCZN4OQgctD1woP5DwLDUBcxxNjYQAY3SsSwAJiX5aAenGOF6TWVsGKo+OVbRsNEIp
         7PUT50NOPOBtiK1imrbVluKY8z+GjTwmXBjWcWcacmZW/zJYLYlpuPTSS77Zd0/y2pSe
         Vx+3ld9IsplmVoyzHzQAzDhigvIO9ZPPtaUiv33bOBPIoOBb9Up0yGFfOHwshT+XX6Xb
         SjXg==
X-Forwarded-Encrypted: i=1; AJvYcCXHKsTaSK8aYsvuBpO2VIDkUcV+GToSoREJukSmShe6ESET96O1H5pfXYTNWPO9RX/p7U/8ouK033nzQO3tNgiUypAmRASIo5DbAT6kCrF0EvlYBA==
X-Gm-Message-State: AOJu0YzV/B4/cgmsA+bXIHnanQh2DnSwiihN04VlkmEgkLtwICQ24G3U
	GJGhrF8kItw3lGSdBdsDtEwVmgFy13amEg16tbMClahqJ+sCtlJglDBCTxfmvq2lY7dEwZH6oDK
	9c2A=
X-Google-Smtp-Source: AGHT+IGAOOfRBySCiMQZGBg8qH5/0uKU1q+54GPrmNNw5gNbPKI8lYxygfrAgcHz+INi2pgYVe1neg==
X-Received: by 2002:a05:6808:f12:b0:3c2:aa94:3399 with SMTP id m18-20020a0568080f1200b003c2aa943399mr3004344oiw.2.1710455866201;
        Thu, 14 Mar 2024 15:37:46 -0700 (PDT)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id de33-20020a05620a372100b00789dd526bc7sm826447qkb.129.2024.03.14.15.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 15:37:45 -0700 (PDT)
From: Ivor Wanders <ivor@iwanders.net>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ivor Wanders <ivor@iwanders.net>
Subject: [PATCH v2 0/1] platform/surface: platform_profile: add fan profile
Date: Thu, 14 Mar 2024 18:37:32 -0400
Message-Id: <20240314223733.6236-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

Second version of a patch that switches the fan profile together with the
platform profile on Microsoft Surface Pro 9 devices, improving the cooling.
Originally submitted in [1] which describes the changes in more detail.

Changes in v2:
  - Use u8 instead of char for the argument of __sam_fan_profile_set.
  - Made profile and profile_le variable const.
  - Added link entry pointing to the Github PR to commit message.
  - Rebased the commit on Torvalds' main branch.

[1]: https://lore.kernel.org/all/20240302170147.13026-1-ivor@iwanders.net/

Ivor Wanders (1):
  platform/surface: platform_profile: add fan profile switching

 .../surface/surface_aggregator_registry.c     | 36 +++++---
 .../surface/surface_platform_profile.c        | 88 ++++++++++++++++---
 2 files changed, 100 insertions(+), 24 deletions(-)

-- 
2.17.1

