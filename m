Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C03C74A5B
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Mar 2023 17:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjCRRzR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 13:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjCRRzQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 13:55:16 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB10615C97
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 10:55:15 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-177b78067ffso9054655fac.7
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 10:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679162115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqa07OZtJW1+IiPQGkul7pvvnF19V5luzN0PoSgjTmg=;
        b=M3FfSFD0DDx6N/GpkBMvJoXI/o2vvVWEau3oRO3K2x2vfy0JAoNGh0SusCwkcsvO8O
         9drbQd9ogeXX95oERgq6covmexAVyDoUI4bLGewmteF8ZipSl0Rj+LER9hbqdtMeDMKN
         IqrQ1JxQXHNlswCS2niF+qix1kItZ8Ihn7kP0RxRoXNg3u+ftSiMEBGGGrF8lB3N/Zrt
         87eLNfNapOthmtloxtw/ssOJ0P+cR6K2y6XHucEvHfbpIm7ISuDqn99zDhE0URmRxiol
         l0tqea3fpbM6QwaINhzFfr0U5D8JqlLd1VRkFyFGsyBC1AcbshJvE8j9woIaacaLm0UO
         VuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679162115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqa07OZtJW1+IiPQGkul7pvvnF19V5luzN0PoSgjTmg=;
        b=nh+uOQs17ltEG1T+BKdG4aikLCkGjRQj9Jj34vy+7G249hlVFkYUMUIetbkFZhhyX2
         QH1NEwHK5d9Nr9gaFe9V8E5FtoIkPAhVZd4Z3HotLz7x/Hnfescd4enU3rzImREf6DTQ
         amQYfvmA2WH6fLlVLOhtGThF5WM+CR3xj6UjDzCJni39HSiaieEq7otXhbqnx6EjQ42Q
         x1VfPeSkVVoVyVJBsE+jpo1MLpJB4LbQHsdsEvYjiI+pFXKY8fMS2KxCqF/3sRiGWfBd
         T3GQl/CHNVZBbWO4XAb65IMkVKTjs16jWFY09jwezuyeiph/rCSeXsLkcZESYn0a9UXQ
         NaNw==
X-Gm-Message-State: AO0yUKXU9y/ZbfpqOWoKh0fcGvDyFxr6mVzHLvCyU0KOAKSaDA3gxv9M
        cewa40aYQmbCanqIjO8+87CUxiTnWpdU8hOuB01x2RTNCcc=
X-Google-Smtp-Source: AK7set/nayIXLDbRxxu6QYh5lHIsiOjI33INuaogI2zUABYT9IEnwl2lpvOpbtfjeTZJU7wtHZbQRKvOCsY3eh7xVJM=
X-Received: by 2002:a05:6870:1255:b0:177:cead:945c with SMTP id
 21-20020a056870125500b00177cead945cmr793128oao.6.1679162115132; Sat, 18 Mar
 2023 10:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221004214332.35934-1-soyer@irl.hu> <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com> <91a25bfc-080d-b0e4-46cd-159bbf1346e8@gmx.de>
 <CAG4kvq8GMcw_ytss+e3y9nsaOAk9+m+TSnSBwcqdhqEOUJg_dQ@mail.gmail.com>
 <6592fd8f-f5fa-6144-e8eb-a9e701246ad7@gmx.de> <d00fbe99-6c82-ddfc-4e12-3dcb01eda0a6@redhat.com>
 <9b51d06c-d7b4-3886-4476-1c37f9400c62@gmx.de> <CAG4kvq-P=t08+=sjTNcLLgFrvhiyrdjpNyxEhMcV5rDOt3EtZw@mail.gmail.com>
In-Reply-To: <CAG4kvq-P=t08+=sjTNcLLgFrvhiyrdjpNyxEhMcV5rDOt3EtZw@mail.gmail.com>
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
Date:   Sat, 18 Mar 2023 10:55:04 -0700
Message-ID: <CAG4kvq9h6tYg+Rarx+Y230ALiF5ZpCaaiLVnMrZKy+-hUhesBg@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, soyer@irl.hu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Mar 18, 2023 at 10:50=E2=80=AFAM Andrew Kallmeyer <kallmeyeras@gmai=
l.com> wrote:
>
> Hi Armin, would it work to add the second GUID to the existing
> wmi_driver wmi_device_id array? Then I could save the wmi_device in
> the driver data on probe. Later when I get the notification on the
> other GUID I would just call wmidev_evaluate_method on the saved
> pointer out of the private data.

Now that I have understood the multiple probe calls and went back to
read this, I realized that I would not be able to access the private
data of the notify device when handling the probe call for the query
device. Maybe you will have a good idea to solve this problem.

If not I do have this working with the deprecated call still.

- Andrew
