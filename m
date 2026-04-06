Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DB12F690F;
	Mon,  6 Apr 2026 21:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775510236; cv=none; b=jH1VPEufk/Sc8yRRDnEMT80t4vWGp+BXFnl4GnpXvDwLgvVER045V9Hni0cZ6XXVxhfUhwOspN+eyIbAvG8AhFTZ2EcXnGmQiXpvzO8maOQcIVf/i8oE0Bl3IsrYcZYETCRH/9lc2M7MPZjaeFH34HjxqZA6hIPCouWU8Om2wMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775510236; c=relaxed/simple;
	bh=DCelb6pFj96iGlgWxkwkpw2vaelmkz7WAbO1EK8hPP4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=buThaoCpEHESlbT0uGwOaFClQc8RS/pJ3xLTrO0XHihvUH41nGjvMjp/yGHN1hFsluVTCzcShCDKIrj3FcoF8lNLdLyutrUkR0ApuDxXFT742znUCoWAT7YaVOeVHOwIcjdohYnrjlv2zO3/z+gXe1c8y1vfqTBZrzYscCsafu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=HTXjBdbI; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="HTXjBdbI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775510233; x=1776115033; i=w_armin@gmx.de;
	bh=cxZEGNJwwugOLpZmKlabSC+kUiI4KaxNXX3qroW4Bj8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HTXjBdbICdSHJy9tzJGkTglrPVdfGy5arh+x/hTWxqx7DXAYxQ/Eh3PY4L4EAx97
	 VhXtcofmg3hA3suiu6/lFGKCjfUHUW6KSWqFtRFa0ILRQH83dxQSkpl7IRcQZXSeb
	 Ai3dLtVaGtRjJSCNtKHn36an48Mvz24jQ7NUxxt1+HpAsmNJRmw5YOiYAU+hrBDCL
	 tM3n12COAvxBP2bE5R+WHaq3rKO/beHMz2r/u2uIE6EhCA//28PYaRGXvuObigzIW
	 INKLVf5AKvKmeUcnuwbadkyFKPPG/uDT2ADpwCsU+dzWMt6v9wP1ZTHb67xnY5JMP
	 vdogtwD4mYZJffTflQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2Dx8-1vTh4A3V2E-016esy; Mon, 06
 Apr 2026 23:17:12 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] platform/wmi: Use WMI driver core for size checks
Date: Mon,  6 Apr 2026 22:32:31 +0200
Message-Id: <20260406203237.2970-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cdZCJlMRCSDawVIAPlrajOb60EmQCf7Y2QSs3aCXDTRdv7Mo+7/
 8aYeRUKxzmKY1YgSRfAGH8ilt/8sxAAYrItMWTCE0pFcNEaBefB8zZwcxQhYkqyydlB24Gz
 uX8viLjRg0Uq8OpUsYIJsx+7XJee+woPs25BQ91xogLC9FHWcdAgzekLe4p7fJLoBbiCNCW
 bGX1meSf7Ntajdd+WjjrQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ylgaNKfiYZc=;UvrEfCdgfaa5/w98vkSwiSBvDBR
 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
 66nEZY6bkme

As suggested by Ilpo, the buffer-based WMI API should assist drivers
in verifying the size of buffers received from WMI methods or blocks.
This patch series implements this suggestion by allowing drivers to
use the WMI driver core to automatically reject undersized buffers.

This avoids a memory allocation for undersized data and simplifies
the size checking code in most WMI drivers. All patches except the
last one have been tested using synthetic ACPI tables and appear to
work just fine.

Armin Wolf (6):
  platform/wmi: Add wmidev_invoke_procedure()
  platform/wmi: Convert drivers to use wmidev_invoke_procedure()
  platform/wmi: Prepare to reject undersized unmarshalling results
  platform/wmi: Extend wmidev_invoke_method() to reject undersized data
  platform/wmi: Extend wmidev_query_block() to reject undersized data
  platform/wmi: Replace .no_notify_data with .min_event_size

 .../wmi/driver-development-guide.rst          | 11 ++-
 drivers/platform/wmi/core.c                   | 89 ++++++++++++++-----
 drivers/platform/wmi/internal.h               |  3 +-
 drivers/platform/wmi/marshalling.c            |  6 +-
 .../platform/wmi/tests/marshalling_kunit.c    | 24 ++++-
 drivers/platform/x86/bitland-mifs-wmi.c       | 24 ++---
 drivers/platform/x86/dell/dell-wmi-base.c     |  1 +
 .../platform/x86/intel/wmi/sbl-fw-update.c    |  7 +-
 drivers/platform/x86/intel/wmi/thunderbolt.c  |  2 +-
 drivers/platform/x86/lenovo/ideapad-laptop.c  |  1 +
 drivers/platform/x86/lenovo/wmi-camera.c      |  1 +
 drivers/platform/x86/lenovo/wmi-events.c      |  1 +
 drivers/platform/x86/lenovo/ymc.c             |  1 +
 drivers/platform/x86/lenovo/yogabook.c        |  2 +-
 drivers/platform/x86/redmi-wmi.c              |  1 +
 drivers/platform/x86/uniwill/uniwill-wmi.c    |  1 +
 drivers/platform/x86/wmi-bmof.c               |  2 +-
 drivers/platform/x86/xiaomi-wmi.c             |  1 +
 include/linux/wmi.h                           | 15 +++-
 19 files changed, 135 insertions(+), 58 deletions(-)

=2D-=20
2.39.5

