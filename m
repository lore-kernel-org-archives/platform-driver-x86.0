Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC67D34216B
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jan 2026 21:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768254665; cv=none; b=T7mHURhgGfpMBPeKpczMjdGG0XPL92jgMqgm4+ZTQ2yYPG+fs2fYaiRk+ncm0vsegvvlFPVReyIdwsmGfzKP8sLgRbRsx5B5LpmStSjcZTcAseI1gdH9ucHt8vbyDK0PQL6whfh0e1cs5XIwnX4yIs/QU8E27H/hcsp3IhKs/3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768254665; c=relaxed/simple;
	bh=9YUswI7C8K9uADoKEx5G4sIZmJFHXFDvgUbaJQhO7sg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ulHhsU/x4HKX6LSfdBLx2MWEpIEZ9xPq1VlV3Lj0Jef0J0fhQFLIEqtdHQ9g1OrvzSgavpUDYS03fTngisvXyutCP+Ics2H4ePJwVLGQ0r6wMfQ/D3RklECDP9+mhlYDLNd84bvvqff49Eks1CQ5QHlGVcw9vr9OLo5ou9jXzB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d8y/wloL; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d8y/wloL"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768254652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ak6xVycPoziospoaPI5Unv7h6s2q8kkdN5yDGdayzjo=;
	b=d8y/wloLDzjw6S5asgviHRAKCASQwyF3rln/N8viiPQQMSXVBJF5GAwa0o0c1mZ6Nt+AY7
	RCo0C0+JIhE2mjHaxXWSYk8TaWC4oXlv19WxzLCwAUACQX5sFo9RcfSmQFvwpuNm/E+Zdd
	9m5tcklM9EwcQkvo9Lr55sMwSYDSFfQ=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 0/3] asus-armoury: add support for GV302XV, FA401UV, FA617XT
Date: Mon, 12 Jan 2026 22:50:35 +0100
Message-ID: <20260112215038.575883-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi all,

This patch series adds support for three new Asus laptop models
to the asus-armoury driver:

  - GV302XV
  - FA401UV
  - FA617XT

Thanks,
Denis

Denis Benato (3):
  platform/x86: asus-armoury: add support for GV302XV
  platform/x86: asus-armoury: add support for FA401UV
  platform/x86: asus-armoury: add support for FA617XT

 drivers/platform/x86/asus-armoury.h | 77 +++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

-- 
2.52.0

