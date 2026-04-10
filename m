Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B35B3368A5
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 18:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775844270; cv=none; b=S0iWufOP6VVoh4NukbI77xT6ArKA/6tFjiY/W3E4m74fOTtH7gZo+qQCLh4/DnQpKbL6E3XGvCIAUQk2uoerCFbA0oYC0Q68PXowcwalZFYXYLp9KDuUVf7TUnMUXsdzbpW3KnRl5zm9AGGM+2tX5qzN8jTfTbWGLU+RgTkQ4Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775844270; c=relaxed/simple;
	bh=JgGqLOXAqPI4mDOK3mliph0TQ7laYuQiITZhR0v8j5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VTRvf/OYL/dVTLKxpiqs0rgjDfA1doyvOWNlqdEfVt/bsb+ULfFARoP70QP1muBE1lsho6UomOdecfVD+5fm0baFuouWJnwp/tUwsaJacnrbv56qmSxcmXqI4Wle/Gmqyq2L2Jekaid+8HVMHI9grh96+ebWbr1TYDbigsvgRAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xvt/TytZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xvt/TytZ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso2332683f8f.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 11:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775844267; x=1776449067; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3YKQHT4VdIe+kIciofFV5LsSZZvu7NGIH93yg7SCkro=;
        b=Xvt/TytZiFx1Mx5KLi2G9CFJYDjWLLl1HfxyUsZ5NihaO3gkVohnOUr3KQ4gwDkoJ6
         Sg5+yjcTachbO8nZdzWE6lMuOSQTTWF3QAQ4QUYFzd/lVe5+EbQMR4YIg5kkf2cCSMYP
         6kmAlYrLLvNrEXL0M/6rFySVU6OAkDMQWA/ShGSHqcKD8bC+0DOPdRTeUr3lvgb7xmJP
         1ZuFy0/BMQXgQAVVjExFyPYCK+TTuIwM2HrY2u4+jQi69BastqmC8cWIWDrvGLY8E+Ay
         Ygp94KuQAivqS/YK6F12EZxbwRiNsY0jD9kQGwheFxxiE8WW4qYrsiRQToWlvm0iEsNu
         1w9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775844267; x=1776449067;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YKQHT4VdIe+kIciofFV5LsSZZvu7NGIH93yg7SCkro=;
        b=DrxTzlmEdXmCA16jyTYV3i2Tgje8ytGqqRzy3NJWZfmf2mD0Tu7TdNXmSHfsM/Ywd8
         My5Xh08vGusnVT2zp6gBteoirf8RvA+MRrva/fcd0dPC0BoKD8wAQ6uWukm8krFoe98d
         fUJTnwX0f38ZM/Iznh4sbIevX5fALHGQggfGOxnzuVw7/ul4nnLmHeaslVZcEpSkiKYn
         qhlMZ8xroiv1x3OyQf2IiLyT+SBK3YNRmnc2x+Nyf49P5spugPKBqTsM3/N0aQcwNMy7
         uyudWaXL38ntybjPj8zd1HBwsu8OH/9CoBd920/Yd6LcJklzddkvL7lOK+zQFddfBAnV
         oBxw==
X-Gm-Message-State: AOJu0YwZUl9tIbTB5RmiYkHG5TeXtUvecg3Zj9M7ootxXXn+UCf2zbMk
	6Lj+TKGTuO4Bma806nvzcv6lDh3YzcKVwXxvTh3X6UpN6bM4j0q38wmY
X-Gm-Gg: AeBDievFBBJhTvo6EN7RAQEzK86h4BshdoyoCOq2W1vGzjvQaGd+fAwBaalVXncMpNZ
	Lt39+FwVd+qlybz769EnZK4TtDlAyC6Z8ktXrku7YPRx9dfWx5Wtd3mvbGFPapU7ore9gzFhL0T
	9xXs5NHWiUuDJRQJ5s3sKKKLPYjARunfs5ssm05kgU5cb4fPU9396ae7CizEETDKMAe5XQxopxO
	Mj5i30B7/VdQnkIsghNquNL6bAFc/Qhiduny+dCAWyNGCQsQEjFmnL5iiNlT1RIAvw5C1ZL4b6g
	CzHYWOWyaihmzb3y2p+t0LJzs58aGbjOxRNPAUHXZpout+hWZwcgecHAlE5YFQxsG1Y4U3pU1ek
	o/o8GBbFA3QZSBVWgchAAYKwTE/cS6+5hv3DZq1ozJZ12xvw4rkoEysPlQFCUleOVCrEwYwp4Aw
	DIZLBcQGBTHRFGinsglKqmde0lsDOTwA==
X-Received: by 2002:a05:6000:24c2:b0:43d:303f:f358 with SMTP id ffacd0b85a97d-43d64286bbemr6305667f8f.2.1775844267229;
        Fri, 10 Apr 2026 11:04:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e46881sm9654748f8f.23.2026.04.10.11.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:04:26 -0700 (PDT)
Date: Fri, 10 Apr 2026 21:04:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/x86: uniwill-laptop: Implement USB-C power
 priority setting
Message-ID: <adk7pyLVBmmr3-ni@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Werner Sembach,

Commit 03ae0a0d0973 ("platform/x86: uniwill-laptop: Implement USB-C
power priority setting") from Mar 24, 2026 (linux-next), leads to the
following Smatch static checker warning:

	drivers/platform/x86/uniwill/uniwill-acpi.c:919 usb_c_power_priority_store()
	warn: error code type promoted to positive: 'option'

drivers/platform/x86/uniwill/uniwill-acpi.c
    909 static ssize_t usb_c_power_priority_store(struct device *dev,
    910                                           struct device_attribute *attr,
    911                                           const char *buf, size_t count)
    912 {
    913         struct uniwill_data *data = dev_get_drvdata(dev);
    914         enum usb_c_power_priority_options option;
    915         unsigned int value;
    916         int ret;
    917 
    918         option = sysfs_match_string(usb_c_power_priority_text, buf);
--> 919         if (option < 0)

enums are unsigned in this context so option can't be negative.

    920                 return option;
    921 
    922         value = usb_c_power_priority_value[option];
    923 
    924         guard(mutex)(&data->usb_c_power_priority_lock);
    925 
    926         ret = regmap_update_bits(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY,
    927                                  USB_C_POWER_PRIORITY, value);
    928         if (ret < 0)
    929                 return ret;
    930 
    931         data->last_usb_c_power_priority_option = option;
    932 
    933         return count;
    934 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
