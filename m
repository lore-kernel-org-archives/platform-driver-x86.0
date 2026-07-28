Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CF6435502;
	Tue, 28 Jul 2026 12:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241673; cv=none; b=rFH1M+WwypgJqBGteqrTk0+khv1TSHAU3/JkbGDypyZeT1TCdKqrvmjT+Tl6jrJ58lg7sfLH0Z4Lie0cYwTi8hCerpyffkuhkmxB5GF7CUhPbM31frd/o3YoxHuSqI/jCG3WJ5E2oOk3zZ6WVsJh+/Tqe3NOBmXV73b/6NUgkAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241673; c=relaxed/simple;
	bh=rVTvSM5c/POfx0DhlJ////irFm2Tm8771zIM8c4WL08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eslmXy7GELISL8tUoT6K1MJPiX1RUIgvYmHbz8x7V6HSk9P303C/2GP9EFsENng72e+5oDO/1UmrgNo6XVnBvF8zQORZ4nqkKReikaDJqUGYEWsD4MvWgV+oPGFgiALRkCqTxln9rGzHoqM8tIlmD23u9oRAH5a0RYtk5W7O4M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=gfuZj5+9; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="gfuZj5+9"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id E0F732FC0077;
	Tue, 28 Jul 2026 14:27:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1785241664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3vtZ+6p8hQpomrOW21PvXxiiXXnaK59aNdsxhHBOub8=;
	b=gfuZj5+94qgFBrzSxAXfwrRyuQkVrnYWF6BHSKD65Klq+212jEOG/rGilKkRsCvV9908kw
	I+G3pxNID4+tntlDtOyx1t5SmYF4qT14h2LihcjVYBdJW7cvqqKeNhuBZrWmqVxrPgbJMr
	nfLJg8watTfv0q0kty7Mm8XU/DlcsmU=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: wse@tuxedocomputers.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/6] platform/x86/tuxedo: Fixes for TUXEDO NB04 driver
Date: Tue, 28 Jul 2026 14:26:32 +0200
Message-ID: <20260728122647.132540-1-aer@tuxedocomputers.com>
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

