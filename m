Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F93842A92;
	Sun, 19 Jan 2025 20:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737317857; cv=none; b=oUsLWL1mittcHKY2QrkVk7xp9D5OSZPTK2ZMIjMSlIae8bZLi0kWuszjfzBgTQXdLzKCJ18zukIolBlxOWcsGPfKNPYmYtTiE8PXUgvzDf2ZcE7LDtiVBET59CqhaNWCmWPjk76wNK5KEkogD8CuJQTGKLkt7QUr7TcpmbKu9KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737317857; c=relaxed/simple;
	bh=AtHdBYWES5Lev9phrTMiWSYQiRSvCyOfwBnK+D9UL1g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=H9HkJuWCTbvfKi3/FOJQiJcre1EGB/uvvB2S16+TchlP7dYzdx+zTMxxFKT+9dNYPGKoZE1vpyQyj0Dblic1kWjVGK0EhW8vGDtvjh9W8uOOMVGPRcBOkZMy5JZ3Z/bA1co5WgJuRCR5j/XXoK3kHmPpqIROxJfE2W5fE8HpXew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=PGtgSK34; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="PGtgSK34"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737317849; x=1737922649; i=w_armin@gmx.de;
	bh=WovuaBdpOqkmpJp7GEO6r3o8FAcLVzYWNZ++6MPA0Ng=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PGtgSK34ln7Mow0lKtEGUKR0kOr0R9D0W7Yqw5hNB0mZK5N4divNzoKzYaNccXm0
	 8TeqSbMhXo0LYeIc3OYq0a07E9vawTGGOiOjv7hu1iifn70FTluC4zlJDXfSrvTqD
	 /a00iDE6RR4AnLVr0CvbLXn3Cn9w+F/JJUb0CB6xY8XsKggQrBRG4LVeYmElSRhih
	 tYqeEcMIAMYdYtdZ+QLCiTfii4KzA4OHKKY4HZtk3cHrWHXBNgdKDer7uFx1wWAp5
	 TlPuAf59jRJCdJZJIo/0M+mao7yApkc3BCfJM3pYUnLu33hdGKgQzYUhiYs8dA3YX
	 2v0zVG+PtqXRsqZz1g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.251.118]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mr9Fs-1tDD9a2GAQ-00aLpp; Sun, 19 Jan 2025 21:17:28 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: farhan.anwar8@gmail.com,
	rayanmargham4@gmail.com,
	jlee@suse.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hridesh699@gmail.com
Subject: [PATCH 0/2] platform/x86: acer-wmi: Last minute fixes
Date: Sun, 19 Jan 2025 21:17:21 +0100
Message-Id: <20250119201723.11102-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2DurqCHopsh/SlrgJTf5/aLwaGmqPHxri58k6+5iMXRLLe+k+KG
 G6H1em2DhkfwBMPsQ2uYvFBBuJhCZoqMUBrP0b9NzVBKfiKAIMssBfIK8SR+ayZoZqz3aJE
 2/d/eA7IxWCQa0EnK/vN5CG4vtZ+PIyvEzRfh4caw+Q3kuKr5/APuBezIsisC1Dmreb/zyk
 S/xZRN10XnoN1kS/8vQGg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uPlaLE5Xxbo=;eXv+cplGgxTsQUcjRBP9gU0zI/Y
 7Coy1sy/XsI+b0vsYNYb/tzzLRtyXRSPDa6yUIxSWCl8JOAgzAd90crgUNhdigRXfW7Co/75E
 I+EGvuK20hTW8eAkWon2sf3J6rbEJ5mZvgF2fWZPADZx5XiJVrK39qstvfWeFhCtt0jYgt5Wz
 HFNbf4Qq0UB63pZQMyi9SjbPnQyMrnYEX48vaCb+x5nnf4TEaOijnUt5y7YrJTIZsGES/VCiB
 GpIv7+lQE28o658viL1M0LN9rEFIOnPvLj+aZD3sv9xXXJQ35Ibw7pBXmYojaWpq8n5P2eshY
 e7C5BWg/5ctQ7jXBxKsUs4258nOTiJnTrX2kviiebIi4tCXVv0ZzwETRDCiVHxezl+FIXh4BH
 sLXTotZZ2aBfcTJFZirgOsSOofQjUn7isHtmF8ARz0SPpInqG09ojjzfiBaeBf2Rd5xKWxIzu
 UwgksBWym3PcJke3JozvxSTEKrJ30DhXxzipzQ9RZ1beJp53EzxHiBVue4ZTk4cXjT67nM750
 5s9fHe6nMAv++YaJ+xAB/lX4yyP7s7vp9TnkB1pGN6KgR8V4Hghvj3Ud7FnMN954bqVTz7MlH
 4TKaecbnOKxEKP5CFbVm43zTiitywtGXjTMymBQ44gu+gv69JJwZ+6iGcHLOO/BMRMo32KCwU
 gLLm3/RWrlFnR6ucWnbBim1Yi3llCmbEm91fTqdWtqYKm4HTWYeVa5UmaqahalxNq6ViaTOA+
 XPISp1CfNOYqSwSGcG3HI02FGLzbpPZhBzz0oY8aoeSl+EDHybSJX467Kl6Rpzm5OZGHqKQAE
 0teDfUyeXBsUpsePG8ScDyPeorny/CO0N6MQBLqiSDDwwL0ftFNlL0qJSx6PR8ZNcxFV2PTDs
 5179rMnxhc5vYGkB0P3PsMmQOFEOobJgVm06dczLkdkwMVm12E+8wpTGPVrom9JYFikB07csb
 x+SSFhg2PpBjCxVBqw7+3ZKPrqmrYC82bDqDL6eeQOlqBkj8+AY5fX882KhVDd3TF0yUeQbYn
 dtw4Zdnw83YTE4k4OBZwpZXWB73QdOk6mZamjgCwM4C276+7TzoNYT000CxuDBLcqJqLsbmYW
 J2dd3EsPZJlQ6mKsDfauTTEQpTk3IOAFLe/QmxniOHKApMUxujjpQnnpqEK04hqnUaEmMbDWM
 RyOF0AU6O64r/43oTEO0x43w3jGXGUZHpE+GWC/r/GcAYXR8Kq3Yr35CYIiIf+1E=

This patch series contains some last minute fixes to the acer-wmi
driver.

The first patch was already part of a previous patch series but got
rejected due to the fact that the acer-wmi driver was using the AC
status at the time to cycle platform profiles. Since this is not the
case anymore the patch is now being resubmitted.

The second patch fixed a small issue during platform profile
initialization.

The first patch was tested on a real machine while the second patch is
compile-tested only.

Armin Wolf (2):
  platform/x86: acer-wmi: Ignore AC events
  platform/x86: acer-wmi: Fix initialization of last_non_turbo_profile

 drivers/platform/x86/acer-wmi.c | 45 ++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 15 deletions(-)

=2D-
2.39.5

