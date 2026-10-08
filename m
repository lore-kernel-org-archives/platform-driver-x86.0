Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831EA4DAFA5
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 15:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473406; cv=none; b=W78Fm36+jis8kvv++36J8PEIS2jSoVYKhyFRAeKd/PrJq1v4nS82r+dpoxRlwKwJ5wo3PnYDj2qXsdfiljssf1MMNwOfH4wFiF7B2dFK/+OYBnyRb04zqdS7qpFIV85EuBVsFlL5nxoa02n6S2Bgt8M3ZlAJDhMHL0cBq8l0XDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473406; c=relaxed/simple;
	bh=gCz2PWtG7KBVwKQQRm3tT99d6VUdlqWJU1achyn5LUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=owc7h6Ut2T+9vOGmGbRHQKqobuIs/4trGbgVBrtJAfbW1Jz+Q0I7XqaPiAKjwolKMpWw3IkRTim00KVvbh/Qxz5HFmOuV8Q8H0SOzucZb6tA8hyyrE21rB3VTTm2T4U465o+eusHnhQrX7c9K0QsyM7mtbCoaHvMJUGFGY6BKHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0p/j1+Z; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0p/j1+Z"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5ba3b1199f6so3162565e87.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Oct 2026 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791473398; x=1792078198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCz2PWtG7KBVwKQQRm3tT99d6VUdlqWJU1achyn5LUY=;
        b=B0p/j1+ZbjvDgOjLrVcRhUa2rrgEqU0fsRi/GHc1GEf16tv+dCPoXScmv0duQ/ulBW
         JGFE+f9gnbrWI+ar17KWRjiOEVI88sQAuWRSuaLYhAHPSgF18pfU13fyPRd5vROEe/v4
         DxSh1G/CMhHdYOPGf8r9z8OhfXSY3Qhljqqv2Ip34hYx3NeHQcyX7ksyGBMusqxj3cy9
         6uTcdASsxp/WLHbOOAXbXsMeipeVeNICLE49Fq68EF0TlK2XBfxdwvp5c1l5E1RDLhya
         DeMt81Lc0FUkw7P92+JXIKZonroRzg+2BWxnt+H+bj92nM9heHXIcAZrudOz3MF4ITA/
         mZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473398; x=1792078198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCz2PWtG7KBVwKQQRm3tT99d6VUdlqWJU1achyn5LUY=;
        b=rZc+qGZGPqjmPRqovQjp0T9ZL58hEeiS5bmx707mG0Ovej0+8LSveIa3Qn+fKwEoC4
         lt4ikIS8Nj/4rV+tmSdEjiiYQfjbKvgugSpVpivpvwlnV5Z0IEQrcQwxLccgZLgm7HCI
         TLidLNazQ4fbbG8wpy80SGfgbESY1e4mFZgIxX09+tO7PDAIa42MBzMrBk/kRWmgJx9H
         ckteXmQvPrdl+A42qKSNH8JUKuH2eWJxsT9Dt9nElLgszNA4CrupHaYiTeSo//J0xENx
         EIJkrErwbZ0kGCtrfg4BtJkVWnIN9X1nDdyOQ2/BxmmU2LoRddNf2F0E2Yq2iIpODHC/
         7D+Q==
X-Gm-Message-State: AFq9FYLqg72NNH5FQDrFgR9UfAXtxj+XW8k0bcSnRXW/jcZkj8WzKtqo
	djlonWfnCzklKeex52oqLxtryut/1SzF7LNEohmP5PyoUXx2TZOzuW5V
X-Gm-Gg: AYBFou0w+vCapf/P8eWme8/WFS2YuaPpHVbsIlJLFMpFNITwvWcZFjKvHZcT/tAHgmU
	EScJ3Vf28gwyRRgGA1QfDuJPpKYMAwnup6Hi/GGUuSYIlMhHFLS6vRaONxcqWd9t/0yQyPBmC0R
	F7rsigguLCQTygOzoNzSqtVq+FZ997oIljcjI41+lkU/o1uC7XsUznJK1OAqw72DL7i2/hPkuI6
	n3Y6gOp9sxDYPgqkAJP4qBPJyfYG/fLngEfndvk6K+EasRlXbN2Hmo7XWjk/3NDGNMUAiim21tt
	HN68/+pkG8BDFXkN4LeETPPgVnkPj/+jfw89Ud16VI/CDE2aJX5MQNaJxXzCqd/igLPJZQZqw/B
	C9c2q6GEWa5gB1ccQ34gBuOY9SmIL6wSQedIlKt93tUtUv2z7ec6eTk1ueRv4x2sQwxfaDDWJMz
	wjitloqUMDpPhvfTTfdbEdQwovkuwigw13kv/xn+NLO8/dEnFcKUvuiOZnblGZzqwqx/PdRke4S
	digCGwW5Lthht1aIX4tCdU0cl5sOPIYYelkLpjSWO7y24V0Ww68qgDdSzQMGBquxEf6
X-Received: by 2002:a05:6512:3b9a:b0:5b6:183b:d203 with SMTP id 2adb3069b0e04-5bcd0716838mr2243596e87.42.1791473397961;
        Thu, 08 Oct 2026 08:29:57 -0700 (PDT)
Received: from wildarch.lan ([109.72.228.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3074ac2sm1383620e87.29.2026.10.08.08.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:29:57 -0700 (PDT)
From: Anton Karasev <uselessfire@gmail.com>
To: zsanya322@gmail.com
Cc: platform-driver-x86@vger.kernel.org,
	qby140326@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de,
	vlku.milos.fun@gmail.com,
	chris@miget.com,
	nika@nikableh.moe,
	martiya.ar@gmail.com
Subject: Re: [RFC] bitland-mifs-wmi: optional Fullspeed and four distinct modes on RedmiBook Pro 16 2024 (TM2309)
Date: Thu,  8 Oct 2026 18:29:56 +0300
Message-ID: <20261008152956.1513547-1-uselessfire@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAFpZVRM_A9K+6-eFy_zfC-8gE+3r7pcdhgU+3M3g_XdQ_SJdiw@mail.gmail.com>
References: <CAFpZVRM_A9K+6-eFy_zfC-8gE+3r7pcdhgU+3M3g_XdQ_SJdiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Aleksandr,

I have the same machine (TM2309, BIOS RMAMT6B0P0B0B), and your values
match mine: quiet 2, balanced 1, Turbo 3 and full speed 4, with odvp1
2, 0, 1 and 4 [1]. Milos found the same on the TM2307, which is built
on the same platform and BIOS family [2], and tested four distinct
profiles there [3]. The Turbo and full speed PL1 values you saw (75 and
90 W) are the AC maximums of the GDDV targets here as well.

As for the status: Ilpo asked that per-model entries be based on the
generalized profile handling Chris is preparing, not on the ops table
in Mingyou's v6-v9 patch 5 [4]. That series has not been posted yet. An
entry for the TM2307 and TM2309 would go on top of it, and I will Cc
you; a test on another TM2309 would help.

On full speed: the firmware accepts mode 4 on AC and on battery without
any check, but Fn+K never offers it on this model, even with the stock
140 W charger. As I wrote to Milos [5], I would suggest performance =
Turbo for the entry, since power-profiles-daemon maps its "performance"
profile to platform_profile "performance", and full speed as max-power,
which platform_profile_cycle() skips, so it is used only when chosen
explicitly -- which matches what you asked for. power-profiles-daemon
neither selects max-power nor recognises it yet (it keeps showing the
previous profile), so for now it would be chosen by writing
/sys/firmware/acpi/platform_profile directly. Whether max-power is the
right place for it is up to the maintainers.

One more thing for this model: please do not write to the kb_mode
attribute. On this firmware command 0x10 is the battery interface, and
writing "fixed" turns off the battery charge limit [1]. The patch that
hides kb_mode there is [6]; a test on your TM2309 would help. The
charge limit itself is the subject of a separate thread [7].

[1] https://lore.kernel.org/all/20260930015058.3076905-1-uselessfire@gmail.com/
[2] https://lore.kernel.org/all/CAObHBTwnv+kEaFdCp+cr31HtdSo3CaRq84T8vr-Pm75yZMTHqQ@mail.gmail.com/
[3] https://lore.kernel.org/all/CAObHBTxHQDfVH8Su1DLABtC5uUsAGBBk=KvcCOvtTs5gMGamnA@mail.gmail.com/
[4] https://lore.kernel.org/all/094577b3-7b96-72b6-4ef2-a5d1db457401@linux.intel.com/
[5] https://lore.kernel.org/all/20261008-tm2307-tm2309-entry-uselessfire@gmail.com/
[6] https://lore.kernel.org/all/20261008-bitland-kb-mode-v1-uselessfire@gmail.com/
[7] https://lore.kernel.org/all/20261008-xiaomi-charge-limit-0x10-uselessfire@gmail.com/

Thanks,
Anton Karasev
