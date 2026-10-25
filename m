Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896539;
	b=4Ih9yJKD/ppTXKGibyfyyib6SXhpxDxrw+8IdLA5JrgKdDdQizsx72Kn0h1iDf2fdeKX
	 aSNQnFVQIM38VCedI1TAoqLG/jlcg3RRsYUJYadxcNPYWg9ljtPqOcqEw1kvNp138CJh5
	 E2xupmcFVdKlWhy3ri4jb9Xz3qrbrlj2kZW5cUciPbH/qurWzQX/Th2awAJv9Scn0Zq+F
	 QKK7MV6dDmRaxQKMVXkkjHwFOenl4omlTlpsunwLs8yb1ND1GBUlaw0pBFaLZvzGUBcJX
	 2tBDtKX4YGDy/03g9SaWTRyOiWEr1F8MVk4a/+x6pj9mMepPqtpbqPIFLv7uP+zcRLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+D4LEQidpEa6OUGGXTLPtwOtKyE7/MIv6b0FECjwB4c=;
	b=ehHYdz09pxN07+oF07QIXAxsmkQmkOkHQYiDX0/LYV6jzW66QERTGo6Epb1RlV3nir4G
	 tGBfHYNvJTPDevJ7FEkMPIXplMt/vL+OQ/kFTztzzqXG7h+QysgS09DJHDbeetg8ZV/Rw
	 EFDVN6/rtzW8zBVZbhxDOcUQWyGn3piZO2UJ2PDwE0iDYeb4UsBhGiFTblmfpbniTML9n
	 6EASypvqJ+AM8KoWLFi3cCAOx4pknu8f8pYLlK1dSYSHJQt2I8Lp8bKl50/DJgd6Vs7lA
	 eR22xhLen4ZWOSL5AbRLBBJatMSy1TQBCuk/SbqnYJGW9K0T+99ddYxThr1qmgK4sug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KoY+mptH;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BDC60A260D
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 02:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BDC60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KoY+mptH
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-170135e43c7so2025610c88.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 19:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792896538; x=1793501338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+D4LEQidpEa6OUGGXTLPtwOtKyE7/MIv6b0FECjwB4c=;
        b=KoY+mptHC0CdbSXyXRIQLOUk+sIQ2V8zR/H4vg66uM1mRxvr8C2tagJSF+7ZHnvhXb
         mrm+QXgnkIMNQlrG+qcqoZpD2EjjNBgf7f9tWH1pbJYvt9qCPRW9+uC87jYr5Ky702+k
         AnIyrs+SQfRs/p/9TcI61sYs1h+H/Fsfw++AkiPkMECbrp3cvdsYXqI2VnhX7hkgOGEj
         mD+1RWZQm1044SZN0wrIX9xjwCRD/zU0pUFMP5Gs6Ypw/7ixhIsI0b0kGgurBXqbWMeO
         eC+o04P9a2kRz69dA+KfBCr9OukmHDQDjvSOZdjBIcjV7OxjDDtIWYnbg+PLlF0D+H3m
         4z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896538; x=1793501338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+D4LEQidpEa6OUGGXTLPtwOtKyE7/MIv6b0FECjwB4c=;
        b=IdTlRpY0Pj5sDwRSFy/ieHGAX6fdYd1RUBnD90rTwOdN02G92DCAsr/qoZTuu147w8
         9Vsq7OgZ//41b/EKyU1o/8HbeUfYjSKIl/E7zv6VnaMF7saKOSCME56xcbR071c1QvVJ
         3I1L72Mt7rltrrrPtTQNIn8C7EE6zUtY6/zEf+WXUcOqaA/JET1N7kFu8ZiSmL3GuG59
         aGEq29cyFon6G/Z9QnfenEsh/p8rO/slyd5C+C3FCnlClyd/3zP6KFsQtO2EDbg95ELZ
         JABcNOBGM+501es3nqSOPzKzeoSPqVlDIHSpnGa20wN46hiHxuMswwsraPORMEpHfmPj
         jS1w==
X-Forwarded-Encrypted: i=1; AKwUvBwrD0NTVJhwoXdeE6EcA/YoVeadtELe/oUBsYYMvwrP96/DwIhVZNNwQetjAr2hrVG0cdBL//pp+duzi27HYPI4RDun@vger.kernel.org
X-Gm-Message-State: AFq9FYIeF+8tkv8mCiF7XZymsFedjGBve4vuyFw6wlCrz5VdlRxio8R0
	FUVfNWKHj9HWK2Bsy3qRprI80WvDNTDk5iy0YtHgjzi1+GqEUz5zjWXB
X-Gm-Gg: AYBFou1+ltlwckELA+xo9J38FRdsNeQ61orT1pV1N8CjhO5c4HYZpOB0gaDa/3k+ZTW
	vmo4ysXW6kKEaXRDcC2b/cHjb7QfvKoX5oh1SOMa0elAjsbQfLMzbr/gmrQ6+ZXL8ZakQKxvUS3
	64mPwuYaxhKcVhSA0HjR4xfsgUe93LEgupdKEzsV47QpgfuxiMuaz0tC66v2wDflzGyS0fPjy9Q
	hvMIWE2hsQkFGhfACG25XukS30Sm7M56S7SJQehDErhhT7kvR4+4L6lZcqyRC4cQvcOgz3WjSO6
	yXrLwreDqp8DpiQeTOe+PMGeDk9skR58ZGmEo1WY3xaFsfTTVyRy+1sR0Y9HZuslzQZJnyWxEdb
	j6gSvUnGIyJf4XEPoxmUAGOFqxR2QrAKcqRGDJqXugDAeZPzQjapVwBNY+Fo9EIMNol+hYqfqmO
	/nWwM4BAivXBfTguJqF7cK/p49I0x9/Vu7vNa4pwD6GFLyZO1gd+Vu2OHkcOVC8qG0n6xiX1xR4
	X48Vf1u4w9GTmGPf7pfVorwQHfj1FAi9hZhMO+QfZDBvTT2vONJHa6f0/5YeFlKOwKdyCZqGs5l
	KvWsr4LEUtJqwFUsX9FdO8m1rWjiT32UQ/AtiRfdg5A=
X-Received: by 2002:a05:701b:2714:b0:19c:dd9b:d09e with SMTP id a92af1059eb24-19cdd9bd124mr1585077c88.23.1792896537822;
        Sat, 24 Oct 2026 19:48:57 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm10521272c88.21.2026.10.24.19.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:48:57 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 19:48:47 -0700
Subject: [PATCH 7/8] platform/x86: x86-android-tablets: use 4-argument
 i2c_smbus_read_block_data()
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-i2c-smbus-read-block-data-v1-7-19bb97467982@gmail.com>
References: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com>
In-Reply-To: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com>
To: Mika Westerberg <westeri@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Sebastian Reichel <sre@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 openipmi-developer@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass the expected response length and destination buffer directly to
i2c_smbus_read_block_data() in atla10_ec_cmd() instead of copying
through an intermediate buffer.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c b/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
index 67dba9aa51f6..bbfa040cd4ec 100644
--- a/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
+++ b/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
@@ -65,16 +65,14 @@ struct atla10_ec_data {
 static int atla10_ec_cmd(struct atla10_ec_data *data, u8 cmd, u8 len, u8 *values)
 {
 	struct device *dev = &data->client->dev;
-	u8 buf[I2C_SMBUS_BLOCK_MAX];
 	int ret;
 
-	ret = i2c_smbus_read_block_data(data->client, cmd, buf);
+	ret = i2c_smbus_read_block_data(data->client, cmd, len, values);
 	if (ret != len) {
 		dev_err(dev, "I2C command 0x%02x error: %d\n", cmd, ret);
 		return -EIO;
 	}
 
-	memcpy(values, buf, len);
 	return 0;
 }
 

-- 
2.56.0.257.gf7497c7d27-goog

