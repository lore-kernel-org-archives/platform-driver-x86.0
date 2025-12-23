Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DB92FF153
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 19:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766516950; cv=none; b=LCy2jnBw5Ge5A0SUhMBKVzNhrzgevFH4wxaFFgjMzZFMvHaBmlvLMyI5QsLaw4AipelTDrCAjNHfGKd76SqeOUUlBdg6IDcVNTsSSdPlvcxDFqbLiJkpcRWvx7+2NS1PxNw6XI2Bb/XZBJMgaWJ8jDkUpdhRb6hlEdjIPxV/O6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766516950; c=relaxed/simple;
	bh=sV+ifDsv1g1XO2SufnLUilAIza1uaxlEZP0WdpjeuOE=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=XLzPGcoC3/RW0TXK/2YfhOw6KqBRch8N+IE6pE+hD3RR+MYQtrgAa13A6wSb3sMckJ040FyMfrb9KsLcHBIjhwb5MwNm0OAbK4CWljPxYygHnw64L+hhue4sBH3ux2tjutbGuibgCWuClTUYPNtervbgLx2tLmz7tyoccP+lIDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pm/XJYoc; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pm/XJYoc"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37b95f87d64so43889241fa.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 11:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766516946; x=1767121746; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OmqMSyxeN66T/C9Z8QDq/u8ixnhpyLfHShrI3U1U5yQ=;
        b=Pm/XJYoc+NVf5mY6KdFFDMamKa7VKIYu4wj6ALbySne+aSXRh+sIWgIi994Q1W5M/K
         V2k3eudfdHbvGTIgKDeMMH7kHQrXidAUHJlM3bwZQY8uRZOpyUjgIe71B5H3CnzjNjvX
         eMKgp5U8jPbzIy83OFyeU0dbr89YNblVyNo/O7ppvnN0UNOicpR0Bob8D/WcU9rOoEhZ
         0iIthH2hnBhiSOXw+QEpb8q2gV+ZaZzYTl37yZkCt/k2fjHlVlzUJqn+7ngzABMGNDr0
         HhGcVZyZL3MPohxf5IiJ2GjEC8B6mw2tCkAm8cM/n2fH5LEyHfx/4+NUiew2Q39jIX8M
         NnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766516946; x=1767121746;
        h=cc:to:subject:message-id:date:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OmqMSyxeN66T/C9Z8QDq/u8ixnhpyLfHShrI3U1U5yQ=;
        b=BSmfhuqgVsMfzMDqWzTltvMImp5oeJgtL0uWgsLIhkH2eKL4Q38EnzfHgdO43lJC7C
         EiZ/6YKYzGcI+9fIEKYKbMX39Qy8/SFyHst4Eavt7ruTyhUmdtrsBe52Amn/UNtg3JKO
         q+VdQ6jvjuZ42ZSUcLEH6++NB7GnTB3ad4jBXQFmmyZ6Rkjd2ocEGIZxQrPNi7ehQli9
         ho1jixzAKx8pcPfleGYFL16VQbIhHTeTAOkMGMJDOhgZzrQW8VKyd8kTQtTrIaO3A7jP
         Vb4O/Q79uKDDO7vTrtZU6WUcnquGG8MZgnyhhabYIqeUUIio7X0vDM2ihtMwWJNkaYQ/
         CVIw==
X-Gm-Message-State: AOJu0YwJKNBULUhbau8173zJ6kAlVOL5KHVlQrfhc577HUQxFaWXi8jh
	ntNFS0bwFxQT9wJmSDnp1YxG6Bs42gZCKp2rVvqcKs8NLchlWX1TMcapwdMx2Nfz1rQ6CEyqifn
	UZlmDnKVp6me4McydlGH4VEJ/ZHGf6Vo3rOtF
X-Gm-Gg: AY/fxX59MltrVc3WejONnyE0L+bEwZnkAi/TlGPTWvxIp5Di/l1as9qM+/A2X17TCJ6
	wxtfB4tpGs9rzkk2cZISo1b4alfw8oexw6UOgHiR2eE5EHPwGImzVu3vrc+azqMY7tmL9DxNaCp
	nIwvY3EkzjTu/7/sOdGBepq4J1yMTcP0b95AI88pgUrO0yOR0QtXUSuHJ+8QN3PUrHEiemlrCkd
	B4VTVRY+5pVO4+6X4sPirt+U7IkmJMAy4ToWc/bBvgwUv/9c1tl+OXPcQp50q36+9YpmkU=
X-Google-Smtp-Source: AGHT+IEZqbBpqYudnSu/2YCLldlxTdtnAnThdn9/gBy1fRNwoJO4d6s4qpYoDQhu1gXS1ZEQ0vOML1k/BQquZzBhr2Q=
X-Received: by 2002:a2e:ab1b:0:b0:37b:9b28:4282 with SMTP id
 38308e7fff4ca-38121561689mr46323171fa.11.1766516945587; Tue, 23 Dec 2025
 11:09:05 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 19:09:04 +0000
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 19:09:04 +0000
From: Benjamin Philip <benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 23 Dec 2025 19:09:04 +0000
X-Gm-Features: AQt7F2pQ_4C63Nv7X5RZR1nrS39XLViR1rP-EzG1a5AdxbHP0FEaTf6TTL78tiU
Message-ID: <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com>
Subject: [PATCH 0/5] platform/x86: think-lmi: Clean up code style
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Benjamin Philip <benjamin.philip495@gmail.com>
Content-Type: text/plain; charset="UTF-8"

This patchset cleans up the code style checks flagged by checkpatch in
think-lmi.c and think-lmi.h. All in all, it fixes 9 different unique checks
across 67 different instances.

Benjamin Philip (5):
  platform/x86: think-lmi: Clean up types in headers
  platform/x86: think-lmi: Remove unnecessary parens
  platform/x86: think-lmi: Clean up misc checks
  platform/x86: think-lmi: Handle 80 and 100 column limit overflows
  platform/x86: think-lmi: Clean up alignment

 drivers/platform/x86/lenovo/think-lmi.c | 160 +++++++++++++-----------
 drivers/platform/x86/lenovo/think-lmi.h |  20 +--
 2 files changed, 95 insertions(+), 85 deletions(-)

-- 
2.52.0
