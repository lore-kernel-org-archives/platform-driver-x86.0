Return-Path: <SRS0=1Jx7=C6=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400EFC43463
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Sep 2020 08:25:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EB0820773
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Sep 2020 08:25:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="OK/pJIYu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgIUIZK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Sep 2020 04:25:10 -0400
Received: from mail-41104.protonmail.ch ([185.70.41.104]:62392 "EHLO
        mail-41104.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgIUIZK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Sep 2020 04:25:10 -0400
X-Greylist: delayed 356 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 04:25:09 EDT
Received: from mail-03.mail-europe.com (mail-03.mail-europe.com [91.134.188.129])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41104.protonmail.ch (Postfix) with ESMTPS id F21502002EEE
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2020 08:19:11 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
        dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="OK/pJIYu"
Date:   Mon, 21 Sep 2020 08:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1600676348;
        bh=uVyI41RUbUoXDnB7xStf3k4gfbKycqyuNuiWUI7O/+I=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=OK/pJIYuswrvh61FMIrMZpeNpUKH3Aio2tTGGH9RbSDWcTZkUeWOwdo55ql6ce6MA
         dlIYQT61sT/ls8RpAOsSrcfi3Qx63fJ89FWVr1FOBerh7Ev9UcgARwdvrZgtG0VTmF
         SFuZkSu8q5cpwted99oXjJCN3egUhpQ2QoIlJSy8=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alessandro Zarrilli <alessandro@zarrilli.net>,
        Mark Gross <mgross@linux.intel.com>,
        Matan Ziv-Av <matan@svgalib.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: LG laptop driver not working on recent models
Message-ID: <GxGF1TZmiB_rQkmbSArqPGuGoD-nIHGe2pZpUHOuerXgAYR187jtfHMIx0X5cXufT542KGk-ZGZPdWjBuku5sw3k0IhTxkXjpjQK628VO2Q=@protonmail.com>
In-Reply-To: <78578539-19c2-8915-91f8-8a82bafb5135@redhat.com>
References: <CAJubAmEg_uXsWRqHXA2_L8i2AVU_ZLH19txYqgVpP5s+AwNzfA@mail.gmail.com> <CAHp75VdKkZ0Ra3FMvbfq2hJH7_KZ5S_XLCxmrgFOAMiGDe6AKQ@mail.gmail.com> <78578539-19c2-8915-91f8-8a82bafb5135@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi

> [...]
>
> Assuming I have got this right, then now a days we have
> a standard power_supply class sysfs attribute for this,
> charge_start_threshold .
>
> Or maybe I got it wrong and the battery_care_limit means
> never charge above that value? Then the new standard
> power_supply class sysfs attribute would be
> charge_stop_threshold.
> [...]

A small note, as per Documentation/ABI/testing/sysfs-class-power, the attri=
butes
are charge_control_{start,end}_threshold. The charge_{start,stop}_threshold
attributes have only ever been used in the thinkpad_acpi driver (as far as =
I know).
And it has been extended not so long ago to use the "new" attributes.


> [...]
> See thinkpad_acpi for an example how to do this.
> [...]

In addition, the asus-wmi and huawei-wmi drivers could also serve as exampl=
es.


> [...]


Regards,
Barnab=C3=A1s P=C5=91cze
