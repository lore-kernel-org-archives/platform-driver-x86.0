Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0083932DD;
	Fri, 27 Mar 2026 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602486; cv=none; b=hNYM8xQWD3S7OVMyMQmJnbANlZV9JJo6Iqq2Xpa5ege1ZnEYgu5b5iSk1ieUjEGyHGPC2SqdUC0y22vh4ebbiV5WWADtT2Q5YJKeoUbyV9kyUIaRYQHA52w1oSQQi4vIPkGEpxwwCpnt48QL+IR08c1i1op0G22FEsNrazmL0FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602486; c=relaxed/simple;
	bh=l9eeYpdKjKQUcple291FGSAAB3hXlOQYrTT+WSccv6M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O+ZrvBWADjRA7VZ54Zp4h/FO8yJo2c8LzJGVZeXBxBrzSDo4GfOGSsbRdsuI3k0FRwOplKr7nkyhfcCo71CZyadEUG4fJHJvYdkyaGEvrnGtM93Yx2zxKXVvF3AA0VQ9HMMbXpotH47OTB3RCZy96i+CbLMlHBXAeinZMV3fWMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=e4XvFQve; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="e4XvFQve"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=m6oVlXd6lifRpdr/e7P+g2k3W1ks5deQG4Dpuux+ATg=; b=e4XvFQveFtO656w8iaQFRwP1eZ
	fgJt1YuJoYRm5yjLKIteUvBmI+RMnuF/zmJN907RLCtiGVzjr8VgSQqAvJVz1/JLmfKELWaKvsATD
	wrUyM0b9CmpzOZMF2wP8pjQKinysP3bHM+zcwl8xJG227SQ0rYDPUFg2MUr/KiKAHJZ8=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w63AX-006DOV-2f;
	Fri, 27 Mar 2026 10:07:53 +0100
From: Marco Nenciarini <mnencia@kcore.it>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v4 0/4] platform/x86: int3472: Add support for strobe LED (GPIO type 0x02)
Date: Fri, 27 Mar 2026 10:07:49 +0100
Message-Id: <20260327090753.1481453-1-mnencia@kcore.it>
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

Some ACPI INT3472 devices include a GPIO with DSM type 0x02, used for
IR flood (strobe) illumination, which is currently unhandled.

This series incrementally refactors the LED code and then adds strobe
support:

  1/4: Rename pled to led (pure rename, no functional change)
  2/4: Introduce local variable for LED struct access
  3/4: Add LED type enum, lookup tables, and multi-LED support
  4/4: Add strobe LED type (GPIO 0x02)

Changes in v4:
- Split into 4 patches as requested by Ilpo Jarvinen and Andy
  Shevchenko (v3 was 2 patches)
- Patch 2/4: new patch extracting local variable refactor
- Patch 3/4: new patch for enum/multi-LED infrastructure
- Replaced switch-case with lookup tables for LED names and con_ids
  as suggested by Andy Shevchenko

Changes in v3:
- Split into 2 patches as requested by Andy Shevchenko
- Patch 1/2: pure rename of pled to led (no functional change)
- Patch 2/2: add strobe type with enum, convert single LED member to
  array to support devices with both privacy and strobe GPIOs

Marco Nenciarini (4):
  platform/x86: int3472: Rename pled to led in LED registration code
  platform/x86: int3472: Use local variable for LED struct access
  platform/x86: int3472: Introduce LED type enum and multi-LED support
  platform/x86: int3472: Add support for GPIO type 0x02 (strobe LED)

 drivers/platform/x86/intel/int3472/discrete.c | 20 ++++-
 drivers/platform/x86/intel/int3472/led.c      | 76 ++++++++++++-------
 include/linux/platform_data/x86/int3472.h     | 19 ++++-
 3 files changed, 82 insertions(+), 33 deletions(-)

-- 
2.47.3

