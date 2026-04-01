Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B093033C6
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 02:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775009369; cv=none; b=hZJGCdQsRECiCQFuJxV5CAmqPOve53VZBJOWGN8xxdUkywSENf4KQAYX1jjy7BCA/GSK42s1zrlNsHDGfb4KZq3S6ocjXmjY1GD2dXWaZxJth0KCLxYO0pmWQsPQt3sOPhbYCwzkQ383CpmQvsvGyKeNSMfSWMPWtEprBBWdmXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775009369; c=relaxed/simple;
	bh=2R6lpriRiJyGfdxQxsSHGdyW9OvyN2xr4NV/z7YXTK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSUX42NtZ7U+02aUDlnaFTqxAH3ficiTXqOfuXOJ6WDOQCPslaWukecXG/ukPXDmqaTm950pWUG1Zknfke12WirqUPKDZ5gxhi9MPhvRJPJpC/QK6uVdsv/LQfxXMSe0lJ2MF4dwvMAt6umLkasdhnzwnozOQqXRhR/6WidV1yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KB64mDUt; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KB64mDUt"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12a747e7b2fso3177916c88.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 19:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775009365; x=1775614165; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rsoAviV2wZmke+4BsttL3YCzfWLi9sYU1xca+C62Oc0=;
        b=KB64mDUt/6LvxBBo7pky2a4+83zjiHQl09bIvdr6xOm/D5tWedOFTuMbH5Cn2RH6ty
         0nunWApA/l+UMNjcYARLfIaog14IG+oGQlGwhe3uXc7KlWAnWiwkfedhKV/my/Iw+mg5
         ZxFCqzG2TkXtf3XJDiWEMLjGd5HURepY3sElQxuwPFhskJlBFE2lcH0up2pMuVuc7AXd
         3gi+0QMQK50lS68YRdp+0RcnybIvCjzJsvS8DwWcFcv5RP0RtqJxtSxLstE5k53Qcqxo
         M6+34vPUFbOU4TnX2HvM5R4vKNuRx+HaajBfP6+SIR7pk+Mc90/uS45RKqaXmfajHVT1
         Niug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775009365; x=1775614165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsoAviV2wZmke+4BsttL3YCzfWLi9sYU1xca+C62Oc0=;
        b=lXDzMmbHj43P1dB3l5RlXQSJmjOA9Ihyn1gcmUoslvZUoiIDkotMB+kySOg/82ysM0
         f/vWVLl1IaDPUYDuRrJsDY837QyRuT+1H2iW9HDqYZP38v+rX/sZdEfNkN69dW7v53Pj
         9BaRArEfuI+L9OcimyeHMyiTfA6LwzUV3qTb/k4tQz4VujptwXa5+2zgZ2MY1U5hS0mu
         DON3BXmerqLRy2CtE7USplQFuCTuXzgTziyndhUw72uHXaaEcAkesYtSsPBeUkPBbW18
         T9/1B5qxqcjghrNlcFMwNm2Hi+1P5evwsa3cex165c+C+ru8igGklrvZIwTampTADnmO
         XN3g==
X-Forwarded-Encrypted: i=1; AJvYcCVUVrKhcIgfoOKbzEZQM1CGnp91X2o//vKqabNjPQqdlJ/eS9VI76EFZ5FhSAz/ygahNlzjP3RvCl1He+PEVfMymPbO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3i5/wJqkwaBYhG9XNpeQfo5y27IVEwVYBgSt8l3WiKK5RuppH
	yDyc00C5DjsONGx5RXlkmHF03h7AGCbbLeq/Tg74zO6gABlWORqf3NWA
X-Gm-Gg: ATEYQzyLpbF/Otq5QH/x/QEYIxyoBBpHPVAlR0hWaj89HZ3aOP8eHvtVMsTr+WZfZdw
	+zrCSddUPrU2QY9w3DVNU8Yz3mGFPxrYeZk5zDhChgEBrBvmEO4xFYlEJ+IqJQIq8X9IBD9Jmgy
	Z5CU0/qWc4btm7yuD9fSm+3ie/41mxbqVKPS3NLvP0DHHF7In0J/SDneVBO2UrcyB4dnsmq3Qia
	ekVIxGOxKM6MNlMRRpwAl1DUwWf8Wp4kAQEb6b9iVSDQ+x1U7j/SilycmzYXPcxSDJbRASPvHAC
	gOC5GlCFglQOkz9uf+iLbuKixT4rY37DN1+2+J1QbPtpfS3fhuDoAvXdk2/uPrTE1kROGmW1WBM
	wkBUQVmZXu4B/kHygbjgdpn2UVhLWA6i3X8UwLaLx6Tyl2iilNm8Cn3Fb/zE9CiS2A/A242F63R
	oS7shqPy5w6KoyaXwKT0Gsod242lsauxkVfTOXiaVfQyYrHKZU60qD0kM7daSWr2eF
X-Received: by 2002:a05:7022:602:b0:128:d2f2:5cf8 with SMTP id a92af1059eb24-12be6575e03mr1074170c88.34.1775009365163;
        Tue, 31 Mar 2026 19:09:25 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:1dbf:b0e0:8ad0:5a2e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12abde65313sm11136129c88.14.2026.03.31.19.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 19:09:24 -0700 (PDT)
Date: Tue, 31 Mar 2026 19:09:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
	Peter Korsgaard <peter.korsgaard@barco.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Subject: Re: [PATCH] platform/x86: barco-p50-gpio: attach software node to
 its target GPIO device
Message-ID: <acx9veIH-t5cCVc_@google.com>
References: <20260331112819.103298-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331112819.103298-1-bartosz.golaszewski@oss.qualcomm.com>

On Tue, Mar 31, 2026 at 01:28:19PM +0200, Bartosz Golaszewski wrote:
> The software node representing the GPIO controller to consumers is
> "dangling": it's not really attached to the device. The GPIO lookup
> relies on matching the name of the node to the chip's label. Set it as
> the secondary firmware node of the platform device to enable proper
> fwnode-based GPIO lookup.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/platform/x86/barco-p50-gpio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
> index 2a6d8607c402..5f4ffa584295 100644
> --- a/drivers/platform/x86/barco-p50-gpio.c
> +++ b/drivers/platform/x86/barco-p50-gpio.c
> @@ -365,6 +365,8 @@ static int p50_gpio_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret, "failed to register software nodes");
>  
> +	set_secondary_fwnode(&pdev->dev, software_node_fwnode(&gpiochip_node));
> +
>  	led_info.fwnode = software_node_fwnode(&gpio_leds_node);
>  	p50->leds_pdev = platform_device_register_full(&led_info);
>  	if (IS_ERR(p50->leds_pdev)) {

I looks like http://sashiko.dev patch critique is on point:

"
Is the software node attached too late to take effect?

In the probe function, devm_gpiochip_add_data() is called before this
set_secondary_fwnode() call. During GPIO chip registration, the gpiolib
core snapshots the parent device's fwnode.

Because the secondary fwnode is not yet set on pdev->dev when this snapshot
happens, the GPIO device is registered with a NULL fwnode, which seems to
defeat the purpose of enabling fwnode-based lookups.

If the order is reversed, would we need to tie the software node
registration to devres (e.g., via devm_add_action_or_reset)? Otherwise, a
manual software_node_unregister_node_group() in the probe error path might
free the software node while the devm-managed gpiochip still holds a pointer
to it.

Additionally, could this leave a dangling pointer on probe failure or driver
unbind?

If a subsequent step fails (like registering keys_pdev), the probe error
path calls software_node_unregister_node_group(p50_swnodes), which frees
the underlying memory.

Because set_secondary_fwnode(&pdev->dev, NULL) is never called to clear it,
pdev->dev.fwnode would point to freed memory. Any subsequent access to the
device's firmware node could trigger a use-after-free.
"

Thanks.

-- 
Dmitry
