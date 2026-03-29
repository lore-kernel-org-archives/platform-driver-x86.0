Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262EC3C07A;
	Sun, 29 Mar 2026 12:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774788432; cv=none; b=L1/gW4PDXaU1DGPv8r9uOQwkLJ9HMne4daGPezrx/TBlsTuy2FTgbcLX8Jm+hqp3oj+INBE1Wcx8f+O3b3M3ULgRzc3INiORFxsQRwodptnYclS95wqNHfU/Pb7jNb9OQgGN70ToiO7bEeWk+DtZUUh+/UQfW8p2otlUJrZNxmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774788432; c=relaxed/simple;
	bh=OEh3u+GOIWkisB8IehkcroDyEkPV/N4twJGRPi/i+kM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nniNgVzpHYDTfawzdFJiq4Cqjj8s+k/TBNHLgJNnhDP2hth0ovaKji0uBUkevqHK+O2KBsbA6XIp5Xz1h3cRk5CUVKTdRISGgcAfL0u29dEVbkr8KRhciXJ+6w9hrydNee5eSoROFQVUOs/dRoGVFBmbz86i4PFedCGfmKXKFM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BM4FxqsL; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BM4FxqsL"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774788429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G1vdvEOcH/HdN+8Kh6+38yl5XFL80UFAj3fh9ZjMopA=;
	b=BM4FxqsLMpkBxhPf4X9ubNn156O7GC3d2gL9jm1UF6xQi3gN1eEgxNfsN+WKNKG9lji3r+
	Rc2f+Kk4EtZKwWTQalQENtF89gw/z67yIJMRJSkk28XrO09g9eGm7sxi2/koKy6BMnh3VH
	KZmT94J4XESLKLA53+hAaqLgCF23dS0=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 0/3] Add three more ASUS models to asus-armoury driver
Date: Sun, 29 Mar 2026 14:46:56 +0200
Message-ID: <20260329124659.3967495-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi all,

This patch series adds support for three more ASUS models to the asus-armoury driver:
the GV302XU, FA607NU, and GU605MU.

I have discovered that GU605MU model has configurable TGP that was not listed
in the GU605M model, so I have added  a specific metch for that model before
the GU605M one, this way the for loop should attempt to match the GU605MU
first and if it fails it will try to match the GU605M.

Cheers!

Denis Benato (3):
  platform/x86: asus-armoury: add support for GV302XU
  platform/x86: asus-armoury: add support for FA607NU
  platform/x86: asus-armoury: add support for GU605MU

 drivers/platform/x86/asus-armoury.h | 86 +++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

-- 
2.53.0

