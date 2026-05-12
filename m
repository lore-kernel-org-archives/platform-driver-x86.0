Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD103BD629
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 20:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778618050; cv=none; b=MR8yYa8vMApJH+Eh9vugO5R+sCGdjG3W6OGcdhme8Vnb6xu04ZyijI5qzTsdSvG1O69cjMfbGleFZJAK7Y1Y/zAbULbcn13YDyKpSqxza16T+GTLnzFoKf21FdcMCYA+bgEWMRnMuG/sKfxj0J0x99gbLZ8dpyEFGMmDIRddTIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778618050; c=relaxed/simple;
	bh=sLYdoH+ikBPek1Y9oRdPKY5vIXj9bR+aaoJWLwG6i3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mad5sw+E2WhAHZiWPS0GFYqLbTXryiOADzI7LIqYESRxYyDbACFyXiwYjwRcDD2CLhRm4fhOcmFzZzzOocTy8inIxIkHGVj9RAvNfV99yOjYF0tgC+QkP+1kqxyYLJBY1eoR6wulxJB6yoSXAar15mN/njwwB4iocqUbYTmBnH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=QnyaG/Kf; arc=none smtp.client-ip=84.16.66.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="QnyaG/Kf"
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gFSms2VTqzxjV
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 22:26:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1778617613;
	bh=qFLQ/rk97nAJZYTRi4bf//PzjPAjFJ9fB1dzb/z/WQo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QnyaG/Kfg0twGZ1y/fecaSCjaashZWhyeZ0kmQ9JWdzQt49IT4PUKDy3Kt9nE2y6A
	 Gd87kkP9Q3Y1cUrPgTmaDjQNUELPyIrNMJplDW7XYjXkRlkiC2pmguIEQyCmcEEy4w
	 dtsdJzrwskRzs/gCSpqfVFjs3YFVGD2Rjf950OuIFgCksu4YrVXmMc7VmzRtYBMWEN
	 eU2yG6sS4+qLn3VNr7wSSAfoh/qrH1RWrjwp67lhBt+eWAl3GaHmhwVFkwxZ3wzIht
	 nxtJm4wZwiNj0S2UxltDKKcgu8e1DnzFGqIZ8HVGlZkxvw2O/sErOAMNWDp6zsUSJO
	 dQssC1VVY8iNg==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gFSmr6wNSzty7
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 22:26:52 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Tue, 12 May 2026 22:26:52 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>
Cc: Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH v3 5/5] Documentation/arch/x86/amd-debugging: Add section about delay_suspend
Date: Tue, 12 May 2026 22:26:45 +0200
Message-ID: <20260512202645.1549111-6-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260512202645.1549111-1-daniel@gibson.sh>
References: <20260512202645.1549111-1-daniel@gibson.sh>
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

