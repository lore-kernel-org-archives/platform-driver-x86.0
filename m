Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BAD29B0;
	Sun,  5 Jan 2025 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091101; cv=none; b=OqXivuy0YLzLtmFSCwhA2zIKZ0T3V2yih8kC6hIZFmG8Szm+UzvTbxlLz8JbHkTIJj6YYGkEoSRrs7gfEZIES1ZdeYBum+bD1PW7L9zcl1ophyMEgEW7v+ohpsCDTBDgS0TBzakUx7yRrcuYovRQS9HRp9QSJFfeVfL2gOWvFNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091101; c=relaxed/simple;
	bh=gs3uRmNNhDg+gom3qBYm5eDMcpi0sYKqEyaPYfgbx6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PtjccnntGsiXhkXnpiBc+sA3fnBHGkcnCU/gpTb0ZeLX1FlW2REgOOoNDTlUOkQcGFr+QHDQ9xQqll2ZD5BKM3fF1uK38DpU2pBpfheiSpYubTf+1HhCiU92p5gYR1y2sS0GhMM14L+vbWCy374hbwMNO39FQ7INBk37yx0ZWIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3QzhsNn; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3QzhsNn"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5189a440a65so7983351e0c.1;
        Sun, 05 Jan 2025 07:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091096; x=1736695896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNFvJ3UKrXcroCkRZ1MUjweZC2rJBHE/2U7k9KVQxGs=;
        b=T3QzhsNnXBfdxAD/DAE6WIcVTkPLgt7/yPKe9/z/OzNEMCDnf5BcNpX7zGuL8FSQ8E
         wleoB+LfvmOX82lHSXWrvj4o6Irh8OglNlLO6cKHCDaOo9SOlkyinl9hayVqlRidpb9V
         nXk/ziGQtiSvjArdy6rOId1M4imIIlP7sRcwSfRsaSQG1NJdmzvajM+MVbZKSclTZJAm
         +xfWmMEF+Qm0QrOcmmXNDpqUw5YlhPpfVXclyiihbqiFp+F8BAq/LFOAr/DZZk1A4F09
         UUa/KAR+j9voCzsd0dGWCnCEBxqrG4lxMxJrHyvE1XORgSWwnSukMSpGTrMAfVNQetQJ
         mXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091096; x=1736695896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNFvJ3UKrXcroCkRZ1MUjweZC2rJBHE/2U7k9KVQxGs=;
        b=j56xkA2/SloWHsQ4RaWRtw3ctvkBUfJuvRsuV7thHvGk3MeAhsMgJNmE66bQ+PQI79
         7XBlbVojbhKnLYRAFcxoZi1cMfP+0t2x3GzK39mOhE09rClqmTDDrLPhU9jyvyZF6lOg
         P3DvFdH1RscHxQGv9RMKOU8/wQfDQxci6QOgTS61eXvk03XFhASdtMlkrhL6Czy6PdvE
         GUh51EvBREAnXsuEad7gk1QUccBMw6R8yafyXoOG3UhbRzEzH+90ftDiENDIvu/L/B+W
         MyKH3uXb7WVtQfE0ZNjn++Gv1G4Q4ToPSqSQJAK/XQNXrXopLq6g8W58Olr5uXokHtki
         ZJdw==
X-Forwarded-Encrypted: i=1; AJvYcCWje+/bTEjSwakEtK9fijxX3jXg5H5mdTq9th1K8fdzMZQz4cVO6zErRFI1Or/GfiEu6dZ+wSX42ABK9Wo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvMTkVCbQ1QkDYDf0fjvoa20W2GzaiwdOg+jL+1YUFL0GqVj78
	31yilEZIYVMKd8SpC0ICKM+t5NBcAyB1SHjRm7aBdzwPa0UodakcXQVryw==
X-Gm-Gg: ASbGncsaKpcc3vW5Lw88rYQmgHvTDkjFiwiKOhKkRgBeu+Upw9r/Y9IIMyltv5QfO7Z
	vpfHHJhhq+pyBJ7hCPz/3hf4/vWAqKhER+OVUSRPHCAn82dszO4r239UdOTdFQHwriJDbB0VSq5
	U3nyEl+XOyvMvY+3HkE2u2xlFYisjLOdbMAnrxw33Wjl76Bo5GFMqik9VqedMaSdCaTRdryef8C
	v9iHCGXHf0X+toest1G4hgvmb3C4AxKDV1WPV02BNPB4+8/27trpDFFV52GwltT
X-Google-Smtp-Source: AGHT+IHdL+9cww6zPUhSYT7CUjg+DLEdvf1DnMjY1o3BnOXHv9BiPm4DFTGrxrw2ohzaiKJhNG77uA==
X-Received: by 2002:a05:6122:1992:b0:516:2d4e:448a with SMTP id 71dfb90a1353d-51b75c3a30cmr44284439e0c.3.1736091096007;
        Sun, 05 Jan 2025 07:31:36 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:35 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	w_armin@gmx.de,
	mario.limonciello@amd.com,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v3 14/20] MAINTAINERS: Update ALIENWARE WMI DRIVER entry
Date: Sun,  5 Jan 2025 10:30:14 -0500
Message-ID: <20250105153019.19206-16-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105153019.19206-2-kuurtb@gmail.com>
References: <20250105153019.19206-2-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dell has been inactive in its maintainership role of this driver since
around 2021. Due to this, add myself as a maintainer and update path
to support upcoming changes.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3809931b9240..596c6a46478c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -784,10 +784,12 @@ F:	Documentation/admin-guide/perf/alibaba_pmu.rst
 F:	drivers/perf/alibaba_uncore_drw_pmu.c
 
 ALIENWARE WMI DRIVER
+M:	Kurt Borja <kuurtb@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
 L:	Dell.Client.Kernel@dell.com
 S:	Maintained
 F:	Documentation/wmi/devices/alienware-wmi.rst
-F:	drivers/platform/x86/dell/alienware-wmi.c
+F:	drivers/platform/x86/dell/alienware-wmi*
 
 ALLEGRO DVT VIDEO IP CORE DRIVER
 M:	Michael Tretter <m.tretter@pengutronix.de>
-- 
2.47.1

