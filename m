Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A63670825
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414413; cv=none; b=Ddwv1btIp7m8QFJ/eeJ8PwasdAap04ELoPEPtEzXTiQsVNWVdl92s5h6x2St8MCaJU7o/ZZ5ULLgHs1qm85i3uxmkMwAlwNULjEecQIh4JdJ4U/oFmU0FhOJvOW5tz0Gjg5y33atQ7PQP0usCernZvMQbXpcEP8sq4Ucgm7KE04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414413; c=relaxed/simple;
	bh=grAWwgcNIUp1Ae5wQr6RVZBIXh+Sg5XSLrdZtwmGbJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MxZusxdWSgQqZwqTR8EBOi2uprnhmPApFJsAmSk5X1mci/ey0t3RvFdEqVPLMtx3UKLSE1cpB5TM56OD4jSRWMov9Vo0Weyom3kAXz/Bm/BJ/cZUJMqUrISLz16IVb62VVVUG1NrrJQaNRyT5Ni95WndmsV3uDQyudTJrzrhByc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4bR87Ot; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4bR87Ot"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197E4C4CEE2;
	Wed, 23 Apr 2025 13:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745414412;
	bh=grAWwgcNIUp1Ae5wQr6RVZBIXh+Sg5XSLrdZtwmGbJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j4bR87OtVvsZJqzgzJdQv0KIaY3yt53hQbSpTRD4hOr+Ep/bkfRF8jE3ZHOoako7T
	 X0O/rHz/Tkd1rObG72VihUaO0S0CuW2fF5i7mXDqdJNt+YpsBqer98mtsFQxbzYrUv
	 s8FLlZH0tzRBcbaoqqEElmZPfDY/s/MEizCg1Y7Ldzt+94YYVfp80seXb6d+afk8LF
	 vuTFqdVJYQaF/yftLGHTrPGtdkcToK2TmnNKQBjhqDQoViiZ4z5A0b9kcE0S2WWcS/
	 N1w1k2fhlRY5Rjs9+1VDoQ3ugSm6eqZ9KCuiteanD3rkCivUxEYUNsDyS7PqSdirPg
	 vbOVCTexUwWoA==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	Patil.Reddy@amd.com
Cc: Christian Heusel <christian@heusel.eu>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/2] drivers/platform/x86/amd: pmf: Check for invalid Smart PC Policies
Date: Wed, 23 Apr 2025 08:18:45 -0500
Message-ID: <20250423132002.3984997-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423132002.3984997-1-superm1@kernel.org>
References: <20250423132002.3984997-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

commit 376a8c2a14439 ("platform/x86/amd/pmf: Update PMF Driver for
Compatibility with new PMF-TA") added support for platforms that support
an updated TA, however it also exposed a number of platforms that although
they have support for the updated TA don't actually populate a policy
binary.

Add an explicit check that the policy binary isn't empty before
initializing the TA.

Reported-by: Christian Heusel <christian@heusel.eu>
Closes: https://lore.kernel.org/platform-driver-x86/ae644428-5bf2-4b30-81ba-0b259ed3449b@heusel.eu/
Fixes: 376a8c2a14439 ("platform/x86/amd/pmf: Update PMF Driver for Compatibility with new PMF-TA")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index a8bf8c61669d3..7d6404ab9f041 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -350,6 +350,11 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 	return 0;
 }
 
+static inline bool amd_pmf_pb_valid(struct amd_pmf_dev *dev)
+{
+	return memchr_inv(dev->policy_buf, 0xff, dev->policy_sz);
+}
+
 #ifdef CONFIG_AMD_PMF_DEBUG
 static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev)
 {
@@ -377,6 +382,11 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
 	dev->policy_buf = new_policy_buf;
 	dev->policy_sz = length;
 
+	if (!amd_pmf_pb_valid(dev)) {
+		ret = -EINVAL;
+		goto cleanup;
+	}
+
 	amd_pmf_hex_dump_pb(dev);
 	ret = amd_pmf_start_policy_engine(dev);
 	if (ret < 0)
@@ -549,6 +559,12 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
 	memcpy_fromio(dev->policy_buf, dev->policy_base, dev->policy_sz);
 
+	if (!amd_pmf_pb_valid(dev)) {
+		dev_info(dev->dev, "No Smart PC policy present\n");
+		ret = -EINVAL;
+		goto err_free_policy;
+	}
+
 	amd_pmf_hex_dump_pb(dev);
 
 	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
-- 
2.43.0

