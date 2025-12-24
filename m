Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2D723AB95
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 19:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766605254; cv=none; b=D/YX9QtsBJFIXDBczFG3bPGWbOYjR8utzVuM72DaMqQAvugQKpDidrSmosAN9z76itVsggE/HKvIrTUi7zD0HY1gJdzK24iOwGt+jJ7JehuUN9pve2WX3mc7W34vURQSesp2/v20ZzdIjT/1VesDb/d9SQv0pWC/dFQ3HG2q+Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766605254; c=relaxed/simple;
	bh=cCsMkg6gk0H/WiRRHeGVFKK7Is70QA8HraLLgTREAFk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=orYt/svsb0vAvJGhzW1ESjubkEJNytaYKXQZDbOnAwlhYUs1A7u9pS8fD5uRTRSr+SnbHAKIdrWYHxxtKkaTCGXUPLsscNtyBQwuii5hysU1LEG6JX/8PdNoxOqnrbEHwP61q449/FD0HInLbhU94IygKabarvvuq4Q8V+HWIoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXSYjSOu; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXSYjSOu"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78d6a3c3b77so71124337b3.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 11:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766605251; x=1767210051; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cCsMkg6gk0H/WiRRHeGVFKK7Is70QA8HraLLgTREAFk=;
        b=hXSYjSOuifkXQTtSU4FSa5cHVBMJzl5FzkKCCbp0K6BwWjXfvmtytGLzIAcsxogsIA
         bw2MijQIeyO9+rbfsBnocE4PPu90eAKtPE2DkI9nZCLrOE/ZWg6lIiAx43FWP8zewFsn
         N+HgOs6D05hNurvRKYQNQDI65eIJSjd9FpMT5qtPgxFZi1y8TVnybvX6zAJ9whgMv/bs
         ddyy8azW0oPJBhrXXGFzAYhTXl1KKsyGXQHVFifkOcZCk5NdpLgdXQabC42Z54W/U0Rg
         C353CXUb5IFb2Y374dR5k7AoxUzrO2ChHkrPs92N1jH6M4zmgkR008VCDMy5XonscqvU
         8/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766605251; x=1767210051;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCsMkg6gk0H/WiRRHeGVFKK7Is70QA8HraLLgTREAFk=;
        b=NejMITybOfv/sXkg4gzm91w455OQI+Y/v1LFgcUpxKl5GykjGdHPr2aPEd1j4CuUDT
         2ghEEj5S2Jbs/Q0IhDMzeQ9nzwuYJCzys1VYBgUhl0xOFlyejB99Eof9DA39IJJKcWi8
         mgvkfYx1MNlHKzYz+k2HwSL8QMwl32GcGOEGBLHUDVS4LZc9SpmYPEoeKQvvST+UNBO4
         uxbs0Spk7LabW4hrLxlaIWhbDgfhQIkrIEJ8Pj6Wio7DqntHJHutLyD1piKPauIE3cZf
         LwMTdH2vnoO3223DsI/eJJkZiEKShdHaEbvibi/BGpelxVPjh+lVwwwleM36gy10gBs/
         4+mA==
X-Gm-Message-State: AOJu0YwE79Q9PfQDTiWQVjGvAfqqzIKVl0Se7bROSsNh2q0z7SGv8iaI
	GPhWlRI5WXT3jGBqyEkRf4c/PMnjiuLPrlYRE7k5qJaNtX+9HU4Xzv52dHzv3ESDbbYrRN/klna
	l5QbQP7ozP+frVf8wfKo+mlIgmO9MOgHuOg==
X-Gm-Gg: AY/fxX7VGBe5hHWvE5myxn34EPOrb9gpDufXV2UAxVe/708Z7n0pKC66u54sv9mLst2
	mk/6SfyYZlW/WGkkdV5D0uEtBYiTpGEcK47FQDG8rc5WoV3wx3ONO7H52xnb6IPcFAoq68GGpQ9
	ZHWsAr3pT/q8eynKJVAEP1T3M1xmLr6N/EV5IwZUQXx4574Gh0crNAR4PIsa6WHvLbgQDCpPNZC
	ZGEFx4r72Tjm8mX2tjfKQzHoPj8vidwLHOLeOOBLrjKaLLT3jfAa8JpySx8EjuRufPQCRpf7gdW
	Sy7iz47h3thYK4VYSDyI4acSSMmd
X-Google-Smtp-Source: AGHT+IGiSbFEtb8MErquB8X52eVk/aIHJmX60YG3g9AXxkxlLKlSrkpdxuApJhNtYxip5ve+ZpFJXjuHH2yLUXhlGgw=
X-Received: by 2002:a05:690e:12ce:b0:646:8ae1:f92a with SMTP id
 956f58d0204a3-6468ae1fa90mr6220151d50.47.1766605251470; Wed, 24 Dec 2025
 11:40:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Pranay <pranaypawarofficial@gmail.com>
Date: Thu, 25 Dec 2025 01:10:40 +0530
X-Gm-Features: AQt7F2q1tGLhMYJsLL46xJrUBdElq-xHKLCtvobEEuUoiq04V47TuI0-zoB9uF4
Message-ID: <CACy5qBaFv_L5y_nGJU_3pd3CXbFZrUAE18y5Fc-hnAmrd8bSLA@mail.gmail.com>
Subject: platform/x86: acer-wmi: Missing max fan speed (7000+ RPM) on Acer
 Nitro AN515-58
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Maintainers,

I am reporting a limitation in the acer-wmi driver regarding fan speed
control on the Acer Nitro AN515-58.

The Issue: On Windows, enabling "Performance" mode via NitroSense
ramps the fans up to 7000+ RPM. On Linux, selecting the "Performance"
platform profile boosts the CPU power correctly, but the fans remain
capped at maximum 3500-4000 RPM.

Observation: This laptop model lacks a physical "Turbo" button. though
there is a nitrosense button which is useless in linux.

I am requesting that support be added to fix the maximum fan speed state issue.

Best regards,

bugaddr
