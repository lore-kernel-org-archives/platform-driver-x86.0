Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FC7366DB7
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 17:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473486; cv=none; b=r0QkjZBh/jmY9fQufZaHmIntuH89QNvECmTzC9GNllInojuCgSWLpf63UxWTU9Iz4HwpvTqUSeawMW9R+1l1JbAgFD4u9GH8X/9oEwqV8oWE62Ldm1xQHvI0y/5e23sNYa8y62f/9txIsc8boaYvpjiWdsQqQ6GjDzqHkf1ValY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473486; c=relaxed/simple;
	bh=tsTLaGp9DV/gJzjbxVzmjxAtFh9U+E0n/CddRcEYTLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uxPZf8lDa06S/fSo2A7UcQrwsiNzTCMJdXjP0kRyBeTWrwTnMbNqRF84Pba7dZWkOS3H3RKYRpVM+ivJq5u6GAKnGngkSO84w78hNDZRYMkfF8vWVwTtLeinni0qTwTN0ilSmlibp95Sv6RQYWIgE+sPucToe5SPDlGgzzWIv0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oyUPtFk+; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oyUPtFk+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772473482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nw9mOcF7BrPD3Fmaa0Ag8e0U3GwpZmyjHDFMUtoogKk=;
	b=oyUPtFk+25nFkS+ugwez218OA7Es//a094bX5LZ/wqd4aiXlyZ8oVP0EzteRDsu9r8d2W2
	qIFdoP5c4K4OfWWLt5FRkTorLyzct6OQnanhrH6kDl3GhfaPyms4vguZMHOOrnRi5vKUC3
	y+/TR41TL3gf5LFiMQFtGLdIBF69ZR0=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Denis Benato" <denis.benato@linux.dev>
Subject: [PATCH v3 0/2] platform/x86: asus-wmi: fix screenpad brightness/power management
Date: Mon,  2 Mar 2026 18:44:29 +0100
Message-ID: <20260302174431.349816-1-denis.benato@linux.dev>
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
- v3
  - Fix variable declaration (reverse x-mas tree)
  - Change commit message of 2/2 to reflect the actual change
  - Add "Fixes" tag to both patches 

Denis Benato (2):
  platform/x86: asus-wmi: adjust screenpad power/brightness handling
  platform/x86: asus-wmi: fix screenpad brightness range

 drivers/platform/x86/asus-wmi.c | 50 +++++++++++++--------------------
 1 file changed, 19 insertions(+), 31 deletions(-)

-- 
2.53.0

