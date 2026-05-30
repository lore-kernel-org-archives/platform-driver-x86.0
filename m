Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EB23AFAE2;
	Sat, 30 May 2026 17:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780160917; cv=none; b=Ifi+ylj2MPVXqOeWyPlmmeHMbcGF+h4P17h08PIoZd5fHFBBOzKfcNXJ3WzueSMwuxIy336A5FspwoQ0tz7yOX2bVe3p0xuAAAwwbvaileE7LpZIJOeSuc2+YSJ2jm3dh1k/SIVXXvw5RHUtYOMX0jzp+wXKACSyuL8qHKsmeco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780160917; c=relaxed/simple;
	bh=ZzD54RlRNx9FYFNfkOMSdQN76FEdKjzQFlGEyy9Ln4A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UKDsJFOTd5JG8zQPB4BkEYESiRQsKYsMEo/rwMK5HWeLYpUB466pDf/yFISmLt6qx4uuM5QO3k2PM1+glOIwDEUHPFgqvpIQYT0Vml9bmD8vZRBFbgd3n9tQTA6M5FTeLEUATohBNCOIUPXm6ia275bC80qC+z+x33QkhN2ObwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=D6AL+dk1; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="D6AL+dk1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780160902; x=1780765702; i=w_armin@gmx.de;
	bh=SkD5nRHM/q/1m0ks+LnmI6l/ONFByBRHN4Eb9jzDGO0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=D6AL+dk1jRy8kTncWbHgZq6ny5uN2lKavQOpkzWXYbF04nWFnoyXAtB+zGapNErU
	 TnSm8DR8MsIScA00LcPC9Fg8rBsHX9h3f7K0hOsJJGXxpZC33+vgNpOGpEm1vCLqA
	 H4pYX7KqsYHhTkbYxfKZHWNoIWbGgPGYCvMUcpKnX24bDjEandh04eOwbCu/QBawM
	 ww1huNp0Nw3CgFcglfaUm3YXwSbz7wOGbD7BoQaUhqDP+l3NA6/o5tn7/EhmZz5sh
	 YVjtdQqx3RV07NeX1dvwITBPLie0sF4XnvBpddLy0MP/5RJgZHdi84GZDF03Q6OIU
	 GF7DqeQpMBIen+JRGQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgNct-1wwMXJ0fjL-00at9N; Sat, 30
 May 2026 19:08:22 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wse@tuxedocomputers.com
Subject: [PATCH 0/7] platform/x86: uniwill-laptop: Support additional features
Date: Sat, 30 May 2026 19:08:06 +0200
Message-Id: <20260530170813.10166-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:X7XiE394MghfmP803X1lBVA50dgZ+Muo2pMWEJ2Pcu7AdgvixyY
 cPJ1vnNGzh2exKzjQheSTJFf0TT8KbdmnXu8FAtmlbZc91cboQk/b70MnVmSgdkn3/xlQZq
 bHARQr310n/JUCjRTCl/HxwTZDAL2PdbwajrX1ZqvS8t5Q0vx7UCsLThfnmdH/WFDr4vQb1
 rhpb0xhkoOAIrsrjByHpw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Kn2ivvL3lkU=;c5k7eatmxqcNW+ELkabCmP59Gon
 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

This patch series adds support for various new features to the
uniwill-laptop driver. The first patch adds support for the keyboard
backlight available on some models, while the next three patches
add support for additional WMI events, USB powershare and AC auto
boot. The last four patches finally add support for additional devices.

The patch series depends on commit b1a9b7a904af ("leds: Introduce the mult=
i_max_intensity sysfs attribute")
currently sitting inside the for-leds-next branch of the LED subsystem
tree. Without said commit the first patch will apply but not build.

All patches have been tested on my Tuxedo InfinityBook Pro 15 Gen 10
AMD and most work flawlessly, only the AC auto boot feature seems to
be broken on my device. I decided to still include the patch because
it works on other devices.

Armin Wolf (7):
  platform/x86: uniwill-laptop: Add keyboard backlight support
  platform/x86: uniwill-laptop: Handle screen-related events
  platform/x86: uniwill-laptop: Add AC auto boot support
  platform/x86: uniwill-laptop: Add support for USB powershare
  platform/x86: uniwill-laptop: Add support for the MACHENIKE L16 Pro
  platform/x86: uniwill-laptop: Add support for the AiStone X4SP4NAL
  platform/x86: uniwill-laptop: Add lightbar support for LAPQC71A/B

 .../ABI/testing/sysfs-driver-uniwill-laptop   |  25 +
 .../admin-guide/laptops/uniwill-laptop.rst    |  27 +
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 609 +++++++++++++++++-
 drivers/platform/x86/uniwill/uniwill-wmi.h    |   2 +
 4 files changed, 650 insertions(+), 13 deletions(-)

=2D-=20
2.39.5

