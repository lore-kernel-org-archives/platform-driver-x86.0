Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF95F431E71;
	Tue, 15 Sep 2026 17:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494097; cv=none; b=MOUDzGMZ2jY2U+Tgm7sGlVSD5VF4UZiCSf3laEU/UxJbEUpXTYn3gNFPvt8TNsqhP0ruWCzwMTHGYs/QEgaMUhdNG8zJqheWCxmNViulWeMRt31rBiFlAMSG0WIqEWaxdIwqdpyBs2OXxchzz8nxAEDgQqChxxdg4KXWMDjfkqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494097; c=relaxed/simple;
	bh=VHfGtWoinQrMM97ejRTtIlWyNV7swPR2DUVZHmqAprE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ctg1pdqdt3vpsoB0w8LIMePtMI7QPmydFj9y671q7O4pS5onlBIoWk3rlRCdlAZi4mjoTaAuODihtXnygn97ctI21vNHXd5eBW8ZOxn1O8BY7d0kdWsaWaO5LdnMZbMEPPa0IG87yt+IuaQSfcf465sC5o9X30i9nSMc4mr273w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=pcR2s1C0; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="pcR2s1C0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1789494088; x=1789753288;
	bh=O5e2TrZxGxcTGjWmSi86bJ+J0cJpI5jihZoK+vn0DVc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=pcR2s1C0jn0eo7+DeayHlnzFDid3Ixi0j3q4cxRD/Cvx8tF1nsCmul074I3jsaCqn
	 UT0W6D/Kfe8VpbOip9bY4bYc1JW1913znobNzz2pcaKTZlihCs2TE6Seras0reZ3/L
	 Bf3Onz75iuOD+Lm8HR+Ni5vQoW8aLjsqcErWbXGg4UZN3DECJUzIQxuHp91PaIfInm
	 e4I3HIq1igqOHxa3RVaDkfvqPsffR3H8TrJhQZKVCX3oTO+s5dk2SoJQOrLJczuq77
	 ck76aDsKwGXX2ST22AGVSZNcgAm+MoAHxLWWuB+8qzZ1ZlqvaCMi1f/ZdNp7MwcNHP
	 /Te1U4kEcNtZA==
Date: Tue, 15 Sep 2026 17:41:20 +0000
To: platform-driver-x86@vger.kernel.org, linux-sound@vger.kernel.org
From: patryk.dankow@protonmail.com
Cc: =?utf-8?Q?Patryk_Da=C5=84k=C3=B3w?= <patryk.dankow@protonmail.com>, corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, perex@perex.cz, tiwai@suse.com, zhangheng@kylinos.cn, dnaim@cachyos.org, damien.dagorn29@gmail.com, kailang@realtek.com, habilerenturker@hotmail.com, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add ASUS ExpertBook mute LED support
Message-ID: <20260915174110.67871-1-patryk.dankow@protonmail.com>
Feedback-ID: 221603438:user:proton
X-Pm-Message-ID: 9b762a85624742ddfb9d3852884b0e6035fad857
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Patryk Da=C5=84k=C3=B3w <patryk.dankow@protonmail.com>

This series adds speaker mute LED support for the ASUS ExpertBook
PM3406CKA.

The first patch adds the ASUS WMI mute LED endpoint and registers it as
the platform::mute LED using the audio-mute trigger.

The second patch enables vmaster mute LED handling for the PM3406CKA in
the Realtek HDA codec driver. The existing CS35L41 I2C fixup is retained
by chaining the new fixup to it.

The WMI device ID 0x0004001c is present in the PM3406CKA DSDT and is also
used by GHelper for controlling the same LED.

Tested on ASUS ExpertBook PM3406CKA.

Patryk Da=C5=84k=C3=B3w (2):
  platform/x86: asus-wmi: Add mute LED support
  ALSA: hda/realtek: Add mute LED support for ASUS PM3406CKA

 drivers/platform/x86/asus-wmi.c            | 26 +++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 sound/hda/codecs/realtek/alc269.c          | 18 ++++++++++++++-
 3 files changed, 43 insertions(+), 2 deletions(-)


base-commit: 2f0c1cf72f4682178506f513bbf015e591b1aa4a
--=20
2.55.0


