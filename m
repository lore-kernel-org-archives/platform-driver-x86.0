Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432381FCD0B;
	Sat, 21 Dec 2024 06:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760852; cv=none; b=PtS1CqbSdUJ079Iz17s8iHYcW7vVUTYH5sNCJ7f8/4vwiyRfXiZi8wpPdD/jocX8zJN0+Rw1mZqf6Xti8rbaj2dOQrNps7qU9sgsYAYyYbQMAOz5iXA4mlfS+XIzB2XkXGWvoOFMXPP4ZhgCwU30RLkezSJaKWItZF3mC+uEzKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760852; c=relaxed/simple;
	bh=d9pkZie7/X4Kq8x/mBdPdCbimEn3JP8xoDkk/9g+UcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOdnn99TuGyaxBfE1U85Mo7+14WRgHf6Z3xSY63cStyXD6WwG3AAQc6WWZkMBUgWI7vASjpDKfjh/Hccu6kuLN31d2VHCzMB68Um6pxPIOs4WD9xPEbBCnXEmd6R9kOTfjru3zLbwXFMjy6/jEXkOwLPppMtyR0xOhXZrsmrH7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIdhuGIf; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIdhuGIf"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6efeb120f4dso20840887b3.0;
        Fri, 20 Dec 2024 22:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760850; x=1735365650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOe3tFzr486FUFWzDp/MXqTTC9KDER087+s+B7B0lGU=;
        b=bIdhuGIfrfcqgkpIiox336uaHjAjxOieGRv1pmVn0RUuWoeOfM0tQetZm/4PW8sq16
         lCXnqwWKXwO5kP7/2BmwJBBZr0+NUgEPsO/uIMqOYXTQCcsrINuHGEG4mly/ukIIcD+l
         MTZ+J/UbHb2iUYURTwrWqaTRIZeW5PktwZlpWJKA7nq+/LXc/9cc08BEHBPOlPhDavz1
         BYyL5n+6bEA2JJie4MYLGkMoqDeWjt7LI0j+tNSW4jMprCq/fsbMuKxTqwbvTFjiTcC/
         GReXGiNsjWMguiVXXYpHkhuvHC9Kh6l8G5c3Q/Mp5O+CeqkPFsuP3Dj3L0TPR+s+vzbX
         3REg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760850; x=1735365650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOe3tFzr486FUFWzDp/MXqTTC9KDER087+s+B7B0lGU=;
        b=rVtX6xMceaLdEgFDKi3KQyhhVPYquvzGlLclWFZexmJ4Fo1LC64TjVYeU2CU2lG0Qs
         wqblpyvyDY7n/EW7GTmwd+1E1YHrwV6ThGxivB1oJiB0FSZLRE1FUjzhodonluwxkBXd
         lst3qHWuAVyamDZBC924Wh+JIIRIfHaWAmmPAI00GbueR+fjdeFNZ//o25ePE0nk9Ezv
         XnuwgE66PXTG3VfTc6elmeFKWNWQAhUJhg5+QYvJNTgwMQfU9VqnHJ+hw0YPiIOs0mVs
         AI0ApH/B8WSu2tuRchFg7CoqHLpv7xWtVkhye7rkwpvbjEu/TI0Rx6fin80Jq9MHMJFE
         NLNw==
X-Forwarded-Encrypted: i=1; AJvYcCXLGKlxpPEMR1akCFMciVCSi9bn4eVpGytK/T2xIAp+Zluv0it1/R7/rw7OMdBAK9lNZAI/t19H3Pa2N8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM0L7UAgsJIJU7xBoC26Ai3ms9EX+foCe5Gt5yWyfIcT/KVt2D
	s3Y8iHLn96WuILwTIyP1/7JPxI0Tux1NtvZhZEl4LyiiIql/+myjB0jQEA==
X-Gm-Gg: ASbGncvn+w3hiIIYjwXjDOb2tPdGVW2UO9KqKgiBcALzltmZKS0sQy/noIjux4q8FMJ
	FUK6FkuD/gGYTJ0mNIqeEtxCmJVnhSINP/3yVKelIJm5u6GkrDlpQ1SRiNvgZ8RoBDUm7vzMA1f
	zgdjB0SmNOwGPUV/jxYJBZpxncC8/80O2qcUjSWa1cZVAM4CedbNxlqWUdB2Lh3STQ8TMICEQcN
	eQdmWrEVjjraZWw3L4EOlJUGVQ6vxekxeXDWzN8Ukkvu7A8hLAVeGre17auPXcS
X-Google-Smtp-Source: AGHT+IGr9lRx/TV6KfrBZ7yjuXnyCThETkHmsTUuBlIwJEPyDo7vDXP4rWwmVFkljeLbgx6JPCOsoQ==
X-Received: by 2002:a05:690c:6213:b0:6b1:61e0:5359 with SMTP id 00721157ae682-6f3f8136aa5mr43068657b3.21.1734760849831;
        Fri, 20 Dec 2024 22:00:49 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.22.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 22:00:49 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 20/20] alienware-wmi: Update header and module information
Date: Sat, 21 Dec 2024 00:59:17 -0500
Message-ID: <20241221055917.10555-21-kuurtb@gmail.com>
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

Update module description and add myself as a module author.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index 450ba0a48004..e8ccf9b277fa 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Alienware AlienFX control
+ * Alienware special feature control
  *
  * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
+ * Copyright (C) 2024 Kurt Borja <kuurtb@gmail.com>
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -15,6 +16,7 @@
 #include "alienware-wmi.h"
 
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
+MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
 MODULE_DESCRIPTION("Alienware special feature control");
 MODULE_LICENSE("GPL");
 
-- 
2.47.1

