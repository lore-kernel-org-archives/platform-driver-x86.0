Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1783D954D;
	Fri,  3 Jul 2026 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074761; cv=none; b=aF+Iu3THtF/gdcAZ8hipYKqlEzu5mz8N3q6fLvVy3omoxYhFLLbDmGVfMfNdXUs5mZu0KNxXbwt0EgUPHh+0cyi/IVxpQm5IQrfS1Yb6Psdv3uKgmopI+zyA272LL21ZHROntYYwc1TMAMLrDKr00FE3NBnb6qqOoqcMb4bnTMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074761; c=relaxed/simple;
	bh=LMgbEcTn3QzUREPX/zKiLfVGLvFfSfoBdMKrPKtJqVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oqKC3L3p9ZlHhVvFBTTpAlvec78ltSTcGPMlO25/OWuYbTX/ZOAXdUrlMuEoVxs7AY05duBuPhdatF8wkHlZwGWqZ7625v2O/n/Sdz9JoozTiAmEGWlvJjyhL3M6pZJ87wxo+yeMzRXxlGe9MALew1uAPWxvjmt8bmW0YrWpn1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=AMjQu5wU; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="AMjQu5wU"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8131D841D3;
	Fri, 03 Jul 2026 12:32:31 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19iWr10dGA0a; Fri,  3 Jul 2026 12:32:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1783074750; bh=LMgbEcTn3QzUREPX/zKiLfVGLvFfSfoBdMKrPKtJqVk=;
	h=From:To:Cc:Subject:Date;
	b=AMjQu5wUpeAzLuLk59UKKW3chiyDEHuTObtPfdSst1ADDThdBcwozaxjQDuaTqikS
	 gOOmUY6TNZdJpQkHBoc8C9vqr5AZXAOuzRE7k83XjfIsak5GdDapBTgbdABL1g/u4v
	 nrSTHp14tX7jMMwPEgjy9yFuMkPFCW6Dn5IoILl9a5WeIhW7qGnUfLZ21AffAYTkff
	 VlV+mRF+uzfQAsLp+veiiMLnHvF8LJgRtLCBp9PUsENCotUI2p+mq7bUWC9VH72M2z
	 T2DdeTI+SPp8wnex7bw+RD59wpTaVyLeZy/TqBLF0EvX4C8AQWStpkNABcaJ2anNEr
	 eupXAzPZLrrFA==
From: Marco Scardovi <scardracs@disroot.org>
To: ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	denis.benato@linux.dev,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v3 0/2] platform/x86: asus-armoury: fix init errors and modernize resource management
Date: Fri,  3 Jul 2026 12:31:57 +0200
Message-ID: <20260703103212.7406-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses a Use-After-Free (UAF) vulnerability
and a memory leak during driver initialization in the asus-armoury
driver, and modernizes its memory management.

Patch 1 fixes the UAF and memory leak by propagating the error code
from init_rog_tunables(), deferring the global pointer updates, and
adding a rollback path.

Patch 2 refactors init_rog_tunables() to use the cleanup infrastructure
via __free(kfree) and no_free_ptr() to automate memory management and
prevent future leaks.

Changes in v3:
- Added a second patch to convert init_rog_tunables() to use the
  __free(kfree) and no_free_ptr() cleanup helper macros.
- Added #include <linux/cleanup.h>.

Changes in v2:
- Restructured init_rog_tunables() to use local pointers
  (ac_rog_tunables, dc_rog_tunables) and only update the global
  static asus_armoury.rog_tunables structure once all allocations
  have successfully succeeded. This removes the risk of exposing
  freed or partially allocated pointers to the global struct.
- Removed redundant assignments to NULL in the error paths. Since
  initialization fails and the driver is not loaded, cleaning the
  global static pointers to NULL is not necessary.
- In init_rog_tunables(), replaced 'goto err_nomem' with direct
  'return -ENOMEM'. The 'err_nomem' label in the original code
  printed a generic OOM error message, which is discouraged in the
  kernel as the allocator already issues OOM details. Because that
  label did not perform rollback cleanup, a direct return is cleaner
  and simpler.
- Replaced inline cleanup in asus_fw_init() with a standard goto
  rollback block at the end of the function for cleaner error path
  styling.
Thread for v2:
https://lore.kernel.org/platform-driver-x86/20260701164333.5219-1-scardracs@disroot.org/

Marco Scardovi (2):
  platform/x86: asus-armoury: fix Use-After-Free and memory leak in
    driver init
  platform/x86: asus-armoury: use cleanup.h to manage tunables

 drivers/platform/x86/asus-armoury.c | 46 ++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 18 deletions(-)

-- 
2.55.0
