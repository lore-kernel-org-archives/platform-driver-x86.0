Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219789;
	b=NK490Cm5mS1F1uiXw7dNznx1I5G/PWIfvfa6zq9KNd1C/wGSufvY9dkQS+/eBR1qQO3B
	 jM1hFZCSFUO6n8uqKBvAmAASwdbsxDJ1i+9HFe337DwpwFHKNtO6HM1FRn5ajsTo6vskA
	 CZu/JYjqxFlOkj1Bv4dawwqq4exWx2QvEIJbtTSzNv2SNDIC6nhi+HpuRJiu4JxeuqZ/h
	 P3I00fB+G34fVBqFq8pdyrlbmsX0maSb0lciYfdLNyZ+0kOI9BAU0tj9e10o+twCWV4Ug
	 tdiIIFvRuqMQmwx4kiEhX92jmI+yLl9k5TIRphIT6LCjOm/gJB+1JpzhZxh3h3yiIVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UgYq7nK5M7zEdKPjaX3cHEhvCzK+3haVH16deXhSDxM=;
	b=lzejHxnIWiEXhgvk/nnCylO+5VwIf7sJHklXrfy9RVHLpSYENXlQ0gzPvKypN+YQOGMQ
	 OKuD+tbRbjH9kKT6+DGsYjNPn0EQjFvRfAttls7H0ECynMx9kQ8K7XD/UYTjD39g2g13/
	 2g1KfQFQaXl7zsbmuQ+vSeMwP88WElQ8CBwTIDlCd/te0+DULE3E3YmRbLylG9+VeDzYW
	 W2xa5Xt5bPcTb2LTgFHjemoIqqsTN9mdv8amsASc8mgSTi4SzowDaa6ctp6tHsiw1P86z
	 4ipuiikevNmUJiyoqfVXat6YSgM1IpOiVMevMzM6X0rIPvVS1rSFWq6xDXhMrfAwiaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yQzYziZi;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE82B60A2600
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 00:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE82B60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yQzYziZi
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso809920a12.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 16:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219786; x=1795824586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgYq7nK5M7zEdKPjaX3cHEhvCzK+3haVH16deXhSDxM=;
        b=yQzYziZifcgfpTJ2u9QRa4bWXl+fbyW4UGW6+iDIS0qK3Xci9kf1dfN6jujGJAC7Q0
         AFJmZWeBOjg6kMzaDXOL095qpSxAcbStyoairr/sQujkdGCSI44VGcb+8NsU0ehI93So
         Wv+b7JhGBiNntoFS+huQ/mtAbHYXPG5EQQHHtJSolmTwI0/gDoi6oFpo/Uk4+J4A0LhG
         ke7N7Ckp7XNS+w9ZQXTKhhRZ7U9uXqOLZa/U/4kTqcBbLQzJFrNqelKUWqRvlYFHt0gS
         PyT5swdD7EIiVzxQZ8iVMZEGVDEKrsQ4lDQyGgRxFSLSl1eLmr3KzEdx4OMKp77kL5XN
         QTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219786; x=1795824586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UgYq7nK5M7zEdKPjaX3cHEhvCzK+3haVH16deXhSDxM=;
        b=NOfgbpTRI3r1z4XUeF32ymSt+SDJ7LGHhWfNDNBTGdh3xo4krcMo+S9PhlT2/uvcNF
         24R7faJZkSed8j6RBKK8ellucHQwlbDWDEbQ+9vRopp2h8PPCCvTmtKDxGhbs1n4t+LY
         rpfiFj1Mq95BxQKBuDen3HG0jurhrhWrkzlXZOSDQwXTIDg9ZbKMJ9shOkJlEM/oU3kM
         tzJogRbBKtuu0Fmq/Oi8BIUKVeDGEo3u9J8KKlc5CMXrPsqpTT5VMKWN10hZ2sdzDFS0
         O/C5Zj3MWvcWjrpkBfdrpO2uaX2ncHk9Z/tR15fEz2Jac4Uj1y7/LSw22ydD7an2sN59
         EyNg==
X-Gm-Message-State: APuU4Z97gU0Bz8cl5yoOxLUY/hpQ2yBqy90Qu+UVvmzK/6tb0ZlEzjkl
	ZnjbaSaZ6XdDu5+PkYySDh/oyXSm/a7OxU3ni6uKmK2qyG/BKJHXwWhA
X-Gm-Gg: AZFdTZdDf3JPSZKmw8mgkwb/GOqa+Mk6WbKwoDmuc0l2UcZtVFWIcZJa8Tg46T6oYh8
	d4HTElmc3wAQkhsMZxYVuKzOYzN1u/3rdID2AV3bN13FCqmJumyIcf/KqAROzi3lh2nuXu01iC5
	WIeHyOhaM05tsCn4DSFQnVyxW6b4udGRoFXijng9Oi+wt1Y9UWeXP4rdU1z6vknux8db4B5JG1+
	sW7iEHqWKlusTBlN8Kkl8tEuSk/cM1FJEzbKSgeo0WgN+Ssant5P+F2Qw04Da1Rw2fMX5fG4oF6
	/UnOnY7rgNXDhmw5gYdAHYJ5ZwlTtfWc3++o2RsrdP/dFOD2LLOXemysfB7Yyo3LSnhTgqnSFTt
	xaMTP1zhjSpFOwG8r0KSTP7YdCChtfXglbCG8ZBZVWckz2ittoV4J1j/eEraQS4nDY+/qSAmWhq
	2cCFAm9iH8og5GUpmwoMORIGnICUvRBCvap+AF3FbxgLsSQHfQMVtfOaCn+HFnS/lZwhjOmLSru
	3I9yyi0mgR1npbnXqMuggqpvuR+B0UEQpfTBwi1kahu2zSc1SIuQRtZobOm0yDcWHAvCFKB+9WY
	LgbOnnuRPZUVoaOwtKG9upg3Ewjnn9liy0yRB4FiAKi1ZE0NnZFye84t1uW6cXIljak0yqMV9fg
	WxeXoomi+bUnWiuqemls5f7smvZ5w6Qr0VLKi/IiQjy5kCc2CWkEeDEY4ms33NisBbuURvMDJKv
	srrA==
X-Received: by 2002:a17:90a:d2c6:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3b41c57565emr4384171a91.0.1795219786076;
        Fri, 20 Nov 2026 16:09:46 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc613csm1920509a12.5.2026.11.20.16.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:09:44 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	Darren Hart <dvhart@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] platform/x86: dell-laptop: Parse the charge end threshold as an int
Date: Fri, 20 Nov 2026 16:09:31 -0800
Message-ID: <6abac23d8f9985b55282ee56c97155a67076257c.1795219225.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795219225.git.rosenp@gmail.com>
References: <cover.1795219225.git.rosenp@gmail.com>
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

charge_control_end_threshold_store() passes a pointer to an int to
kstrtouint(), which only builds because the kernel disables
-Wpointer-sign, and makes the following "end < 0" check dead code.
Use kstrtoint() like charge_control_start_threshold_store(). Values
outside 0 to 100 are rejected either way.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index eca348497ac3..c512267be4c4 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -2382,7 +2382,7 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
 {
 	int ret, end;
 
-	ret = kstrtouint(buf, 10, &end);
+	ret = kstrtoint(buf, 10, &end);
 	if (ret)
 		return ret;
 	if (end < 0 || end > 100)
-- 
2.56.1

