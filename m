Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD386C48BC2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 20:44:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9785461002
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 20:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhFWUqy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Jun 2021 16:46:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45781 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229523AbhFWUqy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Jun 2021 16:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624481075;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JH9jmR1OAVNMzGpYEJWqxpOuRDf9a4wD9iBZ1bGGUe4=;
        b=jML9ZKN7qHnL/xgj0Two+E3G/IWBpfDh/i429T5dsHOttWglELkm68iS97orPEBM1t/W9N
        k0L4ayyV3Q+FlN1S3XxuKanM4rEozJowC9tz6Fdr8KPb0EYu4Yu4stafeH176Lo5F9ISyk
        lamzFgfySeA/BwCaMrlaVzeVYXNaD4Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-P5_yNxI-Na2EaL16FcXF-w-1; Wed, 23 Jun 2021 16:44:34 -0400
X-MC-Unique: P5_yNxI-Na2EaL16FcXF-w-1
Received: by mail-ed1-f70.google.com with SMTP id c9-20020a05640227c9b0290394ac48c2e4so1989612ede.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jun 2021 13:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JH9jmR1OAVNMzGpYEJWqxpOuRDf9a4wD9iBZ1bGGUe4=;
        b=J9dX87hClGzaqKiQ3kb2Pgi/p0E6vli3K11eh49fgJiHPi/NrxIQUACzomzSx0tn5+
         i5iZHSeMAIzds2yuaFOnDV9qI49fqrAPoLRiw39/30Z50yxLHsbEWLBWxF+VP5R9glIC
         /ox65v54zbrUDB0UGnMSW1kK6V2i4XQhfU6DdXskIZyK6fEvaKquMP8mdK58DU+JjI4i
         mXRJIsnKLmHAqq9VN5WcjFCeNwT6zFjAO1Bh7GdDu6BINH+qx+b634wKnKSkEzsDp4qS
         AeW6PqY9F8bVL2s1Ww4G1bA4OV6rw8npuZAprlvEGGzKYHJu1bugzgwBVoM3zsgW6jrR
         AfQw==
X-Gm-Message-State: AOAM530hAb7pXzS8OAnggrPLVIIhlaSYK1IlAXl5cS5CBjROjLrpVOQd
        OJxh9ZCfnk7omTBdgE5AeO9eFK+ggJUCY+vmKc9JjrdPDXoDYdjF0nzcf7Bglt5i3q85c1iypPV
        02Tk3rglQj5TtvVlf0B+wkM2xCKn5BtlHLnQ1/c9XrVITHmvdCQ680g0V7Mb+sc0mBUKgZtIOrc
        UKr/woru9JqA==
X-Received: by 2002:a05:6402:cb0:: with SMTP id cn16mr2165185edb.165.1624481072845;
        Wed, 23 Jun 2021 13:44:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNGPOX+uFjJTCojfhdjke09IWWpPN3lTUvqpWy6a256Q6BzpzMpmQ5rx+THx/K8GTThS86Hw==
X-Received: by 2002:a05:6402:cb0:: with SMTP id cn16mr2165163edb.165.1624481072600;
        Wed, 23 Jun 2021 13:44:32 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id eb9sm328581ejc.32.2021.06.23.13.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 13:44:31 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] updates to amd-pmc driver
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        mgross@linux.intel.com, Raul E Rangel <rrangel@chromium.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <17e342aa-fa99-c14d-d018-2b4b65d31933@redhat.com>
Date:   Wed, 23 Jun 2021 22:44:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,


On 6/23/21 10:01 PM, Shyam Sundar S K wrote:
> Couple of existing issues on the completion codes to SMU
> and a newer way to get the s0ix statistics are introduced.
> 
> Also, add acpi ids for current and future revisions of the
> pmc controller.
> 
> Shyam Sundar S K (7):
>   platform/x86: amd-pmc: Fix command completion code
>   platform/x86: amd-pmc: Fix SMU firmware reporting mechanism
>   platform/x86: amd-pmc: call dump registers only once
>   platform/x86: amd-pmc: Add support for logging SMU metrics
>   platform/x86: amd-pmc: Add support for logging s0ix counters
>   platform/x86: amd-pmc: Add support for ACPI ID AMDI0006
>   platform/x86: amd-pmc: Add new acpi id for future PMC controllers

Thank you for the new version.

Can you please respond to Raul's reply to patch 1/6 of v1 of
the series?  Raul's remark seems very relevant to me.

Regards,

Hans

