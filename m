Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03220345ED2;
	Wed,  7 Oct 2026 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384082; cv=none; b=eCwSQy8RFmu6UGPsGAdT2SeSQSdNRrR9sbqExqBe467xszM88lJGDs/RBs0B8RL08Bo0rxajDneJYw9Z6Y60sw272EwD7qMnJVgq+cqm81rqNZK5VenaJ1qDOx22wi9V1kuW6iRISgYNYq1zGf0oOKKA8t9MR56L/rMWUJ0gP04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384082; c=relaxed/simple;
	bh=6I8gdxYUln9THJKkh7s6Ta2T4zbEY53AKcdyU0WIgM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KEkZR1qDehUv7w6sb0b3U64WGoipo0UVYvg9gUfmF4D8J3iaIU+bhb/u9jIitgBvCY7aGSdq/HfjBxJRfsiXpjwCCbczcxVNRafp/zw70EatYwSOc+uTO51ufQZFFK7xumoSDwElPlyCoHAQdkOIUhf+fjNBAdHyWLgsolxK8qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=tYr/a+Y0; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="tYr/a+Y0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791384066; x=1791988866; i=w_armin@gmx.de;
	bh=qSDUTDTxXYN3+8W5xPASdgxSAdzmmUDK4szfc/PTZIY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tYr/a+Y0+K4QvbMPPe0BiB3Rh0t4F3i7aM0OvwSeEnTOb+L99GOkKhX2iyMObXiu
	 CawboLvkDbH/amzuyrY0cBfiLmvUUoHzc77o+e2V7xlJBSsHnN3WbaIZbqenYL7YN
	 CmdhzOcGfRmtpKb2n2lsliiBdvDPvp3onPnDCSZvdhEq8ajh0971fqfqZVtuGy5XU
	 ibu3YHizYCG9wYHqRKzp+LOqy6etTTWXOJfgQ077ISH8dHKNG6r3SnPg4EcCBKhX0
	 gEdv5AZDgAH20vxEFSCJPkQBRTx7jZJs4XGmzb/ecU0D64CcgRoQMwt66Y7KZazxw
	 AdB3vvL5HSIADJiAfA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3lc9-1xEBiD1sTj-00CnZS; Wed, 07
 Oct 2026 16:41:06 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] platform/x86: uniwill-laptop: Lightbar fixes
Date: Wed,  7 Oct 2026 16:38:53 +0200
Message-ID: <20261007144101.323289-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2cA7uLY/GUPKaoCalnmYxdfJtGBJrP0yJutnNcpq2VyFoM4VL2a
 wYJizR2OewvG3HKspsaePoo5l82NNGI8umf1qip3I8OwhukPZrvezzzkhecGKgLoL+3L13h
 zlMv7o+5i+Ln2koW48a3pMdsRJ6j8FG0txdQLve3GgqKG5tnIyQG62LDvYuXO9i++ua+d4A
 klW5+K67zFCK2q+wt91KA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9nhenJXXqIA=;DJY4SV5IauCPVqavtUuKpm/cnzG
 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

This patch series mainly deals with various issues inside the code
responsible for controlling the lightbar on supported devices.

The first patch utilizes the improved multicolor LED API to report
the correct brightness of the lightbar to userspace. The next two
patches fix issues discovered inside the code for controlling
animations, while the fourth patch fixes an issue with the naming
of the LEDs in general. The last patch also adds support for another
variant of the Intel NUC x15 laptop kit.

All patches have been tested on said Intel NUC x15 laptop and appear
to work.

Changes since v1:
- fix spelling mistake in commit message
- rebase on for-next

Armin Wolf (5):
  platform/x86: uniwill-laptop: Report correct lightbar brightness
  platform/x86: uniwill-laptop: Implement rainbow animation as trigger
  platform/x86: uniwill-laptop: Fix breathing animation on Intel QC
  platform/x86: uniwill-laptop: Label multicolor LEDs correctly
  platform/x86: uniwill-laptop: Extend support for the Intel NUC x15

 .../ABI/removed/sysfs-driver-uniwill-laptop   |  10 +
 .../ABI/testing/sysfs-driver-uniwill-laptop   |  15 +-
 .../admin-guide/laptops/uniwill-laptop.rst    |   9 +-
 MAINTAINERS                                   |   1 +
 drivers/platform/x86/uniwill/Kconfig          |   1 +
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 233 +++++++++++-------
 6 files changed, 165 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/ABI/removed/sysfs-driver-uniwill-laptop

=2D-=20
2.55.0

