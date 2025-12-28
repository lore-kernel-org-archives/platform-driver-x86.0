Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F4E22A1D5
	for <platform-driver-x86@vger.kernel.org>; Sun, 28 Dec 2025 20:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766952520; cv=none; b=NcwTMws3I9dAEA5w4vcd7MOedoiUyY8CjKdD02G5TW4ptIKKt0yU1zoSjkDUhd+eqEdNky7YhvELiecSirrF8t7Sh5Q3ZNdmmnxQWqBNELH8cCvmgoGcenbym+JizIJet0I6G1V16kABJNHMjlMbFp2S47aNO3Xtjor7kw4blw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766952520; c=relaxed/simple;
	bh=siVU3FiTnlUkcfaR8W60pOQzPfgyKvJ4ZYv1XPp17B8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cYxisS7+A3fR9assYfxUiZTeKIZHmZthypYGPa7G1EmPALAAVSPWRqgytEif65tQtKi7wLCiu6oGZ6xVXB6ArnbeLkvs8Bilb1x48E6Wk5PT3oXRMIoiza5HBKcOiygkytRdLV2sPNN+pSAxyJWMxSavVsJVOvXDu92kkr7kkrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Df5I4Z17; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Df5I4Z17"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766952515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uMPybpHOJ/3RgA09XrvGwJg4KpEjJQJlsaLOYala+V0=;
	b=Df5I4Z172hj0PAikO9AWVHGQqPpMr4pJfhmKq+eOoz3ZCYJTgJM+P7zsH/54CpI85hPtby
	Fia9jExxxF2GvNmpRcm6WdBU237IdWgeOoZIU9Qx/Fmw/uEybNE0kqWvyZvDxSEmFgIWIO
	4VCn+RuiTgaZBX1qRPv6utYEd1buRSI=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	=?UTF-8?q?Merthan=20Karaka=C5=9F?= <m3rthn.k@gmail.com>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v2 0/3] platform/x86: asus-wmi: move keyboard control firmware attributes
Date: Sun, 28 Dec 2025 21:07:59 +0100
Message-ID: <20251228200815.794265-1-denis.benato@linux.dev>
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

Regards,
Denis

Changelog:
- v1
  - Initial submission
- v2
  - asus-armoury: drivers should be silent on success
  - asus-armoury: make better use of __free annotation

Denis Benato (3):
  platform/x86: asus-wmi: explicitly mark more code with
    CONFIG_ASUS_WMI_DEPRECATED_ATTRS
  platform/x86: asus-wmi: fix sending OOBE at probe
  platform/x86: asus-armoury: add keyboard control firmware attributes

 drivers/platform/x86/asus-armoury.c        | 256 +++++++++++++++++++++
 drivers/platform/x86/asus-wmi.c            |  13 +-
 include/linux/platform_data/x86/asus-wmi.h |  15 ++
 3 files changed, 283 insertions(+), 1 deletion(-)

-- 
2.52.0

