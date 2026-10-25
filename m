Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896531;
	b=uBaC/BJxmBqOqOJIaQnNMFjoWvDtTtyfQEqGg/Wv6G96iWSFj600TvrAg56kasgDUkPL
	 2qHFjjwKCOAHgx8WB538MsF1Fn5bRn1YddZ9m9KviFosd7mxMliC1oQklaRpEHjGlUMvp
	 1S3rR6YzJZq72P/yY6oSgiphsnM0FcrUp9sogA3ab8zgg27SP/ue02OYhsO3Y9si0IhbR
	 u20NDDsPcZTPYFcTAyzQCRgNfkWiuuFEAWd/sRDENMBdcKBEW/ghe+xVmpVj1vAIPHlgZ
	 if+y09/6+KFQRrRrf1+GcE9M8PbeJB0WcPSTcS8bSpOcG94BBP23rdSR9lgPQTcp5aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Qch+gfvUWnIg/aFjnOTDzOw/h0vbAHOBkhrf0UIuzZ8=;
	b=Spmy+ik6++8rUM6oGLgJakvC62r1hyTD3DTot5qquzHXHC3ZVUj89369VsklBXc3mKup
	 iRY6Kal79bEOjcMdV7JdtNSsj6vFET6NboyAowDB/z7MIfHbYi1UsF93QWFsEPG9gBAgF
	 psWSdOR6E5wx58dC/GRMEeCldOdOWWwK0E2zipdvw/qFzZtz6AQwlYXEEB28VwCJD351d
	 ZA5qTWGZJLHgS/x0GNoCfH7qFq5pfJp1h9XEz1ha8ApXU3EyEOV/c0KzPT6Kpzx0DQ/k+
	 qH++b7tj9PFxmnvlQ2N00RrobWqpZUC6W/fCIw4vLlOqQw+7ywaufOG9kmtnd1+h3MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D13wWGtz;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A53360A260B
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 02:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A53360A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D13wWGtz
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3514b90bb89so4724153eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 19:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792896530; x=1793501330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qch+gfvUWnIg/aFjnOTDzOw/h0vbAHOBkhrf0UIuzZ8=;
        b=D13wWGtzDrlBw9Im7u0R1IdFHg4wNG1163II6ub/nPI2fH0oV74hQzstoAqgvSxI+0
         myknq9Ug9x38jjUUZwY/vyXKIDGMNo3ZKXP0bAWsSPufchByNmfUqbjLR9h5DiQc64wx
         b41VuTc+OHb/42Uk60MIIq5H5njnW+qeWoLqYxKwISqmgf8YvNXxGq+BL+Qjc6HvXh7N
         0UFuKY7bms75KP1rs6qbQXAEM6K6vURDSsJu7wqzwbTz0/lIFC+uDNdCBWcUI60PHNnA
         Gm3DGTK35BKOy4/WnhcBiampzvbAyAb4nyB/WhiSNzemLHUAH++XTonf9uwlP/Mvv71a
         ZGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896530; x=1793501330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qch+gfvUWnIg/aFjnOTDzOw/h0vbAHOBkhrf0UIuzZ8=;
        b=nFXzj5yYv/ugnj1oVypxox/5XLfGZzxIa0hS4Vdf0tK6Cp1DguFndbUvuE+3CHEwnL
         IGBm7rdEalwECorOwA5L2XAHpg6olLhucQeALAweR+8v1zR2lUtWx8yDF3narlCcE7w7
         2tKNLSeO26sQCZc1qGhUTK/lRcbLtkUGt5di0SQsE0z4CYw7qMTWMnn/myjrLt6hq4sg
         MZo5IMX/eDLIQ+du/jEf0RMUsPTAOyuknndoOYE6g76bLvkPYWRaoXDtR7OyVCjGfYoY
         pmhfQ4/fphvl5uNZjq85/nzethTrHEEQIpwA2VSB6zY23uRpOZE4dQcjtzyqEwZxX2wl
         G4gg==
X-Forwarded-Encrypted: i=1; AKwUvBz34cprKq6AjCnnaPOb6QGXVBMt1lPf5RFpTQVdjqw8GkCyHEcmhWRPSB4aT0dwjeYKEXNI4VC4arHBg6sfpPDapfWm@vger.kernel.org
X-Gm-Message-State: AFq9FYL2dDENuz9EYLxEEBLpEzqtTQ2BUL+qpybBxPx08EcWpZk4rR8v
	p+CjTr6dGc46LgW9j9aIyVIZeOEJYC+PKtG4FCwgqNRTygeLXF0lce1R
X-Gm-Gg: AYBFou0Vm0SAccakbHRLe7fmYCsGVncYjPMIMMZ8tRGZhb7ByWr1hyCRAXEhf05P4v3
	76cEpWbe9u+vKXOj8dmQ5t7iZb6bvi2hb3g8X7XdfKMsNv/8tFZvOf3Jzb+++S+Xfmj2Q9ZPNXS
	OfSa8re7DKpzCNL62QSfSs+4n7RYy67qKE75tR5e5Ks0If5+8CfjtlFhwbsypDe67NoI7jfhkpd
	Ot5Z2ElBnByx1S8XBq6lYFsgLa/+/A41nV15uRBPQMot86XmfGZlFtENSe7vWLaNhTaPyAHVsjM
	AX8cykpGhEudhx7QvRLP1DVCfkXn/tvxgvAKx9mAwkWyRww/m4My9KJ8KgGJnqqxo7l6rDdY+Au
	CZ0l55Vm8xQU2o+EjMaUHgEg0gGQHuehsg7AThl8HImZisJB86upqbM5pp8a0kuj+29bET0hMDr
	tiMAwbsFXayue2WTeh9atU5DX6Qy0PB9UWcJdKiW7dNNkMQ/LRQcKH2W/xIRx1Kh2VOYE4gmGqQ
	ANoX9ZAEPWRzgCGDtBptAWHUnSCp+UuEc7Pj+NNkulGfzc9A3ADOVZlN+sKCkE99KVYJqi2CpAw
	C+0UPQJu8o2PIGVUnY2jZay9mEgSxvQh9NoJtccJt/k=
X-Received: by 2002:a05:7022:7f0f:b0:187:c940:21b7 with SMTP id a92af1059eb24-19934e71e37mr4620736c88.9.1792896530109;
        Sat, 24 Oct 2026 19:48:50 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm10521272c88.21.2026.10.24.19.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:48:49 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 19:48:42 -0700
Subject: [PATCH 2/8] i2c: docs: update i2c_smbus_read_block_data()
 prototype in writing-clients
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
Message-Id: <20261024-i2c-smbus-read-block-data-v1-2-19bb97467982@gmail.com>
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

Update the prototype of i2c_smbus_read_block_data() in the SMBus
protocol function table to include the length parameter.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 Documentation/i2c/writing-clients.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/i2c/writing-clients.rst b/Documentation/i2c/writing-clients.rst
index 8bab8b16ca8a..896bf79ea564 100644
--- a/Documentation/i2c/writing-clients.rst
+++ b/Documentation/i2c/writing-clients.rst
@@ -366,7 +366,7 @@ in terms of it. Never use this function directly!
 	s32 i2c_smbus_write_word_data(struct i2c_client *client,
 				      u8 command, u16 value);
 	s32 i2c_smbus_read_block_data(struct i2c_client *client,
-				      u8 command, u8 *values);
+				      u8 command, u8 length, u8 *values);
 	s32 i2c_smbus_write_block_data(struct i2c_client *client,
 				       u8 command, u8 length, const u8 *values);
 	s32 i2c_smbus_read_i2c_block_data(struct i2c_client *client,

-- 
2.56.0.257.gf7497c7d27-goog

