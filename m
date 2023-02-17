Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28005C05027
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Feb 2023 15:11:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbjBQPL0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Feb 2023 10:11:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbjBQPLY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 10:11:24 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F606FF39
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 07:11:22 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id m21so217934qka.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 07:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JWRXbFy0ow3PjrtOlLxniqlQ3ppH6/1NYTue+psjEB4=;
        b=f8aHfI9Bs609HlFdwNRvNEb+IyuEzEzqtFNn1dTfdL69XqWhJ2NrJiCgcmEFIVqg10
         RwgDCs2AxW6VWGj+2ikdxPDdtkvJ6QJd95Qtg6rOAkeUoeTEgZy4mKSATR0OQsjFrk6Q
         MmWows2bhGzxNAEjJ8cznjNFrrzCjxw9o1mZuYJRVUd/GahmEdjaloI3NgRIIWg0Svw+
         BrgCJtMEcSFFkK2fyspW+fQ5j11ycI/U8xqhKcuD+Ea4h3jxXzPWJ3SJC/aNF+23gMAP
         ylbrres0jGTsSmlvFV75sGcCu9q9kdA9vvAeISdqKDkrjsGys88zgjQbm1teR8SX2LhR
         6x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWRXbFy0ow3PjrtOlLxniqlQ3ppH6/1NYTue+psjEB4=;
        b=ZSnW6hQ9RPIk10fjq7IvTtYke81DYLF9Urb50TmrnoaAtcpbe7tCogxMlYk0Euf2fx
         6Tp+WE1ranXyB4h4TD4AILRZ9kXPnnLJQekGhUCwxw/e06BowEZnluib83Ys9CxSzXdc
         ur/Ku4xSvYpbtKDc2C3KojJ6TqMAiYXtkosbmmdVA3KfSm99Xm/FshAhEszPi2Btw5rw
         F05nghs9KbOjniHoUDEeMZobBuoKnqORm8zU/T3HVP097fSxvBf1HJt2aBQ8BBUlxqGb
         lj9oB61FGB0a2SmCZMhGa+p4ACOjluDhCUdl1If5Rcjy1mPeGkQ/1ZdcqyYbtcQsRoE1
         mMVg==
X-Gm-Message-State: AO0yUKUClMVFgLzSK9t66XmsfSyargADtTNWZjPWs16bWBbpvZmaPgPs
        /Xpf9nGOlrNhk70gS4xZfZL3bkUUZboHLH+U1ok=
X-Google-Smtp-Source: AK7set/w/7cUarYicvf9S/xOgCJtYRafJC+6X34wMBxSpQO0WflEglfvoNAywxwrvVDkNTr5qJyc8qyDjsdgqO8wSiM=
X-Received: by 2002:a37:b49:0:b0:71f:b917:f4e7 with SMTP id
 70-20020a370b49000000b0071fb917f4e7mr41057qkl.10.1676646681177; Fri, 17 Feb
 2023 07:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20230217150012.32094-1-hdegoede@redhat.com>
In-Reply-To: <20230217150012.32094-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Feb 2023 17:10:45 +0200
Message-ID: <CAHp75Vdou0d83E4C8Hr2aFyt+EeC-e+7szt0r+jn2nCsZNwQWQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Add Acer Iconia One 7
 B1-750 data
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Feb 17, 2023 at 5:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The Acer Iconia One 7 B1-750 is a x86 ACPI tablet which ships with Android
> x86 as factory OS. Its DSDT contains a bunch of I2C devices which are not

a factory

> actually there, causing various resource conflicts. Enumeration of these
> is skipped through the acpi_quirk_skip_i2c_client_enumeration().
>
> Add support for manually instantiating the I2C + other devices which are
> actually present on this tablet by adding the necessary device info to
> the x86-android-tablets module.

...
I'm not against this patch, but what I have noticed is...

> +                       .chip = "INT33FC:02",

...this. Can it actually be changed to HID + UID?

Yes, I know that above probably will in 99.999% cases work, but it's a
little bit fragile.

-- 
With Best Regards,
Andy Shevchenko
