Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4886A208A9
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 12:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410360; cv=none; b=hdUxIRmolKgTene8B+6zVK//Xh6I9c2ufGyz+v96bzaPLT+u1c7c7bpriHMsK0tXKzEQeV/yk1vTQKyq16pmZJQHSMqZUCdx8qjQycNGFkHFBH7I769kYqDQV4fr3Nyo07uGwKLSHNstEjDcwWKrR/7MO1dgzsjbcIyUNN3faK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410360; c=relaxed/simple;
	bh=7vb10f+QX+zmwx/FBWq9EmrWXFf5r1HdnErfIWU615E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/UKZB3Z+nK+JCwYoTsO5LDXywMckx2Ez5nefkQMAU+2ERbw6/JkZxB2/zvw+QYp/UJlL8Uof2R2F+ZegR7hiOfvQrJc+R95cImw2T3PVDnwrqpTcYefOAWT0TKvatTJCzjvJ/3fEdzCyMyBhKKmfxJv2NZW7uhXPqH393S8QD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0QEaTnv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0QEaTnv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15760C4CEE2;
	Wed, 23 Apr 2025 12:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745410359;
	bh=7vb10f+QX+zmwx/FBWq9EmrWXFf5r1HdnErfIWU615E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n0QEaTnvyjwaNEQvTyFoRlfS70NLRLTlDFzz3H7MIDeWwFtT79ie3OaDAE+rCZXXF
	 RQ/TZwnCb13bR8mKkPTgsw9qdeZk8Ln/BpvyYrXAI61RXUw4bmYGjU8xLbBFPu15sB
	 jvzA5boJpxiRAJrTU5vq2LJO0h0+qsFq1VhrYS/grqgjW29w2QiP/uInNvA7Kk4Lby
	 hooXWOyNI/3w7/XB8vjHfbVN9x0h6MVBSpAC5uB3VKl4h2O73WecSJH7gPPRkZLSFM
	 ZvrbeDTz9F0f/mi/Y29mMFbKqNKLA8zAjgZ2GjTHpmNbJqZ2vKmzOUBQH5Q1tcFJa1
	 QY6RkvUrTDE+Q==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	Patil.Reddy@amd.com
Cc: Christian Heusel <christian@heusel.eu>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] drivers/platform/x86/amd: pmf: Check for invalid Smart PC Policies
Date: Wed, 23 Apr 2025 07:10:01 -0500
Message-ID: <20250423121202.3736094-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423121202.3736094-1-superm1@kernel.org>
References: <20250423121202.3736094-1-superm1@kernel.org>
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
 drivers/platform/x86/amd/pmf/tee-if.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 4c49b510ad1a7..41ab9eca5ff13 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -544,6 +544,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
 	memcpy_fromio(dev->policy_buf, dev->policy_base, dev->policy_sz);
 
+	/* check if the whole policy is empty */
+	if (!memchr_inv(dev->policy_buf, 0xff, dev->policy_sz)) {
+		dev_info(dev->dev, "No Smart PC policy present\n");
+		ret = -EINVAL;
+		goto err_free_policy;
+	}
+
 	amd_pmf_hex_dump_pb(dev);
 
 	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
-- 
2.43.0

