Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD67383993
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 20:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899669; cv=none; b=uuGXf0Gjjm1G4XcQO4fNpboPReydjbXpwa8qwBZAGStAMkQN4lKodUddq278hOS6d9TkEBZbufqA0vzBZsPPOOVM0Uwh7loMEypxrNBZNIswtOC1jyV9KhrTRfKVIk+YN1HlvMxOdnE5pHqze3FmtWhfStn67VFsggrQ0FeVT0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899669; c=relaxed/simple;
	bh=DMkGKouuzbbi1kd4aKqcu2oLZO+dptA9r8V345aiSyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TeNKGhwNgB4e9R4owjBaFkvQ980e4eH0j8Lx15UUoMsEY0lb34sroXKtCMldaIC7mzCAWw3qWMYa2xQ0vhmyVSRauzGTEd3lov6tm/VfqjGR7UU6ttcuZGORJXPZCql9icf3TZp5XpHBmUsaBaYaaxFzu64W2T3dfTM5eANi9L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGsvuWAA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGsvuWAA"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b8687630fso43362455e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2026 13:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788899666; x=1789504466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=creIK6w/RJsP6wNMNAa45yu25/0nc475hdrmkzg6PX0=;
        b=mGsvuWAAeNj1aa0s0PdCG0frTPbPYjJ/d+N6YJBXnUFFclt4bRBlqI5gOsReBzuzTC
         n1Xd9/Zqc3UicbaQqfQsWSMsmsdniiFjxNFVoyaXx6O7eOsXa6owDBR17AmVkpOO4Fb1
         DG1UDPGi36eopU4Vr5mSTPsUSsGiOhjW1JRsDhC3I4CC8e7bZaBYBJBFy2lVcJIqvVRD
         Z0BAxu4OZ848D3KN2WE4kZcn1c4UMhVVSnfBOZhO/yeiuzPQ4i+dGtEnVlEANaMbTI6e
         qVizB0ZpeRrgiK1ZvZ5373hUsZ9hmKEXXJ5nvp6QTmv+UmkOHyqo5CLBY51pPMs5Xc43
         fUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788899666; x=1789504466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=creIK6w/RJsP6wNMNAa45yu25/0nc475hdrmkzg6PX0=;
        b=YF/P++61s6VUJDk7G7J1e5mBGb5LWmj2N4peNMT8/y/3nyGSFihekYeugaw40mby9x
         Prl78qOU/qZNhGHlNYdHYPSfl+E361ycFwKqp9Qk+eAVAmZSAJLZ07B4LyPWr0jFwPcP
         XmuLxXORneuvNPse0PcwHWZR31UO9+r8nSKhzv4tjashKkU0nzIg2R0WVcCVz22SXSTV
         g/kXxSVqj15zFTV+WVD89sgFst1/zVuCFJdqnFbRuKRXiNwI2E44EjMw3ABnlMS5Jx8d
         zykI/4z4ciV7nfUpEAzOMZApviLSbS9wCkvwOCIEzDbRdnvTqCDz5kZN0Tr/ouvMC18m
         ODbQ==
X-Gm-Message-State: AFuF++kxASR4l7bCnTQdbA1Vwir7fvoNkORNT5b4Y4Dh6qetc4Stt5mF
	mC6nVZFmDw5kYboHAs1fj77yLAmkiQ1mFU4nqs1v7zD33EYIbIOwWQHC
X-Gm-Gg: AYBFou3848oKM9cX0dkIkfpifIXfTky4/WZpfqtQoNc3oN1n7qggom0uRQ6ZZhHReWa
	tiDO+b5JxCxA5Kbi+/3imWzNJB3Zat87ZoBLDEztDuTggT1y+jxGt+IhbL5DXDU9NwfsFdLvxA3
	BhsTgKDC2WQs4XdYcz2FCxFiD9Fy4m7FR5mdAz7pcvgcybYqRnFpJmcz2JR/D28KKcBZM5jSZgJ
	tpP70dcmVU/BqS80gBXGB9Rlw4Bmlvc8ZWQ9tVkCybn8c+U24vhtgrs52mpF8MOz7Sl83rFb+gQ
	fbeYTVL2W5vQwr1/8aYTJko5RHdDj/fSuNCaW8Sstis5Gdl86hpVM8SLZHoetMfhhI55BBS9Krz
	XjFHk8LsTtLksLZgQCd7tYfIYwQ7LoDTHSEjmZ1/s4EQb0IejO17hlIzWyDN5qYykoWWpkGJvJj
	JCD/SnDbr8ogVcaHVVT3EovWpK3V18uHV/bm33J7L+rmepFDLGVV7diw/T7+Ah5+9qqMAhCKxUW
	9NM7qdW7fKU78nKYU2hiELWbYttML3WMFv5poF4dBQi
X-Received: by 2002:a05:600c:8b8c:b0:49c:e3ad:41d3 with SMTP id 5b1f17b1804b1-49cf7f4aea6mr307532965e9.0.1788899665998;
        Tue, 08 Sep 2026 13:34:25 -0700 (PDT)
Received: from arch.home ([2a02:1210:2e28:2800:36a5:7f85:ccb8:1176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf772692dsm491652845e9.10.2026.09.08.13.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 13:34:25 -0700 (PDT)
From: Gabriel Windlin <gawindlin@gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	Gabriel Windlin <gawindlin@gmail.com>
Subject: [PATCH] MAINTAINERS: fix sysfs-platform-ayaneo-ec documentation path
Date: Tue,  8 Sep 2026 22:34:11 +0200
Message-ID: <20260908203412.608606-1-gawindlin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation file for the AYANEO platform EC driver was added as
Documentation/ABI/testing/sysfs-platform-ayaneo-ec, but MAINTAINERS
references it without the '-ec' suffix, causing 'make refcheckdocs'
to report a broken reference.

Update the file entry to point to the correct file name.

Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index da3e42d2d190..4e76c618dede 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4512,7 +4512,7 @@ AYANEO PLATFORM EC DRIVER
 M:	Antheas Kapenekakis <lkml@antheas.dev>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	Documentation/ABI/testing/sysfs-platform-ayaneo
+F:	Documentation/ABI/testing/sysfs-platform-ayaneo-ec
 F:	drivers/platform/x86/ayaneo-ec.c
 
 AZ6007 DVB DRIVER

base-commit: 5acbae5f7eb3d5275120abfe698c394b7325dcec
-- 
2.55.0

