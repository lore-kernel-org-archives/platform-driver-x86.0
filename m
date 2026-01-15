Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E815335A94F
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Jan 2026 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471435; cv=none; b=MWgklVIjDVQgrv4UTBT8zbYmSrwkTlmEOYDHjbWIHj1N0NfHSPLeF2y6c9xDcU0cP49t3WzJrdoxCs+EVN6ALA1bfzEXeLcJ708DKF7cZZypdcgb1dHHZl3Ojpvrvzchk2XJgARccMHxZVJsDQNsYF1ceFQngwdFVODk0Ost8TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471435; c=relaxed/simple;
	bh=VKRspfwk/E0Ml02M5It3zrCx88fPV1OAFMqDvhWcVHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DCH0+X9va3WnGnkxZWn5JvK3bq5x0IJBfEbWVt4gAXXatgDhvWT69tLj0cFFWhbQv9XhhL7vA69jV7FnNar5KnEFgxaHWTz5zBmRTbkCDwfckVBEYLDYyjHUsoWmLXBYq/1E7e5kZXV+CjCkD0+go1xDtgzSKJ702bvJnAUj8J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jLGbjzeY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jLGbjzeY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768471427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pPv1njqMSOp/eneqhdzPt0PfWlDoz+4scBCuvivC+m8=;
	b=jLGbjzeYC/gZGjxNqk1ZPelm5dJqVcywAaaOR/VyvQK2D0hm/2TEkuA3wSs4nfR1jWdq5Y
	eBuJqCRSKHLDDXiS0F/UbUu6weS/eXwAa2p5ES1eWwxEjL7MBw0SOvdxyndzHCKoSrunFW
	ZFS6Lf993B20ZAkwAhiYzMrvwzqMydw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-56-Z1WlxylvNkSboXVhnVTkKA-1; Thu,
 15 Jan 2026 05:03:43 -0500
X-MC-Unique: Z1WlxylvNkSboXVhnVTkKA-1
X-Mimecast-MFC-AGG-ID: Z1WlxylvNkSboXVhnVTkKA_1768471422
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 669D118005B3;
	Thu, 15 Jan 2026 10:03:42 +0000 (UTC)
Received: from mrout-thinkpadp16vgen1.punetw6.csb (unknown [10.74.64.47])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0D89B180009E;
	Thu, 15 Jan 2026 10:03:38 +0000 (UTC)
From: Malaya Kumar Rout <mrout@redhat.com>
To: srinivas.pandruvada@linux.intel.com
Cc: mrout@redhat.com,
	malayarout91@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/power/x86/intel-speed-select: Fix file descriptor leak in isolate_cpus()
Date: Thu, 15 Jan 2026 15:33:33 +0530
Message-ID: <20260115100333.171244-1-mrout@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The file descriptor opened in isolate_cpus() when (!level) is true was
not being closed before returning, causing a file descriptor leak in
both the error path and the success path.

When write() fails at line 950, the function returns at line 953 without
closing the file descriptor. Similarly, on success, the function returns
at line 956 without closing the file descriptor.

Add close(fd) calls before both return statements to fix the resource
leak. This follows the same pattern used elsewhere in the same function
where file descriptors are properly closed before returning (see lines
1005 and 1027).

Fixes: 997074df658e ("tools/power/x86/intel-speed-select: Use cgroup v2 isolation")
Signed-off-by: Malaya Kumar Rout <mrout@redhat.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 558138eea75e..d00d15490a98 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -950,9 +950,11 @@ int isolate_cpus(struct isst_id *id, int mask_size, cpu_set_t *cpu_mask, int lev
 		ret = write(fd, "member", strlen("member"));
 		if (ret == -1) {
 			printf("Can't update to member\n");
+			close(fd);
 			return ret;
 		}
 
+		close(fd);
 		return 0;
 	}
 
-- 
2.52.0

