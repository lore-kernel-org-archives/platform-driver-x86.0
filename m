Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348620;
	b=c3F17A+DdOVhYcdnLfGghPT24OsgZpOoRUEbwXmfDZG8pqiad1+lfUy4lVEFbqoRxRde
	 q8s/vIYH6ybGfUqVE1LIUL7gLMpxwMF2MHtYKLfVYTkH9Pb+yNN5Gxtw/tkKZfNIizLs9
	 xFc79UeWRRheONHNVvozpucp61+bV8Bhfq2oAvZfbyNcgQY3HaKfHfeSFZCbIpBlBlgv2
	 gtqdU/qhwiUSmLWsdfdC2naEU97D/fEOM1YEg7OSFuoR/TZlhH12oL97dJK2r8b/Jonb8
	 viE/GjfFOQ/oPw8hNFr5hgiPUtH47DRlsxTz+Jeb7ZIMJNsAL17IzAyST5F2Wo86ZPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zKfMVQP8od4iZpgtVKrymgT3rG+VRxSX7EBWgqm4V80=;
	b=RQCs1xc4nJzdWQArmAjwUAKhbpwjjnmOs3o/2hLXXikDNJ/Pd1NYb0Hu7C7azPvriPi0
	 JSDvmn7waL0ErkDxDaK1ELVdjQsT7ffzFt+MVux0l4n2gSkGCgk58BDnSCvI5o6Jp3Gix
	 DG0UiMxG65dsbAWt1GUkZ7E0gLig0eJPj0bqRz/OaqKUFZg/GT9GKHVMAWijs47+wgjZm
	 Gl2zQKLdcAaAJkPB4YwlEp5IX+O3A1qTt/bCjhVfEqRmAW4yp3pGVr4LO/Qg7QUFEyInO
	 70pUTf9MY9RbkknQ3SLlk99fUq2mARfgpdhD2bh/N6AGf7Httl+QAbF3ElrAOFCYgvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L/1GsL6A";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4F2606A31A
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 08:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A4F2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L/1GsL6A
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-369f33df08eso976493eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 01:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348619; x=1793953419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKfMVQP8od4iZpgtVKrymgT3rG+VRxSX7EBWgqm4V80=;
        b=L/1GsL6AlrMsRx+CVkeNq4CT6jAWM2QzQbsEeFBy2FlY6IZLlFeuQzVwKhsGa54ijB
         R0Dgk60OVk/eFruyRAZqC74HJYdLoQwJd/BusD9ktSxb20C8+NMxui3NafEGL2fkGLFt
         zrStcNzrcyD4X80NgGkDL0IgGSZGi87M+oXiHJzMK2wJQmRvQ2aDNZz7/DR3SvICc2Fi
         rcyGTcjcVk4GuM+BrpE9XkiyC2EdWYMbcZQg4C/wtgFambKwIkzbyNir/sa16kvMLmB1
         /rG1JmuBfyPJ3dBWdVsVW0dU+njlKxfI+FOlmQKc7iC+CBRYiKTW7tVLRSQNQwHOOvp5
         lOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348619; x=1793953419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zKfMVQP8od4iZpgtVKrymgT3rG+VRxSX7EBWgqm4V80=;
        b=iOeutH4pZ+DVX66+YPAmd5P81lIc6fL4ip45MaH+3UWxk46Bw+4Q/AKqW5EPkW7i2E
         uapOuDDTKZI4QBTQkkI2Xfls0vqaYsoWF9/f6TDUl4/sfuLEqRPZ4hQv84iJBSa7CF/3
         d8SSztyJQHX9JMzqUNHMlrcROYp0xVKfi2A1h3JQMxg8eTFYom3a5WZWb10CHUX4VkOG
         SVL+2T3i+O3LxaDEceStVuYmeDiOPZqZ9cAWf1oPyX4JpxwJWHdfE2tAZRVPqVFaJPUg
         lVy0ceHyarKaIk3n+I0Rfoz/hI+sRp+93nc1D099DdiP/tirI3BuMEUW1dx3dW0OnRfQ
         UP1g==
X-Gm-Message-State: AFq9FYLtdeJ+02TixVTljCbRAAb/royClws8V2gf2qNfLOLW3+7F59lF
	CzCR+VAWzZlyvr3NyafdQnNArAl8oop3/+yaUxD9QLVwndu03S60TV6n
X-Gm-Gg: AYBFou1IWquh9uOzWvRPmAWR7b5Be0sDHHX8uE2XN2RlZdzP+baoV8SeKkOhezMkLch
	A++//T4txj98MIMPf/m8pNRPqtM7UAKuKfHQXzE8Y9R94xrcxCjXW7NTgnBGCv6iLiBIH2IO+PM
	6MYxaNXTgZSFGZhr5d+fLsqhOQcafmB9T/GVGW7Xz0vcIDCfgXBl7FJl92QbA1MF1Q33+NieXlO
	3HJLKuoFsvr3Lzgfbf9AJ3mGFDuDUmKfVtOy/rhod+FtDa8LVG6UB7ddC/5paAEJG2b0ucnqgMu
	4qMckzwcygdUy1y5YH3SdBwnqGSg0oD0ejeR5wL+hrwUh+4vg+fGjIccrro0Z27VrE7RXV8Oe+w
	o7PZGd0V0ymnRLXfZP7VDfDXo7J4D03v0l2kLakHmGkGX6ZloAkAmnsj4Mz9QUXNhAKk72awgmD
	KPkJwTTvcHgDTdkjbAtjH+bKTBQjCF3R8BcYJgKprcPVMI1gyLEXc7IllF39OtJvuGRLxZpkyYI
	kXBoWFV01d1bs7LEQqvKpMgdDNQ9SiHfUdm2SABtmmKAe9MEjCFex4wzNRQFVr3RN/B1aG/Pz1H
	9CmDn0iBBEs05hGJiTrmgQmmHiVmuuvbXaQ79aWKMLPzM66lGILzK0obLZBXsiP/tYwRNYuNmKd
	PWkDblTPS7Mo=
X-Received: by 2002:a05:693c:400f:b0:369:f72d:1010 with SMTP id 5a478bee46e88-36a423af96fmr2930709eec.18.1793348619040;
        Fri, 30 Oct 2026 01:23:39 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:23:38 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	srinivas.pandruvada@linux.intel.com,
	david.e.box@linux.intel.com,
	irenic.rajneesh@gmail.com,
	qipeng.zha@intel.com
Subject: [PATCH 1/8] platform/x86: isst_if_mmio: switch to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:52:55 +0530
Message-ID: <20261030082303.284271-2-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
References: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
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

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Replace mutex_init() with devm_mutex_init() so the mutex lifecycle is
managed by devres.  This removes the need for manual mutex_destroy()
calls in both the error path and the remove callback.

Since the only action on cdev_register failure was mutex_destroy(),
simplify the tail of the probe function to return the registration
result directly.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../platform/x86/intel/speed_select_if/isst_if_mmio.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c b/drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c
index 950ede5eab76..0a3fdf6b8bca 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c
@@ -124,7 +124,9 @@ static int isst_if_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (IS_ERR(punit_dev->punit_mmio))
 		return PTR_ERR(punit_dev->punit_mmio);
 
-	mutex_init(&punit_dev->mutex);
+	ret = devm_mutex_init(&pdev->dev, &punit_dev->mutex);
+	if (ret)
+		return ret;
 	pci_set_drvdata(pdev, punit_dev);
 
 	memset(&cb, 0, sizeof(cb));
@@ -132,11 +134,7 @@ static int isst_if_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	cb.offset = offsetof(struct isst_if_io_regs, io_reg);
 	cb.cmd_callback = isst_if_mmio_rd_wr;
 	cb.owner = THIS_MODULE;
-	ret = isst_if_cdev_register(ISST_IF_DEV_MMIO, &cb);
-	if (ret)
-		mutex_destroy(&punit_dev->mutex);
-
-	return ret;
+	return isst_if_cdev_register(ISST_IF_DEV_MMIO, &cb);
 }
 
 static void isst_if_remove(struct pci_dev *pdev)
@@ -145,7 +143,6 @@ static void isst_if_remove(struct pci_dev *pdev)
 
 	punit_dev = pci_get_drvdata(pdev);
 	isst_if_cdev_unregister(ISST_IF_DEV_MMIO);
-	mutex_destroy(&punit_dev->mutex);
 }
 
 static int __maybe_unused isst_if_suspend(struct device *device)
-- 
2.43.0

