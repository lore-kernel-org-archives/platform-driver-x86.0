Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D6D43785C;
	Tue, 28 Jul 2026 12:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241676; cv=none; b=Gzk5UUhcmTvfHQYb31miMfLgK3bhGjDHe2rUmIvgSRzdCj3hGI38cSCsbnWIeVjoxEmAA8RdkIFKYOokRf4GqYKdnhKbD5S2clJ7sBF1nf+yDVx/OtJUKOsSJI/J+KlQ+DqExJUBoUz4taolI1hVFxvx1jaR/IrK2+fRomMt3NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241676; c=relaxed/simple;
	bh=kiJc08/ov4Yk8nGFGPrn7wOVdYHPD+TCu1tooLBHak4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBN/dRMQs/JfbJLqxJSMJXSYhVcKsOdox42O+oUGnvLUzpJki2+lf0kfvRDj+0/tWb8acbVQHM/RKRSztPr43P1f7T0BgvfxIlybIYqxqluYbv00l1FPED9313Y8TU+Ut9fUfxinlV10jDQsLmh0DIitW16NgZM5d8K7j7PhrAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=CS4uyD2S; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="CS4uyD2S"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id A9E8C2FC007E;
	Tue, 28 Jul 2026 14:27:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1785241665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=83IT5MCSN60iD6rl4rvPX5fX4gsvm+HqQUc9KBkXmmo=;
	b=CS4uyD2SZaTqsjnfzJ3f7RSh+8XYKVnnGrhxdjnnjrBuuJ17o1zp1jFTz7BbHaTCe+TEtO
	ZVuu3Y2gi7aC4Jbo1JdOKE8x8WEGBBjGvyAgk6FIAm6MyfffjNKMC10OhXkDLDTiTiDL89
	M2wgRNmZ1aQE76DQWku750o61/ftCDA=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: wse@tuxedocomputers.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 6/6] MAINTAINERS: Add Aaron Erhardt as maintainer of TUXEDO DRIVERS
Date: Tue, 28 Jul 2026 14:26:38 +0200
Message-ID: <20260728122647.132540-7-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728122647.132540-1-aer@tuxedocomputers.com>
References: <20260728122647.132540-1-aer@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm actively working on this driver as part of my responsibilities now.

Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a674e36529f7..792eb26722b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27551,6 +27551,7 @@ F:	tools/testing/selftests/turbostat/
 
 TUXEDO DRIVERS
 M:	Werner Sembach <wse@tuxedocomputers.com>
+M:	Aaron Erhardt <aer@tuxedocomputers.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
 F:	drivers/platform/x86/tuxedo/
-- 
2.43.0

