Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8421533D6;
	Sun, 17 Aug 2025 17:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755450420; cv=none; b=c11/fML8pFUy2xzJARfwvGXWOOp276ujzmjDGmlVhvHljYctqXughASgRfKpYu7sASnVoZg0sLPsLq/8Yr3r75Rc+8XhFu7AE67x5l3Q3E/gkJTf/mSlqAPlo5JubVZNZdLlPfAohjODmA9HYq5JX7/LkLqTimKGjV8/aA/Z2NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755450420; c=relaxed/simple;
	bh=Br2XmsbFFY0zRV3hTNp7XyuQxAzrFE+0awVd1x/aXmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NeoNbVJGFBoKGKyGnkmGJjgtR3grGdSYwSVCBrmOJfAH9jX7T2EqwApVRRK82Fh6edrh0J9g0JNR0qQ+iYNqMqtTum8YDWjP4kXoWk7XdE3Js09kseyjxi0BgC7jfjfi05Hww246j6b0aBxXzfHIkly1p2jlqU0A4TbP7hGRPgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmUALcBf; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmUALcBf"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e39ec6f52so3065498b3a.1;
        Sun, 17 Aug 2025 10:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755450418; x=1756055218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pOMnQXG5ToDuQ3ZSfzmc5ovOIBEU0+927ucpZsBYdcQ=;
        b=hmUALcBf1UklXiaHJUyAF2TDZnIuDaj0bdvnkFjR+AL/T+OLZu2UsQpx0mHY97c3SF
         RBlxWPUOv7PsYStyZw9XgBD2P/2hA9/JdIjriQC4GhshDTTELqOD0sR1ZAD32sQNE46a
         9UfvTDyJjzJxH1jg5V9RKnc1NQijE+chbh1Tu7tuKRhS7MjnRgITqbu/Xy8VfMOVqoFu
         aEDTKKG0EwAa1qXjCjXaL6XWsP8xSWnFF/dPYlOjkGOk1MSh1CinVAbaZSuxQTxL6y+L
         ptN3IrPxDRskGAP4nEK0DzuQcVaRcVecM8LxWoOUQf+4RlKBOIcPM+ptKJWsx8rfyTei
         N/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755450418; x=1756055218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOMnQXG5ToDuQ3ZSfzmc5ovOIBEU0+927ucpZsBYdcQ=;
        b=iY80Lsx/o5AVeU3b22ajsI2vAQY+9CpJ1gtPJFE+WtaG/Km0DcRTCWVaSVQYBPRdmJ
         M2jsTjJlRPWAB7XP2P9AS014BKWxi25I2E+ZW0V21O74gtKndwlXNxOKhj8i7EB5pfgm
         rXU3Ecxd+Md4xHMtfGMCiOle1bQHEXh2qo4UBz0Oq2LW4CYVqBsuqDakSEbiKa98J74z
         t3aOfAox+rM2e1BZs0auzKUGG26ZDen8fRL24ffhJyYwzcmUwwIfLl8hFCXAL1hXM2lx
         KWDI5lXzVfFjvQty7UjfjltwiLTJYdaSxryrjUro2SdILAP6mmwjivqhZ+iVejp9GbPw
         8G8A==
X-Forwarded-Encrypted: i=1; AJvYcCWR1ndLF5ZwX/S9JC1TWZ41Y7DdPX9VUDvJk6c0pAd0Cl6ZMsxW/u2Zpdvr7ss65YLMi7QHqy7mEWfNVWE689/O0z9s@vger.kernel.org
X-Gm-Message-State: AOJu0YxNk83OGy85iV96TKQ7s/OV4iYxdKvLiP4azdx4ijo3ByCTQLne
	hsZAhvvy223J1xIfW7MGZmfgPYkgAjYTAuevRgS5iJ4UTMg7spYu5iTFKtM8TPqE8ng=
X-Gm-Gg: ASbGncs5zpa0dnxwC4QheB5uQwgoNc56hwBySTw8spqY15SM9zfMCbSUhZmrQsYjhW7
	aJs43pnRj/L/eBjyZ5imemxthjaCrbHXqy0PPSfRgLPlfX+AgkPooG4mvJo2jpv7lbN2lZr83Tp
	lJ4NsrGPSX+agtNIGbYqhnJjek1OZEf3GXO0U+IVkFpzw53YAtojsdL+LKLJqRTumEeNHl7nTiy
	kSV8JaNp8+61CzzjddbQycfwLrjiAn0tOyTTFgIwxPG3Xuf5LJxrBiws0S3f8+yKpJKhSYpaxzk
	kL7Pal4SXQTLJiagU9bzgcLERABl0BafEhMvyydY/UiEvZ5TLRtwUZKSiYFHEib5WopZcAhLa4w
	4X+FXjS8pSBTfpiwyrj4MT9AeyuxvSmo=
X-Google-Smtp-Source: AGHT+IFrsgMBF20YmP7f5fA/MTut1KvrUzN3v+vLQcjv2m2+ehZODrCaZOHa6JaN1YrvWQDzjy0Jjw==
X-Received: by 2002:aa7:8886:0:b0:748:f750:14c6 with SMTP id d2e1a72fcca58-76e447cd64cmr11457485b3a.14.1755450417575;
        Sun, 17 Aug 2025 10:06:57 -0700 (PDT)
Received: from lkmp.. ([157.51.84.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e4526e368sm5408210b3a.8.2025.08.17.10.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 10:06:57 -0700 (PDT)
From: rakuram <rakuram.e96@gmail.com>
To: linux-doc@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	W_Armin@gmx.de,
	corbet@lwn.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	rakuram.e96@gmail.com
Subject: [PATCH] Documentation/wmi: Fix Typo in lenovo-wmi-gamezone
Date: Sun, 17 Aug 2025 22:36:43 +0530
Message-ID: <20250817170644.5855-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed the below typo error

freqency ==> frequency
in Documentation/wmi/devices/lenovo-wmi-gamezone.rst

Signed-off-by: rakuram <rakuram.e96@gmail.com>
---
 Documentation/wmi/devices/lenovo-wmi-gamezone.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
index 997263e51a7d..22040250a97d 100644
--- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
@@ -153,7 +153,7 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
     [WmiDataId(1), read, Description("P-State ID.")] uint32 PStateID;
     [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
     [WmiDataId(3), read, Description("Default value.")] uint32 defaultvalue;
-    [WmiDataId(4), read, Description("OC Offset freqency.")] uint32 OCOffsetFreq;
+    [WmiDataId(4), read, Description("OC Offset frequency.")] uint32 OCOffsetFreq;
     [WmiDataId(5), read, Description("OC Min offset value.")] uint32 OCMinOffset;
     [WmiDataId(6), read, Description("OC Max offset value.")] uint32 OCMaxOffset;
     [WmiDataId(7), read, Description("OC Offset Scale.")] uint32 OCOffsetScale;
-- 
2.43.0

