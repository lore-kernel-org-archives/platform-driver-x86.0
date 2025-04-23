Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15E670825
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 13:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414411; cv=none; b=cxkd7ISTx+aBrAEy0mTTWpEQHWzdUdcc2vubg0UNT+/h5ZqJrGYGhPKFiVBwQHkABVTZgPdplBeQq6C+DCjK1t2tE+Dbg3cTBkrChTnXyPt4vaBYHcm5x/rKZtuDAJT5VfTPM3TzYERmz0PdkktoM/pvbsMAXPzNiBFzl0uGlh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414411; c=relaxed/simple;
	bh=EopkktV8AL2ofiZL/d74CyyrrHV96iTM1DEeTeOVf1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TiYRX8n8nCpM8oU03IFIuu65k3hN5q3Cupraai7jt1686MS896EzNepk0zwEriRN23wvsll6N05LlgxgKaH3YUmcMDcB+BkNEx9H0/cjcL+/MCPKWM2WaGKD+8OFOWsFpiiyI9rNSiiA0gaFrIKtQk/Kh1KPxpS3+G2dBP65lu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zv55jdru; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zv55jdru"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E44BC4CEE2;
	Wed, 23 Apr 2025 13:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745414411;
	bh=EopkktV8AL2ofiZL/d74CyyrrHV96iTM1DEeTeOVf1A=;
	h=From:To:Cc:Subject:Date:From;
	b=Zv55jdru3jEXHTrFEMfSemCvY3I0ur1JlcDewZ+C81i0E0CzfqLcV2QirMfW8Ppa6
	 ihsEa/oEV7bTnNCdgQOatieykw7qpcc+lqJsQ6APRSoozEfaMeh0w+vsXGZ+IaXfhK
	 wtnhb6MQEZbHyHvpyZtfd67gJUv2a7aDwpCdAhGC8Epr/WrfJPBg0ecECbcKOh3c+K
	 YHpVXOPMjY+NNro39HD/36k0NRS58hjdcfmzfIxnCG8yOe/vvWm6oCsyqL1KQiTNdK
	 S2N25RI2jDcQi3uPHRynrvlCaGTQ/kJZ4A4VDmRiYF893PZCEjYQEfS+WMkLZvcXuF
	 HDrp4oz0kfqYA==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	Patil.Reddy@amd.com,
	Shyam-sundar.S-k@amd.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/2] Handle bad policies for AMD-PMF better
Date: Wed, 23 Apr 2025 08:18:43 -0500
Message-ID: <20250423132002.3984997-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

There are assumptions in AMD-PMF code regarding policies being
valid both from firmware and from sideloading.  This series adds an
extra test to ensure policies aren't empty and also handles a memory
leak in the cleanup path for the sideloaded policies.

v2:
 * call memchr_inv from helper
 * Split out cleanup error to it's own patch
Mario Limonciello (2):
  drivers/platform/x86/amd: pmf: Check for invalid sideloaded Smart PC
    Policies
  drivers/platform/x86/amd: pmf: Check for invalid Smart PC Policies

 drivers/platform/x86/amd/pmf/tee-if.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

-- 
2.43.0

