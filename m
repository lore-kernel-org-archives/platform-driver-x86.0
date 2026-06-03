Received: from smtp-8faf.mail.infomaniak.ch (smtp-8faf.mail.infomaniak.ch [83.166.143.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C353EDE43
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 03:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456611; cv=none; b=DaifvUCZN9Si3nDpJDwNP1Ci9ms0xaKisoRMj7tMIR1/7w3Ezg8qXE6Juy9RhbeM4eWn/iHWd9y0MKTXfloS4wIQfoASnp4Wykom+0x4aSqWAX1jWl0NpmKePuyiKJvpFp4yKXPD9r2UqB2vW9NI3wzgE0X+K5yvSBhpAHD6U94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456611; c=relaxed/simple;
	bh=sLYdoH+ikBPek1Y9oRdPKY5vIXj9bR+aaoJWLwG6i3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oB1Y31uWzKyZDJ+2/GoriWZY8P4Nsd4C8VcG0jlNQ4r0GsC0OijY8BnwUquRpjssrvfzfxaopVOIPMRiLqdittDyttum3pKBmRMw9P6V4hFTT/EFatqse/qMiwvZZB0Ldat2hsjF3fXbiD1AggGyvPEoMb0eD+e+sGY3Ps/RZGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=BcyxOqw8; arc=none smtp.client-ip=83.166.143.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="BcyxOqw8"
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gVXlr6bTYz13GH
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 05:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1780456280;
	bh=qFLQ/rk97nAJZYTRi4bf//PzjPAjFJ9fB1dzb/z/WQo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BcyxOqw8PHmU3fQLwzhqQ5YZBy6WMWPHsmYZ6VYo7V4fPz354wEhmZCU+pxGQsxmL
	 u79d5a9qXdn8t1OLjQEiT3ittwmmNO1ln4ZYOnbReP0YKF7UoBKXybwIPbioY/P0ZW
	 Kjdp3DfWannbh0p7wBSEAnCMe/My/8diLADGg6htDNPvPfM59HtFUIwZq5U+QlysUZ
	 RppmaKNEaOx1DrcDuhvMOoEftPbtq1NMONskb0r9SP6F42MFWvKDlEuUbjkQaglior
	 aD0He8S/qnusEO8V5fRokrqgnX87gA4/cBeZi3tGT7yTqxAOwHp93ca1ueu6eVPWW/
	 sxdK8fK9ezN1A==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gVXlr2jlVzYGY
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 05:11:20 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Wed, 03 Jun 2026 05:11:19 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>
Cc: Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH v3 RESEND 5/5] Documentation/arch/x86/amd-debugging: Add section about delay_suspend
Date: Wed,  3 Jun 2026 05:11:10 +0200
Message-ID: <20260603031110.345815-6-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260603031110.345815-1-daniel@gibson.sh>
References: <20260603031110.345815-1-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Some Lenovo IdeaPad Slim 3 devices and similar with AMD CPUs (so far
observed with Zen3 and Zen3+ CPUs) have a nonfunctional keyboard and lid
switch after s2idle.

It helps to delay suspend by 2.5 seconds so the EC has some time
to do whatever it needs to get done before suspend.

Devices known to be affected are matched automatically, others can enforce
the delay with a amd_pmc module parameter.

This is now documented in amd-debugging.rst

FIXME: must be updated with the actual commit IDs when they are merged

Signed-off-by: Daniel Gibson <daniel@gibson.sh>
---
 Documentation/arch/x86/amd-debugging.rst | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/arch/x86/amd-debugging.rst
index 3176a1240fee..6aca4e993f12 100644
--- a/Documentation/arch/x86/amd-debugging.rst
+++ b/Documentation/arch/x86/amd-debugging.rst
@@ -249,6 +249,31 @@ state entry.
 
 `commit 40b8c14936bd2 ("drm/amd/display: Disable unneeded hpd interrupts during dm_init") <https://git.kernel.org/torvalds/c/40b8c14936bd2>`_
 
+Keyboard and Lid Switch stop working after resume
+-------------------------------------------------
+On various variants of the Lenovo IdeaPad Slim 3 with Barcelo and Rembrandt CPUs
+the lid switch and keyboard, or at least the Fn/Multimedia keys, stopped working
+after resume, until the next reboot.
+
+This was caused by buggy firmware having timing probles, the EC needed some idle
+time right before the CPU cores are suspended, or it got into an inconsistent state.
+
+For laptops that are known to be affected this workaround is enabled
+automatically, to test this workaround on other machines you can set the
+``delay_suspend`` parameter of the ``amd_pmc`` module.
+
+If you need to set the ``delay_suspend`` parameter to fix your machine, please
+report this at platform-driver-x86@vger.kernel.org for it to be added to the
+list of devices that need this workaround, so in future kernel versions it's
+enabled automatically.
+
+Note that the current workaround isn't perfect: On some devices the problems
+still happen if resume is triggered by a timer (wakealarm).
+
+`commit TODO ("platform/x86/amd/pmc: Delay suspend for some Lenovo Laptops") <https://git.kernel.org/torvalds/c/TODO>`_
+
+`commit TODO ("platform/x86/amd/pmc: Add delay_suspend module parameter") <https://git.kernel.org/torvalds/c/TODO>`_
+
 Runtime power consumption issues
 ================================
 
-- 
2.48.1

