Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F06C48BDF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Jun 2021 08:40:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B32A1613D9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Jun 2021 08:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhFOImo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Jun 2021 04:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbhFOImm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Jun 2021 04:42:42 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7999C061574
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jun 2021 01:40:38 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id f84so19438106ybg.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jun 2021 01:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=p9Stz1wH7D73oBZnYEc9H7ja7rMSVWMc7Sy7hUh9dBM=;
        b=c77e4FXiyfST/gTfTXLKaROc1EHQnbPie7dnCcLE9mOEzV0zxpugBSW/FXhFUfpyGy
         5LtVUWbkcZ8DavP2NcAtWW+VxRnHagA7iIhV8+cWi6RlCJKhE7D47V4FpmLXatiqpAPT
         hcH4Z5jhkx7LhA1oB7WEOxkGKRUOo7JzU9ypZjrTbJhWqwIab3HuswwdY87sVLh5sGRx
         x+kAZu7aBpPBXvRXuCt3XhFd321yd52/I+ZHbsm/J/L1J+xoBNhLhZdCbOFlrZatf2ab
         xeic+HLmJuR0Z7YbYedULcvfHBxuIpIJWa+nbntaO57VbkMVSyXyxRHqQMMtlXykLISQ
         ffwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=p9Stz1wH7D73oBZnYEc9H7ja7rMSVWMc7Sy7hUh9dBM=;
        b=BUZHWwXz37QHxyG62d3Kqunfz2RKl3ayPuFTWKwcQ6dvE6hqEMgzmihJZkZB2K/lSS
         L5u+hfy3+hREv21yXG+sx/d3AWnAdcsnFGcCugH1iISLItZCBbVR/5qDuAHaJOu+GDSD
         RrRAuO57R2dZhEyQHE2hYoGmRPQbbHRhZJ54G/ZHWfuLd03EUZHvfc5OvWe2U5CgylGn
         6VpYDSkuF5WgxMjbNNqiI0m6HN7//wMQ+FiVus2MjOx4p7UPiECidD3qjHA+OB9lM28L
         Y6Qy/QPQC+9or8lw6IDs/g14t001jVWZu12b2c3b26pPjXZW4Ur89qR6WNNfn6XQcIFQ
         PJsw==
X-Gm-Message-State: AOAM533+yytxnPi1JIjOTQGsCde9AQjX6yvTW3D9HBC4ZKXYnncp+ZAO
        SZyurq7lbkBHo8z9zoUWH2nSz5dSLnWUTsW0zf2em+i8rRBGZA==
X-Google-Smtp-Source: ABdhPJyFQkUGkkbHOSf98MI865KywA0uptNBlz0dX73YfDo56jJQQh9YNqpvA9/QkNWIRb7ODsvfrTuQMFU2qVrqaAw=
X-Received: by 2002:a25:b8c:: with SMTP id 134mr31000550ybl.332.1623746438005;
 Tue, 15 Jun 2021 01:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdgg_onUUGVkmAsXdBeYRDVVeT67q+zvYR1tKgh7kstwhpMhw@mail.gmail.com>
In-Reply-To: <CAMdgg_onUUGVkmAsXdBeYRDVVeT67q+zvYR1tKgh7kstwhpMhw@mail.gmail.com>
From:   =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
Date:   Tue, 15 Jun 2021 10:40:26 +0200
Message-ID: <CAMdgg_pNr7MZjA+v1kUfY69qYZCRMn-C-_MeHDwQNY3jHV7Fkg@mail.gmail.com>
Subject: Fwd: IdeaPad platform driver compatibility issues
To:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "ike.pan@canonical.com" <ike.pan@canonical.com>,
        "maxtram95@gmail.com" <maxtram95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,

I have a Lenovo Yoga 720-15ikb device and I have found following
issues with the IdeaPad ACPI driver:
- "fan_mode" does not work according to documentation, always returns
133 and can't be set to any other value from the documentation.
According to Maxim it worked on his old laptop, but Lenovo probably
changed it since.
- "camera_power" is always zero and can't be set to anything else.

Maxim asked me to provide a DSDT dump, so I did it:
link removed
I am willing to provide any additional information.

Best regards,
Kry=C5=A1tof =C4=8Cern=C3=BD


Sorry for the resend, I am trying to send again, because I got a reply
from MDS that my email contains a SPAM/virus.
