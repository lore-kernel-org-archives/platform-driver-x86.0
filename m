Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56BE26E6EB;
	Tue, 25 Nov 2025 13:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764079066; cv=none; b=e0Bcc6LSooiJKYfRMO5EDXXMZFtFxJPh4yp9PMmUEdAY72KHWU46I62E7subLi6QM8ap2mh8nlPSb0pKWe5vSAVm4716WP2jw/LUYBBij6HhXFZCkCU9/SOirF2Oi0uuBaoFRM3XoY4U6o17+id9j2qBJ8XJaImdm2OwmHRCtoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764079066; c=relaxed/simple;
	bh=1fD82IlXtkUL6/mjCSV5+rtcFmxfrY9OSzQ7x/ltcnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VjUqf3GlPGfQvUSn8L/SDYLDW2jnk+VL7CefDp9397uGr10aYAXt+8i1pSrZO/DN/AT2uaCyHBIfyRJ3jgkBtN5AJllFWA2x4yWU5lqTSP93SQbhtzdjWNoVlDU/9z6GzWe7DNMOvfQpCuc/dvrit/jnuAp6Hpb7CbQIaEkjVtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=fDIaNY4x; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="fDIaNY4x"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 1C5032FC004D;
	Tue, 25 Nov 2025 14:57:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764079061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TGEKjfcxqIrLWPUdRQ2o9PmcRcRYhALc12y070Xe8RQ=;
	b=fDIaNY4xHBgYqLbDg/MnT9BhLsuQmKSOExCzvxHwheeMV7QnXIPWmE1k76uoyvehYCCgBm
	FXj3Se7e7fKB7tv4zA8TFQLg3HmwCUvcoEi2cgA+sRfbEv8xGnn1a3w7amCKsA6z/BeCc4
	LQytsnWpOPszrjT7ETLY9qZMYHr6pws=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [RFC PATCH 0/2] platform/x86: uniwill-laptop: Introduce device descriptor system
Date: Tue, 25 Nov 2025 14:49:10 +0100
Message-ID: <20251125135729.487837-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch of this RFC is based on a PoC by Armin and extended the be able
to modify feature bits based on readouts from the EC Memory.

The 2nd patch is a new feature that requires such a modification.

Armin what do you think? Is this a clean approach? Technically the feature bits
can be modified arbitrarily, but it should only ever be accessed by the slightly
modified getter method, so the risk should be very minimal.

I wonder if the static device_descriptor variable can somehow be skipped, but it
doesn't bother to have it there either IMHO.

Armin Wolf (1):
  platform/x86: uniwill-laptop: Introduce device descriptor system

Werner Sembach (1):
  platform/x86/uniwill: Implement cTGP setting

 drivers/platform/x86/uniwill/uniwill-acpi.c | 269 +++++++++++++++++---
 1 file changed, 240 insertions(+), 29 deletions(-)

-- 
2.43.0

