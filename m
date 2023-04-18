Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B06CC77B78
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 Apr 2023 14:17:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232314AbjDRORz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 Apr 2023 10:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232299AbjDRORx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Apr 2023 10:17:53 -0400
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E279813C27
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Apr 2023 07:17:41 -0700 (PDT)
Date:   Tue, 18 Apr 2023 14:17:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danielbertalan.dev;
        s=protonmail; t=1681827453; x=1682086653;
        bh=jl9Bj+Xs32orrlW+/X56RqCP6ktocVz85aqPNgfgzF0=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=IAxEcJu23Xq7w5ZqjnsM2OLfJJjP2BU1o6int6puNj+7sWZ8CY9XnUFXN7s7Qf6ni
         tPd7G3cV2z/v9Wh6DKA0eB/XQ2pImUCKReE0jKRUCkTLlnS0qhQ8QMtdL4w/7lQrAN
         FdZu78UKCQBlnMg0EJp+kUFE+85genzIZnna3zTqhx0Q0tSNC+JiztrxkJZEgyzNj0
         cCkbhplmshpCghbFZqePBQzOIeQDxoj8Kl0kdLQ9ZVjIMjqrt4IPcp8/LRNU4xV2Wv
         HT/pebmZcaBv7lgXtLm6mRcSIUVC43ev3w2G+/bxrgIKWbIV0WUhdJf1+miVyxtRsF
         XSEaGp5SDEb8w==
To:     Hans de Goede <hdegoede@redhat.com>
From:   Daniel Bertalan <dani@danielbertalan.dev>
Cc:     Mark Pearson <mpearson-lenovo@squebb.ca>,
        Liav Albani <liavalb@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        "Mark Gross>" <markgross@kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        "Henrique de Moraes Holschuh>" <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH] platform/x86: thinkpad_acpi: Fix Embedded Controller access on X380 Yoga
Message-ID: <e08qhgamc_9XyV674oCl1j-MCOc2ouDajvpPh5FMylPEMUXuEH32U5v1XQ5VTKDcsAPjIDUmGWo9g771GUeqFvBPUG-Eyuih7_LusgFmtOA=@danielbertalan.dev>
In-Reply-To: <831fe8e5-2fe2-7188-227d-2a6932313eb1@redhat.com>
References: <20230414180034.63914-1-dani@danielbertalan.dev> <060c750b-f282-b1f4-2fcc-64fc3885f149@redhat.com> <a1229347-b5f3-8a1d-40a8-20beb863592a@gmail.com> <2739eb24-736f-6f59-70c5-d9975c354369@redhat.com> <c7LGto3wAWSkvfZaIEtB9_5EhTFe8ZdAOCKSZE8m8L18w0kJu2tms1RSdhrdUPBfHy5f-GMvxi_Etc5s8e7NOdF_xG4atmwco2QQ41bv9Sc=@danielbertalan.dev> <dd07686f-dd03-4efc-3dfe-5b568c6c854d@redhat.com> <TYZPR03MB59945171347BC248412EBEE6BD9D9@TYZPR03MB5994.apcprd03.prod.outlook.com> <ca210db5-2a2b-4962-8c28-e9b7d8cf6a59@app.fastmail.com> <831fe8e5-2fe2-7188-227d-2a6932313eb1@redhat.com>
Feedback-ID: 20340505:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark and Hans,

please see my reply inline.

On Tuesday, April 18th, 2023 at 15:23, Hans de Goede wrote:


> On 4/18/23 15:16, Mark Pearson wrote:
>
> >=20
> > Sorry for the slow reply on this one.
> >=20
> > I checked with the FW team and they confirmed on the x380 Yoga that the=
 implementation is unique and not using the ECRD/WCWR ACPI methods. They di=
dn't say why...but it's not expected to be something done again.

Thank you and the FW team for the quick reply! As a first time
kernel hacker, I find my experience top-notch :)

> > I had missed the question about fan control so didn't ask about that. I=
s there a reason you need to change the fans? It's generally not recommende=
d as it can violate temperature specs and leads to all sorts of issues.

My end goal is to hopefully get a bit more performance out of
my machine by making the fan kick in earlier using Thinkfan.

I have been doing a lot of compile-heavy development lately on
my X380 Yoga, and I noticed that the CPU will throttle down to
around 1.4 GHz at full load. This might just be normal for such
a small ultrabook, but I want to get the most out of it, as I'm
likely going to be stuck with this laptop for my first year of
CS studies.

Additionally, I remember the fans being louder at full load back
when I used Windows. With this patch, I can see that the highest
it gets is 4800 RPM. My memory might just be wrong though, and if so,
I apologize for wasting your time.

I have set "Adaptive Thermal Management" to "Maximize Performance"
in the BIOS, but I don't see a significant improvement.

> > I don't know if the fact this is a one off makes this a better candidat=
e as a quirk? To reduce the risk of breaking something on other platforms? =
But the code changes looked sensible to me.
> >
> > I'll aim to do some builds with it in and test it on a few platforms - =
but I'm travelling next week so this week (and almost certainly the week af=
ter) are a bit hectic.

Thank you again. In no way is this patch urgent, so feel free to
take your time.

>=20
>=20
> I just remembered that making thinkpad_acpi fan-control
> actually requires passing a module-parameter, because as
> said generally speaking leaving the fan on auto mode is best.
>=20
> I wonder if that parameter was set when testing on
> the X380 ? I guess it was set since the actual
> register was inspected and the changes were visible
> there, right ?

This is correct, I did set fan_control=3D1 for my testing.
Writes to /proc/acpi/ibm/fan are rejected otherwise.

>=20
> Regards,
>=20
> Hans

Regards,

Daniel
