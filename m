Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1280A3191C3
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 07:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537283; cv=none; b=i+ijZimrMg76d5Doku5roG0ypDXCLrNvtYObYW7tmLQ+0cTISg3WRTeMoCpNFH8uBgLlzGofd6b693E8nyVSp1BFU6pzXDYC2MI0/ErHnpny4xSE971lhN8qGqiCO6IsGYUUzmU8WuIYcMGzquxFK8brQivpJgqryKQGHIe+cWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537283; c=relaxed/simple;
	bh=lZWqRmzRlms5ziI0QgrTEu7VnsK9aS0LJffeH+0gdzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X0jpjKsZN5opnbCVpWYFmzPxT/V32LPRA76HYWnL6ou2Rlex3f1mi8FjjuNULXVWsBZqT8QK4FCjI6whWYaqeWEfP2eLcCqdquMmq3cxdfsOisGPxbQYKzFN0IdgxvAmY2AkK1fiWbUNjt1EfTV9O5JLKApMJ3+gEXlHIpPbgPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cxXJJUPq; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cxXJJUPq"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3ad51fecso4620222f8f.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 23:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763537279; x=1764142079; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GTdftNsqB4P1rjr+it1aXyp4e6K6zbkOVHD0wnIr8bA=;
        b=cxXJJUPqLeWkmz2cgt4wOLaoonsvSrwA3Bo35YrV28FAJ3c+l3GuilfleT20GJFsDi
         UocW/JM8tFbMi2DXZEDvSxkRWhWT8cZEXH/P5pi+yD0G46m6jhdtLAgUNw+lo3U1zHqR
         k8nujOPpvjlhQ5u7AOCRLqVMWU6BuXTh1XHCPl9NfAwJKbej1a11LC8gEZjxNQDED98w
         IjdLVNM2ct8myQgOtjYp+FhddNf5Bk4K6/yxR+LUbdQY8RJOIAqb9zgTAjIizjzqA2OS
         WtLSUDwIEgC4FuOkACwzapZUmCLfNn2swbBPOseLtBlsK5UlyC9qFdgWfiVICYmQzMHI
         pS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537279; x=1764142079;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTdftNsqB4P1rjr+it1aXyp4e6K6zbkOVHD0wnIr8bA=;
        b=BgPubFhZ8qLpc5SYafnIRtWFGRbt+8xcI87fVnPlvfpTuuyTgksOYAbp0eMb/vcGbb
         Bw5hLw2c82Ab2KzLLSIjashffLbRu+Hqdcv4IGqoSWQ+sGzYZSlixA2TShXRR1FRJrkG
         lV+3OI/C0qqCy2ax1VEzq7nmd/OqYqJM8XgkKM0Q6O8DcR6m/ZAMj5szZ3hIfHi7rW1F
         GT4egVO1j2h+4MxJxtDpvyHLWBCD3L0DxSXtNCr1A0yZOgHcyMVdaLbtJQGKoJTnjJTo
         n7sAOnnHtSShEfxIe/a4Lk0dniufmNDEt4l/ibrvBu2yHxD7RuErqSnS0i/W2SarDZo2
         taoQ==
X-Gm-Message-State: AOJu0YzGu2vJdpOUaqDc3vlpjDD1aOPdYf0KOr/QUulReYIyiKHb2LXM
	+bdB94hp8AU1kotJUWr6qOOXJWJWDr6FDHEjcRuVg8qNE0QZu7UnELyCqJVRqAuleiE=
X-Gm-Gg: ASbGncvByPMXzc2V46dO0Pqf3YFcHni5Zw7J4nHsEBNIQ9nV0iedbj0prXTmQiu4XNB
	A12JfxNBS/qrOQi539msfPQSkKNb1Q+wum0QoU6T6+XiDhr4q+S79944aOcOMI29N7TeXSJu5Ba
	oDaLkdC7NeEtuBbHYV6bpwQtUtAE3ZYg4LPcMDXm4J1iTtPcnZfICA9QtczjddfL7MsiDuKYpJM
	ygIYwLPz4DiflhtroU2JmUBCnX2ORLcxg/f29cCtLLXrqMKakdyQYHMvE+3PmyXKucH0Lda3ygd
	TBrypoqh8v2u0FLJUdXx5mG7qaKXFqR6waMzKTVpMK9jEM2VG3HhsdPL3zIs0Bs4nbmFS6aB9Ik
	soknSiUg5GH81K7b+39gzCZEV7/pj6BZ77QekWbIFhyE7YPN5g4g5pvtpZndYOb8CQevs4rcMxK
	AIVFP2xuhig3x/OjVm
X-Google-Smtp-Source: AGHT+IGvO3yVi9UJ5VH9q0WOvNCloA4RYWiuz2ArhLGsiXU8XIrCeBOAbca374CDSz4rEqzTmdZQ6g==
X-Received: by 2002:a05:6000:230d:b0:42b:2e94:5a8f with SMTP id ffacd0b85a97d-42b5939dc13mr17631476f8f.52.1763537279263;
        Tue, 18 Nov 2025 23:27:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42b53f0b622sm35606272f8f.29.2025.11.18.23.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:27:58 -0800 (PST)
Date: Wed, 19 Nov 2025 10:27:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/x86: asus-armoury: move existing tunings to
 asus-armoury module
Message-ID: <aR1xbxEQyQPEvB9o@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Luke D. Jones,

Commit f99eb098090e ("platform/x86: asus-armoury: move existing
tunings to asus-armoury module") from Nov 2, 2025 (linux-next), leads
to the following Smatch static checker warning:

	drivers/platform/x86/asus-armoury.c:429 mini_led_mode_current_value_show()
	warn: iterator 'i' not incremented

drivers/platform/x86/asus-armoury.c
    399 static ssize_t mini_led_mode_current_value_show(struct kobject *kobj,
    400                                                 struct kobj_attribute *attr, char *buf)
    401 {
    402         u32 *mini_led_mode_map;
    403         size_t mini_led_mode_map_size;
    404         u32 i, mode;
    405         int err;
    406 
    407         switch (asus_armoury.mini_led_dev_id) {
    408         case ASUS_WMI_DEVID_MINI_LED_MODE:
    409                 mini_led_mode_map = mini_led_mode1_map;
    410                 mini_led_mode_map_size = ARRAY_SIZE(mini_led_mode1_map);
    411                 break;
    412 
    413         case ASUS_WMI_DEVID_MINI_LED_MODE2:
    414                 mini_led_mode_map = mini_led_mode2_map;
    415                 mini_led_mode_map_size = ARRAY_SIZE(mini_led_mode2_map);
    416                 break;
    417 
    418         default:
    419                 pr_err("Unrecognized mini-LED device: %u\n", asus_armoury.mini_led_dev_id);
    420                 return -ENODEV;
    421         }
    422 
    423         err = armoury_get_devstate(attr, &mode, asus_armoury.mini_led_dev_id);
    424         if (err)
    425                 return err;
    426 
    427         mode = FIELD_GET(ASUS_MINI_LED_MODE_MASK, 0);
    428 
--> 429         for (i = 0; i < mini_led_mode_map_size; i++)
    430                 return sysfs_emit(buf, "%u\n", mini_led_mode_map[i]);

This loop doesn't make sense.  It just prints the first element in
the mini_led_mode_map[] array and returns.

    431 
    432         pr_warn("Unrecognized mini-LED mode: %u", mode);
    433         return -EINVAL;
    434 }

regards,
dan carpenter
