Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D295337682
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757599994; cv=none; b=uWUjCRFCYJBsEV8Gux2ERbmyFaaSuZ5RT09hxENPk9h4iAddM5YAHwJvB6cY6ZwROZ1OS+4YCEIv5TzKVfZn0r+uF/E565OkBCY32dcqv9WXlic0L59Y9XTsfPb3Fr/GJ7Nr5/poZ+PDzgcnAbrRluLbO736S3QDCUhlRJBF5gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757599994; c=relaxed/simple;
	bh=3sJAiwFDTGoPglp8BEUZn5NCqMe11hpfvRmq3s/gQCs=;
	h=Content-Type:Message-Id:From:To:Subject:Date:MIME-Version; b=d0KgGc50pNrOjrveePq5ctHuHnSXqfXKVO3+E7PXH+8voDeXWtQE5rIglZAhQGYn2JXEpMSNNO4WgW2sja5PcekxwWz/Mg+PgGhhyhcIOTd8c4WKcIv2/nFsB01Fg7zbIaQyHiDYY5FBoRIGZydRMdUz/Dg7KYlr9ltt6eKrlsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJtOZnXP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJtOZnXP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45ddfe0b66dso1601975e9.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757599990; x=1758204790; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:user-agent:date:subject:to
         :from:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OcAnTzjFz6WYD7ARxbtJyu4G4O3NEvA32iyOHj5NWnY=;
        b=BJtOZnXPNcVYoYzTaFjFoDoTIRpZtVLtshJHjHRM8w+nyTzHqD85Hx0j2iFxKlJWku
         2GL8p2G5vXXPWE4ppYH0+/Xl/tL2exTQhLt39/r8+N7GvP9vEmkqjfT/pjCnIHa0dryA
         F6grDGaf70sHs8CTRktr7uxsNkz58iiY0Xs3+QkjzcjA36byxnA8L/0VCgZVXI5gTT0K
         ExfrkOCbLHNhnw3zS614/bD3eZ+T8dlVTyX57Pf92iRdzpAikwOG5ysVxKJueNWqxvv8
         OiFMF+AQNHsevJrTPsBBz8fEN83h46eNSSnOZD4pZhnwiox9WMAOVj92Xmi443ZYnFog
         zXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757599990; x=1758204790;
        h=mime-version:content-transfer-encoding:user-agent:date:subject:to
         :from:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcAnTzjFz6WYD7ARxbtJyu4G4O3NEvA32iyOHj5NWnY=;
        b=RhqNOsFLNbB3yQoroW38XETBKGFlnC5WxsgPIEe273mif8Vi1Uk12yi27pf8/nRnGc
         VSfm9yVeyzd6/2z6Z/l3mgverTYkyLLLB35imCYWlw+h30XI6ceiZ3Ps5AETKJZMVtsQ
         g618pWauuvLH6MkvQ2R3niiTQ2XKQJTdURmnFcOEWQMb1Ru0W7SGnvxA2ZoufA3nzfIk
         TSx+AANkmQimiQoTA5DBaSKdfpyDfXzXvvb4orclTUjDUdtU690RnDYpKLU33GhOqaQy
         QpwqoihjOBF3m01zm0T/iSuXeDXiurT4DPPbLkrFqcUSrTl+oWSEc0SL0ZpCrTrFYC+v
         CPvw==
X-Gm-Message-State: AOJu0YwXP5bXRWgUMYQ4505lr+oaoGxWKTELt96w+pOwhINhq4CiDDVc
	/C/Ty7meU7Hl1tWMIG4QkZsguW4LqhhbqrHOp5XBTCVVcnEOtikDOGPZQo8WXc3a
X-Gm-Gg: ASbGncvdjqLEXsJ5G8Lh4zATukWGJ0wdBP7lzjtHS0n0V+osrxjWLRl6R19IbnsHLYY
	5y1fRL9ve67CdDy6grF5KccPSQr3OSgIwsVume+tnQ3vvJzfZJ6kSjxz7XObqADUmVfhVxDWBxJ
	1lTlzIO4UySEUkEaqDL/0MdGdqGTd+YO4J6aQ8KnKH5zZJfreYGa9bDRAi6NnKLmHFr/uCJNLTg
	xaVVkyfkC6sqesMICtw7pjMlSFa0ZtYhHnXhj8oWEsbMRir09xucE+WAqJGjU9nxieRTo7NfGiy
	tng41skeZp32gu/2GFj72cBvSpUk6nn1xp9aBQxCnamOKlgh7HCZXIegDnDCgviLpOWSAToy2iY
	AtHq070Vtm5CGbbchskUsmjofCbXkJKXcxw==
X-Google-Smtp-Source: AGHT+IHmrkWX8A3dUo8RhcFCTNgrZwDk+6uoXf91B1ecpZp81R8lrndXJWYtUabjsDrEwyG3PNx5gA==
X-Received: by 2002:a05:600c:870f:b0:45d:d401:2777 with SMTP id 5b1f17b1804b1-45ddde84ce8mr92867945e9.2.1757599990137;
        Thu, 11 Sep 2025 07:13:10 -0700 (PDT)
Received: from noip.localdomain ([2a03:a900:1000:22b1::9d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd329sm2663478f8f.31.2025.09.11.07.13.09
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 07:13:09 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Message-Id: <1757599473382.2879968666.2275695113@gmail.com>
From: =?UTF-8?Q?Tom=C3=A1=C5=A1_Hnyk?= <tomashnyk@gmail.com>
To: platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: lenovo: Reassign KEY_CUT to
  KEY_SELECTIVE_SCREENSHOT for Ideapad laptops
Date: Thu, 11 Sep 2025 14:13:09 +0000
X-Mailer: Vivaldi Mail
User-Agent: Vivaldi Mail/7.5.3735.62
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

This key is produced by FN+PRINT_SCREEN and as per Lenovo documentation,
it should be "Open the Snipping tool". This corresponds to
KEY_SELECTIVE_SCRENSHOT, whose keycode is 0x27a. Previously, keycodes
under 248 were preferred due to X11 limitations, so KEY_CUT was used.
This is now being corrected.

Signed-off-by: Tom=C3=A1=C5=A1 Hnyk <tomashnyk@gmail.com>
---
 Fixes https://bugzilla.kernel.org/show_bug.cgi?id=3D220566

 drivers/platform/x86/lenovo/ideapad-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c =
b/drivers/platform/x86/lenovo/ideapad-laptop.c
index fcebfbaf0460..556d50fb7996 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1328,7 +1328,7 @@ static const struct key_entry ideapad_keymap[] =3D {
    /* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() =
*/
    { KE_KEY,   0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
    /* shift + prtsc */
-   { KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
+   { KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
    { KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
    { KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },

--=20
2.51.0
