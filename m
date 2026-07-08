Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3423BB664;
	Wed,  8 Jul 2026 19:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540575; cv=none; b=IlzVmz96+r/NEXcXn6fac2rM48CugKXuwoWRXRR8WG6fRG0nsbMpL//gUfpj1dm6++56pbmkgv+UPOgrd6RZ9yOyMMpWokmipiFp2uYQOwCZ8NOa0OlcDgYfsYl3njPqsdNhx4gfcFcIV4huAcsQGd0Tb8dAS4d8aoChhcpE2Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540575; c=relaxed/simple;
	bh=UIfsuDdOTHO7uNinqXPGc8vMtr+FApIQF3CiNKunrfc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kgzR+MDPOCua8pH2fFAQedlacaQnb4hT94xdskfIOm7Btx6itYkYO2Lvy+NY7tmYAln3wXJgorQL9mIMsPVAJAQlR4UukFvnfjKzrhObIEFsA0il7v+4z/SUJVjX/0iU2IJdBnD3wBEDIdJNtXZG2Pf+MUZhTth+/Lw6DBAhuhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pLMpm4yL; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pLMpm4yL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783540562; x=1784145362; i=w_armin@gmx.de;
	bh=WmefWuTbcO+yXmoc8Fz4fI+Gv2R02ZRNDZYj5i5R5gA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pLMpm4yLIu1ggv5lmSBVHSX/Hx1hiMkqtPiuDb1VVE7RXcm5RRpxm4OW06rHUr9j
	 ijORdNFGlyhGpJi98j2BA4lZxG0XSTkCk3cp0KH5LQmNSVvM8eUacZH3mLaNFZ5As
	 SXhqXoio/get4Hqb0qoJ3Rc3lxYjEvn/OHX/i5ZdpJ20ibLSjJsViTnqLcpe4mara
	 lOOaQydK6A0Ik04CBc98djfv4g7i0xzAVNVJ9qDoarDliQ99ZrMgE6YMooYH4mwbo
	 khEW2gWuNMpLUmfOapgmwhwB8037VwXfaQokP7ou6jCgIvQQLkSni4OIVtqIBezE7
	 vErMA+cbqkrBalsCTg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPogF-1wUA5J0i2d-00LmY6; Wed, 08
 Jul 2026 21:56:02 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] platform/x86: lg-laptop: Improve support for modern devices
Date: Wed,  8 Jul 2026 21:55:48 +0200
Message-Id: <20260708195553.7762-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:I9UNOkeD1Vo12Nb/F1p6lQwMeD8ZFexV68efllY7IvfDiKV0G5T
 3cUPO/r80OJT1EGWv1FTgpHLAjhrJ95fvsQLy5GPTpDQbGCrn7OOZn6hpYL09WUruFTliG8
 5+zKXgoHfCR6Dq95cOP3+HHg97MS/gTwUOM5LoO3w48EPhmQkgHMPZToMgADorkG+XXcMSJ
 Sqh+FkbIpsC7AttjeyBjA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8Nga88mCfuo=;sfMFkVEeUewWL7ZzV44xl628DxU
 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

Modern LG devices like the LG Gram 16T90SP currently do not work
with the lg-laptop driver due to a number of changes inside the
underlying ACPI interface:

- events are now exclusively delivered as native ACPI events, the
  legacy WMI interface does not work anymore.

- the "WMAB" control method can return both integers and buffers.

- new events where introduced.

- strict keyboard backlight interface.

The first patch fixes and issue inside the LED resource handling,
while the remaining patches add support for the above changes.

The patches where tested by users on bugzilla
(https://bugzilla.kernel.org/show_bug.cgi?id=3D218901) and work on
both "old" and "new" LG devices.

Changes since v1:
- add missing includes
- minor style change

Armin Wolf (5):
  platform/x86: lg-laptop: Fix LED resource handling
  platform/x86: lg-laptop: Add support for native ACPI events
  platform/x86: lg-laptop: Add support for additional events
  platform/x86: lg-laptop: Improve WMAB control method support
  platform/x86: lg-laptop: Fix keyboard backlight support on LG Gram
    16T90SP

 drivers/platform/x86/Kconfig     |   1 -
 drivers/platform/x86/lg-laptop.c | 644 ++++++++++++++++++++-----------
 2 files changed, 412 insertions(+), 233 deletions(-)

=2D-=20
2.39.5

