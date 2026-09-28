Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E39847F76D;
	Mon, 28 Sep 2026 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585717; cv=none; b=FkOElgN8AhN9+CvInVELhkmaRuvXTg2WcTPXndprZdjTqgM5EhCEl3BUAgR9hGGYCgjotCxjrSmJrBfECuGVWFsGNVzmK8MZjCxTRB1dkzRetDulRfRmQ2mC+BvOBIavn6JA9LovRq4XSRvMR48Fi1a62tWjIHOqbzZmpGsTcFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585717; c=relaxed/simple;
	bh=eMjkNJ3q/DovgvB01yUoxVGvOpT3pj8mx3dgd+fPhbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TYdSp5Ee6hhynw/OR85JtqyOgqvYFp2OdGvKl6dSS0OjFQupDJXsgFxfEEq5p1116sRUsCpw6Wa3rJZxp4YcQC2y82EFZnCKiqmRJwum/4xHCjIIuc77+zBSEgo7DNBeCOZ6YAdnPcD1GucPayAKoqBlxlnmkH1mFe1k725Z8qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=gqZhn5NJ; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="gqZhn5NJ"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 305832FC005D;
	Mon, 28 Sep 2026 10:55:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1790585706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qUbYzKGoGPyu4AqMFSPmfya1xXa3APXwrgW130+Hmno=;
	b=gqZhn5NJxoFGllUM5bqgUblPP5BLP4OfvGkxN3HeW1+RH22k3WkP/p97VbqatGTgVkNsFo
	/owop36oero0UbnGvxK6uwTLRjjQswozW8rH42ZMNQ92G8L3jTYCuNRAX1TkZGj4bZcab2
	Ozy3yJ9QLxv0hmewI6JoIyjSGiuT5gE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: Werner Sembach <wse@tuxedocomputers.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] platform/x86/tuxedo: Fixes for TUXEDO NB04 driver
Date: Mon, 28 Sep 2026 10:36:25 +0200
Message-ID: <20260928085448.9024-1-aer@tuxedocomputers.com>
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

v4: Add missing fixes tag
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

