Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401F431F991;
	Tue,  9 Jun 2026 08:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992902; cv=none; b=MZSyS3FsUgc2i8ohG/FZ8V6Pa/o3l4POairGFrjcl7RY3VLjXQ0xccnEM5jd9KdA3PIfIlPn4BJlI598ZZJVYNv1xuSlvVo3qNftJMzeTFM0HGxAgjy42WISE9+gIda0V1VXyzsfeFF8fjx63Qoh5x9Lq919n0zwTUH19QoXgK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992902; c=relaxed/simple;
	bh=8UK/SGrr8uG9bpv4dQkRGLKO3jW+kt8fGyo3MZT4h9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hxKxlNj7AQeKebSrWFca5mIIcrGB75dUTAuQxlyfBtne3+RZo7gQgZRI7UZHFqX84TtoL7M8Ug1xxi6RxXE7FTU6fGCEeKrJQIXhlMWGpvqP6rHLoYSbPi0JglENHhHtdrl38c5A+s8svaIcGYXCrHxL1f8RVZYEBDpNngumuxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=cAIvv4yO; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="cAIvv4yO"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780992898; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=IVo0i5ZUai13wVCArcavwD9iJE2Dt8ygQ/fpHZWRb+I=;
	b=cAIvv4yOmghdlnULORGUyNqG816HYSJ2/EsfT3C9Tg4lYKjnbYgGJedCDy8Up7M8lFBja9O2UMI9RIPPpjf8jyraTlNCaAmPJSdJYNcXQRSs23hlDBxY4bjyljnGFKMSWlaeCRvLBAKC/9mYUWUr3VsnN5V75l8Irkez96AqrT4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=qinyuntan@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0X4Ve0YS_1780992896;
Received: from banye.tbsite.net(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0X4Ve0YS_1780992896 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 09 Jun 2026 16:14:57 +0800
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
To: Muralidhara M K <muralidhara.mk@amd.com>
Cc: Suma Hegde <suma.hegde@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qinyun Tan <qinyuntan@linux.alibaba.com>
Subject: Re: [RFC PATCH 1/8] platform/x86/amd/hsmp: Add new HSMP messages for Family 1Ah, Model 50h-5Fh
Date: Tue,  9 Jun 2026 16:14:56 +0800
Message-ID: <20260609081456.1152820-1-qinyuntan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260528093954.2461272-2-muralidhara.mk@amd.com>
References: <20260528093954.2461272-1-muralidhara.mk@amd.com> <20260528093954.2461272-2-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 19 Jan 2026, Muralidhara M K wrote:
> The same firmware also extends three existing SET-only messages
> (HSMP_SET_XGMI_LINK_WIDTH 0x0C, HSMP_SET_DF_PSTATE 0x0D,
> HSMP_SET_PSTATE_MAX_MIN 0x22) with a read-back path selected by
> bit[31] of args[0] (0 = set, 1 = get). Without converting these
> entries to HSMP_SET_GET, userspace cannot query the currently
> programmed value even though firmware now supports it.

I noticed that HSMP_SET_XGMI_PSTATE_RANGE (0x26) is not converted
here. The esmi_ib_library already implements a GET path for it in
esmi_xgmi_pstate_range_get() using the same bit[31] convention:

  msg.msg_id    = HSMP_SET_XGMI_PSTATE_RANGE;
  msg.args[0]   = BIT(31);
  ret = hsmp_xfer(&msg, O_RDONLY);

Since the kernel descriptor is still {1, 0, HSMP_SET}, hsmp_ioctl()
would reject the O_RDONLY open with -EPERM because is_get_msg() only
recognises HSMP_GET and HSMP_SET_GET types.

>  	/*
> -	 * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0
> +	 * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0/1
> +	 * input: args[0] = set/get XGMI Link width[31] (0 = set, 1 = get) +
[...]
> -	{1, 0, HSMP_SET},
> +	{1, 1, HSMP_SET_GET},

Does HSMP_SET_XGMI_PSTATE_RANGE also need the same conversion?

Thanks,
Qinyun
