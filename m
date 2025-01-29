Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F83E17E019;
	Wed, 29 Jan 2025 03:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738121978; cv=none; b=GgvzO7DuT5ev/ScBdeNPDvv5xE/kk7q03TfifKtJ1iAUZr6+oHQG4JZYeJtCPXzBxTkOKBXGJ96K6vGDuf6/lbOqiUDFVWxZjNZC5ec4KbEgN5sFb37cztUfZhPHr+YvGLiL3IQGdYp+k5BdvRfQ4aY1YFvPKhVCaWwfPf5VHnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738121978; c=relaxed/simple;
	bh=ovJ0n869deeFzdOx96l6O1xvtzCVhDmflTgd5kN4zEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MLDGFLnP3sSEZ/V77JtiFCdtUjO1vnI/G9SMTlad84fO7949zxaG36Omd/TlZucew1DieVDBYpd7aeJNWfHhsPpeZ5cc7WdMQoVSMoOeCtLYEYJUuXnU7UhFKj1SNvYS0aZEvr4ow7IT9JDG2vue/4DFh+ngLAMvgaMpUk3mKko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIdLPmKm; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIdLPmKm"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso8917389a91.3;
        Tue, 28 Jan 2025 19:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738121976; x=1738726776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+mduZYtEsLrzgm+/OUWELV0Cr4KLpgdlYn/+WrlpLrg=;
        b=jIdLPmKm4mwDyJ1ddzhRHSI91iWMerMoQw1sLOyyPXw8flJQm6IYouctxCIVZaimHT
         RmVDVEoN868JNNeQB2PgPbm7OQK+AmNm/UkhUSk+hG0VlCqZWVppAZCEatFMkuf3iPaq
         Iyr2W0LBS+UCpqYBPEKXD+4ZP6BGtdESTruHaNSiTKHgJVp5m1XabFdhJX3NeVVsoZUu
         NUFTIN1U0jhbUaRjtHvKVqkuG4jAylgPBcwLp8PtkdMS3aOBYDzAibMcbW7RO8yRkggU
         xXRKo02mXOIWmiuzDaYq0+8Vtg+uHr+VVfNXr08CMKU0cxPx/S7TkZbBixpS7msPcg+j
         IyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738121976; x=1738726776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mduZYtEsLrzgm+/OUWELV0Cr4KLpgdlYn/+WrlpLrg=;
        b=qRhkUeBTCQbwo50WGLxuKYuiooKNtRYm2M0naEVwESb3VcsKQydF7+dDv0Odv+8yh8
         jHwoG67D1GFN5tMiA8uNxlYC6Rlcasm/ci+7WPfPEAmPKW8lxqzleliwaMcjLgAxg6K8
         S7iN5YRH5I1g0QBJJvjfDayxFfATz13T0ToLVyU0grzuul7PIAFs6zv6vm05qS/rF8cA
         s8LS5BKP4rnWCnHPVNo1+AssYlAYi+HxlYsrubmzOD6UZJIU6k6uwZJrXsjTvrWNCD8l
         K3OJZ1QOBe8o5gaipBJK1lRczL9hvJKcio6FqH8Uhpy3xNmX0bmv2uG0/WkRmsv72QKy
         vyNg==
X-Forwarded-Encrypted: i=1; AJvYcCVKg6LPLnw1WQi09ET7Yrc53607gEMMBEYjKix2F/6nk3Ia+4gaqN8oICgbRdASpN9RnyOPUZKSa2yT484=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkkmuqd7UDwxsdgnodMwXuYzEQc//J+RoCvtLtEhICWdLFyCSJ
	37v8jjETCFWhxv/5IcxY75wHpnwOccARAOrZgH4KVzOYsh3E2uYgVXFGRz54
X-Gm-Gg: ASbGncs7ySHJWcPCfqnQzlbW8x6NWUCfqU1lKZLeLbkXKm+gwNetJjUmeSKc0QOsoM/
	DmBtuVs3TfVQn6lpxslL0kBJlkV2VgmU1iU0Ws7RI5sVc9//IzltAO61xbD7UrguNLnHSQnM51p
	MzhWX8LvH91BIGD5vywH9M3Ddtw1Ndj8yDiwWfj3L7r5K1ZmVsNt9kjyMtBz+CSm410VkIHMKoI
	Ijo1IMlQqdoZw9BMgnrTQFNwVGjYdaqVMNG93DKFTwY8wxtqbK63MDyMS4sb/DTNpAhuA0Z8wiA
	esb4QHs=
X-Google-Smtp-Source: AGHT+IHoZqxa3FMGKCbkqV2nAK8bw7iBYkRL0aCARQhtUP3+U2lNWDkzfR6jLcHu5xyrHohYnTojww==
X-Received: by 2002:a17:90b:3d45:b0:2ee:8358:385 with SMTP id 98e67ed59e1d1-2f83abb34bfmr2117860a91.4.1738121976144;
        Tue, 28 Jan 2025 19:39:36 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::eb05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bfbe630sm433852a91.41.2025.01.28.19.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 19:39:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH] tools/power/x86/intel-speed-select: Prefix header search path with sysroot
Date: Tue, 28 Jan 2025 19:39:32 -0800
Message-ID: <20250129033932.2576077-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps when using a cross-compiler for building intel-speed-select,
currently, its hardcoded to pick libnl3 headers from build host which may
not be same as build target when cross compiling.

cc -print-sysroot will print nothing if compiler is configured without
a sysroot and result in same string as it is now.

Fixes errors with gcc configured with host include poisoning e.g.

cc1: error: include location "/usr/include/libnl3" is unsafe for cross-compilation [-Werror=poison-system-directories]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Len Brown <len.brown@intel.com>
---
 tools/power/x86/intel-speed-select/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/Makefile b/tools/power/x86/intel-speed-select/Makefile
index 7221f2f55e8b..8d3a02a20f3d 100644
--- a/tools/power/x86/intel-speed-select/Makefile
+++ b/tools/power/x86/intel-speed-select/Makefile
@@ -13,7 +13,7 @@ endif
 # Do not use make's built-in rules
 # (this improves performance and avoids hard-to-debug behaviour);
 MAKEFLAGS += -r
-override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include -I/usr/include/libnl3
+override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include -I$(shell $(CC) -print-sysroot)/usr/include/libnl3
 override LDFLAGS += -lnl-genl-3 -lnl-3
 
 ALL_TARGETS := intel-speed-select
