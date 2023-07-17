Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C65EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Jul 2023 11:24:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjGQLYE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Jul 2023 07:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjGQLYD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Jul 2023 07:24:03 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B614E4E;
        Mon, 17 Jul 2023 04:24:02 -0700 (PDT)
Date:   Mon, 17 Jul 2023 11:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1689593039; x=1689852239;
        bh=VisGer6pcwmKhIhRJUINjYI7Kih/EL7BPAocL+KcM+s=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=fgvP9bzdaHZScJHTz1babtwqmTkgM5nVhVbBss/+nV6qwYqhhQ4BiTgvblRhHttyt
         iUfm3efyWdPEpZbwZDYEKthJLfAGe1Yujaofc5UU7Bopcq89GZnYawjeDl3J86GJu8
         Dj42noCgN+Y12rLguXbapC/pTDTw+4mrxGlk7EYLPiZfzlTrWVdDxMVsUauYNmewrx
         +zwG1nRpSHo/+W6qc6d2/ZJNhAEFbz8bfC3ymlEOEH0zgyUg5LFkR9GlCBVBaFYgfR
         FEhJYvCIK8yiTA9f4fKMXwYjalWkJrbcZrsW2GGjW9O93VXkL9rtnV5uL8UOwgtwnd
         DFHQrFQs2iGqg==
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Armin Wolf <W_Armin@gmx.de>
Subject: Re: [RFC PATCH v1] platform/x86: wmi: Do not register driver with invalid GUID
Message-ID: <mL0s5ZsO3eU18EzO_7zVsawf2rr7o-zsOrwBDncazQIAgRn-LRNTGw2ugm1bfRoHKWTRYmUHt8s7zjfNEESapwFZlaNj6B041x_AZ-pagoI=@protonmail.com>
In-Reply-To: <ZLUOxnE58wUgZXWx@smile.fi.intel.com>
References: <20230715211604.1272227-1-pobrn@protonmail.com> <ZLUOxnE58wUgZXWx@smile.fi.intel.com>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2023. j=C3=BAlius 17., h=C3=A9tf=C5=91 11:49 keltez=C3=A9ssel, Andy Shevche=
nko <andriy.shevchenko@linux.intel.com> =C3=ADrta:

On Sat, Jul 15, 2023 at 09:24:16PM +0000, Barnab=C3=A1s P=C5=91cze wrote:
> > Since a WMI driver's ID table contains strings it is relatively
> > easy to make mistakes. At the moment, there is no feedback
> > if any of the specified GUIDs are invalid (since
> > 028e6e204ace1f080cfeacd72c50397eb8ae8883).
> >
> > So check if the GUIDs in the driver's ID table are valid,
> > print all invalid ones, and refuse to register the driver
> > if any of the GUIDs are invalid.
>=20
> Besides using wrong API (uuid_*() vs. guid_*() one), I don't

As far as I can see `guid_parse()` also uses `uuid_is_valid()`, the format =
is the same.


> think we need to validate it here. Why not in file2alias.c?
> [...]

1) that seems like a more complicated change (duplicating `uuid_is_valid()`=
?);
2) that will only check the GUIDs specified by `MODULE_DEVICE_TABLE()`.

Arguably the second point is not that significant since most users will ind=
eed
use `MODULE_DEVICE_TABLE()`. But I think the first point has some merit. An=
d
furthermore, I think this check should be here regardless of whether file2a=
lias.c
also contains an equivalent/similar check.


Regards,
Barnab=C3=A1s P=C5=91cze
