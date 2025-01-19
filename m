Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1831E1C01;
	Sun, 19 Jan 2025 22:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324379; cv=none; b=Bhlaw5bZKNkjcPQ9/+L/NhEEjOCA5dpXhlOCO5OUPocvPlE4jLe1p/fzl5CMXH4Ma7Y5/+mvANsPXbjtHbePAWmfJ9SIq3L5UWqjc1s7Z5cOpjLZDlhYvDv9nNLepL/JSW3xmkFqBIg6ik4SDbWaVgxPgdg5xwus/Dmlj9l3Zr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324379; c=relaxed/simple;
	bh=Woq4swbnYq3xsWIj3EtplDj2WuXqxSueFP8J8UTTZS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pdTRzQWdKWsqH7PBgvGAae16qopMrf3SNgyaXLfvj4UoHsMOIbSvJ0hvMaobRye1+yIw9aQQtyq7Mogqvd/Dr/FnmbMyY4EJuyWynIpqFiwDxlahFU1yHggHeE7hsHOdlY2t7RoHnpgWStmP/AAd97tQ49il0s96rJWkllOU/EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxLujZMb; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxLujZMb"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b6edb82f85so531417285a.3;
        Sun, 19 Jan 2025 14:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737324376; x=1737929176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0Qac2DNxaP3+ckGylXZbGeHgHst/csov0aaJCMEn8w=;
        b=JxLujZMbAhmbAl0UCh4bIlOTUlCtzcFh+OLz0qQeqr2XuSQ3voFKdiADHUqRpRAWKJ
         TdKTDaQzOlB9q+BFtHmDzDpYdMzAnlBOzyszlhSxLNv5vrkmVtFjy7YlBym9TM/tGhJF
         MNQ3lM0rlBS/my21zf4pn4FzgDtpnUiEfHPNPz77brn0MGguRlWtF1Oe/13rife/z2TA
         mMABuGG0XMPPomwf1i25DeCoIfhbLWLf2y5eDfeXanUyPSToK6KWodzDztnucm8EnxqQ
         75bz1VjXPssiwVx4XipTLHsJhWNvx+SNNWIiTNLs0iGFv4N1qYnqE0ibxo9zMv+sBJmU
         SFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737324376; x=1737929176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0Qac2DNxaP3+ckGylXZbGeHgHst/csov0aaJCMEn8w=;
        b=JNrRKC1JyPpzRiX/sUxIuwxwUUwwA40DsWCA39G9p6Sv62PGn/FwXDzDK/2mzM+HeA
         wQKq4PYNa17MNJVIuo97t6+OwJxQz/+BeZYeRkK2uds5R8hwn2EXLnFaGW3gteKYh1PW
         fcAgkeCPBLta6VOtD2nrcjE1Ox1t2/ge54L8dLTOABJBjYtjuXCIQ4VEMmfDoY19H7gr
         MPxsa/EZAFxRdIG40aP3f2/E9aicevM4St3d8wXUmes2wILIrTv+XDSoytnlhfwkiZKS
         h963n3B/uaIvezfZhGWOTqQBWx47TufEH73KddZnFCdE37PObzM/zbjgdq203EKPRP9U
         4a3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVO/+PmbycgbIvHgtBzN3KRKZFLjb4Zh23kCvx2LkJzF0gfDEnfl8Z7jhebcWfTTOC+zVWwuw292DfkAiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk3c35927TKufg788Yn/dfwK5q0OT4whzk1Aan2TanDljGUUUj
	536/zRkveVHxNRCQinwYSixRr8AvWerNYcZaeDS7WM1GeiPMHODbZV6QZw==
X-Gm-Gg: ASbGncvwjSmyBh1hZkTF28FSaSPUWV++zrF5bD9X8d6+8MXqcdhpuY/IWUEaooPloQr
	MV5JeuwAI++qgYFlwuHTxwuet70tovbVS4PgSWhh3nGEtB2WkQdr0nWgnpjaYZZGwsJdKHcBFh8
	YLDAapbanX7NHLk4f6HRY6W+j2ctswxbr99GsZRxHnUW3JpYR9YvD9XS4aJp3fEUt8rDGiA0ZWr
	oRNHuUkwOmwjV1O8DNedzStDjuPx7Kbg7qZnoiVDLvIb1OTDm2EYxzP/h4ufZzQCQku/TmTpo6B
	1w==
X-Google-Smtp-Source: AGHT+IENRnzO0J/c4LcfyRiaWqw5IhOtUNCu0DD29+PqW1q+bg4zPH/U2eQ8s341OmX7gw3VEI2Anw==
X-Received: by 2002:a05:620a:439b:b0:7b6:6a3b:53af with SMTP id af79cd13be357-7be631f5df0mr1661282185a.14.1737324376390;
        Sun, 19 Jan 2025 14:06:16 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614f0096sm369243085a.112.2025.01.19.14.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:06:15 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v5 09/14] platform/x86: Rename alienware-wmi.c
Date: Sun, 19 Jan 2025 17:05:37 -0500
Message-ID: <20250119220542.3136-10-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119220542.3136-1-kuurtb@gmail.com>
References: <20250119220542.3136-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename alienware-wmi to support upcoming split.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/Makefile                               | 1 +
 .../platform/x86/dell/{alienware-wmi.c => alienware-wmi-base.c}  | 0
 2 files changed, 1 insertion(+)
 rename drivers/platform/x86/dell/{alienware-wmi.c => alienware-wmi-base.c} (100%)

diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
index bb3cbd470a46..f8aec8502c2f 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -5,6 +5,7 @@
 #
 
 obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
+alienware-wmi-objs			:= alienware-wmi-base.o
 obj-$(CONFIG_DCDBAS)			+= dcdbas.o
 obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
 obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o
diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi-base.c
similarity index 100%
rename from drivers/platform/x86/dell/alienware-wmi.c
rename to drivers/platform/x86/dell/alienware-wmi-base.c
-- 
2.48.1

