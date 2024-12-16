Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [178.154.239.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD23204C2C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Dec 2024 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734355480; cv=none; b=X7fkKf7imxj4ZszUhB8TZIPPfYYCb/inlfzrmtSWfnoMuOrXQdjDh1n6YMjMJyRctpneQw/z95faoa0rze+ROKsX9AgFh3zCssXP15XUlqAwFvzhz+Q8OgNacM+hXrWQTUB5+F+U9XdKccPL8AOCbJcFP5JrNi+GJF5yKPRCVp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734355480; c=relaxed/simple;
	bh=y941jo/sRMhhfFF7WNIDQZJxeUouy2vYEKnecTatsA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eNJOUhvL0XV4FwyO5DKpy12a82XPzD2bBMDjH6gQh+7oQUjQ1lqBS/ZgAwRGAHQ8QHCLjrOghlOqhWGffH3cAUKw0+YFGy88zrehatb0KiRlhbyYgUV6RnuQumlJ+/3kd3o/IXnaql4GPQPe1ccDE7+OqEfE0C/+0zSWkz+7V/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=W7yqHCNm; arc=none smtp.client-ip=178.154.239.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="W7yqHCNm"
Received: from mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net [IPv6:2a02:6b8:c10:2d9f:0:640:f6ce:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id ED1D760994;
	Mon, 16 Dec 2024 16:24:34 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id WOP0oF3Oda60-j68qKZ1N;
	Mon, 16 Dec 2024 16:24:34 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1734355474; bh=YLYv+wwP1DsCGfmT3CvNDg6rvSm1TodbVqBznvvjRpM=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=W7yqHCNmgpQ6qJyWDAnjKkJ+GSDX09OoT9ZASoakvfdM9OWkIDE1koOzjkv8W8KYe
	 +M2nQeSZCvJIe+fH6f/SpNJZwNbASV9jrIVGd3lLyMl6bvaFEbs/orpMHP3Cn7s+pN
	 UsDjPY2WSU8OIaKxjJISDcx5tDNwMzwyAWKpYj7s=
Authentication-Results: mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Lee Chun-Yi <jlee@suse.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] platform/x86: acer-wmi: fix fan mode setup in WMID_gaming_set_fan_mode()
Date: Mon, 16 Dec 2024 16:24:00 +0300
Message-ID: <20241216132400.302003-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 'WMID_gaming_set_fan_mode()', most likely the (whether CPU or
GPU or even total) fan count is not larger than 31. But still
cast everyting to 'u64' just to be sure that there is no integer
overflow when performing left shifts. Compile tested only.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/platform/x86/acer-wmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index d09baa3d3d90..9be6176c0076 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1504,17 +1504,17 @@ static void WMID_gaming_set_fan_mode(u8 fan_mode)
 	int i;
 
 	if (quirks->cpu_fans > 0)
-		gpu_fan_config2 |= 1;
+		gpu_fan_config2 |= 1ULL;
 	for (i = 0; i < (quirks->cpu_fans + quirks->gpu_fans); ++i)
-		gpu_fan_config2 |= 1 << (i + 1);
+		gpu_fan_config2 |= 1ULL << (i + 1);
 	for (i = 0; i < quirks->gpu_fans; ++i)
-		gpu_fan_config2 |= 1 << (i + 3);
+		gpu_fan_config2 |= 1ULL << (i + 3);
 	if (quirks->cpu_fans > 0)
 		gpu_fan_config1 |= fan_mode;
 	for (i = 0; i < (quirks->cpu_fans + quirks->gpu_fans); ++i)
-		gpu_fan_config1 |= fan_mode << (2 * i + 2);
+		gpu_fan_config1 |= (u64)fan_mode << (2 * i + 2);
 	for (i = 0; i < quirks->gpu_fans; ++i)
-		gpu_fan_config1 |= fan_mode << (2 * i + 6);
+		gpu_fan_config1 |= (u64)fan_mode << (2 * i + 6);
 	WMID_gaming_set_u64(gpu_fan_config2 | gpu_fan_config1 << 16, ACER_CAP_TURBO_FAN);
 }
 
-- 
2.47.1

