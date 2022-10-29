Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BE2C433FE
	for <platform-driver-x86@archiver.kernel.org>; Sat, 29 Oct 2022 04:11:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiJ2ELq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 29 Oct 2022 00:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiJ2ELn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Oct 2022 00:11:43 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138B816655F
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Oct 2022 21:11:43 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id q142so73279iod.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Oct 2022 21:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a05XFZRuF/egEfrk+8goUQtIMz5cRuT5WlopnCpocEA=;
        b=kovLSyB8MPVeIrLXWhsv4ebR53tgy1CbZfJhjTODbTdNXDFJYhSS58l3eIrBPQloXb
         X1pjzYRmxulUgTVO9lYnvjrDngx55x8ukqNGRn6r8jA1R2skNKQcbkyQvIXoP2mPTljg
         sS1maOrMjVjwYgXlW9qK6HUrsLu+iIKpJOxKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a05XFZRuF/egEfrk+8goUQtIMz5cRuT5WlopnCpocEA=;
        b=Y7N2+M/E+M50NhcZV1PZ/VV9XclF3JAl+uA9+PrlnJeVvVBnuTUfScUSr331xmxazj
         shtCOqYxJvixsu95qpTqwFweJtCs6VVxX3e8p3a+77WlSQ9CYBlnuWYKDw0OV7QCBfPX
         ANpii1B5N29qcMTg000ru+uFrsVfZA7MdRmNiGGly/Ia88JbA7ZW8rDFL992coKqSCXS
         dIgZa299YR9e5zTorl/Q/UvpHlWp9Saxem7p6+2FeU4xFJ8Pby8TSgOg3C9eGQG8tbhc
         Ai0TBRqcUupOhFZ1lSuKmRfxiHvtcBK7o3Cavds0SyONZLlHX3RvV9yekQt+QFw4GlPu
         M+MQ==
X-Gm-Message-State: ACrzQf3Ovp10/1XlHjhDw/GlOaH01K6xA8cBxWcijYWUVD3dihLHIsNO
        UnKCjudM8ND5Dee6WiosJeOUlRvtUHzASCRybSyTWQ==
X-Google-Smtp-Source: AMsMyM4Y55scCBOsz86/H1I8gLjPFFzF+wX16Ll/6KNE81tm9k6eqk5HNMIvLNKpxTO1zj9SQrri/vM5tOasSmUIFeY=
X-Received: by 2002:a6b:4a01:0:b0:6bc:d4ae:321c with SMTP id
 w1-20020a6b4a01000000b006bcd4ae321cmr1385305iob.59.1667016702459; Fri, 28 Oct
 2022 21:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221027151908.v1.1.I295e65357f06f162b46ea6fc6c03be37e3978bdc@changeid>
 <4b7304c0-8dd5-9add-7c84-4e9f0aa9396b@redhat.com> <MN0PR12MB6101BCCA364437A76FED924AE2339@MN0PR12MB6101.namprd12.prod.outlook.com>
 <CAG-rBijvNoN3ppz6bdkEUofYPPBxCtFfo1nWBK5TdG69fcKMnA@mail.gmail.com> <CAE2upjS6qRGRcuVYuAB5DMf66A7VcfCKKYEkpsr1My7RnKDFtQ@mail.gmail.com>
In-Reply-To: <CAE2upjS6qRGRcuVYuAB5DMf66A7VcfCKKYEkpsr1My7RnKDFtQ@mail.gmail.com>
From:   Sven van Ashbrook <svenva@chromium.org>
Date:   Sat, 29 Oct 2022 00:11:32 -0400
Message-ID: <CAG-rBihDRq1y61tAp56yYCoTOSZXO9OZNzn7gXb_y8XaiO_zqg@mail.gmail.com>
Subject: Re: [PATCH v1] platform/x86: intel_pmc_core: promote S0ix failure
 warn() to WARN()
To:     Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
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

On Thu, Oct 27, 2022 at 12:02 PM Rajneesh Bhardwaj
<irenic.rajneesh@gmail.com> wrote:
> I'd advise against this promotion based on my experience with S0ix entry failures.

On Thu, Oct 27, 2022 at 11:40 AM Hans de Goede <hdegoede@redhat.com> wrote:
> I'm not a fan of the change you are suggesting here.

Thanks everyone for the feedback. Looks like there is consensus that it's
not advisable to promote the warning. We will move forward with changes to
our monitoring infrastructure instead.
