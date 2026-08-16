Received: from mail.kekto.ru (mail.kekto.ru [188.242.149.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAA254774;
	Sun, 16 Aug 2026 22:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.242.149.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786918708; cv=none; b=shYfD9ySodlD/JzS+wktJCePQwFkLf5mZtOOMNqNZZBMGnxD69Y5uM2oaj6ByfGvvP8QGxcZFXNRzcQwXdTqGLlLcDJ/KYEcKa0TawzsQr3MC4/WJcdjJ2w0gx3d3BdTkLuyS7GMXJs/QR/x7/Su8DqooUxFH4qe0RqrZ4P780I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786918708; c=relaxed/simple;
	bh=pEefwPKXbDwplecmseLGTwLCR3nTCLTM3ZXpzL7+pgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRzOsy+d3xPfVDLTKj5Pf6N8eldS18MOkZElc6YwcFSEF7yZ9iONwa9vd9gh46cBDQVEJz4PhI9d7ylImqz1vUJxH+/W5QHMvkGLBkfYMqu7gOWMlFhxxs5wskDM/5rkBZ1Owwnoc493WfO4kEImz9mrYeoIJfbjuVLbvDnjT7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru; spf=pass smtp.mailfrom=kekto.ru; dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b=EreateGF; arc=none smtp.client-ip=188.242.149.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kekto.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b="EreateGF"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E016E251C1;
	Mon, 17 Aug 2026 01:18:19 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kekto.ru; s=dkim;
	t=1786918702; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZcD5aQ/lregBiKRr9FW2Vjgz0Sw0fO2lpyg0c3GuD5U=;
	b=EreateGFo5YCCbvOucZdlOf0dWBYwEtwOIGnnFNb6g/u5c7GcZHq8TlEQELWYkGyP/mWRj
	U8NA4nFarpQakG9hljCZecrtU4TJy8QxonRHU01cEmVCDH11mhqM37G3sMEutVSNFKiusm
	M19aRK4LB6Iz2Wuz29RwyHCpI472GN+qNGs7wnHWN0ju8g42gboRL7i8mJNJrnMpXD4rBf
	uJbrJSdGGObVgiioath7N3V3tYe/toNYMHS/dkn6Q/1Nx4Zwn8/UMqx70oNnX4PfLLBWXC
	1HFJnUzurC8vu6yQyAVjOGp6wAwxPjp2eeO1BQjs19v2pmdMGqL9GKMfy/QZyw==
From: kento@kekto.ru
To: =?UTF-8?q?=E5=AD=99=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	platform-driver-x86@vger.kernel.org
Cc: KentoNion <kento@kekto.ru>,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nabil Danial <nabildanial.93@gmail.com>
Subject: Re: [RESEND PATCH 2/5] platform/x86: bitland-mifs-wmi: support MIFS v2 perf-mode mapping
Date: Mon, 17 Aug 2026 01:18:03 +0300
Message-ID: <20260816221803.304168-1-kento@kekto.ru>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728180944.51356-3-wolf109909@outlook.com>
References: <20260728180944.51356-1-wolf109909@outlook.com> <20260728180944.51356-3-wolf109909@outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

From: KentoNion <kento@kekto.ru>

Hi Yuming, Mingyou, all,

I sent a TM2424-only quirk today [1] before I had seen this series.
Please treat this series as the right vehicle; I am not proposing a
competing v2. Two things from live testing on the same machine class
(Xiaomi Book Pro 14 2026, DMI board_name=3DTM2424, SKU TM2424-77080)
disagree with patch 2/5 and with a note in 0/5.

On Tue, Jul 28, 2026 at 06:09:58PM +0000, Yuming Sun wrote:
> Map the v2 codes to platform profiles (2=3Dquiet, 3=3Dbalanced, 4=3Dspeed,
> 9/10=3Dextreme)

On this SKU those bytes are the Xiaomi thin-ultrabook names from the
Windows OEM stack (MIControl / XiControl [2]), not "extreme":

  0x02  Quiet
  0x03  Turbo
  0x04  Full-speed   (firmware rejects this on battery; status !=3D 0x80)
  0x09  Auto / Smart
  0x0A  Eco          (dims keyboard backlight and panel; more aggressive
                      than Quiet)

Confirmed by SET/GET with status byte 0x80, and by UX: Eco really dims
the machine. 0x01 Balance is rejected and does not stick.

That makes the SET path in 2/5 invert the user's intent:

  platform_profile     2/5 writes     firmware meaning on TM2424
  ----------------     ---------      --------------------------
  low-power            0x02 Quiet     not the strongest saver (Eco)
  balanced             0x03 Turbo     a high-power mode
  performance          0x09 "extreme" Auto, not Full-speed

So "performance" never programs 0x04. On AC, 0x04 is the mode that
holds ~50 W package power under stress-ng + turbostat here; 0x03 is
noticeably lower. That is also why I disagree with the cover-letter
note that the TDP change "is currently not applied on Linux": a Linux
DTT driver is not required for the firmware preset to move package
power. I did not program RAPL from this driver either.

Suggested mapping (matches power-profiles-daemon's three choices):

  SET low-power    -> 0x0A Eco
  SET balanced     -> 0x09 Auto
  SET performance  -> 0x04 Full-speed; if firmware NACK, 0x03 Turbo

  GET 0x0A / 0x02  -> low-power
  GET 0x09         -> balanced
  GET 0x04 / 0x03  -> performance

Mingyou already pointed out that `probe_out.data[0] > 3` misses v2
when the machine is sitting in Quiet (2) or Turbo (3). A DMI match
(XIAOMI + TM2424, and likely other TM24*) plus the >3 heuristic would
cover both.

Everything else in this series looks strictly better than my quirk:
status-word / suspend -22 (Nabil's TM2411), EC fan tachs, lid poll.
Please keep those. I only ask to retarget patch 2/5's names and SET
values before this lands, otherwise Linux "performance" on these
thin machines will select Auto.

I can test a v3 of 2/5 on TM2424.

[1] https://lore.kernel.org/lkml/20260816215825.289356-1-kento@kekto.ru/
[2] https://github.com/Oksion/XiControl/blob/main/docs/01-wmi-protocol.md

Thanks,
KentoNion
