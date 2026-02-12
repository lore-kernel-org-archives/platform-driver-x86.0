Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD36BA34;
	Thu, 12 Feb 2026 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770879767; cv=none; b=Ia4lclEcltxvsUks2iaNRX/WZQG9k0y9PkfRY0OX53ZxHZknqO0JDGXp3RMJRyNl8rnDfn9AZx5FUMYg4L6zQtt2RrUzw0uE01PGw/0iqMfrg2YcsA/utmOcaV5n1K2p24wGPkTFTlrx+kQXrJQELrKHR2kKq7UE24N01BAQt5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770879767; c=relaxed/simple;
	bh=5WRYO/8u/v3xmjGvJ7ESgiO9n1OvzAo7dYpqJw4XtQM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g6spZBR2gppuCI74sv1Iay4zVQaoR4yPWj1RuyQrGdnyLzIL/1me18+QUHywkjNd3Rv6wwIMUWhrKFG41rK2s+kYghqRQJaz7JpevTz/0Kq0RdxSMH0x8J6u0ENE5pJULhxF40aynJnQJ3H2ryZmlM+/lnA1CtNdvF7MtU2Qd+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=US6muRbw; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="US6muRbw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770879763; x=1771484563; i=w_armin@gmx.de;
	bh=ALnEzpEpHy9vZUVMLTqT/CDoWRFI6iTG6e3rs5L8Cqg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=US6muRbw6xlzFbR9/K8rTqoamCDeeL98Z/RwMblBzm4L9v4Bo7jHtVdMHFofCRb1
	 rtwCABtQvfDCCS2pEQI96gKt1804kafea9i7Wv2KZMBGUly07wtHUfMwrv4I+jizR
	 /GQbvBJ7EdMEN0hv1h3RnIbsbJhq8v7PXQenCquCvf9pmcjENH87brY5Jq0l4b/Ww
	 ZI3BiRy7uWSajXRrz8vkMwfOzAwqjy4YCFUwOsspfWpUdsR/2VXLMzv9yf8AAczz9
	 ERnhTl+LPWSESXjhQxnJzg+GBQTsc6wtrXJD1Z+hEKv9XTmykBksuCkquylt5KWu6
	 rR2TYNQ3GU4ZPmcrJQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mk0JM-1vNvXW3Rou-00qfAZ; Thu, 12 Feb 2026 08:02:43 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] uniwill-laptop: Input-related improvements
Date: Thu, 12 Feb 2026 08:02:31 +0100
Message-Id: <20260212070236.17296-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rjvLuMB4vuwDdmJbVe0Xx6S8mfxNbWlFCDcpr6TZsZyR+JQ9GA3
 X6Y//Tau0QEM4JGMtwQkK/8JmeTiK4XhvUUXO+tIkbzLkgeIT5p06RgqpjAv74yCfYfnf/0
 8nyXbEeEMHrNCOc5f7ta1SiuKimuwRTwvdKg0+xJeo0Xxh5QqAvgC8q1eOKJ9bdoOUPcelZ
 wRr5Stgws6+7Qebiuse5w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D2okaK2+S8k=;XLHAgrliHPmoWKX3xPrtLUt8iwH
 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
 iG+fcqpOUgvSKWKJFtOQk1xM+JKOs

This patch series contains a set of input-related improvements
for the uniwill-laptop driver. The first patch renames the
"fn_lock_toggle_enable" and "super_key_toggle_enable" sysfs attributes
after it was discovered that the underlying hardware works differently
than previously thought. This technically breaks user space
applications using those sysfs attributes, but AFAIK no such users
currently exist.

The next two patches fix a potential crash and an issue with the fn
lock status not being updated when using a key combination. The
remaining patches ensure that when the users changes the fn lock
status or enables/disables the super key using a key combination, a
poll notification is being issued on the appropriate sysfs attr.

Changes since v1:
- update admin-guide for uniwill laptops
- rename UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE and
  UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE
- fix small issue in commit description of patch 5

Armin Wolf (5):
  platform/x86: uniwill-laptop: Rename FN lock and super key lock attrs
  platform/x86: uniwill-laptop: Fix crash on unexpected battery event
  platform/x86: uniwill-laptop: Mark FN lock status as being volatile
  platform/x86: uniwill-laptop: Handle FN lock event
  platform/x86: uniwill-laptop: Handle super key enable/disable events

 .../ABI/testing/sysfs-driver-uniwill-laptop   |  10 +-
 .../admin-guide/laptops/uniwill-laptop.rst    |   2 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 109 ++++++++++++------
 drivers/platform/x86/uniwill/uniwill-wmi.h    |   4 +-
 4 files changed, 83 insertions(+), 42 deletions(-)

=2D-=20
2.39.5

