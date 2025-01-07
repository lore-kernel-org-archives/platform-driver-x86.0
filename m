Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCB519067C;
	Tue,  7 Jan 2025 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736269556; cv=none; b=sn9OvABkL7zgvR3uFk7zoN91hLiUjFQbRyicnfZsKsmrGAmqZwZrmiNkaQNgM38m65wCipxxINb1RWaS1YRZCq3K13k3V8EFUlvvhY1BTmWiDsLemnKN4AZPiK9lfN4MVZfl7OS5sTtIDJ7HyLROUzIGmmlQ5nzr+gNOgP1e1/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736269556; c=relaxed/simple;
	bh=yNNlOwuwUck/rfdk469DMvvgBeUt5/vpuC6Rm//UInk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lL/n05MmYWX7Y5FbgDmIdlAZ65SB3nQl0m/9BUqPzSKfCuGQkQi1c/4GTlW5NpVB1oFwONyo1XJzHgVxyoeV9/5kGQtv+sSfPhh1LnbYtKBX4zq0G1Jzs6oiKJiTjNwKVt7GA5i6NiP8vJfMXsB7UafixaH6gKyWZgFKMqgmOZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Rt4RupGF; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Rt4RupGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1736269549;
	bh=yNNlOwuwUck/rfdk469DMvvgBeUt5/vpuC6Rm//UInk=;
	h=From:Subject:Date:To:Cc:From;
	b=Rt4RupGF31XfFuR1lHYyWhnh6aehZQKKENWWf1v3m1UL89oKmYpVeOlH9CPuPU6T+
	 eo43SDOtLkSSpr8R2OemFURwhylGeU6gbfMykW27SsibuNOS2h1PIlbmAfU+3F7JNv
	 JEnzjRnK2lA1g5yVEcgTxZ1Zelp8Jue3YRdcYmd0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/2] platform/x86: firmware_attributes_class: Provide a
 highlevel interface
Date: Tue, 07 Jan 2025 18:05:36 +0100
Message-Id: <20250107-pdx86-firmware-attributes-v1-0-9d75c04a3b52@weissschuh.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOBefWcC/x3MywqEMAxA0V+RrA20ZTqKvyIuMpqOWfggrQ8Q/
 93i8izuvSCyCkdoiguUd4myzBm2LKAfaf4zypANzjhvrKlwHc76i0F0OkgZKSWV35Y4Inlbefo
 4H3qC3K/KQc733Xb3/QCOtdDnawAAAA==
X-Change-ID: 20250107-pdx86-firmware-attributes-a5175a425fca
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Grisham <josh@joshuagrisham.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736269549; l=1194;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=yNNlOwuwUck/rfdk469DMvvgBeUt5/vpuC6Rm//UInk=;
 b=gos5rAqp4CS0LnXA50sEXKfNuKa5UNjJEAhb38A9E/iCxP6b4dnM7iSlC0xHgJXaTk9rhqR3j
 x/nRMT0wDCOApkqvJjWduEImftBXTJe3Y8ZAhSKbb40V5k5dT9tRRxv
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Currently each user of firmware_attributes_class has to manually set up
kobjects, devices, etc.
Provide a higher level API which takes care of the low-level details.

Also provide a test driver for the new API.

Based upon pdx86/for-next and my firmware_attributes simplification
series[0].

[0] https://lore.kernel.org/lkml/20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net/

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (2):
      platform/x86: firmware_attributes_class: Provide a highlevel interface
      platform/x86: firmware_attributes_class: Add test driver

 drivers/platform/x86/Kconfig                     |  12 ++
 drivers/platform/x86/Makefile                    |   1 +
 drivers/platform/x86/firmware_attributes_class.c | 146 +++++++++++++++++++++++
 drivers/platform/x86/firmware_attributes_class.h |  37 ++++++
 drivers/platform/x86/firmware_attributes_test.c  |  78 ++++++++++++
 5 files changed, 274 insertions(+)
---
base-commit: 25f05112995242b5a7ec1a91fbcb4dab66719af2
change-id: 20250107-pdx86-firmware-attributes-a5175a425fca

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

