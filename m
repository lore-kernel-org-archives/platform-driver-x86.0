Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ED4241686
	for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788088521; cv=none; b=STI8SHBFi16MXyyOd0j9KnR9SInuPt1TkaMMfXfWDIpwN/GCNfm2Wzyqo7TyDPYlFmwmuymf/33u4wAaIREbV9WUb27FRlBKbNbi+b2eRzUhvT8XBlK7bl7UG8xe2J+v449lgdtLHsW12wC+uN68FQiho8h41iGE3mXit8Y/Fw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788088521; c=relaxed/simple;
	bh=L+kBfOFoAZ0Oqva+U3xNU7w4Xq/HFuIKHhhVREciYCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PqT1QXb1pZsHqRoRt5OlgAnN6wp2Qp1w7Qgo6CfDgRHotAKyddk0/ZyPEdyY9XrfQ8l1VmSDuFuCyypkLonIaTlu0Yzc17/ZSrNm2oUCrtCxZWKllx385NdKz5/ybDhmAzdBRscsM0qTcKtkIOzXjWaoc8fcvEzdYLnYiuk9iM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sg78OhFy; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sg78OhFy"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d560775ca2so17060635ad.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 04:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788088517; x=1788693317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zeoPQYEaTrf5uEGgRnLGKCII+rVjxqLzd1wRSr/Slf8=;
        b=sg78OhFyi52k9f7u6DWvLabLZe5vNnzVPsUOX0zpSFHpxjpFSsmryA9ufGDY3qjso9
         rSmzCuk7eReQ3pv/EZ9k45wtS4hg7k2+RSqwfh0SRA++DbkLIB3ZVqEtFdaJpajBex7n
         8ULdLUjngbsQt9renHzYIZyg4dGfjxhNDQC59shP4FGczYM1gfSPq5IFN+UItN4rHoVu
         gVPpUXs/S1Iblkc3FQvMQHOoaVusxOlrW2Lahy5qXpsE31H/RpG+hREMu3js3eOL+KNM
         K4p87K5/OUaI2geSkQsEFFjWrINpCqa5B1ipqMeZ3fNzdIRUXMCWMJk9Su2UkjySSaP2
         GVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788088517; x=1788693317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zeoPQYEaTrf5uEGgRnLGKCII+rVjxqLzd1wRSr/Slf8=;
        b=DDYDAM7VMkgXZritQhXonoJa5KMWSqnJVy62rV4XT9naz2pAaUV5NydxlL/6sgFncP
         Y0VirvTyRXbKAksnbC/FNhpSHPXvm8uBk2hrtZWu5+iYnMCRNyKjSZcwOSV5D3Ya3iqG
         FvFRa/EOPHucaj7Se8evSOtWCci/4VqwWPN1ijwS8TLRvMhFi/7AoQV8P9FzBiF5kiTM
         kSu67vXwTDoRpgCJDuB+eNFj9iHBQ/qBhbMdtg41Bzx5q85iQSSFjGpJY3HroXNimQ/f
         RNr+W7KIq9okiBdqdU9bqTEbnYz9lnUUaeAqjxBwGIUUevOXrlLsVV4RvoiNsYB+vwhX
         Ed6g==
X-Gm-Message-State: AFuF++kRovSv+7NLfVpipEfnBqrO2hUf40wFGGGwdFRwhU7yF/eSZzRk
	dywcjseqFhfae/A54nSZ/a4fB9xJWFngiw9tRJsnuMLt8M8vdorhBHAwYowil6EK/W0=
X-Gm-Gg: AYBFou1gJVMmZfbylxqrbF6PNAfyB5zXl6SOxuqcSuILZanvQDCRg3yL3I0kP7Q8rSE
	PpddorlxhZw5/+zuy0BpUdgNWWVNWtO4U2UHvsuucA/Li5wucXiRujDjJGu5O58h7WNsqLX7WJw
	kgwyLk/5UnP00VAXRs6oZxmab/a4eJ1fwYMNEc7mZIpi6pX+El1OZYUEIZabW3aCTa/cS+txVig
	RNjSCSIYd1zxwQKz6uc3mrWwdgTxDvFTBA43R3ilCawdqsQxh1N/wBwFfOl09cYR+RarCSw0RJ/
	+Ow7jqLuYm1xyBEQQVubZmZY6t9S3r/1GOJoDyxND4FtAx7qeHE9JTbBbGJFZ39C6NDM15kjoIj
	0tIOR2pgZJGiYNbMkZGWQoYHQr5Tu7zLbKZCJkkxUHwoZYvHfhWoksCMP8AK+UXmisWDYZd+jxv
	WcbWU/n0SNWvAaWhzOM0JZsyw0XjAOA94ZfLRy3e99IMhEB1vHkDtc6BVYma+p1D1T4POLrDll2
	oJRE5udq8p8fdfrbyrnkoMKY1Er75MwpL9vqEE5F97fUSbbH89rXkT/VjRqer8=
X-Received: by 2002:a17:902:ec82:b0:2d6:3c2f:6a4 with SMTP id d9443c01a7336-2d74df293c5mr249489195ad.13.1788088516722;
        Sun, 30 Aug 2026 04:15:16 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm18782313eec.20.2026.08.30.04.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 04:15:15 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2026 04:15:06 -0700
Subject: [PATCH 2/6] platform/x86: x86-android-tablets: hold device
 reference for secondary fwnode teardown
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-x86-android-lenovo-swnode-v1-2-066a91acb4ba@gmail.com>
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
In-Reply-To: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

In gpio_secondary_fwnode_init(), acpi_bus_find_device_by_name() returns a
device reference, but the local dev variable is declared with
__free(put_device), dropping the reference at the end of each iteration.
Meanwhile, devm_add_action_or_reset() saves the dev pointer for
gpio_secondary_unset() without incrementing its reference count, which
could lead to a use-after-free during driver teardown if the device is
released in the interim.

Acquire an explicit device reference with get_device() when registering
the devres action, and drop it with put_device() inside
gpio_secondary_unset().

Fixes: 1448c2d2ca5c ("platform/x86: x86-android-tablets: enable fwnode matching of GPIO chips")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/x86-android-tablets/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 5db794d65eb5..722c0ae4ecd1 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -367,6 +367,7 @@ static void gpio_secondary_unset(void *data)
 	struct device *dev = data;
 
 	set_secondary_fwnode(dev, NULL);
+	put_device(dev);
 }
 
 static void gpio_secondary_unregister_node_group(void *data)
@@ -409,7 +410,7 @@ static int gpio_secondary_fwnode_init(struct device *parent)
 
 		set_secondary_fwnode(dev, fwnode);
 
-		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, dev);
+		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, get_device(dev));
 		if (ret)
 			return ret;
 	}

-- 
2.55.0.897.gb25b4bd76c-goog

