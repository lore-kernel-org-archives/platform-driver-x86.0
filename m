Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDBA1FA179;
	Sat, 21 Dec 2024 06:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760835; cv=none; b=Ys3qjQ4tmdyHqhzxoXvVWWoH+KsUoN03R/3Shz1Q2jS9YEqfYH/Xq95S2leB7IFfQOucw/MqNV/MQ81A7zkR4BFX8oed6mjv4ak8eeZ7vB5PZt1x+RdelmTVrfk40d6NjMM7qFwLyh3LDYuW7ocqgfAikYgLGizEKFkJua6KfRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760835; c=relaxed/simple;
	bh=bA9TBWS2aTHuSdMlpTKbWZA9iDppBuPiCTaK8L7s0T0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rT22kLP8gPANNLMnfLIkLCTZccqcSTzyCM3LE7VfGb0eLYt61WS5FPtV/d3v/nzZeadlz6Nzz6mAoDUU7f5k6pxfiDN3PKUIM6ddwtQz1wdHieo9BtTxv6LGL3Lv0Ga6rMfKQntI2glLJSR+hc6FneVYLu/5JJDzzfgiQmhmbCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWNO3CJv; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWNO3CJv"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6f0054cb797so21091317b3.0;
        Fri, 20 Dec 2024 22:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760833; x=1735365633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljg3BoRyYpx5o9XmoLjmEYfCq25szUxIdIdXguDttik=;
        b=VWNO3CJvJCs9woFtN/xvCegTct401GYT1W9Ix2ktHl1OTHVgvpfsislR37QhVgf4fV
         tCDi2PlNmdy+LDBzhNRzxfjfTpNo99ESVsLNiXnTG3DRPn8RobgF5gfdK9cD38lOXuWU
         HQqBrhq2TbdG4Sg/J6i1qsMHHysLI1Xhd++Ypeil+gf7WmsjjJyzuDticsLoSy3inaMm
         6nxDhuAZX7L5YmrfB7yaEYAKIDl1KC+jNJNxy3Sn/S/nPJHAXGdh+DErXQsnwXhuF0D/
         b7oFlj0/TizokYQpwQWxx7QQsnGSpXcBRmX3IZehl74k/iRTXiuEe92iUrNrRpSwEJAW
         iJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760833; x=1735365633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljg3BoRyYpx5o9XmoLjmEYfCq25szUxIdIdXguDttik=;
        b=YYczud31b6EcdUfPj0v0LQPys8j0uViw1TG1FLxVP11GW/DfgJzTEmLZqJIrsxy1/S
         4r87JEHzU0bH4eOGG8O1UVm02vBlldXzRpDqoRy5UUzoUiPOsUegH/d99pozDKYbN1+V
         MwNdzV3lLMhH8dqTKq7XNjKiBPLcPe/FQjQjFQSWY7ErSCRaxtZHRjl29Wjj7l88UMtY
         o7waIsnSRqJAVb9cZjJ6o0SHlNiMDsoEr7VjpckbqkKC6pZ2yiEY6HBVp5WqgKTN8DpO
         B8hsOiZWDHRVUdcE2omIXzp1qiqQ8g8YAKHKDN/3l+5J9HbM/r2VioxOD0wWYJJnXbH5
         6Q0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwEEY94e1CJPe2VMMm0flDBEDz13JESuNDICW/Ax0rYQGj9Opvo4AgH2wlkNYSX1oN8bvAJMn3+lIwaR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEMt693XlLroVtrsn7fY/H2FFRxNUrhQjDt5GT+z8RpE5Y8VoQ
	8uFVg67MQl0ESvxCyZy9+X9v68fmhri2KJsR2D1IryZGyK+JeZPPprEuGg==
X-Gm-Gg: ASbGncvg96XRNdTxjDJSJQf1INgyJdaGYJ8MWWh+HfnplvRyevLO3qH963DJF0tcnWk
	ATT6uui3lezRMdHK1sqttIghFR4f7ByRj0orpkGJ43uJPXk6gb6eZGxC0jxfmUJjRB8ao/wzg5V
	oTefZhm7aU5TfcYqNNjzgvXBIc2IqZHX0xMBwZKS6TS0UyPh1OzF5NgsqAN9VJjNYMi4Sa8AhF8
	Ni12JZuzIpKIy2t8wctzwZ3TBjOghYcJuIgvWd14jbb9DlW1bg7q6tV9mMbN/Vz
X-Google-Smtp-Source: AGHT+IFufvSROmzOLw2iVLnPUip9ePZzpqz4NB69kO8++YGylw4f7U+0KxW/KALPM5ReH7UrDSzvGg==
X-Received: by 2002:a05:690c:4988:b0:6f0:21d6:44a4 with SMTP id 00721157ae682-6f3f81229b2mr43144187b3.10.1734760833126;
        Fri, 20 Dec 2024 22:00:33 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.22.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 22:00:32 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 15/20] platform/x86: Rename alienware-wmi.c
Date: Sat, 21 Dec 2024 00:59:12 -0500
Message-ID: <20241221055917.10555-16-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221055917.10555-1-kuurtb@gmail.com>
References: <20241221055917.10555-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename alienware-wmi to support upcoming split.

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
2.47.1

