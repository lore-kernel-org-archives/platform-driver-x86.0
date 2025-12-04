Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EB6238D22;
	Thu,  4 Dec 2025 13:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764856182; cv=none; b=aSIMmfDYse0PsrNm1P+FV8JkOQjo3Dz0a8KrHyrElRls3PYrLzsIRb/4a4mYlbCjpfAFExqg/Q0hB+GA5c8chQdI3MobYuGeWEKmaLaIFjSqj797X874PZ73SZ6RG4MF5wSeHFAuJ0xLpPG3NcpkFQMqpyAfDnDxkyAOVKIDT68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764856182; c=relaxed/simple;
	bh=D/B/muHhFoDlztj0vriE3bQA892nQlL+ETslMoKJO+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tSqhAC2LJK+BbkeHSMsARqng6YKGG8FbpKCzGqeqOHi9e2bnZX6qSctDHUwWqtYFJIb2qvy6TEWlF4+nR7OQgvoYjOaAw7MyJmJlojt4gZhcjuIpAPA482Xsxmhtp9Sbtpfi5VrQRZfPHkDT+XinvPXMcuYWcGQKls9fewEOfI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=SNZrykCv; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="SNZrykCv"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 29F232FC0097;
	Thu,  4 Dec 2025 14:49:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764856170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cyRUIgOFhz4311zcAeD44c5ok0qpMfwX0bv7/8K1it0=;
	b=SNZrykCvZ/OLF6GBHAbU893qPhISX6iuA4dtLQaXr1KXieYLEg1E/ryCu44KdmurytEMNe
	dJQhO0CMoRWatKuKDdwoP1/PD5kE9s29NJrwb38QIbq3X6hAq5aX/n0h6/Pp9nzSu9Wllx
	oqnRXWT6osGG8YxqrNyVq7+yPcvySyo=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [RFC PATCH 0/2] platform/x86: uniwill-laptop: Introduce device descriptor system
Date: Thu,  4 Dec 2025 14:40:38 +0100
Message-ID: <20251204134927.434158-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch is based on a PoC by Armin and extended the be able to
modify feature bits based on readouts from the EC Memory.

The 2nd patch is a new feature that requires such a modification.

Changes since RFC: - more flexible uniwill_device_supports
                   - minor cleanups
                   - initialization of cTGP before activation

Armin Wolf (1):
  platform/x86: uniwill-laptop: Introduce device descriptor system

Werner Sembach (1):
  platform/x86/uniwill: Implement cTGP setting

 drivers/platform/x86/uniwill/uniwill-acpi.c | 284 ++++++++++++++++++--
 1 file changed, 255 insertions(+), 29 deletions(-)

-- 
2.43.0

