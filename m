Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D18C001DC
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Jul 2023 22:54:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232849AbjG0Wyp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Jul 2023 18:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233106AbjG0Wyo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Jul 2023 18:54:44 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72FE12113;
        Thu, 27 Jul 2023 15:54:43 -0700 (PDT)
Date:   Thu, 27 Jul 2023 22:54:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1690498478; x=1690757678;
        bh=ZM2MxAETSRwIlgrl0T63dARbFrBqIf2rAhBEukPah0I=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=k2v1NyplU7U9MVHuxmB62DgXjrMW1NPd1fEmnaTWcESSYOisZeOkoU/wJSvILBPXz
         ByEEa7zA9oxsrLgWXSYaumF1ZXSlfZm5+PPv5vfA4SofPD2fs9USIIAliVxcbzVNnB
         Kfzmeq//96bKyPBgjA1Ee/ODMUiF0f5Lc98NxesPmvRbK+WqGXE1H8ywaICcvB5ADm
         9E4x1/R24ONLa92DPR+YX7BHMc83YwxXx/bw0/2APDqvkRpAAR0Af086cQ9CciERYA
         S4yYnG9Kjz5PT4Y6oMAIdvKLe1LpPMZMqniVzN/2Mj1ukkN3bjOMFjK1buum0rfOFj
         URybea5NBh3Ag==
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Mark Gross <markgross@kernel.org>, Armin Wolf <W_Armin@gmx.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RFC PATCH v1] platform/x86: wmi: Do not register driver with invalid GUID
Message-ID: <pjVZC4te3dWaMwoS7jB1-n4z390Ohz0mvuCCUZHwiXlZVMjzwySf_DMa49RDmbhzfvkzRY3FI8zQ0xltNimu-GpBAqJ2Kc3SENu_fwJDJ7E=@protonmail.com>
In-Reply-To: <efe4b91f-2602-2115-738e-bb99b42ec5b6@redhat.com>
References: <20230715211604.1272227-1-pobrn@protonmail.com> <efe4b91f-2602-2115-738e-bb99b42ec5b6@redhat.com>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2023. j=C3=BAlius 26., szerda 10:45 keltez=C3=A9ssel, Hans de Goede <hdegoe=
de@redhat.com> =C3=ADrta:


> [...]
> On 7/15/23 23:24, Barnab=C3=A1s P=C5=91cze wrote:
> > Since a WMI driver's ID table contains strings it is relatively
> > easy to make mistakes. At the moment, there is no feedback
> > if any of the specified GUIDs are invalid (since
> > 028e6e204ace1f080cfeacd72c50397eb8ae8883).
> >
> > So check if the GUIDs in the driver's ID table are valid,
> > print all invalid ones, and refuse to register the driver
> > if any of the GUIDs are invalid.
> >
> > Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
>=20
> Thank you for working on this!
>=20
> About the do this here, vs do this in file2alias.c discussion,
> we have many old style WMI drivers which are not covered by
> the check you are adding for the new style WMI bus driver.
>=20
> So I think having a check in file2alias.c would be a very good
> thing to have. AFAICT that would also cause compile time
> failures rather then the run-time errors your current approach
> results in.
>=20
> I think that having an additional check like the one which you
> propose has some value too, even if it is just to cover drivers
> which for some reason don't use `MODULE_DEVICE_TABLE()`, but IMHO
> the most important check to have is a check in file2alias.c .

Okay... any tips on how to avoid copying `uuid_is_valid()`?

Another idea I had was that maybe `struct wmi_device_id::guid_string` needs=
 to be
changed to be `guid_t` and then `GUID_INIT()` or something similar could be=
 used
to initialize it. That way it is impossible to mess up the format. The only=
 downside
I can see is that guid is no longer "grep-able".


Regards,
Barnab=C3=A1s P=C5=91cze
