Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530034;
	b=2Pi+H6tEcIPXTy8nbI0Lv2CoDWXfNdElLOuhYZ1ihBpWbVShYAfuVDd919VHjUgsffuZ
	 0nooRabSSlFhwWHZCdPuNE80h1q61FUh7koKuq1qRIwZfAfvZC+JI2yDU3GfGYJrv0nyM
	 BsvKVKLrSoBV9GvrUMc5L+QTSfjrUbiyoL3xQh0F1fFQQBw7P73bdAGAv3PCgNZU6+NLb
	 c11PBz1ZBb1wjeA1tdhMnRvl69XW7Vkxu8NcB+3QTPftHySMfv4Lo/gTCcyv0GSe2a1cX
	 JKkrxudLm60XPluzsDIvLQxrC4rEDMv+45Qk+UjGn1wm0PJ9P+EaO75tkFp4ET6vRRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=qFSdRjnuTS0M+h5Ev17ib7+0XkEHH0B3YdujUMLD5y8=;
	b=s/aQrf5v1ZQKsBAwmrYNSzzvDEVfcpxIm90K8+cWAtQhmFu/ax6KLQ5E1DxoY8Ho53IO
	 iVpJbJrOyn62WVnVGbLAgKnmzRWoeyfmoPhM0JEd6yrmy9ufaPj3Dt/FtmUn9eKQ+SBrB
	 xwDl4kW9mejkyCc6KTibnX9jLB0QsstSMyNMmQ+NAswXph+L25NoMc10CTXdfZie79qcc
	 XYj6KfIofoVSr5u4oInYGLKR+ceXPPVYc4ECkrRDPvGgUAw2d+R/9YIORvAfC3XJs45TU
	 ZQQs1TIuZQOH6VCSjvynqTQ1lbmObSlf/7uyGdfEZPuJYxdLUQy3JbXOVv2OJXVsxlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXmtwACC;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830C5606A329
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 10:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 830C5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXmtwACC
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso18123955e9.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 02:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530033; x=1794134833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFSdRjnuTS0M+h5Ev17ib7+0XkEHH0B3YdujUMLD5y8=;
        b=xXmtwACC42P9UiDFQGQH/f5u5ShBdLxb45g3Kut3u3uyd2Wp/E5GKjV/6nmKGOFcGE
         WwP2eFp1eLc7wwdwH0IzSHaNa3nhEite/NxAMWrpgskgiS4UEf8xe/vSI2aA+772Jt+q
         5kWg2NSHTtOZbCxE1Rr2Jz1z2O2n8EKP4MkV9ktnN5cNmlfxxrhYn18CKzjTJSsgaQbj
         gRDQnz0L5I+y4l4F7RE+c9SWMiGs5uV78TLxObgU8qy1FSisOVikcmrSqXrzlHmztd+9
         kyOGmOrkD7X0sg0LBfIabJ7ueX8vqzBdMUY2okQI3fAnNfXLh4S1tu+iyt9KnLx4Lw/0
         8J3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530033; x=1794134833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qFSdRjnuTS0M+h5Ev17ib7+0XkEHH0B3YdujUMLD5y8=;
        b=OSm5kUO49VEskDaskzFo4BfeZxBqa9i73XTa94BzFS5D532LCxEMet8unUUEyA6fG/
         g2wD93hyRBTba5ANzoJzKrLCsxZkMdwJ8lZgW/ZddKnpdZWUMTGYgX3pGE1zLTrs+O7c
         z/WSy6cF6vOjp/IDMbbJJv9sOaGwYorckyZO3/eaenuPmpF53dO8f5BH5H0ItiRt129H
         eQW6f92lFkpFVMbSdr8XQZmrxh1pZkUBtQOefFLcKEIHqM7JIPX2hNUb7Rlap4s4FF/H
         In3vS4W8oV5+7iZ3JlTo3Q1db+GEK5xuBp8DXipO0NnJ46PcAUdeRhTlOXY72dPkMTNG
         KtAg==
X-Gm-Message-State: AFq9FYJXjeE2/ilsrDKwAZX0KwPQDlb2XQDkzflQqq0moqavU6Jc0OKz
	SXh8YsNti7u/2BO3corPkgFST8UqlmD2b1HmWqe/Ty1Zhm633h8yNWWJ
X-Gm-Gg: AYBFou2Q+H+W1D0zcEqOngr6OVxsxtbb7/uHO7sNk7CQ85Ax2/fRG2fOw+UFpb5WB2x
	8G8RGNLcH9xPFSr4JVxe41foGDCWupA+7rQGr0SoEWsTDEwTEd+YJAgpRN30jBhlS9+6Jda+HkV
	/cwsfj2/EmsimD1ocEy83iHLjCRwFGMl5NHLTS9/spaon7eD8N5B42yRJKx36L2I9G0NmnVlp9H
	AfbKI7ojOXU8g9R+X+0wvUr+03NTh0LlNeTzaWuXrQOEI8g/336LJjDMig7MWld7qz95IJhozW7
	YFXuDcnBx6f8COUDJ2WtGci1Cdj2kr6JDFhT1Cd08VGmUkCThWSe+zVILDOWo/sVrQRda0l/5cE
	h1ro9pVgMkd/UL5J9N668w2hH1R5tA2WY2DaOh9I+9iQBwn5e2/fYaE499Y7rYJid3AAvWkH/BQ
	WTN0XRZK4LaZOqhCeUrJiSgEjJsIkJVDjuQX5l2s9I0feHGcnkLLHnQwHfE+IkblbYZ8lBPYTBq
	ItOdm42R+XAAXRSi80pFN1aAh5LHc9KvmjuYI3Hxn69+8ZwhTiQfCaYr6U0hdCfzD9WWZ6f1MRo
	8uy8Dbp9NWFeuE+EIJipkS4qFbs=
X-Received: by 2002:a05:600c:4454:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4ac17d19777mr157538465e9.28.1793530032871;
        Sun, 01 Nov 2026 02:47:12 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm255602715e9.2.2026.11.01.02.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:47:11 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Sun, 01 Nov 2026 13:46:45 +0300
Subject: [PATCH 5/7] platform/x86: asus-wmi: reject short fan curve replies
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
Message-Id: <20261101-asus-fan-floors-v4-v1-5-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
In-Reply-To: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-api@vger.kernel.org, Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

fan_curve_get_factory_default() passes a 32-byte stack buffer to
asus_wmi_evaluate_method_buf() and copies the first 16 bytes into the
curve without checking the returned length.  Because the helper only
copies obj->buffer.length bytes, a shorter firmware reply leaves the
tail of the buffer uninitialized, populating the curve with stack
garbage.

Zero-initialize the buffer and reject replies shorter than the 16
bytes required for the curve.  Known curve getters return 32 bytes,
well above this threshold.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index b6541183d4568..dc1e69b964c99 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -3631,7 +3631,8 @@ static void fan_curve_copy_from_buf(struct fan_curve_data *data, u8 *buf)
 static int fan_curve_get_factory_default(struct asus_wmi *asus, u32 fan_dev)
 {
 	struct fan_curve_data *curves;
-	u8 buf[FAN_CURVE_BUF_LEN];
+	u8 buf[FAN_CURVE_BUF_LEN] = {};
+	size_t len;
 	int err, fan_idx;
 	u8 mode = 0;
 
@@ -3644,12 +3645,18 @@ static int fan_curve_get_factory_default(struct asus_wmi *asus, u32 fan_dev)
 		mode = 2;
 
 	err = asus_wmi_evaluate_method_buf(asus->dsts_id, fan_dev, mode, buf,
-					   FAN_CURVE_BUF_LEN, NULL);
+					   FAN_CURVE_BUF_LEN, &len);
 	if (err) {
 		pr_warn("%s (0x%08x) failed: %d\n", __func__, fan_dev, err);
 		return err;
 	}
 
+	if (len < 2 * FAN_CURVE_POINTS) {
+		pr_debug("%s (0x%08x): short reply of %zu bytes\n",
+			 __func__, fan_dev, len);
+		return -ENODATA;
+	}
+
 	fan_idx = FAN_CURVE_DEV_CPU;
 	if (fan_dev == ASUS_WMI_DEVID_GPU_FAN_CURVE)
 		fan_idx = FAN_CURVE_DEV_GPU;

-- 
2.56.0

