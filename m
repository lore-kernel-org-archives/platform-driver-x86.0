Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7807B214813
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2025 18:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746643688; cv=none; b=lsxK2FawxHaykMSLtVhBtZiWMpWiFjDRN/e/r21kR1hxs0ujTNJSAqajq/OoLuiLkXkLrle3mYvgYOaKU9IiUGIBjLKHrM6aRXrQw/bRK7JZCNcGduvXzbRulPgoP3FI4B0qYqm17RIUbDbDWspNlLK0AQBKUIihIVxMFpQnLKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746643688; c=relaxed/simple;
	bh=ziL3TT8YRJtXG7ZSy1fXNsoKKeKDWyKnDw8LMEVK1mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V4lGhVj0zP1AlL35R2gdB8f+q8V3FNI1WIAyzsCWK19pkVBWFjbXjR4NXswcqd/KiKlvQ83h7DjT9tuuMIpqvAR6PpHGmOgUHz5WyMS+N68wDzFMAdcL2dXox2X3MNyS1qThz7XB+q/f7dFtiq7OXRTrK85pUx3FFl4qyrKArYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OJj0G3jr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OJj0G3jr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746643685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PvHRwpd0pbaGahvXVBlWGYIGRmCzKFQommZdKuMmiJI=;
	b=OJj0G3jr1d64TAt7YrrK9cBUj346ZKpT5Tgjp4yZq66bfQAFEY0GCvFscDGFZ3Q+r6EVwb
	SYXqzIX+vJQxLwmPMVjlI5MIzWL4tck5ewfxwxIJgWcv7Fh8fYzQBKKJCPcpexYmM1iTZu
	jrZI/KGDJiij/mX+3ixxRQ9TTL2Y9RY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-217-Jt1zQ_cmN16szkLLB0AImw-1; Wed,
 07 May 2025 14:48:04 -0400
X-MC-Unique: Jt1zQ_cmN16szkLLB0AImw-1
X-Mimecast-MFC-AGG-ID: Jt1zQ_cmN16szkLLB0AImw_1746643683
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 029D8180034A;
	Wed,  7 May 2025 18:48:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.33.122])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5A02730001A1;
	Wed,  7 May 2025 18:48:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 4/6] platform/x86: int3472: Remove unused sensor_config struct member
Date: Wed,  7 May 2025 20:47:35 +0200
Message-ID: <20250507184737.154747-5-hdegoede@redhat.com>
In-Reply-To: <20250507184737.154747-1-hdegoede@redhat.com>
References: <20250507184737.154747-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

sensor_config is not used anywhere and its struct int3472_sensor_config
type also is not declared anywhere, drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/linux/platform_data/x86/int3472.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index 89410f0cb73a..78276a11c48d 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -110,8 +110,6 @@ struct int3472_discrete_device {
 	struct acpi_device *sensor;
 	const char *sensor_name;
 
-	const struct int3472_sensor_config *sensor_config;
-
 	struct int3472_gpio_regulator regulators[INT3472_MAX_REGULATORS];
 
 	struct int3472_clock {
-- 
2.49.0

