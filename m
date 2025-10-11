Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E1B22156F
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Oct 2025 06:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760164740; cv=none; b=jL+YEzaIZnpZbebla2hb43LLSh6nU3x41CKlvWEB8dMqwmD8O00n15pw9nqYJCBAMHaSpttzwY3427TuPUW1EdoMrWzbR9FLaI/J9ign3oMMoCIhF3WR3R7EAErAxBaH2D/sVLYqsNyihgBqYIXWrefp7Mz5MwouLGxvViMRiJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760164740; c=relaxed/simple;
	bh=3dRcTgtlUbhprugDzakFjVFYZR+UrtY7GpAYrCcYdq4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X0f5hh59J/SANxjPEEr1t9CJkbfHhXkbsVWPCbucKCd1e0vfLuvMuOIP7sZ4JdedlP2b1rlk9MPMeC14aMepBhbpOOd0Jd/J7tFe36KlsMT1vxYtlkVUI/17bjXqzRwD/dZSFclmLKQFxl/eq78j7UjGHj8qC3xx2p1dUrKQxo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9DMYZBe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9DMYZBe"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-27ee41e0798so44198865ad.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Oct 2025 23:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760164738; x=1760769538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NBMH7or48bro2O5Ot+b/aN/ZaqN/RoCbOtQN6UzKSMQ=;
        b=U9DMYZBetSOS6p0QvmxdlyEqOvO+os0anW8/FM2VM+GtjTstZ220GsznNAf+UxqzGC
         zlF3N7iFi58uUBuJ2D2xyQWwXMCnVZqjNn9FEntVUEkq85i1bCg1ZOrQjwx1wGfZwXZl
         LUUVkwUKwUi9ZKl4yh7R4nkdc2cfi59ojmWvxn2trEO5qoO92Ta7CNmgjn6sxfFHEr+N
         V9MVe8RXuK1xNtep+o0ZrvRlTlLUMB2jajbv1Ks6o0V2ZmjPg9uePmkEhW4OXYmXgQyM
         +j4JHehHL0fX2ie+AZJ+WwGXK+r1cyjCadN7GgtCa818ZhAuJSclKJlw7qcOLyW0Fv88
         E5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760164738; x=1760769538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBMH7or48bro2O5Ot+b/aN/ZaqN/RoCbOtQN6UzKSMQ=;
        b=qK+5aqmH5sn+6MBOetefJt8iff9A+jHqEs7TP8Ia87v6MFlXD/1oMTGOvUnHqqkL5O
         pxPuWfhouHQkb5Q7UI8U/F/u9baviszVHNEQuAQE+HZFDS2l+KkOdJL30JYB2N+T0U64
         h7Fz3e+yK3zWIYTkr3Y2rQoADMuotonKWNP694UrUV8DKQYj1P2Xj8eSAYsKUsoCVxBx
         /vBfdPWwyhiP3J7QBJfuOiiXucq/AsEAGIyEoyPN0Gazjnh+oWbxhEG2MhPLDw5gR3MG
         RRZhXCI7MMDmGqi2aUwTwUz5kN8+2d6dgd9DeoDtlx5gDexOIytE1ktWzIfOo1I/h4U2
         Hycw==
X-Forwarded-Encrypted: i=1; AJvYcCV3A0sqk18/mzQq7lOk0N5SvDrbHZPk72pKTdeIieQYbjzdGYnu3YOS7ShC5R9lySSfWYcMD9GYZYu1CQzp8ztecLJq@vger.kernel.org
X-Gm-Message-State: AOJu0YyrZZ3gwxqrh4+9Azk4Idn9dCvjPbsW+bJ/limV4ggG/iwigTxR
	THNBvKyGmqfyhjvbG29m3gy1l1itcPMGcGxkF3rzqELnzmIQQwx2S1YJ
X-Gm-Gg: ASbGncvnByAUU0jc/fcod9nMasK0rQ8n8fLVVjlIrCM4RkEzIQoUnvVkz47xi349ger
	o/PzWbSCPX2RbCo4OpcqFplL1NRxs5AUkk4IQk3xfwHSjm3FxnUhp0iJ4wgEV4zSM8qrnmqSE5f
	Hb86XJ/GizUOzvu5HAiijpsdQibk67HdokCAd4TBfsSabjzpyVdMgu1OZ9c5NKSBSCErdbBQO4g
	ilIZGvYRWja76xYB7m5W9XBPYMlWEn5TGACFNW3AkgG/QYJMHRq8ixTc+XGGwNItGvBpkNXVGKM
	8rGdzcOf8pPvyeEKKPdFDwZrkwVPXJYxYMofs4cBvSyBduy66/DI6/5Iot6o7RbCB8fRL08SmAY
	DZ4xPjtnhQEdRtHUvRWQ5qcK1G47BePrj6VaWmJ49uCK7fKTn/z57PefM2d+jZkydDY+/nZOvPO
	H27UMtqA==
X-Google-Smtp-Source: AGHT+IGaDajwMvM09IHL0fig5Vpag1YEqb9pdE1rp3FDVkbkCwNkquhqyGZ/Vx6+L31WW4Xx/Zr5+w==
X-Received: by 2002:a17:903:1a03:b0:290:2a14:2eab with SMTP id d9443c01a7336-2902a143b9cmr175163625ad.11.1760164738426;
        Fri, 10 Oct 2025 23:38:58 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f362efsm75647005ad.89.2025.10.10.23.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 23:38:58 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: mario.limonciello@amd.com
Cc: perry.yuan@amd.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	jserv@ccns.ncku.edu.tw,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 0/2] platform/x86/amd: hfi: A couple of cleanups
Date: Sat, 11 Oct 2025 14:38:35 +0800
Message-Id: <20251011063837.2318535-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series provides a couple of cleanups for the AMD HFI driver
by removing unused and redundant code.

The changes remove an unused cpumask field from the amd_hfi_cpuinfo
struct, along with a boilerplate .owner assignment that is already
handled by the driver core and was flagged by coccicheck.

Kuan-Wei Chiu (2):
  platform/x86/amd: hfi: Remove unused cpumask from cpuinfo struct
  platform/x86/amd: hfi: Remove redundant assignment to .owner

 drivers/platform/x86/amd/hfi/hfi.c | 11 -----------
 1 file changed, 11 deletions(-)

-- 
2.34.1

