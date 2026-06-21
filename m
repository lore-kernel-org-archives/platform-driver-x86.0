Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545781607A4;
	Sun, 21 Jun 2026 09:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782032576; cv=none; b=WtVuIbkBopIl/knN3wDPs7WbGdEnHZ+tnnf+sYD+TKMtHSXlt36t++8bemr4LoQzJqnvNlfoiZo/kGnvjRu52RbKjRz9aQHWPrt1sd3YI7xNETSAS10WX0+A/PW6uQ9EHfb2OH3A0vJwFeUPr5sloU5kuI0loqaRwoXd2OZPYi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782032576; c=relaxed/simple;
	bh=fWQgAZ9Zg8T47roOV1QkiMp/QucRwEhYiTrujUAC/5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PYdmFR0lu65vV2vkGjNEpAoTQRJJUabFAZ+XLCO6V1iQNRlrQeaIzp71QoQdG3QrjeKRA7izt9waE5m8XvZzQJ2t9Sf9wLFPa3z8k4O/U4UKoBp0z57i6kmQC21AjjIfCTOaKXq5NrTJnKjPct1PCy7kJcTrFujEZDNthWvDykM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=O3XOLH1h; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="O3XOLH1h"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 86FFB26950;
	Sun, 21 Jun 2026 11:02:46 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVDmsJtlownu; Sun, 21 Jun 2026 11:02:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1782032565; bh=fWQgAZ9Zg8T47roOV1QkiMp/QucRwEhYiTrujUAC/5Q=;
	h=From:To:Cc:Subject:Date;
	b=O3XOLH1h26sT67pyKyhN4yMqXzxDvz5/DEvCB0/8kB+IQouGA+4ThZSrrzATfcjGe
	 MWIIKMiUwk5uEFA8KfRFHMIrc10q9tXD1pepEseSNScY34Bi7cnw1BvU+hIrJH4V8c
	 pPwJGQfZETDtGb6rIxBEz1riZENukOTuvvIjQgGC3fBhasFuO+hndr/cSXXo87LN42
	 fTCTyjOWBLXbHguNU7L+adUX393g6a9RTjuCaTuHurLSCweDzN9MjbBMnBWcoQ3708
	 mnQ1Q6hBu7/Z+PDPg6RRtZVvmvttRrSPOzYFOL+eUD+zMuXoJ+RL/O3Ehiu3SWFJUQ
	 DRxm83olnjUNw==
From: Marco Scardovi <scardracs@disroot.org>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: denis.benato@linux.dev,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 0/1] platform/x86: asus-armoury: Add power limits for FA401KM
Date: Sun, 21 Jun 2026 11:02:29 +0200
Message-ID: <20260621090230.41249-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This patch adds the power limits quirk entry for the ASUS ROG FA401KM laptop.
The limits are extracted from the device's ThrottleGear XML configuration
file using my ThrottleGear program https://github.com/mscardovi/throttlegear.

Marco Scardovi (1):
  platform/x86: asus-armoury: Add power limits quirk for FA401KM

 drivers/platform/x86/asus-armoury.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

-- 
2.34.1
