Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA52B40801E;
	Fri, 10 Jul 2026 22:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722728; cv=none; b=tEGEq0jnTrSN7qM12g0F1Uwpde2LPAL5pT5st73ocivRaGEGoFu3Xxx35F+uSWY7WVQ8IAH0jzFy4ebkuefRUUuErrVcA+ULDxBt/aeTZaZxqwB3QpJB8Cqk0cCGZvNQ9wuGTWtgT1vgDjfBKAS19BGICDc/baeN40QNXVst258=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722728; c=relaxed/simple;
	bh=DbGiR3RM1RU4YmqcVftx74ponHdHITzCCTlvlQ0xtUs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LbXL82sxpI+McRImxaTo3eXpZARZqlq3YLUeOvTz/Bda1TQ3drogvSr9yjEXTwQ4ndAWoE5zoEPT+0SIcoC8uRZgBl8gZ9QavPIUr6fypn60/8NM3/eQqKfPJC/LeqUOyXMTHU6KzJ38k6D3wE5iNyJ96kRZan7OkR/Uu+DOWnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pXn5v6EV; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pXn5v6EV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783722714; x=1784327514; i=w_armin@gmx.de;
	bh=Fon+MJPbpyTwRKN6CV5+7ZV69P6PPFtgwSVEVYj+/co=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pXn5v6EVp7WuwvIi4U5rwLZrxCWSHP3TmGGSEDHbn1jfQLB0DWTQJNRaikH7/X4M
	 9tWtiLi7U3AwELSZMcPiRzSmfqEh+XD6HVdsZ5pX5lxdBfwCiBsTAmMiFV/m2IvOX
	 PqtwqDF7G1K1N67IT3M6sinNri51CnQ9uate6k7CXDMgOVfUka6j/UXe0Zfpv3QlW
	 P++1Y0frCNQ6QgX6T54yoBlEHUnuEIoIgmos/lSx3xppdSsoPQHSbWwI29vKOGokM
	 Iz9ecTxSEIyYv107VHIsbx+ujbDiBqUmXtMyOfOQ0q1n1taUtXFov8dIpCoi30qCn
	 TBjy2D6qIAwOVA+u8w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49lJ-1x8TYx2UYz-015DnA; Sat, 11
 Jul 2026 00:31:54 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	wse@tuxedocomputers.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] platform/x86: uniwill-laptop: Prepare for extending keyboard backlight support
Date: Sat, 11 Jul 2026 00:31:47 +0200
Message-Id: <20260710223150.48661-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s9HsRDkcxA+BVlSTxgrYmZasYbtPbghCi7a0QNiHp52jNSbcpvh
 6B8JARtMVF6ImxTdrOghRtdXZNHnXpf1Ua2QiCUT4qSMzkkvxWxTek6+5azGZ4f/BY1Lgid
 jBTOZnE4QvfyGjktdtWUpyVdixgLfPalI4WsWb+sHyjEP//tF7ODKC8Mul8IuRuQpUxDycx
 GBe7fpwHsEKrQWu5VyUuw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CRmYZkOB/oM=;A3v7I6Ocb4TcqhV1TAWSzTLAuhv
 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
 uN/6Ikz8TJM+q7W7Bc=

This patch series contains a couple of changes suggested by
Werner Sembach from Tuxedo that are necessary for eventually
enabling keyboard backlight support for Tuxedo devices.

The first patch simply cleans up uniwill_kbd_led_init(), while
the remaining two patches make two key properties (single color
vs RGB, max intensity) configurable using the existing device
descriptor infrastructure.

Tested on a Tuxedo InfinityBook Pro 15 Gen 10 AMD.

Armin Wolf (3):
  platform/x86: uniwill-laptop: Split uniwill_kbd_led_init()
  platform/x86: uniwill-laptop: Remove single color keyboard detection
  platform/x86: uniwill-laptop: Make KBD_LED_MAX_INTENSITY configurable

 drivers/platform/x86/uniwill/uniwill-acpi.c | 132 +++++++++++---------
 1 file changed, 72 insertions(+), 60 deletions(-)

=2D-=20
2.39.5

