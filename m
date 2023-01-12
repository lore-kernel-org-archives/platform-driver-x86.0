Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBC1C63797
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 18:40:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240207AbjALSko (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 13:40:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240214AbjALSkJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 13:40:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B2C6B5CF
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673547146;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iSGhBloPdgVo3dxqwPAyUcY0me17lM27lB2hf3Pg3JU=;
        b=P0jDo6zOK4Po8utcDiglNbgtoHdnJwYqzVYuMBV518b6f26TMSHlWkUT3rkCnMRxF/L2Pw
        GJ6iAnFccZ8RwRurDo5EYhflHDrMgU5UVz1E8Oimzk10pbt4+AEwLTN8d0bsFm/4X2bWlv
        YGLES+CT1j8tMpbelvou5QINOs4IvFM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561--5tguu-RN1igBPog0Q8iyg-1; Thu, 12 Jan 2023 13:12:25 -0500
X-MC-Unique: -5tguu-RN1igBPog0Q8iyg-1
Received: by mail-ej1-f72.google.com with SMTP id qa18-20020a170907869200b007df87611618so13103817ejc.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:12:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSGhBloPdgVo3dxqwPAyUcY0me17lM27lB2hf3Pg3JU=;
        b=TamM3Qj691kZgXz7C2DIK4XheEYOTMgee+9bsFTBkIn/k+1tYB/8zUdtURHoEmGnoT
         qD4knFaW8RCZKU6k00rZnPT+d+SrwAkv1GATvXqp+n0/2McunLOzEq38uAAfa0bz4srH
         obV+kzTLrAszmkBR0A4mmR8V6WVSH+WNkp3Wy/yKvKWOZRQSlzmgRC6nvB8LqUe0WWq9
         4Ae1UPUQTtQJbu+oxyH6TYmW3v5GV77/kaxslZ3p45twsuQ8nWHUsQ4yHYcMRGNWw4oE
         5UVTXzMJWlWk/qfZ9p0SeVnDv9mQa6FmBvyafCn2EOMRTW2r5VDINrU8hKrhuEsym6/F
         555Q==
X-Gm-Message-State: AFqh2koCEBFPVTFsT7NaU5DVfFUmi6Zq4ggrMo5aDykWb5rMiWfnHkcW
        23Vi60krWqWDGwI1nPHd3tlW6zhswAyErwWcQKSXLmNcsafkGQ5tkG9j/dINfB8/WdUwlwrmSIv
        bnJlnZf74sFc3S9f7OJhZIXUUlVGHbAUj3A==
X-Received: by 2002:a17:906:fcda:b0:852:dc8d:3a01 with SMTP id qx26-20020a170906fcda00b00852dc8d3a01mr13613552ejb.55.1673547143790;
        Thu, 12 Jan 2023 10:12:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtlg48D7tDmTwTmA5JuZjNTRW4pmcXokWa79Cf5lpmnbrltWC9BQXkICASfQ9oJ4ky72GkItQ==
X-Received: by 2002:a17:906:fcda:b0:852:dc8d:3a01 with SMTP id qx26-20020a170906fcda00b00852dc8d3a01mr13613533ejb.55.1673547143566;
        Thu, 12 Jan 2023 10:12:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b21-20020a17090630d500b0084f7d38713esm4242987ejb.108.2023.01.12.10.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 10:12:23 -0800 (PST)
Message-ID: <4051dd46-7e9e-455c-27d3-9516fa3c5fa6@redhat.com>
Date:   Thu, 12 Jan 2023 19:12:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/9] platform/surface: aggregator: Ignore command messages
 not intended for us
Content-Language: en-US, nl
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221202223327.690880-1-luzmaximilian@gmail.com>
 <20221202223327.690880-2-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221202223327.690880-2-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/2/22 23:33, Maximilian Luz wrote:
> It is possible that we (the host/kernel driver) receive command messages
> that are not intended for us. Ignore those for now.
> 
> The whole story is a bit more complicated: It is possible to enable
> debug output on SAM, which is sent via SSH command messages. By default
> this output is sent to a debug connector, with its own target ID
> (TID=0x03). It is possible to override the target of the debug output
> and set it to the host/kernel driver. This, however, does not change the
> original target ID of the message. Meaning, we receive messages with
> TID=0x03 (debug) but expect to only receive messages with TID=0x00
> (host).
> 
> The problem is that the different target ID also comes with a different
> scope of request IDs. In particular, these do not follow the standard
> event rules (i.e. do not fall into a set of small reserved values).
> Therefore, current message handling interprets them as responses to
> pending requests and tries to match them up via the request ID. However,
> these debug output messages are not in fact responses, and therefore
> this will at best fail to find the request and at worst pass on the
> wrong data as response for a request.
> 
> Therefore ignore any command messages not intended for us (host) for
> now. We can implement support for the debug messages once we have a
> better understanding of them.
> 
> Note that this may also provide a bit more stability and avoid some
> driver confusion in case any other targets want to talk to us in the
> future, since we don't yet know what to do with those as well. A warning
> for the dropped messages should suffice for now and also give us a
> chance of discovering new targets if they come along without any
> potential for bugs/instabilities.
> 
> Fixes: c167b9c7e3d6 ("platform/surface: Add Surface Aggregator subsystem")
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
> Note: I've simplified this commit so that it can be applied
> independently of the rest of the series for easier backporting.
> ---
>  .../surface/aggregator/ssh_request_layer.c         | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/platform/surface/aggregator/ssh_request_layer.c b/drivers/platform/surface/aggregator/ssh_request_layer.c
> index f5565570f16c..69132976d297 100644
> --- a/drivers/platform/surface/aggregator/ssh_request_layer.c
> +++ b/drivers/platform/surface/aggregator/ssh_request_layer.c
> @@ -916,6 +916,20 @@ static void ssh_rtl_rx_command(struct ssh_ptl *p, const struct ssam_span *data)
>  	if (sshp_parse_command(dev, data, &command, &command_data))
>  		return;
>  
> +	/*
> +	 * Check if the message was intended for us. If not, drop it.
> +	 *
> +	 * Note: We will need to change this to handle debug messages. On newer
> +	 * generation devices, these seem to be sent to tid_out=0x03. We as
> +	 * host can still receive them as they can be forwarded via an override
> +	 * option on SAM, but doing so does not change tid_out=0x00.
> +	 */
> +	if (command->tid_out != 0x00) {
> +		rtl_warn(rtl, "rtl: dropping message not intended for us (tid = %#04x)\n",
> +			 command->tid_out);
> +		return;
> +	}
> +
>  	if (ssh_rqid_is_event(get_unaligned_le16(&command->rqid)))
>  		ssh_rtl_rx_event(rtl, command, &command_data);
>  	else

