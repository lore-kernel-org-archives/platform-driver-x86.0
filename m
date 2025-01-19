Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEF71E0E15;
	Sun, 19 Jan 2025 22:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324376; cv=none; b=SjueKXYmvTIbOvFD8z7GCxQSOL3Q00DGr5TVDCa0RQTeyRlpHhH4xY+hqu6LwKgzJ0hCSPzCFkpBbmTs4yqOkMEaa7BLWZXXLVbunsrx64nTptEZukKL8t5AmrOM5vPB8SVZHuDRgzK3lJr4qA9qkVSftW6gB3/RgBfze0RcBhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324376; c=relaxed/simple;
	bh=JF8dghz/V3qoWXscDcPAQ6EglGIYyD9KUdKTGAWJc+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEs210QjIX9mdO8jnwAnqcW7MCmxyfDrc6cTR1cyTg9vyRqE6hUnCglQLc/zt2E6Zb1UmyRrM6pxu7AeEZifWO+PVSS/RYN9KfBFUBnD8YEW90FhAKq15onAta3iZLixOMRmOexAwzkt+UnODXVWX/8r1oFyEzWHrO+otvNJoYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGsOKlUV; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGsOKlUV"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7be44a90468so470241285a.3;
        Sun, 19 Jan 2025 14:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737324374; x=1737929174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuNfSILdnCJ7PQTo088HkVCj2bj2Fhg3WmJOJb5OLG8=;
        b=WGsOKlUVjujrgiUwaPAZzcaUgsj/hLr3qf+Ig/klk+z+bdWLx6ZIbbUK+sk0RU0rAo
         9B2NJ6eIm7/zlEd0aVzNGjuHdPW5IIuDvxWfuj2hmVaySsH3MqQA8cE1ElWxGFni1fw2
         COsaIr1rQyRXAFXwXEUaCV87Fa6LeOuE32tE+kJDfMdXwZdwOOPUC4jfU0C97Zencior
         Odcbefw8Z3LarVBU49Z8oZ5qDZsBvqAWUuGccYK9/Gkzv8sv5ygq2v+aPTc4weEAJ12r
         yiVsG12FdQZ968RRb1HyNg42KmtDfmiALxHzkOBT/2yhALZpYCCPTHXrY2MgkWhI9B0C
         dtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737324374; x=1737929174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vuNfSILdnCJ7PQTo088HkVCj2bj2Fhg3WmJOJb5OLG8=;
        b=eBYaGPm/D4cASLrsIX7a6q28QUkYkydhtx1ZIfTfyr+PKnDpe8CBXzgV4FqpxkOwoh
         fZpaf/3bThLHVWZqfVMaqbLVKZPq/yD6iEMzchQEezuYWu1ODBiKiq2JVKZnzBikvcnv
         mXRA1cScqDXicHWYF8x9h9xbYh3HXfS9SbJq/p7p1WtwXH6r/RF4t0bsYGlzBP7/OPpx
         r2ieVmUuslYcJnx/U1TZLw1p6NOfPtokYXET6jdmodUxeWHzh7zN+RqQVWm1GRIONBa5
         zP46cA4p/FMw1WM0WwkeZG8mN6ubMOaZ+UklaabvZAWgN5zefh+LrxYqf7FfK5nC+3fO
         9pyg==
X-Forwarded-Encrypted: i=1; AJvYcCWhzpq6I2tpPoqqNMrnriGmvmFzJWX0zMS8zVKPSfXpMfdB/TqcnPOCFTDxdOiO9G4yIM3DtBY6XzF1wjw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1KEJpa1ACf+n8qh9n0uywKRshXKK2Gxl9jcCNh1aYeYqD2Cck
	Kf622/7t1JUF9Ifh5IgalitMGkyLNl9fKoJcUK4v/k0f68NSCdWMDKCOKQ==
X-Gm-Gg: ASbGncvCBlgLsNksmLr54+vdvq/ayNmx0/oMOgA6BlqmzAB+LwJSyKYIP0rVvoDbm6o
	hy9T+HsnMpqH42UjnBa7cx61XEDmyFumfDInyyWN+yjNJpIqdUKpw2FVaT5i158VHc8H9k8/6Q+
	teH8Ot47vfBFVWe0LSpzoLfiaRfkG7BcxGongvIGegYAKZ6lHlqebhe5GrigFZOcpwTo3UEg8qG
	ssOaEGEQ3AOQNubi1bfvWaAsyeRd9WdfTp4CkoXfeyuMB+cXUl4VA2SmYqdjed4c137zVvwLdRO
	kg==
X-Google-Smtp-Source: AGHT+IHO/ek0zk5vX+s7FsFb0vs89JucJ0T9XT+BJtFzwpBZJ/9rRyqBfU1yJRdZf8Gc5nWzC0nI8g==
X-Received: by 2002:a05:620a:6004:b0:7b6:7909:5208 with SMTP id af79cd13be357-7be631e571dmr1923484785a.5.1737324373781;
        Sun, 19 Jan 2025 14:06:13 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614f0096sm369243085a.112.2025.01.19.14.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:06:13 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v5 08/14] MAINTAINERS: Update ALIENWARE WMI DRIVER entry
Date: Sun, 19 Jan 2025 17:05:36 -0500
Message-ID: <20250119220542.3136-9-kuurtb@gmail.com>
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

