Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7272737F8D9
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 21:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776028286; cv=none; b=GIcrPsM6Ydu1RqNFEKowXzDtMv18tfnCctl0meeuUJrmL3vhs2Gt9oD1MaT7UxPhf9XUY3F4H/++WNijbPkJKepjiColHWE1gQxGBDg8sWbcD9LcRc/bQzI/ThXj7obDQcwagsF3LhCM+CvZa3JKuKQvLkUVkkyhS09Y7uOIjT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776028286; c=relaxed/simple;
	bh=as/Y6rgrCLbxvFJK4woRt4WCiXpZGU5Bmcl75dpz1Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BW+WL9rMF5AgRwFWje2nBJ990HC1hZVRqGW3npGwJhVisQcYhdgIdvEkmLcNvTcPkT65BW/8kqzs1m9CIsYhOr7RTVyH5p5WNZBY9PXznsoAnIXVfbvUTNS+d9RiXSF02RGD5o21g5rqCLzpo8CH6ab978wbjAp7HyJd8OhbtwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZhMmfqY; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZhMmfqY"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1271257ae53so11097340c88.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 14:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776028285; x=1776633085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Epvlpqxnk7CA+C9ymJCfGqy8SHrtqDJZ4fsM6TY9RM=;
        b=UZhMmfqY8i6TiedDCEqOwCLh2DM0mNU9tH/OS4oxpi25wxqkZZOQO8OmOsw841YD7/
         N6eQOJIabg8o3PiEQGiUyQaokyoPWZLJ6GYBjDI9XcmUMNgJIK/e35RibHnjpqkbFTUm
         lqxQTLBIcJrhvdAv78FQfewRZ7kMtUs43jh2tnoG948HtEM7T7RCFNUlc1/oU0lm2vgo
         TKCVM5P0owwxe9XpUR1pw81veIZk6I2IwUqY0LGR/c845Mrh3YDQjTAiXU4MUruIjBQ5
         UBVRu8yIEq17KjsFreW9KFpyVwStkudfzUK6+Plz5jzGaPfxOTEEmM1opmjmdJa3bsp5
         dKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776028285; x=1776633085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Epvlpqxnk7CA+C9ymJCfGqy8SHrtqDJZ4fsM6TY9RM=;
        b=FGy2PoDkcWo5wQFOylXsYVYPQ43S7XmppJsb0zfiXU6Dy8AGCzcKV6sQPGah4mdaiH
         EiPH1ECAGxHiVUE5cVDc0FOIasuIQ00CrG37XqEs9A8QYLpbZ16t7luc7wzZhu2AKvdQ
         3Yjb0NdzdCy2AOH6qx7hGxnoM8sMc1704vwFwRxayD1qIkuU8C4j4IRQ+I4GIe/MTE+J
         c0Si5EOi2Un0TMTTicVY7KASAWYiGYnlFwCISZBJlD63JBb9gsOuA3tYuWU/w6DIg59E
         9j5oN+v9d+wHDlI/sQ4ZXwYbhVxy1m3rMFHEMFSOnkgFkF7Q7dAfJnCkknH73Zq1HEg9
         LzAg==
X-Forwarded-Encrypted: i=1; AJvYcCXnAZeKTMcp+t9EcgHQzq72iASuAxweQ8G2agDsPjCNf93viMWo0ca/wV0Nm8z8Fojks6rQD67atAhsBr+QHuJxOZ5/@vger.kernel.org
X-Gm-Message-State: AOJu0YyblVoGiQpgoxuUA46mViTju1hNGGifNtvh4OZaGtEwkBCQ5jSO
	QOC/tvO9dOmqPyMSastbCYf4qbrL02JkDqyefyR9qAVnoI3ayQ2JydY1e0JueA==
X-Gm-Gg: AeBDieuSE0gjbiVuSFQrSEMsFva5yuv2PpZ81wdweTN3RPMfYfHs9iaUTYdeROeBr3n
	n6y21YQzM0GITsPTQru+QHZSfs0XQD2tvcAGNENGm2uW0/u7/FRiV4qYHtFW0hwX+3VGTo0UU6A
	ISwmqhYhSzFUoTMWi4zSFBlGnKv6jZGDUL7DWxEtpQl04bBPeadhQS4bwbgEe0sePHavbztM9yt
	uKHg9YiAjehO0poazRtXfL1+5b8eap7aUOsovPeBRRSTcRDIVjo8YCRuN0R/PeBv5ruOfKvGiSV
	oRLcstMur2plFBoODMeXN2Ne6wK7QtH3YJEh0zjE3AyVzccR6KFKf/l4zom49gxIMvNfVGx0irL
	btRtP/iHZZtPgNWB38ToBQaklbUa2dwOOKRxgOES7KiWQQeA/zLlX1rV0ETsNZX0XwOHbrR0EHK
	Xiun+XUMnbw6F1O1f6jjxs6vy7TGF07T+tFJK/feO/v5Wd6PzB3WiDLyIWTCTMX06G2rn/CUZWq
	FIy
X-Received: by 2002:a05:7022:ec07:b0:119:e55a:9c04 with SMTP id a92af1059eb24-12c34ef9715mr6188284c88.32.1776028284605;
        Sun, 12 Apr 2026 14:11:24 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb141sm11520856c88.12.2026.04.12.14.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:11:24 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v10 01/16] platform/x86: lenovo-wmi-helpers: Fix memory leak in lwmi_dev_evaluate_int()
Date: Sun, 12 Apr 2026 14:11:06 -0700
Message-ID: <20260412211121.2220556-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
References: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rong Zhang <i@rong.moe>

lwmi_dev_evaluate_int() leaks output.pointer when retval == NULL (found
by sashiko.dev [1]).

Fix it by moving `ret_obj = output.pointer' outside of the `if (retval)'
block so that it is always freed by the __free cleanup callback.

No functional change intended.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Fixes: e521d16e76cd ("platform/x86: Add lenovo-wmi-helpers")
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%40gmail.com [1]
Signed-off-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
index 7379defac500..018d7642e2bd 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.c
+++ b/drivers/platform/x86/lenovo/wmi-helpers.c
@@ -46,7 +46,6 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 			  unsigned char *buf, size_t size, u32 *retval)
 {
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *ret_obj __free(kfree) = NULL;
 	struct acpi_buffer input = { size, buf };
 	acpi_status status;
 
@@ -55,8 +54,9 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 	if (ACPI_FAILURE(status))
 		return -EIO;
 
+	union acpi_object *ret_obj __free(kfree) = output.pointer;
+
 	if (retval) {
-		ret_obj = output.pointer;
 		if (!ret_obj)
 			return -ENODATA;
 
-- 
2.53.0

