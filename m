Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF102C15AC
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jul 2025 21:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752615520; cv=none; b=OnIlc9vr6MCIlxfpCrWpMHUugRsgQy5f/PtwXbOFpYlYI4kRPUugSnXkpwf9ZR6iZBUDQ6vdUmQL5k9bXK4FMPB050Fwa91Y8ptYk19I+1TXf20a9BBRKO7W+40mYoSNOJghmDRV3JaUS2AnAMXHuKBMt+6gu82Rzg9rVa/55qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752615520; c=relaxed/simple;
	bh=JyL4R1VbqfvSuy3CxSHknR1eYch97YermtjR2kSHm9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sSTe78ZXWuCVktOJ0SaqDxAgoeh+Piny3w6lwFKKeeAc6iG+O2Hw1SYUI/KkSeePfyvtxzJsfpJ+MwsYwK1mrreYuL0U6HAxrYb1KYirMc2pz/t4Uw/eM2TXdkIv6fIPfjwTChKMEmxf7AghgN2vOAUe7VUrSwuqBsfPqCOOJ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B0x45R2J; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0x45R2J"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-60d666804ebso159402eaf.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jul 2025 14:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752615515; x=1753220315; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CW88BTU7OZuWR96+NsmA5GyH/cT1k/H4jR7d8mNYgfY=;
        b=B0x45R2Juz38nMq14BBamtEIQ9fsCUYUJbhmWt1RNCSSJzHKsaY5RaOkbwcHU/QTsq
         esaPshKgTlzbnzCMp/N0f2vl56kXb4JVZePz/lcywf515vRPALMgKCJBFQlipAlpn+20
         X+Fp7b7Ez+KdK5E1YDXKVGBO1KBgbujLZ3MolDReOSWbLk04O4GkD/vIWVYWZzA70KAs
         zDn4TzekFIk3/EUQycjl2TE/fWFpcg3URI0O2NXQd9XvWn5F9D1hpvzz/W2au9bAWEeI
         vG8PgQ/MJDRjXKHnx7ceDYgOKglASQH04IR2R2rTGFujhNQtxNraVtP0ak2estCz0LWy
         AJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752615515; x=1753220315;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CW88BTU7OZuWR96+NsmA5GyH/cT1k/H4jR7d8mNYgfY=;
        b=qmdmIl9tqFKW8K4TO+f7GIHabNSYIAssjTuZE3vYDV76dj71uOKYg3VueuSEDZ4iv5
         3Jm+E9H2fys2N+7daIGXifJf9NTTKBD64IYwJuoyaPBrbF12MIcRdtdty9CRtrI/BxGy
         12H4EHOCW44/uPZom3SidRv2d2f8Y8Crv6eBRk+s2WQOsGFgOYrDSN3a0eV/GGq2LlW+
         F2GDSocZbxDy84GPIdq//pc2QYy2225zkxtwcrNSqyvwakIXDPqTp3YfutkMPCwiY1eo
         zDMQK8zrg6+NLRbfAv2lJS7tSwk3wLPQ+STLvwr4iLl0IY+CXkjnaFPqSBcUfhfAoiiA
         wK7g==
X-Gm-Message-State: AOJu0YySBaVu1EVNVFUA7iLoqYbUT/F2G579ZKj4US+cJdBKqi7zX1DE
	dfE+J6EnnratMQefRE78CiKQf6IOUMU73Muaxa4wSSlo36VL4umXKwk9vLdI7X3Y1P4bYwzHZK8
	rG5mA
X-Gm-Gg: ASbGncuPdcHgaDYv2A08eQGfrlHTwkg7vFP3v7eOhitZ8Jxm6or3NtuVZXza1F8dCyy
	i4tin62iQAuC8gHrwhb5Rid01cLfDmf4f+9hUJ20zBDcU2fhn/EBSOpZAaBXpJcIAz2zs2wZdct
	6xfGvNbM4bUCO4kwv97XDODip8JZDdsjoy1O8JFlRKFXILHELTj0Bh/NOxP2lSiPPNU5zqRdmH2
	z7kSAi+C1rwwHgJ7OpUrO9FSKLuhw7HgiaRYUr/gRvCT6tPaVGCRq631nrNmGLFF+vxDKItV4hb
	CBwjPVCQ30YB9SfaLL7AuvOmdmRSGhrM4O7noi0t+bPGbMwSCz2B9ah8sTJqnk9xZBx8bw7Pe0c
	CkPg5CL3OdF6JLnCdkCBEcg7TqGr+
X-Google-Smtp-Source: AGHT+IHG8u4QluDAJ6ct9kYIaBT/ZBbI7nWwU4qHtGb0F4K460Q/zdsm+P3tTkZHCC8vR5OtacsioQ==
X-Received: by 2002:a05:6820:200b:b0:611:3e54:8d0a with SMTP id 006d021491bc7-615a007cc4bmr732804eaf.1.1752615514704;
        Tue, 15 Jul 2025 14:38:34 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-6159064ea2csm729779eaf.20.2025.07.15.14.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 14:38:34 -0700 (PDT)
Date: Tue, 15 Jul 2025 16:38:32 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/x86/intel/pmt: Add PMT Discovery driver
Message-ID: <b52209e2-7012-4bad-a380-ab37dfd015fe@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello David E. Box,

Commit d9a078809356 ("platform/x86/intel/pmt: Add PMT Discovery
driver") from Jul 2, 2025 (linux-next), leads to the following Smatch
static checker warning:

	drivers/platform/x86/intel/pmt/discovery.c:551 pmt_features_probe()
	error: 'priv->dev' dereferencing possible ERR_PTR()

drivers/platform/x86/intel/pmt/discovery.c
    531 static int pmt_features_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
    532 {
    533         struct intel_vsec_device *ivdev = auxdev_to_ivdev(auxdev);
    534         struct pmt_features_priv *priv;
    535         size_t size;
    536         int ret, i;
    537 
    538         size = struct_size(priv, feature, ivdev->num_resources);
    539         priv = devm_kzalloc(&auxdev->dev, size, GFP_KERNEL);
    540         if (!priv)
    541                 return -ENOMEM;
    542 
    543         priv->parent = &ivdev->pcidev->dev;
    544         auxiliary_set_drvdata(auxdev, priv);
    545 
    546         priv->dev = device_create(&intel_pmt_class, &auxdev->dev, MKDEV(0, 0), priv,
    547                                   "%s-%s", "features", dev_name(priv->parent));
    548         if (IS_ERR(priv->dev))
    549                 return dev_err_probe(priv->dev, PTR_ERR(priv->dev),
    550                                      "Could not create %s-%s device node\n",
--> 551                                      "features", dev_name(priv->dev));
                                                         ^^^^^^^^^^^^^^^^^^^
priv->dev is an error pointer so we can't print the driver name.  I
considered changing this code to:

		return dev_err_probe(priv->dev, PTR_ERR(priv->dev),
				     "Could not create features device node\n");

But I decided it sounds like a typo.  People likely won't understand that
"features" is the name of the device.

    552 
    553         /* Initialize each feature */
    554         for (i = 0; i < ivdev->num_resources; i++) {
    555                 struct feature *feature = &priv->feature[priv->count];
    556 

regards,
dan carpenter
