Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975960;
	b=zw+a5myyKHQfNIQexE910x0nGKYYz35XsR7XBOnv4YtCtzMPU+HFod7gZiczGPl0q+2H
	 7Af2RngeGbhTaMxbO7uqcadfMTLbrmCgh1TPW2vlTEewR7TvAz3ekBu1YSIjustmtPw0k
	 ATklr+Wrf8FWrPhT7SFvI0cucE/pG257BwAtJxfy/Y/tErWViEopZ3NZcdF0haCRhSfoy
	 yssonyRbNNn6GLP2fLOuCvNj1bxIOq/+25py/XZsrUTVEDHktGABvCDcO2G+r6IlBQCCN
	 HoiBYA1EhUioW9+jrhXBMNU/PXgQ5rhdezv49L7pDpxHnXO3iljI4t0KQeWKwW8UWOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bS/2RDW2igo45r0CTz6bZ05pNhIZKU2+gyV2Ax6s510=;
	b=frlDFt40r8mJzgwM9evmLgxvb1b+5UaWhce8LJq5BghxBngtj/aeHGBRK8aHSeotRO/W
	 9HCnbeR4Vizq0UamTnCJxNi/kbT997vW9y3O/RT65WSmvmZZN8mT1+oYhFtyCPrPpGGyS
	 ZalHnTYGt11jUgc3jV8hasnTrHoZjpvEHUP6Cgn6JoT8FiaXOWiYqhbFpJcbXzD67/z16
	 4JNwhZ9yFhcdtvv6nHRYBxHzKbKH5pMUgY6ks1HDrY3IDti1UdrCoz1qIB+whx9Mi1FXh
	 dI0OqVCe1W8xeAssLYgWx3iHWWrfykJkzJ2ISiaT9Po7z+Qw2ySiAA/fm3csW+w9Gtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TTAAzcAB;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB18606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DB18606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TTAAzcAB
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2eb18f4da15so2215435ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975960; x=1795580760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bS/2RDW2igo45r0CTz6bZ05pNhIZKU2+gyV2Ax6s510=;
        b=TTAAzcABSStHoj9yxoNVK8gfTwN5/waG09IOkEDMAzaMTPsvxsViPBQ4ujuOqr2e2U
         /xWINKyt2lmLyZpvQluT5JfIeroL7ru8/srC0EpseV8lJ6pznUH6T9X1FFMw4bCWIp3J
         8Xiugm5gBY3oM1HdcEw02eOFvwvYXBLP1+k/oE1z7n0gfu7k5vHlCMtoODNayEP+x8KU
         yCZ5jzeRtB99JoGf/3bh/NoOr5oi91DwF9iEWnYIb5jn1gSQCB6tuOjoPqdkFQGFsmsg
         c5a7/d7M4Mzqs4l+J/bJBRCkYY1B0fk/DAbkw2wYKbmd7p1cDg5WeA0N9bmeuk/+/0aZ
         sVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975960; x=1795580760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bS/2RDW2igo45r0CTz6bZ05pNhIZKU2+gyV2Ax6s510=;
        b=pROiWewO71koWbzgaIbqUEs1Us9AwFQtng2gmsh1nu0awoHqq2XuzcxxvpRX8npH3H
         Ra+vd3ZMZSp5pYwXMxlPB4FFhLjm0ezoE7g9cK5mU7W1QxO/Jaooszi5f9JFsRR0eSpI
         B2+i0Q7WYCQr1Z6qC2BXPFztExFnimbtcXDpV+F2KmQn0J9MBeUMBQIfqnjblJPmav6E
         lRr9pItabMnpI4oMNol8e+Z0ZGHVTRjUBSqJYzx1+Ug0W9qVpW8tsgQbpvufgzrzS30N
         oCewW+SDD/ppTWSn4/4Au/RuW171zerKOZXIRnEEdJGuibw7mjzp3/SiZOPz/glj4Wgp
         9eXQ==
X-Gm-Message-State: APuU4Z8NJq+N85C3MWSIHqlEfMTsL/3OiMnbQorWe+J5+BrVHbkHqsRH
	dNOrY3RZv0k6DJ3ks+wmaB9uphZJ3V0YIZc40y4/Q7fAAwjKb4FClRV0
X-Gm-Gg: AZFdTZf9f5KxfCZ3UzlSRkC3W/M6auimoCGYbqb+/SmOCiE/D1EgcMJBtZvjgSQTjal
	GWqLyznCBcUIS3JdHco4jJsLah2LKYXhk3B0sdlvKY4po5SzIz9ljyHQCsDtpcEjEBO5ytN8eTV
	9nAQ6dNITGFgm3FbMWUUG9aCrnw6+z2qfqNOV7FgHn5dEj6XwnUm5XlbHOTUYLb+Acv903jo+OS
	Fdx9ZcKi8Nn2P/nhk2UuF+QBGugPRQAcMjOxSDh2Key6T3hMI79i1WHQCZhDC8X41uxDuYfPG+2
	nMirUxSayM0pquXRCO362RDfYg3j9N1rYDLfPWgrz6c0kcxMZq1+qKGCYS9Vo3zgqeKsbEW0GNJ
	+djkPIHZBjZeOvlR97W1jThNclGCdCag7l1ExcEEdugmnO/w+lqnvXQ3SL8LxtU7/oX1xS1heKr
	Ks1VwEP7lorv3BvONpkDE72eavQvubzTUIOp6RykzRX3yvuCAiQgTpvUOlecmGNwp2cCcl0xBSF
	UuffhIGrrU2CqFjKY47g3QEvoxWoFSzSJ/KJpx4l/QRhIBbeVY0i04iOBvuvsjZ5hDhLQCCfxkU
	o/v1is3MeDwEv/Om6VBWKt2VNwoPIrxXhE0h0Tr0kyIGlhogTFtIdXN2m78b9okzigcn+bhJdqO
	CBfo+qw7Jr6RlkuOcghylTkHtGLP8cmsl+CSNV58IF87y87c7JsmRGjNwXO6ZMKmTrkPw81XLdu
	clRw==
X-Received: by 2002:a17:902:ebc9:b0:2df:9655:fe24 with SMTP id d9443c01a7336-2eff74139camr12441495ad.30.1794975959956;
        Tue, 17 Nov 2026 20:25:59 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:25:59 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 13/16] platform/x86: dell-smbios-wmi: Don't let unprivileged users flood the log
Date: Tue, 17 Nov 2026 20:25:35 -0800
Message-ID: <9d602b84e73aa684754b6115e6a0af954064cd16.1794975827.git.rosenp@gmail.com>
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

/dev/wmi/dell-smbios can be opened by any user, and the ioctl logs an
error for an oversized buffer and for every call rejected by the
filter. A local user can flood the kernel log by repeating either.

An oversized buffer is handled fine, so log it at debug level, and
ratelimit the rejected call message.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-wmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/x86/dell/dell-smbios-wmi.c
index ffc8bc87a86d..3ee37a21c566 100644
--- a/drivers/platform/x86/dell/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
@@ -119,17 +119,17 @@ static long dell_smbios_wmi_do_ioctl(struct wmi_smbios_priv *priv,
 
 	/* if it's too big, warn, driver will only use what is needed */
 	if (priv->buf->length > priv->req_buf_size)
-		dev_err(&priv->wdev->dev, "Buffer %llu is bigger than required %llu\n",
+		dev_dbg(&priv->wdev->dev, "Buffer %llu is bigger than required %llu\n",
 			priv->buf->length, priv->req_buf_size);
 
 	if (copy_from_user(priv->buf, arg, priv->req_buf_size))
 		return -EFAULT;
 
 	if (dell_smbios_call_filter(&priv->wdev->dev, &priv->buf->std)) {
-		dev_err(&priv->wdev->dev, "Invalid call %d/%d:%8x\n",
-			priv->buf->std.cmd_class,
-			priv->buf->std.cmd_select,
-			priv->buf->std.input[0]);
+		dev_err_ratelimited(&priv->wdev->dev, "Invalid call %d/%d:%8x\n",
+				    priv->buf->std.cmd_class,
+				    priv->buf->std.cmd_select,
+				    priv->buf->std.input[0]);
 
 		return -EINVAL;
 	}
-- 
2.56.1

