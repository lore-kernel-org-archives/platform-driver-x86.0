Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B92A50
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 May 2025 00:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747874102; cv=none; b=E0Z6bgAa5iHXHuUVjOjGBs1zg8oC13fM4qxQLVLYATqPG0rOg6GnHWudOasUVV1Cl1tQ6g8MNt/HyMcM8q8LwLN2693r7Qw0xfyTasFbeHYPbmkbyxWaSp/vBwY9NkVpy6Jv4gNfMAwmGQP+c22WMo9uF7GSHbBQfTXZkSngFq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747874102; c=relaxed/simple;
	bh=hDAdv4ZRGPRYvmyAu8Za5uxm8o5nb2jDea80u+WXrXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VWgOWaA+bcM8eHdkjsNYz5W5rLskIGmcNVjYIgbfeLYe3p8Zj8GQQepBj72GwESHNvZLdaOFAvyplqM4HAi1xLUC7gd8yxgXl9IHf5KORK+ZqECq8NablSNzT9OiP+BQJh9oypnnh11zhs/xY/6qNyvLk6eWhlctoB/tG/Ji53E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdv0ZStV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdv0ZStV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B326C4CEE4;
	Thu, 22 May 2025 00:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747874102;
	bh=hDAdv4ZRGPRYvmyAu8Za5uxm8o5nb2jDea80u+WXrXo=;
	h=From:To:Cc:Subject:Date:From;
	b=tdv0ZStVG8VIBlvTloqn61ZHg8LN9tIjNlZd0fv97ExhsdofZDp44/LcDJ2CNWbAR
	 Sh0IeWDHelrcIXE7s5JW94ROvZQlNrfV3XNExJbXSK69VQNLr+oACbTUcANHocQNab
	 VE35vZbZS6UJriobeOuaR9AmlL1VlNB/js+D0vpZxQqCeUkPA4VIw4eOUApo+FhTTb
	 m5xj4+H8XTOfU9/EtB9FyTYNy92eNy7ljCC2FvsWki+YeP03ir+k165380PPWl8HuV
	 49F3pSvfdI4NcmCi9850YIr9F3JKYdWfvDL3RVC0eAkzZ3bwAGmd8UvuzuTfVOGijJ
	 w/EDbRpq6Fscw==
From: Mario Limonciello <superm1@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org (open list:AMD PMF DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v5 0/3] Improved cleanup handling for amd-pmf
Date: Wed, 21 May 2025 19:34:54 -0500
Message-ID: <20250522003457.1516679-1-superm1@kernel.org>
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
 drivers/platform/x86/amd/pmf/tee-if.c | 108 +++++++++-----------------
 2 files changed, 39 insertions(+), 72 deletions(-)

-- 
2.43.0

