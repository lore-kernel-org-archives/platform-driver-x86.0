Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19518C432BE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 07:44:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 025AB6108E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 07:44:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239670AbhHRHpZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 03:45:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53905 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239328AbhHRHpQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 03:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629272682;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZDR9dCcFnqRjQs5BKATK3dgD8MpAQds3bSLfGElXMe8=;
        b=WlAhQdAbYFWddbS6F8X00DrfUXo8+l/ErQ3McYq8trxzgrP/k+OwvwqBHEVYUc7PR6hk7K
        c4KfE9ttDIcuNmTSkOVbRHW7IARmT2yxZqhKd+La7/nXjuiuEyJkyWQd/CRhmgJXddHr7P
        VdUUq2C8bHyjKevBTaq7NGswwYJtkDU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-qAUlINOlP6C82HOf2ewAxg-1; Wed, 18 Aug 2021 03:44:40 -0400
X-MC-Unique: qAUlINOlP6C82HOf2ewAxg-1
Received: by mail-ej1-f72.google.com with SMTP id u23-20020a1709064ad700b005bb12df6cb9so537222ejt.20
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 00:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZDR9dCcFnqRjQs5BKATK3dgD8MpAQds3bSLfGElXMe8=;
        b=IjCnTeeRsytfHuiujM06rg1vFh8xPkAQh6TZDZFeQUz4U1yaByCsCix26T1gGUOC+L
         4ZXRCjxG7/3RDGBaY+GcdlCfGLbJazhgfzWslNRdXiZwO9WWDZrb5K2+lxF2SBF5djiV
         6DgaqduYZX2Cc3i2NQp8ULNd2w03gowx1JU6okmwXSlMSPieNc08iackeefwtLeIfK1r
         euH1BrKkLnS00aiSwn74LHddy1Xq+pYAp0zw6Liq39bmvSU7G2v4QnDVCI8+AAE3WD7h
         CRbYFnugi5wHkb6ALMPIY4HnqnmZSJ9S6QFCaGlZALVCbm2j+cyeWlFvTrxkHlN0x0Ws
         /K2g==
X-Gm-Message-State: AOAM530Pyf0MydBQ43MXRjNXxHxMWy+9Qkf1GQ3bsjyttVK2P92zmY5i
        XlBqH2EQWvX/7yIKpAo45Oe+kMOw4xQ/UAU06CtW/fS1dQh8J5arhIhdWi0/UoYDC4/6r3e5gpH
        uoMWZIaewYQqCJqf8MIwXsCnlzkPDZBWSmA==
X-Received: by 2002:a17:907:7704:: with SMTP id kw4mr8246920ejc.23.1629272679604;
        Wed, 18 Aug 2021 00:44:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJukV8qhSL3IKMdZaVPX1Am3u9IqxVfcSdgXafbeyr5DVxLVIs4LXx7LTNaUwgrNB8vmKAbQ==
X-Received: by 2002:a17:907:7704:: with SMTP id kw4mr8246912ejc.23.1629272679404;
        Wed, 18 Aug 2021 00:44:39 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b5sm1660448ejq.56.2021.08.18.00.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 00:44:39 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: gigabyte-wmi: add support for X570 GAMING X
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org
References: <20210817154628.84992-1-linux@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b1b43dfd-7057-6ef4-6f03-154f1df4cb4b@redhat.com>
Date:   Wed, 18 Aug 2021 09:44:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817154628.84992-1-linux@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/17/21 5:46 PM, Thomas Weißschuh wrote:
> Reported as working here:
> https://github.com/t-8ch/linux-gigabyte-wmi-driver/issues/1#issuecomment-900263115
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I've also added this to the fixes branch so that it will be
included in the next (and last) fixes-pullreq to Linus for 5.14 .

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/gigabyte-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> index 5529d7b0abea..d65aa43e6f72 100644
> --- a/drivers/platform/x86/gigabyte-wmi.c
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -146,6 +146,7 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550M DS3H"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("Z390 I AORUS PRO WIFI-CF"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 AORUS ELITE"),
> +	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 GAMING X"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 I AORUS PRO WIFI"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 UD"),
>  	{ }
> 
> base-commit: 009c9aa5be652675a06d5211e1640e02bbb1c33d
> 

