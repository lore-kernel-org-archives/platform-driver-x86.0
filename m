Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63C0C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 16:46:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA5836193E
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 16:46:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhCUQpf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 12:45:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23974 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230010AbhCUQpQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 12:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616345116;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6h2h2HB8WxoU/qkngAFtY5FWCRZWf1+ThAglWCKj53I=;
        b=BShZcdie8wKtH7E6ECYduz8CrIRpM+QhwotlQPqsh4KtcTXd1OSdV1LwkZXd7raihkYf23
        oy8oBezulmLdQiybLliNrpxdifq6ug3i4SfWKjyYlgnyyoq7b4SDD586w+7HHp+42gnVS2
        phVUiECj9d2J+LCAt4nlUArka2MQr4k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-7ATlpljvOAaJxnNR8DDdZg-1; Sun, 21 Mar 2021 12:45:14 -0400
X-MC-Unique: 7ATlpljvOAaJxnNR8DDdZg-1
Received: by mail-ed1-f69.google.com with SMTP id q25so11282382eds.16
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Mar 2021 09:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6h2h2HB8WxoU/qkngAFtY5FWCRZWf1+ThAglWCKj53I=;
        b=LhaASTjqVNGoNl/MySF2cq33tMHCIGj8WTVnap5/cHvPg4lMNuRFlNYvztvpJG76dQ
         GwtCAZ9EH5TtTnr5uEv3J1WRmRcgebmaAwp+iC1yBldYUTlQQhhuenBWwKO63VZTPUkH
         TS0bcn3BXf/FdwrbMdkbzFyma4BmTE/bdXqUxD1tDTqRP/hoP1jbMek05LM+O7MHDN02
         BzleapQUdxJM9Jmt8b4mkDLepo7GWL+z/iz/swEY4KRnvsb4ROHsARf3ULoBzhZUNvUE
         d0Aq5+QnqfNbvgptteipT3RfJxE6hJfO2GNVFCdgvHIta2Dn++g/AsdR+G1UuuFMwXcL
         tucw==
X-Gm-Message-State: AOAM530XCT7HThDYxuBLk1cxaTdGBiTdTILLn4vyWnblbXadKyONDvEp
        RcXv58vgFTzGR8SnSzzWlAS5koMvZAZVW3vC6X1CBQ4Tt285dFT2pjtP8PURd1y3o8QbOsoKHJw
        nMxN33ncuYclCvPMAg2XlhfJIJyOruyV51Q==
X-Received: by 2002:aa7:d3d8:: with SMTP id o24mr21457524edr.165.1616345113469;
        Sun, 21 Mar 2021 09:45:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDeWckON/5nkCV4+TC2Aa1IYTg52dXRWsmTgyCB8E596H+DmphAM6K47Kjjwixj2GfAgx0RA==
X-Received: by 2002:aa7:d3d8:: with SMTP id o24mr21457512edr.165.1616345113346;
        Sun, 21 Mar 2021 09:45:13 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h2sm7415975ejk.32.2021.03.21.09.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Mar 2021 09:45:13 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel-vbtn: Stop reporting SW_DOCK events
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
References: <20210321163513.72328-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <048f56a7-c1f0-7db7-c4e9-e9aada8021ab@redhat.com>
Date:   Sun, 21 Mar 2021 17:45:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210321163513.72328-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/21/21 5:35 PM, Hans de Goede wrote:
> Stop reporting SW_DOCK events because this breaks suspend-on-lid-close.
> 
> SW_DOCK should only be reported for docking stations, but all the DSDTs in
> my DSDT collection which use the intel-vbtn code, always seem to use this
> for 2-in-1s / convertibles and set SW_DOCK=1 when in laptop-mode (in tandem
> with setting SW_TABLET_MODE=0).
> 
> This causes userspace to think the laptop is docked to a port-replicator
> and to disable suspend-on-lid-close, which is undesirable.
> 
> Map the dock events to KEY_IGNORE to avoid this broken SW_DOCK reporting.
> 
> Note this may theoretically cause us to stop reporting SW_DOCK on some
> device where the 0xCA and 0xCB intel-vbtn events are actually used for
> reporting docking to a classic docking-station / port-replicator but
> I'm not aware of any such devices.
> 
> Also the most important thing is that we only report SW_DOCK when it
> reliably reports being docked to a classic docking-station without any
> false positives, which clearly is not the case here. If there is a
> chance of reporting false positives then it is better to not report
> SW_DOCK at all.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this patch to the pdx86/review-hans and pdx86/fixes branches,
so it should show up in linux-next soon and it will also be included
in my next pull-req to Linus for 5.12.

Regards,

Hans



> ---
>  drivers/platform/x86/intel-vbtn.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index 8a8017f9ca91..3fdf4cbec9ad 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -48,8 +48,16 @@ static const struct key_entry intel_vbtn_keymap[] = {
>  };
>  
>  static const struct key_entry intel_vbtn_switchmap[] = {
> -	{ KE_SW,     0xCA, { .sw = { SW_DOCK, 1 } } },		/* Docked */
> -	{ KE_SW,     0xCB, { .sw = { SW_DOCK, 0 } } },		/* Undocked */
> +	/*
> +	 * SW_DOCK should only be reported for docking stations, but DSDTs using the
> +	 * intel-vbtn code, always seem to use this for 2-in-1s / convertibles and set
> +	 * SW_DOCK=1 when in laptop-mode (in tandem with setting SW_TABLET_MODE=0).
> +	 * This causes userspace to think the laptop is docked to a port-replicator
> +	 * and to disable suspend-on-lid-close, which is undesirable.
> +	 * Map the dock events to KEY_IGNORE to avoid this broken SW_DOCK reporting.
> +	 */
> +	{ KE_IGNORE, 0xCA, { .sw = { SW_DOCK, 1 } } },		/* Docked */
> +	{ KE_IGNORE, 0xCB, { .sw = { SW_DOCK, 0 } } },		/* Undocked */
>  	{ KE_SW,     0xCC, { .sw = { SW_TABLET_MODE, 1 } } },	/* Tablet */
>  	{ KE_SW,     0xCD, { .sw = { SW_TABLET_MODE, 0 } } },	/* Laptop */
>  	{ KE_END }
> 

