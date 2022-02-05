Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9296BC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 12:05:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbiBEMFo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 07:05:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbiBEMFn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 07:05:43 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8DADC061346
        for <platform-driver-x86@vger.kernel.org>; Sat,  5 Feb 2022 04:05:42 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id l24-20020a17090aec1800b001b55738f633so9392275pjy.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Feb 2022 04:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Gf/royeXhtkMTky+QuBKsJTOBuQeRH+k46uXQqjfhY0=;
        b=o9grIn8tGAvoWkIdrrLyoy8KuB4acUDJCqR8zwMqSPkDLu2n2ZTSUxJXH/2qnV5aEk
         jynWJ66BKuctrgdMlMiZZ4MODH4+qEl+ufdUyi6tTJ6rz4GvqLDpT/Wm4PegaYWQDmHI
         7RQLWMeWVR/ni2qFhfJIXMlxm1c3k8YPn6R5H8+ULawtl+FuStwdPFfIuLG5sYkAL5EC
         iYyp7F2z8ymnAsb4ISSf1UK0hqx5fnmcfpMKwso8ud+hfXe9pBBaZTbk+D6bG3Vz6VvA
         SmcMfoJT9tI4ORdy2+TSavH1D7cHzXRrDS10a+/V/h7vxBtnyD0MmSjHsqpRJOW/m83d
         SIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Gf/royeXhtkMTky+QuBKsJTOBuQeRH+k46uXQqjfhY0=;
        b=jYNx136RGN0eBGFGoJ71jpEb5e6INE3zFifXF9/qyFHr99lnRHzX7E+k+BHhgRTXcO
         QD+H1d6c9ev2B8Fnv9Ucizl6W0cAVEdyOge5lrNREwyUKJKDhSm06G2DJrGQsJdJYXWn
         U3MRW8BHPztyBAGWrr1qA/oQzkJ3O1d1LO3CV87Gr+OFddiYbooatekjsOpummls7ykr
         Rmiz6ZV7EumkIZGCh2rXEUHJTJcQ3qI0VjoyOeOtqJUOU4PGisw9Uc0QtP8amLNoKXUB
         wNn0LxHxRVlwCy5k7JrA/67LyTmndnm2h4iXzwhtPbwyRVGkMYugw8YUP7oqCya9Rier
         GNJA==
X-Gm-Message-State: AOAM5310Sr+aNj+Df1BIhkGdfBzuc516l8oip0nY1HAAWE4KOgKm9bfM
        /FRwaxZgFoffmvXCA43F9yc=
X-Google-Smtp-Source: ABdhPJyemBOEMQ6Z0RJ3UYTKNpV/rZe8AN4bovHHu/YFIFbq+cjQWI3lnMgu2yurGxVDHLhJxPBaxQ==
X-Received: by 2002:a17:902:ea12:: with SMTP id s18mr7750180plg.163.1644062742372;
        Sat, 05 Feb 2022 04:05:42 -0800 (PST)
Received: from [192.168.18.53] ([59.93.24.175])
        by smtp.gmail.com with ESMTPSA id l78sm5499143pfd.131.2022.02.05.04.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Feb 2022 04:05:41 -0800 (PST)
Message-ID: <94d60c8a-3716-7b29-be79-10ecad96cae3@gmail.com>
Date:   Sat, 5 Feb 2022 17:35:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix regression when probing for
 fan curve control
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220205112840.33095-1-hdegoede@redhat.com>
From:   Abhijeet Viswa <abhijeetviswa@gmail.com>
In-Reply-To: <20220205112840.33095-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Tested this out and it works as expected. Thanks for the quick resolution!

Thanks
Abhijeet

On 05/02/22 16:58, Hans de Goede wrote:
> The fan curve control patches introduced a regression for at least the
> TUF FX506 and possibly other TUF series laptops that do not have support
> for fan curve control.
> 
> As part of the probing process, asus_wmi_evaluate_method_buf is called
> to get the factory default fan curve . The WMI management function
> returns 0 on certain laptops to indicate lack of fan curve control
> instead of ASUS_WMI_UNSUPPORTED_METHOD. This 0 is transformed to
> -ENODATA which results in failure when probing.
> 
> Fixes: 0f0ac158d28f ("platform/x86: asus-wmi: Add support for custom fan curves")
> Reported-by: Abhijeet V <abhijeetviswa@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index a3b83b22a3b1..2104a2621e50 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2223,7 +2223,7 @@ static int fan_curve_check_present(struct asus_wmi *asus, bool *available,
>  
>  	err = fan_curve_get_factory_default(asus, fan_dev);
>  	if (err) {
> -		if (err == -ENODEV)
> +		if (err == -ENODEV || err == -ENODATA)
>  			return 0;
>  		return err;
>  	}
