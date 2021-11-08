Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23AF2C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Nov 2021 18:39:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F281061994
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Nov 2021 18:39:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235099AbhKHSmi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 8 Nov 2021 13:42:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234914AbhKHSmi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Nov 2021 13:42:38 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC74C061714
        for <platform-driver-x86@vger.kernel.org>; Mon,  8 Nov 2021 10:39:53 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id p2-20020a4adfc2000000b002c2676904fdso1973118ood.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Nov 2021 10:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=heU/fgi1agz0H5PpY0Ar7Q54bdWg7UObfsVa5tVLsyM=;
        b=B0+uAB1+kUl4/BZ9mNfFjYyZI3lQLfyentboqtDXYzuw//u86WYhGiGdKhYS1pRY6o
         4iQRFq3KZczOltZm6AmNt0YpB5L1hBCOTdzzYqKYxahY3tR/SVKFngRqvrca7SQV/lfj
         PZ2p5fY3Db+JTXJoUFEh57jfrQrONt538ossZIz0YprSHRqRqfB7cLpYxCWLhPGxkEwi
         GSGQ8J4OsziqV0uQJp6H6oFPMqOGIi1Ej1aDytmdaKsSJ+aYkSWjO6LCoDH73o8voX/A
         C4HFzdSjqEYWomqkMgYEY6roSdAQBpp+/PkN4IOz+KySZvxkfUgTRSIiBeU0UGIC4Nio
         slgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=heU/fgi1agz0H5PpY0Ar7Q54bdWg7UObfsVa5tVLsyM=;
        b=HgreES8zx1+XH6glDRNQ0D6J1ZTVtyytSsAd8AARS9NDhnR24GJiUGMmPOCEis5EOV
         EhMGdYYJ0RCSedwMdehV2cuhLGb0Pqbjcih7KhEFWntXAVMvVnXcxuUj5nc7kuXWRfiA
         Sp/FwuMC8zFHZg/Cgdb/GWWgqYxh0g4h2Q9ZvE2T5SfNDZQnaFpg4K50bZQP2LlUS16i
         UyChS2X02yb9uBlQvqDxiGPj9lbhnH3Yl1CSwo4VXNgZYiCYCdcvzj3NhBoSCw7DWNez
         /82jnNW04J3r2rlX9Xawyw3oun2MPKNpE9cPA5AiOijiMNTMZQmikTJtYLmpsO2rdcs/
         hQhA==
X-Gm-Message-State: AOAM5308JSs+9WETVCi4p10hqnOUqAmOuqdvYEQP+L609wuw8QG7W5ag
        iuG8tcRWWv0uy1MmG5ZEzwljzg==
X-Google-Smtp-Source: ABdhPJznmpagFWV5WwMe+ghITmgC6CWRRJMNkkh6ZNhUu0O4t0RlInhI97K4utFiZcSxaNju8gvQ4Q==
X-Received: by 2002:a4a:e292:: with SMTP id k18mr774380oot.80.1636396793166;
        Mon, 08 Nov 2021 10:39:53 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l2sm6692982otl.61.2021.11.08.10.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 10:39:52 -0800 (PST)
Date:   Mon, 8 Nov 2021 10:41:27 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jarrett Schultz <jaschultzms@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultz@microsoft.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sm8150: Add imem section
Message-ID: <YYlvVwp1Zd4Wz1Lc@ripper>
References: <20211108164449.3036210-1-jaschultz@microsoft.com>
 <20211108164449.3036210-5-jaschultz@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108164449.3036210-5-jaschultz@microsoft.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon 08 Nov 08:44 PST 2021, Jarrett Schultz wrote:

> Introduce the imem section in preparation for the surface xbl driver.
> 
> Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
> Changes in v2:
>  - Created to properly reference the xbl section inside of imem
> 
> ---
> 
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index ef0232c2cf45..1da327cd49ae 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -1176,6 +1176,14 @@ gpi_dma1: dma-controller@a00000 {
>  			status = "disabled";
>  		};
>  
> +		imem: imem@146bf000 {
> +			compatible = "simple-mfd";
> +			reg = <0x0 0x146bf000 0x0 0x1000>;
> +			ranges = <0x0 0x0 0x146bf000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
>  		qupv3_id_1: geniqup@ac0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0x0 0x00ac0000 0x0 0x6000>;
> -- 
> 2.25.1
> 
