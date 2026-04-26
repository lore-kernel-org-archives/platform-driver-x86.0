Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCCBEEC0
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 17:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777225427; cv=none; b=rQ0WjIs3c2JxP2x/vSWpG5kP1OTrJgeiZtcj0j8ODI6awJc6r19ByHP662QsGHIKLc0iBp4bf7DPZawDjQdFY2cyGMVZEWkkdyek755yMtpi4A3Sblpa31cxOBtI7RpvjNqxsEm2Zi8eCctw7Jq6SHB5N2HUfGPZaz+P9MZXZ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777225427; c=relaxed/simple;
	bh=o+2tQlNwafZZw54JzhYieeauP3zcVjDqxTkCRYEWQVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYnxMdJyNDWVGzp/p4Dg6tl/c8gTBw7Nmkk1GUiZonXMQY+ZCxeMZFKJcufLd3ebknXNeKviKd1xczAGxY4Gs2XlG7o5LE9ioaeiMAtsez2fZ3dUuoxeLLwG+5WF0NWfYCAuGaBX71biSamSxvibz2UuyTJFoPbxNJyye+i1GQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsLIADjm; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsLIADjm"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c795eacbeb0so4099948a12.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 10:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777225426; x=1777830226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+2tQlNwafZZw54JzhYieeauP3zcVjDqxTkCRYEWQVY=;
        b=SsLIADjmXieyi5SyeyDB8KCWysBp+uQYMF2GblSH4acnEu96ArjgXcMXX/q0DYp1lB
         DGs0hl4ko0rS5pKmFXVMcGDJ6ghBM92mzAiGg84k7+uYLyhXckYOSaucRWAouV/WYNDr
         rHBVP3/Ye+scKTZunetIh97+gIwpPIgX+f87L+9wRSJEaAAeN9M1KB9LWu7rhxQEEEsj
         RFAELWumtQumuL2DW321vHMhCqj4AxWachf+oUwXPW2dZPyqs5zvoyaqOXnWl+dCccvw
         u+OeZ2bizv80/A6L/ofDIU0R2WG9WxlajO5h2pTQKnADzgHpWYd+L0OSKQwyKIgK6yMF
         Hnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777225426; x=1777830226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o+2tQlNwafZZw54JzhYieeauP3zcVjDqxTkCRYEWQVY=;
        b=CoIP72HzGhOFNvwCg5RrOhdBfynLh8R6CE8sjnxsVeyEhaGQLGvOrKvf8q2bKFxCvP
         48gu2Bi8ZbnzszTZXY13WuOVlhrQE5SnpyXAUxuR5czY/BiUT6FEyLhpFI7L5kt41S8P
         BehiRhNvxkah3ZcV46UZPziFfUBSJ4yxeH6GpUlklJJx8uO8kjFHwj54YGDy1ItDyP06
         TqK13vdJd4DNP7sRVuIh2y0DmO1bsM8MJWRk7PYi/HoRPFbLlkXxQEJD8I2ea5zPhd2/
         EdiEnavTC00QFt6YVJog49NVqyj+yb9SfxMlxcIK56FTaBnwiTlH69SGh4j3U7HR4yQ2
         DrYw==
X-Forwarded-Encrypted: i=1; AFNElJ8O2dSVUoKi/LfOL/XX7UH/q2OQV3Z061T+rl1priYuyymor6r5h8JCEsnm6zgwBD79nYNS9snlRIxoHa879o0vZ3yE@vger.kernel.org
X-Gm-Message-State: AOJu0YwSZBMJUYynoFPOgCR4i8/05BMweGUj7VImnk7GsxFfiBBrIAYM
	i/2tM/Pi4+Kid5Nep6WtGlASJ/qrJJXdC9a5/UkwtHyckdOKMYULg4U0
X-Gm-Gg: AeBDieuRFrwdlWtBKv/Ctyhypf0sKHS5kWObXNs39ImScGZUwwxnD+nRwbCO2LSAGCX
	gr0RXHqbTb8WUXCYgtVJMGs153/HhZAZfq8WhJh0jX7xTh3evc7+Ofha0OvL68wtHbT+M7I2trG
	iZ8DQjOxEC1lUyCcNW951ivT2Xgq47/4LYdXwFtkGQNlHMP3MgQ2WpQJvJDl3IMeomEoDFGwekI
	CvUFnOzw178UL0gUWlF/ugVe1qISLBycILK6PN/exAC7ZJ9sUwcW8rxGgkZPzm319dxpqXQLfo9
	K2RIM6YWOYYurhWMdAU0AXz+Sn40MIBf3Sz34wOIOLJqf8H+7kDm9qbhjrDpb545hoJFJdMZT3c
	/ZPfCanY9rWLBQzg3wrQTXpfiE9maZNkJGAIgrVCY203bk+0JC9p1D5u2le7RTWMc7FsDKMp67T
	HAIygb2iqnHoMmUIrXcau3CupQFFbYyTzw+ZN4GsRx0WDBSvg=
X-Received: by 2002:a17:902:7293:b0:2b2:ebed:7af5 with SMTP id d9443c01a7336-2b5f9efd501mr270575985ad.13.1777225425876;
        Sun, 26 Apr 2026 10:43:45 -0700 (PDT)
Received: from LAPTOP-DV5I1MV.localdomain ([27.19.123.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa30047sm289920375ad.28.2026.04.26.10.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 10:43:45 -0700 (PDT)
From: Yufei CHENG <cd345al@gmail.com>
To: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	i@rong.moe
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: lenovo: wmi-other: Fix uninitialized
Date: Mon, 27 Apr 2026 01:43:32 +0800
Message-ID: <20260426174332.9981-1-cd345al@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <673b66893c16ca31b403e7e7cba32e9b71a7515a.camel@rong.moe>
References: <673b66893c16ca31b403e7e7cba32e9b71a7515a.camel@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rong,

Thanks for your feedback, I've corrected the format and resend the patch.
However I think I have to point out some other issues in this file.

First, we should not complexify simple things. You use lwmi_om_fan_get_set() to
combine get and set into a single function with a boolean flag to determine the
action.
This makes the control flow harder to follow and audit. Furthermore, this layer
of abstraction is not applied constantly throughout the whole file. In some
places, values are set through lwmi_om_fan_get_set() and in other places,
they're called manually through lwmi_dev_evaluate_int()
This inconsistency makes the abstraction pointless and is the direct cause of a
second uninitialized bug

In line 855, args.arg0 is set to attribute_id, but arg1 is never set. Though
arg1 is omitted in read action, you're still passing stack garbage to the
lwmi_dev_evaluate_int(). And I think it's better to zero it out if not used.

Additionally, I doubt whether bypassing the minimum RPM divisor has any
practical use at all, not to mention it's not guranteed to work and purely
depends on whether EC accepts that sub-division value.

I may do some refactor recently, and I'm happy to hear your suggestions.

Thanks,
Yufei

