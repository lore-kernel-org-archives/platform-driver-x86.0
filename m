Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61557C4320E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 19:08:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49CE6610E6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 19:08:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbhHRTJP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 15:09:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55286 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233729AbhHRTJD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 15:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629313707;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tp216Z1B4x9IQEM6aUrfFJCsyNTBB/9H6ygLcXZZWwk=;
        b=cmKFuQDmJZFn4x0AW7tkBxDeowExcQZ4PiMpW/FyoTazxLZrls0c1ZrOukMqLpSbGmMHaT
        LKRvwH7q6Hd7re6dnUyZYSzKR/XZ3J3ud8RG9T1XnhEikA2EEiTXWGHdxgsRCbypOky4oI
        OEehertdRB2haBOjdZslC3P3P4isPAY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-R_73-i8KMs-Y0vCkUGnhUg-1; Wed, 18 Aug 2021 15:08:23 -0400
X-MC-Unique: R_73-i8KMs-Y0vCkUGnhUg-1
Received: by mail-ed1-f71.google.com with SMTP id o17-20020aa7d3d1000000b003beaf992d17so1540784edr.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 12:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tp216Z1B4x9IQEM6aUrfFJCsyNTBB/9H6ygLcXZZWwk=;
        b=XxwwdnvsrIEhw3lnn8dSOg7/8XgcwOymMAq2lp4ERUIBaw+IBnlWo8/2R7J6dFMulS
         3HVorvuZOxLmFPAA0Tq0L7XN1ySIJo92MldRLmpe/0QduXdb+nwl5Sj04FncGBTqd2ot
         2JplWZ/hATuzKZ5p0JIqljTvZ/ynXQbY9UZdrGzpC7asKsmvcTYqfG4RXysSXJ7dZhuv
         iDbofTXoUJ9OtAueqEuO4puwn1036ONyiVgPtBul2EX3gwqXIKl+Bne5KZmcrcPCzHT1
         VvuqnOp7pHMWXmQs8COnwdEYFAPDRtbwUGWCNLZJiwC6vM8WRus9xdF/YSX5d6Cthas7
         dzBQ==
X-Gm-Message-State: AOAM532W+Tx8TEQhzp392PvRz7abO9kD7lZW5MPOIvtgaFw7yVN/yCLw
        cv5TsYCEM74lBW3ZngyLySSSvcgs1yC/r3Q04Wib/51hLVaKKZgWajYNYo70hjussjAhK0iQH5u
        nv2bbuu6x8t/RaGMxX0VTlfIPmLtiwXR1EA==
X-Received: by 2002:a17:907:265b:: with SMTP id ar27mr11542555ejc.300.1629313702875;
        Wed, 18 Aug 2021 12:08:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1Pn1PI04Ekx2RrFjzRalquNFFmkOsafXBNm2k44DoJGPJZYiaYMhaIvJ1EocB56ZAMkilmg==
X-Received: by 2002:a17:907:265b:: with SMTP id ar27mr11542546ejc.300.1629313702745;
        Wed, 18 Aug 2021 12:08:22 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k21sm261695ejj.55.2021.08.18.12.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 12:08:22 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 1/1] ishtp: Add support for Intel ishtp eclite
 driver
To:     "K Naduvalath, Sumesh" <sumesh.k.naduvalath@intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>
Cc:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Chinnu, Ganapathi" <ganapathi.chinnu@intel.com>,
        "Kumar, Nachiketa" <nachiketa.kumar@intel.com>
References: <20210730155801.15513-1-sumesh.k.naduvalath@intel.com>
 <e27afe05-77b0-f9e5-fb8a-c4a820b3ea60@redhat.com>
 <BYAPR11MB37528C0BE125D5E877A4C9A8A9FF9@BYAPR11MB3752.namprd11.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c68f2888-a4ee-f3f5-8907-e0916985e2f4@redhat.com>
Date:   Wed, 18 Aug 2021 21:08:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BYAPR11MB37528C0BE125D5E877A4C9A8A9FF9@BYAPR11MB3752.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/18/21 8:25 PM, K Naduvalath, Sumesh wrote:
> Thank you Hans for your review comments, and my apologies for the delayed response.
> Please find my reply inline -

<snip>

> I'll put through some tests and submit V3 if you don't have any other comments.

I've no further comments, splease send v3 when it is ready.

Regards,

Hans

