Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAAE1C5F27
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 23:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782258821; cv=none; b=FvCETHhnU928+xX+/fopZ3fi5h1cLHFUIi582CWgYhDCtBDgOt1/925tYa/NB+pQN7SgqOtOLk01ZY6Ctj7gnb7Nn3bfeIkDGZBc5mYW4Z0PlJQFolCwXhZzI1enthcHPBcu69htgr0O10VLWcGzoc70aHYOFL1BQB0xo7ZWZpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782258821; c=relaxed/simple;
	bh=LAVHBgNwqWYBVlcg6jSX2/SqcMv4XhyaVDeLAiZBOQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CgZr71ejD7Ca50YeuEFLaK5o1REZovcRFYAZMr6fv9oOKx4KSesfyY6DmitWUi91LQ3FlUSL1DQOv8eRPyStZQw9appuu1bl7ROx/KLdoiWb86Qhdu1aB2w7iZ6Atn0OAMJnpkO5n05bzQSKxK7iM/6v8cqGHrUUmN635QxyUR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe; spf=pass smtp.mailfrom=nikableh.moe; dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b=UIwiCFQ1; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=E4QXSg8m; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b="UIwiCFQ1";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="E4QXSg8m"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=UIwiCFQ1qaVWiCAqoF6mhNQTM/wBg4YhG0sX9ab6i4XWSmRB2rAi/chAzPeb3qNnGe6a3pO1S8EA/BE8jdBGciOoymzEpNim2pCawrCc+TWH8BwdTuWoLlfx1Pc4ynQCViR4JZz2d6h9jaEzXTrhqM3bpR6dlWQy4JxCcRPfIdEMhmuLCkmJupo372pIdse2iKINZ9fiMlnqpSfBpM3GTS/9bXtYRvbmAhFj5U7cKDmlrycuWFBx/msUNapW6y4kopu+8z7SexkK0FoB8Y2CJHFXL59rnaGYkZjIayhtJHS0t/j9wYp2kamA/NZdKHjF510qgDv3d5aluM4Q784Ejg==; s=purelymail1; d=nikableh.moe; v=1; bh=LAVHBgNwqWYBVlcg6jSX2/SqcMv4XhyaVDeLAiZBOQg=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=E4QXSg8mOmGOB96unXmSpVjNjzOwmIv1Kcj0Z4LL9ArgV0fp/ggo3G+518NX0Qhkmy9CNMyqtEICtOnj1WnL5xaq9gFtPN4ubMDvbdM233jxhPt6qM0F5n6zmR/QFi7OXA9V/dikLdOLoxpYyHZ6tH4CVv+utLEWLSGg+fBsqCXP+LpKfKS+39Q/4ZCkJMR3KceRfoqckU8xpvaUX4ft6Lx7Os5VC+sJATF8L9suzlAxp2sa6u/aT7Nur/EBR2bBYRKIsau+El0vZIBr2fyHlt2rmb1lr2b2X7KeTEUSqfC5DEiRHuSpRQQAXm8LpVMheFLBs5C81yrddkj4OJPGRg==; s=purelymail1; d=purelymail.com; v=1; bh=LAVHBgNwqWYBVlcg6jSX2/SqcMv4XhyaVDeLAiZBOQg=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 209604:18551:null:purelymail
X-Pm-Original-To: platform-driver-x86@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1604891532;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 23 Jun 2026 23:53:22 +0000 (UTC)
From: Nika Krasnova <nika@nikableh.moe>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Nika Krasnova <nika@nikableh.moe>,
	Gladyshev Ilya <foxido@foxido.dev>,
	Mingyou Chen <qby140326@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC] platform/x86: redmi-wmi/bitland-mifs-wmi: shared WMI GUID ownership
Date: Wed, 24 Jun 2026 01:48:59 +0200
Message-ID: <20260623235235.28058-1-nika@nikableh.moe>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Hello,

I am adding support for a mic-mute LED to redmi-wmi (a follow-up to the
keymap patch [1]) and ran into a GUID ownership problem with
bitland-mifs-wmi.

bitland-mifs-wmi claims two WMI GUIDs in its id_table:

  46C93E13-EE9B-4262-8488-563BCA757FEF  (event device)
  B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B  (control device)

redmi-wmi already claims the event GUID for its keymap, so the two
overlap there today, with nothing deciding which one wins. The mic-mute
LED needs the control device -- the EC mic-mute field sits behind its
WMAA method -- and bitland-mifs-wmi claims that one too, so my patch
would extend the overlap to the control GUID as well.

Both drivers set MODULE_DEVICE_TABLE(wmi, ...), so udev autoloads both
and the device goes to whichever probes first.

The outcome is load-order dependent. Loading bitland-mifs-wmi first, it
binds *both* devices, and a redmi-wmi loaded afterwards binds nothing:

  $ for d in /sys/bus/wmi/devices/*; do \
      printf '%s -> %s\n' "$(basename "$d")" \
        "$(basename "$(readlink "$d/driver")")"; done | column -t
  ...
  46C93E13-EE9B-4262-8488-563BCA757FEF-0   ->  bitland-mifs-wmi
  B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4   ->  bitland-mifs-wmi

In this order redmi-wmi is shut out entirely, including the mic-mute key
(bitland's keymap has none).

This is a RedmiBook Pro 16 2024 (DMI_SYS_VENDOR "XIAOMI", board TM2309).
These machines appear to share a common ODM firmware base with
Bitland's: the same WMI GUIDs are exposed under a different DMI vendor.
Neither driver inspects DMI, so neither can tell whose machine it is on.

Two complications:

- The control device (B60BFB48) is one multiplexed method (WMAA):
  mic-mute, keyboard backlight, platform profile and fan all sit behind
  it as sub-functions. Its features cannot be split between drivers; one
  driver has to handle all of them.

- The mic-mute LED needs one driver to own *both* devices. The EC
  reflects an LED write as the very same WMI event as a physical
  mic-mute key press, so suppressing the self-induced event requires the
  LED-writing path and the key-event path to share state. A split
  (control in one driver, event in the other) cannot coordinate it.

So per machine one driver needs to own both devices and provide all the
features that machine needs. The options I see:

 1. The two are merged into one driver for this ODM platform that owns
    both GUIDs and DMI-gates the per-brand pieces (keymap, mic-mute
    LED).

 2. bitland-mifs-wmi gains the Redmi mic-mute key + LED (DMI-gated to
    XIAOMI), since it already owns both devices and provides the other
    features here; redmi-wmi would then not bind on these machines.

 3. redmi-wmi becomes the Redmi owner: it absorbs the control-device
    features (backlight/profile/fan) plus the mic-mute LED, and
    bitland-mifs-wmi DMI-gates itself out of Redmi hardware.

In cases 2 and 3 the split is enforced by a DMI check in probe,
returning -ENODEV on a vendor mismatch, so the declining driver yields
the device to some'ne else. Both sides must gate from the start: once
the wrong driver binds, the device is -EBUSY for the other and is not
re-offered.

Mingyou Chen (bitland-mifs-wmi author, CC'd) told me off-list that this
is a GUID overlap, that his Bitland hardware has no mic-mute key, and
that he is fine with the mic-mute support living in redmi-wmi.

The mic-mute LED is already implemented and tested on my RedmiBook Pro
16. I can send it, and the bitland-mifs-wmi changes, as a proper series
once we settle on a shape.

This follows up the mic-mute keymap patch [1] and an earlier question
about the overlap [2].

[1]: https://lore.kernel.org/all/20260620145928.2156909-1-nika@nikableh.moe=
/
[2]: https://lore.kernel.org/all/20260531123345.237521-1-nika@nikableh.moe/

--=20
Nika Krasnova
