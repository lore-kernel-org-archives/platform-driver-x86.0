Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C60F21C9E3
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753454693; cv=none; b=PGwElZHMFBBRNXaQlpaTeRIfOKXAzhlYEDGG1kLIPa6xTF6UoiYLoRqGSYdqP0y1vcBTzauddLWa5KuJ1SNxdcotejhVkJExSyL0Q3CYHhl0NPdgFT5EfjMWcPzendsiOLqf1x/MeRfDfxcGKRAJabp9t71nHkr1p4EbINCnPmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753454693; c=relaxed/simple;
	bh=TgxDepDfxd/h4YY6H5CC8dLeDzYpCoVm6Sm5lWBW5Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q8iwGm2OwcL5HfT+DMDvXTZEszWZ4OOMgboKbQcQn3p1vzyY5pZYQhY1fg4yu92v1ITq0tnBriRPgb5yYKsKFufQCu6bZ0qxcU/L0ADrBfbutTi8FSxkpuAtkzjeq23zatNoOAQEjApX/BEP2aWdX0/oT7r72T+zjhqv2Nk9qv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BsMcrW8i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BsMcrW8i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D77C4CEE7;
	Fri, 25 Jul 2025 14:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753454692;
	bh=TgxDepDfxd/h4YY6H5CC8dLeDzYpCoVm6Sm5lWBW5Mg=;
	h=From:To:Cc:Subject:Date:From;
	b=BsMcrW8iT3JCGwDktVDfAXrpXxj4Cz8JleNkqjTEPkV/EAt6A54dBT8GdZolmF7JB
	 Thd8VxJC8Z8wScHT/tMAmXm8Z7eDxoO6+ObySNEgTPG93la13MyxZqGTbgIyHdjJL3
	 0/GFGqymYfi17SEf/rWmdCINkZpav9kcdSQ0hgAfoAFToHKXNVe4B5PdpbuzxhvBve
	 8Bxwlj8PeYXYDowBYoQW98gP0HUJYgXx5Nf5VcrnCoQU0rddhL+45RDMEZqZUjfJgV
	 wN60dPVOKQcc7BzY5YncOYxxD0fKJGP6ImvXOybYrK2guY8lsN/B8/tnYNvGesqsOW
	 9u5bcgAjM0tZw==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 0/2] platform/x86: int3472: Increase ov08x40 handshake GPIO delay to 45 ms
Date: Fri, 25 Jul 2025 16:44:42 +0200
Message-ID: <20250725144444.210043-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

These 2 patches together fix ov08x40 based cameras not working on several
HP laptop models.

It took quite a while to get to the bottom of this, see:
https://bugzilla.redhat.com/show_bug.cgi?id=2333331

But the fix is quite simpel :)

Regards,

Hans


Hans de Goede (2):
  platform/x86: int3472: Rework regulator enable-time handling
  platform/x86: int3472: Increase ov08x40 handshake GPIO delay to 45 ms

 drivers/platform/x86/intel/int3472/discrete.c | 45 +++++++++++--------
 1 file changed, 27 insertions(+), 18 deletions(-)

-- 
2.49.0

