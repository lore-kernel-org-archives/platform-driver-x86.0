Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1029186E3A
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Sep 2024 11:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725276199; cv=none; b=Idpe2+NVKdCdrRiJybEsqTIHT+PmtSHizT2tTSSJ5n/8iW1dtvJKTutSxoBPkADPizTOjNyJH9s/9+Mts42ctui3ld6LVjch9FCs3LN9xq9fnG9cmKb6MWLYKibqlrJjzqa5D/aPwi4mVYWsx9s+RLXqe+O6eV3yRWdGH2LTPIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725276199; c=relaxed/simple;
	bh=FpetsQ5I1CDSi8wtSlI1e+AMgn3cH3BIUkkDyXHtNqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nx+g5krPGjkrsjjPxpt0/MWhPHQoxVRsMGUdIO7dUCSslSPDJ8McP6hy437bs3j8K8bqQWddTHNBtchUWIZlWqZ8WWnzAllWPB4fZkxCCONt6+oXjhPIX9NtLBUxN9sZBnhGkW3ZSWf4BEOQzH+Z+TAavRVhXApo8zXX7qAMLxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hdn7015D; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hdn7015D"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42c828c8863so9079665e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Sep 2024 04:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725276196; x=1725880996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QEt0+dc1LSyQIyl13xdTGJyLQn3oDUp5kW96ysZGY3w=;
        b=Hdn7015D56Nf+JeGukbWYVq5bUoemRNSQ5CMziew+iaNawQJ3koZw1RnfvVtzw2Lav
         k+R4rz278AYM6tP7jMQui6ldRa6WK529CskU9tyzxbD5h5Wvfx/2wIvL/sa98LyetwOE
         fphxUzD+1ZrZJOgvYvbY+fRShB/K9IPNfvKmpXCfge4XONHOT1ar8Zp4xTP1IO+RjB3h
         XbcAH/9irEo46/Mz9EH69o0rtqcnmv9jyOP9VnzowLbIeqTm96L6yV7G22f28Cep7Z5t
         UUck9bkPaNN5KTOD/AcrLgIHhU3LdJIsOCucquc0Vp08dV+ttbCL1eEuT84Y3D9nLiZe
         T83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725276196; x=1725880996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEt0+dc1LSyQIyl13xdTGJyLQn3oDUp5kW96ysZGY3w=;
        b=uMOS4c/Tlkj2gqYmNmbaEHn5oOh+A77MDlxd390di2AjAuNSG/dtsl42gjZFYdzA9h
         NttpGubo/kqTf/whYYEepG7r/XkC1xOkUWivXfrHKr2nBP7AMP43cfaOHyb1wXTQXH6g
         YL5N2TMpEd3hTkCYI2CHGecPZdF7TuPCmC0/NFwJvL8FzWvP2JGzl+n2xMADEEkeFdSo
         YGwnicWZ/3RqaiIA5W4NYjM4o5IuGg5OW1P2jEomjS2JgMjPHZeBoprg4UFgvSv1vEgH
         lox/FilHjE0QulmJBt7vAeHQlUEuzvb1RnzBoy38jsal9qPzUPDQF5NrE7GgCDL6iX6r
         GYUg==
X-Forwarded-Encrypted: i=1; AJvYcCXV/8PN99TRgbJaFLYaCiIDqP0S6Vt++7/t9WpeDk/hLufgldbvY8v6/BWCfc1Z/04C0Bs0Z1PG13CjGsV+fArfi220@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3MhlLo+/pv8xaSE42F1nOEK3p/3QNdmjN9Y/Z/tk1gpcjTQmq
	dsvVaD+4D3Ip1Ip1jYtZiLTCCdc1b4qyJ34mW8Mud39FB+9bThKThXm6t7xHsQw=
X-Google-Smtp-Source: AGHT+IFxJcCTvoMwpH+tvEwVOkWpvLSMuNdbuHPGieP5ISOoCAVIM3ROhsGt3PZ8voU2RxcgHG86EQ==
X-Received: by 2002:a05:600c:4452:b0:428:1090:cfd4 with SMTP id 5b1f17b1804b1-42be48faa4emr44328095e9.33.1725276196265;
        Mon, 02 Sep 2024 04:23:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42baf1b0c18sm151736775e9.37.2024.09.02.04.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 04:23:15 -0700 (PDT)
Date: Mon, 2 Sep 2024 14:23:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Scally <djrscally@gmail.com>
Subject: Re: [PATCH v2 2/4] platform/x86: int3472: Simplify dev_err_probe()
 usage
Message-ID: <6be0acdb-6b4a-4330-929a-2e319075b3c6@stanley.mountain>
References: <20240822130722.1261891-3-andriy.shevchenko@linux.intel.com>
 <20dd56f0-78ea-4255-86ac-32151160b83d@stanley.mountain>
 <ZtWQzwvo7f0QfeCI@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtWQzwvo7f0QfeCI@smile.fi.intel.com>

On Mon, Sep 02, 2024 at 01:17:51PM +0300, Andy Shevchenko wrote:
> On Sat, Aug 31, 2024 at 11:31:53AM +0300, Dan Carpenter wrote:
> > Hi Andy,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/driver-core-Ignore-0-in-dev_err_probe/20240826-113856
> > base:   driver-core/driver-core-testing
> > patch link:    https://lore.kernel.org/r/20240822130722.1261891-3-andriy.shevchenko%40linux.intel.com
> > patch subject: [PATCH v2 2/4] platform/x86: int3472: Simplify dev_err_probe() usage
> > config: i386-randconfig-141-20240830 (https://download.01.org/0day-ci/archive/20240831/202408310807.sNPe5Mr2-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202408310807.sNPe5Mr2-lkp@intel.com/
> > 
> > smatch warnings:
> > drivers/platform/x86/intel/int3472/discrete.c:292 skl_int3472_handle_gpio_resources() error: uninitialized symbol 'err_msg'.
> > drivers/platform/x86/intel/int3472/discrete.c:292 skl_int3472_handle_gpio_resources() warn: passing zero to 'dev_err_probe'
> 
> Okay, I might agree on the err_msg, which is good to have to be passed anyway.
> In such a case it might be good to have a dev_dbg() in the dev_err_probe() to
> say that it is likely a bug in the code.
> 
> Would you accept that approach?

ret is 1.  We have to revert this patch.

regards,
dan carpenter

