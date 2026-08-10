Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A0D4B04B7;
	Mon, 10 Aug 2026 04:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337280; cv=none; b=ho4yYLTEr+cyOPibaDbTFDeL4tvWnM+T46C382DcuIXx7FopncTI77/pVD5ApBHGzhjLVudq75VdoSP6eYTl7Tqc7p+BbUIOFi06Y50VrG9jfAWluYfv2Y462YtCqQLdeheUCq6i2Ym+POJGUnIGEZ7fDNH7lKtRWVIiNIwKs70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337280; c=relaxed/simple;
	bh=KV0FyRUemZ8OWLoB6vgwVCYs+bEH/RacwscrbPwV4II=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=QeGDPVzFzMoMoDuU5QAwSMe3GcoSE/PuN9Q9MSCBHTH7dfzNPnCygI1x66O4bB3OOfznpixeOClqrIYIEteUfUyd+ExPdBW2e3fFXap83I5JEm7SkZsy54vZ8u5HVufCj0omSkLD5+FpgkxY50+ItS0cUwt1PWfYAh/mGm9BWIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rsplwe.com; spf=pass smtp.mailfrom=rsplwe.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Y31VQzio; arc=none smtp.client-ip=203.205.221.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rsplwe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rsplwe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Y31VQzio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1786337275; bh=FNZ3eCshjT+SH98gKX4KVjG/8iY3p5KiutHy2kh0ohQ=;
	h=From:To:Cc:Subject:Date;
	b=Y31VQzioHJKG9qweTeoDE0FwcbNGinj85JKPepaEvD7xOuGyE0i1r6Pav5egEQolh
	 lN39nLcMhe6gLdLygqcl3Vu6pf9PirLkikcN+xS/uiMF/ujj2BCTe5TUhe/HFFPTU3
	 pMAhkg+D7/NNmc4b2P35NBfpJpF+rFQHsLk40ZLs=
Received: from kasumi-star ([14.218.70.170])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id BF4AB415; Mon, 10 Aug 2026 12:47:52 +0800
X-QQ-mid: xmsmtpt1786337272t7zq20qaf
Message-ID: <tencent_D285050EE3C40A1536F996D142E5F6CEFC0A@qq.com>
X-QQ-XMAILINFO: NC4p7XQIBeah7Z5MvzCg62+I1onYIpTQnQ8QsWm7Uhy1rX5rkS3/lIwDpd/gIf
	 UfK1eAWoyo1PgJirtgfSRSfY8AS3HqtFgRjo5Wx7wyyy3oL9478e+pob1bCFKI0da9wjjE7YHu5K
	 Ma7Ve29YPPLp/3OyYRJzOWXxdUbn48rPhYFq2IEWeVpLqW5xdPZ9xZDC41Q79jalVRjsGYGJw3sd
	 2Qi6Li0ph6FKX2WFuqubUhiPTGIm355ozgUiSDQ0bo6YpkNhYMiEMqIAaZz6RMul4sHTIxy+/ghd
	 uirbe8GuAY/L9XZEJeAqY22/SvSiAaRrCehRb2Jf7GFtKVT4p26oY3vwvRlheV1RXWKkmR0JaZRb
	 /J5iDuJpcILeH58uFOTdJR54wKis7Ff28wrDtN3ZSeIaKKkT9QPLe50qwmLrmhfS1obh6Ebl/YGs
	 PJf9RbPqZ1NmOfFoel1pIgwxBDeQcHKarUDk62c3gh8o33+lxGbmrlUY3WxNIXT0aHC6HE4N+9lw
	 PjE6pQl5FdGig5OQ0i1YiGxwue9rZ+murtxy/vbd99mDSXj+7TvTgFF8SzOpzO5vmT01pfExPBq0
	 L31xHIWBA3mWp1ImuL1fNE77XfF2TUGjl99z3xsL7UrxOHju2kQ+XdHtrfv1ri+zwmz3Pft4AmxH
	 jQRdKxnSFfSOT+hyxI4HSdaJ91gU4GQf/5BmQgXQF3JNk0kjsaseYqLw7CVnkg1Ss/QgE2TQ7qaM
	 woSB1n3g1dPcVe3+zOuqTtDBG0xbMGZQ83akIaEc0b/xT68B0RZUAnHueiX/I4jyyFAd/07DUlxn
	 VYFKxTvQe+sqIjJtqDTm6yIOMkkFFDvyaZUHvXee6hV8kDOZ1+doxZA0VntMjiy5yR6zI0l5bCEs
	 nJzj0foklhIk3BGw5eNdXCmEEz1m9uw/trKb8hLN2+5grpMfQN2izaXEigOM8ideSr+9eD9EeLx+
	 Ar6GHOsmxdaV0kKKUsw06egqojm23a+zf0jlbM0AnT/eMgIyxFIy7qSy9/jjaJkpOdnjFfgqgqIE
	 RECSoaKVsI1Bi6XMZ0WiItwRa0q/Ws5HRNiPnVXxGW9OCl076WJmSvOw6MmE6kHV27pdvWphHDUS
	 cZdii0G+xxugdlJzqstoeDIxHZ9yrlu524pcTH
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Rsplwe <i@rsplwe.com>
To: ilpo.jarvinen@linux.intel.com
Cc: hansg@kernel.org,
	W_Armin@gmx.de,
	qby140326@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rsplwe <i@rsplwe.com>
Subject: [PATCH 0/2] platform/x86: bitland-mifs-wmi: Add device controls and MRID6 quirks
Date: Mon, 10 Aug 2026 12:47:46 +0800
X-OQ-MSGID: <20260810044751.43045-1-i@rsplwe.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds sysfs control support for ambient light, Fn key lock, and touchpad lock, and applies quirks for MECHREVO MRID6 devices.

Rsplwe (2):
  platform/x86: bitland-mifs-wmi: Add sysfs controls for device status
  platform/x86: bitland-mifs-wmi: Add quirk support for MECHREVO MRID6

 .../wmi/devices/bitland-mifs-wmi.rst          |   4 +
 drivers/platform/x86/bitland-mifs-wmi.c       | 228 +++++++++++++++++-
 2 files changed, 225 insertions(+), 7 deletions(-)

-- 
2.55.0

