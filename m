Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069312236F8
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Mar 2025 09:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742203653; cv=none; b=cQ0OSo3xOJl4iY6iYNQRvybI16FgJczz/PoePoecNXD6/QP5mTexkGeGqxpIya53R3q9C5S9GuQqxx9iZVhjYaNFg2hImh0Y2bL/NfeUqFqwvA/BQzaO9ZXx2dZGSYk1GsMQc4Fvlv8rAVoCIqRukYkhz5YKZS0Rv3SvDDrk8wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742203653; c=relaxed/simple;
	bh=wc8ZUJs4juXlpOzJC3dYvkAmWROYc3NkYrmr2+p4WQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r3604Dvm9urhl6f2mhX7qOdxDdW4GgRw96+pFxc+/FD5BgevmRn/kGzdt8b/f02DfolU+zhXp7RaZ4NXvmZxuvNteWASOdLMDL/ylQMP86qwWrCxscS/EPAa/K1EX7CaaSz2UL3LdoVQqrCs34Cj0dQyZ/RfdhPA0Bt5tlxemWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RtzTOvYP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RtzTOvYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742203651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ELVb8/TgPP99S2US6QOwfM5yFjDUVc6XvoMzilxTm90=;
	b=RtzTOvYPOTYCEGBmbVhgtK6bjdoIUludFsVKYPzy8ICOOfh08s6JJWQznYlb4ntAgoH74m
	w/K9jFhoTU83VZ5HU8ttXF2VfaBMjEn7VK6TmVddyaPtkT8J3/Ss6zJb93rcepr1r+6CI+
	8ElyZAH9K2Q6brKBpZ5aCBv9Jw+0pyY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-12URS5bLNoCn82uvuDWAtQ-1; Mon, 17 Mar 2025 05:27:29 -0400
X-MC-Unique: 12URS5bLNoCn82uvuDWAtQ-1
X-Mimecast-MFC-AGG-ID: 12URS5bLNoCn82uvuDWAtQ_1742203646
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912d5f6689so2644699f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Mar 2025 02:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742203646; x=1742808446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELVb8/TgPP99S2US6QOwfM5yFjDUVc6XvoMzilxTm90=;
        b=DBnAOvelPizbhe4Qz9Q0AYWB1q5YTNIgUssHkCOAo21CvPDjsDt5l9f/LyDr5eXMvA
         9wzeZ6CjVtQvgZLb+qt31Kpz9pigRSnPqAUQnGt6XYEQjeejOXgbRQosKvgwnDefG7lx
         smNioDPrNCq9HJNxAmEW6dgW38Bk0ZcOy8naLcHStgHF7BgYs0puJqcWIUZkqudMQ05U
         YuW16Bjm0JqkfE3nev9r81M2sr5418IyNmbH+TBY/gUfir+Z/lZKfzpu+Aejo5lOWA3j
         6r/3DJ4izl/9sbIuveESZnhojMwE8TSlAXqs8cCVn6dDqkVCL73HWz5P9BHdjZlR3M8b
         M3bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsMPaQ5Kwf65JCghDDNfpR/tQFV7GSvm4xy0so4v5xxrZQT2HmWyKX8PuKNVsKlgIPtMixs62yuQTOgaojc561GTxz@vger.kernel.org
X-Gm-Message-State: AOJu0YyqjCrFyr2cK4M1RucNX78Xqa0jM1/bg27lYRiy0ZoGzBFxevtj
	2t1Fu/8YuoKkmTPTpp0VL6L50wPgX7Fyl/79jXvF1rgXIaHfDFXMrOM+ZyYcUZtpDNqubj0/0s6
	dxCH4BMFO1JJUS41LN+6jj5rMOvbNLIJH3aWOyOUVhFWZZufuGzGbBYs7jSP6y2PJfDkhGB4=
X-Gm-Gg: ASbGnct3gdE+s7M008hl/vmA+Fp7jJNWDWJQWxzfV1Nfk0n6WA9hs3P8y03/NdWCAYx
	IRu2mKqjTM8wsEVUb20GQIwipmcQFCWpSFtZvrsvZZS3UbF7f2t9oM5mtl/m3QbKVzxxAB672Ut
	aMD5XkFWnw4S8XwOps/xzHpRFPv/5qjA2S7p7bDqni01ri5b9NzKUp7cioRtsKeouAjHLAyiUKX
	YvxZ8DSocjxOZIziEQOXqulfWj6JQDkZx4oUswboMmCMa6aFIw2DRZzshVJNcldXWpzR/o04CJX
	EXUHzaN+pIFAOkWnbunAEJUtvbbq5TJGMs9vvp5eUaK4V4LTTcVFAYvv7AVmbDU=
X-Received: by 2002:a5d:5f84:0:b0:391:3fa7:bf77 with SMTP id ffacd0b85a97d-3971e3a54cbmr14547814f8f.31.1742203646506;
        Mon, 17 Mar 2025 02:27:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRgjJ/x/oVlKZKHU7TipAkeP19C9rZyh+PBBydQPPRm8QgqfVoTWGnhCYtv13jfPOOqNUncg==
X-Received: by 2002:a5d:5f84:0:b0:391:3fa7:bf77 with SMTP id ffacd0b85a97d-3971e3a54cbmr14547775f8f.31.1742203646117;
        Mon, 17 Mar 2025 02:27:26 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df3506sm14795571f8f.11.2025.03.17.02.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 02:27:25 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Chao Qin <chao.qin@intel.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH net-next] MAINTAINERS: adjust the file entry in INTEL PMC CORE DRIVER
Date: Mon, 17 Mar 2025 10:27:17 +0100
Message-ID: <20250317092717.322862-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 7e2f7e25f6ff ("arch: x86: add IPC mailbox accessor function and add
SoC register access") adds a new file entry referring to the non-existent
file linux/platform_data/x86/intel_pmc_ipc.h in section INTEL PMC CORE
DRIVER rather than referring to the file
include/linux/platform_data/x86/intel_pmc_ipc.h added with this commit.
Note that it was missing 'include' in the beginning.

Adjust the file reference to the intended file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
I think the commit above is in net-next, this patch is to be applied
on the tree where the commit has been added.

Jakub, please pick this minor non-urgent fix. Thanks.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96ae7f628da4..9544a4e84f99 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12069,7 +12069,7 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-platform-intel-pmc
 F:	drivers/platform/x86/intel/pmc/
-F:	linux/platform_data/x86/intel_pmc_ipc.h
+F:	include/linux/platform_data/x86/intel_pmc_ipc.h
 
 INTEL PMIC GPIO DRIVERS
 M:	Andy Shevchenko <andy@kernel.org>
-- 
2.48.1

