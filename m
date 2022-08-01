Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F59C00144
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 15:20:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233475AbiHAPUV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 11:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233448AbiHAPUQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 11:20:16 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D665D27A
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 08:20:10 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id s11so2755414edd.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 08:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=AN/67HckaV+bj1kGtyeYw19VFahC+7ZIP6se1RU6ArM=;
        b=McucRNLs6/rmABV3zF4bQV4cf2yOyVZ8i9hXB0CSm9n+o83E8P58w8AY6aK0Yuv/9/
         KSITjuUaz6NDRKElY3HLLTHVcMFVqqYcDm3t70hlGbrvXxrIcyeL9eYAx9NNq2lumWbj
         yOfTJtJUXVMIeJxvpYUUvB0Al34JIzSd1FHAniYXu9FSatzgwrrymghEDM4IfUoByXd7
         m6bIM85SExtCCs8ocI4c5a9vubKXBXr1nlhqLNH2mLfcGupUsQkSuDCniRZlrIOad+XR
         tJD3+48v+OWkCNMEAnIdjSqgWYjZBtsl/fiheMd8xHuY7OYViTA9gqNwAgM6dS2A50b8
         XbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=AN/67HckaV+bj1kGtyeYw19VFahC+7ZIP6se1RU6ArM=;
        b=uRVVq0e9KEa+6vHMCSL7vUgJmKVLTe6kqPh238cPJRJ0r7kK0IM0gEkXg4ToIqTw47
         ocl/1QTln1/tjO+LxkWiYkjy61DPiYA3CD9CF+KgoWT9nPBCYGhAoDzaZPqcPBwxEEEW
         RpIKpwHICdyLs96MBEBLGzG4+FY8J1McHFG0rPMOW/X3QZYXW2gbPAlTGKS2RSnby+jz
         0C1ylHvxtKyJ/1eBLaULDCWH2moqPOC8IzPVcE/vBAM5Edww19cDbGip5YTsQLi3KURX
         DFank7DvjLvoO6bKpIckw3dvy/Gwq4hCqsL71goVuEOgbFa4jJPme/mQZALjHN1U+3cL
         N6cQ==
X-Gm-Message-State: AJIora+9S3w6Km7W51KimlHmS36V1XFWaTq6x6c0J22Wno5vCRBSC7P9
        umktuqzh2eISjYqff2ptcDsuc0oAyH53QxpRK1s=
X-Google-Smtp-Source: AGRyM1sK9ufT8floQCdQwIQb1pGzYaBTavdNdTqPjK7e7bm4MLaRszJhSlkuXo6vJMGxbV9fWPwLZHekAH2TByigIQ4=
X-Received: by 2002:a05:6402:84a:b0:426:262d:967e with SMTP id
 b10-20020a056402084a00b00426262d967emr15754193edz.286.1659367208698; Mon, 01
 Aug 2022 08:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220801145536.172410-1-hdegoede@redhat.com>
In-Reply-To: <20220801145536.172410-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Aug 2022 17:19:31 +0200
Message-ID: <CAHp75VeYJENVUZD70ME-QaoT4Kp8fskiEa_w-42b=8ypJNruYQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86/intel/vsec: Fix wrong type for local status variables
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        kernel test robot <lkp@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        David E Box <david.e.box@intel.com>,
        Gayatri Kammela <gayatri.kammela@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Aug 1, 2022 at 4:55 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The local status variables in intel_vsec_pci_error_detected()
> and intel_vsec_pci_slot_reset() should have pci_ers_result_t as type
> (and not pci_channel_state_t).
>
> Also fix a whitespace error as well as intel_vsec_pci_err_handlers not
> being marked static.
>
> This fixes the following sparse errors:
>
> drivers/platform/x86/intel/vsec.c:429:38: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted pci_channel_state_t [usertype] status @@     got restricted pci_ers_result_t @@
> drivers/platform/x86/intel/vsec.c:429:38: sparse:     expected restricted pci_channel_state_t [usertype] status
> drivers/platform/x86/intel/vsec.c:429:38: sparse:     got restricted pci_ers_result_t
> drivers/platform/x86/intel/vsec.c:434:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted pci_channel_state_t [usertype] status @@     got restricted pci_ers_result_t @@

Can we just instead show only a single case per type of the sparse
errors so we reduce the noise in the commit message? Or another
variants on compressing this text somehow?

> drivers/platform/x86/intel/vsec.c:434:24: sparse:     expected restricted pci_channel_state_t [usertype] status
> drivers/platform/x86/intel/vsec.c:434:24: sparse:     got restricted pci_ers_result_t
> drivers/platform/x86/intel/vsec.c:438:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted pci_ers_result_t @@     got restricted pci_channel_state_t [usertype] status @@
> drivers/platform/x86/intel/vsec.c:438:16: sparse:     expected restricted pci_ers_result_t
> drivers/platform/x86/intel/vsec.c:438:16: sparse:     got restricted pci_channel_state_t [usertype] status
> drivers/platform/x86/intel/vsec.c:444:38: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted pci_channel_state_t [usertype] status @@     got restricted pci_ers_result_t @@
> drivers/platform/x86/intel/vsec.c:444:38: sparse:     expected restricted pci_channel_state_t [usertype] status
> drivers/platform/x86/intel/vsec.c:444:38: sparse:     got restricted pci_ers_result_t
> drivers/platform/x86/intel/vsec.c:457:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted pci_channel_state_t [usertype] status @@     got restricted pci_ers_result_t @@
> drivers/platform/x86/intel/vsec.c:457:16: sparse:     expected restricted pci_channel_state_t [usertype] status
> drivers/platform/x86/intel/vsec.c:457:16: sparse:     got restricted pci_ers_result_t
> drivers/platform/x86/intel/vsec.c:472:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted pci_ers_result_t @@     got restricted pci_channel_state_t [usertype] status @@
> drivers/platform/x86/intel/vsec.c:472:16: sparse:     expected restricted pci_ers_result_t
> drivers/platform/x86/intel/vsec.c:472:16: sparse:     got restricted pci_channel_state_t [usertype] status
> drivers/platform/x86/intel/vsec.c:480:33: sparse: sparse: symbol 'intel_vsec_pci_err_handlers' was not declared. Should it be static?

Code looks good to me.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko
