Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5623B7749;
	Wed, 26 Aug 2026 08:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787731937; cv=none; b=fghi419q/ka3DlzQzObDZnUIS0bmq3d5cYJxmsAdDlwVDCK4qXbNyIXv09/26WodhLGubQB5HLXhZ6eC4QEHIkYNbEHefNAylYcoxCk0X5Ze2XGrV7QW+3EIvb0mK4aRn6GdR6PuBv2jmACdYqiq4FhnE2JtTMMLzscal7ARHlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787731937; c=relaxed/simple;
	bh=n81J142jM0M/7Gljn/30cULAlJGwudMuWZorxwvoWl0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eEZisjLuyxDuLFvEzn2SkHjH2zYQ3bG2gyNWtkxx12HUD3lHFRLSFCiboGcpXvHirH5RbTQtkly2frTAdSbf/D27LuJg8ht40vu2KaR7TWF30Y3hqCu8E25XbHqjebzDe3v9BHUtwYmZ0LkRsnZTFPFH5Tm/cCx5ApUMW9VAKPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=NcOhrRw8; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="NcOhrRw8"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id EC9692FC0052;
	Wed, 26 Aug 2026 10:12:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1787731922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4ap1JBJGLEVT+1yNEqXwbBxy8SOn8xuo88lsqATzQWE=;
	b=NcOhrRw8Ab3iMgSneQh2qqXBenGx6b5KRYF6WWKdsBfQfC23z5+QHHilL6AgoSKzMVv4/P
	XYu1dphNzgyNgMP2fBWEQW1Q2vSjZbPP292Z5i0868uOJIN7prcim2dsiL7Bw3pEevRXnN
	zy/HoDs6OXGsr8CQ5IxE6m0F5RYK0P8=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: wse@tuxedocomputers.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 0/6] platform/x86/tuxedo: Fixes for TUXEDO NB04 driver
Date: Wed, 26 Aug 2026 10:11:26 +0200
Message-ID: <20260826081149.235487-1-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series contains several fixes for the TUXEDO NB04 driver.
Additional userspace tooling and a new WIP generic lamp array driver 
being tested brought more attention to this driver, thus uncovering 
some problems and potential for improvements.

v3: Improve commit message to properly explain changes
v2: Send all patches as one thread (sorry for the noise)

Aaron Erhardt (6):
  platform/x86/tuxedo: Don't use device driver data
  platform/x86/tuxedo: Set HID report ID on success
  platform/x86/tuxedo: Use intensity according to HID spec
  platform/x86/tuxedo: Fix keyboard LED map ordering
  platform/x86/tuxedo: Update and extend documentation
  MAINTAINERS: Add Aaron Erhardt as maintainer of TUXEDO DRIVERS

 MAINTAINERS                               |   1 +
 drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 122 ++++++++++++----------
 2 files changed, 70 insertions(+), 53 deletions(-)

-- 
2.43.0

