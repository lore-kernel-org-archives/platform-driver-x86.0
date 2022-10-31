Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E489ECAAA1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 Oct 2022 20:20:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbiJaUUw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 Oct 2022 16:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbiJaUUv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Oct 2022 16:20:51 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1341115A
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Oct 2022 13:20:50 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id l11so17891089edb.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Oct 2022 13:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nwsZFSIfvDZpHHuxEMGjyPvVY5KuSJvTYvlj6dRm7S4=;
        b=G+7jzDuJE+lROFNuCb0pBK3RV3kM2LDLzDaSS9pSPmGE6aNaSkmYDkxWS3i31Smghh
         VFYCHnMmodCH7Uz4/yE34CRuCmIaiACiuqcCKhpUSOpGDVnasYzdKNI9acrPN82cQhzm
         Ce+NDxVasqi0uD0ILXkfZd72lvEQTNi+yHvxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwsZFSIfvDZpHHuxEMGjyPvVY5KuSJvTYvlj6dRm7S4=;
        b=zw/ttRRDenxibgt3JA3pR7WLN2+2d2YRe51A+In1wMQ9GjH6qyMd6Oqd/lcVDYE0Jf
         yJCmSssgZKrYX04XcESrSc3qH6UEFxextfr+u8M5ZxsKHjiywm4rjjnN633npgz+iPIN
         jf+dvtYQm7dtZnjkU8QjK089F/DsnPY/8vir4yW9jIjPzagfYiJzNUHTkPDr5kSg8w0+
         s3nnDJSUXXbZ6rbbU5fKOVZbcNgZt+PXN5nRDmDe9k0pDey0aqU167lRU7qZc7pIjdTL
         FC+b/cGeWk7Abkr0WsQEolEF0SqDaexZVA3ItaynQJvSEtKcKXnVG4mFLRldnU9owPdS
         T0nA==
X-Gm-Message-State: ACrzQf1SYzQhE08pb4663RmsFah2rDduuspEyHxMVBMP9yNPVRLEXfjt
        q00onVa189k0CyQ1rimw6GllpJsWaBqEZA==
X-Google-Smtp-Source: AMsMyM7G0BWSUBUAjI0U5mA13hiVTkdNPu59LHhQBKvYpF/jCLkQ94CSriPRXmWtEvjCf6z2R67JwA==
X-Received: by 2002:a05:6402:f0e:b0:461:aaa3:a11c with SMTP id i14-20020a0564020f0e00b00461aaa3a11cmr15667139eda.53.1667247648763;
        Mon, 31 Oct 2022 13:20:48 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id sg43-20020a170907a42b00b007aa3822f4d2sm3484059ejc.17.2022.10.31.13.20.47
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 13:20:47 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id f7so13387783edc.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Oct 2022 13:20:47 -0700 (PDT)
X-Received: by 2002:aa7:d9d1:0:b0:461:9556:23e6 with SMTP id
 v17-20020aa7d9d1000000b00461955623e6mr16135034eds.25.1667247646748; Mon, 31
 Oct 2022 13:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221027151908.v1.1.I295e65357f06f162b46ea6fc6c03be37e3978bdc@changeid>
 <4b7304c0-8dd5-9add-7c84-4e9f0aa9396b@redhat.com> <MN0PR12MB6101BCCA364437A76FED924AE2339@MN0PR12MB6101.namprd12.prod.outlook.com>
 <CAG-rBijvNoN3ppz6bdkEUofYPPBxCtFfo1nWBK5TdG69fcKMnA@mail.gmail.com>
 <CAE2upjS6qRGRcuVYuAB5DMf66A7VcfCKKYEkpsr1My7RnKDFtQ@mail.gmail.com>
 <CAG-rBihDRq1y61tAp56yYCoTOSZXO9OZNzn7gXb_y8XaiO_zqg@mail.gmail.com>
 <MN0PR12MB610109F448E3FC8CE71FBA76E2379@MN0PR12MB6101.namprd12.prod.outlook.com>
 <2124934d-a8f1-59fa-1958-28472d06d2d6@redhat.com>
In-Reply-To: <2124934d-a8f1-59fa-1958-28472d06d2d6@redhat.com>
From:   Sven van Ashbrook <svenva@chromium.org>
Date:   Mon, 31 Oct 2022 16:20:35 -0400
X-Gmail-Original-Message-ID: <CAM7w-FVC3pcjROQA1ra5Py9A9BrQotrwJNiykNSFkUN-p8_DGw@mail.gmail.com>
Message-ID: <CAM7w-FVC3pcjROQA1ra5Py9A9BrQotrwJNiykNSFkUN-p8_DGw@mail.gmail.com>
Subject: Re: [PATCH v1] platform/x86: intel_pmc_core: promote S0ix failure
 warn() to WARN()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "rrangel@chromium.org" <rrangel@chromium.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>,
        Rafael J Wysocki <rjw@rjwysocki.net>,
        Rajat Jain <rajatja@google.com>,
        David E Box <david.e.box@intel.com>,
        Mark Gross <markgross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Oct 31, 2022 at 4:15 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Something like this does indeed sound like a nice solution for this.

Agreed, much nicer than letting the monitoring infrastructure hunt for
certain dmesg strings, for sure. Thank you David for the suggestion,
and Mario for the opening ideas.
