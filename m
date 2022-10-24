Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF8BC38A2D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 22:45:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbiJXWp0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 18:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbiJXWoq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 18:44:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349BD1BBEC5
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 14:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666645581;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dTJ78Wi/Bn4a7gXM5FhlU/stXOGbP+8r4N7PUdsa5sU=;
        b=P+V779H4EmgwWOX9AwVciYMzSxh6GBA4H64PsrkQL/X2YT86jMmT25VUGsI+uaqLcTcJN0
        tLfXausBtYqwDlF8vm5JaWziEUMKtQyu8Mf4JP4orkWu4oBJ9sOq3PJ66FhfhLrbJYZa8X
        q3VMkl/dDQk1x5G8k9IWA9CLONzLyRo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-124-V3PwpCuTOiOA4ddhaWwxPA-1; Mon, 24 Oct 2022 09:27:44 -0400
X-MC-Unique: V3PwpCuTOiOA4ddhaWwxPA-1
Received: by mail-ed1-f70.google.com with SMTP id w17-20020a056402269100b00461e28a75ccso1935503edd.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 06:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dTJ78Wi/Bn4a7gXM5FhlU/stXOGbP+8r4N7PUdsa5sU=;
        b=XEU3wiZoH3FROGHK6cDbrD2KWApGlvycnauTcL+BaDGFWcr/SAeSN8SlkEpnrD4uiH
         fBQZg8e7Tb6T0O/19pFM9lCDOlbzIXO8q7aESW9DP6ChAe6sz/qF/jIO5HbFBClJm09V
         UXuUET+HDuI+YqkN5mCbv3hijCxcn1YBWM1sQbIx/fQEpw5e4wb7j2UvjZ/PLXsVcPyj
         qZlvkkUKOUMdi9BSWRHEEm3kQ+y1f7w2E3WkT/b0/7BzbrVsMH+pN7R/Nulmyks7xqrg
         XAnOvlZopvzQMTQ3nic37xnhq9eg05+SbGrIEPP6hso9cufPrmhbQqwpAhCK8uHjzy+s
         bPAg==
X-Gm-Message-State: ACrzQf0Mz/QzC6Qnumtmamw5II4PeB4w79SBD3RW9/7yKCVjnwEEfdpQ
        TNtBanyPOOTBDDZLy1KRBeSpQm4FkSHq6IFmr9JvjvkV1ilKVhOqFKlYpUtlruv8G9gIB9bXdjF
        e8RxeY+xpZAYEqcl1ypcMBFUZu6yJxpB5eQ==
X-Received: by 2002:a17:906:ef8c:b0:78d:96b9:a0ad with SMTP id ze12-20020a170906ef8c00b0078d96b9a0admr27988621ejb.529.1666618062846;
        Mon, 24 Oct 2022 06:27:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6PLjdH/SJdBXM7kRQutOhLpzW+wJVl2He++jL7fQe3kHCU8K+TJwxVcv/vyNeVOcmgxY6WUw==
X-Received: by 2002:a17:906:ef8c:b0:78d:96b9:a0ad with SMTP id ze12-20020a170906ef8c00b0078d96b9a0admr27988610ejb.529.1666618062644;
        Mon, 24 Oct 2022 06:27:42 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id p17-20020a05640210d100b00461c1804cdasm2100885edu.3.2022.10.24.06.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:27:42 -0700 (PDT)
Message-ID: <116e3615-a0fc-3b88-18e1-c03c29bf78fd@redhat.com>
Date:   Mon, 24 Oct 2022 15:27:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86/amd/pmf: pass the struct by reference
Content-Language: en-US
To:     Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Gross <markgross@kernel.org>
Cc:     kernel@collabora.com, kernel-janitors@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221004081019.619193-1-usama.anjum@collabora.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221004081019.619193-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/4/22 10:10, Muhammad Usama Anjum wrote:
> The out structure should be passed by reference instead of passing by
> value. This saves the extra copy of the structure.
> 
> Fixes: 1738061c9ec8 ("platform/x86/amd/pmf: Add support for CnQF")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Applied (minus the fixes tag as this is not a bug-fix):

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
>  drivers/platform/x86/amd/pmf/cnqf.c | 92 ++++++++++++++---------------
>  1 file changed, 46 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index 668c7c0fea83..3f9731a2ac28 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -158,100 +158,100 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
>  	return 0;
>  }
>  
> -static void amd_pmf_update_trans_data(int idx, struct apmf_dyn_slider_output out)
> +static void amd_pmf_update_trans_data(int idx, struct apmf_dyn_slider_output *out)
>  {
>  	struct cnqf_tran_params *tp;
>  
>  	tp = &config_store.trans_param[idx][CNQF_TRANSITION_TO_QUIET];
> -	tp->time_constant = out.t_balanced_to_quiet;
> +	tp->time_constant = out->t_balanced_to_quiet;
>  	tp->target_mode = CNQF_MODE_QUIET;
>  	tp->shifting_up = false;
>  
>  	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE];
> -	tp->time_constant = out.t_balanced_to_perf;
> +	tp->time_constant = out->t_balanced_to_perf;
>  	tp->target_mode = CNQF_MODE_PERFORMANCE;
>  	tp->shifting_up = true;
>  
>  	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_QUIET_TO_BALANCE];
> -	tp->time_constant = out.t_quiet_to_balanced;
> +	tp->time_constant = out->t_quiet_to_balanced;
>  	tp->target_mode = CNQF_MODE_BALANCE;
>  	tp->shifting_up = true;
>  
>  	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE];
> -	tp->time_constant = out.t_perf_to_balanced;
> +	tp->time_constant = out->t_perf_to_balanced;
>  	tp->target_mode = CNQF_MODE_BALANCE;
>  	tp->shifting_up = false;
>  
>  	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE];
> -	tp->time_constant = out.t_turbo_to_perf;
> +	tp->time_constant = out->t_turbo_to_perf;
>  	tp->target_mode = CNQF_MODE_PERFORMANCE;
>  	tp->shifting_up = false;
>  
>  	tp = &config_store.trans_param[idx][CNQF_TRANSITION_TO_TURBO];
> -	tp->time_constant = out.t_perf_to_turbo;
> +	tp->time_constant = out->t_perf_to_turbo;
>  	tp->target_mode = CNQF_MODE_TURBO;
>  	tp->shifting_up = true;
>  }
>  
> -static void amd_pmf_update_mode_set(int idx, struct apmf_dyn_slider_output out)
> +static void amd_pmf_update_mode_set(int idx, struct apmf_dyn_slider_output *out)
>  {
>  	struct cnqf_mode_settings *ms;
>  
>  	/* Quiet Mode */
>  	ms = &config_store.mode_set[idx][CNQF_MODE_QUIET];
> -	ms->power_floor = out.ps[APMF_CNQF_QUIET].pfloor;
> -	ms->power_control.fppt = out.ps[APMF_CNQF_QUIET].fppt;
> -	ms->power_control.sppt = out.ps[APMF_CNQF_QUIET].sppt;
> -	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_QUIET].sppt_apu_only;
> -	ms->power_control.spl = out.ps[APMF_CNQF_QUIET].spl;
> -	ms->power_control.stt_min = out.ps[APMF_CNQF_QUIET].stt_min_limit;
> +	ms->power_floor = out->ps[APMF_CNQF_QUIET].pfloor;
> +	ms->power_control.fppt = out->ps[APMF_CNQF_QUIET].fppt;
> +	ms->power_control.sppt = out->ps[APMF_CNQF_QUIET].sppt;
> +	ms->power_control.sppt_apu_only = out->ps[APMF_CNQF_QUIET].sppt_apu_only;
> +	ms->power_control.spl = out->ps[APMF_CNQF_QUIET].spl;
> +	ms->power_control.stt_min = out->ps[APMF_CNQF_QUIET].stt_min_limit;
>  	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
> -		out.ps[APMF_CNQF_QUIET].stt_skintemp[STT_TEMP_APU];
> +		out->ps[APMF_CNQF_QUIET].stt_skintemp[STT_TEMP_APU];
>  	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
> -		out.ps[APMF_CNQF_QUIET].stt_skintemp[STT_TEMP_HS2];
> -	ms->fan_control.fan_id = out.ps[APMF_CNQF_QUIET].fan_id;
> +		out->ps[APMF_CNQF_QUIET].stt_skintemp[STT_TEMP_HS2];
> +	ms->fan_control.fan_id = out->ps[APMF_CNQF_QUIET].fan_id;
>  
>  	/* Balance Mode */
>  	ms = &config_store.mode_set[idx][CNQF_MODE_BALANCE];
> -	ms->power_floor = out.ps[APMF_CNQF_BALANCE].pfloor;
> -	ms->power_control.fppt = out.ps[APMF_CNQF_BALANCE].fppt;
> -	ms->power_control.sppt = out.ps[APMF_CNQF_BALANCE].sppt;
> -	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_BALANCE].sppt_apu_only;
> -	ms->power_control.spl = out.ps[APMF_CNQF_BALANCE].spl;
> -	ms->power_control.stt_min = out.ps[APMF_CNQF_BALANCE].stt_min_limit;
> +	ms->power_floor = out->ps[APMF_CNQF_BALANCE].pfloor;
> +	ms->power_control.fppt = out->ps[APMF_CNQF_BALANCE].fppt;
> +	ms->power_control.sppt = out->ps[APMF_CNQF_BALANCE].sppt;
> +	ms->power_control.sppt_apu_only = out->ps[APMF_CNQF_BALANCE].sppt_apu_only;
> +	ms->power_control.spl = out->ps[APMF_CNQF_BALANCE].spl;
> +	ms->power_control.stt_min = out->ps[APMF_CNQF_BALANCE].stt_min_limit;
>  	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
> -		out.ps[APMF_CNQF_BALANCE].stt_skintemp[STT_TEMP_APU];
> +		out->ps[APMF_CNQF_BALANCE].stt_skintemp[STT_TEMP_APU];
>  	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
> -		out.ps[APMF_CNQF_BALANCE].stt_skintemp[STT_TEMP_HS2];
> -	ms->fan_control.fan_id = out.ps[APMF_CNQF_BALANCE].fan_id;
> +		out->ps[APMF_CNQF_BALANCE].stt_skintemp[STT_TEMP_HS2];
> +	ms->fan_control.fan_id = out->ps[APMF_CNQF_BALANCE].fan_id;
>  
>  	/* Performance Mode */
>  	ms = &config_store.mode_set[idx][CNQF_MODE_PERFORMANCE];
> -	ms->power_floor = out.ps[APMF_CNQF_PERFORMANCE].pfloor;
> -	ms->power_control.fppt = out.ps[APMF_CNQF_PERFORMANCE].fppt;
> -	ms->power_control.sppt = out.ps[APMF_CNQF_PERFORMANCE].sppt;
> -	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_PERFORMANCE].sppt_apu_only;
> -	ms->power_control.spl = out.ps[APMF_CNQF_PERFORMANCE].spl;
> -	ms->power_control.stt_min = out.ps[APMF_CNQF_PERFORMANCE].stt_min_limit;
> +	ms->power_floor = out->ps[APMF_CNQF_PERFORMANCE].pfloor;
> +	ms->power_control.fppt = out->ps[APMF_CNQF_PERFORMANCE].fppt;
> +	ms->power_control.sppt = out->ps[APMF_CNQF_PERFORMANCE].sppt;
> +	ms->power_control.sppt_apu_only = out->ps[APMF_CNQF_PERFORMANCE].sppt_apu_only;
> +	ms->power_control.spl = out->ps[APMF_CNQF_PERFORMANCE].spl;
> +	ms->power_control.stt_min = out->ps[APMF_CNQF_PERFORMANCE].stt_min_limit;
>  	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
> -		out.ps[APMF_CNQF_PERFORMANCE].stt_skintemp[STT_TEMP_APU];
> +		out->ps[APMF_CNQF_PERFORMANCE].stt_skintemp[STT_TEMP_APU];
>  	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
> -		out.ps[APMF_CNQF_PERFORMANCE].stt_skintemp[STT_TEMP_HS2];
> -	ms->fan_control.fan_id = out.ps[APMF_CNQF_PERFORMANCE].fan_id;
> +		out->ps[APMF_CNQF_PERFORMANCE].stt_skintemp[STT_TEMP_HS2];
> +	ms->fan_control.fan_id = out->ps[APMF_CNQF_PERFORMANCE].fan_id;
>  
>  	/* Turbo Mode */
>  	ms = &config_store.mode_set[idx][CNQF_MODE_TURBO];
> -	ms->power_floor = out.ps[APMF_CNQF_TURBO].pfloor;
> -	ms->power_control.fppt = out.ps[APMF_CNQF_TURBO].fppt;
> -	ms->power_control.sppt = out.ps[APMF_CNQF_TURBO].sppt;
> -	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_TURBO].sppt_apu_only;
> -	ms->power_control.spl = out.ps[APMF_CNQF_TURBO].spl;
> -	ms->power_control.stt_min = out.ps[APMF_CNQF_TURBO].stt_min_limit;
> +	ms->power_floor = out->ps[APMF_CNQF_TURBO].pfloor;
> +	ms->power_control.fppt = out->ps[APMF_CNQF_TURBO].fppt;
> +	ms->power_control.sppt = out->ps[APMF_CNQF_TURBO].sppt;
> +	ms->power_control.sppt_apu_only = out->ps[APMF_CNQF_TURBO].sppt_apu_only;
> +	ms->power_control.spl = out->ps[APMF_CNQF_TURBO].spl;
> +	ms->power_control.stt_min = out->ps[APMF_CNQF_TURBO].stt_min_limit;
>  	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
> -		out.ps[APMF_CNQF_TURBO].stt_skintemp[STT_TEMP_APU];
> +		out->ps[APMF_CNQF_TURBO].stt_skintemp[STT_TEMP_APU];
>  	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
> -		out.ps[APMF_CNQF_TURBO].stt_skintemp[STT_TEMP_HS2];
> -	ms->fan_control.fan_id = out.ps[APMF_CNQF_TURBO].fan_id;
> +		out->ps[APMF_CNQF_TURBO].stt_skintemp[STT_TEMP_HS2];
> +	ms->fan_control.fan_id = out->ps[APMF_CNQF_TURBO].fan_id;
>  }
>  
>  static int amd_pmf_check_flags(struct amd_pmf_dev *dev)
> @@ -284,8 +284,8 @@ static int amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
>  			return ret;
>  		}
>  
> -		amd_pmf_update_mode_set(i, out);
> -		amd_pmf_update_trans_data(i, out);
> +		amd_pmf_update_mode_set(i, &out);
> +		amd_pmf_update_trans_data(i, &out);
>  		amd_pmf_update_power_threshold(i);
>  
>  		for (j = 0; j < CNQF_MODE_MAX; j++) {

