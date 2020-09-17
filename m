Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F83C43461
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:11:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E9E92072E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:11:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="VNobLq2X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgIQNLp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 09:11:45 -0400
Received: from mail-41103.protonmail.ch ([185.70.41.103]:28462 "EHLO
        mail-41103.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726919AbgIQNLi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 09:11:38 -0400
X-Greylist: delayed 502 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 09:11:38 EDT
Received: from mail-03.mail-europe.com (mail-03.mail-europe.com [91.134.188.129])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41103.protonmail.ch (Postfix) with ESMTPS id 1F2C12002423
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 13:02:54 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
        dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="VNobLq2X"
Date:   Thu, 17 Sep 2020 13:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1600347764;
        bh=KCLamIxOJ0a1uj7ObJfMxWA6QXZ/fyTrm4xLLJCPrXQ=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=VNobLq2XRU7VyuXdf3pxIANVFCbfWRdyFxE1FZZ5hcyODkUTARs44MYp7cSzJUjS8
         nzR5v1NyCbXs2I4Q6hzBNelaK6zFyLMNxXxwwcygyjBTrjOpkJkAfx1RhRrT4TZEUq
         mNjoARzCHIGp9d+WhKLRfJbVpPD9lsLl8EOT43zY=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Benjamin Berg <bberg@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Jared Dominguez <jaredz@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: RFC: offering a standardized (/sys/class) userspace API for selecting system/laptop performance-profiles
Message-ID: <jQoirRukXGYClb58QQWmL6rQ6usxi_hKzPRYe2tlEyjXG-hEVxwzECgEXFxzyMRG2sEnxwdKNvmWzEV4oZcaJ4MM5RrgFtBdin8yxH4cAYs=@protonmail.com>
In-Reply-To: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2020. szeptember 17., cs=C3=BCt=C3=B6rt=C3=B6k 13:22 keltez=C3=A9ssel, Hans=
 de Goede =C3=ADrta:

> [...]
> I guess we should also add an optional lap_mode sysfs attribute
> to the class-device, to have all the info for the Thinkpads in
> one place.
> [...]


Excuse my ignorance, but why does "lap_mode" need to be here?
I understand the implications of it regarding performance, but
I think it would be more sense to export it via the hwmon (or
something similar) subsystem? What am I missing?


Thanks,
Barnab=C3=A1s P=C5=91cze
