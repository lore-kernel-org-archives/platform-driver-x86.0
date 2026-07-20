Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1DF406261;
	Mon, 20 Jul 2026 13:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553988; cv=none; b=Rhki/WLypx/fXKHUULAEcmN1ieZi1FwtABZc7LZLOX66NN0SWOwUZFYgAhtjR1vjoZg7thc17PkOvX+J9zb7J6iX+vC14WBaJaXUoYQOPY3CtXnp2dUXLuEFz4jj4m/q02ceSzncv5Y5VDwSJ/kZCTY11LilUsOUBSseqIuAccE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553988; c=relaxed/simple;
	bh=SI71D35tciT0sjIemHJTqqBj8TI0ccdpdpadiX1wjI0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q0bVtbmgXDA2JPZ8WCGGJ7xihecA7Jw2rcpXdzhP9L67dGQP69WXNsea+mfs9KRHYl+361QDmwI7eXhk9UArXmY7NHFnleWJFYauxOz85y1gsKxio8EvzbPZOuJTwXsF1TTSHVB4dZZo2XKMR3/qCVSDq+BixZCPUfXkNn4XSbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KoiacNe1; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KoiacNe1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784553980; x=1785158780; i=w_armin@gmx.de;
	bh=e97OyZwvbCGoIs0rpg5cq6rE4TcSBalH4O4GQUdMSeM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KoiacNe1rMUtHrVLmXxPhgIoW9Hdhz9ogdUdcznkzS96NQzJZ0V/nH/VChC7O+qN
	 k2YMYmrEkfD3lSIFAPiSgu7J5BRPU2NsVMMoql+eFdctRYc9ekRB2nywhZPm5R1ew
	 +q4wry0Qb6mOigK/meay+uGtmpP/N52YhObyqPDZo6yKwEDc7cWGR9eUNvgdzR5gC
	 SdEa4SJElvHzUU0gkeMybED+PSJ8lfVkZ0tqHp6t7PqiYYvT3XO56syJJbNj6zTdi
	 cs5W09QM1BWOzPGZSejpJLJLvtFbnhUWWS/MEiSx6Npwy/fFOS8ZCD041jycAiLrd
	 wbXKtAo9G6JGjpWFYg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvsEx-1x2Exv0IlT-00wMBF; Mon, 20
 Jul 2026 15:26:20 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	wse@tuxedocomputers.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] platform/x86: uniwill-laptop: Prepare for extending keyboard backlight support
Date: Mon, 20 Jul 2026 15:26:09 +0200
Message-Id: <20260720132611.374073-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vgnZKT7ZmGuNruYIEXi02+JNsmGZuKvBz0hKWkwl7mWk3o6Tc3i
 mcaZa5X7JA6/qeCElzXFlq8ahmChvJGY+JomPHrQTLsSQJsZh8SKs50YoojKza9HHQLxWQD
 wkW6u/1ENhfAnydO6DzSg1MGkH9IWlLrqyE0fUMd36SMkxBc6prlY+DwzRVtGBEzMSePdxE
 OT0g6jc1Vbk1eJ6UDGWMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6ivwiLehknw=;0ktIaheG36aKcjf3fijL3I+qmT/
 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
 HwKIm6Pq7CtOEub3nVYYbA8H2SkMrz

This patch series contains a couple of changes suggested by
Werner Sembach from Tuxedo that are necessary for eventually
enabling keyboard backlight support for Tuxedo devices.

The first patch simply cleans up uniwill_kbd_led_init(), while
the remaining two patches make two key properties (single color
vs RGB, max intensity) configurable using the existing device
descriptor infrastructure.

Tested on a Tuxedo InfinityBook Pro 15 Gen 10 AMD.

Changes since v3:
- add Reviewed-by tag
- fix spelling issue
- reword comment in second patch

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

