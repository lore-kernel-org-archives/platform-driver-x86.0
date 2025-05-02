Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCF41B87C9
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 May 2025 08:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746172881; cv=none; b=A/z+cExkxT5SMN8KvLiWBJKR8jJWtWqyIfIW3EH9n2CyniC/X6TrTk6hXkRUpt6/Thp4RpZhgdtausB9O4Yc9wth0YlmYsRfWlYinJfoHq/NAW+4vL4Y3MQ/wuqyO/KMrzFA5tNwZiF3+jChHY0jqIiYh/v30Yrb864cg7swnhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746172881; c=relaxed/simple;
	bh=WfExcOfg9M/vaOyXBzwlC/uhU2SVXhHxfVkiPUQFRgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RWpDxXknrwp1Qog0aeMTkFZZsvWyzRoBh6O9Uh5lu7tjjzTbPXSIwWlQjn+wsIQomb6k/+vMeeWmhS9HFKzgmwoIq8cQWarWNtM6D439bTezPWTBFQxJ4oQvjK5hGDUMsNL1HaoC7pjF6xySOtUz0UdF7RqrQVF2gwjIUUNbNW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XKzY4mPD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XKzY4mPD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso6826805e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 May 2025 01:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746172878; x=1746777678; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CFceC/GPf+ZTGzTTnC7qUDjawZyy/N170c6R52bA7y0=;
        b=XKzY4mPDn2CGtVkie6ZQezdxdfZzIZ0MG0vT8HA4mKKFsW5JVnu2yOFSU4qew4g4ji
         ml8qOwAHgPrrrndpE3R4zvQ9GP5TFv6Su0K8HLCaX6cxc7SBNIJpVumuIPo/mTR3/WeO
         4P3hGac5YSKtVlOdzh3DNA2upkB+Iy77r+ZKaRrjB830bUYK4d5JW7XIkreg3C9kOm1T
         3qti6fqGOvqUcUZayteS0A6JOlZW36bEE7cwpo7XmYN1xMveRGWR5rQqZANKgqHhX8nU
         6v8I0QME1NZMBvMPSQuXQJ9qpU4USHkvXXxX+oQqQYOPuhd0Ns/KqNC0aOegLpUG+lXy
         VYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746172878; x=1746777678;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFceC/GPf+ZTGzTTnC7qUDjawZyy/N170c6R52bA7y0=;
        b=HMQ3ffFF1y0bc4HXy1XrsKvFFMzYn5IWVmx+rayukuJ8lQYdhpn+ag+rDUUA5sGWuy
         VvE7Qn4WjLpYjiGg//KozdyvXR61QinmY6NdE5M2VmY8eNEXl6RlY9U6cnAof0sBCOXd
         1YsWL5oQSDBfIUhZC7qTKFYxsRDT/nxDaYGioqYk2mc1xF7hgKGOWE92WgRmom0QN+VN
         l6Z6rvxYHLIXt+fEE7oxpLUJP4to+mUHADYf+k22BVmxpvIAwfsIZH+d5guiTNcRWRIh
         tsC/atqcT/vjghLcLo7QohO3Cr9YPwdEngRm6mdtHtd/vaBdiBdqScRCF841L+3qd4Rw
         VFZw==
X-Gm-Message-State: AOJu0YxXWcRzaFblY6IvbYO9XNdHPffGHgynmBkP7uJbzbQr7L4l//1O
	7XIJ1sVjUh3ncROZu//DUylm8PWJ8pRKQ35u1pPh1RqMkGVGFOUouNLyRsj2NGE=
X-Gm-Gg: ASbGncvSr2bZdes7UJ0z/ksffqdKLqIb/OeCM10Y3bJ/2eo5ZKpqQqUyNx5grDxorVr
	cqFGbsbIrqeBhbaM8rDxeyPynFu0w0Yd1OWpyp70dRl1NVXmiWReMVg3C8r9ijgbQoQ+zRwV3gW
	EBLIAHinl3P8A+rmcxHKHMY5rh4ek5uXskfhhDGK8icpoIg8sru4rVigfu4Gkg2MdEdPLxas1hq
	ZZqgSpVGEd/RQIze6IA77F/IN25pu+2s2YWu6h4bDu86MzhAG8TobrqQtTG17xJua0ZFacr5lyg
	tdKVtI1B7rdU/nNPyOM1g1xaQwiEwfY9OxVQyzDIFWC4YQ==
X-Google-Smtp-Source: AGHT+IFWzQcdY+o1+M/YzvJbBLflZFaskEGjN0rwPm/sgHwIJc/CH17VT5uAmTKSBUWOmmBRpIMDdQ==
X-Received: by 2002:a05:6000:4212:b0:39c:1258:2dc7 with SMTP id ffacd0b85a97d-3a099af253bmr1129659f8f.56.1746172877815;
        Fri, 02 May 2025 01:01:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae0cd6sm1406890f8f.5.2025.05.02.01.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:01:17 -0700 (PDT)
Date: Fri, 2 May 2025 11:01:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vadim Pasternak <vadimp@nvidia.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/mellanox: mlxreg-dpu: Add initial support for
 Nvidia DPU
Message-ID: <aBR7yX-KeZW6L3lX@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Vadim Pasternak,

Commit 3e75f2954116 ("platform/mellanox: mlxreg-dpu: Add initial
support for Nvidia DPU") from Apr 21, 2025 (linux-next), leads to the
following Smatch static checker warning:

    drivers/platform/mellanox/mlxreg-dpu.c:539 mlxreg_dpu_probe()
    warn: refcount leak 'data->hpdev.adapter->dev.kobj.kref.refcount.refs.counter': lines='539'

    drivers/platform/mellanox/mlxreg-dpu.c:565 mlxreg_dpu_probe()
    warn: passing a valid pointer to 'PTR_ERR'

drivers/platform/mellanox/mlxreg-dpu.c
    522 static int mlxreg_dpu_probe(struct platform_device *pdev)
    523 {
    524         struct mlxreg_core_data *data;
    525         struct mlxreg_dpu *mlxreg_dpu;
    526         void *regmap;
    527         int err;
    528 
    529         data = dev_get_platdata(&pdev->dev);
    530         if (!data || !data->hpdev.brdinfo)
    531                 return -EINVAL;
    532 
    533         data->hpdev.adapter = i2c_get_adapter(data->hpdev.nr);
    534         if (!data->hpdev.adapter)
    535                 return -EPROBE_DEFER;

This should call i2c_put_adapter() before returning.

    536 
    537         mlxreg_dpu = devm_kzalloc(&pdev->dev, sizeof(*mlxreg_dpu), GFP_KERNEL);
    538         if (!mlxreg_dpu)
    539                 return -ENOMEM;
    540 
    541         /* Create device at the top of DPU I2C tree. */
    542         data->hpdev.client = i2c_new_client_device(data->hpdev.adapter,
    543                                                    data->hpdev.brdinfo);
    544         if (IS_ERR(data->hpdev.client)) {
    545                 dev_err(&pdev->dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
    546                         data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
    547                 err = PTR_ERR(data->hpdev.client);
    548                 goto i2c_new_device_fail;
    549         }
    550 
    551         regmap = devm_regmap_init_i2c(data->hpdev.client, &mlxreg_dpu_regmap_conf);
    552         if (IS_ERR(regmap)) {
    553                 dev_err(&pdev->dev, "Failed to create regmap for client %s at bus %d at addr 0x%02x\n",
    554                         data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
    555                 err = PTR_ERR(regmap);
    556                 goto devm_regmap_init_i2c_fail;
    557         }
    558 
    559         /* Sync registers with hardware. */
    560         regcache_mark_dirty(regmap);
    561         err = regcache_sync(regmap);
    562         if (err) {
    563                 dev_err(&pdev->dev, "Failed to sync regmap for client %s at bus %d at addr 0x%02x\n",
    564                         data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
--> 565                 err = PTR_ERR(regmap);

Copy and paste.  "err" was already an error code.  Delete this line.

    566                 goto regcache_sync_fail;
    567         }
    568 
    569         mlxreg_dpu->data = data;
    570         mlxreg_dpu->dev = &pdev->dev;
    571         platform_set_drvdata(pdev, mlxreg_dpu);
    572 
    573         err = mlxreg_dpu_config_init(mlxreg_dpu, regmap, data, data->hpdev.brdinfo->irq);
    574         if (err)
    575                 goto mlxreg_dpu_config_init_fail;
    576 
    577         return err;
    578 
    579 mlxreg_dpu_config_init_fail:
    580 regcache_sync_fail:
    581 devm_regmap_init_i2c_fail:

I would really encourage people to use names which reflect what
the fuction or goto does instead of where the function is called from
etc.

err_unregister:

    582         i2c_unregister_device(data->hpdev.client);
    583 i2c_new_device_fail:

err_i2c_put:

    584         i2c_put_adapter(data->hpdev.adapter);
    585         return err;
    586 }

regards,
dan carpenter
