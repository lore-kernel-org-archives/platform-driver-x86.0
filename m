Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5E226AA86
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 May 2025 07:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777190; cv=none; b=O5aBlKwftrFpXNEJScTYCbiW6Fs7i18UC7ShC0zfXOoWrst3aS6jsq3E4h1RlQEs/awBK820ViGn4J3T3sSrsrwkBdbF5zqfNkblBCbhWX9U8CsonFgfTMUfiXpnZpZKIRShG0w6HoaS8Sq64Iud9DzsH2byFwXykZhkkr99vv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777190; c=relaxed/simple;
	bh=wvsoq9Sdi8DWjSuMKUuSpcxMkHbVlmg2Z1QmEwHnMZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bF7AAeD49bmGsk+jfrDRiSr0v4+VwR8Q7nOj7rKr+YNNpgxrb80w5lk3AoiVWYXUx9KD+0wDwyXqsunt3LSJNApDfoYxe+OGOQv2vpkSiUNqkJ0uEUReeTcftvgkLxvnLSV68gN+KMjfBIfziWjxBDovkhNEAW+7sNY65xd6vC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FODEuIoA; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FODEuIoA"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a1fb17a9beso50790f8f.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 May 2025 00:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746777187; x=1747381987; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=khOVSgHrq9F3kYIkTXafiDZzq0MUbKupXswFcmbZrm0=;
        b=FODEuIoADXh9FdwGOrKCvOs1c1Fuh+Wr14VMNb+p9sB/AfLRQM2/ksCHGexMl/oWzg
         uCVGMuv13ujzbFKCPvpE6WWGu5nMv0KBiut1r/OLhTlSIzBN5xGRGpMfgFXaM3Bf95w4
         YhG+wBkl/MMieCtMx32UBQ4GYswKX+mb0Q4nGJ+k/LYoVB4bRou5bxWMU7eFNF7V/2fk
         j4ZuFN1qQTQs/If4Xfc/qEEh4l/uxdHB5nWKBSFd15FZQLHijCP15i0GJvnnFVo2dScs
         WFpgHUzkHA44PpdMOOA/WM22Gm4iSuCrBNRFmedQAVjEw39/O6/rw00WeBdnYOyUVvDN
         g54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746777187; x=1747381987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khOVSgHrq9F3kYIkTXafiDZzq0MUbKupXswFcmbZrm0=;
        b=hM4Q8Mv5pUnBrWlsdxbjlzkWNi/JqX9Et39XPKZjZYVf7NIupHfsdokhhtlRQuqQKc
         7poGTL4UjhuQndwxkSB1TOSirMgMpNxfES2dKxvCWO8A4aFyGKgappIj7lwtvimQWsoY
         lbbaYbkZlXZchfsyOyyhJhPyI5Y40zBmqAzRwvot6taCZgfSFewwwLc6QCy92N3S8KCe
         B3UMBgt3ibQwrI+73QWeSTQObEfhnNGaBkrtozfWaboNpoUwL9oNo6olnMOJVmQxPtJq
         vazajy59RaoVgt9GIW3DC8sCm+UdKfkd7n7qzqraV7a+P+695zlKkLJz1h9r/OmEsnfV
         osZw==
X-Forwarded-Encrypted: i=1; AJvYcCVC1AdvPxgONGlsARGuIpCPtFP0BiBXrA33Q22r7m0hvUzkX8DQZi8sPreAiUW7pzorIB6JuIH7qxd7QyDnWs3ycLGT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx33LbzjY7ou5cntMUXKYMc4TifIsgGEfQQsIpAbOHmjB3T9Gh+
	gTvdw4NNEX1QqiU0fCZCZ4cKpXC/+XXGNpmpnHIWoO19RjXV9MGW7aFffgIyYoM=
X-Gm-Gg: ASbGnctBP0Offt5KEZgXlVzQrfDiKaq8BmO/mKzlcDhTnCfcnqHImhO3O/LgnCVCHFO
	aoRxhzmRcQF9un9R0yDtgsUf0OagLoqv5uPK1SXbd1BaI7TOZ0P0+Poce6fmUViNsmuA/Q9G4ur
	DBH8JYas/1K9V5HNkNvQgIQCAmK1ijd9dZpbtc415mpKuob2rVR736KLcNeMo8YtqsweQjcWoG7
	iz2yEczZtFov3cJBzPiJhjEaBBgTDCHkwOBNTXkIclGcdGblYdjNqUhMVQzoWM/PtgMPaYc8D4T
	lvy2ISODPKhknPzLhUpnwMUBzmsuMLdd/jDVYkV8C/OAew==
X-Google-Smtp-Source: AGHT+IFopaMiIWWRVaT8YE0GnhsFRBgY4kEpNCgKfLtmXrkjd5oRSK4EE/d7CyzQBUjd5PV1e0VGTQ==
X-Received: by 2002:a5d:59a8:0:b0:391:300f:7474 with SMTP id ffacd0b85a97d-3a1f64374c0mr1906956f8f.18.1746777186958;
        Fri, 09 May 2025 00:53:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm2391146f8f.86.2025.05.09.00.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 00:53:06 -0700 (PDT)
Date: Fri, 9 May 2025 10:53:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com,
	Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86/amd: pmf: Use device managed allocations
Message-ID: <aB20XiyxaZPE21jp@stanley.mountain>
References: <20250507020838.2962896-1-superm1@kernel.org>
 <b10d7dcd-4026-b06a-f278-b7d46b6a0fee@linux.intel.com>
 <08862428-d104-4255-bf91-4223abda10cd@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08862428-d104-4255-bf91-4223abda10cd@kernel.org>

On Thu, May 08, 2025 at 02:33:54PM -0500, Mario Limonciello wrote:
> On 5/7/2025 4:44 AM, Ilpo Järvinen wrote:
> > On Tue, 6 May 2025, Mario Limonciello wrote:
> > 
> > > From: Mario Limonciello <mario.limonciello@amd.com>
> > > 
> > > If setting up smart PC fails for any reason then this can lead to
> > > a double free when unloading amd-pmf.  This is because dev->buf was
> > > freed but never set to NULL and is again freed in amd_pmf_remove().
> > > 
> > > To avoid subtle allocation bugs in failures leading to a double free
> > > change all allocations into device managed allocations.
> > > 
> > > Fixes: 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in amd_pmf_init_smart_pc()")
> > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > ---
> > > v1->v2:
> > >   * Correct commit message with correct offending function root cause
> > >   * Switch to device managed allocations.
> > > 
> > >   drivers/platform/x86/amd/pmf/core.c   |  3 +--
> > >   drivers/platform/x86/amd/pmf/tee-if.c | 30 ++++++++-------------------
> > >   2 files changed, 10 insertions(+), 23 deletions(-)
> > > 
> > > diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> > > index 96821101ec773..395c011e837f1 100644
> > > --- a/drivers/platform/x86/amd/pmf/core.c
> > > +++ b/drivers/platform/x86/amd/pmf/core.c
> > > @@ -280,7 +280,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
> > >   			dev_err(dev->dev, "Invalid CPU id: 0x%x", dev->cpu_id);
> > >   		}
> > > -		dev->buf = kzalloc(dev->mtable_size, GFP_KERNEL);
> > > +		dev->buf = devm_kzalloc(dev->dev, dev->mtable_size, GFP_KERNEL);
> > >   		if (!dev->buf)
> > >   			return -ENOMEM;
> > >   	}
> > > @@ -493,7 +493,6 @@ static void amd_pmf_remove(struct platform_device *pdev)
> > >   	mutex_destroy(&dev->lock);
> > >   	mutex_destroy(&dev->update_mutex);
> > >   	mutex_destroy(&dev->cb_mutex);
> > > -	kfree(dev->buf);
> > >   }
> > >   static const struct attribute_group *amd_pmf_driver_groups[] = {
> > > diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> > > index d3bd12ad036ae..50c082a78cd9e 100644
> > > --- a/drivers/platform/x86/amd/pmf/tee-if.c
> > > +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> > > @@ -532,13 +532,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
> > >   	dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
> > >   	if (IS_ERR(dev->policy_base)) {
> > >   		ret = PTR_ERR(dev->policy_base);
> > > -		goto err_free_dram_buf;
> > > +		goto err_cancel_work;
> > >   	}
> > > -	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
> > > +	dev->policy_buf = devm_kzalloc(dev->dev, dev->policy_sz, GFP_KERNEL);
> > 
> > Hi Mario,
> > 
> > Isn't ->policy_buf freed and another allocated in amd_pmf_get_pb_data()
> > and this patch lacks any changes around there?? That switch of the buffer
> > has been the reason why I've not suggested using devm_*() for earlier for
> > it.
> > 
> > Please check all related code to the pointers you're changing if there
> > are other similar traps you have not taken into account.
> 
> Ah, thanks I thought I caught them all but missed that instance.
> 
> A few options that come to mind:
> 1) instead make the very first allocation POLICY_BUF_MAX_SZ, and then never
> reallocate for the life of the driver.
> 2) Don't allow sideloading a bigger policy than the original one in the
> firmware.
> 3) Don't switch all 3 to device managed like this patch, just switch the two
> that can and fix the one broken one causing a double free.
> 4) Switch the case you pointed out to use devm_kfree() and re-allocate at
> that time.
> 
> Anyone with a preference?  I lean upon option 4.
> 

I feel like Option 3 is the worst...

I didn't have a problem with your v1 patch if we had fix the
amd_pmf_tee_deinit() bug as well and probably deleted the
second kfree().

I think there is a race with the debugfs sideloader, but it's
debugfs and root only so if you hit that race, then you deserve
it.

regards,
dan carpenter

