Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36119C6FA8E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Mar 2023 12:46:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjCBMqR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Mar 2023 07:46:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjCBMqQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2023 07:46:16 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9911F231FC
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 04:46:10 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id f23so22205274vsa.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Mar 2023 04:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677761169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bb/x7gGFu5180SHUQWA5uDTsXkGmrisO58awgoUrIIk=;
        b=EwnRf4ONGcrERJFbF81h2psgsLdiWI89hJlH/MZ/mXNyejjLVbd2VVaK39Xu3uzNd8
         hHMDX/AVfjW27KvD9VBG0vi2lYWYlAmU0/G/yuCAVSBy99VGdv+EQ1f9GkvqEaqe1GI4
         SJSHp+/qTsFJQ37bflS15GMR+ulWGrY7pcwP6kB4gBcJ65HupNgiGqHVnbZGdpvBr5Hb
         v+WNOUsmSiKca+fOQi3APV8EEmC/5WveaTfFCmOf04ufRYRnGJUcNtmelRjQVQCHavIg
         lXYMs1TfX6C+XIlsKUo3JQd2IilgQPbemHyKooKs9vW7XXoPb9rLsx7G3PHRR+ru8pBb
         68vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677761169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bb/x7gGFu5180SHUQWA5uDTsXkGmrisO58awgoUrIIk=;
        b=30pdaLxOt9g2PUftPpG1ouXibH/OG0h8CSE3CeCJxk61Si60KxRUpFu6dIv/6F1NRW
         a0uDB2p7YSjlfZ9e07HbelYHZuA8ZBUt28L1m8VagjEL+knnDhWmXD9ATiMpn1Gf8FeB
         YkpTVLtFVpUFjJ2sD6RA0Z4l7WtXKg4n6+M6BdtXzivYCvxTamXc6cqz1gb0A7Elm1rw
         yMIJ9J0gkrT7EEpcVvl0y3qy2sAYcyra8ewBdPv9xiGck/7sTodLPcKvNzwUn+wG+g1V
         e4nVkgy+3aE8tvjxcvWVP54YW1TTldfbMIr7mkEpc/Dfjq2eehW1Q/AccvYxbZHru8v7
         wVCA==
X-Gm-Message-State: AO0yUKUUsJIVNgLApZ4GDYqZkh/82MZZQX0Q2Z0s4bLf6tGQlvrbL6Jo
        gv9Jk8TVMrKtRa/BFb+p6hejf3KADaFH6eRlUfztN2JR/F0=
X-Google-Smtp-Source: AK7set/Lzy24u7t4O4W1yrIK/BJYXQdr3HG8JPxL9WjNC01eNZkv86YxXG5sHiImd13wSi4OOaTFVxt7ScB/wH2Zgg4=
X-Received: by 2002:a67:e8c3:0:b0:411:a740:c3ea with SMTP id
 y3-20020a67e8c3000000b00411a740c3eamr6749817vsn.0.1677761169450; Thu, 02 Mar
 2023 04:46:09 -0800 (PST)
MIME-Version: 1.0
References: <20230214132522.32631-1-teackot@gmail.com> <222e94e6-2ddb-a612-31b1-4537141ef478@redhat.com>
 <CAPXvF04_sPUtwB1Rk+XKPMigoxTfoo0RzbHvn9cozTq5vnMa_g@mail.gmail.com> <c147567a-40cc-813c-aa48-c24a1e92ff00@redhat.com>
In-Reply-To: <c147567a-40cc-813c-aa48-c24a1e92ff00@redhat.com>
From:   Nikita Kravets <teackot@gmail.com>
Date:   Thu, 2 Mar 2023 15:45:58 +0300
Message-ID: <CAPXvF05BWuP87KRZ92rZux2pqHxxJ7ux+ieK15HdoXpsG4Updg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: Add new msi-ec driver
To:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Here is my `modinfo msi-ec`:

name:           msi_ec
filename:       (builtin)
description:    MSI Embedded Controller
author:         Nikita Kravets <teackot@gmail.com>
author:         Aakash Singh <mail@singhaakash.dev>
author:         Jose Angel Pastrana <japp0005@red.ujaen.es>
license:        GPL
file:           drivers/platform/x86/msi-ec

> Did you maybe add it to a config file in /etc/modules-load.d/ ?

No, I don't have it there

Regards,

Nikita
