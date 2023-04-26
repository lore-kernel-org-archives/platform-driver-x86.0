Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8580DC77B78
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Apr 2023 16:10:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240351AbjDZQKF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Apr 2023 12:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241351AbjDZQKD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Apr 2023 12:10:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE0B72D66
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682525358;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=erKsqZ6PhfpGuRSr7TKmSUm9LgXe9vjm1nzPbCbLxKs=;
        b=gfzZxViQb9n/q9s6APxiNXCRZ2IsZDQjLSoNrRjZMXtvi58J/KnaR17PtqgURYd6wQ6ds4
        eF7VnGX1Lyq009WgS4HPTaqWs0AR/4V5v1pkJewxY1bTo1P+grPKgQKpYkWpp+fU2QXrcI
        JzOAGjYsuH0gPw0oP3+RpJ/QcdmDAps=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-mLgF4LLLNXSA09Dr_CQIXg-1; Wed, 26 Apr 2023 12:09:16 -0400
X-MC-Unique: mLgF4LLLNXSA09Dr_CQIXg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-50692ecb286so6666504a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 09:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682525355; x=1685117355;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=erKsqZ6PhfpGuRSr7TKmSUm9LgXe9vjm1nzPbCbLxKs=;
        b=SgJs5XbASKsfL/fM6nvZICvwKX0DtasVpSUm2mK3MZGaPLjc2J/bPFHkxgcw5gbryh
         8abImF7cMTgCBxpYhBhQrgjYxfIX+Q4IzS/znGWMhZ3nwSUe5JUR0J3EnYSJy7WegpWG
         gVtkoCh0aAqier3wmDb/Jb9f8YXDasTvvcJvD5mx1heag8bmpnkcu2Y752makqKB1E0+
         YhZpzTnGGpa8n1dY4K0zRsWguHW/Sfzj3Q1eNXejq3yJ2a3Qc3mGdhrfvNhxnFjipXOF
         I3jSm9s5kUg6aWdAL7d75ZTrtMaN7PecV2vRn51fqsWR8/dGkTvieYnH7XsTSEBmQN6s
         Rnxg==
X-Gm-Message-State: AAQBX9cQlJ8P6lusMh9HR5jc0Rbjn2nuMhCTk7MHGHLj2qmJP4er7xxh
        S9khQWM8n6SwNf4jjUEOMnzKB4tu6BuoLmwX+griPTNgENlSlugodnfldPSYmuWUe6C0rRA6vf1
        ygj1Z7u9MNiO9sme4bldAtcpTIOIThPCV0Q==
X-Received: by 2002:aa7:d7c5:0:b0:504:7d53:2148 with SMTP id e5-20020aa7d7c5000000b005047d532148mr17319984eds.30.1682525355159;
        Wed, 26 Apr 2023 09:09:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350anx2sC5Pqc4Hhggb8KfSFvLG2RmVT2FaoRvOJO0KMbM0Q0KYD3ZHaAHSgaCTHgF+3bpJ4ZIg==
X-Received: by 2002:aa7:d7c5:0:b0:504:7d53:2148 with SMTP id e5-20020aa7d7c5000000b005047d532148mr17319972eds.30.1682525354910;
        Wed, 26 Apr 2023 09:09:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h25-20020a50ed99000000b00505060e4280sm6814607edr.94.2023.04.26.09.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 09:09:14 -0700 (PDT)
Message-ID: <0b609a22-5da3-8305-ac93-caf1a0265170@redhat.com>
Date:   Wed, 26 Apr 2023 18:09:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] platform/x86: hp-wmi: Add HP WMI camera switch
Content-Language: en-US, nl
To:     Jonathan Singer <jes965@nyu.edu>,
        Mario Limonciello <Mario.Limonciello@amd.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Jorge Lopez <jorge.lopez2@hp.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20230426152139.1692-1-jes965@nyu.edu>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230426152139.1692-1-jes965@nyu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi again,

On 4/26/23 17:21, Jonathan Singer wrote:
> Previously, when the camera toggle switch was hit, the hp-wmi driver
> would report an invalid event code. By adding a case for that in the
> event handling switch statement we can eliminate that error code and
> enable a framework for potential further kernel handling of that key.
> This change was tested on my HP Envy x360 15-ey0023dx laptop, but it
> would likely work for any HP laptop with a camera toggle button. Now
> we emit an SW_CAMERA_LENS_COVER event, on a device that gets created
> on the first such event so as to not report incorrectly the state of
> the camera shutter before we can know its state.
> 
> Signed-off-by: Jonathan Singer <jes965@nyu.edu>

p.s.

> +		if (event_data == 0xff)
> +			input_report_switch(camera_shutter_input_dev, SW_CAMERA_LENS_COVER, 1);

I assume that event_data = 0xff happens when disabling the camera, so
we report SW_CAMERA_LENS_COVER 1 when the camera is disabled, right ?

Regards,

Hans


