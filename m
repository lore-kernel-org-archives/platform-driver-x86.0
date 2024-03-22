Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EAC7E6
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Mar 2024 11:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711107791; cv=none; b=XAUn0q+ErzfIrnPQ3kjOCLaa6KsnU505xXhkfZxYmjvnsNsh6Gu2cOqjGNJ6ML1oWh3aNGtezqCS9nHJyOjBpmdMPgdpN+wPsdSLovwfKz5yPnvLAebCrDBJUT4qEWlHBOocUim1h7ndORsNtcjlyMz+CSaLZFLxb5vW0EYXbv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711107791; c=relaxed/simple;
	bh=W7Q4P/rzj0G3q79QAASFJ4CLV1Bmjoq68CrSY3p+Pi8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=bX8od+xZvHCKa82Q5HwHNe2hmdSIURlHVXLfnOd4Osbz6EIvK23GreXzjRkryxbpnVFQhsglPRm9ZowsFAP5/D8xfwNhwOwUcQuHS0LJgToz1FNUMJQynhmSBkZQsyVWG+nLvSBlpRCS5jw78vnvKv2c/qQ+HY37AxRWj758Eac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=TiO96eF4; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="TiO96eF4"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-430acd766beso10816221cf.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Mar 2024 04:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1711107788; x=1711712588; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DFtkdxWg3YTDXubNhIb/ZMO3gxbH9gnrT5pvNADSnCg=;
        b=TiO96eF4Mo+81tGU6k+TFPiNR/c0kE4MTLM2wEAoUb+fA9hlwWYQSgvt/CHw7S78C1
         6+9uj/uOgSdW20IP/rhFXCgctQO0Agq9y1IPtv6+msE6XmFoJqAETsvJZD0CdF/oguwW
         yOK16/CdlnLW9CIMsQmmNjQWB9XckGTXWBgp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711107788; x=1711712588;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFtkdxWg3YTDXubNhIb/ZMO3gxbH9gnrT5pvNADSnCg=;
        b=qWPbcelgZrs0vpFi6Ac69saR2SqvmobAk3joLaLsYFmBqpJcWKI3vywNGSAr0tct5R
         nlIjmLf5AnkKiDtoI7WAvfITal/PfjvxXH1E//audKYysUCHhsro4c/VdvUU50K6XL+r
         BPZE5/Tr3OaWj+zOMXUntIkM6SyLEUzaXfuDPtNlVRt3qMnkCIuDDnGsyydx0X6W2HyZ
         7e0u66qRfpa26hjor3NiuFNeoULlFunxRBJGSuS8L+6XPrkdgTR81gLV855T/gV/+Ij3
         sjby0kzvlio0ser89zrzqQaNFpz9GkZhgYkRYoReuJYkags1xsPHj9UxFZJNPsERyJlZ
         Eqcw==
X-Forwarded-Encrypted: i=1; AJvYcCVMcaJuH+RkmqheCYxgqQCHbn0NMJxjIai9rmP4LQEodk1Gzx6DgMpMUIvkEq20ft8gUIo3oBzsZhf7GzDduZJdfFCnIQrBQulwlysAk8sQEw2dAA==
X-Gm-Message-State: AOJu0YyVkBF47wxTz5GDvAgV/DrXBA5zeYk5s8R8hT+84v+fVK0pFdlz
	a+zyAYHsxdmNImVcD8fXLgyxiSiiNmHNMLojt3eK0rlTsDphlODqTXhxG+MLC+0=
X-Google-Smtp-Source: AGHT+IE+3zHeeoIhE2g6TVXkodbfwvwwsGK9eDPW/sZjxsDKs2z7Sz1XXBTnamJ7SLqqIwckBFiBbw==
X-Received: by 2002:ac8:5cce:0:b0:431:1274:9833 with SMTP id s14-20020ac85cce000000b0043112749833mr2187480qta.65.1711107788334;
        Fri, 22 Mar 2024 04:43:08 -0700 (PDT)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id e15-20020ac84b4f000000b0042f14f31cd9sm782853qts.92.2024.03.22.04.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 04:43:07 -0700 (PDT)
From: Ivor Wanders <ivor@iwanders.net>
To: ilpo.jarvinen@linux.intel.com
Cc: hdegoede@redhat.com,
	ivor@iwanders.net,
	linux-kernel@vger.kernel.org,
	luzmaximilian@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/1] platform/surface: platform_profile: add fan profile switching
Date: Fri, 22 Mar 2024 07:43:04 -0400
Message-Id: <20240322114304.3615-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <424d43f0-bcbc-f904-03bf-9f4c0488d706@linux.intel.com>
References: <424d43f0-bcbc-f904-03bf-9f4c0488d706@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

Hey Ilpo,

Thanks for the detailed explanation!

> We're currently in the two weeks merge window (the time between kernel 
> release and the next -rc1). Usually, nothing happens during it for new 
> patches that are not fixes (there might be exceptions with some 
> subsystems but that's a good general rule and even with fixes severity 
> matters a lot if they are considered until -rc1 is out).

I see, time flies, I thought 6.7 was just wrapped up, but that's already
over two months ago.

> Our tools take care of the tags such as Reviewed-by when they're made 
> against the latest version, there is no need to resubmit just because of 
> tags people give to your patch.

Perfect, good to know, I'll just sit tight.

~Ivor
