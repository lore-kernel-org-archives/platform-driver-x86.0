Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896540;
	b=ijhApCmAzqi0lX/XJ+VZz/xSDN7vDfSf6Lob6FN0twSmQZLv6N71jJ2dEiNfmNVdB3mm
	 mRnVBqa4y8Ri/iACuPAMZZa61dG6XoBa1diEw7GGGz6eVu47kxeK/ECxwl/mNx9/LUOrO
	 0ARsbioD842dCSfbwp0W92n4k5ziRwREukWDhNIAsMuBQ8oQzwRbmRH68T9SxJ2gDH0LR
	 pAHh33NLVHz3HYzvp8cuEcrwFcPEJqi4L9CMICnoAVfFjyH65CfQmHzm7EV9NzEUC8hz1
	 P5aoF1pGkgNyWcYHp3XDMP8SbR92V5lstIaCBAjedcz8OtUhGpCy9O7cNRQ6UiCYBLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xv9yLRfHeZEkf9phVasO/TM2yP5oqXz3F+WdBaktVTI=;
	b=bmqEFUNp49F+gWWnX7978/ZntL68HLzfeEZzSFws8K8Lx0aTWsXKrl6OPfsC8yzWMxIl
	 LxmnF9ulugulpKGI7Yl3cbYyAYaECe234cz2yCruk9rdsw7PtGTs5hkkSl6FBoPaFZyjX
	 5WLjZL1z1KnalmHrnwjZlvlZTIDRe9bVjEzx+akPH1IZZ61DLPl4RA+IQNYfWkNQ9emPU
	 B6lFhS0gp2goescokyIaM9pzAWik+fz+0ejjnAMT/CAxIOQp4XjoO4dl4q407BnVaguNS
	 HKYnDKlOX3wjsTIhykjf+eEC9zeJDULneLMYR59b1ooO9Xc4+J/67shXWJkgTLcC+Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MRUtJt7G;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D95D60A2606
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 02:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D95D60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MRUtJt7G
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1931ff67a29so4101433c88.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 19:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792896539; x=1793501339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xv9yLRfHeZEkf9phVasO/TM2yP5oqXz3F+WdBaktVTI=;
        b=MRUtJt7Gkp4vafFe0rMwqOvDHoXxAMNyVJYKgIxP6STY7JiEtaQfRGX4Bfxa00RzZd
         LL9z7cyZsOY/4U6jo0Y82ZKnYeZ1xnNi4d2t5k2uSo3AfAtxKMndyfDNAgGYy05aj8O3
         +NOHRUj7mM7v7fo+STYhhLtoX7v3SUKlWkXZeFFQzfGnr+1EFv7yXE1lbrNRa/fILIlL
         PH4YGconi0OlzRG16TfoWqLahojfLcD9IiRsXiKBSsaWXiKATHLwZ+qecfhZ4HPZyt5D
         pN3gc5vWiZm5akOtpG9Dj9qY7/RqqfmML7d/xeFrZiipH2FEafl+aiMOHS0bvZbGQNJD
         kWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896539; x=1793501339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xv9yLRfHeZEkf9phVasO/TM2yP5oqXz3F+WdBaktVTI=;
        b=1hE/bojizq2EELkezdh3SlpxTYDXGsXCHDmYVR3FQ2z+3Ij+AX3q5srLlOkYTNzdj9
         T8JbOMwtBIx2kx9fTXZjJLMHzahu/hjKeaVp0xgbFcLq99wfYPEGvCp2Em+3zHflWvDq
         Scd30Eg4nwXMpBshpQ17RPLd9rJ/YIntAGhdxXbpajS/wXT+lwtN2mKAayD1msv7T28u
         7YlawPURd8Ddy6qctnOOCh0ovaK86xTkHX/bWdYBUgMXfhJl7l8uF7GZInb7HZW/0gPb
         sgRShzxkje8ZKhKaLchyHS/Dagiq0gnhSKp8asNcEG6DKpTBb4nDt9n0jhZ0g3zA+JBN
         eH4A==
X-Forwarded-Encrypted: i=1; AKwUvBybCHYxQmyQi18c7bjpCUJmfXRwDSAuQPmKzWUg9kOwijz3rQTqmIm6uu4ANnO+SGBM87UXnSLYLiEwBQ06pGg7Tyo6@vger.kernel.org
X-Gm-Message-State: AFq9FYLRTzpO0jyTAgqy8Fx83/hsMXkw39mqjf+suWQ2knKRC92Ap3h9
	Kmu0LIjc8FLrfr042OHEOp2P/RugnIq4olyiqMANmSVBOkobBxy6V+5B
X-Gm-Gg: AYBFou2PFpeE+1nHxJjF6mNnUcxqcvVPnGyT3a8QWZ5MHbjMSo3Xs++xqW2XUkddglp
	RUGXAJqo7sQ7VxnffWBbVN7GM7RGxFP7Z09dg1Q+cezQIe+WoJJpQUwM6yomTFLEfK96kFMVd0Q
	Gn7ya3penm4ilOiEC/sMfo0m8O4qCL3WTLeSTCVAeOT/RuHyreltNINNAe8MqmRyu6mw83DLTGl
	FPasYhknZmKjf6KiAExNt4yTYHXBbK2rKYyIbqWda/AnGim2oNdeIAdE0T18tFoMMiERN1fYpPv
	928IpDVX4C29dvG13z4Zy3aZnj6D9x2WElUOh6TjQv8yKt3m2k07Wo+SCCgeP+YPJpiuQ0T/cse
	KFmKXYbKptIfPmc021H8GX/M7mCRwak1HcAPGIHPhj4PzrDyaKkhw0oeP+ncUUh9eDPCweQclYF
	hVFUk0wl5vWYd/Q338G6bo0rYnOQPjndqkd0O7UaCXFsGmqPOjg2bVpwSqCLny1UB3dHNB99bGk
	IsmdjJT7KaQRfvNo0iFoQqn5gkVLVs/B4JkIn/oMwUxuY+9KLAMQlwpE/SF+i2jH7wZEDc33UpO
	BrXI3VacasukQt1wasaiM1wqUEmmQG9KsI54Aqp1fGs=
X-Received: by 2002:a05:701b:21c5:b0:194:b2e5:473d with SMTP id a92af1059eb24-199298b3af6mr4872191c88.5.1792896539394;
        Sat, 24 Oct 2026 19:48:59 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm10521272c88.21.2026.10.24.19.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:48:58 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 19:48:48 -0700
Subject: [PATCH 8/8] power: supply: sbs-battery: use 4-argument
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
Message-Id: <20261024-i2c-smbus-read-block-data-v1-8-19bb97467982@gmail.com>
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

Pass the destination buffer size to sbs_read_string_data(), and pass
the buffer capacity reserving space for a trailing NUL terminator to
i2c_smbus_read_block_data().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/power/supply/sbs-battery.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/power/supply/sbs-battery.c b/drivers/power/supply/sbs-battery.c
index 6714313bb3a3..f8b194c58a62 100644
--- a/drivers/power/supply/sbs-battery.c
+++ b/drivers/power/supply/sbs-battery.c
@@ -424,7 +424,8 @@ static int sbs_read_string_data_fallback(struct i2c_client *client, u8 address,
 	return ret;
 }
 
-static int sbs_read_string_data(struct i2c_client *client, u8 address, char *values)
+static int sbs_read_string_data(struct i2c_client *client, u8 address,
+				char *values, size_t size)
 {
 	struct sbs_info *chip = i2c_get_clientdata(client);
 	int retries = chip->i2c_retry_count;
@@ -440,7 +441,7 @@ static int sbs_read_string_data(struct i2c_client *client, u8 address, char *val
 	}
 
 	while (retries > 0) {
-		ret = i2c_smbus_read_block_data(client, address, values);
+		ret = i2c_smbus_read_block_data(client, address, size - 1, values);
 		if (ret >= 0)
 			break;
 		retries--;
@@ -709,7 +710,8 @@ static const char *sbs_get_constant_string(struct sbs_info *chip,
 
 		addr = sbs_data[ret].addr;
 
-		ret = sbs_read_string_data(chip->client, addr, buf);
+		ret = sbs_read_string_data(chip->client, addr, buf,
+					   sizeof(chip->strings[0]));
 		if (ret < 0)
 			return ERR_PTR(ret);
 	}

-- 
2.56.0.257.gf7497c7d27-goog

