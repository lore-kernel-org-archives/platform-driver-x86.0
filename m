Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6854D1779AE
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Sep 2024 12:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726057256; cv=none; b=o2KNDeoqJWIjogO6aH0K/gS+VNNsG9neVRETQ/ps2xFA4KlXQxEvwuqqG2q4Y/ubqS694sFZ/rulF7muG4U5Z2iNlN/DElSABebMTxFrgCFpSFQHwj5yo/gIb4ewDvoR3k+SQ091FbxjYL+gs7nR1oxooSe+2RCnCa7Zu9WFLPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726057256; c=relaxed/simple;
	bh=+OtcHmKqOaBrLslEHoDVuszHtt0pMfNdMC/JAAqio6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQTJZ//boHNwQv+NiJLTzj3GFWbirfEyvomTSInEaYPKJKHZOwMUsLetGjoJdumYay/LD9cKQCglszIWs/wgph8SpbzIqaSjLXUHUF8SEjTtnt0sjAj7A1jyMe9TBS9qK5zlvI7BtokN6K8MMr9JptIHJaM8cExgPYttmZ6iOpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NebbEx2H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NebbEx2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726057254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n3lZx7MOn0cvUlutwjGz/taR5dti/49PxN0KWJf8nvQ=;
	b=NebbEx2H8SCaNbNr/BPQmpUypWqmqclSVPBWcg6krV9BIJQ4hJpy4dYtTmXzKb3cwlVnGG
	2g37YJHm0SqDUPTmgEgYMLDhIbdph0VfKDF3KKPICMVYRv76oYhsgd2bYXfUIG9JVVMW+O
	jTbFNxTPmLtX5Hrcahij8HWN9yGPwYI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-ZD4yrd9ANkqJ93Nu5gr53Q-1; Wed, 11 Sep 2024 08:20:52 -0400
X-MC-Unique: ZD4yrd9ANkqJ93Nu5gr53Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a8a84b60255so426068966b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Sep 2024 05:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726057251; x=1726662051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3lZx7MOn0cvUlutwjGz/taR5dti/49PxN0KWJf8nvQ=;
        b=gUgSs1QTnEH9J6vCnz8Oub+XZyRFSa8i4xPiNLdQ606o1XTFd4bGfK4wvVOaSZvur7
         T5mFFRyrAQV/6tVB4Sggn0E1Dui8Y3IlibtlU+RqInDZ375e26AH76MgEKse9j1+4vcA
         DQxvUStcXwoQ/F7N66e5LN7iHfHGiy1Sd/Mnw59pZKZB8+ZZAugaRADsGh5q2nzyi8Ua
         UyFLN6POqYvs2oKTpXCyAozYN7GmrlI5dSLH8nL9M9+oe6PeDObfMQkOz73L1eeJQPny
         INpSVpDgn/x+u4Se3EhmAyTD0IVhsC+DZLG7tYUCGd9wyliFCwTE2RoAlW8wJDnyJo89
         M8ww==
X-Forwarded-Encrypted: i=1; AJvYcCVX2AwU9a6WPAs+2mCjLuPtdhQxFj1lXp61KIPEJ/boTfvGAYadmEvrf+Jp9QvQ2Jf6HJMItdgoiIjMAfzmlkW2PRuT@vger.kernel.org
X-Gm-Message-State: AOJu0YzSQjOmjnEg6DukyxGqhFR6qzRPTFV8OaonN2ej2WjoV5yU8d3o
	spqTxgmo2Rd9LA2jX5A4WOJJRw6bN0qThxAXYrHEeCEJkwk/PvVPh99DGil5IyLCV4VkcuKI+bn
	eHEnMVAFPQIKD00FBs7mninaqryArfs8Nw428ei1aHonYs0xSlfrCSZevQHel9M7rPnXUt64=
X-Received: by 2002:a17:907:c27:b0:a7a:9a78:4b5a with SMTP id a640c23a62f3a-a8ffad9da29mr446883266b.52.1726057250852;
        Wed, 11 Sep 2024 05:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEse7/q3fks/g38TDGilxuqdMvvKGvYQPRWSe7VE2frNIQ+csBboiwxRmv/9sL6IOGSSY5V2w==
X-Received: by 2002:a17:907:c27:b0:a7a:9a78:4b5a with SMTP id a640c23a62f3a-a8ffad9da29mr446880566b.52.1726057250314;
        Wed, 11 Sep 2024 05:20:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d259c76e2sm605309766b.79.2024.09.11.05.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 05:20:49 -0700 (PDT)
Message-ID: <1d0478b2-efdf-4c1f-bf2c-a5cb2214168c@redhat.com>
Date: Wed, 11 Sep 2024 14:20:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v2] platform/olpc: Remove redundant null pointer
 checks in olpc_ec_setup_debugfs()
To: Li Zetao <lizetao1@huawei.com>, mchehab@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, heiko@sntech.de,
 yisen.zhuang@huawei.com, salil.mehta@huawei.com, hauke@hauke-m.de,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, wellslutw@gmail.com, radhey.shyam.pandey@amd.com,
 michal.simek@amd.com, ilpo.jarvinen@linux.intel.com, ruanjinjie@huawei.com,
 hverkuil-cisco@xs4all.nl, u.kleine-koenig@pengutronix.de,
 jacky_chou@aspeedtech.com, jacob.e.keller@intel.com
Cc: linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org
References: <20240907031009.3591057-1-lizetao1@huawei.com>
 <20240907031009.3591057-2-lizetao1@huawei.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240907031009.3591057-2-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/7/24 5:09 AM, Li Zetao wrote:
> Since the debugfs_create_dir() never returns a null pointer, checking
> the return value for a null pointer is redundant. Since
> debugfs_create_file() can deal with a ERR_PTR() style pointer, drop
> the check.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
> v1 -> v2:
> v1:
> https://lore.kernel.org/all/20240903143714.2004947-1-lizetao1@huawei.com/
> 
>  drivers/platform/olpc/olpc-ec.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/platform/olpc/olpc-ec.c b/drivers/platform/olpc/olpc-ec.c
> index 921520475ff6..48e9861bb571 100644
> --- a/drivers/platform/olpc/olpc-ec.c
> +++ b/drivers/platform/olpc/olpc-ec.c
> @@ -332,9 +332,6 @@ static struct dentry *olpc_ec_setup_debugfs(void)
>  	struct dentry *dbgfs_dir;
>  
>  	dbgfs_dir = debugfs_create_dir("olpc-ec", NULL);
> -	if (IS_ERR_OR_NULL(dbgfs_dir))
> -		return NULL;
> -
>  	debugfs_create_file("cmd", 0600, dbgfs_dir, NULL, &ec_dbgfs_ops);
>  
>  	return dbgfs_dir;

