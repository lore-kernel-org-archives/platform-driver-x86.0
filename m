Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE1D22D4E9
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 May 2025 21:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747084320; cv=none; b=k6wQnopPMhtoskFNuAv9svGZkH43UZdww3NQh84VqeU4CoV42IyZVVSZwSEO2LYNgiQ13dZFzoc/uUd4ilL7+IGuoBOPw89sSrH0fGYGtYiHa3y6ta3WGLs/IvyBtojbJy8BNOmAC9MYQvg0slR99l94Mnw1TAG4PU+GVDEa1Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747084320; c=relaxed/simple;
	bh=pC+DtJUD73EdlApooyd+rpQDEWwe5Qd5Fy6ppQ+M2h4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EtpoT0vGE9Bis/4jRSw7GdoKIEsepYkqLd/ou78a//VIenhQh94YamS9j1/SYWiVoenl/K0T9CVpDndrqCr91KRkX+q8h0gzuZKKkzcr7q5GUtUsIZ8sYcNJEHGYaBdQS3FpamMGP742WeqiRM4ZjcPAIafEL1lXnnqGv0ZfVPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hj5WB665; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hj5WB665"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73B7C4CEE7;
	Mon, 12 May 2025 21:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747084319;
	bh=pC+DtJUD73EdlApooyd+rpQDEWwe5Qd5Fy6ppQ+M2h4=;
	h=From:To:Cc:Subject:Date:From;
	b=hj5WB665/aDTV+93Od5SM+9ve8xi5KB1e6SKbF6n1MYeztCAYnPBU19aJBDrroxs9
	 fkeJiOU0L/2EaBox41QjfwOmBNnkBNRPmqMmSzQOL7aZnqedHvGUTsMeNo2/t59bxA
	 dXUdZpP6qq0INbuztQcy/AdoiajGX8EBamL53cbjvRvSoCTCSHwH2aYE/tzXm0xJzB
	 7XnAmWhVObA4Cnjv5rwQpEJsKHEtibNea5Y9z6MieQXGdVnh1RfKe1ff9+CVbSXQKx
	 yfA0x1i2adx5rB6mD5TIE76SHzPuDPfb/o8UvfTSxrrI/vCSFtB+5IED8kI/JgDnod
	 nirospgEyrn8A==
From: Mario Limonciello <superm1@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org (open list:AMD PMF DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v3 0/3] Improved cleanup handling for amd-pmf
Date: Mon, 12 May 2025 16:11:51 -0500
Message-ID: <20250512211154.2510397-1-superm1@kernel.org>
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

v2->v3:
 * Add Dan's suggestion
 * Use device managed allocations
 * Simplify error flow 

v2: https://lore.kernel.org/platform-driver-x86/20250507020838.2962896-1-superm1@kernel.org/

Mario Limonciello (3):
  platform/x86/amd: pmf: Use device managed allocations
  platform/x86/amd: pmf: Prevent amd_pmf_tee_deinit() from running twice
  platform/x86/amd: pmf: Simplify error flow in amd_pmf_init_smart_pc()

 drivers/platform/x86/amd/pmf/core.c   |   3 +-
 drivers/platform/x86/amd/pmf/tee-if.c | 100 +++++++++-----------------
 2 files changed, 33 insertions(+), 70 deletions(-)


base-commit: bfcfe6d335a967f8ea0c1980960e6f0205b5de6e
-- 
2.43.0

