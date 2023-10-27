Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684DDC27C47
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Oct 2023 23:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbjJ0Xtk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 27 Oct 2023 19:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjJ0Xtk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Oct 2023 19:49:40 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC3681B1
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Oct 2023 16:49:37 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9ba1eb73c27so412700566b.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Oct 2023 16:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1698450576; x=1699055376; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/6MVE0JwBSnmzOc2InO3D2kXgpWf8h6/Vrw0EUtdQhA=;
        b=e6ua2/eb1DFaKiqBF/qeNy1lKa1VRqbtw3+3/sOwRU6bCdcoTIsCmzbvL4oy17pxr5
         vPBZUGsPFg2ZzM9xCdNg4VzNc3+DCc1zHECJW4dzSM0tnq3JWdP43uzl52P29L8H+sg4
         Oos68IyszY6FmMyZ9vCqMY6d5Kmam+QB3FWvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698450576; x=1699055376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6MVE0JwBSnmzOc2InO3D2kXgpWf8h6/Vrw0EUtdQhA=;
        b=A4fp7BgBczP3kl4yf8I6Nmc+39c9yP12861JU8fo3ZNjOMw1b14wxJNE4II9ux4MVV
         MtXdscc776fpipy+eU14BU8+NcRV7t6/EHeyXfj4HgheDlYsCxAdzjtToJ4GvlGKOVx3
         tqtbDF9qasf9zYBuCvHI3zKNlmI7eQ3UiFWmj2ekR2FGEowI0/uoGfroEgB2ckcpyF2/
         lFp28wTSg9uOoX7KbQmitCIAuqbFzMHPPs/O6rgqQX80MAxXYYcGLDWQrrs1HNrWxkNL
         wUSqU32Gqdi2Loss5EXXkt87VnPACa2jw85dtm+CJvppWIqdkcl7DNLfaFt3ibidg9Ag
         qgkQ==
X-Gm-Message-State: AOJu0YwJYUTmxk+f3YGXfzNDZotzbSJ3W64gVQXSMP+NHrCSWjLuIwDL
        gqkBBO5NTbh0IHJO824XMJKG1URHIbuRYFXouy8MQB9m
X-Google-Smtp-Source: AGHT+IGeOFBW1cl1Q+8qxtBDx7hTKuSbokUpI78HlJbr5DMqnbqHTlB+0EAJnmwic4ndjtxyWDYQOw==
X-Received: by 2002:a17:907:360a:b0:9c7:dc4e:1a22 with SMTP id bk10-20020a170907360a00b009c7dc4e1a22mr3423662ejc.48.1698450576192;
        Fri, 27 Oct 2023 16:49:36 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id j21-20020a170906051500b009b2ca104988sm1868143eja.98.2023.10.27.16.49.35
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 16:49:35 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-53dfc28a2afso4074572a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Oct 2023 16:49:35 -0700 (PDT)
X-Received: by 2002:a50:d616:0:b0:53f:b758:22a3 with SMTP id
 x22-20020a50d616000000b0053fb75822a3mr3200840edi.3.1698450575132; Fri, 27 Oct
 2023 16:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <00ebd650-72c1-0901-27bc-ae18867ed4b4@redhat.com>
In-Reply-To: <00ebd650-72c1-0901-27bc-ae18867ed4b4@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 27 Oct 2023 13:49:16 -1000
X-Gmail-Original-Message-ID: <CAHk-=whDg86U2PdJ3bH7L3_fnUU0UK3Bx2Eo7zcdXH_X521z0w@mail.gmail.com>
Message-ID: <CAHk-=whDg86U2PdJ3bH7L3_fnUU0UK3Bx2Eo7zcdXH_X521z0w@mail.gmail.com>
Subject: Re: [GIT PULL] platform-drivers-x86 for 6.6-6
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        David Lazar <dlazar@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 27 Oct 2023 at 04:55, Hans de Goede <hdegoede@redhat.com> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.6-6

I'm not sure why this didn't get the pr-tracker-bot treatment.

So here's the manual version...

              Linus
