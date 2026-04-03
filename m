Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE6532E6BD
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Apr 2026 07:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775200175; cv=none; b=YHKkHQjoIeu94rskORrfIPDfkJMIb8SymZu5bEV8HabKtBsao4itTaIB0Cv9cR67y/OYGTCmSrPS9Lxpx4+GV+Pq4ofaEpKjGkVzy7qh4QKDE9tjhJ/q/Oq8bMw1OsKeRPnsRVA+t4O4Jl4yTHx8h4sp9fBUeetTIwhyNoyPDBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775200175; c=relaxed/simple;
	bh=Morcopt2lGB0ZpVtL8FAdELel3jz9tKgQ0+/EqZDV64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pZpZ/8yMskPayafIV8TSIXKO6mF4lV6aX+Ic27Uw/HKC0HtncN4JC8gi+ZIOgNFEsZ9/tXUZSNG3/5HBgcV0mJcDUXE7YHG3RS6wYw4JFJ2dJm21CrWUFZ6sRV3ORPCVF9J9ePOEjredMzgLpShy0ojSRMzLUZBpPdfuX+Ix7R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mvt6Sv0g; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mvt6Sv0g"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6501547d7edso1714942d50.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2026 00:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775200174; x=1775804974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=czTHxpPx48e5trNDy9Haci3gHx5owBw1LqTAi7hI1ps=;
        b=Mvt6Sv0gW7pfWm3Lka5QwSTN1cs24Iax6va6WIT6Bs9hA3rKnM2GUVbHMil3/rKWBd
         9Hg1Y2IejeVJZee9dbWKeiZp/fqxl3RM9rSFZdr0C1iG6DhATMGBtO/SCcdDYLQfbej/
         1aiAF27WmvelqYIRIie1//vxXQqwAPkCHyW6XHI4cg76JupVU3RHHO+0yZxWzNZMXAZu
         CbHRMx87xdyQqa81KiP0Q7qF0uAgAJOZc9sk6LsWlzn3m39wikhVPYgyUnRnfwFLzkBh
         s5vswF3+4dYVV5fUYa4hAFopF62PAt69urxH2XC0pipzZ5/qeDELRMs2wZzGEXIxIGho
         CevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775200174; x=1775804974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czTHxpPx48e5trNDy9Haci3gHx5owBw1LqTAi7hI1ps=;
        b=AZ76pfd2XPO5fMBh+RUs/OExCo9dMIjJDzXRrWqEd6pa8GPkv6D8gOA9rvZA+0pVYG
         5g6vk503cbhja2xeUyhb5f1EfZepCQUtJlBv+/7+xfJn0F+6rHAF9kEi/kd8do+DZpvW
         32+f6/mfIN93d5IsDzrO0EnfVI7+fCdspdDyfk9v4d/mrpuyfzDNi6+xAcvaKqhDQ5g2
         wgu6bYip8t4yaai5JrHDld4qWKQ126sDT7zC/O8rHS/5Q+wXJcF5e/5mVLaaPKnFobqY
         oYFinPgW9L3JO53CK1Y4ywTpSa3/F9KDN/EWqTv24DU/YHBn2yyT4/6NwhCouNtk5crF
         RQCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgHZpCBUTfQPGaSH/lvUfL6axTAYJspkPBWhaPXqhUDVL4WlIfwULxPC8PFB/Kpq7QdlUWEdZWP4HK8B+qipNxOUwD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4mliyJsCqaOqeXqRAT4iXo0NWIHGEp5GzELZow7VT5pulkHkW
	Cw+vriIv3NtYuVuAzMfJgtfvQhV3Epk3GjIgHwYwwHmm6+Ek6fMPn7VY
X-Gm-Gg: AeBDievsrDkxPoygKBMOrjFP0Eo9JUN5mXpMnJusfAd3ALw0IQspQN3KOCo/Yd7eqEc
	x0MvbOlQm2IJ2t7D+qMis0wmtB35UE832WcL/5s7Lr/CnkbNkA8p9K0K0A0RRZIgthTQRiaElFg
	dL0/h3uT2KiuTlRmG2tniMrleY4oaWhEAlKO5SYdPZO95Jw5vJRh1RvrdhzLyz0hUJ4Yb/9ukBS
	nFjWm1p3Nd14tQy2icZh4hyM/RvgDJl7cBohR0JbKN8Ha3r2/a0vhBvb3+mo0MgzTBEdgDdUNKC
	rp+dfoNx1h88KzJo9GprNkNN0r5JioA4st93bYIkzponcvCC2AF9Uh/zWdMWdRKjUjlbkgX+HnQ
	ouNavzXTVnNwwgOs6yJ7CqLl3pG437X77ZZRc5xzGYr4OyufNaiSEjs3jerCegWHna3Xej376Zr
	oLILY0RBSV38mqmX7/ywyYT62hybBj9CuMoClHbydT0UsGEOqqlHGSnhdR2I4fl8+PP53Zr1RsR
	l8iuOIoKOfqpkDtd3UJZXNd
X-Received: by 2002:a05:690c:a052:b0:79b:f866:e208 with SMTP id 00721157ae682-7a4d90a2e29mr18612167b3.43.1775200173567;
        Fri, 03 Apr 2026 00:09:33 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a3712ecc31sm19049057b3.45.2026.04.03.00.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 00:09:33 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] platform/x86: uniwill-laptop: Fix signedness bug
Date: Fri,  3 Apr 2026 02:09:28 -0500
Message-ID: <20260403070928.802196-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function sysfs_match_string() can return negative error codes and
the variable assigned to it is the enum 'option'. Which could be an
unsigned int due to different compiler implementations.

Assign signed variable 'ret' to sysfs_match_string(), check for error,
then assign ret to option.

Detected by Smatch:
drivers/platform/x86/uniwill/uniwill-acpi.c:919 usb_c_power_priority_store()
warn: unsigned 'option' is never less than zero.

Fixes: 03ae0a0d0973b ("platform/x86: uniwill-laptop: Implement USB-C power priority setting")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index faade4cf08be..945df5092637 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -915,10 +915,11 @@ static ssize_t usb_c_power_priority_store(struct device *dev,
 	unsigned int value;
 	int ret;
 
-	option = sysfs_match_string(usb_c_power_priority_text, buf);
-	if (option < 0)
-		return option;
+	ret = sysfs_match_string(usb_c_power_priority_text, buf);
+	if (ret < 0)
+		return ret;
 
+	option = ret;
 	value = usb_c_power_priority_value[option];
 
 	guard(mutex)(&data->usb_c_power_priority_lock);
-- 
2.53.0

