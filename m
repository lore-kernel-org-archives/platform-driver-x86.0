Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB9DC6FD1C
	for <platform-driver-x86@archiver.kernel.org>; Sat, 11 Mar 2023 20:35:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjCKUfa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 11 Mar 2023 15:35:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjCKUf3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Mar 2023 15:35:29 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFDA01EFDF
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Mar 2023 12:35:28 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id f20so5822123uam.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Mar 2023 12:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678566928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PYVfKjv6zo+VJ34+kg/Uzz7kX5O0SKrczyVfKwBzgf8=;
        b=q2PfN3PU9ng7KojJ5441f2H+9qkL1PUuEgDdDM4qi0kcuW5BnStn7Kiz8Z3JQTg+TY
         R+1hmjYoy+4SfQpi49FQxZ9/kpSgzfliUPd+tRfrcVUMNLDYLeqjcPNIxDUQRG3NE3VI
         U5AUEPqmBz9TJEMBaCvlV/NpDpX9BTEHzzk1xCkLgalzbmbRi+UK6a15KWGCaMGsJx3o
         vNpPAaiQqR9JOaTMVEPvkkER+wRbaOpxat/+DnVldoQ91E/AzfoRrB6uMUfIAWPZqifG
         NPDwY6Y3/7Osghif0xKtrA49zCy4tSfDAvbQszBCZSZtRYbfgDmklHjOP/SGKCMvrRKA
         b6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678566928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYVfKjv6zo+VJ34+kg/Uzz7kX5O0SKrczyVfKwBzgf8=;
        b=BJhW0EZQ80CWStN8XhOynHqhaj3cAN18GKdanzmeytjANs/ANGN8z4zJmX6TXFmYCx
         f0cqfKQapBWmrBzYI243Cc/UOzfHQL3rHFdWusvHU+vN4ADc+qfj8Te66S1V034Xk9IF
         44U/BHkn01N9LRZ3674LI3d1pvYZpDspL1uxe69wjJWvO+Oln0/xocK1b23jJr2fcIAo
         rZN//1bmMcj0SXefxPKHFB1yKXbeMyb8cmDsGorjQONgQXWtz8MewGN9mBBZ0a4buH78
         sxGzeSSr3SG4PlKE0cGoqdr2rZYkeN+dYGGM2iskybtVyQLmj9qU05kzZtLYT4rBzaSK
         jL5A==
X-Gm-Message-State: AO0yUKXmum9SY7SX1dGeNkueTiOH/D67XGvL0AwqmwcoOFYk1wgYE/NP
        YupX4cRL6IbwYt+GpIO2K2V6wp/0ClQxnaDOh01IG0cHYt0=
X-Google-Smtp-Source: AK7set8g+2BtAEI935U6P0B4gSzO6UKmMMSmPvoqrmqgHiE148s+aDasB4khWYPwAiDkULnNu3+ArU52IL89h0X9QU0=
X-Received: by 2002:ab0:5402:0:b0:688:d612:2024 with SMTP id
 n2-20020ab05402000000b00688d6122024mr19143123uaa.2.1678566927735; Sat, 11 Mar
 2023 12:35:27 -0800 (PST)
MIME-Version: 1.0
References: <20230311144054.8754-1-teackot@gmail.com> <iPt1Reo37oGFvlRdQOY-3kZypWeV0pRah5oZ17K4xUOkeMqE7E43XQVyUX0A4a6oeEc1hPPzbjKcU3NznXUA3fnmp-foM3vuFSnA4YcFTDQ=@protonmail.com>
In-Reply-To: <iPt1Reo37oGFvlRdQOY-3kZypWeV0pRah5oZ17K4xUOkeMqE7E43XQVyUX0A4a6oeEc1hPPzbjKcU3NznXUA3fnmp-foM3vuFSnA4YcFTDQ=@protonmail.com>
From:   Nikita Kravets <teackot@gmail.com>
Date:   Sat, 11 Mar 2023 23:35:16 +0300
Message-ID: <CAPXvF05AurS89f6bNg_5-VCS=vX=qMXbKgSdv5-wwBb8J3Xdcw@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: Add new msi-ec driver
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Jose Angel Pastrana <japp0005@red.ujaen.es>,
        Aakash Singh <mail@singhaakash.dev>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

> The above two functions are inconsistent with the rest of the file because
> they have the return type in a separate line.

I believe it was originally made to not exceed the limit of 80 columns

> It's a small thing, but usually /* ... */ comments are preferred.
> Hans will tell you if you need to change it.

Okay

> Previously you said `match_string()` works here. Has something changed?

No, I implemented it in the main repo but forgot to do it in the kernel patch..
I'll do it in the v3 after we're finished reviewing v2

> Why not simply
>
>   conf = *CONFIGURATIONS[i];

Noted

Regards,
Nikita
