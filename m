Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAA53BB661
	for <platform-driver-x86@vger.kernel.org>; Sun, 28 Jun 2026 21:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782683999; cv=none; b=B5+v8UiWqI+y1VUslmBpN65XMhMYlepXZHzux4NLFtSla/mmPCcVIVBhpCRrzcdR9r/plD0uYzJHHn0r5Hmq9P+aRJaVXgGdulbr0xihvEF7p8lWvhDCaaPKcgLCom9C+Ksf1JJlQb7BnxkRzVUOmPqubpxPzJGhftZKoy5sqPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782683999; c=relaxed/simple;
	bh=tHZKJvQeNmuySV1n8t0uQFNVoPwKMvzl4oRMIuWLbxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ur60MXRRHrFpCzEEwC0pUiEW2qsJRePohx0UNGcJURCYgBX7+SL/UZNGi0hVnrPEsQ0a/s0KLa6oZKk5x0Kbz9ETcxiLlxwC4dknhyRYeopRCbEdMl87nGdAqK/kt1ET2BHeQqK+uhpKFJ8GERZ4c9B5QhdyAPAP6XbKSIEKkJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lj6BsWed; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lj6BsWed"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4624a44e152so2410887f8f.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 28 Jun 2026 14:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782683996; x=1783288796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=falKEQK8eFQ+PrCEeaV7dFTiwkVtee9T4eALrZV5Bk4=;
        b=lj6BsWedzWNiJEr06n7c5GHPB3bcPkOc8v4go66LEAa436oilKGtGlWr7qT/R91Ij8
         vZUhStmr6PPeixdLrIB8fJAj1Fn0ONq9yBR7kBFnVgDavZ5WrUQj+qfl+oDOT6rJB2re
         BkL07I1abtiSE7yI2CWQ0qOhC9Q4uPQIaynOtGqcG3VHF377iWJ8DHmFn5eq3xj11AYY
         VLACOOkUFu8/Q/FWcaISvDDiXkxfdX73tMTH+E644NxiLZ5JLqZLuUxoIPuQwlCeVjbf
         Rb8Hd8puYvFsC+E462rfFgLZNzmXol/9huVrVH45aB7TasV+mKxd3lPKZSCAo7Ts4oOo
         V/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782683996; x=1783288796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=falKEQK8eFQ+PrCEeaV7dFTiwkVtee9T4eALrZV5Bk4=;
        b=UqbRM0GZPKNSYJcobp0YiZZ6A3378pXqwspzKXtGTK7NO4zUbsPbnTp28VpR97WwC9
         7yd6Ck7hybtBhEfapACS3QvVrYJKyBiiNTRs1Ju4b3oXT02gk06rnP89k07lUm1FZ0am
         20z1ztLut0AFb7XMk55OsI08xRjGOyiQVDHdtfMY8pLDEecfGh3I0kPEGLbvfiahBm61
         7kfFhN2iqsBiYLtSGXgwbuZ9Woxayo4ZwC4HhdFO09gfsrUXbplAS2qjaxV6JXZQ36Nl
         i5qd5dKfJ6csjbbbVUbdT2Ilu/rAdLI6ge/oxxyZXMbG/oqrTM2/hcUGn9EQGp0sIZco
         CU9A==
X-Forwarded-Encrypted: i=1; AFNElJ/QyVJo4Jxo+TDadV3FygJbE2Ll86eyO1YNpQQrBrtGpV148RZnSlBbOZ1Bl9cmohO/PXL6A0iVvSlLkuyLaSi39Yn5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6sg/Xo1zBzHJAnR8hA6kYkckwYW34NUI2NAuxLy4LLNGalnJh
	RlMe9Ormu40W5Hi4Wa8P6nZlyUPhKmNp6ygJAKLQ7EQdpkAQpjqy/HsG8gGx5VY8BjA=
X-Gm-Gg: AfdE7cmbRESzLSoTMxJt3PQznC7b7rUJx7J48dnmqpbYhjR0q+NFiwJBIhWL7CM+2tr
	ys2ppHKoB8UwzYU94b4eRTbmZIu0sUQZmLEzRmtguIzm0qxw+4qHH5lITPmO8BdawAke9Wczhdy
	KA89DbdF/rWTmjVyt5l396w3gbv2giG46N92UtWjXpX/vYf5xABrlaXExDfrS2gpnUG2GxUuDXX
	mZ5DN2LT4QSv/IPCXQRI2OFNOS+q9ZmvQfprDATWC3HqQyPF5Npb8yl2AGkhu5c3O58onLpOd8D
	VFejlTgrktNDl4QiWTsK/81yDqjF//RPqfNrdL9qICSuGZ1DIc2KzDzJqhyr1pLBhk5yUp6Fn4X
	WijU89XaI+gMdQnhy7Tt8HmKqLSm+ltoUR6WNY6YJJ4gp9qLiwYT1wdMUpY+prRjsFfs0lQ6gh8
	5kaVnmUfzP+ew3EhJ/2A==
X-Received: by 2002:a05:600c:8b30:b0:493:92c9:1e6d with SMTP id 5b1f17b1804b1-49392c91fbdmr100987985e9.33.1782683996082;
        Sun, 28 Jun 2026 14:59:56 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926c278ab2sm151073475e9.1.2026.06.28.14.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 14:59:55 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nikita Kravets <teackot@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 06/16] platform/x86: msi-ec: Ensure dmi_system_id is defined
Date: Sun, 28 Jun 2026 23:58:41 +0200
Message-ID:  <0998f0a790036ea630bab82a8b78af79167c3e4a.1782682124.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782682124.git.ukleinek@kernel.org>
References: <cover.1782682124.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=984; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=tHZKJvQeNmuySV1n8t0uQFNVoPwKMvzl4oRMIuWLbxE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQZkba4iWoC5PJwYeMfyQ5nXw09BDa2ePrxWbT RGndDJNpAGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakGZGwAKCRCPgPtYfRL+ TtG1B/9AqSmzpxsUfisf427KdqK7ACCPdMDORnAXxUdh4pq1AOy9GRtWidZk0D/w3d/tkjZKwKu Az9t+qcF2ozZkAxebqtlp+vUgdSjnC3vxjxOgNKyfNjutthVn90XTiUQE8hYyiG5L7+BtyWRg3t dGV7TiCHRYE6Qxr33sCq8Sz0bX/HW1BC0fvdXtDIt5sDrX7W5Ge9Sy19/F2RyjyLWFdqjmdq6rN wXdQ75uVfjRJazmwrC/k9o0WxBvYZaQkcrZ/YDE1qsLMin0ZnKyCoi1dKTToJN95HjM+OLK2DI1 D8KcT2cLCIkdRDpZr4m4m3bhU0913ZQTDgIzRy2pvFjZoAvl
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Currently <linux/acpi.h> includes <linux/mod_devicetable.h> and thus
dmi_system_id is available for the driver. To disentangle includes
<linux/acpi.h> will be changed to only include the header for
acpi_device_id instead of the full <linux/mod_devicetable.h>. To prepare
for that include the dedicated header for struct dmi_device_id.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/platform/x86/msi-ec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index 0157e233e430..dfe4532ebe56 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -23,6 +23,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/device-id/dmi.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/string.h>
-- 
2.47.3

