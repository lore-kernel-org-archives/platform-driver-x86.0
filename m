Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB0835B65D;
	Wed,  1 Apr 2026 20:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075807; cv=none; b=sPwxGbqPzf04mH3FDURlxOOqcIuw/kKyvgmrFjbEiEVvmg4EJFHRZNPUg6NYeLml4ZiRuKywtQR9bHfF969SJa36CUOkT+EgxFTzbSWSoNcQNN+ldI9y1BGYj46NCo0htanRarb8sexosUOGQqqzhg182dU+JtSxr0jglGmzps4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075807; c=relaxed/simple;
	bh=GBtdQpMmUibctj1sKnApjYdnB2SpVRiDhQWGkrxn50k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HRui7b3KiGA7KM3qQD4S92PvrLIx/rz4k3CIBEzh3emYkJ6EsE/81i5Hh93x2Q3CPHgl8MulY0zVdaxD4fiHA15ep9WOaWGUX+kyXQHR+t4/3y2A/q2pipDv3KUFPws6hNAqRDJpf27sn/AHoceWOUWrnwCLPNDSR1nUwaQ1qhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=VRzmxpr8; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="VRzmxpr8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=w6XiUFUXQNYmllLF4nsYdItmM3XGDOB6pBXkrDozHP4=; b=VRzmxpr8YeQYdIsZ/j1ygd+o1j
	R8LsoXLFNF9mSATMK2SDFIBeOpWQQ9kaHEl21Ew3Co2e2Pb8ANQfZFmdAlhaUYELyB7pwC6wziicl
	ykLJievtaYhJCTp/f4QFj9YMdO09xi8ktYV/osa/Glw92OUZnpHgDGNOAQGDpdd9p2Gk=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w82Io-006ifL-1v;
	Wed, 01 Apr 2026 22:36:38 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v8 0/4] platform/x86: int3472: Add support for GPIO type 0x02 (IR flood LED)
Date: Wed,  1 Apr 2026 22:36:34 +0200
Message-Id: <20260401203638.1601661-1-mnencia@kcore.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for INT3472 GPIO type 0x02 which controls an IR flood LED
used for face authentication on some laptops (e.g. Dell Pro Max 16
Premium). Without this, the kernel logs "GPIO type 0x02 unknown; the
sensor may not work" and IR sensors paired with a flood LED cannot
function.

The series first refactors the existing LED code (patches 1-3), then
adds the new IR flood LED type with multi-LED support (patch 4).

Changes in v8:
- Always register the LED lookup for ir_flood too, removing the type
  parameter and conditional switch-case from patch 4
  (Hans de Goede, Andy Shevchenko)

Marco Nenciarini (4):
  platform/x86: int3472: Use local variable for LED struct access
  platform/x86: int3472: Rename pled to led in LED registration code
  platform/x86: int3472: Parameterize LED con_id in registration
  platform/x86: int3472: Add support for GPIO type 0x02 (IR flood LED)

 drivers/platform/x86/intel/int3472/discrete.c | 13 ++++-
 drivers/platform/x86/intel/int3472/led.c      | 55 ++++++++++---------
 include/linux/platform_data/x86/int3472.h     | 12 ++--
 3 files changed, 47 insertions(+), 33 deletions(-)

-- 
2.47.3

