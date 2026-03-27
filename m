Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64365373BE6;
	Fri, 27 Mar 2026 18:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635038; cv=none; b=DsskCZdqVzl/WY64AtBcERJ5rmGFABbef34Ar4NYQeSOoPFIo2KpKIkj6vGWvMwr3vPCN1iojav2zMCTVH9qnE5+jEi4UrMuGgF2McG3y60iTntxX29O95fHQEjBJyoDs8MEd3ueGfSpqKsVjpBQ3l8kKfSdr41QtC9kofgNEwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635038; c=relaxed/simple;
	bh=OtxuliKg65ZQawPFAi1ILSiHk+7evyca6z3kwEVoYVY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r6VQ/x+Q4ZDEUvClv4GxMEfv+NDyxLgQLktPY1OY0HoEEYZruRygOb2ltexvzo+bXb/VWt3SvThmFFg12giHYuexe2NFT9ITZuW2B+BP+pgr2spdDvAkYa9QAHj8JfeWd0sFFeGkoLEbKhxyte5Olq/GhONCYmmJil1hKN3VTrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=vUqjNEeK; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="vUqjNEeK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+4SlzgGk948xO+qnCKm5tsehcQ4M4+GLzagQYnDTZsI=; b=vUqjNEeKraZBFXD+uvsZxe8Fic
	AesGe2E3idEODomUvea88c1YDsXrsBy8neEAb6WiGy2FWa+3/fGpvEfDL3S6AvPS3k5fK+aPvzyzD
	ZHIo+QseVMFkp3aVvHEvTYV+DKFmrJUQ+eK3zclEGO9Rq4kAnbvl3c2S6JdjenH/y0lY=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w6Bdf-006FS7-2P;
	Fri, 27 Mar 2026 19:10:31 +0100
From: Marco Nenciarini <mnencia@kcore.it>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v5 0/4] platform/x86: int3472: Add support for GPIO type 0x02 (strobe)
Date: Fri, 27 Mar 2026 19:10:27 +0100
Message-Id: <20260327181031.1489365-1-mnencia@kcore.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <ab0URIrzZPsYjWrM@spark.kcore.it>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for INT3472 GPIO type 0x02 which controls an IR strobe LED
used for face authentication on some laptops (e.g. Dell Pro Max 16
Premium). Without this, the kernel logs "GPIO type 0x02 unknown; the
sensor may not work" and IR sensors paired with a strobe LED cannot
function.

The series first refactors the existing LED code (patches 1-3), then
adds the new strobe LED type with multi-LED support (patch 4).

Changes in v5:
- Swapped patches 1 and 2: local variable refactor first (on pled
  names), then rename, per Andy's suggestion to reduce churn
- Dropped enum and lookup tables in favor of simple function parameters
  (string name + bool has_lookup), per Andy's review
- Multi-LED infrastructure (array, counter, has_lookup) only introduced
  in patch 4 where it is actually needed
- container_of targets struct int3472_led directly (single line)
- Used C99 for-loop variable declaration in unregister loop
- Renamed LED from ir_flood (v1-v2) to strobe (v3+) to match the GPIO
  type name in ACPI _DSM tables and align with common camera
  terminology for IR illuminators. This rename happened in v3 but was
  not documented in the changelog until now.

Marco Nenciarini (4):
  platform/x86: int3472: Use local variable for LED struct access
  platform/x86: int3472: Rename pled to led in LED registration code
  platform/x86: int3472: Parameterize LED name in registration
  platform/x86: int3472: Add support for GPIO type 0x02 (strobe)

 drivers/platform/x86/intel/int3472/discrete.c | 16 ++++-
 drivers/platform/x86/intel/int3472/led.c      | 61 +++++++++++--------
 include/linux/platform_data/x86/int3472.h     | 14 +++--
 3 files changed, 59 insertions(+), 32 deletions(-)

-- 
2.47.3

