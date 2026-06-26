Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch [45.157.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C08634F259
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 22:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782511344; cv=none; b=PESCh1Jsij1O/Yx/wPSBRhuC3O8FZWLZzEWEmeUI9HbqYMlE2iuyrkOzIadmSCsxvgYLxRSbdVsxti35GS6ehPx+e/reIKX4/kQLVOtSMzCaXq4YZv/Iy5rcPWZ5gFaakatriATvZKqJCmHTkcJH72CTfY1ktbMX3fYGFkYlhoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782511344; c=relaxed/simple;
	bh=BiLq2D8X+IAldcUiUMlIRcQux/CHoslC9huVWchiRsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QmZizSInIBhb7H6NtqxdYT28TrcyreUvsgUFOQQCr6hwFlFznpF48lX5XTthVIzqQmKOG8fPKz2glwv7Fg0i3BH0D5+dMQw03WEwfaeF1h+Bwl7mYrCLNSbbuMIrCsk5N/fTvaXZcbG6gunkRsIm4I20KA5VnsU3v4lxYAFa1YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=LXih9cju; arc=none smtp.client-ip=45.157.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="LXih9cju"
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gn8m658b6z33K
	for <platform-driver-x86@vger.kernel.org>; Sat, 27 Jun 2026 00:02:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1782511334;
	bh=avcBd25yxI8PzIV552HkSZWJ+p2AZ0LtTuU9p4gOq8A=;
	h=From:To:Cc:Subject:Date:From;
	b=LXih9cjuf+HnsiMXxLXZAmzQ6XhyxcVeznFKz62/Zp+q9a3FleJObC4TNzoVXsVS9
	 O7fGJaqLbLwTSNV87ErnhRuzRqBZbwVXUQH8U6vyJHMjkvrcpsaDBQ8TqQxrnfm69p
	 2o6tZUrLEV1VmmX2oQ8P6a4wqqt612c/GpfQCGf2rxheqLUeeTtRpYf4FtwJ6u6TgZ
	 qcpXP/iv9P1RrcDFHFbz2kkr4+xdPOaomWB4X+4X2D/Gj3jDP2+RwaqWrMRDq3k4bc
	 8ga5q5DJltW2tha+3uQ8Iu0LQlBm+r1aEWKXRfnJ9q93HFThjsQAUCdM6SBG30k5EI
	 XHPq4994xEqIQ==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gn8m61sxwzYpH
	for <platform-driver-x86@vger.kernel.org>; Sat, 27 Jun 2026 00:02:14 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Sat, 27 Jun 2026 00:02:13 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH 0/1] amd_pmc: Avoid "(null)" in log message
Date: Sat, 27 Jun 2026 00:02:09 +0200
Message-ID: <20260626220210.1761783-1-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

The kernel test robot complained that dmi_get_system_info(...) is used
for %s arguments of a dev_info() call, because it can return NULL.
That would lead to "(null)" being printed in those messages.

Ilpo Järvinen suggested using the Elvis operator to print something
that is more informative for normal users. Now "(Unknown)" is printed
instead.

See: https://lore.kernel.org/all/202606251540.Nr2BtaNu-lkp@intel.com/T/#u

Daniel Gibson (1):
  platform/x86/amd/pmc: Avoid logging "(null)" for DMI values

 drivers/platform/x86/amd/pmc/pmc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.48.1

