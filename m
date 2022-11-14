Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3014CC433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Nov 2022 14:13:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbiKNONk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Nov 2022 09:13:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236931AbiKNONi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Nov 2022 09:13:38 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184E8BCF
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Nov 2022 06:13:37 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id v1so18457930wrt.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Nov 2022 06:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2UHH7r8UFjTS3ZiZafPyZyy9VrSealpYk9TZbOOO5a4=;
        b=XhVX2dZMZktDbR4mPqe/rEoMNW73fTyGaKyrpPxJAabkrdYY2qLyey45rfHKP8IU0N
         PtSjKMU9OkhphMz/a7ipUOGvAMOBw3W4TwK2cU/FLwI1IguQmegAoYtOOGGcl29NfKVU
         vQeQweszFeWL3iHPcqRx6yvptBH7fI110aRrd9fqGwKZIxOe9KskEYH7OUFRUNXjQ973
         vwnjKu5R6/YjhcveFeAMcm3x90eWIQYmSMjdorL4073hnkkOn+X5MaHWZNBRqW+lV5xM
         py6s7+Cf1SUBFiatwYTTu+E0s1wnmBHCvlTnY7/qUC19JUuKozeq6uYc2bgwas9MsTyj
         LC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UHH7r8UFjTS3ZiZafPyZyy9VrSealpYk9TZbOOO5a4=;
        b=po5zh8D4P0dpuumwCI248ssdx+TPoFFRjSnPPLgF6L6Bittg9D/8Oq1l3OvcnZOdhO
         v+G+pbu7u/i7HOtj0BSlFM4JveTW4RBCLA/gbvs7LIo71N0PSMR78yZYNNP7f+asmqGu
         h0GoFzcQ7MUmMnFZ0W8/keHvI3gNamW070befPppQaxWNJrwjScuirI8JJgjufl04qOW
         56t7yfami7m/MXOPjYfrw8oiW0w+FGBQJa8NaItLKEmal6iDxLyIpca9KzSjMm3ylJP7
         g7pyuATivqOeog5XAOOUhCvgu70k2aMH+cJycabKij9L0xkdwyrJyKaSgSKi0Hr5KOhx
         6UBg==
X-Gm-Message-State: ANoB5pmzW5QHNKnAyX57/zUpwdRpuVv72NWPdrbep0J4qJW2HqUYGnPp
        np4Z6Ou9Fe3Q33l4HAzc40oZfhgfwuQENSpzs+ohTTnA
X-Google-Smtp-Source: AA0mqf5DAe6AkOTqRJZl0dKXzu5ihrZmjo9DT82XyZIGw4IY90S7J5XvbFB7WeFMKkxPRY8L5xxJ7wiVAAb8G6eP2ac=
X-Received: by 2002:a5d:5481:0:b0:235:a4a5:8e91 with SMTP id
 h1-20020a5d5481000000b00235a4a58e91mr7893996wrv.404.1668435215530; Mon, 14
 Nov 2022 06:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20221020201033.12790-1-jorge.lopez2@hp.com> <20221020201033.12790-3-jorge.lopez2@hp.com>
 <dd8b494c-114c-e27e-4dcd-08dcb8b31d9d@redhat.com> <CAOOmCE9YT3VxEbuMMX3MCvxEinHugvvYkGHgrnRN1fHVSy7cWw@mail.gmail.com>
 <38afe79b-0c23-cfbb-30a8-71ce9fcd794b@redhat.com>
In-Reply-To: <38afe79b-0c23-cfbb-30a8-71ce9fcd794b@redhat.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Mon, 14 Nov 2022 08:13:24 -0600
Message-ID: <CAOOmCE-bUW_kxTHr+v2GBwKf77RqTV-UrRv+PL==+PkvZkHFNg@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] Introduction of HP-BIOSCFG driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Nov 12, 2022 at 2:30 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/12/22 00:00, Jorge Lopez wrote:
> > Hi Hans,
> >
> > A quick note to check the next step.   The changes requested for
> > enum-attributes,c and several supporting functions will impact other
> > source files.  To save reviewing time,  I am planning to introduce the
> > same changes across all source files and then proceed to submit the
> > review.   Is this option acceptable?.
>
> Yes applying the same changes to all the source files is
> the *intention*. This is why I stopped reviewing after
> reviewing the first set of files.
>

That was understanding but I wanted to make sure.
Thanks for the confirmation.

> Regards,
>
> Hans
>
>
