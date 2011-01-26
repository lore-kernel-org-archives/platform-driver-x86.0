From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] intel_mid_powerbtn: add power button driver for Medfield
 platform
Date: Wed, 26 Jan 2011 09:06:04 -0800
Message-ID: <20110126170604.GC29168@core.coreip.homeip.net>
References: <20110126094112.15314.79789.stgit@bob.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:49022 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753575Ab1AZRGM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 26 Jan 2011 12:06:12 -0500
Received: by qyk12 with SMTP id 12so1241638qyk.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jan 2011 09:06:12 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20110126094112.15314.79789.stgit@bob.linux.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org

On Wed, Jan 26, 2011 at 09:57:16AM +0000, Alan Cox wrote:
> +
> +	ret = request_threaded_irq(priv->irq, NULL, mfld_pb_isr,
> +				   0, DRIVER_NAME, priv);
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"unable to request irq %d for mfld power button\n",
> +									irq);
> +		goto fail;
> +	}
> +
> +	ret = input_register_device(input);
> +	if (ret == 0)
> +		return 0;
> +
> +	dev_err(&pdev->dev, "unable to register input dev, error %d\n", ret);
> +	free_irq(priv->irq, priv);
> +
> +fail:
> +	platform_set_drvdata(pdev, NULL);
> +	input_free_device(input);
> +	kfree(priv);
> +	return ret;
> +}
> +

Ugh, mixing 2 styles of error handling like this is not the best idea
IMO. Could you please adjust so that all error handling branches out of
line, like virtually every other driver we have in the tree?

Thanks.

-- 
Dmitry
