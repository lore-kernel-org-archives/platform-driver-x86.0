Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5279376465
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 08:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166589; cv=none; b=gxDMo/tCAK3BPxT+2F5UZVoG6R2gDZaGFAYuuiVox4uw8j7QtvwyT74c7BanFOqodKFlHA7PtH7FENBygDf3UQQfFw+ed/uWy1qNYj4O23IPJSnftR6w0XDHJZBHpbmzCjE/Y6SWCXD+YceOcUPJAGEORPtFNWYLP9TxxzrqejI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166589; c=relaxed/simple;
	bh=u2bZmX5CEe7b0ApGPOYgthwGUuq3BT1iXipqJePfIwo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D+jK7cpLwnqEHUijLUiS8fBZif0a6Q956dH06/aC13mr7nOdwhBhcuBM9qDZqrZY4LRrBUSd6R0rbPybeXdBYImp7uT647ezWJHruJ/CYL8lcCSCBjiNk7vryuqky9tYnl0KSin43hC48WiUljZJk3YG4KzVRMMwA1M2IER6JrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjvcjP8r; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjvcjP8r"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bebc80100efso822249366b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 01:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781166587; x=1781771387; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w1bwl+Rf2wgwD8E1im0dFQatX+ZK5ncUsiZSp7tq6AU=;
        b=GjvcjP8rDpfP6QeeT0rsyJHK0yzhD4yqWfdV1EwZw6slXdkbXzbn3YwYqJBHDD+Y2A
         V1dV5k2/Ps/Rdia/h6P5f8pfDD2EUmfAjMyJWWcdBn/7NKqke1hlv/wqGkotfLL7NTdP
         sr1lHdORTu04P5Gtd2fxIro4ZFFmaQXXNoHyyN8NxISelGyZ/CFFTCBXiZw1jZs4Jz+R
         8X5qKd4jm8fQWkSWmA3RDeGYcwnHJQ9ThxUiJ4NIoleBmZnURDO/gDJJmWtHVjFbsdkR
         6GcNc0NuvI9bru9MHmOwBIANVq+JhK5hNHBPU1v9bwMd3p8H7Gy5BJyXoYGhTHNzz+5M
         RRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781166587; x=1781771387;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1bwl+Rf2wgwD8E1im0dFQatX+ZK5ncUsiZSp7tq6AU=;
        b=FhMMovy/s8VBRKKZt7I7HSDno+q1VHyf3/ipWPATg4kO4+7H4PdcqcszbdKbCGIXhM
         sJmtC859UBX8kXYIXyySspaQpaF8+rqm5N4ZhoaBdhCmXtX4N0hGcQblh/hxQBwDiCnf
         kZ+Alk/Wp2m6vv/N57hNu7WW4C9mwlC6ukjRC0TX5xonsIIyJdbC1nqUavwgzVeOgCPw
         NS0QWZngEGz4mFQ8d2z/Jwwz4oYKWXyrPspBTj3N7yJcRDlMvXPkYk63VFJ/F8o9lb9i
         1EBTmuQ+ylOkbcPjh1cxul42CTHCYw7BJyCINQmGleR3n+ie9nsG0YMEnJ3n9u4n+ZSi
         hrpw==
X-Gm-Message-State: AOJu0YwLPFBazVHocRGhcyjN7v7kpcmSmcAf5Ix+78OMOESl0oN13gt+
	SCMUhfOJ1Cl5T86sQg4EB7sQPTAM93FcvFxkL4iaCWszDgdAlJ/pE3gL
X-Gm-Gg: Acq92OEpZAsCpZMo9fyE3sC8Q0uxM0dDVly2y/xdVCKSYVmQue/Wdf00Osxl3yy/pQA
	snUZ35ADhW3/zzd8B3yyIatfXibK1wUID7d5q4RwqglIvoCOLzAHchxyk7lkqETUMpWz40nArgc
	zxJ/TuAGrEGV1uaITTF+BuC5Lh8xtYJYrOx7D8G0z/A6PK0Ipqy93tyAmQHpacvDsFL89J2TWCN
	tO9S/T/1wALkohn1wqLbQBswvlKV3qO/o1YU2vLJB+PTrfWziZEnBwmYNJ94rtMwMv5SzLJnoWd
	D4aomtJkymfENwU306BEg2o1KCPbrHB0PaUEag1VCF5ebKeUIjhECNvM0CV9Qs/6kAVdB5tXjm6
	f54/u9/QYLcFkSb2HQptWABCRrvT+sRo611KnuPu42h87J9qUZUcs4p6Ha0j+ErTkdh1vax9shC
	T++3OkwIUQ4SPi25MNvtarvAPJ9qf6
X-Received: by 2002:a17:906:d555:b0:beb:362b:69f8 with SMTP id a640c23a62f3a-bfc887036d8mr87162566b.41.1781166586837;
        Thu, 11 Jun 2026 01:29:46 -0700 (PDT)
Received: from [127.0.1.1] ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb60b771bsm27347866b.54.2026.06.11.01.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:29:46 -0700 (PDT)
From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v3 0/2] x86-android-tablets: Add sound and haptics support
 for Lenovo YB1-X9*
Date: Thu, 11 Jun 2026 11:29:34 +0300
Message-Id: <20260611-x86-tablets-yogabook-v3-0-de407672e4df@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO5xKmoC/22PQQ6CMBBFr0K6dkw7lYKuvIdxUeoAVaHaVoIx3
 N2KJrpw+TP57795sEDeUmCb7ME8DTZY16cgFxkzre4bAntImSFHxSUXMJYKoq7OFAPcXaMr506
 galrlShpTrZGl6sVTbccZu9unXHvXQWw96S8MRYFSKlEuhcRVnnMQcKRT6/y26bQ9L43rPixP1
 1syi28gq3QgSNfOxk3W0xhhBirB2WustSE6f59fGnBufOzxv/2AwCHVC1UecrOm4kdgP03TEyl
 ZfQUlAQAA
X-Change-ID: 20260301-x86-tablets-yogabook-6fe4563ccb92
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yauhen Kharuzhy <jekhor@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781166585; l=1758;
 i=jekhor@gmail.com; s=20260301; h=from:subject:message-id;
 bh=u2bZmX5CEe7b0ApGPOYgthwGUuq3BT1iXipqJePfIwo=;
 b=YvVMmmwkrcGv/NaWDsbMel7iu0Nyikf8vEga1x5bXDT82dNYzGbSJY6HcwJcW6sFBw70ccpR1
 Q1S8zMAY3T3B0jDfEZrBG5yVvT+uQavCwKolWn2ZBaytdV+8RFTIsa2
X-Developer-Key: i=jekhor@gmail.com; a=ed25519;
 pk=C/csaZJs7UBNDgeJcUAmPu4ntqNeaZ3BKfBQiH8tuGc=

Defines I2C board info and properties for the DRV2604L haptics driver used in
Lenovo Yoga Book YB1-X90/X91 tablets.

Defines sound devices for both models: rt5677 codec and TS3A227E jack
detection IC. Machine sound driver is implemented in [1].

To simplify the sound driver, the same set of properties is used for both
the X91 and X90 versions. For X91, software nodes with such properties are
attached to the ACPI nodes.

Changes in v2:
- Use cleanup functions instead of goto's in lenovo_yb1_x91_init();
- Adjust ts3a227e settings: MICBIAS voltage and jack insertion
  debounce timeout, to prevent fake keypresses.

Changes in v3:
- Declarations of variables using cleanup functions have been moved from
  the start of the function to the assignment.
- Link to v2: https://lore.kernel.org/r/20260302-x86-tablets-yogabook-v2-0-061768d5c9e7@gmail.com

1. https://lore.kernel.org/linux-sound/20260611-asoc-yogabook-v2-v3-0-3128447b67b6@gmail.com/

Yauhen Kharuzhy (2):
  platform: x86-android-tablets: lenovo: Add Yoga Book haptics entries
  platform: x86-android-tablets: lenovo: Add Yoga Book YB1 sound card
    info

 .../platform/x86/x86-android-tablets/lenovo.c | 223 ++++++++++++++++++
 1 file changed, 223 insertions(+)

base-commit: next-20260227

--
2.51.0

---
Yauhen Kharuzhy (2):
      platform: x86-android-tablets: lenovo: Add Yoga Book haptics entries
      platform: x86-android-tablets: lenovo: Add Yoga Book YB1 sound card info

 drivers/platform/x86/x86-android-tablets/lenovo.c | 224 ++++++++++++++++++++++
 1 file changed, 224 insertions(+)
---
base-commit: e3b58e24c60351eaa02813cfc7ca110fb68144c5
change-id: 20260301-x86-tablets-yogabook-6fe4563ccb92

Best regards,
-- 
Yauhen Kharuzhy

