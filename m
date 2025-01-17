Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AB71F8902;
	Fri, 17 Jan 2025 08:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101692; cv=none; b=jXBXDsLx/bOGkz1TeG/7IzKgCUfhE2V2dCIBvlexvMbgqHSF/zT2DBDa9itFADlRJtPmePsVOullydCe6XCJF3Vv0HgqJLC5t860VLgOjRYg6XpiuOixWG6GskrPeo9qXFdI3vuZC/wZa7HgquMBMFh9m8Ox+Keg0eAgRfG7lbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101692; c=relaxed/simple;
	bh=JF8dghz/V3qoWXscDcPAQ6EglGIYyD9KUdKTGAWJc+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YxvqPYXtx3xmaoqB5GdPieEoebogEEjoo8rITRMzGCT2hgXEIiMGrxgio/9Xf6vonChqGGPLKR1syBt4PaT/ywXguQ+TvQbFCB2WwdiTg9VvsgF5OWbX+Vq1d7uRSKacuK76QcqdkA5imfgf0bdZhUj7fkei90gArqS7JgTVPTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTIBls+1; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTIBls+1"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85b88a685e6so804563241.2;
        Fri, 17 Jan 2025 00:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737101689; x=1737706489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuNfSILdnCJ7PQTo088HkVCj2bj2Fhg3WmJOJb5OLG8=;
        b=aTIBls+1M9ri/cdptMym+6aXtVuCoYB2+L5pFoG1SGEHTcDkWwwDSBaagp9tNMQJpg
         HRXTE/xTCeUyW6li5WfeSrH/Z4cYOPAeo/g6/z3Unwnz4WMGSLXR1TWOU7pTs/D730HU
         nw++qVmkTk0hCz27Qjysi8PI8LWaX6RGUMFpxb8gBfbUs6kqcg+dNwvPfbUR4tX3SdiG
         GhIYXT+GdcEMhLqdMS5rxbj6OecWQTua8158zIP0dP17exPSfiw2EsUyUqBYSNVz2/qE
         kOJTuT+Ei/erqtGu2CFZqY3Bs3NyWgcM51uG1fGi4EDNuzBvKq6bGy7q7hkicNT+QJZ8
         9viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737101689; x=1737706489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vuNfSILdnCJ7PQTo088HkVCj2bj2Fhg3WmJOJb5OLG8=;
        b=XlhnLqTccKR5RTvGN7R9GfbZ3gs8EpaJscWs+l5dkOJ0wSAP5rntafnSmV2L3OH6fA
         vDL6shgqod7uaq3Z+PvK5UYLnixSkdS3QZtQhXWSD934pPAEojBhOtEymCv5D7gvyajk
         BMTPNGcrhNOY1AwiouqNDoUe7XEqpWkIy896Bjj/aA9obfxVX0mDxAx/YNUXSxtS0qVh
         g8cyBFYr9s7s2Ebr9ye6icIjcNpB1KzYEAMUvkpv4hQu0tF2hUoLT9ZKmKqzADT6+qjf
         hC7dnlb7ZCId9Tj+FVTbQHkvO7Top7Wo0cO3IKSuc7+8NSVBX762nx5rkxSEMjweltIM
         qUrw==
X-Forwarded-Encrypted: i=1; AJvYcCWFsu2Sb8xrpqKMPKBpwBX/mDD+fnEAL/WNHcMxYFtYyaKAYgF8MtqlnovklJaGibfFUviYoIAOYAsYgI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkYWpS0PDZUyCJ5/6Ft4Yv8pKP4dVD8gUy5JIB/6uZPLZZ/O5n
	fOdpeANa5xnJ2Z2btaHN94UPRYbjbSB+8PLxJg9RdBapg13cqJH9zXq7Iw==
X-Gm-Gg: ASbGncsIVW1C9rRiikiyQEcoc5JTHpIvC+hQGOryRiSoMBVx84gzqVTPWNZq1eDoTw+
	rC1WLKFGVFPmulmUZokz3zdR5kI5GfruGA3f0ZGexcPzFZDx9pvdhlXPiyUG3SS1vTzT3sVb2SX
	fAC9r+YyBh8nzkdk1+Wu66Lp3P+hT9dFQrfNtXA5PrYsDhGHCFe3Sb/3KvYLPuC6dbGGkSYIh/w
	awktui2lvVYBQQZVnl3CuhU57hER4mh7TbhE3jBqVOtN0E5+a0ZjblKnf0xSTBf
X-Google-Smtp-Source: AGHT+IERvbWq9gR4Ct/nj3TV5bc406q4jXCCDALH0g8knu8w0FN3/hAyQtmhZv+1K15KmDwMkx0DQg==
X-Received: by 2002:a05:6102:2923:b0:4b2:adce:bcfe with SMTP id ada2fe7eead31-4b690ce307fmr916293137.22.1737101688904;
        Fri, 17 Jan 2025 00:14:48 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642caca4edsm393703241.11.2025.01.17.00.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:14:48 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v4 08/14] MAINTAINERS: Update ALIENWARE WMI DRIVER entry
Date: Fri, 17 Jan 2025 03:13:41 -0500
Message-ID: <20250117081347.8573-9-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117081347.8573-1-kuurtb@gmail.com>
References: <20250117081347.8573-1-kuurtb@gmail.com>
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
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
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
2.48.1

