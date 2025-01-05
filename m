Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D531D619D;
	Sun,  5 Jan 2025 15:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091118; cv=none; b=fTEc9e8ZdsmOIUc3pdQ2u2Rpys537xDB97AojG7dbADRbVvBYX8FzZhMLM8FamX3O3sSyklgARJ77d7qriYNz2ad33nujC5lIWFeY2e1paqdcp6Va1QMGPnOb77stxu3vXt70DAmwh6O2O4SaagaEUGmrn7qQFpdlK2rndu1GAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091118; c=relaxed/simple;
	bh=fPQbAuBQIcWYIyaeAJThPBrTbUj1bF4pa4LF9jX/wIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tMRoha7RhnJ6/fth0ejyBWZkHtn0vezDPP8nFoP3siJ6uhIQWo0f+7r+foVFNlSV+ZYwvytMMKeUzj28fHcwOr1GBTmWkLhqx91Wea7tucf5gygIEn8f0kd1dndG/kmSw+JmTjFR6GlnintNnTsnfnSKvaErkNHbup6J6TYZE7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0tkLhHn; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0tkLhHn"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4b10dd44c8bso3791578137.3;
        Sun, 05 Jan 2025 07:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091113; x=1736695913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxLvlvRHaFURIFeRia2uFNbyXNyI0WQCaBZ2ZzqsIrc=;
        b=N0tkLhHnTNC1XM923x0avG8vXilctGBaSn1pO65/OZnluqYlfXh/KAe0UDiTNotbZo
         1zKEhwUVjTKAGgb1DvvOvUdfNbcIBrM4Lca0nZCbsrRX1kOi057XTjRk3FYbau76XjpI
         jZ9JUfnwOAMMxIqeX2lGdgt7vQDwrQpA53Ndz/8jk4Bw0xI7XSBQu/+IkZAz5ZDXPqNn
         WscLeg+maV40Gw7dfsjxLnKuz/6rvtFT75xsE44axW+5acH17MWa3nxRfWtvp9EW/tQP
         NTJVm6JszLkYCyk9EkA0aMZ3qk0n+g6NxVbU6lMdZEVTGUwoHHAgbZ6Xt55G28/JjiNi
         035Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091113; x=1736695913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxLvlvRHaFURIFeRia2uFNbyXNyI0WQCaBZ2ZzqsIrc=;
        b=ErCGMYTafLkNLiUK0ZlOYcmr3V7A7il0OpocO7fzsYXuTzf8g/fgU8dTJpqggvWp7a
         eEzPeQHLMp/1H/SKe7SLNiIrxxJDiPz9tvyLnc6jpORFkedAOgssskQ1RcbVjr2pRR9a
         R9sBHxVEd4nLaEFvk42LjSa86VXlKfXCV7M2/Rrd97drN1wZtpvfucRHs1zWcnAUStrS
         URWzAxBr8tEqJHuOyZlRDlzF5aBci1x3TezRACYQ961374DpXseUvvHXB2R3Rl7+J5pJ
         hWb40Ay9iLjLwxbzCM21oxGtVop+LutjDKHS9jLt7D0JBlR5k/FqOTTAWuNrlKgwnvcr
         clNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPiO6Obumlm8x6MQm+6Fs6b6mLk7eNetpfLVOXK5wzWtzR6QPEO42gJvdwbWa5NStCmVs9X/m+8ngJYKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSv4lB0JeRNkAiPVmAR9uNxK7S+xoBelETYUxp7QCAEFI9/kPk
	is69Eml9Htj+SQn1xVcUccIsQKksMZa5dlwOg3rQrcAHY3J6iKy1I1+ruw==
X-Gm-Gg: ASbGncu/kJk3nEsSdZyFz0BCIYWqlVuCmrxxslwVKBLkondq0tjScgqybcVNdiARmCa
	nMZBI8YEtys93MB3Oz/iE5misjxm/94XzHkPWdCL1PXb0nQd3eILqsPeBW+7EfUNXHcHPFPFgrP
	xG8mTWjQ9+NWAO6TrZyVEE5Guuv4If7fQFfzZGjgnHlbnQcR+6HV2rrEDXwh7/Bm+gJ+E17U/0T
	Y9h6J4rONRHuZzKmWi8sgBtvyRfSr/g4FhOrjxjKwPBRSdfhaYu9a/fVWYhPOD8
X-Google-Smtp-Source: AGHT+IGmaC5hgQabrDFppPAAipfc7m2gULCelFXr6KJuk/J/vWbB8qfNhA36w/yyf5KHjkYdO/EcZw==
X-Received: by 2002:a05:6102:15a4:b0:4b1:1a3b:a62a with SMTP id ada2fe7eead31-4b2cc499d76mr48605260137.26.1736091112746;
        Sun, 05 Jan 2025 07:31:52 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:52 -0800 (PST)
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
Subject: [PATCH v3 20/20] platform/x86: alienware-wmi: Update header and module information
Date: Sun,  5 Jan 2025 10:30:20 -0500
Message-ID: <20250105153019.19206-22-kuurtb@gmail.com>
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

Update module header and description. Additionally add myself as a module
author.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index 78101952094c..c98c65341233 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Alienware AlienFX control
+ * Alienware special feature control
  *
  * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
+ * Copyright (C) 2025 Kurt Borja <kuurtb@gmail.com>
  */
 
 #include <linux/acpi.h>
@@ -13,6 +14,7 @@
 #include "alienware-wmi.h"
 
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
+MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
 MODULE_DESCRIPTION("Alienware special feature control");
 MODULE_LICENSE("GPL");
 
-- 
2.47.1

