Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7502620E023
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jul 2026 06:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785047882; cv=none; b=Yy860wP+jodqy755lTeQheeUOCK4TmVwlWxVTpXDe9ecBbVh7yt2Iwr9BZXO+Q6LuZNdDCp2WOI3Vrw8AKD08N1B5/660UwQ8/TkURbYf258iI94L1T3jsc6/1eJRQlSe1drRBew6qWACy9vREQtaBcwidpBpIdxdZfc2E2Megc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785047882; c=relaxed/simple;
	bh=I1v8vjKqu1avUy9O2NCAZNSasSsEJ1XnBVAQUWqInYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GZxFzVqkgXbkVAcdVJPdLiIbenSW9gT7macoMCtqNYfQ+R1rZ04vZdP6BXukS4wffK1L/yClFb0kb2NKn0wiV/qcGalUBO69NLbqqKXhfNUMM3ri4xdL1EVPH0PF3TZvQ74t+XIG1vcHWm68FrMG3ip3HHRHg3xfP1555GP6KpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSzIAmVO; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSzIAmVO"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caed617615so17739545ad.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 Jul 2026 23:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785047879; x=1785652679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mC6vOEunikcXdi1fUA13go/afawaKQ7pjItviCghtw=;
        b=OSzIAmVO42TMv6feZzRTeXehi0ijnKoXimVg70UPEo8+G9vHDTJT1OcWMlKtbCD8Wu
         HcCSi1pc0BhzyufvzTA3DQbKcwHEGzL4/q7cEZ8nfcBjHbt1Q7ZAQpSvkUL9pjBVoaxm
         TkvNpxQnjbbHgMPxSE/qbm0Y7zhWr96Y/hYa5qN2/XKSH1dsUqtgxU1TS5mNIFsPKwvG
         mOEZlIj+duZFlI+WL1iUjQniX4DYkyKogCtcY/PWPAplSJ0/wdW/mUrHAFYnWcw+EtGE
         EKu82bbtHTIpuhyGYi2/bpzxaKVptCSTTIpkTBB7at/TTmu/TSx1sULZTd+rXdYsTKOf
         qpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785047879; x=1785652679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mC6vOEunikcXdi1fUA13go/afawaKQ7pjItviCghtw=;
        b=TnFNxzTP+doPRpcOlyTyDW+fLN4bdfX2UDop5kwG+BW6vqzyzmwvz9SAEReeCORFDk
         M5aCXRing4l0SUnIEDBM7Avl3zv+lDxUsGymrACD+Mfw6JK0wfEq0iX9yL2bAyTwzhKE
         AqWeRynB8HumUoJBBH21Sz6JZn2hKt2Ankm/5X2lwIsI7gXhiy8RNSjb9CP+9ywazbMi
         mm1K1p4RLj21OCYJyrueDk6DexLKJysv6hmBb7K9Q3rhUEh+xPiwDxQZ44TyUHT+58CW
         ZZensLEINaif9MiEzoWWx71r+HO/GjMVp7EKhhdzK1pzXIwtMCS2/bn69XQk3EKXGiAm
         1MnA==
X-Gm-Message-State: AOJu0YzqSxDLDs5VvzjefpAUrEN+g29NwU4LpS4ppwgMPFNvLy+MI7WJ
	8YRKdruFCiW128JK6EUXdq2u+EMVdmrES2Ea96OIhQ+L16i/5qvEchlN
X-Gm-Gg: AR+sD11TpzKTd1SP0Y67d0DTHyH6icQMtjqwfS75o1OZ7UqaC74jZhRy4QOJJ6AzKJq
	YnvpBMNjoYTle6gj29uGeDlhGc82y2OLY+BqgzxYb86Ho9VFSvXnBETkcMc7wBjyCXQA4kIlXDO
	jzKazi7oqPT/ij5REGi+Uerb2jLv1vpzBVz81xZamoeeDAzIhsDbkkUwifnV/AX9rmNx7qz/Mx2
	EruDtg2QGL+Ncqeoj/GoJq1dZ9y/9ZLEVDW8TOBvH6h0NL9+hRUQ1H/OA2NZsVvUtEdtGSZ3Gwy
	BNS4aGealzbG6dF3OnyPtvPKRwoHqC+fEItOXCMXMk8JjRggtO0Ow7dqM/P4DIeOYFMHiFaQbrR
	5rhQ2VwRp49JZDScxKdnbkuvqPU/O+rC1ulEiN5MevIfqKWECFP58a/EAqRcV2J2ifA9bxanCxm
	nPHWDyCuOlEr99UmVcv8wHLGfiS4+2xAqCcYj6DV8qGA==
X-Received: by 2002:a17:903:2f90:b0:2c9:d539:61e7 with SMTP id d9443c01a7336-2cfde7be3f8mr37462505ad.19.1785047879354;
        Sat, 25 Jul 2026 23:37:59 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e86ccsm16948035ad.33.2026.07.25.23.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 23:37:58 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: "David E . Box" <david.e.box@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/ABI: intel_pmt: fix 'threashold' spelling
Date: Sun, 26 Jul 2026 12:07:34 +0530
Message-ID: <20260726063734.19944-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling error reported by codespell: threashold -> threshold.
No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-intel_pmt-features | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-intel_pmt-features b/Documentation/ABI/testing/sysfs-class-intel_pmt-features
index cddb30e5bdf6..476ba070fb1e 100644
--- a/Documentation/ABI/testing/sysfs-class-intel_pmt-features
+++ b/Documentation/ABI/testing/sysfs-class-intel_pmt-features
@@ -121,7 +121,7 @@ Example 'caps' content for the 'tracing' feature:
 	watcher                                  Available: Yes
 	crashlog                                 Available: No
 	streaming                                Available: No
-	threashold                               Available: No
+	threshold                               Available: No
 	window                                   Available: No
 	config                                   Available: Yes
 	tracing                                  Available: No
-- 
2.43.0

