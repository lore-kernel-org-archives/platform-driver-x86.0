Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA3A442106;
	Tue,  7 Jul 2026 21:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783460282; cv=none; b=qnn1tkjIv0Ize+bqyCWVLGkYlhMbmL1C2Zlt54ANXhx1Tep4Wb8i38i4m4IhbA5eAAK8YjQaqCbA/Pl/5XBo2YV911SmyUw9/KNvnFWrkk9R9qFksimLgdl4soHDFBoLIezxIAmYEFs764nwpKkTxHRiEFL4ckxVvw1a0J2xjPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783460282; c=relaxed/simple;
	bh=h8Koeq+uErYWzO9JN/FzYEqg1WylBLmmTQ8oSve19QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fHhS0lzzkBc1dCSBMhMxjfbWQ4Qjfl/4q4f4M+QqqI59jl/O3bySyVnebTitPeI4DrMYpoaz2tEynDl1OdnV/c0R4/npNDAbhpm4LjSqEtNFW2DfnlfiJgLD79SqA0uraDDsBA60jLue2HoxxF0NnyS1dcGEuAMXytfjgAbxAz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=FTetyOws; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="FTetyOws"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 413C784BFF;
	Tue, 07 Jul 2026 23:37:57 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i74d2oDti-yb; Tue,  7 Jul 2026 23:37:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1783460276; bh=h8Koeq+uErYWzO9JN/FzYEqg1WylBLmmTQ8oSve19QQ=;
	h=From:To:Cc:Subject:Date;
	b=FTetyOwsc+Lk9xEew58lhHm8E0po4mGuTd9wMQtZNKFDbpA01bVKj+DxnLBaih92V
	 WAgaYhscCngit4nCBxfbJjYkO6G5gLHfmX/Jf3HfSILJFc85KqRkUs69an+QCNOf3v
	 uf7W8W4195XTPnZbhpkErmsNAFc7R4BtE92wh9MmmNaEIBn/k6TJ7A/ZbfeER5Vm83
	 2Imsw5CoeN2gUm/9IbuNQ5jBZQu1QGi9PFq+JtpFJ1PUo7OCyyIaJWCFDR1yNrhL46
	 uLsu45D0xUtNCBimWCLdLJ/ydH/eDqpo9SX5qMIiCkplUj0U9v7Y6GM/t0JCEdsfV7
	 cQ1xyNYUTezOA==
From: Marco Scardovi <scardracs@disroot.org>
To: scardracs@disroot.org
Cc: corentin.chary@gmail.com,
	denis.benato@linux.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 0/2] platform/x86: asus-armoury: fix init errors and modernize resource management
Date: Tue,  7 Jul 2026 23:36:10 +0200
Message-ID: <20260707213741.6515-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses a Use-After-Free vulnerability and a memory
leak during driver initialization in the asus-armoury driver, and
modernizes its memory management.

Patch 1 fixes the UAF and memory leak by propagating the error code
from init_rog_tunables(), deferring the global pointer updates, and
adding a rollback path.

Patch 2 refactors init_rog_tunables() to use the cleanup infrastructure
via __free(kfree) and no_free_ptr() to automate memory management and
prevent future leaks.

Changes in v4:
- Rebased on top of next-20260707 to resolve conflicts cleanly.
  No functional changes applied.

Changes in v3:
- Added a second patch to convert init_rog_tunables() to use the
  __free(kfree) and no_free_ptr() cleanup helper macros.
- Added #include <linux/cleanup.h>.
Thread for v3:
https://lore.kernel.org/platform-driver-x86/20260703103212.7406-1-scardracs@disroot.org/

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
