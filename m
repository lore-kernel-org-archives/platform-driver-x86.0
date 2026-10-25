Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896536;
	b=s2GbSjUFspqUQ7zVW+yKwqCtalbTT3kBf6t6PI8M+1eYW+pwBeww0IBhc+UhcNQ8EZe3
	 WkU1cEa+NwPgBbzWmiG44V/5LSi+O1LRb6l+3NL6EXC4ie0x9Hfdf/yC9u28dn0nqaQu1
	 AIUHAQXwVA/Sp/PS14XEWX8ttVTco1gCuTkzTyt8yJ70JDVVEuBNvVbw3QllUkjhGheeh
	 2DzqbdV/OkKM3WL2bRzJaBfxZvRVw0njgCIrhOfCEyRBXIhXYYdWMMM1xYne6nV+TcmxV
	 4ycbbZuAEdqheRwsyB3+VrLUT6urg5tiek/TyOnelaIHzpAwcWv2sPvxYbU5O/Lnf+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=K6RWQvZ0010QMq8qM7UpBKJiUI/Pg5qFMdimoJtiVT4=;
	b=mj1KBWNQc0V6xeFwwy4iYg678HQ7S7Aic2yEhZhPvFJbZZhGN1gF47Z4xp05UiNPis+d
	 J2Gwdty/bLfBA7q8xeYnCgqWPMCRJ7LlI8XZFfSZwqao60g8F++drb8iFfs6tuPnYVru9
	 SlqvxIzl9UoLqwtjLleeck2xOXmstvxlAxyVxP3Dob42QWgn0jMkJreVz/e9tzhvEiy+6
	 +X61fjaeSIsu/uwLD8Lufq28c+D6+O4mF2BSpDR4Wm9G5xw1frpibvUNXdqWbqTP817Ki
	 411eucvM0wYc5EjEvbn4pzTfk+UobNnwNqUVrUxg9GOTbPK+kSkqkffgVwTFGV8ZK2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jY+GWyYS;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35D760A2615
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 02:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35D760A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jY+GWyYS
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35f036b17easo4771090eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 19:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792896535; x=1793501335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6RWQvZ0010QMq8qM7UpBKJiUI/Pg5qFMdimoJtiVT4=;
        b=jY+GWyYS06WKW7sEDFJqidwo1kj5aZiu+FCc59Yl6t+aaUEEs04DN9aHOSFvf4pJ8Z
         qDTsGyTd2hnl7k5Ym46s4MK+M0SwUS6QT0od/3PXQUY9mRrVY4wqzdWTtw/7QLtKhHPa
         Wl1hqNxbGN8k3SsCbjwlCsOrJRQMs4gMf/tZHs8fW9xwTRoGmWNJzJ/3nkRIzMHK2jEx
         7Yvg/dWXiInPgUoSXDzs3Y09VvZo+NgZaXTjGaJ6myy/TWg725XOGN2XlqtCb0y6wNjt
         /5awgzg0f9X0YKC3fb5ZWJ1bxfPVtsB3fUtQFpxRIUQdbgAmX+A1x2JOoOg4XWscVZWx
         qdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896535; x=1793501335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6RWQvZ0010QMq8qM7UpBKJiUI/Pg5qFMdimoJtiVT4=;
        b=o2a59TPwB1hXqBpN4aNfyrudPjFTEgbdvtIU0DFRz3oRhknVGzLnqy7a3sibAlB/AY
         pbxf3r0KHcjIpjQJHT5MGY0YmYH3L6Z85CUffjblXV0UIUr/VN0vVALMnzETywVSXof9
         Ntc66fS9psdILEtmXI9sujdz8S9TDMm8mAGCyrZB0bv4SC7gQRhxxhoODc+lcjTsRFcS
         GJPq/ZJLcKaLwcR6wkCER3Ove0qYnZtiSPSvQIPW0C2ZOXBgvrGt1Mq29jHAMnpX1LyM
         VB9X16Hs7AUXGNV7PsXQKCMlgFkgcEGKI4LZc0IUYAYTBJWXSktkFQ3FLU6DAebVrR45
         7Ikw==
X-Forwarded-Encrypted: i=1; AKwUvBymkRWhhtE//0AjJ1+JbmWvcGtU6eGNG+ThRwnHmJ8X3q3fvTcUhHCF3jjcMoazLDcq5QADAO0q3l7fxWpnh4Wj6XZw@vger.kernel.org
X-Gm-Message-State: AFq9FYKR5wTbP68HdmCBoBnoEdVAqo/i2TZe/Qh0sneGKwSL5xgl9JKu
	xxpvv/W6W4Ozso664+FQthMPx1qwtm6P9bG70mGV1T1pS37e1vrxPUrcrc7MAA==
X-Gm-Gg: AYBFou0QryCrKCP7tw4K/yFylKsz1Jb7lW3NV3CXoCkbNbZL/heF1dQEzdV8AAJgMYk
	mvlzr4hQn0tHV/XDalq85LN05DwJUN3a765VvTEwvUGx0mDJBl6TgZ94ipAzpqhayKMYhucm4o5
	oNw9+pJv3qk8+fkL8Fl6UgTIJlvAYTeBtSR9/DFgx73ptKTSVt42sKeyWTx3cgoOq6bzYLcXByD
	H1OImlXgOo8mY2LKCLe5XjhzCIEn8i0iOhLuKVWpjoSCw4Qddl/4/oodcRkNMDvd3ahLAuaanbv
	n9hwSyz863iHQCmxDXbhJZQfoxjlGNtp3ZyugeMKxPSv1URze2SVYjA8QvhxDoCMhLk+YeDtZgW
	zOrYhWNrH0Z8ivqGLoABtXe4detQ/dds3sc/Ywq21vAZduAz8Tizoxww8U0l6v4lq1nxS7CZl9/
	UQBracCi8aPqPX12t4A1AF7hIZKzQq01qTU5imRYA5TpGsE4KkWvFwJkk9kja5e0F/SEy6PVSMS
	WU+SS8EJfonCB5vW3+M2nHKENdrhsAlSYez1j4m29dltG3I4eEBNvX+//8BWJ0jUFTPpfSLqkXG
	kfcBE+DAIxS2D889+cZy4uSPUVnHDedDjqqkqkXXFhU=
X-Received: by 2002:a05:701a:ca07:b0:184:d593:2897 with SMTP id a92af1059eb24-1993f3ecfb6mr5382379c88.29.1792896534741;
        Sat, 24 Oct 2026 19:48:54 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm10521272c88.21.2026.10.24.19.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:48:54 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 19:48:45 -0700
Subject: [PATCH 5/8] Input: synaptics-rmi4 - use 4-argument
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
Message-Id: <20261024-i2c-smbus-read-block-data-v1-5-19bb97467982@gmail.com>
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
smb_block_read().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/rmi4/rmi_smbus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
index 8b61c2382297..a180becb7670 100644
--- a/drivers/input/rmi4/rmi_smbus.c
+++ b/drivers/input/rmi4/rmi_smbus.c
@@ -172,13 +172,13 @@ static int rmi_smb_write_block(struct rmi_transport_dev *xport, u16 rmiaddr,
 
 /* SMB block read - wrapper over ic2_smb_read_block */
 static int smb_block_read(struct rmi_transport_dev *xport,
-			     u8 commandcode, void *buf, size_t len)
+			  u8 commandcode, void *buf, size_t len)
 {
 	struct rmi_smb_xport *rmi_smb =
 		container_of(xport, struct rmi_smb_xport, xport);
 	struct i2c_client *client = rmi_smb->client;
 
-	return i2c_smbus_read_block_data(client, commandcode, buf);
+	return i2c_smbus_read_block_data(client, commandcode, len, buf);
 }
 
 static int rmi_smb_read_block(struct rmi_transport_dev *xport, u16 rmiaddr,

-- 
2.56.0.257.gf7497c7d27-goog

