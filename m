Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9292D0C99
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Jan 2026 18:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768586819; cv=none; b=ult2WVl5CapV3KFREnSQhXqO7lHAhC77gxkclEpl2CcVsL6HK/1rpmrDfmK2DDYBWiBZ83kQRh40A2Z3PnLw3nEh4hmNcWqg1iA1AwncE6HvwVijGHUDAf3zi0Axs9vWMj+/bqJKIs7dfveegoWkS4oV98AAfRYyG1WyJsU1Yck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768586819; c=relaxed/simple;
	bh=Q1a99s43dlrKlYws5CRxUbb9R3p3bB7fqFwE9/krFfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Af33U+afmaBZDFTFNLZ1UcfaSFvCK1DK9XJ3fEmNGQYoGy5/Clp1iOcI5nBp1jGByxjVZ+ScSY1omUlOs/IKF/Y9yk3AXZlMmftR4psONl/VqlHNRWE41EDhzj38I0jngNe6fbFE06vnJnw/TVKtlk/ZPcdPmd6jC+LxnQcQ1R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bD6jWU6+; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bD6jWU6+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768586806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tt7Yt17IyvNpXmysqoMiuBVnN6C80QLKqa+lC4xdK20=;
	b=bD6jWU6+NAh4+nRgqtAL3FEFDgAuSfkUTtsyldrrpHRybHSw2OVFtqhxURZSCqwTDheaQE
	FXPHedkxRxrwVhoMhPiL6YCQWTTqsOyw0UuWTni1OgqrpvTuuVTZ01OM+gPpOML4+2s985
	3PcojHR2e40Ix2Nq/u26G+cTw7NZnJk=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 0/4] platform/x86: asus-armoury: ppt fixes and new models
Date: Fri, 16 Jan 2026 19:06:33 +0100
Message-ID: <20260116180637.859803-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

this patch series includes some fixes to the PPT data table and adds
support for two new models: G835L and GA403WW.

Cheers,
Denis

Denis Benato (4):
  platform/x86: asus-armoury: fix ppt data for FA608UM
  platform/x86: asus-armoury: add support for G835L
  platform/x86: asus-armoury: keep the list ordered alphabetically
  platform/x86: asus-armoury: add support for GA403WW

 drivers/platform/x86/asus-armoury.h | 73 ++++++++++++++++++++++++++---
 1 file changed, 67 insertions(+), 6 deletions(-)

-- 
2.52.0

