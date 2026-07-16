Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35DA2475F7;
	Thu, 16 Jul 2026 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219143; cv=none; b=PvRFdOzMXQqatfQync91oXNaxzTqr6o69aDp7vpjqriAEQhRwvPmpVeOc8EATHHQTmAB1USUqiAH/ddDx8sHVXir0+ZzJMzTGiG2+qG60jHyCKk65z1LuaWtt3r/jjzAlJD8wdn8YWck7egienz+ijjIU8FTbVFxGF/6q45hNlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219143; c=relaxed/simple;
	bh=s5DpThnhWAkmZG2WwsMsCH9WNxfrXvCwyJLjAit0vmI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q2E3WHfIHfWePiTiddICqIJ5kHtTsAwOD9PEK6WndVwrdpaMQ5o8tRVS+p+PvhxH7QELbDEbpmBxMqeWd7KYOhQ1NQ1NfR0AbwocfScBpmf/t/ItnpXjupVdnpEoD7XyIXra7yBMMDwyq7D2Lak8nnsFibowUDOrEisORNGFFag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bDNIqYm1; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bDNIqYm1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784219136; x=1784823936; i=w_armin@gmx.de;
	bh=SvQGMYkzjGiNyIZDWBkhMs6GUkOonUHHOLONDSj0Ido=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bDNIqYm17p1qWRb8CdDCbeaqaut74eqF15gSodgyZchCVqtwntUSiur9I7aVy/rI
	 0faWD/xTlMmumeH3OZULrPWyXnReYT1i3NMx/4Il4yiIH7e4QO3/0tJ54Bd84Yzmz
	 9qbmji10DB+uXRIverqmIJO/IeJAWe4a2Ra34zk9kxsk76qWSHsPm0mQNt0xI85jq
	 b9jpj1HKMYQZEZPqbHUj9LVVhEPxO6JLm+KrhHSt+5Y2XmGyj2+3N85xsJwsAmFpy
	 PhxdT/LdqvjuXsiVAAMuNjwrqvt9t4gV1hFWAAVyucrx/2jCNUf4JvkyTC8zqPUAu
	 4LD3bP8kCHlTMLDuig==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkYXs-1xS1So0s3S-00gneA; Thu, 16
 Jul 2026 18:25:36 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	wse@tuxedocomputers.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] platform/x86: uniwill-laptop: Prepare for extending keyboard backlight support
Date: Thu, 16 Jul 2026 18:25:29 +0200
Message-Id: <20260716162531.5744-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KrtNeh07csfrC8Tymgtkajys0WbIdlR8C9Klpd5yiYua5Fk00Lx
 hMAUhkwpsnkXepB5o8gkKRh+ycvCe0ajxMx2CqCOVm+20hMRZ0AfnRlqwZ3U2Q/hRnekN4o
 tAkxd5KPzEa5lkYtpSRbc/dn4+31LIutDulpj2dl96ilB3xxk3p29n8KRIjQRsYz6sAqZyB
 LPuHyWUZFvDVcDJAaIidQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xGsOpjWUy/w=;yWlI3pWHzJAuosFee5mlxcgfVWL
 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
 dzR3zdHlw=

This patch series contains a couple of changes suggested by
Werner Sembach from Tuxedo that are necessary for eventually
enabling keyboard backlight support for Tuxedo devices.

The first patch simply cleans up uniwill_kbd_led_init(), while
the remaining two patches make two key properties (single color
vs RGB, max intensity) configurable using the existing device
descriptor infrastructure.

Tested on a Tuxedo InfinityBook Pro 15 Gen 10 AMD.

Changes since v2:
- drop 3rd patch
- add Reviewed-by tag
- reword commit description of 2nd patch

Changes since v1:
- add Suggested-by tags

Armin Wolf (2):
  platform/x86: uniwill-laptop: Split uniwill_kbd_led_init()
  platform/x86: uniwill-laptop: Remove single color keyboard detection

 drivers/platform/x86/uniwill/uniwill-acpi.c | 119 +++++++++++---------
 1 file changed, 63 insertions(+), 56 deletions(-)

=2D-=20
2.39.5

