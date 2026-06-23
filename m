Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3AB24DD15
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 12:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219565; cv=none; b=AQyIzBwAZrNJn1b8Y2Zc0PVTVk8P9xOeIynwJoww7C8Jo0lxk2yKDYKkulmMOncrD9WFENlBIanOEYqwrSjG56qewT4/sqYtaNIrgW24n31ET6VK00+NuJS4/PhZkkGOK2lREbYMI+KpF8l/rnXwNKbEmC8ghzHKE+6/YXVqwY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219565; c=relaxed/simple;
	bh=RvbJ8GxBh7mrEwaLUU17jkbUEqxMkpz6qv5/oRXYrpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SyXQDP1PHYNxQuGylCgkrTKei2luWS2YWdAkMDxNon+A+uSSsigxHDt+wFbId9/k+pfRhU2XzugMxO8o4GWky8UjxaLd8xSHFlqAKyebaMXeyuWkx/szKe+iWJ0w51+AZwS6qgSGYNJceB1Sns74P5NI3yXunTZRv931PUx75Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pHv+ozQb; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pHv+ozQb"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8dc09919aa2so91948406d6.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 05:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782219563; x=1782824363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Al39rJAepQWQFF6sNpFtMXISMc+stI8B2tRAUYPUJk=;
        b=pHv+ozQbDpZt4XdMfsGEGKqh6Q/8sYvrk28ZIBHoc1zkw4Xs3ey7Wq7lkD2Jw3gvKF
         tNobbDR09IiE4ijgf3KBbzepfrJYPuCevNpQrNbULKoiPP6l1TzkItenmlzGijSDOW+G
         2Uue8pSGELh9ylLkTwTKbg/wI/VPBuU0TcIqwH0utpG/uel5fYa36kK9YXaGN4pK6UGf
         wnVPNZNi/qXf5rKZ5w0AdywMoROstnyc8dToRiVBlar1mQ6lWtD5reShr4obnmeRqypS
         L/IywPauvng9uojvJqJGXSqRYcjr/XPedvoBgT7i5T3R+UCZeQfQHLbpLPNlUXLfn1zr
         Eb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219563; x=1782824363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Al39rJAepQWQFF6sNpFtMXISMc+stI8B2tRAUYPUJk=;
        b=nBvsBKjafkNdQDHzTXa2W0CzwIqOOiVSVhPZznd5sljcIwb1rnG/JFvff3wcovXSnJ
         6DNzM2qWrOey6nU9nr81KL65/gY5UJ8uxi+1hPaem8atNrTv9boZVXt2mC3059YafAav
         paikzN9QFgZacg2IQvS3xzGJjrOWH6VrCq7cUasa365o6Bm8GdwRpLS69sK2S3kw3JtE
         +PKhcVeDve0Z1XKzvYgDjGMUIJUSJbMPkYJ/6FUXAap3zN3DMmrkVyAlkkXxAr9DJ4Ys
         1W4/1hpxPeNmJPsWv2qUtetATw5DTAmyuw07iUOApUQp43z2mIrwoheOoTasVzSXGFKz
         vAUA==
X-Gm-Message-State: AOJu0YwmHDDUG3cL1ngHKK8j7E/476UKpN88QeIJu+repmcWDDW1JvEO
	tSV2n121NO02zhgacMWrAu6tAhtF7LUgJQqdxzC5MaF4ZpMwjP3+Z/HwtDPw7jV9
X-Gm-Gg: AfdE7cn8q0jxkW8eQhp0XU4RsRlMCGYtd2R3p36WIaf84iSgnFs+w2PmzI61uX7S+ob
	HbAwR413EHdW14RjJbv/WXtJW7C706F12LH/zLzX9K9qx41LGni56wricvMZX66GMcspu8afssU
	G8KyW1IfC70SDARVd38v+OXE60ZsW/Aj/b6TN3Fj7Zi09H/p3WohhGWtLxizWPspcHDW9SFAXYG
	3ibCZBDbWIxnxtFCuN56w0xgyGBNKQulg9SLrlpLv/X7KrVDREL7jj/obbjYrrhFmFA+JapsZ5t
	+iSFtc8pMsXrzfexoFLKdjVS5rlSmQV1CeXKRl0VVy32c+Rnz6u2r3uOU8KSLnx7/VxwU7AoySh
	msIwo8r1A3q2SiMJ9qO3AjLlIHv0VcsTU8BYmk70toInNqHvVP4b0aLIIZUcn1HxCRsw5EGwtKB
	89u8JK0D0uoDkDIK9coJxzhMWGBbGxsNERha/TnzJHA81VztCGpfVmc0+3Rg==
X-Received: by 2002:ad4:5c4d:0:b0:8c9:c38a:20e1 with SMTP id 6a1803df08f44-8e433dce1b7mr35117306d6.10.1782219562933;
        Tue, 23 Jun 2026 05:59:22 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f01855bsm141447576d6.9.2026.06.23.05.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:59:22 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: W_Armin@gmx.de,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	johannes.goede@oss.qualcomm.com,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v11 0/2] platform/x86/lenovo: Yoga Book 9 keyboard dock detection
Date: Tue, 23 Jun 2026 08:59:12 -0400
Message-ID: <20260623125914.833063-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <8f84ca57-b856-4da0-8d90-e2be414f8997@gmx.de>
References: <8f84ca57-b856-4da0-8d90-e2be414f8997@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Armin,

Thanks for the v10 review.  One-line fix in v11:

  - ABI doc: correct Date to "June 2027" and KernelVersion to "7.3";
    these fields should reflect when the ABI lands in the kernel, not
    the submission date (Armin Wolf).

Armin's Reviewed-by tag has been added to patch 2/2.

Patch 1/2 (lenovo-ymc) is unchanged from v10.

Tested on Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 7.0.

Dave Carey (2):
  platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
  platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver

 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock |  19 ++
 MAINTAINERS                                                |   7 +
 drivers/platform/x86/lenovo/Kconfig                       |  14 +
 drivers/platform/x86/lenovo/Makefile                      |   1 +
 drivers/platform/x86/lenovo/yb9-kbdock.c                  | 310 ++++++++++++++++++
 drivers/platform/x86/lenovo/ymc.c                         |  19 ++
 6 files changed, 370 insertions(+)

--
2.54.0
