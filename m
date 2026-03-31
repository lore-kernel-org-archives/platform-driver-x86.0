Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344ED3C6616;
	Tue, 31 Mar 2026 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943531; cv=none; b=EUoSju1uW7sx2IloIHF+g5lJX1w/rBvXhn5wnqfC7EzhMEr7YCww605RpD2Upa0mrJoR+nXEsOooLWWp6nWSEMPn4EURWpuPDsFnva2ZxQapz+tU/ovvJiQcriQWZC4P58xnqgCZxr2YbCSwnSwXxlvRBfnRDgVIw5a4HEJqx14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943531; c=relaxed/simple;
	bh=3hJdARBALGNPFH1jbJyI1zcug/jU4KlbArNoLwq3eAE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IjpzVleDCzLiOG+OxrAicKlyL9MQeNrYy9eYw3j5DxHqERSzxur8AyidWRAePpkqNl+0wQD4sfCZbNaKenjmlilR3V/qnlHTjPoczKoUuniTG8t1yS46c95hq5mbRWlAcMvF08xZWx3EL3EL5UiWAWyHKQcIAW9RSgBJ9hW4Kgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=sEIsb3Pw; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="sEIsb3Pw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BYHOFqHDp1APbfiaMrbjy2TqDEKZ/vCoIf6vnII6pR8=; b=sEIsb3PwISDmhJJYeWNM6kM4aZ
	0clKp7I2jSbo0GKbqsYqhYgpkBXnMMGtbJF1Qk/PAFO8Bsa77DD7fPSIYlHbydzRjbqd6jTY92hkn
	lVCGa/uVu1dIAit8sL7/hbkQTRWMOHeOmpwxzgVdqbXKTsvdawVMQxukWDkK5jNM7d3U=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w7TtN-006ZoM-01;
	Tue, 31 Mar 2026 09:52:05 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v6 0/4] platform/x86: int3472: Add support for GPIO type 0x02 (IR flood LED)
Date: Tue, 31 Mar 2026 09:52:00 +0200
Message-Id: <20260331075204.1567624-1-mnencia@kcore.it>
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

Add support for INT3472 GPIO type 0x02 which controls an IR flood LED
used for face authentication on some laptops (e.g. Dell Pro Max 16
Premium). Without this, the kernel logs "GPIO type 0x02 unknown; the
sensor may not work" and IR sensors paired with a flood LED cannot
function.

The series first refactors the existing LED code (patches 1-3), then
adds the new IR flood LED type with multi-LED support (patch 4).

Changes in v6:
- Renamed LED from "strobe" back to "ir_flood" to describe what the
  hardware actually does, per Hans de Goede's review. The internal
  define INT3472_GPIO_TYPE_STROBE is kept to match the ACPI _DSM name.
- Used local `led` variable from patch 1 (was `pled`, now `led`
  throughout), per Andy's suggestion to reduce churn
- Renamed function parameter from `name` to `con_id` in patch 3
- Replaced `has_lookup` bool with INIT_LIST_HEAD/list_empty check and
  renamed parameter to `add_lookup` in patch 4, per Andy's review
- Added #include <linux/list.h> in patch 4

Marco Nenciarini (4):
  platform/x86: int3472: Use local variable for LED struct access
  platform/x86: int3472: Rename pled to led in LED registration code
  platform/x86: int3472: Parameterize LED con_id in registration
  platform/x86: int3472: Add support for GPIO type 0x02 (IR flood LED)

 drivers/platform/x86/intel/int3472/discrete.c | 16 ++++-
 drivers/platform/x86/intel/int3472/led.c      | 62 +++++++++++--------
 include/linux/platform_data/x86/int3472.h     | 13 ++--
 3 files changed, 59 insertions(+), 32 deletions(-)

-- 
2.47.3

