Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB93E4F4CE8
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416178; cv=none; b=ZQRyIGBr692/Iax+WxrmenUoq9UTDQvAvnqjKt3bVJS+jo4pThZXaisC/Dc8MvQPqQIJoxCj//rlTDrDRpJgzSdNGl1SNeph80R5OBewf9opKb/jqhZa/knW0xzQwfyjlo0MIAmpRJRWFO0oFalnyiyYWGHZfEjXb29zagp7Z90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416178; c=relaxed/simple;
	bh=V6JuOESdlo11Gl/2S3nP4z8xwaqD9faUnTleg+RxuGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K5DN6GdYj+4Za0pz1k5mkvfHShmqDbeHQPrnOdaFdQ7Q7+hRnRt31pEVQYodKsyXZitgYoomFFgqVnNmKhpuTENJxkgK0wdVlvK+vahozymMTmKBh44BmXKl9Ne3PtjU3ApSgeKINtjwas1GC+4+aG+GlDmUCEeAJqC/Z0LZe3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAok/XHe; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAok/XHe"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1234144a91.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 06:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792416176; x=1793020976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uMVfxmGmbk7TOx82CukxIKkrbkQu+OEaYbQ6wWfobw=;
        b=RAok/XHeWd8QZ7TQbUoLtndOTpw02UQoA4LOySKblW3ClVvs0IzMKd7OUNv0SK+nh0
         FZNVR7A6FJVqdmRkUphe1t7XRUPv4umyWUxC0IiwdGP8F1BZ6aOfqzyLSRbdmjSBWSoK
         VOAgy9g5Ls8iE7728M9quF4AgITBeZMgtKVWCzUdNsefQQ+SSiXrRQz8SQZ9mZx5WWFz
         fWLGqvcxS1InbJJpSYlAwzG4Z2oG/izp+pDsT6WkET9Ca3NRyk3HDfuuSWgjBDfxPwnR
         CCKZLhg9yclgdtUBJVMZBSIUD0YrcmxrHCqiTss4jsjyAtDfb/O0mTRJnK+20vyUJgoo
         FjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416176; x=1793020976;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9uMVfxmGmbk7TOx82CukxIKkrbkQu+OEaYbQ6wWfobw=;
        b=Mx0uBa6BsGxi2KMGaytBwvWaHPzq154DZssHlfbWlHALubkrt51v9jqMby+b0IRVKA
         mEt/cN+8ZaQ9k7naO2vxCD2hgg16hAAtYADpBH9zuJakk5itL2Nnxwn03Wx0vYxNL/6K
         523PlH5q3iMDd9ky+kN2LiML9iHOAfYybb84NM+oOApJu0LI0pSRCRNM58w3r9UBpdHR
         XXGmpeIqTrR5YHz51XbFn4OYjDbKo43dpcvbzLV4JWv5lo10KHyzJdbjBX5bpx5u8i27
         0HN8ACrp4I+gSu9LP/KxxhD5r5wMAN0aUAlRx28CLQNwIAFZia8Kt5IY6x9JigjxmFYq
         3KMw==
X-Forwarded-Encrypted: i=1; AKwUvBxGpg8hJ3/u14I/65PceIczpS1KaqwFwjDSbX7HQEIxzxrzX/zjr3FQ9Iqq8Z9gbt6lUGspMWmCRmHXRwbDtTSpJRmi@vger.kernel.org
X-Gm-Message-State: AFq9FYK3NrQrFNnr48R41oqgSqlwR3KnerPzn7QLzlYLieYO2TDW7reF
	Aw5WMaQq+VAvuxJ6Fx11/W+Xt92yelDD/AHze/CA5qYY1E4WZowFKXvx
X-Gm-Gg: AYBFou2EerBw8+7mzTjRo3mKw+24JqsaFxFQ8uZwJGU1Qn2b/mvU5Gt03C5vsiamdCN
	4bu/KVEfQyOizFewEaXelseSXH3UHy5n9BF559ZtqZk1E9VV1hZM62wQb6sSLX8Avgjj3d8UfK3
	lUbR+doFn/KvZmwBuBKb4T92ILg7pAF2Vw0hVlmyklV3gIw2fntLPXvyZjj7bURljkggNYtXbdu
	P25xEGp4VIPF6ta0/ynUxMN81vd97aF89H5qmNvHJQwcCPYZ4uv6ubMQrI2RHRJyERihgzFbHud
	M0joPSyjfTe4ikoOY7e9Q8GKuGWdHnnASDWgE47DxvPiw2DFylU+PcGhP8+S4lBPdtIq6YlY9WR
	dtXEtBlavzIikTomCYEVBXiBbvjTC0Q3Cc2rVgHaYqMRD0+QuLDR+dvH+ejiAfzP1+86fDAryXE
	VL+uBNf+r2kJ7RNnj7dQTomNDK3D7svvhB27r8+k/enUdYLlWdq9nqAUxqLoFOyZS1BM93I8TZl
	A+ptg==
X-Received: by 2002:a17:90b:568b:b0:3ac:a7ee:6761 with SMTP id 98e67ed59e1d1-3aceefc6182mr6486080a91.21.1792416175787;
        Mon, 19 Oct 2026 06:22:55 -0700 (PDT)
Received: from [58.206.202.11] ([104.28.215.70])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654a2ab4csm3834933a12.28.2026.10.19.06.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:22:55 -0700 (PDT)
From: Haoran Wang <haoranwangsec@gmail.com>
To: =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, haoranwangsec@gmail.com
Subject: [PATCH] tools/wmi: dell-smbios-example: fix 1-byte stack overflow in find_token()
Date: Mon, 19 Oct 2026 21:22:50 +0800
Message-ID: <179241617018.5916.3033533776160790448@whr>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

find_token() builds sysfs paths for Dell SMBIOS token files with sprintf
into stack buffers that are sized to the formatted string length but miss
the NUL terminator.

    char value_sysfs[57];
    sprintf(value_sysfs, "%s/%04x_value", token_sysfs, token);
    char location_sysfs[60];
    sprintf(location_sysfs, "%s/%04x_location", token_sysfs, token);

token_sysfs is the 46-char static const literal
"/sys/bus/platform/devices/dell-smbios.0/tokens" and token is a __u16
(always exactly four hex digits via %04x), so the formatted strings are

    46 + 1 + 4 + 6 = 57 chars  (".../XXXX_value")
    46 + 1 + 4 + 9 = 60 chars  (".../XXXX_location")

plus the NUL that sprintf writes one byte past each buffer
(value_sysfs[57] / location_sysfs[60]).  Callers pass only the fixed u16
constants CAPSULE_EN_TOKEN / CAPSULE_DIS_TOKEN, so this 1-byte stack OOB
is deterministic on every invocation (the sprintf runs before the fopen,
so it fires regardless of whether the sysfs file exists).

token_sysfs and token are compile-time-bounded, so sizing each buffer to
hold the terminator (57 to 58, 60 to 61) fully removes the OOB.

Signed-off-by: Haoran Wang <haoranwangsec@gmail.com>
---
 tools/wmi/dell-smbios-example.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/wmi/dell-smbios-example.c b/tools/wmi/dell-smbios-example.c
index 1f3e7ab14..214071f6f 100644
--- a/tools/wmi/dell-smbios-example.c
+++ b/tools/wmi/dell-smbios-example.c
@@ -52,8 +52,8 @@ static int run_wmi_smbios_cmd(struct dell_wmi_smbios_buffer *buffer)
 
 static int find_token(__u16 token, __u16 *location, __u16 *value)
 {
-	char location_sysfs[60];
-	char value_sysfs[57];
+	char location_sysfs[61];
+	char value_sysfs[58];
 	char buf[4096];
 	FILE *f;
 	int ret;
