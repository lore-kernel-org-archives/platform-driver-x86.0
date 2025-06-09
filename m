Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3163219EB
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749473824; cv=none; b=ellWT+IoSnPmCnaaflt34HIiN4fyZ2qsFh3We3QyEtM4nClXZissS32hoaa0TViVHa5VRbpHWKKcExszpGvkRXhgquTbELTr6c3jxLe9UF8L9GsXkz63ZyzpwR/KVJMGele83OuhaMox2vBqFtHN31yHQZ11M6gWNJjeG4OoK9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749473824; c=relaxed/simple;
	bh=N+LuMWfMvaFP0XKeBRECxRe6bTTDV6KDGGkLcZN8Bu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ur3rXXz1dZl5KJBoDcWtWZTUhGp0fKHodbxNxxd3nXOIwtJ0rMpE9GHCDM56UONhN2XpGS3Dp1JLkR3rBykyH2/IcFJtyEKpHQFTWntH7ZK+JEjkE/vMr1LErqcTReTtk9XdalYBHfjGy70Od6ZFWfeD2KVQzOgzY2cuP8TXfeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twTda22B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twTda22B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273D0C4CEEB;
	Mon,  9 Jun 2025 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749473824;
	bh=N+LuMWfMvaFP0XKeBRECxRe6bTTDV6KDGGkLcZN8Bu8=;
	h=From:To:Cc:Subject:Date:From;
	b=twTda22BxCKS9TmZv4vz/3d4S2rfxfRfpmqFX8Gn3lJac1tcFqBuS7cSXM2AQ+H4p
	 z85O2Vi2xLPRPjqNZdEn/vXsguOB5ot9UPxL43Gshk98lg8A6nXSiLjJCbqAkyxsVe
	 2FEVNA/6Ms/pNHZb4UmKNHc6cefuWzYkSr9I4SSo3gvjEBYV692+mWTTUa8sBXbHJW
	 OPhpMoAbJXvB5gQm2KcZYBYtEjMzhUX77PxLaYOi68lArlciH/sX9p4siMmM1crHkU
	 rIDCr5H4uKUJd77rcDpH5MDdiskpN7Y1V7QOaXxxxlg5Dx9B0kiSUzCibLeqV6cbdb
	 b5IonCV0jh7hA==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/1] MAINTAINERS: .mailmap: Update Hans de Goede's email address
Date: Mon,  9 Jun 2025 14:56:50 +0200
Message-ID: <20250609125653.29882-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ilpo,

I'm moving all my kernel work over to using my kernel.org email address.

The single patch in this series updates .mailmap and my platform
(x86 and adjacent) MAINTAINER entries. Can you merge this through
the pdx86 tree please, preferably through the fixes branch?

Note this touches all drivers/platform MAINTAINERS entries + a few
related ones. I'll send out separate MAINTAINERS patches for
the input + hwmon + drm subsystem MAINTAINER entries.

Regards,

Hans


Hans de Goede (1):
  MAINTAINERS: .mailmap: Update Hans de Goede's email address

 .mailmap    |  1 +
 MAINTAINERS | 26 +++++++++++++-------------
 2 files changed, 14 insertions(+), 13 deletions(-)

-- 
2.49.0

