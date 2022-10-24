Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9890C38A2D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 09:15:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbiJXJPf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 05:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbiJXJPP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 05:15:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38039AE4C
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 02:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666602874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8lWODoWZnRqtC12d+wZFs3iIp9P89f0r1Un2s48tNuM=;
        b=B19i1q709ao3Wnppyd50uWQb79x44BayxqhTsNYCWeoToGQfoXMfUDA9B2CDOwyw45WNDL
        +AYuzPJztsVnBkxbXoeQhMpqoe0aKmC5nm96qmDuAGiM0K8x9J/vpxsFGS2D8vnGASuIBS
        Ngo1BTNH8jrzz+O/+m+BfHYt34wEHkc=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-rfWumJAZPn6jojORLikVww-1; Mon, 24 Oct 2022 05:14:32 -0400
X-MC-Unique: rfWumJAZPn6jojORLikVww-1
Received: by mail-lj1-f199.google.com with SMTP id k21-20020a2e9215000000b00276ff516fa3so2469175ljg.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 02:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8lWODoWZnRqtC12d+wZFs3iIp9P89f0r1Un2s48tNuM=;
        b=XJgqPpD+8/fBmLTZteqbao8Y5DYO40hb2DpSgvh9SlHvF+CiMPe3RNnyxCOiGKhO3w
         ZgPWh1AuqgBrbxztxr8lyHl47KCGWDhzILAcdT5drJNv/q3MTlAVJTpTjcRR/WPtJeqp
         UF06jb3+Mvb/6LQBwFg5dbYj9DcO1IbvYCFv/WN5JZChcXSLRM5BmsyRoNC6pFGAQt5y
         GBrMqFylNW4wgQ6bqqv7c/GMbJ1bHikvxPkRvOdks8aFR1gtnP3jG370awX1sG7t6LaF
         SD2QwbhCNEhPWQk3a4BvmgDBWiSDQiNfT3GnUjREAtQCYNAik+dRB5E0FmiT4zUUofsp
         jEag==
X-Gm-Message-State: ACrzQf2jm9Jy575UZt1K3WcEZTkUNOFp6+QP6/7sd4JlWgS6uaaakmQ0
        ylYbgDZcH0MHp+65Ljkk2LTZVFnyQqafKcqWFQM4KyF5GfaO/R3srzZRFRMUzTKqSf1zVCI2bvm
        ClSdNkB/QVOoP83bOSWd5vUXSBXjoD+gkBw==
X-Received: by 2002:ac2:5de5:0:b0:4a2:2f3c:5db2 with SMTP id z5-20020ac25de5000000b004a22f3c5db2mr11495062lfq.635.1666602870629;
        Mon, 24 Oct 2022 02:14:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7NanSWOe2AXX1Vi9rAcrbIXDV0Q9DpnrBssdF9VlIra3Ry/KQhotHLoadCZtQi1xoEhqq1IA==
X-Received: by 2002:a17:906:fe45:b0:791:9624:9ea4 with SMTP id wz5-20020a170906fe4500b0079196249ea4mr26873373ejb.147.1666602860112;
        Mon, 24 Oct 2022 02:14:20 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709060a8b00b00788c622fa2csm15299822ejf.135.2022.10.24.02.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 02:14:19 -0700 (PDT)
Message-ID: <ada4b32a-97c6-b15d-e3f8-85c64ddba7d1@redhat.com>
Date:   Mon, 24 Oct 2022 11:14:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86: asus-wmi: Add support for ROG X16 tablet
 mode
Content-Language: en-US
To:     "Luke D. Jones" <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <20221010063009.32293-1-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221010063009.32293-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/10/22 08:30, Luke D. Jones wrote:
> Add quirk for ASUS ROG X16 Flow 2-in-1 to enable tablet mode with
> lid flip (all screen rotations).
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 613c45c9fbe3..c685a705b73d 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -464,6 +464,15 @@ static const struct dmi_system_id asus_quirks[] = {
>  		},
>  		.driver_data = &quirk_asus_tablet_mode,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "ASUS ROG FLOW X16",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "GV601R"),
> +		},
> +		.driver_data = &quirk_asus_tablet_mode,
> +	},
>  	{},
>  };
>  

