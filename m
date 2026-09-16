Received: from mta0.migadu.com (out-217.mta0.migadu.com [91.218.175.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2EF50AC01
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 14:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569538; cv=none; b=GqBZiYiCvyUayGF7uG9Fn9RANcWp4Wwabiurwj961m8YmdXYXjXojXWVr3lTrWCCl1QDiGaplu8arMRkvY0X25EX824lSBgN0Efa7uVCxG671qUxAe2CCBa0iayUdyvTWz/YWKX446CVmO2QRvXffQNrdlPI0snZm80sosTJga0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569538; c=relaxed/simple;
	bh=gXs97NNWFcL62CggFzR4JEvOkXng/DtqZPwhKTVavy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MV4u5A1uu++m5Kib4CHYwKvYp2nAXv9bvp4EGkEGan81bOWwztJLUrMyWaqfXONXiRETI9C6rSjXvFGDry4kNL5qQb4PrDj9boNlLtKcGUn6cpbhdTOlCklzpEljbgcPZtx9DwhUq7/zO7RyUdHAfi+gLnjuFRxldd6w+dBfQ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AWbGdkMO; arc=none smtp.client-ip=91.218.175.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AWbGdkMO"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gXs97NNWFcL62CggFzR4JEvOkXng/DtqZPwhKTVavy8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789569533; v=1; x=1790174333;
 b=AWbGdkMOrLFAm4rwP+ELTxzrw+XmzLzS53+mz/4mipqNiY/c99p6hLX8vE3LYVdRqaGoSdDW
 6lv8ShDEYwTssXbKGswvLbmQN8xqTcU9NcU+teB1X2x6KTwOsQrYYqNfzSMaLXRowk5uEwFNuHr
 dW8tg1AMXQX+rIs40fgOxZQw=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 516101583de3109b;
	Wed, 16 Sep 2026 14:38:53 +0000
X-Mizu-Trace-ID: 516101583de3109b
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Hans de Goede" <hansg@kernel.org>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Luke Jones" <luke@ljones.dev>,
	"Hugo Baigue" <hugobaigue2004@gmail.com>,
	"Ponali" <ponali2k@gmail.com>,
	=?UTF-8?q?Manuel=20A=2E=20R=2E=20de=20Or=C3=BAe=20R=C3=ADos?= <deor001@gmail.com>,
	"Salvatore Bonaccorso" <carnil@debian.org>,
	"Thorsten Leemhuis" <regressions@leemhuis.info>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v1 0/4] platform/x86: asus-wmi: fix screenpad backlight regression
Date: Wed, 16 Sep 2026 14:38:24 +0000
Message-ID: <20260916143838.170950-1-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

I have touched ScreenPad handling code based on latest Luke's work
and in doing so I caused some regressions in the screenpad backlight
handling.

This patchset attempts to amend those regressions while also
improving the support based on feedbacks and suggestions
I have received.

The screenpad backlight regression introduced by 130d29c5627c
("platform/x86: asus-wmi: adjust screenpad power/brightness handling")
left the ScreenPad panel unusable on several models: the panel is
powered off at probe time or bl_power writes have inverted effects.
Patches 1 and 2 fix the regression, patch 3 makes the screenpad
backlight honor the core blank and suspend states and patch 4 removes
dead code left behind by the same rework.

I would ask everybody involved to test these changes again and
provide feedback.

Thanks to everyone who provided feedback and helped
identify the regressions, especially Hugo Baigue that also
provided values straight from the hardware and suggestions.

The use of AI here is to review the content and to research
relevant links, putting the correct tags at the end of
each patch and referencing the correct people,
the rest comes either from me or from Hugo.

Honestly I am a bit unsure on what older DUO models might
make of these changes, but it's impossible for them to work
worse than they are doing now due to me inverting
the backlight logic, so I'm willing to hear any brightness
misbehavior and to resolve them on a per-model basis if
this works well in newer laptops.

Best regards,
Denis Benato

Link: https://lore.kernel.org/regressions/178362762638.911488.8564892548331679884@eldamar.lan/ (X532FA regression, Debian #1141604)
Link: https://bugs.debian.org/1141604
Link: https://lore.kernel.org/all/CAO84+xJLVW_9_D9-8cwJYv_Vz+LK7nJqRaG-1P4_eeLrQmSiWw@mail.gmail.com/ (UX5400EA power state report)
Link: https://lore.kernel.org/all/CAO84+x+P2_xyHP89+nGVSMV6bL+dy0P9=vyEEfZGnFhv0hBNWw@mail.gmail.com/ (UX5400EA tests, brightness fix and DSDT analysis)
Link: https://lore.kernel.org/all/985b98f7-04a3-449b-ab6e-7f23e29e4b43@gmail.com/ (X532FA confirming patch 1 works)

Denis Benato (4):
  platform/x86: asus-wmi: fix unclear usage of bd->props.power
  platform/x86: asus-wmi: fix screenpad power state detection
  platform/x86: asus-wmi: use backlight_is_blank() for screenpad power
  platform/x86: asus-wmi: remove unused screenpad_brightness

 drivers/platform/x86/asus-wmi.c | 50 ++++++++++++++++-----------------
 drivers/platform/x86/asus-wmi.h |  1 -
 2 files changed, 24 insertions(+), 27 deletions(-)

-- 
2.47.3

