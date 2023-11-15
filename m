Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36514C072A2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Nov 2023 16:17:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjKOQRY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Nov 2023 11:17:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjKOQRY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Nov 2023 11:17:24 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66DA6D5
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Nov 2023 08:17:20 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50a6ff9881fso8780714e87.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Nov 2023 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700065038; x=1700669838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3qRdRIQB+SyLD/2SSSnhRbTBC1T+kT3kqoQQAJb6ZGk=;
        b=tyUzCfXUfjuyWxENabaWJnV2OSyvqNR7EAWA0zT2WntfZHI3s6xG04BXO/R8sk/+YD
         MXsDRtoBW2LdtRzcmpIk/h/N9xBOCTRkC6sdyqv+pcMpwCWHI8RpfNKosESC9/ca/q1T
         /mV5SXOA5FvbpJ7WCnt74/AjFRRi1SGDG3deh979EwjPtLFfjpVWCDj3vdD3F6bNhZE8
         Y+yBlGGVcPbx3gEjSH2NvfnM1WQF5W6jm/9FdhGandDK5j7w1DNn1xFx3okl1Thzft/7
         XAXqHup/En7RKolTYnwn328dVHmm+2BK/1oHwFX3Z9qqr/bV/yWaUAAruY3OgnZ0LCIB
         nZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700065038; x=1700669838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qRdRIQB+SyLD/2SSSnhRbTBC1T+kT3kqoQQAJb6ZGk=;
        b=JjzsYoXJezxWj6IN7BZNXT5QKCYGmEJQpq7uu3AaENSz2qXfrEy7KuyH5VeDvyJ5M0
         wU90gCxCp3b7uQijDHkVb8XmJRwF2K4HSEvpxfo4x8eJgZ2LvA7FQJpXJJy/0MA2gaPz
         WGy0HpKNUS2ZoAYidx1bjrX5oL+v4YlM3DnYZXQNphpfkqp+IoEB8S1bXcaMAauhJdo0
         wymyCvsDW9FXJ86PVKj1m12C5QLIwwmWiyyTT7SJg2/UJ+x8ngh4UI2MFRQjeVmAB5eU
         A0gluba5FJD1sR4mkAM10KqK9C4Z28VRY9mkIxDeLpWOZlZ4k4d21/VxYvCbtvxKy+mh
         DaWg==
X-Gm-Message-State: AOJu0YxbUaTKZ11t8N/ujz/KzkP/qA/jcPsbuzRzAm3KQJqUukLjOikM
        4ehH2Cx1hZgoCTB3ZuPShwpHhg==
X-Google-Smtp-Source: AGHT+IGDqUKQj8i4ksmCvgTifMSpJYI6UUhnm2dFhWerlnxd1hBxKHSzpcMr+i8toBc2SR9Oy0cD/w==
X-Received: by 2002:ac2:43a3:0:b0:509:3bba:e8a with SMTP id t3-20020ac243a3000000b005093bba0e8amr8552355lfl.39.1700065038548;
        Wed, 15 Nov 2023 08:17:18 -0800 (PST)
Received: from [172.30.204.150] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x17-20020ac24891000000b00507962dd2aesm1692517lfc.207.2023.11.15.08.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:17:18 -0800 (PST)
Message-ID: <1df726c4-745c-4b41-be04-d3081525210d@linaro.org>
Date:   Wed, 15 Nov 2023 17:17:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qrb5165-rb5: use u16 for DP
 altmode svid
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20231113221528.749481-1-dmitry.baryshkov@linaro.org>
 <20231113221528.749481-4-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231113221528.749481-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 11/13/23 23:13, Dmitry Baryshkov wrote:
> Follow the bindings and use 16-bit value for AltMode SVID instead of
> using the full u32.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Fixes: b3dea914127e ("arm64: dts: qcom: qrb5165-rb5: enable DP altmode")

(because it was previously not compliant with bindings)

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
