Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EB7EEA8
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 22:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795385; cv=none; b=aKy4ZAclt1dMETSo0bW1tAxefkeJE6daOe9RAiAsjm2yPGbIe02L06uWPOgssl9T8TwgagARF4PJJjThsicggcRDkVloOV7CSvyoR9ZEI2pqyrQZjk4tPo1NaYh+zHMALH+A8pI0kRQITMPynt7Gjs2Pv4FokmazwJ8kqvRjP9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795385; c=relaxed/simple;
	bh=EIMWWlWDcq0uEYhrtukreWiGwiCZqVgmmuCgjtQWFjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUARhsaNDnKEdcDR5BFm5iJSuN7aPa4zv1BMIkQ48vpK/5qdoGG+xlSpAlN6hpWKEvLWoagpZqImqUsGjTB+E1ijIOSqWCzVXWWRnc0LlHQ2jJaq8JpkA5XtajLw8wS0E0utv0yf+7aEsFkXa0XkscGWbdVhUt7sxaKEOR6DOYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmXc8oU8; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmXc8oU8"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-382ef647e20so4129057a91.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 15:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795383; x=1786400183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyQb3HEnxnGJdzSi8B8jk9beGpq3QOPyQ1mK+KBtq5A=;
        b=fmXc8oU8QMWRSg83kAatQ3GNpWjjSeFXdDFz/EfLaJR8lKtFDy8k0BgzDeSjG2vWVz
         ki12rrVoKtLy/xhEYzjUwiPnpnQx8EJvEVlnO38s8VFitlvTkKJgwNGwbzLtMkrnWoOo
         fIqW34odSPmPAuE/k8SK5pPMnz4tKg8p1y788wYxfXejjxlxWjSdRzmNsDiU5Y/u1MSP
         jAWjAy/LXbw4LMyus0OIqSPZ0VjjNN5H8HUBdbMKs6sgWpB5993X9HaBdcjRudC4qCPN
         x1NAQAg5lJtFxI7qRIhyGFE0IWdPCENlqmcGjGMbKmUe/3alR/KpxVA/q1nWrNoaVCKJ
         TNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795383; x=1786400183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyQb3HEnxnGJdzSi8B8jk9beGpq3QOPyQ1mK+KBtq5A=;
        b=OwBaUJYJp1ETfNRyB7A5fMFf0vWr8Bj0skZN4ecyt8oD+3U7VfHotjy4YFtO9bGfot
         woUKZ+JkFhG97YBz30DjJcKcoDVHLYjAG6g8LvDQGYLW2J3nJ5EfzOYj0duharxF6QLz
         f1j5sZLrA3KCBSmZUQ96rLZGg++Yho758pC6XcGGX6f34Fms9VsiSpDAUtvwrl8Q8c7L
         ZYsHhEZYVOBn77IRiPgssw0J+wQoEC1ixRtQGlxEOX1LtjjFqMt/grgNabLZJILi4EE0
         4cCbDSMiY+Lhiim3fxKINwV3PbrK1yuHX5PhjTWCik3A02e47qZdNmFYLWjz1lRmIHnq
         BolA==
X-Forwarded-Encrypted: i=1; AHgh+RpfGw9SzTATJ13XjQISxnae6n6RbpAhTaJVWcunGDWkrwU0iB5Rh2uJZSqYDorinoxL1qzmhoVGUunJNpppQ/1gjIK4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7jfbemykwPGXOsS/6h7+wcvSWEzs1F7rMJ4LB+azMGQmZZPAa
	QBz7hcAUODoZcQ6PWAKXGk33CCDU6dpMzxdkYEYyziwU1uOdHN9jKIz6
X-Gm-Gg: AR+sD12pE1pwJQRVngQ55SfxP0KYerG5nSdHZjMrPGQrHfDUktluB4ulXmV1r0+cNqe
	S18+44QMzxP8mldNUJFcWnZzb9TiCbiGmaZxPudDP8SsnrCGqOuzMZf+sU+bB4wlIRJHjzk0YRq
	MJ6j2KXWBIrJ30tRGFC+mBCV5wNA6MrEzJpPuNCrWdTEgxUqYEc4yAVWa01eyHTvAUkVwpHmcJI
	9E2pcFUezdljRInT+p/bkWw7psMxuCBQrxWLwpL8iYuk4yQITlN+AD5t1Y7i0YSmUKspYwedcFT
	7gV1rpzZMMJk0Etp4mV0UE640+A88pghpiQ2/7vkL1a09igvv0pIi0tieknzURaXuPb4z3AvgSj
	B0Q36YBU176l4zZ+zg1wpgjOdubcl1qOinDnkhqhqvjWQGbsjPKx0P7U/CaCVKoDXBvtmZg1twn
	GbKKU+RlpL/u/d8HvMrpChiv6uanCRVA4anUcwKYO0Ho0oYo4hbAjCu0SawDWly32tVkHK0v9Vm
	334TSHPAxxdj+ffzmso6RKcDFQV8RBdASEiXEk7Dw==
X-Received: by 2002:a17:90b:5824:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38fbc43a847mr11586487a91.14.1785795382878;
        Mon, 03 Aug 2026 15:16:22 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm38685666c88.1.2026.08.03.15.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:16:22 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: lkml@antheas.dev
Cc: W_Armin@gmx.de,
	corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	kuurtb@gmail.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH 3/6] platform/x86: msi-wmi-platform: terminate msi_quirks DMI table
Date: Mon,  3 Aug 2026 15:16:11 -0700
Message-ID: <20260803221614.59324-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803221614.59324-1-derekjohn.clark@gmail.com>
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthew Schwartz <matthew.schwartz@linux.dev>

The msi_quirks table lacks a terminating empty entry so it crashes the
kernel on non-quirked MSI Claw devices.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 drivers/platform/x86/msi-wmi-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index 2439b4f0001b..fdc2f6f4ca7e 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -268,6 +268,7 @@ static const struct dmi_system_id msi_quirks[] = {
 		},
 		.driver_data = &quirk_gen2,
 	},
+	{ }
 };
 
 static int msi_wmi_platform_parse_buffer(union acpi_object *obj, u8 *output, size_t length)
-- 
2.55.0

