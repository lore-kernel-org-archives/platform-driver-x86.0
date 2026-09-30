Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DE044E675;
	Wed, 30 Sep 2026 07:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755123; cv=none; b=aQRTmIo/IHgJz80zb8tGJJMhTckTAvD4hZn8oN9mmZS9momnGBSbexBo8BV1Kp3mZ7tdocCTi4f/+8O8q9cs0vrLTabR94GBZr4Il5IhHiNM75117FT46yuAsnzMXZgDfjSRG53/PKFxXDUXddTxVabgb/Pjx0L/X6/wxNb0/CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755123; c=relaxed/simple;
	bh=FM+RfEmSMl48Z+c6Erjpj15Jgb/tEKvlrWh5UN2i7yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YL6UfZHJfIo9MRFU24DeUo9fkEciZJ0nmTp6+Ntx79o4GrYvhLOwxNSO1m4e4z8BOSZpU4tcvSTD76dqm1bOLZ55LOQ3Xxi+oQM9Fe524D/14i5UG3LX4NDIKywcaSBQEK0a49Z617UemN+zK5pK82oEDhkTHJZY9WuJLu7ar04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=S2H8IMib; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="S2H8IMib"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6358A82BED;
	Wed, 30 Sep 2026 09:58:39 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9UDpNZLZaZD; Wed, 30 Sep 2026 09:58:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1790755118; bh=FM+RfEmSMl48Z+c6Erjpj15Jgb/tEKvlrWh5UN2i7yU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S2H8IMibZrE8nsC+WjvqvUa1kbdq2ynRHaTA4bCe9T/KLy/gRv+LiiU+C+7Oo0h/K
	 9fA4mn94saV6qQ8nf6ovMsHI+cF12Cb2DR7fgTsurmLgr3YqLO7iQ1ajgjJvhS0sSP
	 n5HFE2sFTgOuJTaflOb5t0cBZl3g2rfadjs0R4iR3juHvGk7CFbd58AKBtqKkKa/es
	 v+oDfGdITVslMscAEJeHXu16vs/YghxwuvB7ZSXR6e2A3Zk0Ve7MAL7ERw+90ZbI9S
	 EaIQfRFGZQYpWWY0TpA/MZVlEABjBqb11AtDXpX0XLuNqnDItPKqAZ7l0uW21iBThH
	 mjjMxioy79aGQ==
From: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hansg@kernel.org>,
	Nitin Joshi <nitjoshi@gmail.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Use input_device_enabled()
Date: Wed, 30 Sep 2026 10:58:29 +0300
Message-ID: <20260930075829.53484-1-aliamemis@disroot.org>
In-Reply-To: <178947195441.31094.9793704324340226838.b4-ty@b4>
References: <anK1j7hbMyFHGBUS@google.com> <178947195441.31094.9793704324340226838.b4-ty@b4>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Sep 15, 2026 at 02:32:34PM +0300, Ilpo Järvinen wrote:
> [1/1] platform/x86: thinkpad_acpi: Use input_device_enabled()
>       commit: be0048786d53375fa4eace15cfdf65593956a1a2

This hangs on module load for me. hotkey_inputdev_open() gets
called from input_open_device() with dev->mutex already held, so the
new lock in hotkey_poll_setup() deadlocks:

  INFO: task insmod:28182 is blocked on a mutex likely owned by task insmod:28182.
   hotkey_poll_setup+0x50/0x140 [thinkpad_acpi]
   hotkey_inputdev_open+0x36/0x50 [thinkpad_acpi]
   input_open_device+0x9d/0x130
   kbd_connect+0x8f/0xb0

I guess hotkey_inputdev_close() has the same issue. This was
next-20260929's thinkpad_acpi.c built against 7.1.11.
