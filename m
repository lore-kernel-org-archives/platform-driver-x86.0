Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A651ECAAA1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Oct 2022 15:51:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235484AbiJ0Pvc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Oct 2022 11:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234105AbiJ0Pvb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Oct 2022 11:51:31 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7222917FD61
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 08:51:26 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id y143so1081351iof.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 08:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dozLLyjKjqHhb+X0acBLKw9IjdLm5xj2ebLr4rNdoek=;
        b=QEUKYJ5XpOUdpbO3IpoLPnX8wuqiX+Ha7nGFYn/28VUjh6r4J4gP9Ie3YKjpQ6YnxP
         kuqhZyUh+ovtgz9mzVpYzA+/AFOiiWzGzELXBTFlbdtCjVk+y//lc3SQEtSU3jO2x8/z
         hHERZmdYQwXQ04VEy50yVMS1Wt6ILH1KPLD58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dozLLyjKjqHhb+X0acBLKw9IjdLm5xj2ebLr4rNdoek=;
        b=BqBIjN820C1IX1eVUoz3EevRYyiNd3YXSFqr41vN30oPiQhuylE+OGeo9OemH0LYcE
         CbjFkYAQv9vpNfEeGnVg6cwwkXJplHWNGL1xOP1viXml8CeI5CctDKH16ZOmn/rUWHQG
         /b7PVidd84BrX5j9Gs29kKEdZXsAF12amNFa1MItnSDVlKSKmqjhJ2KpdPSpi1yhfAwK
         IlnQRuYFJKzVKzlksfDCAom6H3nLgJsXhd9Gv52ZkGXuhAhX05IShYOd1fceK0RKI6RL
         zx44wvLzZgMrliJqNDIJiGF4KyUaAnQ12X9Af4Rs2iMUbWpMkMSYHgfcNh++8KLKWQlM
         cLhA==
X-Gm-Message-State: ACrzQf3cKdyEkOjjnKeD/wjG6jPYzY2zXGEitL1ss0/tuvlKmFwdFXUO
        eSRLemZanH++WdIlYcarYrxkK+uP5Xqe2JcVS0dJMQ==
X-Google-Smtp-Source: AMsMyM5+k8oMSIJoYJjGQualIXDGLE2i4mR1iAbC8CMNclPTZYCdXQJ/Lj61ZnFfJX8LEro5WQrply5IguQSeM9aQDU=
X-Received: by 2002:a05:6638:138c:b0:364:4c3:eafc with SMTP id
 w12-20020a056638138c00b0036404c3eafcmr5456507jad.163.1666885885933; Thu, 27
 Oct 2022 08:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221027151908.v1.1.I295e65357f06f162b46ea6fc6c03be37e3978bdc@changeid>
 <4b7304c0-8dd5-9add-7c84-4e9f0aa9396b@redhat.com> <MN0PR12MB6101BCCA364437A76FED924AE2339@MN0PR12MB6101.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB6101BCCA364437A76FED924AE2339@MN0PR12MB6101.namprd12.prod.outlook.com>
From:   Sven van Ashbrook <svenva@chromium.org>
Date:   Thu, 27 Oct 2022 11:51:15 -0400
Message-ID: <CAG-rBijvNoN3ppz6bdkEUofYPPBxCtFfo1nWBK5TdG69fcKMnA@mail.gmail.com>
Subject: Re: [PATCH v1] platform/x86: intel_pmc_core: promote S0ix failure
 warn() to WARN()
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "rrangel@chromium.org" <rrangel@chromium.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>,
        Rafael J Wysocki <rjw@rjwysocki.net>,
        Rajat Jain <rajatja@google.com>,
        David E Box <david.e.box@intel.com>,
        Mark Gross <markgross@kernel.org>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Oct 27, 2022 at 11:47 AM Limonciello, Mario
<Mario.Limonciello@amd.com> wrote:
>
> If we do make changes to this message level so that other infrastructure picks up I suggest
> we do it for both drivers.

Sounds good, patch feedback willing.

> WARN() is really only intended for internal kernel bugs and not for
> hw misbehaving, so I'm not a fan of the change you are suggesting here.

Thanks, I was not aware of this distinction. But it does look like upper-case
WARN is already used in many places to indicate hw misbehaving?

Here for example:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/chrome/cros_ec.c?h=v6.1-rc2#n142
