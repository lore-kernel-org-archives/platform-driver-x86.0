Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E4FECAAD5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 29 Aug 2022 17:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbiH2RAY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 29 Aug 2022 13:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbiH2RAQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Aug 2022 13:00:16 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE9A10F2
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Aug 2022 10:00:11 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id z29so3441644lfb.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Aug 2022 10:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=02A4WbHhB+W2fYfm07iMIj/9+1lNCqkttx9wg+WkwYM=;
        b=bXsGTsbwdgP/vC54WZaHex/xFZJpn7/Z7wIr8upxeRpyU8TcKU+wj3zySEIQ3xJ6EU
         C8LtxyUIrb68Utgo1nRaV7LVGbUn2Fi1mODUc5nOWHkV5ze41b+6lwTARX7cWSEIyjzK
         T98lsCJH9Twwnggd8q0SiexYiE+yq6Tx3Acn02yachTkkx7E5pxS344E7atvTb34TE5G
         D3WFHkacjkjn9wb+gSyAqYYkXoK7weUQjtyb59zlaGWyUf0L/wVbTl1cksx/Mn8G6q//
         1tatGff5orV3ugFh4iSaN+bP1MGeLvmrZO5ZN0SCWRv0AFb0ZweWWTtQCGnrZpeC2B+9
         HwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=02A4WbHhB+W2fYfm07iMIj/9+1lNCqkttx9wg+WkwYM=;
        b=sKBJpGVc97AqhJS+fpIappx00g6Prx0jbxEA4WdzeVDq5i5eoCTQ0v1iox9A0RTQPv
         vJgp3glarnwesmPrdY34qMGT4RiVm4foyVYhZKHsLAIfVdvBBH2M/jPObNr6WlQv3SXw
         DNTCRSe/KvxIJoVWZLSdYsRFIySHHLFOVordJG1b6s7pkxxlWc0oXbRIYKYvjMWkk5BV
         Nbkjh+PftW8lxmTAtFHhtrmR5bkhvHbW1fCD5bBh41hniT7nu//b0XgQh1N1D93dfMv0
         TrFDTKvWCbWcEd+XWLJ3CX48G0/pv3Pr9QRsccmi1gIHALwMxDPdzgZw4nueTpIuUfh8
         J7wg==
X-Gm-Message-State: ACgBeo1j0cxHX8+jVZDelvoSztuMiMNnwhPEMuSdibw1967eBhDoQ5JU
        R6zPj7Va/Eo9zRv9LoYY1PnaNpIo43mwHV8OZ8+jiQ==
X-Google-Smtp-Source: AA6agR4NJYxf+fy5Mn9QZkjYnolAuc58qjTeTxjLSQKOdfiIgdgOlEupkZ0bsFUKtc3xN2lTpEZzRgMDVkdg08KFeek=
X-Received: by 2002:a05:6512:b01:b0:48b:a065:2a8b with SMTP id
 w1-20020a0565120b0100b0048ba0652a8bmr6207623lfu.401.1661792409139; Mon, 29
 Aug 2022 10:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220828192920.805253-3-lkml@vorpal.se> <202208290605.gE9IGbxE-lkp@intel.com>
In-Reply-To: <202208290605.gE9IGbxE-lkp@intel.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 29 Aug 2022 09:59:57 -0700
Message-ID: <CAKwvOdmm8c30fky5GjFbLPhrfAEsO7SgehRYip-PAKr-zonEmA@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform/x86: Battery charge mode in toshiba_acpi (sysfs)
To:     kernel test robot <lkp@intel.com>
Cc:     Arvid Norlander <lkml@vorpal.se>,
        platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org,
        llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Sebastian Reichel <sre@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Azael Avalos <coproscefalo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Aug 28, 2022 at 3:16 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Arvid,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on 1c23f9e627a7b412978b4e852793c5e3c3efc555]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Arvid-Norlander/platform-x86-Battery-charge-mode-in-toshiba_acpi/20220829-033110
> base:   1c23f9e627a7b412978b4e852793c5e3c3efc555
> config: x86_64-randconfig-a014-20220829 (https://download.01.org/0day-ci/archive/20220829/202208290605.gE9IGbxE-lkp@intel.com/config)

Note: this was from a randconfig; it's highly likely you need this
funky config to repro.  ^ should be the link to the config.

-- 
Thanks,
~Nick Desaulniers
