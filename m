Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7417A70825
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 13:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414412; cv=none; b=nuNHcsjhLWxtwU32LMf/4aEWjri7RM/CwrqCbbGZmmKjm0UciBdnCsFvBjJ87Pg4YQoNR1f7vR3apUKe0vFrB4tluWtRh41bLZWekJiOJurtdeQ1kogtt7mFeiob9nQw3XK8kjx3z2XXsEZonJ+csjGCuu2+xfKsSkbd71tL4EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414412; c=relaxed/simple;
	bh=db9Fk+6U3AQ6fcExh53RIEl6vMiY/nyeyyVv6UJpPbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qc3MAVLj9vmyBXfOf+Owcn1Ktq43hiXiW3WK4HCSVcL379dQBXpTlEndID5DxdsRxL44NrBxoZ6c9mUoiCjJYo0kJuywl1u9TLTt84wjAM9sKT0mxt/GXip3AzBuDKBqLNmSqQ0FQcTjvw8rPXlHQ/tsFdw9kOzzsOyaCDXYCZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nV43JqcK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nV43JqcK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF01C4CEEC;
	Wed, 23 Apr 2025 13:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745414411;
	bh=db9Fk+6U3AQ6fcExh53RIEl6vMiY/nyeyyVv6UJpPbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nV43JqcKtbUtT3OCIGM1FLrt/F8YmAr3kj3t1VilOt5PBzoZgv1Hjd4jxXUh88Nw7
	 wPDY064sjH0TMOg/E9nkf6xb1RRokusN5oqHAGm8vxHhP6c9Y9YyJ4p/uRXXBbJtOI
	 3hEGOOgYw4I3j/EeuCkzJtE9Mf/2RvFsEWj7FhJ6Ees+WRmYG0OAEw5PWlqqmIHuN2
	 3GjZrASX4GT3xSRjqLYIlgWHSzI+MNjGqJtfaAZeXi005lmUuDuJYtk/wQqK1eY5Gz
	 qh3TfXM+7jt3zpECIFMh3VJ/KgSWezHSSuJu4mmuk8Xd4AWOl1eFT4DnUazrtmvm6y
	 apvmFNlgBb0oA==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 1/2] drivers/platform/x86/amd: pmf: Check for invalid sideloaded Smart PC Policies
Date: Wed, 23 Apr 2025 08:18:44 -0500
Message-ID: <20250423132002.3984997-2-superm1@kernel.org>
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

If a policy is passed into amd_pmf_get_pb_data() that causes the engine
to fail to start there is a memory leak. Free the memory in this failure
path.

Fixes: 10817f28e5337 ("platform/x86/amd/pmf: Add capability to sideload of policy binary")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2:
 * Split to it's own patch
---
 drivers/platform/x86/amd/pmf/tee-if.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 4c49b510ad1a7..a8bf8c61669d3 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -380,9 +380,14 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
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

