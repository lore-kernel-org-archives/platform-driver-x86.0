Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92B8CA101D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Sep 2023 22:56:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232047AbjIEW4W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Sep 2023 18:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233641AbjIEW4W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Sep 2023 18:56:22 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A0B1B6
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Sep 2023 15:56:17 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-500bbe3ef0eso417330e87.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Sep 2023 15:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693954575; x=1694559375; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NGXeEczgA9LphP4UdxC38RekZBY8qrCBSM7+Stq+6I=;
        b=aBXKCU36JS11wSUlj4lIPcqgu7aj9E6PfV5E3/GvmeeofDI5xQ/0kavv1v37id+nel
         7zBYvHa2Qr+ic3YpkY7Q0IXuhWnUxC1PiidUFGhSALFgUDFtZsOObvaRO1G1IIoZBGaO
         A8wG8KaXPueY/sVH0N/FLpm+qqSsirTfZu7HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693954575; x=1694559375;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NGXeEczgA9LphP4UdxC38RekZBY8qrCBSM7+Stq+6I=;
        b=D9B5Nuj4pmc+w3wSy6dd+6Zs9QcfSR2StEyBFQO1iW6QBnoXVNNYePXM0MOI/BI07D
         B+eU28Rv0tV37wmHt1z8H2lonF+rv3A4E0aID6RfLO9o0rptRtlu+OHj0h/trQNkjwju
         vMnm+lF5C/CyJbw9Bl95Yc53/0ag/sqFHVKxShD903eUPhxYvDkt6LRCI708Ggajc5vQ
         d/J6RxoNNPnRfZIDxnIaOT6yKQw5SPDKzmU1NUfj+IZvYFxtRbE2uXgGvSMm2RMlPN0d
         kohrQUwFLfJvTt4HWyQ6bvAAH1B1qRmKikA5Iyar+He3S51mQNpZ2BH62EY/FbY0Wmpl
         QrUw==
X-Gm-Message-State: AOJu0Yx0TTIWuIpak61YopktzqFv+I9y8bdTclJ96Ez+MB4q3+EKm5VP
        xBTNhPbbRq9WkKlUPoE6yEBQN02LhDmWlFZAMEWyVA==
X-Google-Smtp-Source: AGHT+IHYUtjBkMfDU9GXRAamcogYrs+yiDDeqP/qm65g/NIerCdBZ0EqaUtXVDrQlBvmo3WeXpe55hJMABEEFT3h5sI=
X-Received: by 2002:a05:6512:2256:b0:4fe:13c9:2071 with SMTP id
 i22-20020a056512225600b004fe13c92071mr395748lfu.2.1693954575649; Tue, 05 Sep
 2023 15:56:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Sep 2023 17:56:15 -0500
MIME-Version: 1.0
In-Reply-To: <321578a9-91fb-4733-b4c7-82dcc0ec8f8f@linux.intel.com>
References: <20230831011405.3246849-1-swboyd@chromium.org> <20230831011405.3246849-3-swboyd@chromium.org>
 <321578a9-91fb-4733-b4c7-82dcc0ec8f8f@linux.intel.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Sep 2023 17:56:15 -0500
Message-ID: <CAE-0n514jMG3ckYF58koSamHDYiuoxry7cyuoNMGjygwQOCb9g@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform/x86: intel_scu_ipc: Check status upon
 timeout in ipc_wait_for_interrupt()
To:     Hans de Goede <hdegoede@redhat.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prashant Malani <pmalani@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Quoting Kuppuswamy Sathyanarayanan (2023-08-31 07:27:35)
>
>
> Since you are not using the return value, I would not use time_left. I think the
> following version is easy to read. But it is up to you.
>
> wait_for_completion_timeout(&scu->cmd_complete, IPC_TIMEOUT)
>
> status = ipc_read_status(scu);
>
> if (status & IPC_STATUS_BUSY)
>    return -ETIMEDOUT;
>
> if (status & IPC_STATUS_ERR)
>    return -EIO;
>
> return 0;
>
> With above fixed, you can add

Thanks! That's a lot better.
