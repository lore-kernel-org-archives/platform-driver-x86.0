Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896542;
	b=E0WJQoqVGHDYVu633Uvcg/rb7Nezvz0dKpG8cG2iXu5JHrAkgINj+wrnTVAt6CS6tPYn
	 xS5dDv+Ej+Bw2m2MJZRBcYSWQd7BhBJt+pyI88+FX1UTbcKIC8rruMgNMG4D+9SYPM9zu
	 9bzIVQRnSuA1Lbug5z2KRgtWlSKgA5KJ4SzCgzykc0LLt419kjZOgmsS4NlA9c4TX9NeP
	 TlT4H5szwxbTrv9nhYck8FJ1FgZEcWRBfpo3i5BXJi8FIoj7NbUTF3oUCA0jEBTevCr1x
	 oFv1l/ZELBMSElHWOiHG32Mc5K5S2yIqqAggXFkDMd4NDsmGO8E7R7sFHBgNDUzTTHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2WNFFspM+rHRPvmlX/IdB/mvBFJYspViUI+mUu/7+EQ=;
	b=xJFZgGjZXp/whMpUw3+dtr1lWyylYkXcPt0ajRVRJVGbTPn2dty8SF53yJ/KLO8PnOx9
	 ortwI4v650pjEqGVGmt0lJvXqgLloKCej4cGfmDGp2kFbq1iUVQAMoswg4KvR0+oEw27J
	 1s9MITquIjhDQehypelfb40kNa1Whwgmvnk0q/vscSn3fYiEuYqjSkKnoSmLp/l+muAmE
	 ABvRGHutgMvr55M1YEXlhDI6COSFuHZ2tUet1lVd8uunbHXGMYMqsD30tTIxVJvbmtcds
	 DkmxL8PiW6rqDUSsmNYt3KXMQgYiMAo2UQvpcJhwT40epr7TQhj71+P2s0XFBJLzlpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AogBztQa;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4A9606A332
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 02:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A4A9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AogBztQa
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3550c917fd3so3023635eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 19:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792896532; x=1793501332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2WNFFspM+rHRPvmlX/IdB/mvBFJYspViUI+mUu/7+EQ=;
        b=AogBztQaefRHxqIf7r7yyiPJ32TbkKSI3EZbJyc0kM0DrFhuCiEAqIV7SisQG5g01m
         lP8walfX9nQXhaXidqzuNwI6Liv8Yr7pKoxYww/l1I3zNqNPsE0AbTEz1Y9/wA1xXQ+u
         pQ6Bjf0E790OrznGUopeKOQszZ9uwLfYdMH3COcZyZ4oSsC6QlaWXUQep2FG9atErDPJ
         rLSXwIHURFU/vZ1FggsB7lHTTHi5Nztr+uIT7tAjeUcGHkirI6ugimoSrRGeOsGzaU7p
         Ogm+9BojY6irQAwGPPBCC/Udjma2QscUnzmO2cmOitOQmo9ottCgL420ReMargrfLKyq
         LgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896532; x=1793501332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2WNFFspM+rHRPvmlX/IdB/mvBFJYspViUI+mUu/7+EQ=;
        b=uOlHLT6hXU1/VTBO+UFCIpuL/b2sGIr5keEEn/J+rvL5aQytmqw8oFUh+roHTR5KWU
         iVUds8cCNDvd9/wFKm0tsuVbAA384A/HhIvLV5UurzVlvHFVet2MJw6PL/8ghAO6rFjG
         gObFY5VJwUuSxc94w+kRgvDn1hmD498IQXreP8zQei8l0F1PjSPtY6lCpUD9iGSnb0LR
         SVJHtUaKOF+cIz4Nh8GYGX9ul8JQu7N5kqsH0twTTSrFIvuNbDyVEHHFlnxs53L8NXeh
         3cD394vGwvQKkZHk2kypnoDjKQd10bTzVsFpifQdsrUkSKEvHy0G4Qc4vP+JZ8ldQdP4
         EoIA==
X-Forwarded-Encrypted: i=1; AKwUvByI5V6CoRMbFaaygpBDI1bVFb3NABE/FqmvVc+U0IHP/CuCyBuNq+iKxO+qL2RzQZe81ktLmNSjrew/8BGY+FE5wczL@vger.kernel.org
X-Gm-Message-State: AFq9FYKj7hZTNCA8wiYrBoqzOvYRNwiqgNl3MJYj+6hGGSIQPJt4dTuo
	hKIehI4tNc0g4Fv+0HNXP1yyIcxS5fRygCCcuLeDW6zHCWBc7+NGG3EE
X-Gm-Gg: AYBFou1JW5ja80pE/HIAsHj7wWrku5luxp+JWWaiAgeVwtySAKkbh2kB9j3tCuU5ofd
	B8Ix/tKxxRe62jW7by9lBU9yuXME7cHaf5KfO8mkCwdCcoBJGO4pSo/qLoU2uHCe7LiGivwSm5U
	pRzhxY/Ab2q6kBM1Es3KkHmnan88AaAyBupTZG/nxR3eF8+nRJ2e+bsG/qFGlEWf1WA9rZ7v+iy
	+6n5WoDqe+BkG2xNOZUL8zH5gq6J3XR4ZDcmHnRwT7tztTCXVWrydEzg7E+/tVL229BwGCujCge
	Q2/jUv9SZRCa1ZyXln5+f7IVNEEJLgRX16F2dzeSd2f04OqqM8C+zJchkmHIL5IhO1ZcXaeFPYI
	KbE5t4jT3kFVyD5zbuGq2qFTIMrwMqyCx0ajB/VsJMZV9x51okgJmJv4ZMG7ekXWLkfoYrRqa7r
	QJhkIhFZV3OOdRzXK90gpVJ8lK3u9xxwX7Iibhzp2OYLAjMm0uJx0ZaABu7+hZ4mYYJziRagpxy
	MLVna9golo0KxfjxivbYh1t4vQdPX/9mntEBYzOkEueB7Nm3WzXkyK4lPT95v+ug1/2tucvUayZ
	sUy+H/jJxtteO4H4n/RQyHiErMhQKP2DFkx1Ic//XxN2wHttrEkfhf8YYyQcMsRO
X-Received: by 2002:a05:7022:ea5b:b0:19e:1ad9:1c2 with SMTP id a92af1059eb24-19e1ad9061emr760295c88.38.1792896531619;
        Sat, 24 Oct 2026 19:48:51 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm10521272c88.21.2026.10.24.19.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:48:51 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 19:48:43 -0700
Subject: [PATCH 3/8] Input: cyapa - use 4-argument
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
Message-Id: <20261024-i2c-smbus-read-block-data-v1-3-19bb97467982@gmail.com>
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

Pass the transfer length to i2c_smbus_read_block_data() in
cyapa_smbus_read_block(), accounting for the final chunk size.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/cyapa_gen3.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/cyapa_gen3.c b/drivers/input/mouse/cyapa_gen3.c
index fc3fb954523b..0cdebf2c34e7 100644
--- a/drivers/input/mouse/cyapa_gen3.c
+++ b/drivers/input/mouse/cyapa_gen3.c
@@ -256,7 +256,7 @@ ssize_t cyapa_smbus_read_block(struct cyapa *cyapa, u8 cmd, size_t len,
 	if (SMBUS_GROUP_BLOCK_CMD_MASK & cmd) {
 		/* read specific block registers command. */
 		smbus_cmd = SMBUS_ENCODE_RW(cmd, SMBUS_READ);
-		ret = i2c_smbus_read_block_data(client, smbus_cmd, values);
+		ret = i2c_smbus_read_block_data(client, smbus_cmd, len, values);
 		goto out;
 	}
 
@@ -265,7 +265,11 @@ ssize_t cyapa_smbus_read_block(struct cyapa *cyapa, u8 cmd, size_t len,
 		smbus_cmd = SMBUS_ENCODE_IDX(cmd, index);
 		smbus_cmd = SMBUS_ENCODE_RW(smbus_cmd, SMBUS_READ);
 		buf = values + I2C_SMBUS_BLOCK_MAX * index;
-		ret = i2c_smbus_read_block_data(client, smbus_cmd, buf);
+		ret = i2c_smbus_read_block_data(client, smbus_cmd,
+						min_t(size_t,
+						      len - I2C_SMBUS_BLOCK_MAX * index,
+						      I2C_SMBUS_BLOCK_MAX),
+						buf);
 		if (ret < 0)
 			goto out;
 	}

-- 
2.56.0.257.gf7497c7d27-goog

