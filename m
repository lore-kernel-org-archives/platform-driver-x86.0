Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D904A2E1D
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 12:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810687; cv=none; b=Onk8M++3+s3g/mtRh3A5r/Wxvh7QYIGJigl0DAm9+w1Yt8Dbo/LxEj8wPWwFi3ye9O1auL6STexa8YkC70BBnhfDLHgQLuYmxjFLHEN9v9S/rRc0MFNpD+z7HvTxNowwSVvk907kJHME67V/4JFHsgxSX9AVxKIkskukiZJPSsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810687; c=relaxed/simple;
	bh=tRxKuBUnGEzCAHc5mGEOrTp+xK28sbZHQsl00p1HmII=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KEzsBY1ysvVc1gv+L6gcEJivYY59/RxkButyxquktj8NDyh7FSdsDz7Y9c2seg3J8dBiYvnkfEVF51IXBT8V+x7wKLDklCwr7fBbSOqLuKBJL3luzGd//LzqSeByOd3ixDXskD6K9uNa6P3zEUa4OzVj0t74bht4lkMaPWZUnS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=0oKzLQ+9; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="0oKzLQ+9"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so437951a91.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 05:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1784810684; x=1785415484; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sYg6j3DW4KziIe3Zb2Ojd7X/M+Xd8OnGpyYa/ce7ds4=;
        b=0oKzLQ+98ILSn0+PcklOeGxjt8hOMdXDr/LwPTLP0cRtYcsYCE0SUtLRD5dLAcMPhb
         wzU2Runcrrf7aRiB8aIKmQvDQE48xKAm74kaGoVeSXyB21WVD+NaWTp4IN70cCtnVl2S
         3OxHyQ50Gp5OLiQRpr+18O9nOPKJ3anCuzyL/X21oJggRQgym1MFU2oQI84T9P0A3xYR
         4oRAos7x4R/+9YHmP0R2hTi4/IcW+6cqtb5QcX08lWqRL7n4EFnAS4lMfPlHssr+qFyx
         eLmrdehGf5AsGcsVx8tgkmUA2XgzkU5yw6lsMxdp0lnwhwwUjjaSftQ3l1/JVMX83L58
         FaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810684; x=1785415484;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sYg6j3DW4KziIe3Zb2Ojd7X/M+Xd8OnGpyYa/ce7ds4=;
        b=UbPndWNc4hogqb9ohtktnfpsetetV0DoFdB09jWR6U3oNtCeM2KHVJ8Q1os8iPYYZw
         hDxDo3+Vo2Dd5jRpg+BAJfxxSXymAMRdyjRwoPGcG7CiWr1y1/iyqGtFqxrc0NvSpD2G
         ld0iYvbfl+UWPmuAhzNs8MqCX0kHGe1xCmS2EIMZBwHsMXpJShBb6ld35AP7HtY9NCIu
         nvRoOH1lcp4X22EQbhAZ5FCb6vMD0/hur175j0DSAR9X0VNnJG0mJ8KYWSyQ0d/uejbw
         v7vesDsukdtsbRetyvGvbCgFfnEfUmymejcZX3CAtuqknSZ9ymUoTxAhMjW/2q00aATe
         m6dw==
X-Gm-Message-State: AOJu0Yz5N5wbpmQDgp92QySslD7LZHbKzy5xZGe217sO5kzGqJXbUeCi
	pP2ESX+mEng0LCwdeSMbYXCnXjkWrDiRpYDjHHVd+Sl8FIbKMJPrqgXnbN9DA9rsJdRHvSAfs0f
	PNkTOpAo=
X-Gm-Gg: AR+sD12HgErzpYDZYkgXRzMWTaXKxgYSHI5tagUVUT0vNqm16j2vG9XiJ3TBErnNQaL
	CxhWX/KoCpqZXJu0UNmaJS/+AL1Y9LtmrfxLwM7/ud6qwfVjATJErh5e8hTBOsI9RvchFoF4YCZ
	tZHvctz0q42q81KjNnfiHR6ez4w4+WrmTmipOCpllA1aM+aCJfgHch7Cpw7bbLXrOaPlc/cABwm
	OijqTS0hWXrXMCENuN+C6jkQ3nInjtbxcgi7nP/KGC6x9Un3QizERsRaiB327uXgSNaGDG8HPp2
	Arveue+GKt93pPOMO0PdtV7mfZiai52Fl0/D+Q1PQlcqpT9eRPznKrP2hgfWmhszWXfdEGurwrD
	fNEizHGFt9CsBK2pyyAhHwaHbk/UihYlAipxSBSflN/wKwmb0j7oypK/fT1J5Mh2a48Nt4Qgc0e
	/f/j6SirQ45vBgm+WCruToipUQeqBfUCnwcQ4hlt/XyXsCCaSAwOvGz3Po6BCpZPw32Yk0erOix
	BASJWV21JwBUEx+tNGosQqU
X-Received: by 2002:a17:90b:4b8e:b0:38e:4e62:f998 with SMTP id 98e67ed59e1d1-38ec658e6f7mr2841170a91.23.1784810683887;
        Thu, 23 Jul 2026 05:44:43 -0700 (PDT)
Received: from [127.0.1.1] ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-13d1300401fsm21663197c88.3.2026.07.23.05.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:44:43 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Subject: [PATCH v4 0/2] platform/x86: int1092: Fix two bugs in SAR driver
Date: Thu, 23 Jul 2026 18:14:14 +0530
Message-Id: <20260723-platx86-v4-0-93b4a178b595@cse.iitm.ac.in>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ4MYmoC/32OQQqDMBBFr1KybkIm0Wi66j1KFzHGOmBVEgkW8
 e6NUqhQKLOZ/5n3mIUE59EFcjktxLuIAYc+hex8IrY1/cNRrFMmggvFC5B07Mw0l4pWTjmRG2l
 1XZN0PXrX4LybbveUWwzT4F+7OMLWfhz75CJjOpdFBhRoj60x3dUGxxCnJzOWYU82SRQHEHjCS
 q5YWoAX/0F5BL9fR6Cc2lJrqJqGS8N/4HVd331/Wa8VAQAA
To: Shravan Sudhakar <s.shravan@intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Abdun Nihaal <nihaal@cse.iitm.ac.in>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.13.0

The patchset includes two fixes for
- a potential memory leak in sar_probe()
- an information leak in parse_package()

Both patches are compile tested only.

v2->v3:
- Converted into a patch set with two patches
v3->v4:
- Updated commit message of the info leak patch to include the path in
  which kernel memory leaks.

Link to v1: https://patchwork.kernel.org/project/platform-driver-x86/patch/20260707070524.953741-1-nihaal@cse.iitm.ac.in/
Link to v2: https://patchwork.kernel.org/project/platform-driver-x86/patch/20260710052806.100107-1-nihaal@cse.iitm.ac.in/
Link to v3: https://patchwork.kernel.org/project/platform-driver-x86/cover/20260713-platx86-v1-0-c8991bff03a0@cse.iitm.ac.in/

Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Abdun Nihaal (2):
      platform/x86: int1092: Fix potential memory leak in sar_probe()
      platform/x86: int1092: Fix info leak in parse_package()

 drivers/platform/x86/intel/int1092/intel_sar.c | 32 ++++++++------------------
 1 file changed, 10 insertions(+), 22 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260713-platx86-be6e25a3c9dd

Best regards,
-- 
Abdun Nihaal <nihaal@cse.iitm.ac.in>

