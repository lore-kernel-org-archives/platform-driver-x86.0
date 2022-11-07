Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED1FC433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 14:23:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbiKGOXE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 09:23:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232128AbiKGOWi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 09:22:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8AB1F9FA
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 06:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667830665;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BWCggweYkWW8c53+TDae/0Yhw7x+LMp4F8hk4PB17Rg=;
        b=Ogz3YI4GUbrmJ2J6b1UVx251Dsjq5AD6cVrLBSVK4O6HVz6C30Tzk8utkK3yrHUnU7Hkvk
        /G1PyQqfiRVbZdQ/AYsvuoYj2DZq3NuznK+I5cJA388qJUZ895bZIzCnkmJZ/8b27Rb9Hv
        6RXmiIGul5ZZnY/L8pQkKcUdz6EI4gs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-m0kYxYVRMYOl7kBrhOba1Q-1; Mon, 07 Nov 2022 09:17:44 -0500
X-MC-Unique: m0kYxYVRMYOl7kBrhOba1Q-1
Received: by mail-ed1-f69.google.com with SMTP id e15-20020a056402190f00b00461b0576620so8346982edz.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Nov 2022 06:17:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWCggweYkWW8c53+TDae/0Yhw7x+LMp4F8hk4PB17Rg=;
        b=btHvWFyJ9eCWUIRWbfgcKAEUp1ITtQSPG0J3tF4mxy+wTqEt/C4Z1eo3SOiVPfSeQg
         UmTJiQibCDo4VItyT6Klot4P695OcVokleASqVzpjFg1C7KijrgBXX2YjBIR2eiiLwml
         Wg8hFcRwA+iT7uiBaiELI7ur0LbYA6rEAp7V/znti910Sm/bXlnxNyUUpLEZYeijZqr+
         nM6VSafqGbzigkbPJ76GOu2kHeQFapKgWWgQ9q2BpcUu3WHMwPUdPKH457WK/yJpHmgA
         ZoYOeh/YH2U9qXV3CH87wBcMhuwJSs+NQPOiLLEI0nY9B7V4vjh52MxqHoLWLUYWgBio
         +xpQ==
X-Gm-Message-State: ACrzQf1XOzVjsPiKno5vDdROO/Yh0a8dXSP74V5mUNtaAxpuJsWinsvl
        NUwJwGw14SRwYXx4AqhXEkOFcgHc0sGrp1bDIh8O9os5tPNCSRviSSeHV0//IYvbRefWllGUH4r
        eLAHhaDVq/5ShLHEpbNUHiGPMvyNklVJBwg==
X-Received: by 2002:a17:907:d02:b0:7a3:de36:b67 with SMTP id gn2-20020a1709070d0200b007a3de360b67mr47012851ejc.451.1667830663354;
        Mon, 07 Nov 2022 06:17:43 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5jBFgOUb5J1i4chIysxiMTvKXDNamUZw4Tgryli3cOOOl+UZ9fMhg1QmpJ1BzdtNKG1C1Cng==
X-Received: by 2002:a17:907:d02:b0:7a3:de36:b67 with SMTP id gn2-20020a1709070d0200b007a3de360b67mr47012819ejc.451.1667830663059;
        Mon, 07 Nov 2022 06:17:43 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id e18-20020a170906249200b0073d9a0d0cbcsm3485565ejb.72.2022.11.07.06.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 06:17:42 -0800 (PST)
Message-ID: <4edce900-ea0c-3c0e-ba3c-63f478f18869@redhat.com>
Date:   Mon, 7 Nov 2022 15:17:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1] platform/x86: thinkpad_acpi: use strstarts()
Content-Language: en-US
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        platform-driver-x86@vger.kernel.org,
        ibm-acpi-devel@lists.sourceforge.net,
        Mark Gross <markgross@kernel.org>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>
References: <20221021180007.55535-1-pobrn@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221021180007.55535-1-pobrn@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/21/22 20:17, Barnabás Pőcze wrote:
> There is a function, `strstarts()`, in linux/string.h
> to check if a string is prefix of another. So remove
> the custom version from the driver.
> 
> Signed-off-by: Barnabás Pőcze <pobrn@protonmail.com>

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
>  drivers/platform/x86/thinkpad_acpi.c | 58 +++++++++++++---------------
>  1 file changed, 27 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 6a823b850a77..7a1d5402697e 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -263,9 +263,6 @@ enum tpacpi_hkey_event_t {
>  #define TPACPI_DBG_BRGHT	0x0020
>  #define TPACPI_DBG_MIXER	0x0040
> 
> -#define strlencmp(a, b) (strncmp((a), (b), strlen(b)))
> -
> -
>  /****************************************************************************
>   * Driver-wide structs and misc. variables
>   */
> @@ -1333,9 +1330,9 @@ static int tpacpi_rfk_procfs_write(const enum tpacpi_rfk_id id, char *buf)
>  		return -ENODEV;
> 
>  	while ((cmd = strsep(&buf, ","))) {
> -		if (strlencmp(cmd, "enable") == 0)
> +		if (strstarts(cmd, "enable"))
>  			status = TPACPI_RFK_RADIO_ON;
> -		else if (strlencmp(cmd, "disable") == 0)
> +		else if (strstarts(cmd, "disable"))
>  			status = TPACPI_RFK_RADIO_OFF;
>  		else
>  			return -EINVAL;
> @@ -4196,12 +4193,12 @@ static int hotkey_write(char *buf)
> 
>  	res = 0;
>  	while ((cmd = strsep(&buf, ","))) {
> -		if (strlencmp(cmd, "enable") == 0) {
> +		if (strstarts(cmd, "enable")) {
>  			hotkey_enabledisable_warn(1);
> -		} else if (strlencmp(cmd, "disable") == 0) {
> +		} else if (strstarts(cmd, "disable")) {
>  			hotkey_enabledisable_warn(0);
>  			res = -EPERM;
> -		} else if (strlencmp(cmd, "reset") == 0) {
> +		} else if (strstarts(cmd, "reset")) {
>  			mask = (hotkey_all_mask | hotkey_source_mask)
>  				& ~hotkey_reserved_mask;
>  		} else if (sscanf(cmd, "0x%x", &mask) == 1) {
> @@ -5223,33 +5220,33 @@ static int video_write(char *buf)
>  	disable = 0;
> 
>  	while ((cmd = strsep(&buf, ","))) {
> -		if (strlencmp(cmd, "lcd_enable") == 0) {
> +		if (strstarts(cmd, "lcd_enable")) {
>  			enable |= TP_ACPI_VIDEO_S_LCD;
> -		} else if (strlencmp(cmd, "lcd_disable") == 0) {
> +		} else if (strstarts(cmd, "lcd_disable")) {
>  			disable |= TP_ACPI_VIDEO_S_LCD;
> -		} else if (strlencmp(cmd, "crt_enable") == 0) {
> +		} else if (strstarts(cmd, "crt_enable")) {
>  			enable |= TP_ACPI_VIDEO_S_CRT;
> -		} else if (strlencmp(cmd, "crt_disable") == 0) {
> +		} else if (strstarts(cmd, "crt_disable")) {
>  			disable |= TP_ACPI_VIDEO_S_CRT;
>  		} else if (video_supported == TPACPI_VIDEO_NEW &&
> -			   strlencmp(cmd, "dvi_enable") == 0) {
> +			   strstarts(cmd, "dvi_enable")) {
>  			enable |= TP_ACPI_VIDEO_S_DVI;
>  		} else if (video_supported == TPACPI_VIDEO_NEW &&
> -			   strlencmp(cmd, "dvi_disable") == 0) {
> +			   strstarts(cmd, "dvi_disable")) {
>  			disable |= TP_ACPI_VIDEO_S_DVI;
> -		} else if (strlencmp(cmd, "auto_enable") == 0) {
> +		} else if (strstarts(cmd, "auto_enable")) {
>  			res = video_autosw_set(1);
>  			if (res)
>  				return res;
> -		} else if (strlencmp(cmd, "auto_disable") == 0) {
> +		} else if (strstarts(cmd, "auto_disable")) {
>  			res = video_autosw_set(0);
>  			if (res)
>  				return res;
> -		} else if (strlencmp(cmd, "video_switch") == 0) {
> +		} else if (strstarts(cmd, "video_switch")) {
>  			res = video_outputsw_cycle();
>  			if (res)
>  				return res;
> -		} else if (strlencmp(cmd, "expand_toggle") == 0) {
> +		} else if (strstarts(cmd, "expand_toggle")) {
>  			res = video_expand_toggle();
>  			if (res)
>  				return res;
> @@ -5642,9 +5639,9 @@ static int light_write(char *buf)
>  		return -ENODEV;
> 
>  	while ((cmd = strsep(&buf, ","))) {
> -		if (strlencmp(cmd, "on") == 0) {
> +		if (strstarts(cmd, "on")) {
>  			newstatus = 1;
> -		} else if (strlencmp(cmd, "off") == 0) {
> +		} else if (strstarts(cmd, "off")) {
>  			newstatus = 0;
>  		} else
>  			return -EINVAL;
> @@ -7115,10 +7112,10 @@ static int brightness_write(char *buf)
>  		return level;
> 
>  	while ((cmd = strsep(&buf, ","))) {
> -		if (strlencmp(cmd, "up") == 0) {
> +		if (strstarts(cmd, "up")) {
>  			if (level < bright_maxlvl)
>  				level++;
> -		} else if (strlencmp(cmd, "down") == 0) {
> +		} else if (strstarts(cmd, "down")) {
>  			if (level > 0)
>  				level--;
>  		} else if (sscanf(cmd, "level %d", &level) == 1 &&
> @@ -7867,13 +7864,13 @@ static int volume_write(char *buf)
> 
>  	while ((cmd = strsep(&buf, ","))) {
>  		if (!tp_features.mixer_no_level_control) {
> -			if (strlencmp(cmd, "up") == 0) {
> +			if (strstarts(cmd, "up")) {
>  				if (new_mute)
>  					new_mute = 0;
>  				else if (new_level < TP_EC_VOLUME_MAX)
>  					new_level++;
>  				continue;
> -			} else if (strlencmp(cmd, "down") == 0) {
> +			} else if (strstarts(cmd, "down")) {
>  				if (new_mute)
>  					new_mute = 0;
>  				else if (new_level > 0)
> @@ -7885,9 +7882,9 @@ static int volume_write(char *buf)
>  				continue;
>  			}
>  		}
> -		if (strlencmp(cmd, "mute") == 0)
> +		if (strstarts(cmd, "mute"))
>  			new_mute = TP_EC_AUDIO_MUTESW_MSK;
> -		else if (strlencmp(cmd, "unmute") == 0)
> +		else if (strstarts(cmd, "unmute"))
>  			new_mute = 0;
>  		else
>  			return -EINVAL;
> @@ -9110,10 +9107,9 @@ static int fan_write_cmd_level(const char *cmd, int *rc)
>  {
>  	int level;
> 
> -	if (strlencmp(cmd, "level auto") == 0)
> +	if (strstarts(cmd, "level auto"))
>  		level = TP_EC_FAN_AUTO;
> -	else if ((strlencmp(cmd, "level disengaged") == 0) ||
> -			(strlencmp(cmd, "level full-speed") == 0))
> +	else if (strstarts(cmd, "level disengaged") || strstarts(cmd, "level full-speed"))
>  		level = TP_EC_FAN_FULLSPEED;
>  	else if (sscanf(cmd, "level %d", &level) != 1)
>  		return 0;
> @@ -9131,7 +9127,7 @@ static int fan_write_cmd_level(const char *cmd, int *rc)
> 
>  static int fan_write_cmd_enable(const char *cmd, int *rc)
>  {
> -	if (strlencmp(cmd, "enable") != 0)
> +	if (!strstarts(cmd, "enable"))
>  		return 0;
> 
>  	*rc = fan_set_enable();
> @@ -9146,7 +9142,7 @@ static int fan_write_cmd_enable(const char *cmd, int *rc)
> 
>  static int fan_write_cmd_disable(const char *cmd, int *rc)
>  {
> -	if (strlencmp(cmd, "disable") != 0)
> +	if (!strstarts(cmd, "disable"))
>  		return 0;
> 
>  	*rc = fan_set_disable();
> --
> 2.38.1
> 
> 

