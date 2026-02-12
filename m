Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158711A9FBA
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 22:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770933781; cv=none; b=jT4gj3/mgi6t4oQfb69hs0IxMaMIe0DuSL3G+tH/3lowDAApFiNM7VxT3w3gh3b+PmD3N7SKnxHrXqalROBMppg6lQLjMnt7OW3XFEFtDt6hhdRzZKRxBjljvZoyrAAYMVxiSD2S2/DUFFbsJvSKff79VOImOnMVHA/7aMMDjW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770933781; c=relaxed/simple;
	bh=90QYMoiUroft8GQim75RnnuFDAeylxr6/CWp0Fw4UhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oiRNCHDrrur33V/BnmNfr8fKH9a/BPYQc5akd2GbGX2SMm/m4sg374yOayYkyw5MJTSMxidVtVxqM9RgQlxKns7NNvUz6Jx653cUbGAS30VKgpzrtZkIJNlIlsYz89EFF10KctIE7ENG4yVbGP9+Jj0BIHxA7E5FA01eBczaqW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=c8PC9iMq; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="c8PC9iMq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770933777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Sf+hOtmM1l3ObM5YHGeZApVVQMU4eoSoKfTIbHypsZQ=;
	b=c8PC9iMqNj8fgb6NTBIHr8iFIaNG7hF1ToIo8JvZdv003U9uVBqxAfW5eNwENtY2QZZVCx
	JIOJvB6rTRjMmXnyoQVBegQN+zq2zSDfgRMLq/WSFTxo9D+Vok38ogYm5s46744gi/aAnm
	0Kb6zn57D+ywWvkirXlM7Bd/0GsvPUY=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 0/2] platform/x86: asus-wmi: fix screenpad brightness/power management
Date: Thu, 12 Feb 2026 23:02:50 +0100
Message-ID: <20260212220252.1526337-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Fix up some inconsistent behaviour involving the screenpad on some
ASUS laptops. This fixes:
- illogical screen off control (0/1 flipped depending on WMI state)
- bad brightness depending on the last screenpad power state
- incorrect brightness scaling

Changelog:
- v1
  - Initial submission
- v2
  - Split patch in two
  - Remove a redundant variable copy


Denis Benato (2):
  platform/x86: asus-wmi: adjust screenpad power/brightness handling
  platform/x86: asus-wmi: fix screenpad brightness scaling

 drivers/platform/x86/asus-wmi.c | 50 +++++++++++++--------------------
 1 file changed, 19 insertions(+), 31 deletions(-)

-- 
2.53.0

