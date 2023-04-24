Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8DAC77B61
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Apr 2023 10:37:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbjDXKhi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Apr 2023 06:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbjDXKhZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Apr 2023 06:37:25 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8980DB7
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Apr 2023 03:37:24 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-5fde85b7aacso6133996d6.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Apr 2023 03:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682332643; x=1684924643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lF1zDNkg3azAPi6XMzGz1lCZt0nAAT7jKq9HM2lTkEg=;
        b=etPIWUoML0++tdnCiHQZ2zJAmqxacMyezagzH/FVdB/0/ds92q2jnbeUn46SJDOEXt
         EdVRBVsQIsY6NoL5Htu5qOcmV2eiKn5IstzLtvgJGkONcg05goj7eB/ZObp7WxX0B5TU
         cQuRYcC0XQAha0xUErgwZ2fJuDEotqJrXF89QlwpeM8vknkttxxASE7nMAxEDj/fpOS4
         reVMI736aV/Bthh83Hcua6NjL0rWrYJBs3zmWbERmz3jxKhAw+0CmUe/qNFQRVcEywms
         XEnlKWryDfFOsrdYUUmXBdURLZ7PJUEv/2RbCY7irYGh5DL4gXDnYi2i1buw9hLXI1wY
         soIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682332643; x=1684924643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lF1zDNkg3azAPi6XMzGz1lCZt0nAAT7jKq9HM2lTkEg=;
        b=Z2STBF77E9gBBDH73ZDKUxVTmalnnuXRJ/VXYg4FIXQ/2W5YP+GubvM+yXHOMyGyvD
         Dhme2X+SSPJGi73yYWtiQ7IyZvIZYpJbtppL4SoegpHieLH+TnsW6fFtpKNl04W0PU6/
         PasJhzb4Ilcm0bjPPclEiMQwc/5v424eMQYsyWypYH4w3v/Y/ARqDH3UQBGKvVJXkNw9
         i/mDdpP8D4nM7ynMdDmDBb4ttQjtnVP9uwumaxFyq8pMLJsFPe6YT0erqVKY94mI39I2
         JEvb+fwM5YMgKhERnigQ27ECBaNGz1sk6j/T/A6wdmtgrde62eiUoB4ngVJ9Ooi4WnJu
         Ap4Q==
X-Gm-Message-State: AAQBX9crvdlSIXJfAtioQgP38AmTwkUOFtmJwP2GTUbeqUAsreOmxlgH
        LJi3XDCzklEHClOIUJKlrCcuT36LwZOlsOaReA8=
X-Google-Smtp-Source: AKy350bsUTq/NTLnU4dZNxJaloFtmJqRBfGNWkrJrS1rjjdBM3ffn2vZibVhwfK9nF05vKV5/f8We3vq0nwDAEiPAXo=
X-Received: by 2002:a05:6214:529e:b0:5df:55b5:b1a with SMTP id
 kj30-20020a056214529e00b005df55b50b1amr19431001qvb.4.1682332643559; Mon, 24
 Apr 2023 03:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <Y+JbBiMJw+VLo2Nr@mail.gmail.com> <CAD2FfiGLH87H6CVbHimXUfz7ESUKwO8k1ABCgKU9L2SnfGanTA@mail.gmail.com>
 <PH0PR84MB1953825BC90B268904C6C7E5A8D89@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
 <CAD2FfiFUEMupUBoWj2hq9ep=R0Sk-xgBscXqMPefAipvoCg8eg@mail.gmail.com> <Y+QXXXX1u33Eyf4E@mail.gmail.com>
In-Reply-To: <Y+QXXXX1u33Eyf4E@mail.gmail.com>
From:   Richard Hughes <hughsient@gmail.com>
Date:   Mon, 24 Apr 2023 11:37:12 +0100
Message-ID: <CAD2FfiEj87WiByKMXrLP7zrj-_gNrNKTh6v6naCxapbVBDcEGw@mail.gmail.com>
Subject: Re: Firmware upgrade broke SW_TABLET_MODE on HP Dragonfly G2
To:     Maxim Mikityanskiy <maxtram95@gmail.com>
Cc:     "Lopez, Jorge A (Security)" <jorge.lopez2@hp.com>,
        Alex Hung <alexhung@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        Enver Balalic <balalic.enver@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 8 Feb 2023 at 21:43, Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
> > Okay, now I'm double confused; the only HP Elite Dragonfly G2 firmware
> > on the LVFS has never been in any stable branch.

Ahh, I didn't expect T90 as the firmware name; found it.

I emailed the BIOS team some time ago and asked them for a response
but got nothing back. Sorry this happened to you -- vendors are under
strict instructions never to break things like this for a security
update.

Jorge, can you communicate this more clearly internally please and let
me know what to do about the LVFS updates please.

Richard
