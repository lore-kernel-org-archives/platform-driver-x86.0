Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FC520F09B
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 12:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410363; cv=none; b=UcRnU+Tbk8NGRUgF8GWZR5q2RulDDaBgKgLE+bYHmQPpJXbNSu7Y8dPdApfiKE2ob73xnxpvaXRsfpuC3Mvutl3AP8vTnghNGYwZ+F+dqwIYM1O/T24dYQkKiyWfoKdrkRje2GVFJOAGLnyGxqn0LMXVnTi/ikq/F+dPTjP3vUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410363; c=relaxed/simple;
	bh=OlB88NBpoFVqklp8r0HHC4sAPM4SAizPzsHTObrFW1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emft6heOeNGcJOJQ+dW7d7WvO6jp8+EGd3gAcTnD9vmSZDq/6oKHvqeG4ZOuCPyj1sIKOmA2COnZhigwkBA0pfj1Q92fb5h3n85RaJ3MvfgC9Ds0e5wtRqNbgKZZ4XYJDXWy7IjnywIlRrzWUXkXMfB/N2o1R6L4U8n2T5PthRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vR62QQl8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vR62QQl8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D3DC4CEEC;
	Wed, 23 Apr 2025 12:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745410360;
	bh=OlB88NBpoFVqklp8r0HHC4sAPM4SAizPzsHTObrFW1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vR62QQl82OOFOhkLYOC/dU6DNIz7v98Lmc+rocaUjz5FPdvzhoOyi+DVDw3x6j7qP
	 J/gLr8rVKbK2O8MFlSJfu0BwmLazY4oqN5xEEeF12RLWcdT0A4ucaOOLiOXNmJr0Mg
	 f9/vM7MTe6EzsDHWhNSA1rBKps1ZF7pxfAY5osnrotmo/QO5zCoPBK67s9bLLm0pCJ
	 a139N4aqYvZ5eX/X+MsHfT4Mg5CI25MuRYQ3R0U9N5z765/MpSinCVZgu0bjSQtMsL
	 5AoSsVV9VAywfbWJnbYwGq7Vs+aOqrbf1OoA6Aenl9rsi4jfixH4uWyTIpBXG8c2AC
	 zx8KkWc8XtirQ==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] drivers/platform/x86/amd: pmf: Handle bad policies in amd_pmf_get_pb_data()
Date: Wed, 23 Apr 2025 07:10:02 -0500
Message-ID: <20250423121202.3736094-3-superm1@kernel.org>
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

If a policy is passed into amd_pmf_get_pb_data() that causes the engine
to fail to start there is a memory leak. Check for invalid policies as
well as an error in amd_pmf_start_policy_engine() and free the memory in
the failure path.

Fixes: 10817f28e5337 ("platform/x86/amd/pmf: Add capability to sideload of policy binary")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 41ab9eca5ff13..3c399dc1bfcca 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -377,12 +377,23 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
 	dev->policy_buf = new_policy_buf;
 	dev->policy_sz = length;
 
+	/* Check if the policy binary is valid */
+	if (!memchr_inv(dev->policy_buf, 0xff, dev->policy_sz)) {
+		ret = -EINVAL;
+		goto cleanup;
+	}
+
 	amd_pmf_hex_dump_pb(dev);
 	ret = amd_pmf_start_policy_engine(dev);
 	if (ret < 0)
-		return ret;
+		goto cleanup;
 
 	return length;
+
+cleanup:
+	kfree(dev->policy_buf);
+	dev->policy_buf = NULL;
+	return ret;
 }
 
 static const struct file_operations pb_fops = {
-- 
2.43.0

