Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C6013DB8D
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Sep 2024 19:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725476644; cv=none; b=jn3zJE0ga603+vjk0ppHolaLwQmsj8sqBpvMDM4MhpJc+g8v2W6piEuE6/0zNz5eFPSn83/ij6hSs8lMcqNHRik+kIig7aQSbHSCxN33NofIPE4IoyT999NRnAGKJsuKbdYNMUlBZLYKUWvAmyDZ7AtJVwErHtP/IMEx5QbNoGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725476644; c=relaxed/simple;
	bh=pz8abOK9qiYxjGsUye2BkgH9fsb8oUNfbLiCXnQwbEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dC8THPHMY0g6FsEtPHtBkCbV0MnMy97vncU1kExHwRNgK5vHq73L7kw92nnoimqSCvPuVqgxnw8FApoI4RrPMgXEyAolS8vPXuiUGBgokABf2gc8sgP4S9+RdjRcyEizy8dAmwQcKX7tZCtTZqaJJG2CTbHtvAUPJMVpfZmv6vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N+sVZtGA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N+sVZtGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725476641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDnsT7way4myAS3YQsYYwf5mnG+XuqKIYPjQleQips8=;
	b=N+sVZtGAe+0eGJ3by0cGlZ7Ek+90JgqbWeCmTuYFks/cTlz6ZvbtLM0eDusm64BfRPOOhW
	pClF344xxrkdCDfZHgv6sP6nqwUNfK4l/hg2lmR9Fa4vzYb/bEDZmoZFTtrpNLzpmcke56
	xyNhqu6AWWj4HmeAvGHY2xynFUkdd2I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-WZTX55UENIesgjkG4gak7Q-1; Wed, 04 Sep 2024 15:03:59 -0400
X-MC-Unique: WZTX55UENIesgjkG4gak7Q-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5c2465b7fc1so3579746a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Sep 2024 12:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725476638; x=1726081438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDnsT7way4myAS3YQsYYwf5mnG+XuqKIYPjQleQips8=;
        b=esE1FrvLdTvbiiJpkrJlrSbCpnrvNEEeZsyq/oXjK/5n8R8cnsbO9bdQwZRMys6RMB
         9G4Wx4t5xHwrvsIqztKZ62km/w+QQ1OH97/t0zSiU+4yaxUdVb3fi8gFYUCBg7xpwnxn
         LATz+gFRGqpFrznZkHZ2HX4jTY2oMOJmyzT9LEJvoLApsBuOs/Hl1SJHdn0EN8trsJfR
         hN+l7yw2I0CzgwpG94/CCDicIsqAaC5kNVwy+8yp1LlzZq9yhrXtupBb4RJDw6xn7H7B
         I2NxPP92W0DAuFLiARkXUAJORBFwyLZpkOTJ8+Jl5CsxQaPJieI1vPq5dQ9EfwwreZQ5
         /ONg==
X-Gm-Message-State: AOJu0YxqDz+6LCk1+9q9L3Km7ORG8Ff1xvcRyNtNyyu8PJy4qSuQe+8/
	s/tMaWJ9y1Pyn/SE+yuch1tZjPkemb66UrhbhLepqicOE+ArKfN0lvGBbeIaiusnY9QenHkn5kw
	pDPXvwro3jzWOfHO4nvE7kzZEpLFah+Oc/dEBpgVejitf0u8ICyK5L7UWox8f1ixGsogzzeM2Cb
	Zwjg8=
X-Received: by 2002:a17:907:7d93:b0:a86:ac05:2112 with SMTP id a640c23a62f3a-a897fa75845mr1691342466b.51.1725476638450;
        Wed, 04 Sep 2024 12:03:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhjfPcdnVRZVOoeC2ZdwsGyFvXnhsEsAcxhd2+4s9TJSs89p2isUTblTKL1jtqQ1Ul0D6M0w==
X-Received: by 2002:a17:907:7d93:b0:a86:ac05:2112 with SMTP id a640c23a62f3a-a897fa75845mr1691340366b.51.1725476637982;
        Wed, 04 Sep 2024 12:03:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a6236d141sm24311866b.110.2024.09.04.12.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 12:03:57 -0700 (PDT)
Message-ID: <3f3775e9-9334-40e6-b952-046182c99082@redhat.com>
Date: Wed, 4 Sep 2024 21:03:57 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] platform/olpc: Remove redundant null pointer checks
 in olpc_ec_setup_debugfs()
To: Li Zetao <lizetao1@huawei.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
References: <20240903143714.2004947-1-lizetao1@huawei.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240903143714.2004947-1-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Li,

On 9/3/24 4:37 PM, Li Zetao wrote:
> Since the debugfs_create_dir() never returns a null pointer, checking
> the return value for a null pointer is redundant, and using IS_ERR is
> safe enough.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

debugfs functions like debugfs_create_file() explicitly allow
being called with a ERR_PTR() style pointer and then turn
the call into a no-op to make using them more easy and because
debugfs errors are considered non critical.

The idea is that drivers can simply use debugfs without any
error checking at all. So the correct thing to do here would
be to completely drop the error checking like how e.g. :

drivers/platform/x86/dell/dell-laptop.c

also does no error checking.

Regards,

Hans



> ---
>  drivers/platform/olpc/olpc-ec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/olpc/olpc-ec.c b/drivers/platform/olpc/olpc-ec.c
> index 921520475ff6..66287a2ddbf3 100644
> --- a/drivers/platform/olpc/olpc-ec.c
> +++ b/drivers/platform/olpc/olpc-ec.c
> @@ -332,7 +332,7 @@ static struct dentry *olpc_ec_setup_debugfs(void)
>  	struct dentry *dbgfs_dir;
>  
>  	dbgfs_dir = debugfs_create_dir("olpc-ec", NULL);
> -	if (IS_ERR_OR_NULL(dbgfs_dir))
> +	if (IS_ERR(dbgfs_dir))
>  		return NULL;
>  
>  	debugfs_create_file("cmd", 0600, dbgfs_dir, NULL, &ec_dbgfs_ops);

