Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975961;
	b=uYYWE6bq+2Ax3FUBo1rvzHU7e1KJIculUXW+Q3SPT9z1O3Of1GyTrw2w3jUBvQZiLU94
	 5mYr+ucUvrQ7zxVEaEA1T8wZeOf6Up9JHEWygAIGXNjRRSyKkb0Fa/oNfJpjsvLY+3k1X
	 4nldvzxgGegEGr5BR8BjD9aqUVtr2VbpRKHUsg5w9R6zS9teT8OAvg6l43Znkq1V3zViH
	 eqeISqJQ0GOPoL3yPmksjNKjkVf9BLdgpnslQSS4ul/4oGMmKdCCNMBhlJWZxJv/VyocS
	 mB9IrH/2Wd0UHaMpGcexMWAWfeIooty4yBMyKsDKOEFtintna7pdP1MUnUlD1XnsoWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ycbw+gIlqOFcykaMj27REaMHvBl7YEcjWk28/JNllPU=;
	b=L5XcaDB9USirn482RCmTbw4LXr7HTKl4V0TcXvFwKQm6wTYpdmLRazYEl9Nt51V6HJZF
	 7LVfc5QmR0sC5V7DUtUg1lVl5eaPty1HcBcZ0eRIEEfa8rc7cp9+f3uHa7hJRQJFIg1U7
	 AIFcBZdJjenPvgAGNNGKrTsJ4LnWDe1pAyR/8uS02J1iHdgpLXOKdcgcMQeXLGvFUaXQ8
	 dxmtnV7LGo8goG9t8MpIQWC/ZkH+FiHbU7DD4hyUktWbxE0Qh1lepJKAbp+XmuboWcSi0
	 0stIDMXJJYL1VrBhYk0jDw+8oWDBy0lV+b1PGLSXqOTaQGpOlTr+dkY/iWDH9BCXcwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wureI1jN;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A8C606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A8C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wureI1jN
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2efd993e9d6so2235745ad.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975961; x=1795580761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ycbw+gIlqOFcykaMj27REaMHvBl7YEcjWk28/JNllPU=;
        b=wureI1jNmTMGL2phb5nk7Nn5yS3zRU6/yzsaDuSRHdoeq018d0Z1UaSo1EpX1Sb4MO
         W/UCPms/wqZNotpeJx7u40GAcL3svlVJDdj8FFwrFc8pF2L1FbKTzUekI9aqrx4EaVU1
         iAXHaWV0IvL0xAhvCG/6164q1cESULfDhpTelh+VPLA9S23tW5BtG04pfCH78zA2NGCs
         jJhpy04/aEsOy2HHp3SqSnbqVkTs5UOQ/FRdXc8WgjmWsnor9ZW3X1CMeWzsGoLOWIo1
         wVo7Iwv+nHeUgCy0kyVKu/Q3e2MU72Aspl/IlCkpGlRnAzeCfViPn10OgqJe0QWD3qgn
         mXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975961; x=1795580761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ycbw+gIlqOFcykaMj27REaMHvBl7YEcjWk28/JNllPU=;
        b=Ff9K+v6IXhs4Spg8NxHCorb6tWoehkduMhblEqOvF+27k7vGG92m/xgGxcDsU+jwUT
         AcLib627ZKyMjBOUzgyENzRLqL0O3k25oGXKabK+ODeoArpPhNhk4p8ch0mokkyWsqhM
         QQgZCRAJt5QGNZ4JzZEcgVhZZI3Zl8Vr+sxBahc5BZIjwONFwHnEH0BkcK5/SpvbOcC+
         w63v9xy3uU80gXJRvzSYZ9d2GBrlJuLrUJNFu2uvshtXR3gnpUGKWlhtcK/+Dkth+yvB
         +uTSNJ1luLT5wV42AH47sdFu6A7Xljpb3B6tfXYf3oxu4ZVPMMQdsh6Xc3UZJSSCnEBD
         hOwA==
X-Gm-Message-State: APuU4Z96IgD+cBmDC652ygijI/53AR8GKo+HNkrXAZe6+9epZM4pNpGE
	SaVZkSukrVRei56Q48w7EV2LP91x0bqzDSl2BvtY0rY0TsihhhwYcRkY
X-Gm-Gg: AZFdTZdJrzLMv6ZIzTUDU3/iOl1oGfKceejgRVsYGgER0s/MUwNLWkx5ZG2TzZ6KP73
	/esYPAKd4LJi7pAXJD3Jgwi33+T66H8+GlFFOW0wxgaY9tT/AdcGDYmUwt95nvhnrMUa6E1wH1v
	Bw8t0wXJXBMU+Xm1WBh3ELZpZqHHNsx1gJl9ueMrLH7ISMcIaIMexdpusab9iijAJuuye6ZwO52
	uebsHB05sX6GAGpOGaff11oAD/5EyWJvH2uwdz/O5xvt5Li10lzrCgqH2H5mQlbiKm8zHhy8JIW
	bf5vD2oAd9OeUF0wuCx48uyg30H+7XbNLg5rPlRsymXs6xSa/37vmIoh+/qUy2vfMInLYC/8/kB
	8wbyWGxL+yxgYKCeKwiD1qdxK5suT8DAhSGboy2gy8qPr65xSWYBUITVR8IdpMKx/+GdkZZq6IN
	gtssL5XlCCKJn4olLqOHCFMIMsqGCXmIO7j7v3gFCXfcci8RkLDT3IYVEX0U8oS5ATDw8IfU5ln
	kQB0pcA5zhxLzzVoB5Askp8e79OnSbKWmL7DJjWPZN+fDtssBLYyqF76yao/XQW/0E+PDYVdlfz
	6DlD1mfl3E4ME4DJAL9lzY36UK6DFrcTCWM4R9kKzd1lnutefEX/CySai5oiptLOvlRg+YDUevm
	UG9I1wLVFRY/ZkFLvE1nPSmvXvDNvxWiSBEcK/mk4k/zQ2DX1KHY3nCiVzzpwHN/GXsjH3jW1ig
	V5DiwuTt5eWx7hFu3f776zkSLz
X-Received: by 2002:a17:903:3243:b0:2ea:1e40:624 with SMTP id d9443c01a7336-2eff740e7admr9568685ad.17.1794975961036;
        Tue, 17 Nov 2026 20:26:01 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:26:00 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 14/16] platform/x86: dell-smbios: Suppress bind attributes of the platform driver
Date: Tue, 17 Nov 2026 20:25:36 -0800
Message-ID: <7aa9b0bda9beaad3cff5ab82848ef17febc806cb.1794975827.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794975827.git.rosenp@gmail.com>
References: <cover.1794975827.git.rosenp@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dell-smbios platform driver has no probe or remove callbacks. It
only exists so the platform devices created by the module have a
driver, and binding or unbinding them by hand does nothing useful while
the rest of the module keeps using them.

Hide the bind and unbind files.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index cf75e4e5ad53..f98658d3c7cf 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -524,6 +524,7 @@ static struct attribute_group smbios_attribute_group = {
 static struct platform_driver platform_driver = {
 	.driver = {
 		.name = "dell-smbios",
+		.suppress_bind_attrs = true,
 	},
 };
 
-- 
2.56.1

