Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B19C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Jul 2022 20:18:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233947AbiGRUSO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Jul 2022 16:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbiGRUSN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Jul 2022 16:18:13 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E77DF3B
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Jul 2022 13:18:12 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id ez10so23340713ejc.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Jul 2022 13:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=mloeAXDE6EDYZtSWmY6ksMIqAo+NlJskQ/kvKcbPkLc=;
        b=dOK9qktV/GIxvJpfDlLcEnBCjo4IOzRfewd6cnj1EK3K+E7agyajXKZO0ChA2zuKTU
         eDP3toZpK28VSFCQm50bVamQOzcCxyWa36YnOPXMPQVklmh76Qm83L3nwFPCdTp5GwXa
         YE8pCj5h4d0jmafFvlYDU6obbHaWC192V2TENHJt57l6s4bJpFJNYCRr0abQ2WW0lZdU
         lMIqlG6Vhfuu7jDOUPvK7Gaqp9aq4SGv9mKz0TYAhZPBy3ngg8uAt2M18yY5MNK4cBhg
         DeLpGbLa/6eE7kSaDuYEz59FsQvCAdCk3IIO9TNO+XGjvehPHaUL0sHNpSyDtYN+ImSZ
         78qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=mloeAXDE6EDYZtSWmY6ksMIqAo+NlJskQ/kvKcbPkLc=;
        b=QGudBc8BOlFFD7/WJJpua+3PDSC1gkNvo1HA/e4/Os/ULqQaoThDM2MfIt1Nb39hQC
         DWb4b+4LZ66FCJUdkOv7VpjFqc7EK3ybkhe3I7LJ94qSDq7o4hvbqlGyLKACrnlgSubs
         n/0YpoiWIx40/HosUaOmMzYeqzojOvCKOjbcVG9ELww1L08dbP7hu8/YFzecQizf7SXl
         0Xlxu8OlGPO58NwSMV5VD456frhYwpqQRtVwjMDlFLhxCYHCJIm5u0q477xi1EraEcYl
         a5/bOfp9zklCU85Hzddpuw9/yf5SkH/+JSQuI3VQ3KJBDiEnsGs1k8PWYRq342YFpB7n
         c0Nw==
X-Gm-Message-State: AJIora94AS6k0IfAelyMZluhHDUu024AmY6m3z+gwON+pGcDWRTx7Wrn
        nXsLEP2Hd9Ct/BMaDgFFF9RRdDSDnoJx8Kaz7mfISkKUEjmhkB33
X-Google-Smtp-Source: AGRyM1sWyRIsuCYjJp5Buuj1j1Rsx1LmyC3IKnEamfZoi1CzemEEwSFSe54M+XBjv0VVxo2oxQsOXKjtiU+kzghC1yI=
X-Received: by 2002:a17:906:9b09:b0:72b:9612:d373 with SMTP id
 eo9-20020a1709069b0900b0072b9612d373mr26220763ejc.606.1658175491236; Mon, 18
 Jul 2022 13:18:11 -0700 (PDT)
MIME-Version: 1.0
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 18 Jul 2022 22:17:35 +0200
Message-ID: <CAHp75VeH9Lax-S=qPq4a_i1kLBWTV=Y0=ePtFHNUN7cR65sa_g@mail.gmail.com>
Subject: names for root swnodes in INT33FE driver and others
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

HI!

During the discussion of some DSA rework [1] I just realized that
names for root swnodes are not required and moreover should be unique
in the system. Looking into the INT33FE driver I'm now asking myself
why we are still using names there (except just convenience for us)?

Note, theoretically it might be possible that one can somehow connect
another i2c device to those Cherry Trail machines (let's say via
USB-to-I2C adapter). And somehow try to register swnode from maybe
out-of-tree driver, however it's not an issue to the official kernel.

That said, maybe better just to remove them where we don't rely on their names?

[1]: https://lore.kernel.org/all/YtWzWdkFVMg0Hyvf@smile.fi.intel.com/

-- 
With Best Regards,
Andy Shevchenko
