Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449FC25DAEA
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 20:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767041115; cv=none; b=gnqPsDmcJbqkEb+bD+YggG9s6Sd9C5J39CIArnofQmUKwmuFNyzv8CVFxAbBbXDNxgFZCu5uWiP3CJq/m+St/tOIFWFocUzC6FbEQHl3y5iQzj3nlUtUxHybIxUyZlIpJxTBQwZ5orySd48cmvyZFnkmBwmBbCFmC93ve0/o/+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767041115; c=relaxed/simple;
	bh=ex4Ck4olJols2jBEGb1IF+15qqIBqbl/l4O//LrmuTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=grG7R+pXN5Tx2p68zwSmM1zJHkx/nn0RMWvxKgofCz6pBKWXWH82YiyiZhMTcUXrKA3GDczs4CPSPvbrxv3U3HVDv3BDavks5B7GbySt0Y7N/fwYxs+99hQBHSPOOxkpYa786myXti8kk16PaZmRIu+MtOIaYd6vuosSAUa8u9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpdqnlLW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpdqnlLW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a07fac8aa1so100141145ad.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 12:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767041113; x=1767645913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XR7nS3vjfSXzQvWBx2iWQPFkgcQ7WikNJkPELgNSlxo=;
        b=GpdqnlLW+84UASApoH6DDfoYwzgdjvlvVC9oDRL0kmt0Nr2xaaSpTYFSxth941B8Qd
         bgKqbVabWqGX6W9Uif22E0VIGsozroKeVoVZvgoR2mSQ0mJZBOzlL5cyQD6HL/pEb6Pv
         meUXwdnr46hLissqa3ZBst5yLLbbU7tAtZgG2HN4fG+GXq4hxJowHy5swccm49m/91TT
         kVRnvbZJFAyGeIfZB1JLPkggTSyNhzmmjJqCu6wqgxkxHE0iGdLIBZ71S9XWPhQA8Vy4
         VrxijNx6AlP6JNywoNKVUq1j3YLT+LjnV7bp2FPtmqkmEZkZ779o2jQg+1/zFo6xZKqS
         XSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767041113; x=1767645913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XR7nS3vjfSXzQvWBx2iWQPFkgcQ7WikNJkPELgNSlxo=;
        b=Kqo0Cvac0TU9Nq7iWcw7yLgvNXGoWYbp7Z+K6Y+n+BC2OK6qEBRc/emCMWlhf3uYfq
         Nr5ql2GTuS8DIcdBTn10vGOc0CCK+RaKmuP2mHCyrhtxv6MmeZQwZFely5d49RWZtlVx
         VwcakavxMAF6EvTlV1IwRYmtHrv/v4++Q8i4mBvKbUulJM5hru/NIFAbelBfoWQfOtQv
         /VmOsiQT2V7gEytF+iM+EMdN9B4DcnZeapxjZbUogDOQQuUI/ctgNSl4IOQr6JmsCvkG
         BWGcGgRFiWQl1G3Age7kbPsEtW/Iawxmxyqg4NO6FoaFnVXfCWDpsLHGctTdTEAcL8zG
         MrJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8u44xJUJPR0QKhDgjVWEiuhLBiVG/asO41iy5kJK78yjA03zd0qztT0uKsyUlBFajLskHmlYGqfNxZ5NUe1MNgQJ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3kd+KFHukIa394i+0DyaYQgpyhzq0IMerpSX5TASbTls7E7dH
	UkUDLnelVjJVMQuVpykmCzVE37sOsbAJnMvv4wsKxZ4Fi1eAUOURs2dk
X-Gm-Gg: AY/fxX5oqB4wQFOBzful1/i+dPxuAsEZF2CXhQYbw5VUtFjAZQ55UOOdKOtm+BbFemu
	oef2o/6rALdml/RQqd6qLfo2s0iYvVg/siotj0y+ha5AgszxLAyS8ou87yhIylYOOTvV4iPeHEE
	/ALZXbkbyTyolq6A5i0h+a7bpkReE3wiy7UHZSVBwuEjOKXG/Q9QRoc/Duwvej5Nd0SPQvjyDww
	XXqkxdn6bD/iftkyblorXX87acc7sf2fCPsDMYCE/5c6QfeFuvn4hpjyqK7fQJoYGEiSh0UcrU+
	Ha4EElw4pLyKW66Ay3mIOpaEGPKsS2eXQZkVBfv4C9D5zbT2htBMBZkjugsQMxLEr4zEe8Vl8T/
	2tOgbKC9pUhRBjKN1zDTH82x8apBarVm39NE8cDajGmnyXGw5S/IOezQWuUJI7/K9X/TuAxSm1h
	H829n0rtoELkNScJf0LSsFKvQYt1uhhJAGLLtiAgJjaOMdDCMuCF3dtzFzqVGNunb45iyD5bSXG
	Ipr1LgmYLl9gnRC8k6ugHF+PUbJnas=
X-Google-Smtp-Source: AGHT+IFEfxbCJNyep68E2bVjyNh8c2EuIYEHYYBAlmm5IH3Kky8zHTf2A2xL1t44n2dtRKhC5cU2PA==
X-Received: by 2002:a05:7022:924:b0:119:e55a:9beb with SMTP id a92af1059eb24-121721aa33fmr24820417c88.7.1767041113328;
        Mon, 29 Dec 2025 12:45:13 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c23csm118090355c88.9.2025.12.29.12.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 12:45:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] tools/power/x86/intel-speed-select: Use pkg-config for libnl-3.0 detection
Date: Mon, 29 Dec 2025 12:45:06 -0800
Message-ID: <20251229204506.720353-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hardcoded libnl3 include path with pkg-config detection to
improve portability across different distributions and build environments.

The previous implementation used a fixed path constructed from the
compiler's sysroot, which could fail on systems with non-standard
library installations. Now the build system:
- Attempts to detect libnl-3.0 include paths using pkg-config
- Falls back to /usr/include/libnl3 if pkg-config is unavailable
- Maintains backward compatibility with existing build configurations

This ensures the tool builds correctly on a wider range of systems
while preserving existing behavior when pkg-config is not present.

Closes:https://bugzilla.kernel.org/show_bug.cgi?id=220819
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 tools/power/x86/intel-speed-select/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/Makefile b/tools/power/x86/intel-speed-select/Makefile
index 8d3a02a20f3d..6b299aae2ded 100644
--- a/tools/power/x86/intel-speed-select/Makefile
+++ b/tools/power/x86/intel-speed-select/Makefile
@@ -13,7 +13,13 @@ endif
 # Do not use make's built-in rules
 # (this improves performance and avoids hard-to-debug behaviour);
 MAKEFLAGS += -r
-override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include -I$(shell $(CC) -print-sysroot)/usr/include/libnl3
+
+NL3_CFLAGS = $(shell pkg-config --cflags libnl-3.0 2>/dev/null)
+ifeq ($(NL3_CFLAGS),)
+NL3_CFLAGS = -I/usr/include/libnl3
+endif
+
+override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include $(NL3_CFLAGS)
 override LDFLAGS += -lnl-genl-3 -lnl-3
 
 ALL_TARGETS := intel-speed-select
