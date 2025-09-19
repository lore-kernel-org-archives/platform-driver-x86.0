Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3771710957
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 21:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758316085; cv=none; b=MnaHPFtidT2Br4PAHCDNbXARVQ4iZhKF+zZas4I95GetPoNpsjWGxcFayaVYHUrUwINNcFHrR2CeLagi7D5zeENjIxEi9QdTwKw5+/ChCaGM7h0I3jsEvyWMXgoh/jE6HoZe9cLQBH5r6RbXYh9dfNH+Wnb4TdqhW9qt8rH0o+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758316085; c=relaxed/simple;
	bh=8pyDpPAz2avy1olSPhUzYnBzBD2e9nIbWOcOJGaXeL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sV7ytQQaJk+WJsUgHmev4FTT+TjTNZXfbQwl3s/mqNq6vKLx98o7YduwhuCJP7Hi44Nvx8KU1FVOW52/hyb/IVXkXRAInLuCwST6Cbt4xfx+HYMyksyK0xs/PtPvUvhZt4sJqL3ynJnaPtOc2RXAScYSZ2A/XyMIoivLb4QbDg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJtxClP/; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJtxClP/"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b54c86f3fdfso2699225a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 14:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758316083; x=1758920883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4+Abf9wgHtgqEYMhJpgdTeNvKGbTBROUCYu5Sv8RMxE=;
        b=SJtxClP/f39zdAxjCJmWv2GIU4oFZnaKK4lUAxB5ZWksEuotYddQvwBqZAOyxmw9pm
         +PxMdCw/JvjKrI/nGHuSYt92RpeYMLUUKf5cebxLrH9eP+veX3tAb1wHEm4gKhfduRun
         60+nPI1He9UfpH4K1/vBP+vssdUwVJsLgG3Kik0wXNNIV49d5VlO7Tn93bjeHmJs3ir8
         J6V0yFwLfvMhSPoTLwu+IjIowuLf3jCzDB5u+u4mlGvwGHXBkri9RRimaB3TQP9A6c/L
         ORLWGPrDAG632VieRuyHe6dkcmK3SHb/rm/CLprQCg/N/qAP5ltgK9ZgmqL9hCU2LkkY
         e61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758316083; x=1758920883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+Abf9wgHtgqEYMhJpgdTeNvKGbTBROUCYu5Sv8RMxE=;
        b=UKwXTH4bgvhWSJv2fojIqYX2E30h+gYUwDZ0bWIyppJXp4mDeeWJXFp94xVNkunCm4
         /F7A4mQPBD0TWNJ4oLiPOUwely5QrV/1fku3tGckkr3x8rEMXU/LvMH26CbiqiTa/HKo
         IGMnk7pEBrkwM8Pt01NhP/IQP2OE6iCmjLymvVF3hKa0b4w1KnotT506CVRwKPJJ0KT/
         stu979ZNEWNsH/1J6VwRw40k/ofIquuXlyjqoyYluNhKNifNAe/7G34zd4VcNXnqwk4C
         +MEodr0ae1nzP8eZyg2P7R50oOrrkEHXKDTRW6nPfi4a2HlDuhfDZKUt5jvm74JUkSZ9
         qKuw==
X-Forwarded-Encrypted: i=1; AJvYcCU+9ESREvsuPhpz87+JRC/rdQgwS3o5nnhEQoDSPeRQuSqcb92X8q384G6STujV2jNkPJiWPWlXvTWFK7rsgeItFH+T@vger.kernel.org
X-Gm-Message-State: AOJu0YyVVSgqXaMlcRTAZ67bxzH36G/3DXdzRLgQhdIeyvlpogrkNMf4
	QanIPnGBMLfppBFRI0LQjxlXDI8/71dZ+iD7EM4SK8Taf8gVcTmuq5rk
X-Gm-Gg: ASbGncsbZbUUsqJPSjunH6DSIGUBcWdoYV6ATVQjR+lNMdcKuU+aataNDZGdSwePk5K
	n8GkHs9CAdxj59eLYnvb/MxbwgP+BVJigd0+bd15ZUUO2+RuGgocKNqmQdk7eIs/nw0aJQpagHy
	+ni4BnE0A5cdPZisZDa8lvM7GbcMsS/Oa6wbht56tOhcWh5fX38aTa51d6UWez9XQW8H55Gp7On
	+B5VkpbpAd2bzS7PClD8xbDeG6VCQFl/iyfX5ST7SA/oJaA2wWEifm0DgJvXVuKaUlu8ofQdRYr
	51geluTq9/ogHqap/xrNzbfL27tYzrerTQVV9AXPQcx/al2e1Hr9pfdN0QfwqMHMCzTeLxUoEsj
	2Gcxd+pcpmnqY1WKEbQrtoTs=
X-Google-Smtp-Source: AGHT+IEU9PO0yxR32VGHLRInluhkBJc6vA7V1O5Akf1yuIIZlrWW3//u/D86PXo8px+15WHKk53UYg==
X-Received: by 2002:a17:90b:3b8c:b0:32e:11cc:d17a with SMTP id 98e67ed59e1d1-3305c5919bfmr10784645a91.4.1758316083438;
        Fri, 19 Sep 2025 14:08:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5621:6657:a035:d5ee])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ecc735627sm5464555a91.1.2025.09.19.14.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:08:03 -0700 (PDT)
Date: Fri, 19 Sep 2025 14:08:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 12/19] platform/x86: x86-android-tablets: replace
 bat_swnode with swnode_group
Message-ID: <ajdmwnj7h44pphrevuwhzmpn3ugeflnrimsbdvxcuzpznotn3h@3zbh2s7pnoba>
References: <20250919204742.25581-1-hansg@kernel.org>
 <20250919204742.25581-13-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919204742.25581-13-hansg@kernel.org>

On Fri, Sep 19, 2025 at 10:47:35PM +0200, Hans de Goede wrote:
> Now that we are using software-nodes are used in more places it is
> useful to have a more generic mechanism to have the core code register
> software-nodes.
> 
> Replace the bat_swnode registration mechanism with a more generic
> swnode_group registration mechanism.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

>  
>  struct x86_dev_info {
>  	const char * const *modules;
> -	const struct software_node *bat_swnode;
> +	const struct software_node **swnode_group;

Maybe add TODO for the next release to make it

	const struct software_node * const *swnode_group;

? Greg has queued the patch to software_node_[un]register_node_group()
to take const pointer to const pointers:

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=driver-core-next&id=292cb391479d50f4379a0abab34324de92c82a92

Thanks.

-- 
Dmitry
