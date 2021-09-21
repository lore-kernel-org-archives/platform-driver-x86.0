Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CECC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 14:02:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1347761159
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 14:02:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233320AbhIUODk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Sep 2021 10:03:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:51086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232981AbhIUODk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Sep 2021 10:03:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDCF060F9D;
        Tue, 21 Sep 2021 14:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632232932;
        bh=yiUJdUUcg7i1WGoEgF4g/CfaPAGHN8AXmNkjoYeBXMs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fQmeR2El0/xHd7DVfOesgHVsM9SEuplX2QDvdv/OROFL+CTcfi3wp6h+1pC3+Kb68
         S09wJjANGs4eIJ9sqC4nwX6TA2CsZP8fy49+j2TVY/v9xT+Y8Fa0PoSXXFIEkSkycM
         +c3sK3OLfsbmO1EUb6I/6pCLKlVoqCAlag6sS8gs0nP0myuHYPli3UcOFxYbKzPSDK
         0ggTm4YRWzkohJqyyjUxBvBWrYhxBDizq0o0HLSLh5Ab+396bqblTdrs1T9eIYn8F9
         HxFML0Jg0jaJm5LpemPHTJjnL6yzqMgWE1/NJxMfXxp6D4PLc/wQyT7AkKnu0PJpxD
         pWvWK/BqYQC7g==
Received: by pali.im (Postfix)
        id C3B647DD; Tue, 21 Sep 2021 16:02:09 +0200 (CEST)
Date:   Tue, 21 Sep 2021 16:02:09 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Dadap <ddadap@nvidia.com>,
        platform-driver-x86@vger.kernel.org, mario.limonciello@outlook.com,
        pobrn@protonmail.com, andy.shevchenko@gmail.com,
        aplattner@nvidia.com,
        Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v6] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
Message-ID: <20210921140209.qtepebqoieitrold@pali>
References: <e63904b7-105b-4401-bd40-82854b7d42d1@t-8ch.de>
 <20210903003838.15797-1-ddadap@nvidia.com>
 <11ffe8bc-b4ee-c451-9860-46997de8fe55@redhat.com>
 <20210920132911.cus27elz36dme63g@pali>
 <8b07125d-83b9-9de4-fd52-1cb01466364a@redhat.com>
 <20210920135106.y6mi57bcmurczmka@pali>
 <57a958e2-93d7-3eea-ec7b-9496acd6aae5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57a958e2-93d7-3eea-ec7b-9496acd6aae5@redhat.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tuesday 21 September 2021 15:53:29 Hans de Goede wrote:
> Hi,
> 
> On 9/20/21 3:51 PM, Pali Rohár wrote:
> > It looks like that no vendor driver starts with "wmi-" prefix. "-wmi"
> > string is used as a suffix. So for consistency it would be better to
> > choose "nvidia-backlight-wmi.ko".
> 
> Right, I should have checked first.
> 
> So I just checked and the standard pattern used is:
> vendor_wmi_feature
> 
> So lets go with nvidia_wmi_backlight.ko

Just source code filenames use hyphen (-) not underscore (_).

> Daniel, can you prepare a patch on top of your merged patch to do
> the rename of the Kconfig entry and the module-name please?
> 
> Regards,
> 
> Hans
> 
