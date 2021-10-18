Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221B6C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Oct 2021 21:14:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0140A6115A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Oct 2021 21:14:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbhJRVQN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Oct 2021 17:16:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22215 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231858AbhJRVQM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Oct 2021 17:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634591640;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6eBzORXCbFEMu4YDfNXk+RL3umCNwL4ub/VK7Fp9vPc=;
        b=adCr46OK22ElragsxH+KTi/DkE4g3fe14JFKeOZN3BiFYmKkVKsKDpFXeU4hbtJnyyIV/x
        lp6N/AXmNHgpn2AJVBtrWN4IXnoJMv/rMfYKO1+vxwbz4a+vMQdsOrkaQnQzXv/dJ0nimq
        usdeq6FuesiXqgPSHH9Ge+pF8/Y6kAI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-_q2IylDIOPmW5_9Hwn5F3g-1; Mon, 18 Oct 2021 17:13:59 -0400
X-MC-Unique: _q2IylDIOPmW5_9Hwn5F3g-1
Received: by mail-ed1-f69.google.com with SMTP id d11-20020a50cd4b000000b003da63711a8aso15504730edj.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Oct 2021 14:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6eBzORXCbFEMu4YDfNXk+RL3umCNwL4ub/VK7Fp9vPc=;
        b=g6bLlMMnMpokNPVjikayctX1yXohKmC4BJ5+PaGI3aX9qlmpQ4xmiBFX6AYLWEw+tn
         Boowjz00Xs9qCtciSsTMuY7qN1tUzBhETXPvJX3T9QGL2EWKmfXo0X3gTLahtdX7dgTa
         HoAxrYVCW2vQ6/ah+2abB3rCdqgNY5t7Sxv6USpQLzk/DZHFhgMwpLzRbbuqQe4XTSuX
         Y+lDJIVgnxB3X2m9GPY1IfDJj6sBHPwn6LCEV0Y43GxK4IEYCRqwBYIjl2/sipzk4I2+
         pmYinGvu1sGKPmf+FLcdW9KWU7soFuO3sYn9w/utSNd/asi4c1qv18V9vkRtwztIpWdf
         9epQ==
X-Gm-Message-State: AOAM531Dn1he3CIU6tMdG18OkwB8MJjfZt54Sq0gwlkh67JI0xjh6bJ6
        9tkHL0LTGlwQtc3HV7v1oxZmjIR0VW/r3do0z5KlgLrvBJXqpz/xVJJX59tMC5ohcihoG8Mm8iw
        fOdXtk0ghpiEj+10k9E87X7mr+ystPhrfQw==
X-Received: by 2002:a17:906:4895:: with SMTP id v21mr33861135ejq.299.1634591638507;
        Mon, 18 Oct 2021 14:13:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR/1A9wzRRVEB3L+RBQpU75fFxxxvftqHqqkyF3AqtMVIPa7tvvcHIcNFBuxFp+GpIaMN07g==
X-Received: by 2002:a17:906:4895:: with SMTP id v21mr33861086ejq.299.1634591638159;
        Mon, 18 Oct 2021 14:13:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z13sm6933808ejl.106.2021.10.18.14.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 14:13:57 -0700 (PDT)
Message-ID: <c34cc4b8-31c8-9425-214f-2a0f39f048d9@redhat.com>
Date:   Mon, 18 Oct 2021 23:13:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/3] ASoC: Intel: Move soc_intel_is_foo() helpers to a
 generic header
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20211018143324.296961-1-hdegoede@redhat.com>
 <20211018143324.296961-2-hdegoede@redhat.com>
 <YW2UNRAWUphJqhyW@sirena.org.uk>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YW2UNRAWUphJqhyW@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 10/18/21 17:35, Mark Brown wrote:
> On Mon, Oct 18, 2021 at 04:33:22PM +0200, Hans de Goede wrote:
>> The soc_intel_is_foo() helpers from
>> sound/soc/intel/common/soc-intel-quirks.h are useful outside of the
>> sound subsystem too.
> 
> Acked-by: Mark Brown <broonie@kernel.org>

Does this mean that you are ok with me merging patch 1 + 2 through
the drivers/platform/x86 tree ?

Regards,

Hans

