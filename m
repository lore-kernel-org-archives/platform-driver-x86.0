Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E8E18DF62
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 21:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753480387; cv=none; b=rEDnK4Vh9IfgNqoZdwL2APKQsHIBJCthGVn44ODYkF3bh9lu/tsyNBzm8AziQgVJhmSs+pAHvyKibE6sCUDbsVI2yGpv3loErtT1Aw8KCGRT44endjShJ7gGGusPvM2Qo5mm+OlZlWPkexRNCOsxrkt9IauZzgOnv/kK964wsGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753480387; c=relaxed/simple;
	bh=ZYOMSWDdXLUmpkM0EvRtTCkCEsXAhFCrKjPq6NB+kSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rsav7SLDLXVsE6MOkBWsQXVVI9gVqWE8RnmxPo+3BkBPI38brdM2js7Pl0Q3jLPi4eZ5/0N2HSxDDFaH1glKKXUXn1wazqjFDOjW5Lr9bgpC5MKo3T0XTuEtIekUBsCKN5g+ANOGQ6XWzwN2qKd18cOq6u9I+UmuuJ9FFzyXDr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pPtzTlox; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pPtzTlox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A300C4CEE7;
	Fri, 25 Jul 2025 21:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753480386;
	bh=ZYOMSWDdXLUmpkM0EvRtTCkCEsXAhFCrKjPq6NB+kSc=;
	h=From:To:Cc:Subject:Date:From;
	b=pPtzTlox+JGitsC0kSxeey7AzfmqRBdQoATSFCFLadp45lPJ8rn0sUxxrVZFgIRVa
	 a9Y2kSuy3r9523YWtGW/5KLhJI9frHK4g7m7J9lV/ln29xaSt1LMW2jz09cXbLa5FU
	 wXlLVQQ7XgmQCGN2hCuO/yMc/8TmSTTSstF7732/wsKOXl8Ji9WxQrZhW8krqwnJ6v
	 yFVVzFKlp6Z/88nVixyL7w81Ko30uivSiA9vqoQCiI9bGgnF4RqafMzCVmTO7F2WP1
	 +j34RjmCDbt6eibsZVUXNRuFoNCySnJSMf8gSwzF1oYV4fEsvmAq+2QXUeDM7zbSX3
	 L4HVMxr/9vNsA==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 0/3] platform/x86: int3472: Increase ov08x40 handshake GPIO delay to 45 ms
Date: Fri, 25 Jul 2025 23:52:56 +0200
Message-ID: <20250725215259.402796-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

Here is v2 of the patch-series to fix ov08x40 based cameras not working
on several HP laptop models.

Changes in v2:
- Convert int3472_gpio_map to use C99 initializers
- s/enable_time/enable_time_us/
- Move enable_time above con_id for better struct packing

Regards,

Hans


Hans de Goede (3):
  platform/x86: int3472: Convert int3472_gpio_map to use C99
    initializers
  platform/x86: int3472: Rework regulator enable-time handling
  platform/x86: int3472: Increase ov08x40 handshake GPIO delay to 45 ms

 drivers/platform/x86/intel/int3472/discrete.c | 58 ++++++++++++-------
 1 file changed, 38 insertions(+), 20 deletions(-)

-- 
2.49.0

