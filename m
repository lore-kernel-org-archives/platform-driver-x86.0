Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44CE20DD52
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Feb 2026 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772115591; cv=none; b=SpbUoqvmDbUku46gSIWAjMrOTsWO7tEYCO6Hu6ChbTMZ2Y4BXupGe1EbeNeK99iHwYcZfaMuVos9XKvRYwOThYEQez806cl83PfmoublLQvSRVDh0qWsX/mYV84TOg6qMSrJnAhN/kehzXt8ImQRCbJFRS6h8Z8mnB5keIuJENE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772115591; c=relaxed/simple;
	bh=a4j7SLdgYfPQMVNH+ETi6qrDelcHrGSxC7k0TF/DhzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HqN+A7v4vezB2RHtoe3n5BolDTqiBiJRKNZujRFCBXN0bE52Q38BEzasCQFxGEESpJa2jdrv2XxuSVZgysarkxoJGm6JTtEEZNWQzWS2fx7iFzi7zrZ0mQuCewGVWx9BQDP5W/okdWBqXq0/43TgNM5kMXk7tnGlIDgQxnZg14U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fBruXsu+; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fBruXsu+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772115588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4n6mgNRT2Y6BJ+rO42db5g6RWCkOJiFQaiDZslEPzSc=;
	b=fBruXsu+m3ZRQhuuYV60HA+SjjAdwtBNJkQFdx1wE9U9DE7JT5knwYeFq1no1e/vvPAhpP
	8MnzYggNGIZcLwA+UCTpOttRe8ccXMeukqHH/67THcy4uDXYN8vuvSnKjaCLMiCxhr+Flf
	vkfi/+bkV+DYrL9WhunGXLZcvFAK2GQ=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Denis Benato" <denis.benato@linux.dev>
Subject: [PATCH 0/2] platform/x86: asus-armoury: ppt data for two models
Date: Thu, 26 Feb 2026 15:19:42 +0100
Message-ID: <20260226141944.352923-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

this patch series includes PPT data for two new models: GX650RX and FA401UM.

Cheers,
Denis

Denis Benato (2):
  platform/x86: asus-armoury: add support for GX650RX
  platform/x86: asus-armoury: add support for FA401UM

 drivers/platform/x86/asus-armoury.h | 61 +++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

-- 
2.53.0

