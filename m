Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D912EE49AD
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Sep 2023 22:55:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235259AbjIEWze (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Sep 2023 18:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbjIEWze (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Sep 2023 18:55:34 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C8BEB
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Sep 2023 15:55:30 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-501b9f27eb2so431157e87.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Sep 2023 15:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693954529; x=1694559329; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/aE71jBwo2GV3dFrwiu+ky8ibuDJHJ6rVDggwijE/Q=;
        b=jDBSF7RrNdN8vOijIYVSATn/YOvaFOD26qOuh9yaCsDokFgl41cCgGw1J0W01QgW8W
         /xHJjohFNWakAJIL+m64NTpnb2uADXWX4xRDjJ6S+mXfod5jFVi5UT3DXPiwVgDsfvo/
         /9vk560tv6U0oFrhKBWVRqVlaBSAKK/KSG4FQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693954529; x=1694559329;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/aE71jBwo2GV3dFrwiu+ky8ibuDJHJ6rVDggwijE/Q=;
        b=Hx4IDEskGwIJarnIoGbhILaWBxCFcb0bWrHpzJXhLFLx8NMJnROwudnf4JbBPc1X4n
         JKAl0Rk/uZpHnwVnw75fN26+sWBrTK45aMz6Oaqx9sZGukqd908uJo/TRyBq9ZEilhSM
         sbM/NB6fA2FZIK1p3EAEQPp2DVVyk5HjG9wzR10ysSJYglg6EtGRMCodD0r+AMRO8nS5
         wyxtbtk6fCwKq1MyYFrNDbDIlfskBScX49kFc5OofFj0Zgm0K0EbjJ4HrQ4zjkuqsSPP
         kRdzRPMp4JuqxxD2KxH6o1LLawzQw/D9E1nBS2rgjbwSBr9o5lsIeAmqUs2R1SOELnDG
         DV3Q==
X-Gm-Message-State: AOJu0YznQKm9dSfPoBGntqnjb/Xshz1ruTcqRWlVu0jGWR6ByEb1zNJV
        ZThnUoi8yOs+1xNO97+dgRU1q5DlF51+JMJkbxWSzg==
X-Google-Smtp-Source: AGHT+IEgEaOl36GWSh3WGoRoX6/lnoq9wvrXbrbCTp7tUNsUX+/IwhS6KbYyiPo7tn1Z3Mq4uiJZq6Ny8oGgjGGDuIY=
X-Received: by 2002:a19:2d51:0:b0:4ff:62a4:7aaf with SMTP id
 t17-20020a192d51000000b004ff62a47aafmr420871lft.2.1693954528760; Tue, 05 Sep
 2023 15:55:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Sep 2023 17:55:28 -0500
MIME-Version: 1.0
In-Reply-To: <934250db-b05f-4d48-8138-06986a14b3fb@linux.intel.com>
References: <20230831011405.3246849-1-swboyd@chromium.org> <934250db-b05f-4d48-8138-06986a14b3fb@linux.intel.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Sep 2023 17:55:28 -0500
Message-ID: <CAE-0n51phfrK2iMSisCb2zz+ETWx9nZ+zZ4ZS+3sPx8r3B+0RA@mail.gmail.com>
Subject: Re: [PATCH 0/3] platform/x86: intel_scu_ipc: Timeout fixes
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

Quoting Kuppuswamy Sathyanarayanan (2023-08-30 20:28:57)
>
>
> On 8/30/2023 6:14 PM, Stephen Boyd wrote:
> > I recently looked at some crash reports on ChromeOS devices that call
> > into this intel_scu_ipc driver. They were hitting timeouts, and it
> > certainly looks possible for those timeouts to be triggering because of
> > scheduling issues. Once things started going south, the timeouts kept
>
> Are you talking about timeouts during IPC command?

Yes? I see messages like this

	intel_scu_ipc intel_scu_ipc: IPC command 0x200a7 failed with -110

which led me to this driver and I wrote these patches based on that
failure message. I was trying to figure out how that could happen, and
it seems that it could simply be scheduling delays while nothing is
really timing out.

>
> > coming. Maybe that's because the other side got seriously confused? I
> > don't know. I'll poke at it some more by injecting timeouts on the
> > kernel side.
>
> Do you think it is possible due to a firmware issue?

I have no idea. Is there some way to figure that out? I'm not able to
reproduce the problem locally.
