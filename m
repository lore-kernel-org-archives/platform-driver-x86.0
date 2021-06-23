Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7013CC48BC2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 19:59:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44FE460240
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 19:59:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhFWUCD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Jun 2021 16:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFWUCC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Jun 2021 16:02:02 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31738C061574
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jun 2021 12:59:45 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id d9so5016333ioo.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jun 2021 12:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QyRZz0CxA4vKbTzq6RT6NMyaKAB3bc+IKpEuJV+LbF0=;
        b=BOJ7mO/7eJabUUaN/xUbsWKbIAvUfFRHzkta2WFaXj6oRlPlQ9PeI4Xl1AOPE+s04V
         D/rQrzY08vlKsEbplhgpk2hCQ0viBWNXBAhctU6KxKnF8DB4h8F6UqZbuQQn8xd/XHW4
         S6EGsj8JD16NE+qUlh3kmYMlkr+Svf5R7OPlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QyRZz0CxA4vKbTzq6RT6NMyaKAB3bc+IKpEuJV+LbF0=;
        b=DihYHjXxmRLiXeCavSTGug6gRsKkahzylKKGK32GRblPDsXztiL68yJBRLAQgaofFE
         czrcKzFxTnDkO05iNsp0L22VmVgQ6DJ8F/zHA3KS1Xxjfg8h6i/RCyYU3dbcwXLmaku7
         eQcTzS+xaGQR4lbwzria/MSvBCCyjbdgvtcFtY/V1rfZQACuoyLpOAZeQ9xZpBkx8v6m
         itc3oXGMKowJ4mWJbiTMIQayO5MNfduELipY+K/bae7T7tMdW/szY3v/sXJe7VDFnBMi
         WBy/iTpMFXO56RVJAFVM0LzagRGB223bixMq1YTxF8C5vQBChjXcTFeZwtWy1jmx8ySz
         mAkg==
X-Gm-Message-State: AOAM532yARWyPuWsZDFv6XxyUEInAm6Il5+K8Xq1Jrt+JBGoFzpLI3jF
        cnesAVjlWfDqLyXFsZ/5fNNvxA==
X-Google-Smtp-Source: ABdhPJza54MKk7V7J2OOI66edaLYASWX5Zht+abtIi0sGz22Zc5wuC3DMspP+emXVnVltzD0QO6s8Q==
X-Received: by 2002:a02:cd9c:: with SMTP id l28mr1200296jap.61.1624478384597;
        Wed, 23 Jun 2021 12:59:44 -0700 (PDT)
Received: from google.com (h184-60-195-141.arvdco.broadband.dynamic.tds.net. [184.60.195.141])
        by smtp.gmail.com with ESMTPSA id l6sm425576ilv.58.2021.06.23.12.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 12:59:44 -0700 (PDT)
Date:   Wed, 23 Jun 2021 13:59:42 -0600
From:   Raul E Rangel <rrangel@chromium.org>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/6] platform/x86: amd-pmc: Fix command completion code
Message-ID: <YNOSriObYmzU5Qp/@google.com>
References: <20210617113040.1603970-1-Shyam-sundar.S-k@amd.com>
 <20210617113040.1603970-2-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617113040.1603970-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jun 17, 2021 at 05:00:35PM +0530, Shyam Sundar S K wrote:
> The protocol to submit a job request to SMU is to wait for
> AMD_PMC_REGISTER_RESPONSE to return 1,meaning SMU is ready to take
> requests. PMC driver has to make sure that the response code is always
> AMD_PMC_RESULT_OK before making any command submissions.
> 
> Also, when we submit a message to SMU, we have to wait until it processes
> the request. Adding a read_poll_timeout() check as this was missing in
> the existing code.
> 
> Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/amd-pmc.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index b9da58ee9b1e..9c8a53120767 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -140,7 +140,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
>  
>  	/* Wait until we get a valid response */
>  	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
> -				val, val > 0, PMC_MSG_DELAY_MIN_US,
> +				val, val == AMD_PMC_RESULT_OK, PMC_MSG_DELAY_MIN_US,
Isn't `val > 0` correct? With your change we will continue to poll even
when the SMU returns `AMD_PMC_RESULT_FAILED` or any of the other return
codes.

Or does the response register always return a val > 0?
>  				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>  	if (rc) {
>  		dev_err(dev->dev, "failed to talk to SMU\n");

If you make the change suggested above, we should check  `val` after
checking `rc`:

	if (val != AMD_PMC_RESULT_OK) {
		dev_err(dev->dev, "SMU is not ready\n");
		return -EBUSY;
	}
> @@ -156,6 +156,14 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
>  	/* Write message ID to message ID register */
>  	msg = (dev->cpu_id == AMD_CPU_ID_RN) ? MSG_OS_HINT_RN : MSG_OS_HINT_PCO;
>  	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
> +	/* Wait until we get a valid response */
> +	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
> +				val, val == AMD_PMC_RESULT_OK, PMC_MSG_DELAY_MIN_US,
> +				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
> +	if (rc) {
> +		dev_err(dev->dev, "SMU response timed out\n");
> +		return rc;
> +	}
>  	return 0;
>  }
>  
