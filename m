Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B953F6C3A
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 May 2026 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975295; cv=none; b=pGI2gp8/tWne7bVbaTmhofTCn1vpqJlEcR4jGFVwqNhF8T5mjloIoLwMycbPG41z0iahrfWje0HOx1De9+XtcOpPbYxFpjeT+m4iaHmcFnQCSxeEVinBO5RyvBDyPGI4VYMULRVylcAiVhpvK1t33vMnBmSBF8LGM+a0TQVFNec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975295; c=relaxed/simple;
	bh=D0k/9kMT/cL2pMsnIms6KyZ1W0wrvG21b+rTr48iBns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CIctExKGFIZYmKX08P6p/eHvHkA/fY/5u4Ie0Qpo6UORQHhh1qrik23liHlofWnFZB7tqcpYb/wMLfpbbaLrh5yZvy4PtVVYVXz9nOvJL+85fDXlKlrVSDTR7CYovrvd1gSOLku9D+PkE18l/H2NPKzNMIpznjO1qCzQ7cHeoBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPmNREmI; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPmNREmI"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f8b60e485so5483340b3a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 May 2026 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779975293; x=1780580093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yzn0YhLzTvt6pUfo05dJeo7r83ZFgX9EtU8J8f4Da+I=;
        b=BPmNREmIJR4XU8LQFxJunZZryQJ7DLcvzCwJ9h32wQtRvtmZefV1bDr7I2YJDbehDT
         xkhEbIzXVLCH8I0Wf+0r/YJw+pkx/lhMD1fM5ol7fzPHmCUeF9jdoC3zvSFFE7+IwxS5
         kDfC0G1YNl1rOUfFmKeMp+j03Z86mlCQyolnAPQYXCDMUL1tEl9wQ4LiOLZtlJQLdHxw
         BiPyf73ldvZdr7Jqzu4JuYKY4AWO1CMjcFASIYpISEpfzv0jk3rwvR5jITL4Z18Plf/O
         hnYLxaTtV697O/nhCt8+v7xVNZAINNYUXjNKgUG8c9gONwgT+LT6KFx+vl+bKnkI4mIB
         AgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975293; x=1780580093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yzn0YhLzTvt6pUfo05dJeo7r83ZFgX9EtU8J8f4Da+I=;
        b=BaiAnkNRgSeWLUAAZp+Pvhlk24RyTeBQR/13saR5AaEBBtIh7sKlaamlw5CO3nom8e
         Rm+SKqT4Yur2o+vXRGl3fJgf0gHIqm0x6V3tG6zDSu1bmw2+iVYnqT2X4Bhy0YGg0lI8
         OSsYSuBMftbqTs8SNdoD3Th5OPWQg+ivyYw2aBnBy4yO18dVBGv8E/x5rA2R+AfCIl6Q
         TtJFnsT/9nAPFr2RjUTk6drbHCrisiso139yn6840DOSXNUbgRfrWme76fRgx0H+kIdy
         H29s1YUiZLu7+/Tx1m7og8jQRug7OvOICH+uPVkF+DLTNWd9ENFAryfh56Oma5tv9bR8
         XuLA==
X-Forwarded-Encrypted: i=1; AFNElJ+dQsjdmCTwWZAE/VL6jr4cGrQyOI38qJ+KPpeT8WItO//UCqFXyELcKjjh7kPmaH1QJJhEBtLJxyyzR06jURthxHQm@vger.kernel.org
X-Gm-Message-State: AOJu0YxMkdp7hoFUtgCiTuiLjaV+aVOYHrTiASTmvPFTecO9kkGKRCR0
	o2Hb5A0577c17Yehe2Z7ZXxH3j5a0U32G7L+vOgjG0pFY4GUSBXCJboX
X-Gm-Gg: Acq92OH7Tjyc98CJnr+dh+rRROQr1Lx61TSZCHD3dBuM+QV7d7q8rUAIwWM+PIuzbaj
	Vx2rczmh2EvFv9nQ6zEUNycCSqkCUH1BQifdUExUn1oFzAPc4E1kGN9vWNQFYtTUc3/hCN2NKKK
	6AA5HzSi/C/wSyAt07ZBEDza0ZEM7J/P9WTCCr+AbLLkEADD/lcE67Hjki/l/rgJNNvHn0r+Gsa
	3ZYLy3UR5Eyg55kP7Ncykg19KPLCztButNKhg2/wVGbfECxHXiH9YNjk07pfAw1WhPmng5vf2ev
	d5BIj/E2Za6faxJgOF3JUPadI2G9tXJ45XoLZX47cG4r1Ruz+8Eo/TY1JdDJOgUifn30zwyO0Bs
	t4yjrvaTUsEozNVe4Z2Up6fGiaK8J2+8nmUtCAcnKTlam+b/QKkYDI7u/NC+pvXw4e8D032P7Xg
	dKL64IKJNVsHLtN8tBZ1+ZlVZKXOB8+p4F04dKZX+qduy9/NejlxzIDBx1Qqfl8chPhwD04nFqn
	L/MI+dipsnBhghqZgdNtkY5
X-Received: by 2002:a05:6a00:3910:b0:82a:5ef0:210b with SMTP id d2e1a72fcca58-8415f15a77bmr25792188b3a.15.1779975293490;
        Thu, 28 May 2026 06:34:53 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6e82323sm5195429b3a.2.2026.05.28.06.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:34:52 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: airlied@gmail.com,
	andersson@kernel.org,
	bentiss@kernel.org,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	hansg@kernel.org,
	herbert@gondor.apana.org.au,
	jesszhan0024@gmail.com,
	jikos@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luzmaximilian@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	platform-driver-x86@vger.kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v2 3/7] platform/surface: SAM: Add support for Surface Pro 12in
Date: Thu, 28 May 2026 23:33:47 +1000
Message-ID: <20260528133353.33312-1-harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6808166a-423c-c801-497a-ed95cccc8d0c@linux.intel.com>
References: <6808166a-423c-c801-497a-ed95cccc8d0c@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 28 May 2026, Ilpo Järvinen wrote:
> Could you please confirm this penstash is correct (sam vs kip)?
>
> Sashiko suggested it might be wrong but take it's report with a grain of
> salt, it's AI after all and sometimes seems to extrapolate about HW to a
> sibling HW without any real knowledge:

Sam is correct here, unlike the surface pro 11, 
The pen stash is on the reverse of the screen,
not on the detachable keyboard.

An image of the pen stash in use is available here:
https://cdn-dynmedia-1.microsoft.com/is/image/microsoftcorp/B04-Surface-Pro-12-inch-1Ed-Family-Rear?wid=1200&hei=900&qlt=90&bgc=F2F2F2F2&fmt=jpg

When using the above config,
pen stash events can be seen with evtest.

Thanks,
Harrison
