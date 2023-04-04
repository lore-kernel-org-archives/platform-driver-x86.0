Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D86C761A6
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 Apr 2023 11:47:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbjDDLr1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 Apr 2023 07:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234790AbjDDLr1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2023 07:47:27 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4254C19A4
        for <platform-driver-x86@vger.kernel.org>; Tue,  4 Apr 2023 04:47:26 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id w4so30977607plg.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Apr 2023 04:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680608846;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2M72UoLWDdXOG1IhnTlcD7a5Ie7FIK9woNBp0RdriI=;
        b=TVQryvC35EKL8wdw7pgWm/lwei90spsx3nMGDaEBl9MKamPu5xIV9m2fNBAAj38GHx
         nGtKQQL4TfagXPBoEgBb3rsyK2cVUzyMFrjTq7FuakmS+c4P4EiLnaMy+YqbpekY0I15
         hpUMt2db1st876668eBPEV8wE7lpdq24RbHAxI/TccZVi0z9K1TGNK9Q9MZnCUxVGII0
         r1M1JKfG+aGHe3kS23iSvQQPs91mWeyKdTvKqGjhJefPVmdyYb9A++EXaW7YyyBtp9HT
         xWtEiGfubPU7I8UilRE93keqHHUafgZhDtAjLVCNYQ+jmtkzehlidxo5tjDJLI/blQUj
         ZfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680608846;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2M72UoLWDdXOG1IhnTlcD7a5Ie7FIK9woNBp0RdriI=;
        b=79CkrvkJxs1UuRVr8BSnDsfqdNpia8tvkXQU7Ur+YtSf7z0I2CtXbCecTCZDxizBDw
         iYSXFTU6ZZfzJ0aaHl91YRnkUwwXm8eDnEGZI3I0+djTf/CSqBHnq5laaT7iD3JiS2NZ
         efSkl/NpQEbp28/UDZ/tCXVAjk2WBkeok9rjXoFUWZmyCElYUxyeEakSncY7RM0Xz6qO
         m83cXZg1mWPMhPmszNtGuKVQHf85+Gdr2pOyiyFbyXleq6JT980mQ/BlY9Oo5XhkILm8
         eI/DwM2qeQvewL7aI4cW70P0Hsa0cIFwKNq5COR7AQq8tboKNyQXXUaLjuwmYJ95rq6a
         SBKg==
X-Gm-Message-State: AAQBX9da47K5j5v9KciM+FxdkymYgHVIqBtL64bN6CjVuiEuKy5s80v+
        j8TwwbVk1fESnDEo61MWH2w=
X-Google-Smtp-Source: AKy350btTE3Bo6XwFQtsczNqywwUaZxtL40NZpbLwAfQ1tIMX/Dhtibbm8QquicY3XFpxoxkpKyxBA==
X-Received: by 2002:a05:6a20:7f46:b0:d8:ea91:262a with SMTP id e6-20020a056a207f4600b000d8ea91262amr1701657pzk.9.1680608845645;
        Tue, 04 Apr 2023 04:47:25 -0700 (PDT)
Received: from smtpclient.apple (59-102-17-222.tpgi.com.au. [59.102.17.222])
        by smtp.gmail.com with ESMTPSA id k5-20020aa792c5000000b005d72e54a7e1sm8563806pfa.215.2023.04.04.04.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 04:47:25 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Orlando Chamberlain <orlandoch.dev@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] platform/x86: apple-gmux: Fix iomem_base __iomem annotation
Date:   Tue, 4 Apr 2023 21:47:12 +1000
Message-Id: <59222D5C-C810-4F17-AE0B-A65CA03889EF@gmail.com>
References: <20230404111955.43266-1-hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
In-Reply-To: <20230404111955.43266-1-hdegoede@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
X-Mailer: iPhone Mail (20D67)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks for fixing this up, Hans.

Reviewed-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
> On 4 Apr 2023, at 9:20 pm, Hans de Goede <hdegoede@redhat.com> wrote:
>=20
> =EF=BB=BFFix the __iomem annotation of the iomem_base pointers in the appl=
e-gmux
> code. The __iomem should go before the *.
>=20
> This fixes a bunch of sparse warnings like this one:
>=20
> drivers/platform/x86/apple-gmux.c:224:48: sparse:
> expected void const [noderef] __iomem *
> got unsigned char [usertype] *
>=20
> Fixes: 0c18184de990 ("platform/x86: apple-gmux: support MMIO gmux on T2 Ma=
cs")
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202304040401.IMxt7Ubi-lkp@inte=
l.com/
> Suggested-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> drivers/platform/x86/apple-gmux.c | 2 +-
> include/linux/apple-gmux.h        | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/appl=
e-gmux.c
> index 4c311e1dedad..e02b4aea4f1e 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -57,7 +57,7 @@
> struct apple_gmux_config;
>=20
> struct apple_gmux_data {
> -    u8 *__iomem iomem_base;
> +    u8 __iomem *iomem_base;
>    unsigned long iostart;
>    unsigned long iolen;
>    const struct apple_gmux_config *config;
> diff --git a/include/linux/apple-gmux.h b/include/linux/apple-gmux.h
> index a7a7d430024b..206d97ffda79 100644
> --- a/include/linux/apple-gmux.h
> +++ b/include/linux/apple-gmux.h
> @@ -66,7 +66,7 @@ static inline bool apple_gmux_is_indexed(unsigned long i=
ostart)
>=20
> static inline bool apple_gmux_is_mmio(unsigned long iostart)
> {
> -    u8 *__iomem iomem_base =3D ioremap(iostart, 16);
> +    u8 __iomem *iomem_base =3D ioremap(iostart, 16);
>    u8 val;
>=20
>    if (!iomem_base)
> --=20
> 2.39.1
>=20
