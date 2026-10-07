Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B804453A50;
	Wed,  7 Oct 2026 08:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791360185; cv=none; b=jUUCqmXn4EAHwlUYvTVkffkUBDa0bxWYDWGdqIEv66JeakeoAQP/91UEgKRh6wBUYQdFUtAjtoaXuFSsirSM9Svz97nlL5YCtKc1ROYEdK7hRjYMzazzwA+QfWU9Qd7mUR7DwBQHUl4271d0lunxP1DGwdiGd8XMN7Iyo0H2j9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791360185; c=relaxed/simple;
	bh=VJFZF7JNLiTMZm617JKzfV+2t8GZqIv7Myy71v21++k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZDtVIUmYHDB2q++fsDTHGNArt0pJN6Edcsyn5g6kwFve97jQqkpG8Pi+GROTajXdOIZ9wn3Uni/wE2HVWI7FX/iUCHhvgiN7GunhcT8/D9UFif6wxXTtIkWkOtSfgO7b/VckJIwV8EQQsXaUx4Jvo/+kz92IcKnD9TZa2U2nF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Ga8b7hKY; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Ga8b7hKY"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id D99062FC0094;
	Wed,  7 Oct 2026 10:02:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1791360139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rZHz+iYSEDgoj5vNUBCyiRItXx7sxcNTXk9538aSITA=;
	b=Ga8b7hKYzeFTtYV7AyFYCk5jP/sKWWo9zRYW5U8UtMGWunDjE3e4ugxDIvvTK4b8LCJJ6i
	ZNlknJPUqrJ2CJuWFvTxeLJnr9TyPh1W9egAKOTLN/dwnd5/qpRQ/CDFde9lDKT5jsQlcQ
	eUNTkRTEjXlUX21T0/bl2kXDlp6GNCI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: Werner Sembach <wse@tuxedocomputers.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/6] MAINTAINERS: Add Aaron Erhardt as maintainer of TUXEDO DRIVERS
Date: Wed,  7 Oct 2026 10:01:52 +0200
Message-ID: <20261007080202.81694-7-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007080202.81694-1-aer@tuxedocomputers.com>
References: <20261007080202.81694-1-aer@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm actively working on this driver as part of my responsibilities now.

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 140eafcbbd78..7b43a6e66d5c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27870,6 +27870,7 @@ F:	tools/testing/selftests/turbostat/
 
 TUXEDO DRIVERS
 M:	Werner Sembach <wse@tuxedocomputers.com>
+M:	Aaron Erhardt <aer@tuxedocomputers.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
 F:	drivers/platform/x86/tuxedo/
-- 
2.43.0

