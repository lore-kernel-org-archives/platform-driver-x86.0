Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D0D3AFB19
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 21:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955534; cv=none; b=ZDhyXEKERhb8gO4pqvpsLg3ESDUlqbDfi6/o4Lja+I9UVOJfpFjxLMHDR+8I560B3ZewxbezT9w8f+jeXBWvZFvHfz9xJwF4qsBbb7t3jAojW8zkXnL8L3fDLJ2+RV7WZ8lRWnO6f2oqE/ENx1wD2xj3LFKez9vS0DDOSlLIADA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955534; c=relaxed/simple;
	bh=eQzqq9uDYv3m0MzYAa1UY3TpWPDcZV7AJgS+nzBiO8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KHkFxvpPp24WU5+Sh/f/hMoSJ4by8CuyPgpKTmKJr7HvGJPkHrsVHE8YgwphF8DOoQe0kfYuHDH6cOrIzWDuKcPc4VhDcx/fnJqcA+PGeZqRQixXri6eHBdVRCYzJGOZ3zrla5QF2e3pDhm1NPPSCxhNQCqGnXZFxCB80dGS/SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeL9uHv1; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeL9uHv1"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5178a42caa3so47293711cf.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jun 2026 14:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780955532; x=1781560332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDRbckegdtafLpccuwO/djGUhPXVVh10brzC+bdUfJo=;
        b=JeL9uHv1+163Dw7gHzR7cLiFODiweh12kH8auzzS0GRCLd//x1/Y1stLZbGoqKOvky
         w+vGediBxbkHTcnPpozo7ILVvrWTgdmlwL2LQK0PqJCnEl/GxHX4J5+j255m2yeuKwmz
         n+x2fH+BsfsbzJA+OxTOTH0U6ch3Teo5ZBfnlsZS4phEMtiDAQclMfRn5Fj3w1sAT4HC
         X7Z9w6JeHmECSyc5XFiNj4anlHha2X+fdWzocdrhkSaKIXss7WZXbckUkAFH1ecTKV7E
         opXDI83+tRM8RgX3p9f+C2dvqmEPZjtHe6eCzwAJC1cyl6bOCmm6iYivXnvfSOzE89Wf
         Pchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955532; x=1781560332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NDRbckegdtafLpccuwO/djGUhPXVVh10brzC+bdUfJo=;
        b=LW5dEbr4exnUtaYRcD6PGNQzJyZVElNs627p4dFKDnvk52/nPYFuLgrfOk8UiRbgaJ
         NvypheIELRnFa/0HUliga24dOHnttPBw+zhWmWTXDkU/8GaEs0sflIGopYh1sZYkL0DQ
         6uVR5gi3ac2gUFXg29vMaQzB5sO8b2h2/BBwIEfDLuKZJ+vIpiG4PMdkP4kvjM3gWzl+
         zOe7aPvKTEjA5F/zYIQaQHxWEtx2aY7O1aB9UbePtYykEEY3qjlbUrOVJxf9TGddt1u1
         FtkJOMAMD9bnxKgQ6PpvbY05gLDKiPVyc15wkUs9ZDmxW2CWnRn8UVxjDZCnp3lp2jeT
         3pjA==
X-Gm-Message-State: AOJu0YysIBRFBRlKV7XPYRPqSfUvYetSbnzChqbXI3FemihLqPphdyoN
	VlULCz0pdqtKEo8D1E3673Ngr3p3P4s50jXAEoUWhXzZX4ohkDpNvXeCkCM+4UEa
X-Gm-Gg: Acq92OEf5GmqR3w9gCwIeUpGIi6VWKVjRmpnRx+SIfimebcVmqtvyOxCD/8y3iYc+XN
	GxcsgHQ4/qWW7eCdUdJXPIDJEhHYB8mNyD0O2ggmuDhRZz6A54Kw6O92sKBQrFG5JKuwadlDWbF
	agtZyrsITyWnM4dlyqkq/50UasiQY9JKVJrRl3DS60rC0jbW46YHESu15Ng+cC6fiW7WLtZ1eMG
	sUPbji6Jpiz51tdj4GIfsYNweJlEyJRsGpjm0+030GstwlVN9fqZxNHPlytoFo7KOye2k68xhyQ
	3lZifyE96F2Qc4yb6wgP4EWnpFrWsWLYzz2P2BXVAgjSTf+OoVqxDSf383p99DSgposhQOeZIIn
	/8kk+AI5WDeTcW+ekzcbPCo8s9ZQKWhdn6jshUU7Xi8uiz5aIgIYan5Nc1BhndTQdvw2BK7pWIo
	JNVFw5uOxS8hkyrO9xve0gjDBg5gBhL1edj0IxNKBMnnFKvp1f/dgrJddgA+uisPH6mDEaD9Gbt
	SYUVJ0=
X-Received: by 2002:a05:622a:4c8:b0:517:63df:91a5 with SMTP id d75a77b69052e-517987de912mr189695321cf.19.1780955532328;
        Mon, 08 Jun 2026 14:52:12 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775e27cc7sm165003741cf.29.2026.06.08.14.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:52:11 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: johannes.goede@oss.qualcomm.com,
	mpearson-lenovo@squebb.ca,
	ilpo.jarvinen@linux.intel.com,
	armin.wolf@outlook.de,
	linux-kernel@vger.kernel.org,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v6 0/2] platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver
Date: Mon,  8 Jun 2026 17:52:03 -0400
Message-ID: <20260608215205.678182-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <73c27728-2f07-41c1-82c7-fd6f46c89f3c@oss.qualcomm.com>
References: <73c27728-2f07-41c1-82c7-fd6f46c89f3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds keyboard dock detection for the Lenovo Yoga Book 9
14IAH10 and fixes a pre-existing SW_TABLET_MODE conflict that the new
driver exposes.

Patch 1/2 fixes lenovo-ymc: it registers an input node advertising
SW_TABLET_MODE on the Yoga Book 9, but so does patch 2/2.  Userspace
(GNOME) reads SW_TABLET_MODE at login from every input node that
advertises the capability and does not tolerate two such nodes.  The fix
returns -ENODEV in lenovo-ymc probe() for this hardware; the
ymc_ec_trigger EC write is separately gated by a DMI table that already
excludes this machine, so no other functionality is affected.

Patch 2/2 is the keyboard dock driver, unchanged from v5.

Changes since v5:
- New patch 1/2: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10.
  Identified during v5 review by Hans de Goede.
- Patch 2/2: no code changes; reposted as part of the series.

Dave Carey (2):
  platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
  platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver

 .../testing/sysfs-driver-lenovo-yb9-kbdock    |  19 +
 MAINTAINERS                                   |   7 +
 drivers/platform/x86/lenovo/Kconfig           |  14 +
 drivers/platform/x86/lenovo/Makefile          |   1 +
 drivers/platform/x86/lenovo/yb9-kbdock.c      | 324 ++++++++++++++++++
 drivers/platform/x86/lenovo/ymc.c             |  19 +++++++++++++++++++
 6 files changed, 384 insertions(+)

--
2.54.0
