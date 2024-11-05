Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25BA1DACA8
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 15:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730820510; cv=none; b=hmFNveK1zd41mjJMj+3Qw5je29pu7X57KBXwT3mUf4HtnEx0+eYyu8sLIs0h4jx+gWCi5Co+DxwRG7pQAgX9i7v54yebuZX9z1NWWgUxiK6XegSgD9j3jTsvG/r9t1FYMdsAC/e/UlIMrw1h0I6lob5B0tmira2skRH5X569Dog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730820510; c=relaxed/simple;
	bh=koya1W1nzWIe32bX6FCUiIbJTuzU7rznDrUGuDE82EU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hCymdzxK3vSsNj2hhbUKLjf212hSC3486ZgiFgS+3I/BzveoN850FD0CfukBMW52D6ZD2pM3wOYpN+O2TngLITcXB5mPg1f5ywXwiYduRp/pG4mhk1i3odukM75mEgB+7YzsCbYcqakc6AA2ZloSWkir4vxl60FUuRL9zxoArvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TwCc8adw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TwCc8adw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730820506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/BHZqjA869XTgUt4zd08lmfD1No0TmEngRpCXfkSKAM=;
	b=TwCc8adw52HQV+6dVJtYGC2OYG2tkt6R7typXbLHCTptEkmyTlvQhxf5/IjmBAEDRmN23P
	hWjAVNvvMVzS6emM4NUyHdGpHTqOZJPEjJbLqrBkMnqklRCrrqS9NMNjwxRuVBj80JYQqZ
	qLPjFAT5FY78kqMW+EtXw1PFCBMI2nk=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-vY4C50qcMHyS25YCK9HuKw-1; Tue, 05 Nov 2024 10:28:25 -0500
X-MC-Unique: vY4C50qcMHyS25YCK9HuKw-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3e60e17745dso4042378b6e.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Nov 2024 07:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730820504; x=1731425304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BHZqjA869XTgUt4zd08lmfD1No0TmEngRpCXfkSKAM=;
        b=Rz1CBDFo1u3MBh82C1tx1QqRrmrblO3xCQaeCE6YS5SAlCxLNUQkeJSg44VBB28Ebn
         nXAHOOroa9rAq5NiIoXbXcdjquuwia7NBpvVGKa6OFOUQtVUiB2b/tlUpkiiwB3kLw1T
         OGFRqVmGT9jrOEYyiuMTC/a/9Z12qQbQMlht4mHGQfYarTnmGPHVi0SzNb6tg5T3e9XK
         D8uRh27EDG5wRviTbb0+6Ff9xrwZ2o1QksMMmtUuJ/iqe+cstz+jFaYSb8lnXM4DkyEY
         bohOANFXWGeUXy4c5aoQUv4spzyqt87/YgpCJxuoXEQv9jQ6aIj3ApoE0PYDHCtuiM9u
         Vfpg==
X-Forwarded-Encrypted: i=1; AJvYcCW+FmLeqzH0ymDk0SQ4cuPdEcveBnJEWINYW3zrcFkarcYhecHdMQ5N75XRK8/qgoniLBIcLoh8eIRO7DVUbFELt5uO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+sj1+y89JkPHimUUuQe0+RhXUnre+BEkF3V6MHNYp2gKUXacR
	CWm2RtofDbdsx/g0Obx6+1UcUdOJalMNNE+BXZBxuglIJfr0NVNq87aoWhfGIuXbV/m2sH/b+Ls
	SOkMMhmUs4b68Oozgmy7ein2mDIj3eg8tBvMLCQb4XjAjrkfw4TXdOpGvkmhmvlmoyLWhqaQ=
X-Received: by 2002:a05:6808:1a13:b0:3e5:fd5a:d3cc with SMTP id 5614622812f47-3e758c1e383mr15987674b6e.16.1730820504494;
        Tue, 05 Nov 2024 07:28:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEM4h5d/5NTRGyzrdFGDivSjfzdTU4SI3JAKtmPsDLW3+Bpn/Y3lRnzvPnwJvRB/5b3fWrucw==
X-Received: by 2002:a05:6808:1a13:b0:3e5:fd5a:d3cc with SMTP id 5614622812f47-3e758c1e383mr15987633b6e.16.1730820504068;
        Tue, 05 Nov 2024 07:28:24 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e661259698sm2528540b6e.50.2024.11.05.07.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 07:28:23 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in INTEL TPMI DRIVER
Date: Tue,  5 Nov 2024 16:28:13 +0100
Message-ID: <20241105152813.60823-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit df7f9acd8646 ("platform/x86: intel: Add 'intel' prefix to the
modules automatically") renames tpmi.c to vsec_tpmi.c in
drivers/platform/x86/intel/, but misses to adjust the INTEL TPMI DRIVER
section, which is referring to this file.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Adjust the file entry to this file renaming.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7fba9faf48c9..31b2252122ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11851,7 +11851,7 @@ M:	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/debugfs-tpmi
-F:	drivers/platform/x86/intel/tpmi.c
+F:	drivers/platform/x86/intel/vsec_tpmi.c
 F:	include/linux/intel_tpmi.h
 
 INTEL UNCORE FREQUENCY CONTROL
-- 
2.47.0

