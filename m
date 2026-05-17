Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D451A331A44
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 22:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779055229; cv=none; b=kQ9T1ETU0bY80AjjZ7xSia2CStvwxfMEQGmZQMGwcDsD/IY6pTAIvDO7fHMJxPId85+PD7ZkwhRkTK9NZDBpQs+I46APSN4acN5N2WFMCE4mq8vh+7EPK9leKtj5VNyOgGSqw+Hj9qz3t3Pz7RggQKOkCiLkREPVEWsJV4F35oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779055229; c=relaxed/simple;
	bh=FckaJVo5QuleU/s6OEl/yhbw4UyH4DEsqWqc2EYp+Yc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rZp0T9jAXpJvFVSWzPG1p3jk1hb6pUlyKKKM7BsNp05hX329/Z+LQnPq6JthTRn/bzSw5FjhnLcpLMDTNq5mgpYHhroBGHTkfa6XukVelOXh/1aDGqc8VeWtW8T5JQOyZwee3fHjW7vQEa6L7e+be/M77SQCqM+/W+Juzyigccs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KV/gTlQW; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KV/gTlQW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779055215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DYc6bSFYtDfDmsNTzoL7uPXyfEhUlDYo49Hk46ywxeg=;
	b=KV/gTlQWK7BwXcUDjUBmJkbbJRbrTvZCpuJtDY+5bnSQqEffbtonXGs6jMZFtXSz6ma2wi
	RyZy1a+giXk+aGF4Vjk9RC9sPRE9YWlyru2AS5AUHmsn+wK9aZVoe7Hhhw8G9HAXRLTe8P
	KDBmEkIDyEnYhdR+WBpQEZZjr97t+O8=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 0/4] Add four more ASUS models to asus-armoury driver
Date: Sun, 17 May 2026 22:00:01 +0000
Message-ID: <20260517220005.4594-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi all,

This patch series adds support for four more ASUS models to the asus-armoury driver:
the FA401EA, G614FR, GU605CP, and FX607VU.

Cheers!

Denis Benato (4):
  platform/x86: asus-armoury: add support for FX607VU
  platform/x86: asus-armoury: add support for G614FR
  platform/x86: asus-armoury: add support for FA401EA
  platform/x86: asus-armoury: add support for GU605CP

 drivers/platform/x86/asus-armoury.h | 113 ++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

-- 
2.47.3

