Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75C432ED29;
	Mon,  6 Apr 2026 19:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775504224; cv=none; b=mMjMNgfdOGR7PtK4/WXonVmGxsYxOujuyHpOEEe+I7Zdg80a/AZIRW4/t/mtfgZ4UeoHBTLmmsw37DB1IGod/1u2anaCcqRLIZi2T3sS7nlTXh8pv5PqD6h540cohiSO5AH9g0okfS4oodNkUrDr0qBfzIxM1AFESQXSwSzro2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775504224; c=relaxed/simple;
	bh=9ThidsiYR7knrsOxBs7JNgfF7D9ndQ7gZnwAvtYxWn4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AUtlnXQmVQAMC9No/vD3AYYLxEGpQpAvYv73sw/w+0uJXqb6FEJ9CdYxYfNuxlaL/0CwLGVtpNjbdRJk4u51+m137upjyHYlT2p4SM0KTP9uISVxwxVnGGNQV97h8RWz7und/eDv0U1VBa0H/SUaTntv57dhFvS0HEXJIF9d8Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=EGEilwPT; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="EGEilwPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775504221; x=1776109021; i=w_armin@gmx.de;
	bh=v/H1PS4/72f38A+gLb80ylvaF7onpFdv5qFcnaMgz98=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EGEilwPTggIeWFDQ2rAs+vAJJqzHEY72G2QqlK5TLxanB+sb+grrbRr/yKW3tbeu
	 egDaS7b73oKT9bI8kWMdCZC0xiNxUJuVVuT2V1I1IVYcaX3aNuB7R7e+Yzmm9hPkq
	 kdHB928P5YbjNpQ20QJGy+2zKgoMeQ50UsciT8urxEFNW31Ptlzp0ZncSWIKGHUDn
	 y/Kz1bN9UUbAe7yKfIYa3b02puCF4VZVL/KI6+vZxD8WYwjK/fhT79qWiPAfvGbl5
	 pQ0PC5DUsZuuQTA0KsMyFwa/0S4P0cmwIbJIejpurqXqW6FHoxu04AFa8ht05RcKm
	 zPaH29/OSnNQWN/Qfw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPokN-1vok6329cB-00Iojd; Mon, 06
 Apr 2026 21:37:00 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] platform/x86: uniwill-laptop: Charging-related improvements
Date: Mon,  6 Apr 2026 21:36:47 +0200
Message-Id: <20260406193653.7799-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rYdzBu0nd6uW+pRGYaFLwiLxZ7/khH6bZTLdXoXyrQAzrWBSlix
 4eI7Pb7tUg2OVBDAVHAmigzvoCvO8mERd84l9YBjOPmsl0GTvpBQtFkqWcNjAEKjTXSzYG0
 XywKAx0p9Zsxc6bo3GGHdUCn6dDX7qajTSpJLiCkHFEmsjHlTD14Vsk6oVrEfpQux3TIHZT
 gUfwZ8kVaGnuzAW0ry03A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x0DPeJFik8U=;5nL9qleYZBO99SACt3pGwGFE8vJ
 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
 3R

This patch series contains various charging-related improvements
for the uniwill-laptop driver. The first two patches fix some minor
issues inside the charging threshold code, while the third patch
fixes an issue inside the module initialization code. The next two
patches contain some preparations for the last patch. Said patch
introduces support for controlling the charging modes available
on many Uniwill-based devices not sold by Intel.

All patches have been tested on a Tuxedo InfinityBook Pro 15 Gen10 AMD
and work just fine.

Armin Wolf (6):
  platform/x86: uniwill-laptop: Properly initialize charging threshold
  platform/x86: uniwill-laptop: Accept charging threshold of 0
  platform/x86: uniwill-laptop: Fix behavior of "force" module param
  platform/x86: uniwill-laptop: Rework FN lock/super key suspend
    handling
  platform/x86: uniwill-laptop: Mark EC_ADDR_OEM_4 as volatile
  platform/x86: uniwill-laptop: Add support for battery charge modes

 .../admin-guide/laptops/uniwill-laptop.rst    |  25 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 431 ++++++++++++++----
 drivers/platform/x86/uniwill/uniwill-wmi.c    |   5 +-
 3 files changed, 374 insertions(+), 87 deletions(-)

=2D-=20
2.39.5

