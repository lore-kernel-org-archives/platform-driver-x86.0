Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40633DB318
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 15:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327649; cv=none; b=fJF3PjbtSCDUrY5ODcJuIDlPC9YYPAlydKZ8Fax8pjeV+ihXYLoR00VoF4nRoYf4Rg5fB7W+jCuxPinMROXxe25hZy5m/ScbFG8s5+UHqOLF8v62y2vqJiGPA8XWZqrNZ6D9JX78J+NsesspaRyZWla9PLkqCXQQ53LkWz/VT4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327649; c=relaxed/simple;
	bh=5oZ1J1mvUSvyKO2H76WnIK5IZNOAj6TLh/fg6s4qq2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ryQcjULA/pe8VW5oxhbIdl/psRR/L7rb+ZD/foXjfLMYGytcZUmJndiCLe4+1UZQeKFoAZ0iG4bOXj5YjaNdUcQOVjTxnbNRYO+U0Vt3/IonpmP8KgWMv514b1pe7/8aB+UnXvPXc3D2oMWUwJYgxPoO5ypvHfDZ2FAHilTIzxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njRhssNz; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njRhssNz"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-307263ad0cbso949535eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Jun 2026 08:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327639; x=1780932439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJpcDUso6CbRYOnrV9hEko7Jya8lODsgrOXXaGf0maQ=;
        b=njRhssNzp13QHdT5Il1+fBc8KecXHudP8yNPOfKVq1/rwn0t55B//9zH7/AEmu7Fts
         MxQsBBFl9RPAl5HW5bEVwnU/e3njgTkJasppqhx+ZoXyIu/DQNHShyc1PtEJwQr7HJmF
         vv6PicLw/aBKDz45GtrOWpzQQn4cxuQ7kRAx+vLgm36L3lTeia9jKkGOyRaJAr7RmpeH
         eDeN8QgNfU6uKN1Zv9LeQQqJqe3dvHcIKvFCKHoYphmZmWPFgeJESYWg6CG9V25mPNkl
         a6YCnQMOIBxC84rV6bXg6DVmBncUmVoAhgEP7YLYwgJasnfy774z1KFxa4DyrWUNHx+H
         gF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327639; x=1780932439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJpcDUso6CbRYOnrV9hEko7Jya8lODsgrOXXaGf0maQ=;
        b=YZPee5Yppwg7nrWPejg+MgoWjVCeP1Fm2DM7puRR+PC8eNVoblxqjyS037egWjAHr1
         ErF9a1ZDmJmz8xC75xCHp4Lzhq+CZsJOC6l5MKxBRLxWzydz7MKS5UkBgiJtLQP8JISc
         qxDZn3yLrBteRnP5jcf/DyX6PMs46nPA3OX6veObSBw50QlVcg7aJK3AmNf1ryKTDkm8
         GOfYbGR6EZN2Vf2P0T/krBZw/j0Hy/YO6cWVFAt0Onn2tcVhhnPfg1NT9zWqriqMNsyS
         +6J198HCxYwjyP+j2JQnepbRG8XU6u7UIXn1MUt4lAPv1Yq2Vw1qE2vnEgbCXdZcYjUa
         szKw==
X-Gm-Message-State: AOJu0YxcA8NQMGwe/2FVXDjFSCCG1lzC6qhlM/bxf5qF0Iu/2z8HC418
	YzAHsG1F12XRhhJ7/2w/0Dcb9oVCaW2y+nCOMrbYP6hotgkMBTlf4njR
X-Gm-Gg: Acq92OE9RBFKLIoaivCYHlEURAVkXIrJkfl7oy9vLiw7ja1ZT7u/78rUmjHKOiOU6ta
	dTnnuzgWNJ0fMConfqcaB+QwddI7zb61roUNIdbR7mPOjyisLtWPPLeaNwDfp1fe0KM6Vgm2jXa
	Tfz1aPAXSd5uZH6rzBVc6PFzlqYNVJ/dQ0cqg/yNGkdahUtphXASl7d5jctdwL4iL2p8oKPqhh0
	b/8OE6ZRLoDd42uR9bY3OYYJKQO6FSfhqkg6+16+1HrgJ3e8IxYZ+p0DmJGvSu+FfaoKpB5s1/M
	FswTYafESL6I2LqIreKck5Sifki4Y5WCkDmHY+4gI3Pex8P2L6WauTD2o+wU0AO6fVeJZUs2vMt
	IvIudOJBu2M2cywRJ6x8MJlVkK7cQu/Inkh0YhXpGH0kNlMfrqpIecNEV7YGKXCKwzWtUMNszUN
	B8D45OCR0rOfrfplraAf38mBnFwtDxN1fMLhE1
X-Received: by 2002:a05:693c:3006:b0:304:d388:c33e with SMTP id 5a478bee46e88-304fa4a7fd1mr6724314eec.1.1780327638754;
        Mon, 01 Jun 2026 08:27:18 -0700 (PDT)
Received: from Lucy-Fedora ([198.176.56.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53f002sm9399076eec.18.2026.06.01.08.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:27:18 -0700 (PDT)
From: Lucy Wong <lucywong2778@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucy Wong <lucywong2778@gmail.com>
Subject: [PATCH 0/1] platform/x86: add Xiaomi WMI key driver
Date: Mon,  1 Jun 2026 23:27:02 +0800
Message-ID: <20260601152703.94539-1-lucywong2778@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a driver for extra function keys on certain Xiaomi laptops.

Unlike the existing xiaomi-wmi driver where each key has its own WMI
GUID, this machine delivers all keys through a single event GUID
(B74AF83F-...), encoding the event type and keycode in the event buffer.

I was unsure whether this should be merged into the existing xiaomi-wmi.c
or kept separate due to the different mechanism. I chose a separate file
for clarity; happy to merge if preferred.

Tested on Xiaomi Mi Gaming Laptop (8th gen Intel).

Lucy Wong (1):
  platform/x86: add Xiaomi WMI key driver

 MAINTAINERS                            |   6 ++
 drivers/platform/x86/Kconfig           |  11 ++
 drivers/platform/x86/Makefile          |   1 +
 drivers/platform/x86/xiaomi-wmi-keys.c | 139 +++++++++++++++++++++++++
 4 files changed, 157 insertions(+)
 create mode 100644 drivers/platform/x86/xiaomi-wmi-keys.c

-- 
2.54.0

