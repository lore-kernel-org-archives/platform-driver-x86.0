Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583DE175A8A
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750652; cv=none; b=DrO1IJ/lzK99Wo/i1t+3h0bISKC7piTeFOIB6M7ZPeVVHEwO/4sMRlHh29TiVNSdFZ9dVIjzTIHYK5TnOsZwokFA4vRhQlFuAq/dEl0NrOF2QfJe/AOBfclKM1wCW4PVUlJ6hwy+DAG44vzSwf/8S4RmhHxz15JmY3urcH0KUzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750652; c=relaxed/simple;
	bh=BL86GUv2x4eWRcbpalPAXQx/D9oEM6z1d21vv8etw3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oLb487qeFmKkUEkXzr8Dtwk91XkFYW+JjoH5c3XWcrTlXVZzTe3+u/4kIFx9txkgUrWSHnaFN+sJJtJNiNpTeJnp0Aj+4bHv92GSRcEd+nfzb9XifMOGsQgmh6LrlGvy9DoVo8deL9i4cNtyXk8E5Xgd8Lu1dtY8e0GCPeRHg7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdO20yTv; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdO20yTv"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c197eaaab00so153488966b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750650; x=1788355450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M95bC9nkftxrJ/safx7PKi6P/Dzp5dRIgQksoN4iWG0=;
        b=NdO20yTvvO7SLchcNREQFlELTxHXaaZDDcum/ppRjBiBTslwR0uQIDs9Xb44dwlBkh
         rf2kXbC8Vi3ctUU+WvqXhuY/zotbm/kEw27ZQWrMnvAdDlxlTOsck7lZ6ZhKWihHpXDW
         NaHzyqPNJ3HPWFYDDEthJ/cr1UK+NimTnm9PijA/6wTANmVKu07oDqnSULgDXl10uFJw
         E1NLjm147Zg4LGWUF+zt0wWxaS4O1fzRJxqhkAenR6ZQmrY2L2TlKESt5YBR32i3ack7
         8967e8r5yABNtwcq/dMkQXvY4hZt//apPcXYJmIwhC5aRJKy8hq8eHehRP+3CLIkDd3n
         h7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750650; x=1788355450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M95bC9nkftxrJ/safx7PKi6P/Dzp5dRIgQksoN4iWG0=;
        b=DjdTIUl09QEjoh0wT3F9/nYgDKVlMx5PDU5u8fxelhlUUxo3THn031XeCntLtieWfg
         5WNTTB/QkIxG7IwQQr16mWhMdCX0ZzOx29d1erzrcu9EfttSCOEqTMx6bs3TZ3yr59BD
         wjInxe9OhUElhBd/wpuUwQ4skMAYay01Ro2jA9qzAfev1SrIgZYqjYvXU5bjRR/+bflU
         vmscLSCeScLjNWiK+9CzKHN7ud97Bi5CsOuK0Jlcf5qZOjIfZX9eoWDUl+Y98EjuvbOz
         qKYvqPPxavITTml6I2G/2yglJz8FP6U4wQQugUkS63lhXVyhutLwuGzave/kZXb3id0S
         hVfg==
X-Forwarded-Encrypted: i=1; AHgh+RoLqYu23FQ2rVsaalLtwU3uyeQt+5Wdy4ht4I6RkYPJweWAgRhfzpg7glrxAVjTnk4BpsGoucgckKLXJAhzO5XCbqb9@vger.kernel.org
X-Gm-Message-State: AFuF++mfYoI2f6R5UU/EiTEB9YGKn0+IR146cBnQIsDcd/pV6lBLepJk
	EjNsysKMM7jPGIsTg8b1qxzw6EjqKp/F1Pph+uaQwf9P42y/heE0t1hP
X-Gm-Gg: AR+sD11NR69SCLA1JZZ4zLsVr2TNmD7NCxKk5Opep+lHKe5eo90KVBIFpYEYBDxKj52
	pFyXCAc0f3CcvuWTDfUkkwky8ZQxlBIBYpFeISKr2h/RIVxYA9XXEDNcrNtRscfALDuPWA17jBW
	jDWbdeR0+iLN+abKNyGjdVeSRe1nvOfTCjnbantjMh02Z9M3MIclR5AXFQ00FAVstejYxfxDgbK
	FO5syERChvthWIp+DnRSZFV+EW5NOQSoYzsfWRPlYUbHQk5I2FoJlBmfor6bvjTjf1nPpVb0enB
	QJxpDmNHR+PDg9n5SIARv8JJDMkKsO3WTUK7Y+rlU74oUhUPrGmgr2oALJMnCocuf1RML6CMLFs
	j0uX8zxjrb+3zt2+fcScO/7oCLQQCMCovoRmXmJLVjKC9BxjW2UqCNEEOxpwdmDTfMDvE43Wtww
	QnSsXy4OuIXwH8kl6IIc1qa5JH57K/94e1dGx4Xw4we5OYXmBJsLN5QXH+RB14N+i4plwlQpbuq
	rThdoFawXUqcoEAuKCCXEfCAtlZVxxL/fUrBl11Nmc=
X-Received: by 2002:a17:907:728b:b0:c1f:c061:569a with SMTP id a640c23a62f3a-c250bbe0e01mr814991966b.7.1787750649485;
        Wed, 26 Aug 2026 06:24:09 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ae4dsm648518666b.39.2026.08.26.06.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:24:09 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [RFC PATCH 0/2] x86/usb: Add Yoga Book XMM7260 modem power sequencing
Date: Wed, 26 Aug 2026 15:24:01 +0200
Message-ID: <20260826132403.3345072-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91L connects an Intel XMM7260 modem through a
Cherry Trail xHCI SSIC port.  Firmware exposes an INT34D0 ACPI device,
but the modem requires both SSIC controller restoration and an ACPI/PMIC
power sequence before its USB boot function can transition to MBIM.

Add a DMI-scoped xHCI quirk which restores the SSIC vendor state across
setup and resume, followed by a platform driver which performs the
firmware power sequence and coordinates xHCI runtime PM while waiting
for the runtime function.

This is an RFC because live XMM7260-to-MBIM enumeration and suspend/resume
acceptance are not yet complete.  Feedback is particularly requested on
the xHCI/platform-driver split and the ownership of the SSIC sequencing.

Maurizio Casciano (2):
  xhci: Restore SSIC state on the Lenovo Yoga Book
  platform/x86: Add Cherry Trail XMM7260 power driver

 MAINTAINERS                            |   1 +
 drivers/platform/x86/intel/Kconfig     |  16 +
 drivers/platform/x86/intel/Makefile    |   1 +
 drivers/platform/x86/intel/cht_modem.c | 418 +++++++++++++++++++++++++
 drivers/usb/host/xhci-pci.c            | 114 ++++++-
 drivers/usb/host/xhci-ring.c           |  31 ++
 drivers/usb/host/xhci.h                |   1 +
 7 files changed, 581 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/intel/cht_modem.c


base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
-- 
2.53.0
