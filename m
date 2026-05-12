Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7470A394783;
	Tue, 12 May 2026 23:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628120; cv=none; b=IadBJw5z1Kl/SE87+SI5Kjvkn0evqepvv/nI1QNuBsIG0CTHncJoBjjSAc6FRBtviEsEOqJGqWP8cU1lKAfWQJV1fotPlqBWyiY5i8YL4v1WnVG8uaRkUUDG51gkCbb431o9mb0ew70oRWCJDYTRV3afRSAPFkMoqN0ZFS9OvUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628120; c=relaxed/simple;
	bh=qpzhv7Eh+w8i49pQPvFQ01Rm9jY/ucyJWqvE2GPP3u8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=OeYuhTdzcAdb07lQBKfJr7JI/ez2jCbXNK2FrF9gDI8I9/CB4Q7GKiQIDbUv4PwbE4DqgW2v9iAuz1jjPDDe/DXLqzTlMIpHg2zPEkSIHcI387ScPOR+TXpCSt6M5s4K93463e1EpQxFR5CIMw+1vOZDtS05r/ZTs49Ly9iPOS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=XC5zRBt7; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="XC5zRBt7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778628112; x=1779232912; i=w_armin@gmx.de;
	bh=13z7ggwUqedmtp3yS3ovpwdB5xTaEW7PoxGVxAFtWpI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XC5zRBt7aLI6gmKasta0xmnCXphHSBmtgOvC2UqZngKngJZfsMdC2AVKnyixmjHJ
	 yHgayRdQV2syuxAqaMSy/T0Qzqga+E5P92QC3eHK/5S8mRldbw0To/JSYTpzWY7Va
	 aZpDqHHY1ZFUjLP0mgU4GljWr/FQAtYzNOeUTbGc0ccdcHsD0Bm9IfZVGDJOZ0nhJ
	 eNtZ73bJxJvmZ0jNCkQJXsjlGamjcDtOKyBiatn+kD0DoHF7sQC8V5lWObUeRaJpH
	 lqRCN0O11i8dSFB8lLGOFOzOfgBz6FE3UVAjbc/YJmjAaAhmadua3BDNYmOzKiIMx
	 k8EO2zkW8tC9MOGJjQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8GQy-1xQokq2eDw-00ulg2; Wed, 13
 May 2026 01:21:52 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/8] platform/x86: uniwill-laptop: Charging-related improvements
Date: Wed, 13 May 2026 01:21:37 +0200
Message-Id: <20260512232145.329260-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fQVvzwnv7NrGF1HyqJ5XqgTGqxmGlQVaHSzYOBt3VcqTgUzvdhq
 nu9qljvLuzgUe7WR9Br3kTI4tq450lfHwlsHlHY0Hukp9yyb49Jj5OQyRvRTMlNQchvyhr1
 YqWg228+ewdAQKSvbwgezqdbHkx5u8coHMVvfu7QGno9PfCveyON79v+DaygSIi7RzVqTW9
 zS4ozteKoG8aqnNjIUWYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AhvuuCf8dzA=;NjCNhbrTNUk36FE4p1YA/TSlPZ5
 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

This patch series contains various charging-related improvements
for the uniwill-laptop driver. The first two patches fix some minor
issues inside the charging threshold code, while the third patch
fixes an issue inside the module initialization code. The next two
patches contain some preparations for the main patch. Said patch
introduces support for controlling the charging modes available
on many Uniwill-based devices not sold by Intel. The last patch
whitelists most Tuxedo devices for using the battery charge modes.

All patches have been tested on a Tuxedo InfinityBook Pro 15 Gen10 AMD
and work just fine.

Changes since v2:
- add Reviewed-by tags
- rework first patch to use a common helper function
- add last patch from Werner

Changes since v1:
- add Reviewed-by tags
- fix spelling errors
- split third patch into two separate patches
- restructure code for battery initialization

Armin Wolf (7):
  platform/x86: uniwill-laptop: Properly initialize charging threshold
  platform/x86: uniwill-laptop: Accept charging threshold of 0
  platform/x86: uniwill-laptop: Fix behavior of "force" module param
  platform/x86: uniwill-laptop: Do not enable the charging limit even
    when forced
  platform/x86: uniwill-laptop: Rework FN lock/super key suspend
    handling
  platform/x86: uniwill-laptop: Mark EC_ADDR_OEM_4 as volatile
  platform/x86: uniwill-laptop: Add support for battery charge modes

Werner Sembach (1):
  platform/x86: uniwill-laptop: Enable battery charge modes on supported
    devices

 .../admin-guide/laptops/uniwill-laptop.rst    |  25 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 443 ++++++++++++++----
 drivers/platform/x86/uniwill/uniwill-wmi.c    |   5 +-
 3 files changed, 384 insertions(+), 89 deletions(-)

=2D-=20
2.39.5

