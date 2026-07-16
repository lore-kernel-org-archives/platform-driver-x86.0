Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA43A13AA2D;
	Thu, 16 Jul 2026 05:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784180028; cv=none; b=OtzkT6DY1YbshHqjjj17kB6624Aw2BQFzOPl85DEk460CxhLG2bPUcIaG7N+8gbLE1psfk1wqGOxW7xT/J0gwq7N4jPxDwOvUid+aqZPguu+8GOGQiU4qnsaJL1hx0xy3aZh6PXXLeIprNiMw9ut2IlUzJWlZAO2ghU5YmZsOpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784180028; c=relaxed/simple;
	bh=fiCOH4eMQXrBvTvpxDLh6EN7SYfMcE3ULxti8hDU6VI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s6ceZxbj0bKOw7JZKx3TSiq08j8eUmItRNm+Ld8b6iR/zPTeMVc/FwjvmTSNN3i+XM0b9Fcj0+Pp+3oZh8Z6dDLMGAnm4lbqe1/IbLrbeEMe0EEocoJh9Y/JYeDNA9LteLt7zhqJjsABddqW8WwO2k9TqviekQG/6U/caSFsTmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=icGIolYY; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="icGIolYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784180021; x=1784784821; i=w_armin@gmx.de;
	bh=AzZjfH9ReHTR8eqmGJIgLgIfXE8jY9RyRJbEKUAh+NI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=icGIolYYsIbBH1Da1s5xsH1R7hvxo0vbWpmIf/6NC3LdVLe6FLt1Py08SwfGWyTR
	 yuXTAMkJFvs3Dno5cu6oRqGOoo2OiHfXs0jTsrNBBSip/Mq+U0kYYQjUzbhizaCcT
	 QXzd5rFaboboY3R5SUSFWerLxjQ9JLiiX7JBDpQ+Pq1wXpJAkc4LCekLLGvWDI94v
	 sZkiWpeFaJVukqVjEZU3LGuq1tNc3wEJoMS0kswoRCN9/KhYyJ40HRqIbSx6ZWR38
	 hsDuIrrYh/PA5m809UNwbXDR6wEJTi6fYnuyN1QlqtAg1NNmjIDBUmdjY0mgeZbkz
	 BUNdxRtHVe9BT5rseA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBUm7-1wsiN83APH-00GGv9; Thu, 16
 Jul 2026 07:33:41 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: Dell.Client.Kernel@dell.com,
	shuangpeng.kernel@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de
Subject: [PATCH 0/3] platform/x86: dell-smbios-wmi: Fixes and cleanups
Date: Thu, 16 Jul 2026 07:33:34 +0200
Message-Id: <20260716053337.112533-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m+xk7rTK6V6GAXmq/gPZqMmFji+CFlH1VyNSFoR8VZ9//MXEFIF
 TY/B4Rvozm8QWc9rpTjDvV+MAwJTM7rKfyea2RKmB6VAviEt740kLSq2eKyIjwOUEMo3eK8
 XRGU3a4P/O126DL4cjIC3s5eZwSTztKXwzwVBeiiPe6ic6V+PjKYMwMAogAU1tu14S8L7ID
 GPhZf4SteTKELL2qNZyNQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sLKvpC8ah8o=;MUhS5nDgBz9UHzEym/QSPJ3fV2i
 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
 HunAFH7Oiemb9Sm8XE=

This patch series primarily deals with a potential UAF inside
the dell-smbios-wmi driver reported by a user. The first patch
fixes this issue, with the remaining two patches further
cleaning up the resource management.

All patches have been tested on a Dell Inspiron 3505 and appear
to work. I also verified that the UAF issue does not occur anymore
after applying the first patch.

Armin Wolf (3):
  platform/x86: dell-smbios-wmi: Fix chardev resource management
  platform/x86: dell-smbios: Pass device to callbacks
  platform/x86: dell-smbios-wmi: Replace global list with single item

 drivers/platform/x86/dell/dell-smbios-base.c |   6 +-
 drivers/platform/x86/dell/dell-smbios-smm.c  |   8 +-
 drivers/platform/x86/dell/dell-smbios-wmi.c  | 101 +++++++++----------
 drivers/platform/x86/dell/dell-smbios.h      |   4 +-
 4 files changed, 55 insertions(+), 64 deletions(-)

=2D-=20
2.39.5

