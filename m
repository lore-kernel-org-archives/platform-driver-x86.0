Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4083CD6E52
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Oct 2023 09:19:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbjJKJTB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Oct 2023 05:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234314AbjJKJS6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Oct 2023 05:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52AAA94
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Oct 2023 02:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697015892;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6VeHLLWLaFYlxtUFMGiEnMwcdigLDrXXDxB66Kt6xzM=;
        b=M22/ihqhrDiiBQXg9bzQe2m4UIZiXbWjpUDNUr6rpVhC2ie3rNvibMz6gcoV3TfGAvi3Bq
        3FsrHeJgf70BpR7SGHEBF1OzKOCuK2D0eGNT5O1VSL+q5TCrKzQoUn1QG1bNAsUC3Z8pdn
        RJ+5Jk+7F8i1exF49ZszBIbQ3amQx7g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-Vurn-nVkP7qcbo2UWaOjTw-1; Wed, 11 Oct 2023 05:18:01 -0400
X-MC-Unique: Vurn-nVkP7qcbo2UWaOjTw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5219ceead33so2840172a12.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Oct 2023 02:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697015880; x=1697620680;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6VeHLLWLaFYlxtUFMGiEnMwcdigLDrXXDxB66Kt6xzM=;
        b=A5LswlYTA4pJ1lOxj5dQgEpMSYVTEGXNWrKAQScpoG2nl1RXtpWBPX2AN/nT+ULCNY
         ymYh+iKmndxC3PGRd+UjJq8CrLve35HrTtEGiTy66JLqxCQv4JUpSQYtByU0G5mHVcDN
         gtOLGVnOk4eZjWLkZzgz00fP+aRHnvQwyxQzM9tQEeF8fUHs6E9BNwstt2cqgIU8Y/Dp
         0kjSocPLKoC7vubTtayfDMaRQvi/gsZBaLR+14jYv6xxQzFGv9iHC69d28ffC96rs1jB
         7zk2uhXxzZx5pnD+lwcEXh3fUMQQK6zVkhDNb8XBrHBvp+auBVAGROoVb/f9zA3hzl+h
         V2ZQ==
X-Gm-Message-State: AOJu0YxixwCK+laYj1xKUtsWC8sb4Q6Ov1k1B0DF3haXWk4cuTuN/H/C
        8HWfV+b4jahTcpFap6rPWiK9A99ElxyWX4k0q977bzBBICYqMmnvO5L7K3E8xykZdUPKRaRhUNV
        FlTTu0X26iQJb98ICmXlTsGIk08nGwMFEFg==
X-Received: by 2002:a05:6402:f2a:b0:53d:a3ff:4605 with SMTP id i42-20020a0564020f2a00b0053da3ff4605mr3122682eda.25.1697015880220;
        Wed, 11 Oct 2023 02:18:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/TO3YeQqQtRjh8V5VJZGWP8LKCVJlIuShWG9z0lv3jFnR2jzBgA1W6nKv1qcM1xFp/mWPCw==
X-Received: by 2002:a05:6402:f2a:b0:53d:a3ff:4605 with SMTP id i42-20020a0564020f2a00b0053da3ff4605mr3122665eda.25.1697015879897;
        Wed, 11 Oct 2023 02:17:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n17-20020a05640204d100b00533dd4d2947sm8657518edw.74.2023.10.11.02.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 02:17:58 -0700 (PDT)
Message-ID: <0ca2c331-651a-d548-0822-7b7cf015de96@redhat.com>
Date:   Wed, 11 Oct 2023 11:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [GIT PULL] Fixes in the mellanox init branch due for v6.6.
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Vadim Pasternak <vadimp@nvidia.com>, christophe.jaillet@wanadoo.fr,
        platform-driver-x86@vger.kernel.org
References: <c51fd7a6-a843-1c83-fa3b-f5dd104cf3ad@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c51fd7a6-a843-1c83-fa3b-f5dd104cf3ad@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Ilpo,

On 10/9/23 14:09, Ilpo Järvinen wrote:
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-mellanox-init-v6.6
> 
> for you to fetch changes up to 7ec4cd3c1a12dc08c60d5e376c2c05aae23f1e41:
> 
>   platform: mellanox: Fix a resource leak in an error handling path in probing flow (2023-10-06 16:40:35 +0300)

Thank you I've merged the platform-drivers-x86-mellanox-init-v6.6 tag into pdx86/fixes now.

Regards,

Hans






> ----------------------------------------------------------------
> Fixes in the mellanox init branch due for v6.6.
> 
> platform-drivers-x86-mellanox-init-v6.6: v6.6-rc1 + fixes in
> the platform-drivers-x86-mellanox-init branch to avoid a feature
> conflict during the v6.7 merge window.
> 
> ----------------------------------------------------------------
> Vadim Pasternak (1):
>       platform: mellanox: Fix a resource leak in an error handling path in probing flow
> 
>  drivers/platform/x86/mlx-platform.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

