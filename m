Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u+Zo1NeE"
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8ED10D9
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Nov 2023 03:47:34 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40b5155e154so6303455e9.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Nov 2023 03:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701344853; x=1701949653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4qE9p0d5IS1QGooVoX1UZocF/TK6F/IxVLC2dxwb4cs=;
        b=u+Zo1NeETZ7EZ2puMKwFMAlxQvKTvzwSfLm/LQzq/RFZf4P6WRDMFmE+DwVom7nmZk
         B35dIq+hefMlX3JM1p3H3KX9iy92KGffgBA7X4AEZRROfHL18ZTn1HKYxugex++SryK4
         fcrCNa/nlZYkxSEB9m2bc/zPUwp4IIAn5D9/Jnd9liP5IHt5k9TDoKpjB+6zYvPMs3pF
         jNIWH98iAHu4WEDVREjGxsuYzaWB+G5lGUOxIgn4aL1a+0cGhJ5Pc54G15i1Dx5GRVsk
         OZglHggKLMTL1xHuLGX3v1f1Lhj5jjLxDqrE2ouqS9L8ix9RqX4+TW3TXzniH9msjm9b
         XbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701344853; x=1701949653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qE9p0d5IS1QGooVoX1UZocF/TK6F/IxVLC2dxwb4cs=;
        b=a2QVgE7D+Ll0lhIh1SRp+0LedgHocA11+gaLh6p3OcVZcyO+B7KvizLcZ2kgJxIj2O
         S0Vome2zM5Bv4xrREKt6BqTbqW6xGUhW1Rixc1zRYI7IthQ8wyDrNToxI4cm1rUdoK4b
         OF776pvvM0eQIMpNf6qbF4f1womq8KmY1MXOB3jFu/qoPoYqQoOsR56X6AEQVQzVG4eH
         RpyQDEbjN5fG5eQ9H3jiaTkfBzxoPVUKpIEE9j8zIzcwJbRD90e405nKGbYSEsjSRo84
         UORmJ7PSvbQZl9YnYUvHA8S+VTxUIGu0KAWMQKsL3yTzqnMYEL/v6iaB0sURCRP1IHlw
         SiJQ==
X-Gm-Message-State: AOJu0YzmbMK02bACvyTOgtMLuip2KUQrull17MM4x27URPRJesyRFMAS
	q2g5RvFW9m9hZLkzR3LV2LL8/A==
X-Google-Smtp-Source: AGHT+IFfd5GkwBFfDxer1BiHey3pw6auUs/8FmtHUohGoDyz1N8+Z9MKKOOLxzx4tcgmvNfzM8/xZg==
X-Received: by 2002:adf:ec06:0:b0:333:86d:c292 with SMTP id x6-20020adfec06000000b00333086dc292mr7586092wrn.50.1701344853028;
        Thu, 30 Nov 2023 03:47:33 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b13-20020a5d40cd000000b00332f6ad2ca8sm1324909wrq.36.2023.11.30.03.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 03:47:32 -0800 (PST)
Date: Thu, 30 Nov 2023 14:47:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yu Sun <u202112062@hust.edu.cn>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Gross <markgross@kernel.org>,
	Vadim Pasternak <vadimp@nvidia.com>,
	hust-os-kernel-patches@googlegroups.com,
	Dongliang Mu <dzm91@hust.edu.cn>, Dan Carpenter <error27@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/mellanox: mlxreg-lc: Check before variable
 dereferenced
Message-ID: <4109f017-f07c-4755-bc1b-ec4cb30b0760@suswa.mountain>
References: <20231130094409.3963-1-u202112062@hust.edu.cn>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130094409.3963-1-u202112062@hust.edu.cn>

On Thu, Nov 30, 2023 at 05:44:07PM +0800, Yu Sun wrote:
> there is a warning saying variable dereferenced before
> check 'data->notifier' in line 828.
> add "for(data->notifier)" before variable deferenced.
       ^^^
Should have been "if (data->notifier)".

> 
> Signed-off-by: Yu Sun <u202112062@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Reviewed-by: Dan Carpenter <error27@gmail.com>

I didn't really explicitly give a Reviewed-by tag for this patch.
https://groups.google.com/g/hust-os-kernel-patches/c/c5hUaYIDcII/m/h4aFS7PkCQAJ
I also said that I thought it looked correct but that it needed a Fixes:
tag however the Fixes tag I suggested was wrong.

Looking at it now, the correct Fixes tag would be:
Fixes: 1c8ee06b637f ("platform/mellanox: Remove unnecessary code")

That commit says that the NULL check is not required.  So now I'm
confused.  On the one hand, the impulse is to trust the maintainer, but
on the other hand my review suggested that the NULL check might be
required.

regards,
dan carpenter


