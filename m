Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63A37DA66;
	Wed, 25 Mar 2026 22:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478310; cv=none; b=UPihiJm+GyxmBpcSDyZ3ooTq4sH376iCXZ8eY5Zm1mDZ1IdXMQpM9ywoXmjnr9mCBCR1tg904xtXO2+AjKWSWOEyftBL6gd33zsbcZfunpL5o/+FAK/zg8sF3Aq6uyPnv1zv4S/0ly2vSh95amzLdDl+K9APB8EWJuf1FPBkiNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478310; c=relaxed/simple;
	bh=wzHz3Yytm1aMIYF3Y96GILe1IYSVvSsY42e5/rpIUe8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tpA1RpYeXpX9xyNzBBMSbqyfiCzVxvHptwsAeyaNDM7Y4Mofj8JGvNNzIRxXoh4EBsrglnfX8uoV+6s/Hgy/6PS67C5JA5MlbUvHse8rJFqgMBcPkMxuGVIwJixdEyOryTncKy+5vsMOSmOPaNgEeUxzrJfqITLl5JSKzhMzbR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=ueIakEIs; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="ueIakEIs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qPjNBKhiFVOzRQG+DO4T21lka5BKdlXOpT3waxfc2oQ=; b=ueIakEIsptWnA+p785XE3RZV1f
	VKaJwsR9pknK0ERs3e8OhZrr5bcK1ONbWwWNm1a9Q7RyMjShTYAOxM3GG31dFxwcEwKZKdn5GQrcO
	ZETrgr9LYwgu7xsdGabWUdEQqcRmWbTIZzvI0D7OEYu3QdxsLkkSA8sL+gM2rjwTGwew=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w5Wrn-0065Yg-0O;
	Wed, 25 Mar 2026 23:38:23 +0100
From: Marco Nenciarini <mnencia@kcore.it>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v3 0/2] platform/x86: int3472: Add support for strobe LED (GPIO type 0x02)
Date: Wed, 25 Mar 2026 23:38:21 +0100
Message-Id: <cover.1774477895.git.mnencia@kcore.it>
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

This series first renames the privacy LED code to generic LED naming,
then adds strobe support with an enum-driven switch that controls both
the LED name and whether a lookup is registered.

Changes in v3:
- Split into 2 patches as requested by Andy Shevchenko
- Patch 1/2: pure rename of pled to led (no functional change)
- Patch 2/2: add strobe type with enum, convert single LED member to
  array to support devices with both privacy and strobe GPIOs

Marco Nenciarini (2):
  platform/x86: int3472: Rename pled to led in LED registration code
  platform/x86: int3472: Add support for GPIO type 0x02 (strobe LED)

 drivers/platform/x86/intel/int3472/discrete.c | 18 ++++-
 drivers/platform/x86/intel/int3472/led.c      | 79 +++++++++++++------
 include/linux/platform_data/x86/int3472.h     | 19 ++++-
 3 files changed, 84 insertions(+), 32 deletions(-)

-- 
2.47.3

