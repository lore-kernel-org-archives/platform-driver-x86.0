Received: from mail-qv2-f22.google.com (mail-qv2-f22.google.com [74.125.230.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9291FC0
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 02:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957136; cv=none; b=t9+br6giWQBUPoHbNg0bGd/WBUVgTlw2YlANAgHImgQInME1Gpgcno7niT1Q66JCXBI/0a18U+pQvOQrXokMLD+Z0TDPoVzj27K3IRgO6aSTly/g8WAalwv4JdK6BZrPxiHd2uu29gh1npcxor390ir7QRnHMBLp1rJb02DsI5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957136; c=relaxed/simple;
	bh=ku65rsPht3NcHWbtasZ1Z5T+6hj8oFsmXcolUVc3gcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2H2E237pE0ztloMBtg9eQ7qaui3kq/Qs8QBM0nkiO74FbOwJGwKUNFD8v5v/F3E9yW7Pqi2mNquSd4gMyJGUb3tUQGxDELRsvKTTWXyaICWEMbjmO42W2zLmibVRXhQskrcQWBqiZV7HqwsAXR2YY5u7CjZXyBIbdE7LYy0318=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQepAVDo; arc=none smtp.client-ip=74.125.230.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQepAVDo"
Received: by mail-qv2-f22.google.com with SMTP id 6a1803df08f44-91205165f71so17112156d6.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Sep 2026 19:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789957134; x=1790561934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vzx8L98Gb7Fp0ZMYaE1k4F3qR4UqlmOOTj29Xnzad1I=;
        b=mQepAVDoRfnFMlJYovoN1xu2A0IT4DvscwEMSkz+QbaPI8jCUN88v7ZwGhUc3VovrF
         tlBZJDauW9rXfH324YHdJGtymt6DfORU21cDg1h5ZY9wKbDVMXieEppCpeibaoUzQkCP
         QTYhJDBc+0C+MNpRcbAR7R5GE+lV/YajVRMQIPzuZHYTKg0gZt9qiNu4y5XyBpUmGh0r
         BwgYulN7FP4A4gcZCZRx1jk1DjPnqOYZF1RVP8pFJTWHvncI09gx8PrLv6HFrSMe35FA
         qsxxEg4Rtv6G+zBcoPM6xrJ93jjQWNn+YuPxTss6sCcvc6KjfDSWDwqy8KsBxJZNbf+U
         JFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789957134; x=1790561934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vzx8L98Gb7Fp0ZMYaE1k4F3qR4UqlmOOTj29Xnzad1I=;
        b=lL+pEFmhmvMlXaSq3T6qP7hqdh/zRLcKNm86Rs3lqlPnmhGq3+rQ0LRNT03Ag/zthy
         4knVinkGeOw5qhhCvml2m3WUwA7qmCOPXBCgY5vpiDxcE8IFz8qKndt0Aev5psjLVkHv
         t4+p9mgE+WfUPsWDE28TjnSCFF+HplibYlFNMFzxJhW7z3ecSUbcGhuiyMjXLxFMvdER
         +zk8hpF71VJ5dJpmEGTxJTSsoktszN/nV/ag3thfU1TlGmGGhzpWvgeFqfVsPYmoRTLp
         w+PrzL+h73vLF3qQs2dQE+RdXaoy3dd7Nk4Gjv1tlmJsAgw7fPP5tMK6cU4ZhSulTgwG
         qquQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGJGcN8N/37drwJPpMTd3XtwUfJ/gjS4xIOOLVVLpXEamXvSCBG8U44QmTBkR8l0eHUXdifUI4V58FWEtDfPbnF52S@vger.kernel.org
X-Gm-Message-State: AFuF++leaA+hgpmlQUGutsSM3HCK05Ui+22T/Sf1O6vJ4L+D9x6msG8L
	sWOSvgIECAUKzrXb/Lpems4nohthYlhUAh8DBe5gICFyOiE07Wuj5w8=
X-Gm-Gg: AYBFou05VPtgQyuFXBkmQNjo2rRIYRrDHwl04d1ZjL7lxQAMYFW3/nBUIQLeJjL9IM3
	ftOU3G/DlFOHAt8fFvI/0oWV2BdKwoSvdCWpNHT4T0CigUF7MRdbHwDrkJOeKCmSi1ZyU6h/zsp
	1QX/STbzV9mAXO2ZDhIms7lj5vn+QPE70HRDn7AIicTJ2ZBQnZldarMg0J0WOfQqb1SNGoQa6Vz
	76j7Hb2v3mRqdIi2lZybNbytQoPGQOF6ejGOeTkuWVv/vXWiAMHJaLEWHxLBJW9bv587DHJ3oVW
	Aj247mEKHSon/ZGac7Vep9u2lsTHqeYBYzKE0GMoOzsntmTLLVZo1Hw5/610UqJ+Ryk6ha3diqP
	OYxVzq8V8hOWBXKAaNErTYIp/InSwuKE0DTHqA9vYxFNEEBUUuA1qqlQYLqqozdxgDy4mg5p8AQ
	kHH6vKOOCwB3c9VKQzsTRAWX6WQwzYZ6tEDIoy6pM/9+PTon/ZblW/jfDTgUzXVR+ZFuDPyF6u+
	7XVdfmmzxkVn5T6b+uZuLci4CfFaVZjFkNxo9B0/SMMuE3GbzALlfUf2xEri+Vd5CydIiV31IrL
	KvvzdqPedeco5ok94X++w4ftXffH/ofLGKtT45g=
X-Received: by 2002:a05:6214:5882:b0:912:517b:7be4 with SMTP id 6a1803df08f44-912a803845amr92378216d6.47.1789957134416;
        Sun, 20 Sep 2026 19:18:54 -0700 (PDT)
Received: from localhost.localdomain (ool-18ba9fde.dyn.optonline.net. [24.186.159.222])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260aa15cdsm56221876d6.41.2026.09.20.19.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:18:53 -0700 (PDT)
From: Justin Vargas <justinyvar@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	jlee@suse.com,
	corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev
Cc: W_Armin@gmx.de,
	krishna.chomal108@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Vargas <justinyvar@gmail.com>
Subject: [PATCH v2 2/3] platform/x86: asus-wmi: Remove unused platform_profile_support member
Date: Sun, 20 Sep 2026 22:17:19 -0400
Message-ID: <20260921021720.5976-3-justinyvar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921021720.5976-1-justinyvar@gmail.com>
References: <20260921021720.5976-1-justinyvar@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform_profile_support member of struct asus_wmi is assigned
during platform profile setup but is never read anywhere in the driver.
Remove it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Justin Vargas <justinyvar@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 711f59c1aa6..3e630312139 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -320,7 +320,6 @@ struct asus_wmi {
 	struct fan_curve_data custom_fan_curves[3];
 
 	struct device *ppdev;
-	bool platform_profile_support;
 
 	// The RSOC controls the maximum charging percentage.
 	bool battery_rsoc_available;
@@ -4332,7 +4331,6 @@ static int platform_profile_setup(struct asus_wmi *asus)
 		return PTR_ERR(asus->ppdev);
 	}
 
-	asus->platform_profile_support = true;
 	return 0;
 }
 
-- 
2.47.3

