Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBDE1FC0E0;
	Mon, 27 Jan 2025 04:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737950678; cv=none; b=WNj0c3cRG5DA2L07+DbDOzmK4mJWdcwLIkOTS3S/rhZtmT3e4ww9V0W/NjgqpO0+cTmciprIgKA4rZg2IYUHuBSiivKUs1QRt2jslBgDI6EsgoiRDbzhK7iOwKz/wUGK4DYVb0mwZvsY7E9mPOlbL4Ph8C030me3vvuQRrCxPOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737950678; c=relaxed/simple;
	bh=JF8dghz/V3qoWXscDcPAQ6EglGIYyD9KUdKTGAWJc+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SL8AKJmW7w0K+tpjMqS/rDk29YO4+UA9r3P5MRMs9vj2UaKF4L6UQoeGzwZ5apybuwMOffmRt4wPuOAhPT4jWmIHY5JJq0OGd+a187BRP+9aflXli28EFy96sN9MJyTW4N2Ugem66GkBBsclr2NiqVSCISJH/eaF/DY+6aup8Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O//jJTkd; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O//jJTkd"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85b83479f45so720358241.0;
        Sun, 26 Jan 2025 20:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737950675; x=1738555475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuNfSILdnCJ7PQTo088HkVCj2bj2Fhg3WmJOJb5OLG8=;
        b=O//jJTkd8EJBHa2VLe3mPyQitHH1jVj99h6aC1PoAskT4NgVa3R9kGdkvykywxL8J4
         ugoXUZOI8vPDPwXIUQUOWFD/fJiLVBqsW6ZNUiAXiy5FOszwqn3WwqPW3X1DlvnaecKC
         +C85bLpNapHUjMaDLdFRjPfERzbaA2qk16YA2Dyuu6tcwZRsV8ogOeDYNB3fLbXWq5R7
         Ljjl9ac2qgTqOwLD+v+pmi2aquFoQ/o+y5tZQ/OTJzeMU5Ue/Ed6EBMx2MIkhiw7x5CT
         IdmlIS+kWrR5gky2LyPhn5xTZEoY1nDDvp2XMFr76S9LztFOqcigKe5zZiC+ESNq2uHI
         n8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737950675; x=1738555475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vuNfSILdnCJ7PQTo088HkVCj2bj2Fhg3WmJOJb5OLG8=;
        b=OXpxesmtA5v2nDaEuwIPwFGt/BxSINiSYYDf4wn3ZLZ4a13FJS5tyiPCbRYiF2eivR
         fGcUYEGDNkE4g06cpWuNCuqa/WzVbX63j2ezHSVBG7gOeB3MSQMGdqaE/fNilQl/Hphk
         /wS7MyV7E5JNIjKd7X4F/T8DX1PUGVivwPm2wU/gHn5YC0R05sIHRYXAF8CJBX2mp6bv
         6vDsB29wlzca81kwIlR9EbAC+GwS0jlUMslwkXJqqAWgzD2lrx2GnTeY0o/UZdphIqmF
         e/tqjdhOAadr7+9NjaqX8PgdHWZGaOzWqFHW0383QyOt9vjxstiYFA6WyQqL4F8bDXT3
         kIdw==
X-Forwarded-Encrypted: i=1; AJvYcCUY/8pOvVBbcTj7VOLSGhJNT98g98PBLMqhSJnG/0MaTtOWuJn5FNWjOFIb+pIzNdsxf2N9S8aXfwf/cQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YymDQGtNLCzFlKBfwzYpOA6gwNQz4iR+hiohE3k+lSkfaoGYl08
	0WCdla6wutJPHTla5iZU4sF+OHuKlcTJaTavrcByZZ7HMfiFh2VC7o3rSA==
X-Gm-Gg: ASbGnctE/L4zbbZ8cOqLAhfKfi/3rsdbieELAqrXOhhcAS74g6gSr+bOkaWd33Mn9EC
	QL26fHhfUy8/WZkcloEig9F31WR+n/MwS3NmylDwsC4MKf5wzywLNdoEfdGVss8ujTWxUsfrOhf
	MpDukjQ9/yyYIN7v9xmyq01OLKMacvGDWx7I9Ae9F2PRBgc03xTlXUoqS6St8KJ3JVA7TqgzE32
	MOFs+qqQ+RJ5+vKom4CUkyp+/rDbReFKxoRReayk99B5rwcHR5FqXCcDeKNxlpW6bFTMTtaJVVu
	F+bOyJf0obiI
X-Google-Smtp-Source: AGHT+IFXLHrRrpKdxmh4A12zbMDntquOONjXRXUpxa0OTiFT2Kq+rRFr3IIHEmk1clZC7IAUjYloQQ==
X-Received: by 2002:a05:6102:3bd7:b0:4b2:5d10:29db with SMTP id ada2fe7eead31-4b690bc6357mr26288484137.7.1737950675103;
        Sun, 26 Jan 2025 20:04:35 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c176f0sm1733758241.23.2025.01.26.20.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 20:04:34 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v6 08/14] MAINTAINERS: Update ALIENWARE WMI DRIVER entry
Date: Sun, 26 Jan 2025 23:04:00 -0500
Message-ID: <20250127040406.17112-9-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250127040406.17112-1-kuurtb@gmail.com>
References: <20250127040406.17112-1-kuurtb@gmail.com>
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

