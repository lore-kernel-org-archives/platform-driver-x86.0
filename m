Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B5D26ACC;
	Sun, 21 Jun 2026 12:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782045076; cv=none; b=Aco2Z6bwJr0QGGvFxhaExuN+j3NoG5GJ5jtdqCAaF+ngqcniP6tRcGYpQLIbdmOYBd+0ThfprbPIA6dNcKFpOq6TSYQVG8jm6Y98WPQy/L75is9J9rhBTPeY+7fM6zFPpEWGmEuTeJ9OkDVzg8TkGxHjQZ3VADp9SrGG61h2k+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782045076; c=relaxed/simple;
	bh=ORTD5oAI0ykJ0GY/bo3CQPqbxMooqiXtz8CcR1aIBpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kPtCf8nW3TIHtkSU5CjOmwT6qkO8lSgg+NhzrWn0SYcn4sXGWerKQulJqx9+5GnL2j5UgR7PlXoqnFOZ0IPi1OdMSYZpoZxtjBmtWctoI1DZTJiEFkexzz0GZIm4VI0Txgxie5e8EkkE8lPUWhPezRce7+WihWehwaj02IUHKBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=J8B3DRiW; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="J8B3DRiW"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 61C072701A;
	Sun, 21 Jun 2026 14:31:11 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_GLq3QOjQvX; Sun, 21 Jun 2026 14:31:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1782045070; bh=ORTD5oAI0ykJ0GY/bo3CQPqbxMooqiXtz8CcR1aIBpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J8B3DRiWTv9kktMgNU1wuBDzuLWrFAbbY1XEeKxvgAPA+OQpQemxaN3MiDBXs4+K2
	 s/wX9sxIX6rv8v2C9gfdK7dN2F+x7Ti6AGyNsFRUu+OwY8EWjMF77/f7naUx20r4TO
	 IaqGKCvMMjNx7Ovg4jq1ajHoXAcJR+fhKodPDxBHBa4hqswMnaG+40pt2TVXKJLrO4
	 BL5MiY9XJUpvEahD7oPMbLWfZi+Onb0AeX4RJqVLtxNtuWxmTdmzos5piw9i2q/qZk
	 qN2GAjgtWkSMLBfiYNoYEL+RJiWMsoPFJRybu8hwW1Z6bj66yjYrLznUYRmVulxLbz
	 Our4zJ8ejPufQ==
From: Marco Scardovi <scardracs@disroot.org>
To: scardracs@disroot.org
Cc: denis.benato@linux.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/1] platform/x86: asus-armoury: Add power limits for FA401KM
Date: Sun, 21 Jun 2026 14:28:58 +0200
Message-ID: <20260621123055.5465-1-scardracs@disroot.org>
In-Reply-To: <20260621090230.41249-2-scardracs@disroot.org>
References: <20260621090230.41249-2-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

As Denis pointed to me, Assisted-by is used for AI contribution, while mine
is a simple program to extract values. I'm gonna push it again as v2 without
the tag.

This patch adds the power limits quirk entry for the ASUS ROG FA401KM laptop.
The limits are extracted from the device's ThrottleGear XML configuration
file using my ThrottleGear program https://github.com/mscardovi/throttlegear.

Changes in v2:
- Removed Assisted-by tag from the patch.
- It does not provide any changes on codebase.

Marco Scardovi (1):
  platform/x86: asus-armoury: Add power limits quirk for FA401KM

 drivers/platform/x86/asus-armoury.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

-- 
2.34.1
