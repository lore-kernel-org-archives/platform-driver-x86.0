Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61898C7EE29
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Jun 2023 22:46:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236207AbjFBWqZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 2 Jun 2023 18:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236162AbjFBWqY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Jun 2023 18:46:24 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6F611AD;
        Fri,  2 Jun 2023 15:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=gBjthrWaINhZ8fog0wONMrxY2BBGP8pl9HrTCIzjXho=; b=eKyf+Is9qQICpv2aaHMMdnjklb
        fgoMoqeL1cJqFuEZSMYg/40SeCbPu9efGiQeGGjinZsNaMrOx4OWoGYssv4DzTSbDEZyvKqOaT7B/
        qfF/TTHgmfSmGfJxOnDZyvIbAlsfq4k13XGTvbW9gbQWbRKjjqKtzKk0iM08dtWTtB+pyeLwuqJSM
        ApsAlK1ELlc+qKWylZzqFCc4DKnk4VlVSgIOA7pgdb9jDceneufhZeOIaNySjmHPQkMBjCPn5ryw8
        41Zx38qCe2+OjNdXF+s74lSpY3X/wKwGt2oEqm5eOX6fTwwsvrc7aHeeYBrVNvvcOUn6Y7lG5AMoB
        dIeQVR1g==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1q5DXI-0085uk-2t;
        Fri, 02 Jun 2023 22:46:20 +0000
Message-ID: <83d86690-fdbe-66fb-221e-5443851330c7@infradead.org>
Date:   Fri, 2 Jun 2023 15:46:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v16 12/13] hp-bioscfg: Makefile
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>, hdegoede@redhat.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        thomas@t-8ch.de, ilpo.jarvinen@linux.intel.com
References: <20230602131044.3297-1-jorge.lopez2@hp.com>
 <20230602131044.3297-13-jorge.lopez2@hp.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230602131044.3297-13-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi again,

On 6/2/23 06:10, Jorge Lopez wrote:
> HP BIOS Configuration driver purpose is to provide a driver supporting
> the latest sysfs class firmware attributes framework allowing the user
> to change BIOS settings and security solutions on HP Inc.’s commercial
> notebooks.
> 
> Many features of HP Commercial notebooks can be managed using Windows
> Management Instrumentation (WMI). WMI is an implementation of Web-Based
> Enterprise Management (WBEM) that provides a standards-based interface
> for changing and monitoring system settings. HP BIOSCFG driver provides
> a native Linux solution and the exposed features facilitates the
> migration to Linux environments.
> 
> The Linux security features to be provided in hp-bioscfg driver enables
> managing the BIOS settings and security solutions via sysfs, a virtual
> filesystem that can be used by user-mode applications. The new
> documentation cover HP-specific firmware sysfs attributes such Secure
> Platform Management and Sure Start. Each section provides security
> feature description and identifies sysfs directories and files exposed
> by the driver.
> 
> Many HP Commercial notebooks include a feature called Secure Platform
> Management (SPM), which replaces older password-based BIOS settings
> management with public key cryptography. PC secure product management
> begins when a target system is provisioned with cryptographic keys
> that are used to ensure the integrity of communications between system
> management utilities and the BIOS.
> 
> HP Commercial notebooks have several BIOS settings that control its
> behaviour and capabilities, many of which are related to security.
> To prevent unauthorized changes to these settings, the system can
> be configured to use a cryptographic signature-based authorization
> string that the BIOS will use to verify authorization to modify the
> setting.
> 
> Linux Security components are under development and not published yet.
> The only linux component is the driver (hp bioscfg) at this time.
> Other published security components are under Windows.
> 

A commit message should tell what and why. E.g.:

Add Makefile and Kconfig to build hp-bioscfg.

It does not need all of that boilerplate info.
The cover letter is good for that.

The "why" part can and usually should include some background/history
info.

> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  drivers/platform/x86/hp/Kconfig             | 16 ++++++++++++++++
>  drivers/platform/x86/hp/Makefile            |  1 +
>  drivers/platform/x86/hp/hp-bioscfg/Makefile | 11 +++++++++++
>  3 files changed, 28 insertions(+)
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/Makefile

thanks.
-- 
~Randy
