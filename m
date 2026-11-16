Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873333;
	b=m543gxs/bOKci7KDzqqPBzsDX1OGG7uRGyjKfq9B3bnz1i1iifO7+sHqPznNRZEtiLKz
	 blWXdU4XlwdOJNq31UR0XNAsfo9+hoAdGeydPsgM6QXFKZeaPIsXJjZFPYVMDlJXdPcDG
	 L8kX5ZfxNjdBt1NKpygAcag3R7MFQRCP1U6dyz6Sx01a6Y6tQz9XJil0BW7yFtMk7YHcV
	 b90TIhhiEU0ty+TwqKBgBNo1S/tuE5iRz5a+5HLgEcLkGMXNDA8YTI5F+OPPPJFZS88ce
	 U3/eDz4TkeoathlNEX4YMAcN+NJbPpoPp9S2m3q5S3TjD9EgOzwLvG/q3aoTvqUvxtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bS/2RDW2igo45r0CTz6bZ05pNhIZKU2+gyV2Ax6s510=;
	b=cjnrWEWzMINrq8SsGwpHEQLB54bvM/4auR+gXqj64vqbNWEHW1JKsJtjrO6RXYADp8Zh
	 NIkRvdZQHIt2+Ye03u8MUHQuDChqz4WmfQS86iaGR9EwxQmec5N1701k7tRhR9eqTWvEH
	 lJCXPxE36l0DEZRA526VJQ+GvU7xcSEOPl18RW8tsd28dX23BHbMjRe0H0XXDD0IUGbhK
	 /Bo1vRy7y3hWKFOvUZ7w+y9mbmfaCLgDt5jmYENSI7Zm7bTM2wBi6Pdv1njNbod89Gy6Y
	 T/ajBKaSbDZxLtmqQ+j9ORnhS54EqEz0s9nExe/fGnxxPctFzYIBnUMEI80muDc8rxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9sFTow7;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6077D606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6077D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9sFTow7
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38133db970bso478928eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873333; x=1795478133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bS/2RDW2igo45r0CTz6bZ05pNhIZKU2+gyV2Ax6s510=;
        b=t9sFTow7OQskJmaXw11vgeP1tKa7M25aNk/e64cK7lDRu7q+70C9dkANG6rm/t4T2K
         yzU1hdLzXGiF+1w/+FPqjKLt+yrHkURxJyftWMpSTyNTTZLMJnBRbBDaJBwLBi7CxbqQ
         SiZMauF6dbtiMXDbw0qJ+uuSJXJpM+M9LgciO5r8aB1vwlqokptCnkmF+soS+Nc3Muza
         7LD6a5A1MbgL/a+50f6Biqcel3bnPoQ/AyaxyBgaq9eVG3c1+BjcNcCypAgin0vjLnQ9
         F8tFBBtm1GuAipzswKZ5Tz2FWPRbSNFWkQLRHHplNUtcoy83RNDkXU1BghS6vhHyX89w
         5crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873333; x=1795478133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bS/2RDW2igo45r0CTz6bZ05pNhIZKU2+gyV2Ax6s510=;
        b=zy8v9C31u9jKbkbTbtJ79PfoQwJsFHRHXhPqcSgTs9Xud/cj3632tvBV8VGBh2hZD8
         wCozaK0kpJa0zSBkAZZqsxCX39fBMXMsbxJiltPhgZ2B0RQrj8ZppwmXsii5NGrgEl5Z
         F5vyleOdN+E6373Ik9eWwQQ5hV5P+f4qRVX6sS6vLrpNKWfeB2tr9DrqbfzVwOX3O2mw
         THDDtC8YJSx1cuqzpC4YqKVcXQComTCiAIbrhfIyYABYnTraxQMtZ7LlXSHO6ofGUUlj
         z00jQGEBR5++zHAV3mry+wRLgU284qNFQ617I9RMEGpxbfSLn7FRhrKRmuPID3HFsCOU
         CXpg==
X-Gm-Message-State: APuU4Z+Q+ulq81nywGX2Wo10r2Gmpu/o2qKeESEqiWvYwufRBQIi9HU/
	yXNETI/W3zDzJCpcV5SlDf2cu1aqWf8NJPmllNVRKQ5T1x9c7fXXOVKN
X-Gm-Gg: AZFdTZdTELWJJifS1lKvBQiVz+X6p28na+1Rm0auGHOlcCvyqBC79rP18j1zZBoAFof
	X6e5T4wMR229H/uTpJZzfmIJjdJo+OGLEBgfukv0Sq4ygHEHakiM8mfDB+h3kMRtKZrhlqu6mMq
	yHj9y1UB/6+YAYwM/UoixaD56uORNHf2LpaSW5rh6rQ27y+2QdnattscJrDPZ3Ca+e8CIzp1t/h
	iqwFWxkuzIX4+KJ1hXzeQBlESln/elCSPaSe6rTTiK3yh+pqV+6+fz7rCHorh90EL9oFKz2BCSi
	x7/oJ2d+Z7EnMNap7kYGnogQ2rTWbSj7ICZICtP5fek3Q9cugFpNfAPupvXSDC0tSfc1dH01ckv
	gsoqyF8+Hu6xq5GanERghejK+ynqiX7BXS6+Honf0xdXcUipRG8XXDWR9U3kOqweHS6ZjFCzafq
	71MsrEAUwT6vUSCvrCnZiIqF0EbxiFvDlcc2lmDk4yS13iWfSztlB0x+sEpNHBsjXC0PVMEvoLJ
	ubx8yi4Jp8LuPnr8rnCGvQb/XdkvjETeUkOC3qltriIKOkOZM6rW/yR5j0d0f6wmMSSvda/D/Cn
	k1Vi1S/78vIf59nMqMcj6X0KVS9XWYpVtlUOgrfJp6uuZvbnbb6Xgas3/8m3vth+HCrKzmeBLo4
	igCv47pix/qZ0YNXOlt9LgHHfufw7Mi6vi6hhHzubY/laWTyaMx2lF12ClWKhud6+VR6hpZEJKy
	NxaA==
X-Received: by 2002:a05:7300:6148:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-37967dd7e1dmr18667670eec.34.1794873332546;
        Mon, 16 Nov 2026 15:55:32 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:32 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 13/16] platform/x86: dell-smbios-wmi: Don't let unprivileged users flood the log
Date: Mon, 16 Nov 2026 15:54:57 -0800
Message-ID: <8d5fe2db48c7e1b086358a6f41eddf5b9df7ae96.1794871007.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794871007.git.rosenp@gmail.com>
References: <cover.1794871007.git.rosenp@gmail.com>
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

