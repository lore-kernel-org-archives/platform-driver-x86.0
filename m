Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010CD2673B0;
	Fri,  4 Sep 2026 22:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788561945; cv=none; b=kiwPiyW2BNaW0SsN5SQb3yjElDJL5LBBuGuoy5deXNtMJJIUzgHq346S1v+74nWijfoL/G89gu7HRcQEWHh7/IMWLIGNdb29SsTiefi0IedLKjXWFiSbYqRe35Osm9u9mvgmsl/zsWKKTbIvWag6WDOhMsrpapvt4ItGdEOwHj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788561945; c=relaxed/simple;
	bh=D2k7RcwlARShOBm4FxsfA5oqMkl16DC0kT8yKfwwkg8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VAGaWcjhBbN30OB5n4YAT/9aYBQGo2Wj7HutuA4mYwazKz6rBY0NPrzb0WHIYznkRDXwNHxT/8Zf2ZHGoUV9ORDMp+9HO28D4reyNByrLB7If7FbJ7ono2gFyDqmj2nxtb57pCFSng8pJotNTChXCJTOzLUHR7zjtbmKipdjZRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=UHhqx+k7; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="UHhqx+k7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788561931; x=1789166731; i=w_armin@gmx.de;
	bh=BvIAchPQxj+vIBAWC8vmMWZAFgyZzUY+ZlVUQ7OV5d4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UHhqx+k7ROKw5aqv2sh6uXQds4Gi5MASylTeG2CUSOkhR4tYzQG1j4FlNzK2hzZ7
	 IsyDxqHdf9DDeyH/HMSJJXxXoiJVrsihVPQutW3C1VNvy31PjMPAV9rXtRwgzRd79
	 tGPbEktPMC0YrNvfD7h0lym/6pOSeCeXweUtRoyvZcjNO5pD6eQCP+FAe9BTatQ2t
	 4nM/OF48OcQJZpQQYDm8rgGaPYkOIaSUss0ctj3CE7XTMGkbabLDihHjooAVlcJYa
	 p9nX3tZGhWOA1aET8iEpSlQqZpCudBTk2Z0zE4GgugUsUd7DpKShCWkkn57onyhQE
	 mwrJBuctBTbNMCn2iQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMXQ5-1xKQnM01wt-00LjUD; Sat, 05
 Sep 2026 00:45:31 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rsplwe.com,
	rahulbheda131313@gmail.com,
	kento@kekto.ru,
	qby140326@gmail.com,
	martiya.ar@gmail.com,
	vlku.milos.fun@gmail.com,
	mm3885525@gmail.com,
	wleizc7319@gmail.com
Subject: [PATCH 0/2] Fix for platform profile issues on USB-C-only models
Date: Sat,  5 Sep 2026 00:45:14 +0200
Message-Id: <20260904224516.8893-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wfWBIRpmWzYES0hysGIntcZIqXhyQd8FvWMnWNclduH2Ym40OWo
 VTsznQir/Os7y1AmQVavn+rWOtilwkPP3Myy1fQVDklWq+RCfqiwMY1eJ9YiA8XYMIwBirN
 nvg0ojPCD1rLn3cqUV0x/9r2aBCrK2nNJ+Jx8zmB/fmAcCq/pDyuGJVcTM1q48W8a1ObYHP
 meeNadrTPvFBLosoXv/Ug==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OLIBtvow+e0=;9TGql6McLPycGdvStS/ZSmNkYV5
 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

After looking thru the ACPI tables of various people having issues
with the bitland-mifs-wmi driver, i came to the following conclusions:

1. There seem to be multiple flavors of the Mifs interface,
distinguishable by small changes inside their WMI MOF definitions

2. The buffer format used to communicate with the ACPI-WMI firmware
operates differently than previously thought.

This patch series addresses the second point I am aware that there
exist multiple outstanding patch series that partially overlap with
this one. All of those patch series still rely on the incorrect buffer
format currently being used by the driver, so i suggest that this
patch series be used as a new base for future patches.

All patches have been tested by a user on his Redmi Book Pro 16 2024.

Armin Wolf (2):
  platform/x86: bitland-mifs-wmi: Detect failed function calls
  platform/x86: bitland-mifs-wmi: Treat WMI_FN_SYSTEM_AC_TYPE as
    optional

 .../wmi/devices/bitland-mifs-wmi.rst          |  64 +++++---
 drivers/platform/x86/bitland-mifs-wmi.c       | 146 +++++++++---------
 2 files changed, 117 insertions(+), 93 deletions(-)

=2D-=20
2.39.5

