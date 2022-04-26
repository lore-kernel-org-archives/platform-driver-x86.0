Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C64C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Apr 2022 18:14:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350720AbiDZSRw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Apr 2022 14:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347588AbiDZSRv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Apr 2022 14:17:51 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C4E8165C
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Apr 2022 11:14:43 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-2eba37104a2so192007897b3.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Apr 2022 11:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kIkqOjkK9UaXZhvnTwpF6WfzsFWH6RDxZPgtgbCbHn8=;
        b=EE/CsQMAqt32syFUbTLRgEQoIh3UvnVW+urLE03c179KKq4js+ffQGY4alOT1TttEW
         3eEY3xe0S/B8R9ZTTIKF/w8REPdpLhxDC7uoT5iYctyZNn4SM67TTamgxMUnK7AexSov
         vjZn/4tntdO8jJfc+gbIkyh65Z6sh5XrwH9UCrLaA62BW3uJLNdS2FTdWSh65kQdCJmw
         YksGlQbALP9T+9XvSeIPKIvgRL4jU2OtIX81czlHLKSp8wlsBOtet38SaVU/GPZwp1hT
         0mHbVVxwrMF0w6hILfMzElAFaIuxPDlh1hKx1WaJXeeYqT5C24FmzW5SPIExmso3CQV3
         cOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kIkqOjkK9UaXZhvnTwpF6WfzsFWH6RDxZPgtgbCbHn8=;
        b=LfbETfUtxM48McOn9DV90K8LoIF6p+7VK2aVe/my+hRgHKDTuumdEMp/lOflTjxUyo
         ziMaAr5AOF1q9TzLlsl1xsT32X76oX7pZX1azJfRMwS+2KFSuPiwN75DHWzL+83iu6s5
         AEUFtiLME/aCjEshp5Ffz0xHwEW/km6vJ7EubUJLJWr18/jYkncAPt+IoAZJLx/8SXeS
         XFG7BZwnxA42o8/L3/DS6UFCLCb2JfK8KBGjvEMd6zfFVac6TWCttDvWVDMFWjg6RXBZ
         5mPswKMwvfgsOpYjfWSFE3EimFw3/AWxfZwHj2Hb/2HNnKVCmaZRBAQ3CbkjLv55KN3x
         Sv5g==
X-Gm-Message-State: AOAM531wL75hodd3Y2pPaPkTCidVN6pTuu7oAQSq/UsR+ExciY9iMKw3
        kJ3Run47YqwSk8vvsIQa28vflP2FN7N18q5e6JM=
X-Google-Smtp-Source: ABdhPJyyJ9h5cwa2WKxKjMOBqvzMCa39sjQzrEI/yYJ52JE7K6PA09GOmk+n+cqRFgcecpN8c82saLTSKThS5IqIDHU=
X-Received: by 2002:a81:4ec8:0:b0:2f7:ee4c:314 with SMTP id
 c191-20020a814ec8000000b002f7ee4c0314mr10624326ywb.405.1650996882421; Tue, 26
 Apr 2022 11:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220426120827.12363-1-gabriele.mzt@gmail.com> <20220426163336.hmook5gkgyba5dur@pali>
In-Reply-To: <20220426163336.hmook5gkgyba5dur@pali>
From:   Gabriele Mazzotta <gabriele.mzt@gmail.com>
Date:   Tue, 26 Apr 2022 20:14:31 +0200
Message-ID: <CABFtUbRv=5OaSgADOtXzRSRxAwSS-JaU=Ey5ehJ7YwAuVMJzDA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Add quirk entry for Latitude 7520
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc:     Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
        Matthew Garrett <mjg59@srcf.ucam.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 26 Apr 2022 at 18:33, Pali Roh=C3=A1r <pali@kernel.org> wrote:
>
> + Dell.Client.Kernel@dell.com : please look at this issue below
>
> On Tuesday 26 April 2022 14:08:27 gabriele.mzt@gmail.com wrote:
> > From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> >
> > The Latitude 7520 supports AC timeouts, but it has no KBD_LED_AC_TOKEN
> > and so changes to stop_timeout appear to have no effect if the laptop
> > is plugged in.
> >
> > Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> > ---
> > As per the discussion here https://github.com/dell/libsmbios/issues/48,
> > this is really a BIOS bug. My Latitude 7520 has the latest BIOS
> > update installed, which was released just few months ago, but the
> > issue is still there.
>
> In that ticket is written that issue was already fixed and discussion
> closed.
>
> If it is not truth then please open and report a new ticket on github.
>
> And ideally report also this issue directly to Dell BIOS team per
> https://github.com/dell/libsmbios/issues/48#issuecomment-391328501
> because as written that this is the right way for fixing the issue,
> rather than kernel patch.

Yes, I agree, I read the entire thread and it is the main reason why
I updated the BIOS as soon as I noticed the issue (I've just got this
laptop and I did not have the time to check everything yet).

Anyway, I think that that repository is not monitored actively.
I have also just noticed there is an open issue [1] about the same
issue on a different laptop, so this is potentially a rather
widespread issue.

I will see if I find some other way to contact Dell.

[1] - https://github.com/dell/libsmbios/issues/105
