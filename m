Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896529;
	b=ivkevBX8C7irFNaP7BNHFX9oDNnwrEgmprL+rZK8gR2lvhn0ToAAz0FvI7mDgNBiaqPo
	 Y6ScI9zazbYtvfxJ0y6ErexMBGGIwsZXgbigRy5mbVBKTgc7IcLSdBOQLUk4hVWJQaZgW
	 FKL2gfx1W13zzBIA1tVA5DAXSYpjotluYiDaap1lHhSIC2pMd3JGAtiEr9jXqvTxVs+Ah
	 7P4hXfPFyCR0M85Q4Oz3zSL7JS2NmMmOoht+px7y4T443k2k1bH86rrWwtE7/qz0HaAkM
	 d45L4C6Pt5TN5X3E3QrkGzXPkekxNHkEZiSpu4PNUbbqfCOo1NLLTD2aSaogwHp+Biw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FRxwvjYywW2EDj8EBeP8mrgqVWNhsI+cL4nt5lpU7sA=;
	b=3AOH7LEw+Bg5Zby1B2q4XmdsqZFqlZYYgj6MdN5rLnAfxp/VWUR0kalPKpHq50BNmFOw
	 kPXJT/a+Eu9XchtK0VGvaBBJ5WVUcjvQwGALqK1ewiQW7ULS5UHmkVGzCelkzSovdWun8
	 rry/fGItgV5r4sIpSvkbhPYM8OrlcIC97r4lIZRFSRxdHJ8dpSwj4Ugocs2e7aigEwNjr
	 i831GgsmvegLu1LjYDJeYri7LPBFvaE8x1CN6lmbFIH7xbdUaT3cj4/FBUrnOIHs2C7w7
	 XH/3xtk18ZpW1LM97EbDZNUTqbXaHsAFjxoeHgvTxVPd1VyeQjqPG1T9xYyjY3greAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TpxwA813;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E11606A331
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 02:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E11606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TpxwA813
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35f1f76ea84so3384202eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 19:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792896528; x=1793501328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FRxwvjYywW2EDj8EBeP8mrgqVWNhsI+cL4nt5lpU7sA=;
        b=TpxwA813+P5znsifZUJ8deji2Cfy3YNYm07xUH+eLP83aZg54OT8spSktYMe6uqGRE
         iQECHez5gjvBbx6xLGeVbfT8DSZ1k8Qt62vdK8EaDhI3b1+wztqIkJbaJlCtnuCA5esL
         QRH/IaQA0IS4/4rwKKtRZShp/VJZY5B2CGAQ4+oQP9868SHQzHcsRMqbIUIJIrKAZ80n
         lruFtXxmDd9FsV8X+PllJ668rF3ZZJTTNnl5/6dcw99NfAg8N0Yo5T4C0J1RuHQYX1ve
         +cFbn2eSkjaZFV55MBT+LCMMz8FPEg4aiNN52QkcwWnlvHZrZ4/6zCg7MfQQ7POzh5gG
         lE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896528; x=1793501328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRxwvjYywW2EDj8EBeP8mrgqVWNhsI+cL4nt5lpU7sA=;
        b=oPLroB3bHJ9SrJPanNETJa3nACx1ENeGXZoqq+5gMyv4bAfxPeKQLExc2W5oAQ8KoV
         +3U9ZkGMYZ8srImAycsQf9TqV+gEZZzEWJKmsEs0Hmt3PIFyfWh4c8L/jAorJ4xaaIyK
         yYFmKqiwcol0aeWTYi9gvR/3H1ZbY/NvVANG79oEyn1y2UE0JE7HQJNSh5h5BFCKww/l
         MgnAO13L012BQc91vCQaw613zmnNklYzlrGMAF0BZBdfp8ixfFUOosxVBULKGo9lWHNP
         sDWETXxqVnUX+OT4w0y9OIM9rw3dIN0fwFKcb2wJ4Ma9OcNYN8GXSq3LGtvnT2Jb+K7M
         iAgw==
X-Forwarded-Encrypted: i=1; AKwUvBzMmlr9LZRUlv+RjZZhHEqoRJwL0dDFargQbPKgeCO4dACO86pgiJy1bue4UKmWp7HXhcZAiofy10V0Q6sLk0E+iwYu@vger.kernel.org
X-Gm-Message-State: AFq9FYJvVyOnRVc4kXfYik6ESAsPPXzHJ9RydH+bmrMqwNC/qIkUNf6w
	sKB6AVqtSJ5oTygVdlwRdQmQwusJ3jHnzkfBqbWeREM7XpRT+PTW5DuG
X-Gm-Gg: AYBFou06oYQMyZlEeyj8BL4+J6FUwRLddlwslOSDAqGSwMVzdvheS7oO6B7FJqjrE1e
	OElj59bmz/NW0Sm8M6ddJoU598JblOwTC4LFZkUXtHqvBIqGkRbgXzX9t1ILucixUImcATZAPnj
	uhkUAI1THYXDJiaLm57UuTzhQ+jQUu8KVzwv3Opuc/lKYK2rinMd2sQv1llqyIAvvCYoY//2B85
	r5FXZrMz6Eul3pLV1aL13ek9rwiEhRd7kbx3kt5TOZSZfVd+FiMSAC7m7w2Ga09yzn4k682oi2m
	bQ251V8hPG1XbKyig5mYxMWA6PdNfwZTr8ApK+DYJmjqfs/Zx4VdCuATRpqxw/biU8zVzMNt6fO
	a2LHiyhZPd6uM8Q4Kf63DMUBlim0/zkJoPaVvU7oChNNp2qnoNUPHOssWkm/as21AZABHaDp72G
	nUldnoiNzzf+KcU4P9vQ6DnrJtSmCXYwKoPDCEYfbC4A52iIdv91Pbn+/s/h93IPab7qtFkii75
	bsgweK/PNFn1N1w3daGNhCrI2m3jkauuJHwGwC/t4Om/2smVyYZ8q+ISiAILsC3g/w7+3POH60U
	rHB9u6bqP4hJsev40gr9UwZbanGadmJQ1zEAGdRt0oA=
X-Received: by 2002:a05:7022:1087:b0:17d:7b45:f905 with SMTP id a92af1059eb24-19937025befmr4633321c88.31.1792896528487;
        Sat, 24 Oct 2026 19:48:48 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm10521272c88.21.2026.10.24.19.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:48:47 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 19:48:41 -0700
Subject: [PATCH 1/8] i2c: acpi: use 4-argument i2c_smbus_read_block_data()
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
Message-Id: <20261024-i2c-smbus-read-block-data-v1-1-19bb97467982@gmail.com>
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

Pass I2C_SMBUS_BLOCK_MAX to i2c_smbus_read_block_data() in
i2c_acpi_space_handler().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/i2c/i2c-core-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 84841ed13487..4acce685457f 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -751,7 +751,7 @@ i2c_acpi_space_handler(u32 function, acpi_physical_address command,
 	case ACPI_GSB_ACCESS_ATTRIB_BLOCK:
 		if (action == ACPI_READ) {
 			status = i2c_smbus_read_block_data(client, command,
-					gsb->data);
+					I2C_SMBUS_BLOCK_MAX, gsb->data);
 			if (status >= 0) {
 				gsb->len = status;
 				status = 0;

-- 
2.56.0.257.gf7497c7d27-goog

