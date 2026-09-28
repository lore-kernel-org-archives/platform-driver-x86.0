Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB8F4DA9DD;
	Mon, 28 Sep 2026 14:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607175; cv=none; b=hITYvkHzpcqGKRG2eRaySNuMRO1pEJl2aAPQbDhPoc26Keg4Atjz0FHE/EYHWABif98BgIigeIlmGB5Wu7RtzVJ/l3dqaq0vBny85SLRdusF0EI0QmHj0fY/gysXvI5JAU5VJO9Pm0KyPTS1LyADNglfWLgj594zq0gREWHnhVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607175; c=relaxed/simple;
	bh=UK9vZCiOqB7sk6Kg3Zl89deyHumgB7ltsBKk1BcFN9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j8IjSpNIP8l7nuw3Kh/y3I2De46+qgUxFFYJ0Htyw6StqtBQPBAYZLTdmEQNF9cKfWs5fm2EKP7E0z50Xu8KSzZ3KaP1kzPJHC6Lu1gdcmNonpWR0sj4gqny0jzx5Lr5kN9fD6O0AoqkDkks2Nz06fb2N2yiTZTSPvAiCRPmwUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBNfZrXJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBNfZrXJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B391F000FF;
	Mon, 28 Sep 2026 14:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790607174;
	bh=7OG8mKM3HIqF4/4n3d6/Cn4qbfvPJXAe2w6ruSGlb/4=;
	h=From:To:Cc:Subject:Date;
	b=bBNfZrXJufzZo8QKJo7ZIudugXSZyZkHYUQuJnwy4+stVV8lr7GsIPkomyie9nO2P
	 zRtVvJbRYVzkFOXl0UP/Xhz7ZHDs5CluRkuqxafN/sFauckepMmUCXY5gbnhnGtgJF
	 w1wWTeLmndNHaX5TxPT6i0xTaC4ZjroOH4WG4NI9G3/QxJSfRrY2Jo8XA2iPBlb8yC
	 1UPNlwi9/txnMC3tXomL6T8EEaIzxGmT1rrAJZnWcMjznPkW3svehlWi34WpojuHxi
	 +ww+yNzJIuT9tQ+vOKc8MfmSZTa6x3LD/kmFILToJO3IqBO8ukCBkD84LBl/aWPjkp
	 wM6Q9KSJj3vQA==
From: Arnd Bergmann <arnd@kernel.org>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Pan Chuang <panchuang@vivo.com>,
	Kees Cook <kees@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/mellanox: mlxbf-tmfifo: fix building with CONFIG_SMP=n
Date: Mon, 28 Sep 2026 16:52:42 +0200
Message-ID: <20260928145249.3177085-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

spinlock_t is an empty struct, which makes ARRAY_SIZE() on an
array of them undefined:

drivers/platform/mellanox/mlxbf-tmfifo.c: In function 'mlxbf_tmfifo_virtio_synchronize_cbs':
include/linux/array_size.h:11:38: error: division by zero [-Werror=div-by-zero]
   11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
      |                                      ^
drivers/platform/mellanox/mlxbf-tmfifo.c:1146:25: note: in expansion of macro 'ARRAY_SIZE'
 1146 |         for (i = 0; i < ARRAY_SIZE(fifo->spin_lock); i++) {
      |                         ^~~~~~~~~~

Open-code the size of the array here as is done explicitly elsewhere.

Fixes: 961d62a3c153 ("platform/mellanox: mlxbf-tmfifo: implement synchronize_cbs()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/mellanox/mlxbf-tmfifo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index d67215df7371..dc4060c720f8 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -1143,7 +1143,7 @@ static void mlxbf_tmfifo_virtio_synchronize_cbs(struct virtio_device *vdev)
 	unsigned long flags;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(fifo->spin_lock); i++) {
+	for (i = 0; i < 2; i++) {
 		spin_lock_irqsave(&fifo->spin_lock[i], flags);
 		spin_unlock_irqrestore(&fifo->spin_lock[i], flags);
 	}
-- 
2.53.0

