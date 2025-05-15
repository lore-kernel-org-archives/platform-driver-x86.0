Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238E221C163
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 May 2025 16:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326237; cv=none; b=cTRBD3qZc86IG+G7/iPYTlccSr27lKnEB4mRKlDodPV4yl4MCOEECBQYR0GbjCFxHIy+Fgg6Rz5zeD+jKNLPvaBU6h1njnHHo7ThsOIoWtGaTRyldjTYP6L2eilN9vg4ClIr6Wpr8lLhKmomevnT5gen/aslylUNob61z3wDMc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326237; c=relaxed/simple;
	bh=y3Kw7gr3EjALJoX3QATEfEkmVi8h2Q3drokPITONyRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aiKY9wh/ZFl/lSvjBtOVD14aBc22tJKbxOsSMCSfXHHtU/l5SYJkiu1qiLaKbnIQ/T9F/OjPVrTMMzBxhzD9GG//bsS1BpPQ1895BwBloU0V++KRiT1kC5rPfFY6D4k4DXytB+5379RT6/aZDs8oMHaWXhORUsifF4g8Mcw65MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AN+cLb3q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AN+cLb3q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CC4C4CEE7;
	Thu, 15 May 2025 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747326236;
	bh=y3Kw7gr3EjALJoX3QATEfEkmVi8h2Q3drokPITONyRg=;
	h=From:To:Cc:Subject:Date:From;
	b=AN+cLb3q6sXKnBJUZUsUpsZBsoZrERdbe3VFiryOaLLdw5TlX4YI4iL1RhfVo13Hq
	 bWI0dwGDJTdAAzo2yG/OYmvq51GBUPxSGKduhT5+srHBwwFSUNP/ksG5iXTw6cM6fr
	 3u11Jy43OYnvh4j16ocxb2RdGfYhGIMW5nHHk0tx5MtuWd/Xa7gbjWmV5preA0Jbeu
	 Xz0PM4iXdEtH2HQaQiRYF0XiOVMr+l6pR2b7ldLd0zk6km+IJ7/iIA5qxS7CmrSW1y
	 rlVCtfEYLBfRT/cFS+22SCtFnrk2sWV9K76nh1l4Z+IpvJi83jbMqqh7ZAW7/8GiAK
	 XtrUgMl6Kys+g==
From: Mario Limonciello <superm1@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org (open list:AMD PMF DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v4 0/3] Improved cleanup handling for amd-pmf
Date: Thu, 15 May 2025 11:23:48 -0500
Message-ID: <20250515162351.2111468-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

I noticed some memory problems with unloading and reloading amd-pmf.
These were root caused with a double free.

This series cleans up that double free by switching to device managed
allocations and also fixes other problems observed in earlier iterations
of the patches.

Mario Limonciello (3):
  platform/x86/amd: pmf: Use device managed allocations
  platform/x86/amd: pmf: Prevent amd_pmf_tee_deinit() from running twice
  platform/x86/amd: pmf: Simplify error flow in amd_pmf_init_smart_pc()

 drivers/platform/x86/amd/pmf/core.c   |   3 +-
 drivers/platform/x86/amd/pmf/tee-if.c | 110 +++++++++-----------------
 2 files changed, 37 insertions(+), 76 deletions(-)

-- 
2.43.0

