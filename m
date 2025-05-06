Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7453C0C
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 May 2025 15:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546828; cv=none; b=MDLCVd1QYuHzsyjO6BkTEcCUCM3XUh41ohbhBiGH56YKP8Wl2fIisFlBBDq5SY19TDgPyT5AA5NO4RGZ1KTQ9rcSCj2/8Cu0zHhO1EoTn1MIdDeAF71UxxSJGXyBn/GwbAvjnkO1REzX7ESbYkMFfHUfvfhTCEU7Eq45PI4H8Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546828; c=relaxed/simple;
	bh=NOCAK7WkVVdYUK/v6OshqrcDQkQamsxazBuya9ihUvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYJ9zIxelimUi/higI+NitoA/8V4DjS6Yq9SZtz4fFAwuyjBGdUrCHHfiFGLX+jymhECI0Z8TL5fVoOQGZ7NCglv+OmWY7bNOsA596dUf1meLesIpryHFKoVvRNkF+wgeDRHKeCcT8lIO0z1hp+//Esi3RD7DQig1Ay5CH6AxDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PKs5MvC6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PKs5MvC6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c0dfba946so4845852f8f.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 May 2025 08:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746546824; x=1747151624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Z7460v/YyufE5PufKwAYzca4JVxyK58RpnMVYpPj8I=;
        b=PKs5MvC6/hd1mDmbmJTycGtGcTyabpWa5YAJ4t0JQwXOR++KyrWhxSA0j5fgcNlrSv
         rrZkSht6TysKTQ3/nMKectQltclsjI1Ynis/xwSZqV+3axrNe2URWj0jxH2moP+ukWT9
         jnPPZfnlLuygnTHAOkXg73/vh2Jqo7hbhu2lU9xO4Zf19g6Bfsb60tBZ6TmLvwrVrkIb
         pd/O4Ay5fkdjDZshzYPByIgNgJT30Wrvf0nEjRjM4yZq83Tc90OkxkGTlKYoBZ7Y2K8N
         fMl1VH+6FsHWhEh7zXbD4D/akVndNYTYxX/wX/GJAS3vkxr8bhU2wL9kGAu3ygJ9darE
         k19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546824; x=1747151624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Z7460v/YyufE5PufKwAYzca4JVxyK58RpnMVYpPj8I=;
        b=oRUYgb8FSApzfKRBchfkx+zb4uBa3np0NOWLZ7T3RoSUInrNWGulRlaANuXl/AXqCi
         edM2bJo21Xxti+AGqycJ7H90k9YazK81+xI8MCzqxoTgrQpxWxi/QwytU9eY185ooH9B
         /kyvespyzeixxGg/8+P9FYVat3yts+qaL5qsXr7OieSQhRGfiKWMEZfYtd6Y1Cxv5Tmh
         KwOoTkQH8RMwjJ7PKu6Eb//jlxVqn1bQgA4WbGdvkthjR1UtCEzCVuBQuaatIOOK2Q8K
         BNsOL9cQ8xntopb1+CvxwTg263s3Q5MAoVbmPd5HCEEqsCO54dNu3GjLQbWmkmGgZSYx
         mttQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2fitKVnzr2/Eo1tXnSoIaNdUOa3VZpXc2plCOGiuKK/7r1VS136V2zPl9w7mUcZX8rhBRDsgeL0PPvlqtHW/mlJWJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwMmfM1H9eqjYHYbZnAo3E7skXxq7T4yBLewCI5DO5/JMv7JM1E
	b4+s+7SU82LohfINoL95+EzF89o4rezf09v0lhaoKbaaQLz2HFF5S7mpzMXL4OI=
X-Gm-Gg: ASbGncsMAPKeZ+ZtlbCW2MfGq8hxEyPE6gzAJJUhCgkNidbpcGE2xm2lUbN4o6YC/1p
	+hfzhFrjkdkbe3f5GYe2TKUQD7kpfoX/EgDHDqEWaq01o+dib1VvzKEm7GIuMNO0L4KoEN0l6Sx
	6heeqcoT753BJ5jD8R3RB1rdGcNcHU/GhwmzGXLGdd2eCfk/+LXqCjBVOFZlUYFcS3lCUS/qc1N
	p8DhSEkZNzVlb4wE1hACmRjwxS0YHGoq4+ItgJ/BTnvgQ9Cai3L0r3Q4ECrpcLn203Z5h5kijf6
	V5rrBNUy8D0lfTyPr6323txthiYPLrMtvhXo6MNiNMlYvA==
X-Google-Smtp-Source: AGHT+IH7lD5iw/I838nWjUeh8w1iONnOj/GqmGRlt/8klLgjD10cZ30iAd38e3lEhYGPVv5aRtayCA==
X-Received: by 2002:a5d:5c84:0:b0:3a0:ad55:c9f1 with SMTP id ffacd0b85a97d-3a0b4864051mr57869f8f.12.1746546824675;
        Tue, 06 May 2025 08:53:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a09a002899sm13668923f8f.0.2025.05.06.08.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:53:44 -0700 (PDT)
Date: Tue, 6 May 2025 18:53:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] drivers/platform/x86/amd: pmf: Fix a double free on
 module unload
Message-ID: <aBowhD4lwc017-NE@stanley.mountain>
References: <20250506131130.1446262-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506131130.1446262-1-superm1@kernel.org>

On Tue, May 06, 2025 at 08:11:29AM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> If setting up smart PC fails for any reason then this can lead to
> a double free when unloading amd-pmf.  This is because dev->buf was
> freed but never set to NULL and is again freed in
> amd_pmf_deinit_smart_pc().
> 
> Explicitly set pointers to NULL after freeing them to avoid the
> double free.
> 
> Fixes: 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in amd_pmf_init_smart_pc()")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/tee-if.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index a1e43873a07b0..48902f1c767c6 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -579,10 +579,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  	amd_pmf_tee_deinit(dev);
        ^^^^^^^^^^^^^^^^^^^^^^^

>  err_free_prev_data:
>  	kfree(dev->prev_data);
> +	dev->prev_data = NULL;
>  err_free_policy:
>  	kfree(dev->policy_buf);
> +	dev->policy_buf = NULL;
>  err_free_dram_buf:
>  	kfree(dev->buf);
> +	dev->buf = NULL;
>  err_cancel_work:
>  	cancel_delayed_work_sync(&dev->pb_work);
>  

This is a real bug.  Did you find it from testing or reading the code?
My reading of the code says that this bug can only occur if
amd_pmf_register_input_device() fails, right?

We can only call amd_pmf_deinit_smart_pc() if amd_pmf_start_policy_engine()
succeeds because that's where we set:

	dev->smart_pc_enabled = true;

This patch doesn't totally fix the problem because we would still call
amd_pmf_tee_deinit().  That's why I suspect you found this by auditing
the code because I think that remaining bug would trigger a stack trace.
I also worry that there is a small race window where we could trigger
amd_pmf_tee_deinit() before amd_pmf_init_smart_pc() has finished
running.

Another bug is that we should cancel the work before freeing all the
pointers.  This looks like the more serious bug.

What about if we only set dev->smart_pc_enabled = true if the whole
amd_pmf_init_smart_pc() has succeeded?

regards,
dan carpenter

