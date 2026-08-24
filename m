Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7917718DB01
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 22:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787612196; cv=none; b=n8ybDOdDcfwEKo/KkAQVx6Zm9v9VYrFU29HafvPWqIg+mI7tyCnGjd8iHakGj13cPE998PUvSsEPVAbSdUjLuCD5H37fqIw1j/ngyJiwihZYNDklODut3aRhNPvqZMB7Wz8pl9usFVwinLpMR9IpM4tV+9oRSFsqvc55E8jE544=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787612196; c=relaxed/simple;
	bh=7rd4ClZqqN2aAO4/lh8ks3sNlQJRzQxsfCz/FbU/Y1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c9RzolfDrvp0E9Jf0W+DOitZ32K0hrPqR0RSMjy5tCRsspNNn2YDoZS0vjnTyVVza9qG6HPjSj+7G4VDozrAcdX8FawhZmx+aG43U+iNYaGSHwjHYI80wAIbD2Wo3peqUkB3wgmRtvF3Aj3SqFzuklMe6ZJ1kfvIUM3y/fuYDSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTFX5+te; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTFX5+te"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3964e480f76so124585a91.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 15:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787612195; x=1788216995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NwemO9iddBuLEZSBsEh4l2aSBmKqvuTPVgJhp4d3ZoU=;
        b=NTFX5+tesfX1f7VVXXXVMBooJCho4uMIYSlwn7uBBQTXTLjpLKkhF8szypruR3JnJr
         qRhNPULBbO2v/LI1DxAU/55UCoI/A96NJKLCey+eJ+/Sv5f3vSXzCpALbJ0E8p22OpRG
         9MObdP1lAlXbFTJI+3toiUWdi+A+gyZtBQrTNuV6yDenW+2xxj4SB+V26jXLcs6mrc41
         ruKpm8KhrkQS+RfHmYDBOnruwtWVPpZ4mpFo0nyNtqA0In1DxOKIkqKKypeYf08KG+dD
         z2/92ifwxYBSaLqWMf8TsO4hIvmrNEc46IvurGCFCUJh/nJRsZBgX070TbD5KIlrsmW0
         51Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787612195; x=1788216995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NwemO9iddBuLEZSBsEh4l2aSBmKqvuTPVgJhp4d3ZoU=;
        b=tA0vT4RUmacvYwgIjFXZTOLv/vxWrsGc+BIRUBcYY+82VeRO7AWDjsut+2TYSak++t
         VmscTmxG+E6w7D1gCdRPb4JX3qv8hNIHBvyMu1sZs4aSeCLzawDNG9yqyM2eWzBCCAOb
         R91EMC1gaCLQ/WSYhvsMakEUA9RAXZXYaTtLFqRKPScUrAxfgFPbYRAsPEOB+H1PaOzZ
         wUTQh5Axvpq2EHFno7qveMtFbLacaPlmYQ/uZyoGn4XSMsTAhIH7WQKf13mVQeyuDz/W
         x0kUYqd/I645NqpwiCZCHYbFRkzF5a+WUd+LY4iAVpQK8w/kCca8kGiTAGsw2VyLtLZC
         jbMg==
X-Gm-Message-State: AFuF++ltzakXrOy0AUAqHL31pTj0KF3jDhMR5UK06wXERThtpg1W0MeL
	0/lIz9sR/Xh2UHcFOGDI9RLK94Yn3nDOT8NSc9h2v2e/gfB+afHVLMzC
X-Gm-Gg: AR+sD11rVhY4LTamd9HgaMoCaaCJlmvGTa7kMqjPODTiviwf0s28ldJaTQrRBjUaP7+
	ofHS4gtGlIXcmPCrTWP1R5F/R3DEud/Rvkl4Xi/tK8MhnQe5pZxqUHBLmx78PpNsUsd7JqKvcPK
	ghlp/86ZD8QBkgb0soxJ/IvhVPpXLCXsyxHIL345O2A/1wpTECa8fW+YzKv6YG1cGUEiZsaVf0q
	g9KUalWRLQN/8XycBVTdZ41L+A7ef8NUyr3B/RPRYdj+S9WursNAI9K0xLxvGxutBRnHOerwe0O
	/IFRVhEEczdaWA7+W3Ey/1lX40vf7hpv1PlRl3353PM5AKN2PCiObq9A++jQqeiNXcXmH//94IH
	WSnD84rAElLXHFeajan62k2t4Pyj4AvfId5FMiUHSQXluDRXz5WM5DjL5/eH+ZffXiEbD9nSe9J
	B8+RsGV0W9CsBowMAYmfWKnrdWJJaZ6S39PUb/jM+OHTWkBpAGpRBN6rmjJOIoz/rM6nyU37/wm
	gQ/svJIePgAgWZIzdvEv1/MQhFfru17FV8U6Y/Rjw==
X-Received: by 2002:a17:90a:649:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-3964cbf5921mr1068172a91.14.1787612194864;
        Mon, 24 Aug 2026 15:56:34 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328272232besm1527287eec.21.2026.08.24.15.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 15:56:34 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH 0/2] platform/x86: hp-bioscfg: fix OOB reads and buffer desynchronization in buffer parsers
Date: Tue, 25 Aug 2026 03:56:08 +0500
Message-ID: <20260824225610.18471-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses out-of-bounds reads and buffer accounting issues
in hp-bioscfg's WMI binary buffer parsers (hp_get_integer_from_buffer()
and hp_get_string_from_buffer()):

1. Patch 1 fixes an out-of-bounds read and buffer size desynchronization
   in hp_get_integer_from_buffer() when reading integers from unaligned
   buffer addresses where PTR_ALIGN introduces padding.

2. Patch 2 fixes two heap out-of-bounds reads (passing byte count instead
   of wchar_t count to utf16s_to_utf8s(), and loop bound expansion in the
   escape-counting loop), a 2-byte under-allocation check, and buffer
   pointer/length desynchronization in hp_get_string_from_buffer().

Tested on HP hardware with CONFIG_KASAN=y.

Muhammad Bilal (2):
  platform/x86: hp-bioscfg: fix OOB read in hp_get_integer_from_buffer() on unaligned input
  platform/x86: hp-bioscfg: fix heap OOB read and buffer desync in hp_get_string_from_buffer()

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 36 +++++++++++---------
 1 file changed, 20 insertions(+), 16 deletions(-)

-- 
2.43.0
