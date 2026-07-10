Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B0137CD3A;
	Fri, 10 Jul 2026 22:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722953; cv=none; b=h6pNOg3F/PvwIc+3SyZuCfNLLbGRl2SKplYXtNfR1fFrtJYxI0SlUL8LeVu8VsZY0jfc14zHC7OCOfbMRrMY07wUZ2pUDKRMHMVNGZqeIBFO2uXRUl+fIxPqeEt03LoPn8LPj0BE/eQDqQk6zcluLrCtjNGWKdbXmjZ/Z22Wpd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722953; c=relaxed/simple;
	bh=6a5dcW1ulYqfHprGFv/xfkKhwom5ApYSaxGYJW2mYoA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QYzhgth3rhZTIE8MvrPpGVJE3n8da1Z1F6EgtqDeCjuH6YUS3xlfMwiWVZUY3gz6vtku98VYDm2X2tM19t+t9pw06lDptCB30UCX4ctnakUzoVI/rXWaf2dXWpL02CYRhkEUGNU3cDNV0ZXlE99NIajBP2I65dU7kycUp20R8kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=PDPmYpGd; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="PDPmYpGd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783722946; x=1784327746; i=w_armin@gmx.de;
	bh=IaVxeiHfgXWnhHrajfUsVMXT57bA3Qyqaus5/Xs2M9Q=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PDPmYpGdNfxnew+YewBi3SBABGF+unJqoR6UcjJxvNaYk0aDPIeYiwh6vwzYC3m5
	 2ydyOQbgJsVj0oZBN/q+Czl1O8J0EgJgly9NJwsbQFnmtiRdLgOtTSc8g0k34VGCC
	 movIGij3sn1UVF6fW2sqhz19JGL9Vk+SZZx75IsgU5mrhUb9K8vHwD66jSrw3mvHr
	 8MKPc9PQFKUppgtpLrOS19vgU7LDZxbGtdVYK+4p3nSKuewoY5eUeQITfdb9jSgrw
	 seFI5z/C6rpwsSKDXDg+NeGei5E1owTpRZjUSKyhlQPoh80snmFk8/teTyWuKiuuK
	 wF2tSHha+YtZgBLg7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7i8Y-1x4sj53Oi2-011dPw; Sat, 11
 Jul 2026 00:35:45 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	wse@tuxedocomputers.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] platform/x86: uniwill-laptop: Prepare for extending keyboard backlight support
Date: Sat, 11 Jul 2026 00:35:41 +0200
Message-Id: <20260710223544.49602-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9rjz4oZsCbb8/YHB5/YmLGreUB+HYUAWrNQ8QlK75yyYTaap1HK
 8kjjrPfTudi8IiUVy/n/TDCRyv8mBmG5PD7u7KmgnKGVbCN5XSuPBl9dlkxRknTGmu5E0lb
 TwKk3gSxxSXJ2HXa4/cbL0jkmRm0xnX78KeGH00wK6VOIllvFiv0XDNJx7zawX8l4VMDWE1
 noCJqOnYGbEkDYjBWnfSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:98gnGVkqHH4=;czTNG1xLm4BaX/WENTe9qxlYorA
 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
 G0RKi7/aK5Z4Ce92EY6q//UvrP2d3jW000CXZ6Q

This patch series contains a couple of changes suggested by
Werner Sembach from Tuxedo that are necessary for eventually
enabling keyboard backlight support for Tuxedo devices.

The first patch simply cleans up uniwill_kbd_led_init(), while
the remaining two patches make two key properties (single color
vs RGB, max intensity) configurable using the existing device
descriptor infrastructure.

Tested on a Tuxedo InfinityBook Pro 15 Gen 10 AMD.

Changes since v1:
- add Suggested-by tags

Armin Wolf (3):
  platform/x86: uniwill-laptop: Split uniwill_kbd_led_init()
  platform/x86: uniwill-laptop: Remove single color keyboard detection
  platform/x86: uniwill-laptop: Make KBD_LED_MAX_INTENSITY configurable

 drivers/platform/x86/uniwill/uniwill-acpi.c | 132 +++++++++++---------
 1 file changed, 72 insertions(+), 60 deletions(-)

=2D-=20
2.39.5

