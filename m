Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C9A824BD
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Dec 2025 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766673015; cv=none; b=EMzNaV3giQQOBd6yggtlL/XrBIUCOdUy3tXpcCaQuEEyxxeMIeJKPY/8acGnXRxW1odDZaIgLd0DicRdTI8x/PXysTPCegOBklBRfOcUtVfiGxXsgOfoDmi7TVcrT2WBUVGxzMxH2J1S6Tusw33bbITWlh+vNLhCX2UWHpxpmhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766673015; c=relaxed/simple;
	bh=VsdfCz9GOj1hUElug2G0iPLzXv7+vP1/SADKX371iQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H78v2IL+W+gQVktADaPl5Dn1FHyPVkisSaiW1qbizOmG8ROesAo44iTEQxU4jWy0gIIVKbKE5AjjXTCGTM2kOTu5z3PExm4xnKQl641tEEUCRdnl+dvO4R9t4WcLIZHrKCThqGarJEwkZuNC4b6AXhvh49X++1kF4DZ5dnLnjCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vwPRFKV5; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vwPRFKV5"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766673011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0FykCWHe739CLwnRp+OSfZRmxf3KpN7g1Ifv99G7HyY=;
	b=vwPRFKV5GGm2eN3jRwzYDKzeCG3k6EXq2TS/CUSZOrMAvtZl7RCLeX09kj9gKs99edYsbw
	8Eaq9zaHZEcjBcqIwy7UXzDUjy4XGsv8UtaJ8IkJAe62MSQr68Pj7/uaZhLojE6EzyE43S
	LehyeC0T6O8ZPC+I+QkRFTkB1J9Jf8o=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 0/3] platform/x86: asus-wmi: move keyboard control firmware attributes
Date: Thu, 25 Dec 2025 15:30:04 +0100
Message-ID: <20251225143007.2684239-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi all,

I was recently reading through the asusctl issue tracker and I found
out that some users have been having troubles with the keyboard RGB control
that was working before since the creation of asus-armoury and subequent
deprecation of old sysfs attributes.

This patch series aims to re-introduce those attributes in asus-armoury
so that userspace tools can still control keyboard RGB lighting
without having to rely on deprecated asus-wmi attributes.

In addition to that, since disabling OOBE is essential for controlling
LEDs on some models and it was incorrectly tied to deprecated attributes,
this patch series also fixes sending OOBE at probe time.

Link: https://gitlab.com/asus-linux/asusctl/-/issues/619

Denis Benato (3):
  platform/x86: asus-wmi: explicitly mark more code with
    CONFIG_ASUS_WMI_DEPRECATED_ATTRS
  platform/x86: asus-wmi: fix sending OOBE at probe
  platform/x86: asus-armoury: add keyboard control firmware attributes

 drivers/platform/x86/asus-armoury.c        | 258 +++++++++++++++++++++
 drivers/platform/x86/asus-wmi.c            |  13 +-
 include/linux/platform_data/x86/asus-wmi.h |  15 ++
 3 files changed, 285 insertions(+), 1 deletion(-)

-- 
2.52.0

