Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132953FF8AC;
	Fri, 12 Jun 2026 17:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285701; cv=none; b=tX78us8rI+et7On38cVT3GaMaFrXiOsVEwplbmBf7eabBBmD4HV6WOdWUhSqOnJjbWHTArS7UFLUXIYhiXxuyS5jdIOs7GmJX0KwdpsMkMOC2LBpjmsNPrf6YmheBmyXoi1tWJOj1eivL3NPdbRv7/0KlMs7YcOwJknKhsuKOkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285701; c=relaxed/simple;
	bh=YYU4EZi287nZj/MfZ2Sboj0CX8BQjIFCpVU8yZKyGHI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=uhQMQelCWTkfezDFOkSoOLN4FLIfYUh4d/5nRdogbwFkK1sNnfRyA764vwpDY2A5M1HgHTH80K11+v2tmBc3r6c8gnFhvm6YL14StDJFct5pFxkPJQQM9mMAXe4Wqn5FRf0tMFjaW1/E1X8v8RB3WSggA9X0Uhcsw/pZGms8pdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=OvGS1xSC; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="OvGS1xSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781285694; x=1781890494; i=w_armin@gmx.de;
	bh=bpvFe8U2F2AMcXRLVBijCm9blFZUHNdgxz2URkQQcq4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OvGS1xSCqZxWIy3VmCQOTzVBbXzG3VIZliHM5NNCdV4NsbvXYQFcrrsVHqMtqo2t
	 KPJSBQx030mmVAQaYeLzJquo6Ty91VDQj20x5poNGn+LuVirfWQgUXxR3c3wvs+QS
	 Cc0XPG7UbQzsA6+avdbppsu9hjLbPK3bASdrfg477GNV0YWYcJULhtwqTRZsxv1Pb
	 FJstMkwK5AnBpYfQJiVSrcLlUV7u7QR63NhnhAFUUI2dIFj80kpQhR46EQW/AbyY3
	 kRAL5S1+C9cTvaS9hvN+fJQbg/C/K7KE2YYxEVRO/AS4/Iu6Qrai8Y/WicplQy2fZ
	 mmwy7Vq3No6l0dpF0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWzfl-1wjMBj2cf3-00MzT6; Fri, 12
 Jun 2026 19:34:54 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] platform/x86: Fix various issues inside Dell WMI drivers
Date: Fri, 12 Jun 2026 19:34:47 +0200
Message-Id: <20260612173451.467629-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k/7DfeAFyAgKvQi4umE92o/8QPgy/eGPt6gzNrD0P5QOvFrnISO
 m2MoOyOqZMj6e0Wmf3zUMxPW+4bnZYMEiHRy2HHoSeFm+875+2wUSOMzvcaUbZvly73mTsD
 ZQFDkdqAEQ/ZHFF7DVoY39nOKt7Uqr+bFjsS/fZ4L+RdOApUhGUkkB3zHILl99VfKx4xChq
 d35YjKG/QGbXyx71IITkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ukSJSm446P0=;WWl7f1dkmYo1aI87H9T5BqKo+Fl
 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
 1vZ43W5ILWO8P/hSgzFzHN3Nt8k=

During the review of a previous patch series, Sashiko found multiple
preexisting issues in multiple Dell WMI drivers. The first three
patches aim to fix those issues, while the last patch is based on
a suggestion of Ilpo himself.

All patches where tested on a Dell Inspiron 3505 and appear to work
just fine.

Armin Wolf (4):
  platform/x86: dell-privacy: Fix race condition
  platform/x86: dell-wmi-base: Fix resource leak on module load failure
  platform/x86: dell-wmi-base: Fix handling of ultra performance key
  platform/x86: dell-ddv: Use no_free_ptr() to simplify error handling

 drivers/platform/x86/dell/dell-wmi-base.c    | 19 ++++++++++++++---
 drivers/platform/x86/dell/dell-wmi-ddv.c     | 22 ++++++--------------
 drivers/platform/x86/dell/dell-wmi-privacy.c |  4 ++--
 3 files changed, 24 insertions(+), 21 deletions(-)

=2D-=20
2.39.5

