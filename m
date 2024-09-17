Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C72165F19
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Sep 2024 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726569610; cv=none; b=aBgDxlaHf1uVujBMGglHh/Rl6+RUrgPbAzGY2PpwbbJQq0A0yoz1T3OerLczjn3rEE1pmtXeLf34nDdSwl7IH2cPqRC7e/ez4bJkBN3yF81ZwSewsiPHPWxNPdfrlF7fN9RLQsGWw9bUNt8nTA0GgSd5Mho+lXbdMNXOtyzoDhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726569610; c=relaxed/simple;
	bh=0LMBN520YvnGOafFgvhLjT6qIlZcWSGFYJKW35052PE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c9yUNd+hn+LOrp0raspxpT+nWLzXF61MuVYvAxhLOQBHst+CS4/ERrHNVg2MuboC33Lc3Nl8ULi0W1WhclRJuFnCMTWEYVEqDDnOoctZNmcxICAX/JVexlqdmqmP0sx2eDVjZzuyqFstm6U/Mgl8HwFes4bj5IhOf+0x+mNNJMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iM2sM9dt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iM2sM9dt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726569607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K8NsOdWTBNIM1qx9lP6F4iSdy29rXjvavRpAqXtZKsU=;
	b=iM2sM9dt+YYcRlcfT7th55+2vZY5NNuixrzM2xvrb4vbu5fRvY+oCcNKnXnN06H9wQnif5
	dVzb4orCvOxs3ZlZ+6CMdH9X9vWKpudrj5n9uGWw+IGCjxZgkcBe1++q3xr+vSj8P1RBAL
	wBKOWcBvG2ND9fJlO84IfDFxscuYwdk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-29u1BcQROLelD6QAzZyuEA-1; Tue, 17 Sep 2024 06:40:04 -0400
X-MC-Unique: 29u1BcQROLelD6QAzZyuEA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-374c44e58a9so2308838f8f.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Sep 2024 03:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726569603; x=1727174403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8NsOdWTBNIM1qx9lP6F4iSdy29rXjvavRpAqXtZKsU=;
        b=I4MPwPL9r7RX1Ojg9Jd3bg0XR8KP0A8Sjdiv5yiy7hIlBqkZRkAmZd1Bdbhr6ZaiqY
         jfkDQSJYqcYOfHkW/2geJJhLEh53HPmqos55ugwlsxXhvFpJH7lG2m3RdHl59MeFw8w+
         f5firr/yCV1DUGXjV6JAfW/6DGXQLINb266F1TX0NqslGqRYsmt+PKkKHLFkl1OyjnGN
         oU8GqBTmDNsLbspHJTsE3YopDq33KfPHBRJrViaEBdd9nmUamWC39fIluD/4qlKq7VHd
         G1kglzpU7q5gaseScVmmcmrBvuGSJC9qCZjb3ItKPUgkArWy8TKJylfrPbfdUL8Y5gW4
         ONIA==
X-Forwarded-Encrypted: i=1; AJvYcCXBO8b6893vXWfMoazArjYa1LkJ1ipG/iXMT25fZOSk0Xd12PUoGolI2XRbLU147P7GFlXd9zXsP6D++VvHwK9776up@vger.kernel.org
X-Gm-Message-State: AOJu0YwZXj91HVJkndVF7ThEBs6GDOpSoPW7HNfGjbPFphXpddKPnDSL
	HCq5hTmelIsLGaO6pwGoVp8WHcSqdyO371qOckbxKDA/2/D+O0Hi8RAwg/Kn34BftpfiUdYXCti
	NWXPsvW7xB1NQuaWOylZQ2V931WtHiiTce5+wRARZWXKvdsjOpmP/WepJqd6DlVtRtN1snbs=
X-Received: by 2002:a5d:6892:0:b0:368:785f:b78e with SMTP id ffacd0b85a97d-378c2cfc259mr10196603f8f.13.1726569603381;
        Tue, 17 Sep 2024 03:40:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa4UI97Csxn3j4pYvJYFP/Fr/uiCCt79JPc4rAJ1fBKy2utflgkB7c4Go4SgMPtMwX0FZF9A==
X-Received: by 2002:a5d:6892:0:b0:368:785f:b78e with SMTP id ffacd0b85a97d-378c2cfc259mr10196573f8f.13.1726569602833;
        Tue, 17 Sep 2024 03:40:02 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780007dsm9183869f8f.82.2024.09.17.03.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 03:40:02 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in INTEL MID PLATFORM
Date: Tue, 17 Sep 2024 12:39:55 +0200
Message-ID: <20240917103955.102921-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 5f1cda51107f ("platform/x86: intel_scu_wdt: Move intel_scu_wdt.h to
x86 subfolder") moves intel-mid_wdt.h in ./include/linux/platform_data into
the x86 subdirectory, but misses to adjust the INTEL MID PLATFORM section,
which is referring to this file.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Adjust the file entry to this header file movement.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4c4116045664..9a4fa88edcd3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11646,7 +11646,7 @@ F:	drivers/platform/x86/intel_scu_*
 F:	drivers/staging/media/atomisp/
 F:	drivers/watchdog/intel-mid_wdt.c
 F:	include/linux/mfd/intel_soc_pmic_mrfld.h
-F:	include/linux/platform_data/intel-mid_wdt.h
+F:	include/linux/platform_data/x86/intel-mid_wdt.h
 F:	include/linux/platform_data/x86/intel_scu_ipc.h
 
 INTEL P-Unit IPC DRIVER
-- 
2.46.0

