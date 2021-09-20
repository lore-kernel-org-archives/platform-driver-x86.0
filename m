Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90894C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Sep 2021 19:54:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70DEC61222
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Sep 2021 19:54:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345231AbhITT4E (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Sep 2021 15:56:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:58986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349591AbhITTyE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Sep 2021 15:54:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F36BE60EB4;
        Mon, 20 Sep 2021 19:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632167557;
        bh=bOcXeYBsVD7AfSUsKn6xq4dWHTmnNmTA5J5GXL8xd1M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F/hjh9VIsTKhLjNDIu7gxikPDIv72VJC/BWbU4PpO23pT41jCaXm2h+EbI2glg2uw
         t1QH57Plwe6g63Bvl9JNoLNyAHPHz6MTxBU8Ci03yKM4wq4d66UCKsGh5/E9TsWq7b
         xEGUaL4hbQuxwFRsUb7z4Yq55igEnkRbuhBXII9EFPHRio+dqxePANYBzi4rJEGr+/
         ByT6duaJsTQbyx06rr3T3uXN2JU9TbRByJnFJgkrW+Vhd4Hgru2FcuVyT4E7L8DG+K
         QIMPYHRdNTE6hwuk/SjeydlAjczjSRj4xxQ3gZhj0d46SFnjgE0T6/LGgoghXqLCoT
         6RXSj+KkArPxQ==
Received: by pali.im (Postfix)
        id AC444855; Mon, 20 Sep 2021 21:52:34 +0200 (CEST)
Date:   Mon, 20 Sep 2021 21:52:34 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Daniel Dadap <ddadap@nvidia.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, mario.limonciello@outlook.com,
        pobrn@protonmail.com, andy.shevchenko@gmail.com,
        aplattner@nvidia.com,
        Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v6] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
Message-ID: <20210920195234.2yzbznmuuuocaxyu@pali>
References: <e63904b7-105b-4401-bd40-82854b7d42d1@t-8ch.de>
 <20210903003838.15797-1-ddadap@nvidia.com>
 <11ffe8bc-b4ee-c451-9860-46997de8fe55@redhat.com>
 <20210920132911.cus27elz36dme63g@pali>
 <8b07125d-83b9-9de4-fd52-1cb01466364a@redhat.com>
 <20210920135106.y6mi57bcmurczmka@pali>
 <1aa8fdc7-9e7a-5e86-0045-f07ad5bf118e@nvidia.com>
 <20210920175526.5itrqbif65iievxb@pali>
 <26399d71-38ba-18f2-1d7e-a455d727dd58@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26399d71-38ba-18f2-1d7e-a455d727dd58@nvidia.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Monday 20 September 2021 14:38:14 Daniel Dadap wrote:
> On 9/20/21 12:55 PM, Pali Rohár wrote:
> > Just one check, has bmf2mof showed some warning on stderr? I see
> > "instance" in class definition and bmf2mof does not support decompiling
> > MOF instances yet, it shows warning.
> 
> 
> None of bmf2mof, bmfdec, nor bmfparse print anything to stderr, and all exit
> with status 0 when I feed them the BMF data from this system. I am using
> bmfdec from your GitHub repository at 7f47b073... which is the current
> commit at the top of the master branch. I have attached the raw bmof dump in
> case it is of any use to you. This is from a commercially available system,
> so I don't believe there ought to be anything sensitive in there, as anybody
> who purchases the same system should be able to retrieve the same data.

Ok, seems that there is really nothing more. I run also just
decompression phase './bmfdec < /tmp/bmof | strings -el' to check.

That raw bmof binary should contain only compiled MOF code which has
corresponding 1:1 text variant, just my bmf2mof does not support
decompiling of all features and properties, specially instances yet.
There should not be anything secret. On windows system with right tool
(some WMI o WBEM browser) you should be able to view it. And moreover
access to it is available directly from userspace and no (nt kernel)
driver is required. So if vendor put there something sensitive it
already has some big problem and new vector for malware...
