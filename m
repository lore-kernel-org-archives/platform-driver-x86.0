Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234811F16B;
	Sat, 19 Sep 2026 05:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795029; cv=none; b=W+yFOaLznlOYyNcclbJMKHfP6uAibVAYylV8qA0Md6/N4ssFUVSZiIof2X+fv2eucv1t03Urw2hyM7CVby/kFRGW/ZVUa1CGWOuH6sNLYa6OTtgUp8UM1V86fxkGvCP8++VryY9W6kExIKGs8IgN1h4dQlHVmnTGH2kbicmH94U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795029; c=relaxed/simple;
	bh=58jcbRHoJwGO44DVTHlayDzZlj5mJDPRX1fcemLOiXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/O9FZd8ZrlzY62oV57liM0/63KPVaN3+5onk0PYjlWB4qsW6va/PBj0webbInrbg+ffm73bjeJTlpcDbV5rRbe6Um2cTOY/5IYQs2rEgxszluznlyRGLqRAb0ZwA5RMxJZJ6PxtRtjw/3oTJQfnSSyR9sD84Rdz/Yiql6VwRtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HyftP24G; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HyftP24G"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 09B7D82DBA;
	Sat, 19 Sep 2026 07:17:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNjMKAx-554b; Sat, 19 Sep 2026 07:17:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1789795024; bh=58jcbRHoJwGO44DVTHlayDzZlj5mJDPRX1fcemLOiXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HyftP24G2mhyLtCN9tWkwPSY2uOrNtuXJ2HmFESaQ0Ttp8hFvklEpTARGPaV4OwEV
	 nGYK66MQkeVYeL2HJV1z8XcYq7yCn2RHWTJ6AyoAB9Z09vznaNBIbfH9GRThpUS+vx
	 MFK4uzRmcy94HBE4wCHGXfmDVvtuqXC/QB5dEE3f/RjEiMN3j9n+QRk/soxSSiEwhz
	 YHF0TejPJxfiE3qpXzhX5xCOkg6A2mNf7dRWrz4+K/WwS4af6pEsSGc4ovtr9YHbVF
	 MZYycATfJMSkd5ukp4xj4Vgf66zg0SRgvT/ymThjf/1lJDSKtOc4OAxy4jQnXaWmb4
	 Do/+DpefTcW4w==
From: Marco Scardovi <scardracs@disroot.org>
To: ilpo.jarvinen@linux.intel.com
Cc: scardracs@disroot.org,
	corentin.chary@gmail.com,
	denis.benato@linux.dev,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/1] platform/x86: asus-armoury: add power limits quirk for G614FM
Date: Sat, 19 Sep 2026 07:16:16 +0200
Message-ID: <cover.1789794282.git.scardracs@disroot.org>
In-Reply-To: <2ac49a94-be85-1a2f-a43a-a376d2545a01@linux.intel.com>
References: <20260828065904.11355-1-scardracs@disroot.org> <2ac49a94-be85-1a2f-a43a-a376d2545a01@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ilpo,

thanks for the review.

While working on some other models it gets tangled with the EXACT_MATCH
in this one too and did not notice. Some models contains both the "base"
version (like G614FM) and a minor upgraded version (like G614FM2 or
G614FM4: it's not that the case but we'll use it as reference): these
models have, sometimes, different Wattages on CPU/GPU so we can't use
the DMI_MATCH for these, as the 2/4 models would end up inside the
base model incorrectly.

Changes since v1:
- Use DMI_MATCH() instead of DMI_EXACT_MATCH()
- Place the entry with the other G614 models
- Fix indentation and field order to match neighbouring entries
- Set requires_fan_curve, as on the other G614 quirks

Link for v1:
https://lore.kernel.org/all/20260828065904.11355-1-scardracs@disroot.org/

Marco Scardovi (1):
  platform/x86: asus-armoury: add power limits quirk for G614FM

 drivers/platform/x86/asus-armoury.h | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

-- 
2.55.0
