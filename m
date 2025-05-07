Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3E61D61BC
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2025 07:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602559; cv=none; b=VcsS/tqFLc5Asv3vQl9F25rQQMWabyyXmYC2dMo6fUkLNkKNcODhtaTpoIc1jw0EHp3Rnh7DjSIJU6Y3cAd3+AAKJBTrlAnpXbQ7h42cnl26tfrsfpcpEYR59saJ7fyPe+jzcahF41e9+xbhZHUA4yE88899rZRB0EcY3ZAVBHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602559; c=relaxed/simple;
	bh=GLPob0R5jZ7tYNrPSzgofxau6DyB61v2JCxWTjdH3y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cENyfZVxIsVa4E/yq2328n8Y2/kWASRO8dJsO+ZyuuD6nl9fZpi+i7xr8ZDGhVgnUi9oFZnQqrx0HOgDMfVKUOtGCjUWavDClmw6gc5muA3h0uY5S1F9W9uJmzfFaaUzBojAXcto6GFi8tD1FWHiipW8XPcdPsrtKYF41lMn4rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b7J6OtgF; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7J6OtgF"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso7013430f8f.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 May 2025 00:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746602556; x=1747207356; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=69raFDVHNcb/taTnxHpd9YhjnhSZXRNZ9khxgQS9W9U=;
        b=b7J6OtgFsQwK3y+hdUxEzwsJYfZN+vvgHnOJZS/ivzQYhVfoRLUzqJm2zytMMDlTYw
         dVAYoUUtuxHpK7Nf6DDnYKVm7qNfV+KCKiMubswxH4FYbgfrAivGywQN9WipX5MD8cyo
         03z5VAgPoY1cE93PSlGb4ero4j0YYC7wJ2wzmzMXf+GnTi2vfZ+w3kQ87ccmqrdo/+fZ
         bettXgmJhljxOyvw+T4kqjNyT3mgr3PSkfMI9t8MHKG0m2on6WO6cffcSkhZsdUT9bp1
         6T6ikTRZdui6ro8tJYjoitmR4jJumcjpx8Gg6zge+HaL5Wmp3GWInb+HVs9WIfh8LtII
         3anQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746602556; x=1747207356;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69raFDVHNcb/taTnxHpd9YhjnhSZXRNZ9khxgQS9W9U=;
        b=Ib9/Pv+M0vlBKeslOB3ZwLMFLLwgZySBg1iiL66WmCijeSLKN0TKVIptorygAv4KtH
         CGigfVM3POblkadj6kVT9R7/98eRLqCc01VvtlIPdKGgUb11nqRWohnxqcFJHl+3pKS7
         wp+HrBCYIi7RVh4PmeRuc680uWgG4PGIRISJvGv5AThLLyvQ8WsGq77QrH3nfI1my4Y/
         0JFp0Xu2DLSogZaNC31xlsxVi/OH5QL1kR98QP1Myl4KfmTenrbrVSwu93rU8embWen8
         JGsKZVILw9eRF5Yeb1BYg/PTZlBa7J7tX1sgsMR9mKrBWZdtdsoxn8bdxHG+T3P5jOv0
         zl/A==
X-Forwarded-Encrypted: i=1; AJvYcCVW4UJZdH4mVIvYMhv+j2l2z50cUw0BMr5WI92yuP8JzXRiF+04B4IQS0aAS1R2CpCWPXc8nuc/4RsOQIdNdnc84X8a@vger.kernel.org
X-Gm-Message-State: AOJu0YzgDSfsf30pU/qsHcaJC0IMtYwglVmJkPPaPr56lZ2lqkn3gh1T
	kwLDMq3ExBReOlrU+lWSGymNz+iVVuEVR+3UMrWBC5vGaphwYhOlWPlC/wlkUCEpaG10StHtt9e
	H
X-Gm-Gg: ASbGnctQD+JVHe5HWR67JzAUuI2jctV6N1Oz6gVg5PK9KjjPaDIU3Lbai4dXq1It/O3
	N693/B58gRRlTQ5GPHO/o/DlpcNL1vqeerw2tPnnZWh30NTAoKqB79wlaXw8P/prmv21+DOKT0z
	uKu4vOo3OYViUcu36C5t2MPOhMEvwGohjGQCFyjHW2o2rd3gd+MnPAVYRmuV4Re/PaaOMzBK/iq
	KCN3Oe/OgaQfNhtDqycg0dRMlI30rbsJDw4hSUqqAEVR/Aw6mlIfIwvXx4rDspEiz1EujMZA6fs
	8NyZe7ogVLckBnFXQcRdoQhza3A9n7/UZCHYrWAO5q0Nhw==
X-Google-Smtp-Source: AGHT+IFM5ONWsMRyKkNBIsGfMDj/ImaSCorIOdM2jXY26FxphXVxsVl79Bl1eFrUQ8xbmb8pxmckWQ==
X-Received: by 2002:adf:f4cf:0:b0:3a0:b55f:dc25 with SMTP id ffacd0b85a97d-3a0b55fdc32mr1114039f8f.17.1746602555695;
        Wed, 07 May 2025 00:22:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b348419dsm2556340f8f.23.2025.05.07.00.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:22:35 -0700 (PDT)
Date: Wed, 7 May 2025 10:22:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mario Limonciello <superm1@kernel.org>, Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] drivers/platform/x86/amd: pmf: Fix a double free on
 module unload
Message-ID: <aBsKNrn6hdbHswPj@stanley.mountain>
References: <20250506131130.1446262-1-superm1@kernel.org>
 <aBowhD4lwc017-NE@stanley.mountain>
 <fce0ca00-3d0b-48a8-ad97-9125f4297f05@kernel.org>
 <528c230b-978e-4cb3-9339-0569bcbb16bc@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <528c230b-978e-4cb3-9339-0569bcbb16bc@amd.com>

On Tue, May 06, 2025 at 08:49:12PM -0500, Mario Limonciello wrote:
> On 5/6/2025 11:11 AM, Mario Limonciello wrote:
> > On 5/6/2025 10:53 AM, Dan Carpenter wrote:
> > > On Tue, May 06, 2025 at 08:11:29AM -0500, Mario Limonciello wrote:
> > > > From: Mario Limonciello <mario.limonciello@amd.com>
> > > > 
> > > > If setting up smart PC fails for any reason then this can lead to
> > > > a double free when unloading amd-pmf.  This is because dev->buf was
> > > > freed but never set to NULL and is again freed in
> > > > amd_pmf_deinit_smart_pc().
> > > > 
> > > > Explicitly set pointers to NULL after freeing them to avoid the
> > > > double free.
> > > > 
> > > > Fixes: 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in
> > > > amd_pmf_init_smart_pc()")
> > > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > > ---
> > > >   drivers/platform/x86/amd/pmf/tee-if.c | 3 +++
> > > >   1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/
> > > > platform/x86/amd/pmf/tee-if.c
> > > > index a1e43873a07b0..48902f1c767c6 100644
> > > > --- a/drivers/platform/x86/amd/pmf/tee-if.c
> > > > +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> > > > @@ -579,10 +579,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
> > > >       amd_pmf_tee_deinit(dev);
> > >          ^^^^^^^^^^^^^^^^^^^^^^^
> > > 
> > > >   err_free_prev_data:
> > > >       kfree(dev->prev_data);
> > > > +    dev->prev_data = NULL;
> > > >   err_free_policy:
> > > >       kfree(dev->policy_buf);
> > > > +    dev->policy_buf = NULL;
> > > >   err_free_dram_buf:
> > > >       kfree(dev->buf);
> > > > +    dev->buf = NULL;
> > > >   err_cancel_work:
> > > >       cancel_delayed_work_sync(&dev->pb_work);
> > > 
> > > This is a real bug.  Did you find it from testing or reading the code?
> > 
> > I found it from testing.  I was testing some other unrelated changes and
> > found that unloading/reloading the module eventually lead to problems. I
> > tracked it down to your change.
> > 
> > > My reading of the code says that this bug can only occur if
> > > amd_pmf_register_input_device() fails, right?
> > 
> > No; it was happening from a failure where the system didn't have a
> > policy or had a "bad" policy.
> > 
> > > 
> > > We can only call amd_pmf_deinit_smart_pc() if
> > > amd_pmf_start_policy_engine()
> > > succeeds because that's where we set:
> > > 
> > >     dev->smart_pc_enabled = true;
> > > 
> > > This patch doesn't totally fix the problem because we would still call
> > > amd_pmf_tee_deinit().  That's why I suspect you found this by auditing
> > > the code because I think that remaining bug would trigger a stack trace.
> > > I also worry that there is a small race window where we could trigger
> > > amd_pmf_tee_deinit() before amd_pmf_init_smart_pc() has finished
> > > running.
> > > 
> > > Another bug is that we should cancel the work before freeing all the
> > > pointers.  This looks like the more serious bug.
> > > 
> > > What about if we only set dev->smart_pc_enabled = true if the whole
> > > amd_pmf_init_smart_pc() has succeeded?
> > > 
> > > regards,
> > > dan carpenter
> > > 
> > 
> > Right; it's only set when amd_pmf_start_policy_engine() succeeds which
> > was not the case for me.  This makes me wonder how exactly this was
> > happening [amd_pmf_deinit_smart_pc() would only be called from
> > amd_pmf_deinit_features()].
> 
> Ah I think I found the actual callpath.
> 
> It's amd_pmf_remove() that has kfree(dev->buf) - that's probably what's
> actually tripping it.

Great!  There should be no need to call kfree(dev->buf) there because
amd_pmf_deinit_features() will do it.  Could you add something like
the following to your diff?

The changes to amd_pmf_ta_open_session() are unrelated actually?  Do
that in another patch?

Setting dev->tee_ctx to NULL will prevent amd_pmf_tee_deinit() from
being run twice.

We only need to cancel the work once it has been scheduled.  We
scheduled it for 3 seconds into the future so it will be canceled and
that bug won't trigger in real life.  But freeing the pointers before
canceling is ugly.

regards,
dan carpenter

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 96821101ec77..0a494d6e8fcf 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -493,7 +493,6 @@ static void amd_pmf_remove(struct platform_device *pdev)
 	mutex_destroy(&dev->lock);
 	mutex_destroy(&dev->update_mutex);
 	mutex_destroy(&dev->cb_mutex);
-	kfree(dev->buf);
 }
 
 static const struct attribute_group *amd_pmf_driver_groups[] = {
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 14b99d8b63d2..b332b5470398 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -407,12 +407,12 @@ static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id, const uuid_
 	rc = tee_client_open_session(ctx, &sess_arg, NULL);
 	if (rc < 0 || sess_arg.ret != 0) {
 		pr_err("Failed to open TEE session err:%#x, rc:%d\n", sess_arg.ret, rc);
-		return rc;
+		return rc ?: -EINVAL;
 	}
 
 	*id = sess_arg.session;
 
-	return rc;
+	return 0;
 }
 
 static int amd_pmf_register_input_device(struct amd_pmf_dev *dev)
@@ -447,7 +447,9 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid)
 	dev->tee_ctx = tee_client_open_context(NULL, amd_pmf_amdtee_ta_match, NULL, NULL);
 	if (IS_ERR(dev->tee_ctx)) {
 		dev_err(dev->dev, "Failed to open TEE context\n");
-		return PTR_ERR(dev->tee_ctx);
+		ret = PTR_ERR(dev->tee_ctx);
+		dev->tee_ctx = NULL;
+		return ret;
 	}
 
 	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id, uuid);
@@ -487,9 +489,12 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid)
 
 static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
 {
+	if (!dev->tee_ctx)
+		return;
 	tee_shm_free(dev->fw_shm_pool);
 	tee_client_close_session(dev->tee_ctx, dev->session_id);
 	tee_client_close_context(dev->tee_ctx);
+	dev->tee_ctx = NULL;
 }
 
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
@@ -512,7 +517,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
 	ret = amd_pmf_set_dram_addr(dev, true);
 	if (ret)
-		goto err_cancel_work;
+		return ret;
 
 	dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
 	if (IS_ERR(dev->policy_base)) {
@@ -576,6 +581,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	return 0;
 
 err_pmf_remove_pb:
+	cancel_delayed_work_sync(&dev->pb_work);
 	if (pb_side_load && dev->esbin)
 		amd_pmf_remove_pb(dev);
 	amd_pmf_tee_deinit(dev);
@@ -585,8 +591,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	kfree(dev->policy_buf);
 err_free_dram_buf:
 	kfree(dev->buf);
-err_cancel_work:
-	cancel_delayed_work_sync(&dev->pb_work);
 
 	return ret;
 }
