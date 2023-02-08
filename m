Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCA4C636D6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Feb 2023 20:09:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbjBHUJc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Feb 2023 15:09:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbjBHUJb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 15:09:31 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A46E38C
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Feb 2023 12:09:28 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id i1so8550205qvo.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Feb 2023 12:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lz3QINWgm6mfBDk54w9WAoqhqJfNik/G40SaVIHHsFs=;
        b=CwJQYTiwvvMo3DaukpRXj9+KwhRyzRUJXJIXKtOdfUcgluXrGpkujM4WOV0R+VHXpx
         ITKxj3JcdbbIwcLWKm15Fc6sI6a7GLMPTH6j3Y3yTXlBDxXLvp4zW+wJvlFjIFGuYcz/
         D4tPLyv+8ebj0JaDkS0O/5VJ9kjwsNr+vkfLsc+toGQxNNblkbFsSbK2hlK6RkLutl3X
         dfDDMyUrOA8f/Llt+qWhN+Xly2QOb+YIXoUXa3ZFEJRuVqULsWJZb/nAXSx6PgyDod6A
         fTVURk+boeEDYhRkNQdJrZmGPPQHGYUbZX+koRQHmuL3jMeqAvSLthXUu2T87NJGerV4
         KfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lz3QINWgm6mfBDk54w9WAoqhqJfNik/G40SaVIHHsFs=;
        b=Z0rt0xC2SgJKabQguEu2ir4CygYpEoagAp8VTDmPau2cjav9EAjj5ny/8t+p1QcJOP
         2+t/IDh2JnMmbv44RN4Baw0I4uhQPX7BkaUkpZM7tOkzgWM7HCBOefi0wO+TouVeHmTR
         Ofjvz65exJK2HevaW9UeHvOQDdKXPib/tCFkGjj3oINk3mYcRqA/mQxWQOn9bA4iMjUc
         Cs3eZVZ1jIZJL3UrA4ODUxtxcQ0J4PYCdEBtnoXX/HGUWolcx2cEer+z7Q0C16k0X86W
         IXbokl31lXHlmznNip8wMQa3ylijuONh5IllqvsSJN+EqWVb85K6yYkbTiBkToRf6p1t
         72pg==
X-Gm-Message-State: AO0yUKXXr8zLeplQMsLVQoVsqmT9DzehJTS963BGYK2KlOtVtbnPs1Sv
        U/5hNNFkQBCBlfQoY3oOp3KJabk3GP+y4YQt+Q6Ip4vB7CU=
X-Google-Smtp-Source: AK7set+Du7u2hHH9TpzrQykIVqxq0IM/SFeEDsaAYR7rbyvNogCgxhVEyQQb1Mgo4INBRUuhkca5mBbMNkvXdqgCs7g=
X-Received: by 2002:a0c:b701:0:b0:56b:e342:543c with SMTP id
 t1-20020a0cb701000000b0056be342543cmr651131qvd.44.1675886967204; Wed, 08 Feb
 2023 12:09:27 -0800 (PST)
MIME-Version: 1.0
References: <Y+JbBiMJw+VLo2Nr@mail.gmail.com> <CAD2FfiGLH87H6CVbHimXUfz7ESUKwO8k1ABCgKU9L2SnfGanTA@mail.gmail.com>
 <PH0PR84MB1953825BC90B268904C6C7E5A8D89@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <PH0PR84MB1953825BC90B268904C6C7E5A8D89@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
From:   Richard Hughes <hughsient@gmail.com>
Date:   Wed, 8 Feb 2023 20:09:16 +0000
Message-ID: <CAD2FfiFUEMupUBoWj2hq9ep=R0Sk-xgBscXqMPefAipvoCg8eg@mail.gmail.com>
Subject: Re: Firmware upgrade broke SW_TABLET_MODE on HP Dragonfly G2
To:     "Lopez, Jorge A (Security)" <jorge.lopez2@hp.com>
Cc:     Maxim Mikityanskiy <maxtram95@gmail.com>,
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

On Wed, 8 Feb 2023 at 19:27, Lopez, Jorge A (Security)
<jorge.lopez2@hp.com> wrote:
> Please do ahead and demote the firmware for me.

Okay, now I'm double confused; the only HP Elite Dragonfly G2 firmware
on the LVFS has never been in any stable branch. Maxim -- are you sure
you got the firmware from the LVFS (and not automatically through
Windows Update) and if so can you please send me the output of
"fwupdmgr get-devices" off-list please.

Richard.
