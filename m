Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5715475D
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Mar 2024 11:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711453441; cv=none; b=C/FYpMiW6cD4PWIodu9L8vE1KjJlLOdfJ2Xe4WGuj6XGN8f5vQhvrpI2OW0XmI7bBbQybEluP/HQUNCXTDZhUJxJN82pYYu/wPAuCNan9ciRyieZfc+C4h/CJtkgJNkc5C3irgBMm08iY8JdpYUKHiN9Iont5hzmGtObaUrvD3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711453441; c=relaxed/simple;
	bh=qmQ3LlhXY3QFRm9L41Yx5MepVpD7ltyOzolfuuDgGaI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=fZl/bA1yJ98xgDqpnieiQT+DEEN8rgSFityc2NUF5wxUDGimdv03I6XuKRU6P/y9tCL/bYCJOuVjYcsRAmw2Fbmp+9M9oA9S/usqmoaQEDI5kyY5fGuWA7pGUzB/po1pFELRpdDNKOJV63kEGTrV6lJCZZLAZgux8AiEzBxznt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=XpcSX6ST; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="XpcSX6ST"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-609fd5fbe50so60319397b3.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Mar 2024 04:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1711453439; x=1712058239; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qmQ3LlhXY3QFRm9L41Yx5MepVpD7ltyOzolfuuDgGaI=;
        b=XpcSX6STeKmKsij3Ow8JWbz5LKK67NkPOmptzCexmVMaJiVkAUuMpgbKE1jjiQWiXX
         qf4PnWbrzge7zMpN92Kxh40uHH5+XUE1gmIY/hefS7EDLJ2wWikROhPnozZfc+sIvkZl
         S30rb7DfD8CLyAezwjReqAwawuFYIB1I9HEsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711453439; x=1712058239;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qmQ3LlhXY3QFRm9L41Yx5MepVpD7ltyOzolfuuDgGaI=;
        b=fGLCOm1oSsKLJUTpuln0KeP1XjL3gjbKpYcC41Y4lA++HQ0TUhzehNm7+G6KMlBIsJ
         fzIWJitr2WrVD3d942LZ98gmn2vYh1TFtfBCo6EQk1JiyNm1n5SVx98uMYIsuC5YZbdy
         Uh1xAirA7oGhSHJqYhXeD08AR/uC0+5jqk4jY8h+13STjx+qZmsdXIPhaoExa+uRDRRe
         H+3DcI8/J9Id+GfrrCEiUBHLHpJ3Tw1XUsDPIzx4nFy777ha/vMY/LSIddyXbRYswYtf
         RNIC9AXDqO9vPQwR2Ns3LYeKmZCMAmBq8r0/Xp4lr1gTuUaAXiud/i9qhuTY8Ap4zOeP
         eTvw==
X-Forwarded-Encrypted: i=1; AJvYcCUZy6jy0++mkuQLNK4W/3t5l9uLCeIpRvXR3VWnegVHHEwwV0i+zGAIpCf4zDC/LxDeHoAP0Qk9+ErqEFW6AtBuWXuiz4lJ+gRhBLVuuApQ4+OShg==
X-Gm-Message-State: AOJu0Yy5KF2ikBGr9Xwwu65jCyUDbzjQmJmbpivjkLKHdMeem4yG6dMp
	X9Qa5l+Mx406OpUPM0mR9M0nTEteLhoyO50z8rSBwSJTzPvpO/j+j97FAE6XmOw=
X-Google-Smtp-Source: AGHT+IF2Cs0FGB3Z/PMvHAv5nLPWR4QtgOjqxm1/pnuQbMl02laaQ/7QbkJIkoTRm+6XIUt+SciZbg==
X-Received: by 2002:a0d:e28a:0:b0:60f:ddae:8236 with SMTP id l132-20020a0de28a000000b0060fddae8236mr2553848ywe.20.1711453439239;
        Tue, 26 Mar 2024 04:43:59 -0700 (PDT)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id cx7-20020a05620a51c700b007884a54ffb1sm2918486qkb.135.2024.03.26.04.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 04:43:58 -0700 (PDT)
From: Ivor Wanders <ivor@iwanders.net>
To: hdegoede@redhat.com
Cc: ilpo.jarvinen@linux.intel.com,
	ivor@iwanders.net,
	linux-kernel@vger.kernel.org,
	luzmaximilian@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/1] platform/surface: platform_profile: add fan profile switching
Date: Tue, 26 Mar 2024 07:43:55 -0400
Message-Id: <20240326114355.3245-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <aff161d5-cf6e-421b-8250-35e724397dcf@redhat.com>
References: <aff161d5-cf6e-421b-8250-35e724397dcf@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

> Once I've run some tests on this branch the patches there will be
> added to the platform-drivers-x86/for-next branch and eventually
> will be included in the pdx86 pull-request to Linus for the next
> merge-window.

Sounds good, thank you for describing the process.

~Ivor
