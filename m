Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426EAEB64D8
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Jun 2023 08:28:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjFVI2l (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Jun 2023 04:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbjFVI2k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Jun 2023 04:28:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30690211D
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jun 2023 01:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687422438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QwEEqPg16IG5oipEZE1UJILZjBbUphCK3erPSbV73Dg=;
        b=BIfrAbPJzQ+zf1++tEY+TCJH6j7ii2ObN/OaUQYUMbWmF2iNXmkHwyjvrmEaMyZRKTxZhY
        dbQwYCYjnsM4GTSuBNK75LHGKpIMUn6VNh2+qzkmpW2wWWQxGHqEt+vEvgxgyrgOS+Dfe0
        EQMg2nCe/pfLY6SwnMx8djXYzQdfBsc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-z_E3S4jRNFureslLolUQVQ-1; Thu, 22 Jun 2023 04:27:16 -0400
X-MC-Unique: z_E3S4jRNFureslLolUQVQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-51a49eb6000so3993139a12.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jun 2023 01:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687422435; x=1690014435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QwEEqPg16IG5oipEZE1UJILZjBbUphCK3erPSbV73Dg=;
        b=FblGSdXznol2j6wUsR/UEQp+wtGq7K5HA33w3uRTMRsvyAefVipH7+jAxpbesa8c0t
         UvBQn5zjiQL/mQ9mwIkI07/QxDsfdEd8YWlZZrxGwDWvWQkXpXGiioc3KuEY1zusIqLm
         jMoEfH7IW8CPopiIT7ages6/kTYXBbYNpMylNPms4chAqeVi1DVISIkH6YYuAyyptGUF
         KdZYDtPsaour9FDKHQTiUMX/ISczRX8BsOxdVVKPAY/sXjHeOwKTs9BMHNL5TMhZq80M
         OI+8ywKiCSCgnPjQ33Zg4YbJa1kiNzfioIodZMpPAOnyoKIGM2WAyfR2yumIQh1qKhlR
         lbMQ==
X-Gm-Message-State: AC+VfDy6rKutafzSpRNymlILpkY5HNr+yTmmKkHvRzAzAI7OsWEBpiWL
        6/vbFptdcV+zyN6D/8vq7AJZ1bSeNZ37O2af1X/3QyPM5wLJn8QKXr1qLOsdW98J1Qd4IcEZiyb
        inpxYGAleejO4WfKNLT66nEKTgOmsyrKwZA==
X-Received: by 2002:aa7:da96:0:b0:50d:1e11:eb9 with SMTP id q22-20020aa7da96000000b0050d1e110eb9mr13065014eds.1.1687422435668;
        Thu, 22 Jun 2023 01:27:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4T+OCoDWyzNTaIXDzpgwCGcOnXNvkJJdN6/1WrcvckzH5IMI8lhDCcdm46wCMN/Dch8Yb0Jg==
X-Received: by 2002:aa7:da96:0:b0:50d:1e11:eb9 with SMTP id q22-20020aa7da96000000b0050d1e110eb9mr13064963eds.1.1687422433993;
        Thu, 22 Jun 2023 01:27:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d9-20020aa7d689000000b0051beb873d98sm367825edr.27.2023.06.22.01.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 01:27:13 -0700 (PDT)
Message-ID: <82559c52-e96d-7e4a-4e01-4f070eec545e@redhat.com>
Date:   Thu, 22 Jun 2023 10:27:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86/amd/pmf: Register notify handler only if SPS
 is enabled
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        mario.limonciello@amd.com, Allen Zhong <allen@atr.me>
References: <20230622060309.310001-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230622060309.310001-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/22/23 08:03, Shyam Sundar S K wrote:
> Power source notify handler is getting registered even when none of the
> PMF feature in enabled leading to a crash.
> 
> ...
> [   22.592162] Call Trace:
> [   22.592164]  <TASK>
> [   22.592164]  ? rcu_note_context_switch+0x5e0/0x660
> [   22.592166]  ? __warn+0x81/0x130
> [   22.592171]  ? rcu_note_context_switch+0x5e0/0x660
> [   22.592172]  ? report_bug+0x171/0x1a0
> [   22.592175]  ? prb_read_valid+0x1b/0x30
> [   22.592177]  ? handle_bug+0x3c/0x80
> [   22.592178]  ? exc_invalid_op+0x17/0x70
> [   22.592179]  ? asm_exc_invalid_op+0x1a/0x20
> [   22.592182]  ? rcu_note_context_switch+0x5e0/0x660
> [   22.592183]  ? acpi_ut_delete_object_desc+0x86/0xb0
> [   22.592186]  ? acpi_ut_update_ref_count.part.0+0x22d/0x930
> [   22.592187]  __schedule+0xc0/0x1410
> [   22.592189]  ? ktime_get+0x3c/0xa0
> [   22.592191]  ? lapic_next_event+0x1d/0x30
> [   22.592193]  ? hrtimer_start_range_ns+0x25b/0x350
> [   22.592196]  schedule+0x5e/0xd0
> [   22.592197]  schedule_hrtimeout_range_clock+0xbe/0x140
> [   22.592199]  ? __pfx_hrtimer_wakeup+0x10/0x10
> [   22.592200]  usleep_range_state+0x64/0x90
> [   22.592203]  amd_pmf_send_cmd+0x106/0x2a0 [amd_pmf bddfe0fe3712aaa99acce3d5487405c5213c6616]
> [   22.592207]  amd_pmf_update_slider+0x56/0x1b0 [amd_pmf bddfe0fe3712aaa99acce3d5487405c5213c6616]
> [   22.592210]  amd_pmf_set_sps_power_limits+0x72/0x80 [amd_pmf bddfe0fe3712aaa99acce3d5487405c5213c6616]
> [   22.592213]  amd_pmf_pwr_src_notify_call+0x49/0x90 [amd_pmf bddfe0fe3712aaa99acce3d5487405c5213c6616]
> [   22.592216]  notifier_call_chain+0x5a/0xd0
> [   22.592218]  atomic_notifier_call_chain+0x32/0x50
> ...
> 
> Fix this by moving the registration of source change notify handler only
> when SPS(Static Slider) is advertised as supported.
> 
> Reported-by: Allen Zhong <allen@atr.me>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217571
> Fixes: 4c71ae414474 ("platform/x86/amd/pmf: Add support SPS PMF feature")
> Tested-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

And I have just send a fixes pull-req with this to Linus
for the current kernel development cycle.

Regards,

Hans


> ---
>  drivers/platform/x86/amd/pmf/core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index d5bb775dadcf..a5b8f9bbc0d9 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -280,6 +280,8 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>  	/* Enable Static Slider */
>  	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
>  		amd_pmf_init_sps(dev);
> +		dev->pwr_src_notifier.notifier_call = amd_pmf_pwr_src_notify_call;
> +		power_supply_reg_notifier(&dev->pwr_src_notifier);
>  		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>  	}
>  
> @@ -298,8 +300,10 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>  
>  static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>  {
> -	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
> +	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
> +		power_supply_unreg_notifier(&dev->pwr_src_notifier);
>  		amd_pmf_deinit_sps(dev);
> +	}
>  
>  	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>  		amd_pmf_deinit_auto_mode(dev);
> @@ -382,9 +386,6 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	apmf_install_handler(dev);
>  	amd_pmf_dbgfs_register(dev);
>  
> -	dev->pwr_src_notifier.notifier_call = amd_pmf_pwr_src_notify_call;
> -	power_supply_reg_notifier(&dev->pwr_src_notifier);
> -
>  	dev_info(dev->dev, "registered PMF device successfully\n");
>  
>  	return 0;
> @@ -394,7 +395,6 @@ static void amd_pmf_remove(struct platform_device *pdev)
>  {
>  	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
>  
> -	power_supply_unreg_notifier(&dev->pwr_src_notifier);
>  	amd_pmf_deinit_features(dev);
>  	apmf_acpi_deinit(dev);
>  	amd_pmf_dbgfs_unregister(dev);

