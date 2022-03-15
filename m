Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F40C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Mar 2022 01:01:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344081AbiCOBC3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Mar 2022 21:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344079AbiCOBC2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Mar 2022 21:02:28 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE2C31911
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 18:01:18 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id t11so2582590ybi.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 18:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gwzntja23CXu4nGypeSr/YvTugWSt8x1I0iZeIrduiw=;
        b=w/1wPl5nG6eMDlh7Z0yU3HXqeLwQ5QBWszqv5df0uqy1LxL3+rLlGYIRK+WzT0GIH8
         Mq1jlON/2+qWJTWVpnLnPoW6TjFdpB+gpxHiFud/0k+BEvaLFtB40YWONxyJDsgZxap7
         +LPnW26Ve7/T6IKr7x/jcoqX+IAhYpP6W4PvyhqZb0v7oVg4L32LzW2+b4triLeX5/Jq
         KLSSpWyENZ/1/w/KMSXxpVmA/pj0c0VJUOv4TYwKADmyfx6MtiO26K8c8TlolQPOYCJ+
         gshgl8Zsx9fUk/1LgCXo3Df055vqnFe15EftZTWRrGyXj8VhWCWI7Fi6aYuvRVEIVFjg
         W5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gwzntja23CXu4nGypeSr/YvTugWSt8x1I0iZeIrduiw=;
        b=TMdEZ5dKWAnEaNaVa3y+wf+ABuI8YWER3wTsz61jpWAu9sOnSqaO853noXYUlQXq/k
         OLYo1efJfBVdiwDwyjd/BlUM6+9+LRi3Pz6qTRtD+2A3APk4j3RMOp47SAa2MLRFGFik
         VVxxv1gYyhfe5sYl1TG/DP+95CoMzH4MQnBnh2jAaNTtX2H8Lrgi1adNyV0K25NhATEh
         ll/IjaoiPFCkhGnUQyFPdi/wdkuI/ggEsNgML5xJdswO4gBVF1ZKhtcQ2SlhxnTJaWRT
         ptHX9zLwysZZqtUU5FbVcrlyU3O3PsypmOvqvMsiH3PToSjQrj+7EdoOau62W9MgH0gZ
         iMgg==
X-Gm-Message-State: AOAM533jh4zj3ZOB1MtOZWO8KsUVrzwHbnxdsxVgOteirVVrplLigIUH
        /rpvbKWTHMBXiXL0hO/fpkOUrBonjbayKLcQW0zb7w==
X-Google-Smtp-Source: ABdhPJxu4gmQuoPTkL8MiSyXdebzsRdwsuGk37SWTmhlwfgJWlYUbSuxcacb8hStJKAfGOje6uvJr+q5hilUnnsniEk=
X-Received: by 2002:a05:6902:203:b0:628:7b6f:2845 with SMTP id
 j3-20020a056902020300b006287b6f2845mr21223883ybs.533.1647306077478; Mon, 14
 Mar 2022 18:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <7640f9ac-88af-ace7-0bd4-990d852567dd@redhat.com>
In-Reply-To: <7640f9ac-88af-ace7-0bd4-990d852567dd@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Mar 2022 02:01:06 +0100
Message-ID: <CACRpkdbDWrrDPK9=5NErtM81109qtTHyFcTON=zXtB2B86wAdA@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable branch with 5.17-rc1 + "pinctrl: baytrail:
 Add pinconf,group + function for the pmu_clk"
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Feb 24, 2022 at 5:48 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Hello Intel pinctrl maintainers,
>
> As discussed here is a pull-req for an immutable branch with 5.17-rc1 +
> "pinctrl: baytrail: Add pinconf,group + function for the pmu_clk".

I suppose this is for Andy possibly I already pulled the pulled tree.

Yours,
Linus Walleij
