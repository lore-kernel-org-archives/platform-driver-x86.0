Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3056E48BD5B;
	Mon, 28 Sep 2026 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585721; cv=none; b=HpB/I69yVJSO5y5rvrrcFV7sNgvEjCFdWODbyQEUEUWxDvpfQo0uUzyHXAhw39Sq7FkFnktoaZPFUurvzAPnCYpAksvOGm6NCnElR9jHuIRVTc7kPiVdWUuMTF2oiaU9wl+zTIcmWNSaT5zCQ42/AYIyrYJtaSFMx5HCRJ/263s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585721; c=relaxed/simple;
	bh=hIw61PFq3dzKVHTrJ30vyZLyvRrnwPMch3Qee0g2WLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CrcgQVOE4dMQTM4zLEJfSYEosed69RNGt80I5zIbpntD1AoXQtoTrF7w8IvEcJl37Yzqjq4acaSU1YaQICjo19ZkVfcuyJQYm0PbDHW3on4wMbfRwpDdr/KxQx2Jo/2CeJ5xEQo4jkpmlQstRFSZ+d7NE8YeYk4WylmDx1+YRdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=M6ns+uHE; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="M6ns+uHE"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 179F62FC006C;
	Mon, 28 Sep 2026 10:55:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1790585708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5YTKPjaWDDlBot4o/hI1VbFeXTj8BO3SZVu4wvAzUVc=;
	b=M6ns+uHE0UpNrosEXFY1F6j8ITPWhHXGqvFOYrwzzaWTmLdXgU0Ujk6KhC7ygx9BuP2vLC
	92Q4ibDaYYnCvN0+H4RAdZrnx7cMVuag0dHROr5QYIxKR+b772BzJ6HlycuR0+iwVen0cO
	opSlNabR1f3x2VPB6v1t0q44zSvexKA=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: Werner Sembach <wse@tuxedocomputers.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] MAINTAINERS: Add Aaron Erhardt as maintainer of TUXEDO DRIVERS
Date: Mon, 28 Sep 2026 10:36:31 +0200
Message-ID: <20260928085448.9024-7-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928085448.9024-1-aer@tuxedocomputers.com>
References: <20260928085448.9024-1-aer@tuxedocomputers.com>
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

