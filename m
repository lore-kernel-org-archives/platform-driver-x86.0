Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792988649;
	b=XlbiKm/8i02mVXZGvRWyZXvna8fAX67Em3ezf773EjkL5yy6asTub/HDL1p5dD4LzTZL
	 2vn162pEZSJ7bk2vxo0hOcZ78taiBvjD8EB6qpR3pggnVAeacTfAewwe13whF1/gAULEd
	 8Fe9d+5Dd6mRy8ifDLa5EUVzdHhzY/azJ5VbKJ9lECy49S8zSjLbBplLHm6yXUXmt6tsE
	 hwTCR7+H2F47dFHiD/ToPiB8It9Uq8sjTq0DZcwm6v1BnYsjmyX4YzKRacXA01LCMAH4g
	 nNpUAAVXtM2dXntfmdFYSIagD9gkLMP4Qdeaj5s8oDI0gmX7wM2cwlMdrnYz4Y4O7DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792988649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZX6u56YuYim6IhcFFofMeax3AEDqP6YE6VDAwScA8Z0=;
	b=0AKcbCaZeWVmo/6bNlS9yUglMTv+K/2hAIciUtAYfv+etYmi5FWj0lBMX70RygDXJZNW
	 7rQG33ii3vn/WoQULQVxwG7TP77dWQe+ag3ByxykMWF4ftPKu6+K8a27NgLnLSp3B0Vl9
	 3CAMa6uBF5TetYU/yX45KvWe13sQKFbt8oQlpi5oMBjydp6qO3IcU8k3zb0T+ie6sjPi7
	 uFS6b6ue+aswkNHt/0lbWCwVY5Ira3LIGTDKb7sZ6W+6zzHRVl/Ir+elTMWNcN6OmQ+u4
	 mFVKCunekbzlx8FdcnzEVjhunHPSrjQ5RyKUTq1Ut4FPX3pdqEEgqZ9Tqr4XhT4exnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lvFaXSqb;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE3B606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 04:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EE3B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lvFaXSqb
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3550c917fd3so3906659eec.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 21:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792988648; x=1793593448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZX6u56YuYim6IhcFFofMeax3AEDqP6YE6VDAwScA8Z0=;
        b=lvFaXSqbChT39rbQo0PTEgU5hs+lNZMznWnv0OQFUshFwv68tSZ/p/zbo2Qq08KJnV
         p2WF0T/7GvvERZGd0Qix24B7Ii40ustbSy3JvkqYY6JMpoOCqfgZ5R/Ucl3JP+HT2t9Y
         hmxsHYypjynud1C8G89GCnANOijkbXQjTmpoCRU9h0irfQSI3NIkbLZIf4oJUiDvhRWT
         jXJyMVt9+kOcAD7oUI2ysLZM68uIgD+MhbdLLyf6AujEK1D6B8iA6coS17ZF8rp0jIOF
         QXFoGgYSSCZ0J1A4UW9Mnbh8QS37R7R/P84hHIv4/bWEn6bwRbk3U67NPcDFLWiPgSPS
         HQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792988648; x=1793593448;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZX6u56YuYim6IhcFFofMeax3AEDqP6YE6VDAwScA8Z0=;
        b=pz+8GS30X4sHecZxmHUd2IRZKr64hLZf1K9q6xz8EL1zzeXL5ReGt1LyjHWVsi+dFG
         ruVMnrFzRVhD2Edve+8wxKzlDKRdvsFSHvVWJbVMjVH2CYMd0eLxBBqMatZeLALEvPLi
         3kv17VOqhKoeQpwyqIGgjXI2VwB40a6sCUosHTW1M+dFCgz0vUWgA8XEXxsyWqIAy6oR
         9PTCT6dBzxVXHuEoMpIYyFaAFY8det8bmmCBHoMLGUhfr6qqxLjCeI+OZCTwi2TVtTVq
         CQtka5UrHhzMhcUZ0hmeF2x6Lecfey/h0maaRztj1aynIc6dvW1RWFupzCKQJRqz9IN7
         Roeg==
X-Gm-Message-State: AFq9FYLP2tyOwtOEuHTSCOaIXjbAxhO5ea2A+RdnLy26haLO3UAfA8EI
	cJ/qdSjCIqJU4sf56w14b+nYC7AIpdxtKfWnSFsEVIDV1xLfAbDvA/CqKNfHyA==
X-Gm-Gg: AYBFou1KTOEj+uv/CEYMrK2wZfvVQOVT0aEeGMQEyYoLmEO6bWmWQ2AzYOWUZ7LuJAg
	fAqmMxeOpx281GIKoNO5isEzRXzLD6aFRKDEqRMStiD/vEI5ymMxNNPqvjg10GHBYHfO/2lbZ15
	UgsiZy7rLQGzX2AJrTJBlusdOY/gU6K3x29onEybB4Inu4nfLz2SdZryUPU4zzX2fluOhJBKv3b
	QOXFIVRRqLnH5cSo8/sGtH+vy6UDPRfBpODIJ6jPp+baXjE11Qu7y5xlAAz1rG4qam1LRAKfeVX
	IYfu/y6Ub1BVtf9FOfoMgy+rbR4OSEMlplf8EjWnZ32aly45nOVpeZ0wlKHQ/qxO4rAZ0r8B9Eg
	dXYN4r5Qtt2bFLXlFViwCZft44LAuu64NjQ+xNyxyLr8vZHSpIA+GFXbrlkhnpZbiRso/jUsVkO
	r45V4aHktwrnBn/4sFEQOUcsDS8JEdNWpY7UYfhWz3wxPkqNyjeD82Q4j0kWrH0baTSvqD8Ponp
	Xsj6fR6ZHJDfeaKETT7LW1He/90zknZCIvuD4QNezi5my602mrgHmeqNHpHzfo5Ri0l43WR0Dj9
	jZVvPX033Devqq0B68ew6ccagYNpioTbc+GZ0sc=
X-Received: by 2002:a05:7300:dd49:b0:35e:a225:3ba6 with SMTP id 5a478bee46e88-369e842b438mr8302200eec.13.1792988648293;
        Sun, 25 Oct 2026 21:24:08 -0700 (PDT)
Received: from chitransh.. ([2401:4900:61c8:ffb6:140e:11f8:8ed7:1dff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ff5a4d68sm6547457eec.14.2026.10.25.21.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 21:24:07 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH] platform/x86: dell-uart-backlight: switch to devm_mutex_init()
Date: Mon, 26 Oct 2026 09:53:10 +0530
Message-ID: <20261026042310.596206-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Replace mutex_init() with devm_mutex_init() so that the mutex is
automatically destroyed on driver removal via devres. The driver was
missing a mutex_destroy() call on the teardown path.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/platform/x86/dell/dell-uart-backlight.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..2ed2f00d8c49 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -279,7 +279,9 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 	if (!dell_bl)
 		return -ENOMEM;
 
-	mutex_init(&dell_bl->mutex);
+	ret = devm_mutex_init(dev, &dell_bl->mutex);
+	if (ret)
+		return ret;
 	init_waitqueue_head(&dell_bl->wait_queue);
 	dell_bl->dev = dev;
 
-- 
2.43.0

