Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FDC395AFE
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 18:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976993; cv=none; b=OmCKYo5wZKs4jXMKhbVZ7mPYjJZB1NYgwnO7sh3vTaIqGlzVaUuf2B/aWTQqgg610dJktSi+BWT2a3cjQzCVqcNSmGPCJDBpP1oBeJIqF3tGc0nVAijYqtc7HP4OzZTdnonfoLja6CeNKdI0vV2/CakZOcUpcQpWUwVDu8xR4pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976993; c=relaxed/simple;
	bh=oDS5W3cSpVGn6qkJxr40An5vaSJLQqwsd8fVviBk6jM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aDr+SMKJ3uvidvLDmDtK1iVj19+42tFUhiASWNsCws3XGtdytDfgwFppxWSVfGG25q2Ln2Ln2lrcKaP5U2mpiXg9QreAQ/4yLivnmk4dxXWAAo7mIU6QP57irC2jiS2KWJOIallE4IxPXOd4NKPBSNy8I4su1GEK2vB+y1uRhbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=i5hd/TfJ; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="i5hd/TfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788976989; x=1789236189;
	bh=rhTZGDrb562Rn4laHPHku+TT/h6b8jqSFRjdB4Ul3/g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=i5hd/TfJgKF2R2t9KkoWMoChkRXsDQF7y1/8LHkoPWWDWhgpG7pgWlJ08cJYwQLT/
	 Bmh8P0r6EpowNIZEo9LdFDirSUuk4WikQPQIemObzLUhOFuUqOMVXtqlK/EKXg4o3y
	 LZEiGXJlkgEWkMLKGg55cRrWT6QmpmEh7tujLs/tAzoO4ZeEEc/ZDD+vYohyiBENTL
	 9sQYk56uIQkeVQcWV7eOjznw1OUnCBACMQr2Q9M2dMaYbWAO8LQaanFK/05GKlYPXQ
	 avmXRQERjd776g5Jkz8O7W+NUVXvb/cyK/bkiucsZ8J6Lwp6SB9pZUfxNEU6jKrFdg
	 zM/uha+tdgATA==
Date: Wed, 09 Sep 2026 18:03:06 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Jakob Berg Jespersen <dev@berg.pm>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: i2c: ov13858: add regulator, clock and reset GPIO handling
Message-ID: <20260909180259.81079-1-lsa.uz@pm.me>
In-Reply-To: <20260831130312.26296-1-lsa.uz@pm.me>
References: <20260831130312.26296-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 9687c92d6d4b2e39752960b3d4f7e2768721440b
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

New evidence for this patch, from media/next rather than from a distro kern=
el.

I built and booted a kernel from media/next f9536a8065 on the Surface Pro 1=
1
today - for an unrelated series - and the back camera does not come up on i=
t:

  ov13858 i2c-OVTID858:00: failed to find sensor: -5
  ov13858 i2c-OVTID858:00: probe with driver ov13858 failed with error -5

That is the mechanism Hans named on 2026-08-31 - "the ov13858 problem is no=
t a
problem with the INT3472 driver, but rather with the ov13858 driver" - now
visible on current upstream. Reading f9536a8065: ov13858.c contains no
regulator, no supply and no gpiod reference at all, and while probe does
acquire a clock through devm_v4l2_sensor_clk_get() it never enables it. So
nothing asks INT3472 to power the sensor, and the chip-ID read talks to a p=
art
that is still off.

  https://lore.kernel.org/all/df2f3cb1-1bab-432f-a359-59e6bec9580a@kernel.o=
rg/

With this patch applied the same machine enumerates the camera and streams =
from
it; that has been true since 2026-08-31 and is what the original posting
reported. What is new is only that the failure is now demonstrated on the t=
ree
this patch is aimed at, rather than argued from a 7.0.0 kernel.

Both ov13858 patches still apply to f9536a8065 unchanged - checked, not ass=
umed
- so there is nothing to resend and I am not asking for anything here. Reco=
rding
it because the next person to read this thread should not have to take the
"camera still dead" claim on trust.

Sergey

