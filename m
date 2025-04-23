Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEC0214A79
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 12:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410359; cv=none; b=SbnTmK5vk6Ji5afCWLPVc9Kqfu544VkZOiGWsJGTsYIj2eIdrfb6UMRRVyKCa5JXDzqWnVojbGtzHV9cnRCeANhVZwk5yINxvV+Pa1hxOrPbxBeBak9q5rH+yZeQeUFdBnguU5Eh4XvF4Xq4iPOrCM9r6BaE2+KWyK5r0Z/FjGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410359; c=relaxed/simple;
	bh=0esR7D2La4URe+f51kIAf018ZGNG7VYqnECZOd8WzRo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t6/HBNPCUJU2IAFPloV4EZazoRXIO5RKW41J9lZOjkzhqejiIyrHQYPaN6bp69q4COhim0AFA6uCkHT5kj5OAiikjsFYRHwLuYpPw/khVDZj9JPUaPousmXnrMCWCk+HWJgRner0rJVrJw6cRduEuh4CvLOZ+aB0J7n24UDbtoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDWs+Wda; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDWs+Wda"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2819CC4CEEB;
	Wed, 23 Apr 2025 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745410358;
	bh=0esR7D2La4URe+f51kIAf018ZGNG7VYqnECZOd8WzRo=;
	h=From:To:Cc:Subject:Date:From;
	b=aDWs+Wda2Tvn6fkcnRz7xV2BJsj/DT0UjDMCEL7HEowK4W7B3nEaLrqwWrPcoWDJt
	 Re3Y7CVdJjKvkUDRz246T2YsTlg8xYr74amHW4rr6vICVHRMJdBLVLCleAhX0exj1u
	 6DxHRzD6BAuEptQImf6cbMjz9hy9VMIE/dsqhhnMA2xv9Fhy2M1KqEHgeNmMjqqG+U
	 1ehtQ1pBYvMsaWd9grfWgl9iHWqTwoO0SHxtj9kCfLYHZYeGLeIfx10bGBcZs/PPPx
	 A6y+81ztL4wsH4fv9BxFUnlIM5BGe/HiSoy7s8Qf8HgCbGj9JjDaN36Ee96R2vfhk3
	 BAoYiQjcBI7Rw==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	Patil.Reddy@amd.com,
	Shyam-sundar.S-k@amd.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/2] Handle bad policies for AMD-PMF better
Date: Wed, 23 Apr 2025 07:10:00 -0500
Message-ID: <20250423121202.3736094-1-superm1@kernel.org>
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

Mario Limonciello (2):
  drivers/platform/x86/amd: pmf: Check for invalid Smart PC Policies
  drivers/platform/x86/amd: pmf: Handle bad policies in
    amd_pmf_get_pb_data()

 drivers/platform/x86/amd/pmf/tee-if.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

-- 
2.43.0

