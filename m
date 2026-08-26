Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCF93B840B;
	Wed, 26 Aug 2026 08:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787731941; cv=none; b=UwuZL8iDt8OHShe0MgwuYPV9mDlRLR/D5HcpI+EK5ijG3H8/tOAngmPr5hhGTm21cKl0f2r4cqccTiWJX5CdCylQUnP0vq5Q60D6upSUPE4xFXKpZb1Vr3GenikZEsZoXJALMxYaXpd1Mp/ohzxQy3y5IsmTTxOXMl0HlrjeRz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787731941; c=relaxed/simple;
	bh=kiJc08/ov4Yk8nGFGPrn7wOVdYHPD+TCu1tooLBHak4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZecAXQSg4nRJb/N9orugrzzFKOxX/ABC6tnTD4Ave9/zzBg6TmL6gRyQ905z/PdMj2u0wckqCFaRC02LvMP869v1NygXOp8tQjdWp70dyoh1BYP0R7B+K/R3CNa56k6nXaXhUlIEWATbY4rsuC/tM/SdZ36fDqc2xLzk8/7dRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=UQ1dRN2K; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="UQ1dRN2K"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 866892FC0071;
	Wed, 26 Aug 2026 10:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1787731923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=83IT5MCSN60iD6rl4rvPX5fX4gsvm+HqQUc9KBkXmmo=;
	b=UQ1dRN2KWjXn8Ovd+wcFREtzY5Y2175p4E1DnZFId4K2QXzxBPddg/gE99/hRPj5gtRKLX
	Z+pz0QLF8Q4dQAgBKfnXSn7hR4MTjraIFSARB1oAWuX8fZDUmvFmtzr+vkz7JB5OWXVTNb
	ek/phAslXnHoZUzSfPdQCRAcg7omPX8=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: wse@tuxedocomputers.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 6/6] MAINTAINERS: Add Aaron Erhardt as maintainer of TUXEDO DRIVERS
Date: Wed, 26 Aug 2026 10:11:32 +0200
Message-ID: <20260826081149.235487-7-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826081149.235487-1-aer@tuxedocomputers.com>
References: <20260826081149.235487-1-aer@tuxedocomputers.com>
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

