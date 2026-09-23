Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4940748C3F3
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159437; cv=none; b=c5yhNOzdZRArglUDKUm2WMqN+WsFJO3khaK8L35DWYz1/fRsQOlraqtgCT+kHPGM5JZxUtdOsjoajRkjFxjcq3d6TswgcfGbj6T8l1pTLbyJ5BlkTtng60INsLEns0oYM02ZdsDZoXeJUJGjzOKGbeMyuS1uIVp905cKDbY77rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159437; c=relaxed/simple;
	bh=4A2rVpCglcElPTI0FX/kZ2D+r2RLsiom+HOo0azm9N8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sKOziio133cLVmxtvTzfFzkXrZjD+w32OVy0zAObCootp95QSJDfmJKyE2DcV7dtPtGGjCZYBcX0S6RcWMAAzXCYTaAypYHytpX+SUlgPVMvHEWHdMdO6F1qcWOlYjNv81eZL+cZbbBh/aqqQbs+/lQnJH1idWnvF9AayynyJa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFfhvlb2; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFfhvlb2"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86efece610cso399201b3a.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 03:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790159422; x=1790764222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SJQcE+RNdWTQ/Zw3ZZ29eF8rBGAX/7jKIXho5Hbkepo=;
        b=BFfhvlb2YkH3g09h5WLKDhAtqLoJ8CVC+uUPhVIx1QFLiUIfMAkqttQJc+ZteSS1QY
         ggf79iexq7eT7FdAFJ8zJZQonnPRm09xH2dSgkwcEsu0HDz7v7a7Vtpth5wr83IusWhp
         iBlc5rLC1cyneu8QUKYgx0vDSCkXCx4qrhgQ+tvLGjyHrJmtQLt/C+9PNQ6OS01XaKOD
         /hJrwFdR59ESMo3ZUa72OqZ2XHZRLHVGAwN3v2VW/KnY+1UpHGepu7x18ywm09xwfF/h
         OM117WKmsJMvSLq7SyVKQdiXq9Eyeb05KNVmIw4rWTuhN04OKbguUwz8G/UoaobFnVIq
         CYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159422; x=1790764222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJQcE+RNdWTQ/Zw3ZZ29eF8rBGAX/7jKIXho5Hbkepo=;
        b=U/J7cpGySA8uy3vo0Sc8xa2ZqQ3b7RMUdOnT6rWK+zodpnT6PVMZLgJ3eJXxdq0WVv
         vupfbxrAY2Itpe9zdl9hP+/0VtozbHwdFLQgjJ0ZUlMkHnSr4YTEow51IEqkwUa3jUzn
         rCHTJM3NfVqqd0rqpGeNzNEFU0FdAIqAegy2Q94JQajprzEi6+bnXiA7cAzYANd8l7nn
         ZbvQvmARW+eUAdW8yZcisfcV+PEencR0XwuzGxcouULiKIYjMu9LDp7uwrGbBcN2vY3E
         Pss2KcNwpqxy0zLiHXQhBlhUE6QBgtV+2RCa+VcxwQ9rRUCkApcdZ4Jk6yvDr1HjfUAB
         kO8g==
X-Forwarded-Encrypted: i=1; AKwUvBwDpEN9vijVuJDIdVkkZLXORZ8Ge91aZaJJCCFL21UIlvubap7jrzvoYJ47H43+nwx5XX3wG9WQpY4WdyDMWhqQ9wkk@vger.kernel.org
X-Gm-Message-State: AFuF++kqHOgWQZCxapMBUjbnLQItvlTr3mcHYoewDPNaa7PakmaUrmDc
	NPJnsdzTlAY3+Ocesk1OkY8vqkLgX2V0/VXqpkiteEgSyKPKrpKyT70ih+sxM2FdiJc=
X-Gm-Gg: AYBFou3rKVB0NrC/UiAYntjP+oLZvDpJyNPM9da+RwaFSDoVfzwLB7zcOCNaR6vtGLu
	QbnI/Y7+uFEroC6EwArY47QAqIDp1YMqnUfigkmzfjbFUVIQzJk+WYJhNPUPVg6Uyp2WRiBlXpG
	mCdkdbPQ8ggTcvN2hdZ7c8OtLWNsYu1zV/DDmUdZW2MxC5kbIGSrk+Zj88PtykSXcMeCnUNM2Xx
	aNXaWgdmZqDgLLJi8/Jhsiiyi733THdLMh7kDLgef7Gzo+Jo1u2Jtjc1R7GMnBP4t/b7FDR1mcx
	br2Dw0/TuLuHMl8VLIjrNyeg3u96ySEVzYrCd4bHV1UQcOHDRWPHLDr2nyXc1krxe8KhxggyaNQ
	c5x0NM/C1k4Ocytzac4obRkopckB9cHuuQP2HVim1BKe+4hjRu0h0P2Zgu+byqLIu9KSJ3tVMet
	vTl2b2cnEG2Y+5LEqFmkxknqhgeXAlyKU5S2H73cwSJWUsk3ucF4PAzPlhDYA7oP3BzpPgdVNfM
	FlVVvHmP+94FNUl
X-Received: by 2002:a05:6a00:1489:b0:86b:b308:b926 with SMTP id d2e1a72fcca58-87d1a2bf425mr2002629b3a.14.1790159421340;
        Wed, 23 Sep 2026 03:30:21 -0700 (PDT)
Received: from ROGZephyrusG16Air ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1f21sm1048685b3a.32.2026.09.23.03.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:30:20 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"Martin K . Petersen" <mkp@kernel.org>,
	linux-scsi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <denis.benato@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: [RFC v7 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe enclosures
Date: Wed, 23 Sep 2026 18:30:14 +0800
Message-ID: <20260923103015.2365773-1-nbg2974@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

v7, as its own thread, addressing Lee's review of v6.

Changes since v6:

- The driver moved to drivers/leds/rgb/, where the other multicolor
  LED drivers live.

- The series is submitted with git send-email this time, so the
  patch format is the standard one.

The SCSI device handler attachment is unchanged; why it is a device
handler at all, and what the in-tree split should look like, is the
open discussion in the v6 thread.

Everything else is unchanged from v6: the hardware description, the
scsi_device_handler that does not claim the sdev, the multicolor LED
interface, the protocol handling and the known caveats (manual
attach until the split lands; SAVE on every update writes the
enclosure flash, wear uncharacterized; NULL-parent LED registration
to avoid the sdev reference cycle).

Liang Haowen (1):
  leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe
    enclosures

-- 
2.55.0

