Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC082C433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 12:22:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9B5E64E42
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 12:22:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235943AbhBDMWV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 07:22:21 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:26408 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235940AbhBDMWV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 07:22:21 -0500
Date:   Thu, 04 Feb 2021 12:21:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612441298;
        bh=ONhOJ2vNzKhfS80Lh+2M1Wg/TEyhm3ejZbCyLPvGJHY=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=eXbhMDa4ixJ/skgQxUGMWaeT1DJlr3/BXiKo/9KqDz3be7oaXF/psWp1BD+Skvg3C
         AbxzmHVrboaRkjDzvFYKwjSew+kOKBJ1DvBTGF+Xwgq1NuqAH6m9cWPZSjxwje6nNh
         llVz24GbfM92czx01l8US8VREpsB84F8kLjkfVQE=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v3 12/29] platform/x86: ideapad-laptop: check return value of debugfs_create_dir() for errors
Message-ID: <Kog39xrpk9OIMkLGBlNe3Mf8KAoDROuMIZA9BX9O2QPzHo3ihHKJIIEip1jNoJ79tGmZRHhbWV4q2VaDqnwYqVzUJI1KDL3huO34ubJPB5o=@protonmail.com>
In-Reply-To: <acc8d35b-eea6-8fad-0d7a-ad9c189a51ad@redhat.com>
References: <20210203215403.290792-13-pobrn@protonmail.com> <acc8d35b-eea6-8fad-0d7a-ad9c189a51ad@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. febru=C3=A1r 4., cs=C3=BCt=C3=B6rt=C3=B6k 9:12 keltez=C3=A9ssel, Hans=
 de Goede =C3=ADrta:

> Hi Barnab=C3=A1s,
>
> On 2/3/21 10:55 PM, Barnab=C3=A1s P=C5=91cze wrote:
>
> > debugfs_create_dir() may return an ERR_PTR(),
> > add a check to ideapad_debugfs_init() that
> > handles the case when that occurs.
>
> debugfs functions should not be error-checked:
>
> 1.  They are for debugging so if they don't work it is not an issue
>     (note your own error handling also just returns without propagating
>     the error).
>
> 2.  Subsequent debugfs calls taking the ERR-PTR will detect this and
>     turn into no-op-s
> [...]

My idea was to prevent the ERR_PTR() from being passed to
debugfs_create_file() because I was not aware that it checked
for that, so thanks for catching it!


Regards,
Barnab=C3=A1s P=C5=91cze
