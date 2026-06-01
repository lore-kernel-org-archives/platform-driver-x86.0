Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB43532B13C
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326862; cv=none; b=kN5Jcoo5dtEuzG8V13GrG1CA6bt8tt+lKiHb6VS8PaaoIqPqbNLvpgXLmcGxGqpqnFKHLjDVDQEWRgDKbwUQip8pIOI7uO7zATTXx/+I9yFDlYlcc9+UppNUrY2/F/gn4rRHPzuljFDtGtoV7KDRYZd5uBOkhE0p6U4XJAKwCug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326862; c=relaxed/simple;
	bh=5oZ1J1mvUSvyKO2H76WnIK5IZNOAj6TLh/fg6s4qq2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lu97jDoFat/OB/JLs02B10hNIWdumBi42HdJI/gSPHtszsrv6cNgWD4S46D8WPXoLO9GUy1aK2X7t+kDG3NJ+kyuLMpYI7wRJvH9G7pFUCJr3fVouWAFkshmP/kKeDDyw+K7YUSDSWJM3x+x2nCbpVWtzQc9t8c/bEa71G9NTTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mt6WHc97; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mt6WHc97"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304c520fe9aso10642174eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Jun 2026 08:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780326860; x=1780931660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJpcDUso6CbRYOnrV9hEko7Jya8lODsgrOXXaGf0maQ=;
        b=mt6WHc97XqJXNWwXtmo6QDfZX+Ns2qY8l6sPPuY4Ygp+ccEmAhr+mlT1idIuK2hn+8
         q07KBuIP6NZK3ofmVdK1amKa2EkOJt9VWrWEok9ne96NmVILlIRcfrPKHTUebCflWnPl
         hgpVbf3bnbvVEaPfISJY8H40uJhbwC8cU6Oceiy4Osvv9pg9g4zM4KodB2zHMF6SwHxz
         wKCHMKP+PRg8pdhMNZD0jfclfU6qPjQraiTNJTKtMYwtwDFmP317MtmFScCLIRk3Pt9y
         U+zdDRqlroinCxOT3nRqBMph3M85tv/gsRPXj5+tty6sQRJjMglfWgVuIhQs3x3SbpTZ
         qyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326860; x=1780931660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJpcDUso6CbRYOnrV9hEko7Jya8lODsgrOXXaGf0maQ=;
        b=g1z9sA6WvIIw5+lOBr8ZxcLXVe4vDTUdgkBhBQwTDLDbLgcqRrWe6hrYEROPtdfqir
         M484CnfCbI+hfkCTOODuola0mt/P5tiRs2x7BB+YtFeFYSaJJd7We/qJJahDuuetvH04
         evMkkuKiqdCEHZRZCJoM6Fc3ZWLnB2ZLD2r62hX40YSptZyDe7VoEm0YdY5C6aL2K8wP
         6iBUiCzXMe/oSWgaYSQ/qQaX9anYOWt5zJrhpIgv14mHv3WiHTjnf1SBtgBo0Xr7o86B
         hLClbDUWUjQTJQgSZ2x7UMLkePR6wUylFBz0crCynUxg6l3DDnhcFp9pcoKNAxCKbhlv
         0arg==
X-Gm-Message-State: AOJu0Yw0FSI4BnhMAwFzkgLB5cPS7v7DEFPN8EzZHafXVuN1eqqORkH2
	+AEy1pLXPo0zpj/7l5tYPpgb18Ai2fJ4r6isEJH6Lb4wMNGzPPe+RXlU
X-Gm-Gg: Acq92OH2sFPxLhcEZ/TCLy+EjD8hqquzHArDoAWX/DxlQowCEcda8pNavYZsPGqaRCh
	9vCzfIfLFVxACAdMe/ZoPnvgpR6CZZjyHVFBKslNiyhfwcM8nue5LPE4/A0LTyboZalRJsH6bCg
	2lAqBw9qtJQLbmrn1fQANxSLBrpKhXYjc6xMFi0K/kGdZUa8R83sbr0XMg74iJdFjoqk5H0TWlL
	g4V5bqmqbBg1ZvbqzOZj3h1j6qdUkvOoArXhA9YScP0u2mMadmM7X856uZRHUNrb4eTOzvE30ZH
	smaqSaXv44wN2QstL8vsEtJm8UabA8M60a7E7TCPSPLrcSBSydDTb2KWV6eIhoTBf+q2iP5TOly
	TVadkzSnWkHFH4r6zz17ty0Ld77q2SiPPnda1/eQoHroCxUjx4zS0kctTKgrL8K6zzquAFxmqGx
	RpbSpUtaC2RO3JTGI6fLpRJMJQ46C6I8st5vGF
X-Received: by 2002:a05:7300:2201:b0:2f1:6252:f8ef with SMTP id 5a478bee46e88-304fa49ce0dmr5966374eec.1.1780326859644;
        Mon, 01 Jun 2026 08:14:19 -0700 (PDT)
Received: from Lucy-Fedora ([198.176.56.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53d14fsm9116383eec.17.2026.06.01.08.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:14:19 -0700 (PDT)
From: Lucy Wong <lucywong2778@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucy Wong <lucywong2778@gmail.com>
Subject: [PATCH 0/1] platform/x86: add Xiaomi WMI key driver
Date: Mon,  1 Jun 2026 23:14:03 +0800
Message-ID: <20260601151404.93049-1-lucywong2778@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a driver for extra function keys on certain Xiaomi laptops.

Unlike the existing xiaomi-wmi driver where each key has its own WMI
GUID, this machine delivers all keys through a single event GUID
(B74AF83F-...), encoding the event type and keycode in the event buffer.

I was unsure whether this should be merged into the existing xiaomi-wmi.c
or kept separate due to the different mechanism. I chose a separate file
for clarity; happy to merge if preferred.

Tested on Xiaomi Mi Gaming Laptop (8th gen Intel).

Lucy Wong (1):
  platform/x86: add Xiaomi WMI key driver

 MAINTAINERS                            |   6 ++
 drivers/platform/x86/Kconfig           |  11 ++
 drivers/platform/x86/Makefile          |   1 +
 drivers/platform/x86/xiaomi-wmi-keys.c | 139 +++++++++++++++++++++++++
 4 files changed, 157 insertions(+)
 create mode 100644 drivers/platform/x86/xiaomi-wmi-keys.c

-- 
2.54.0

