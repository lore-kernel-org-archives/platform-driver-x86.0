Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C10C64E7C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 19:52:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E30622201
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 19:52:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731082AbgLBTwQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Dec 2020 14:52:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:35828 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728477AbgLBTwQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Dec 2020 14:52:16 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A3606AC65;
        Wed,  2 Dec 2020 19:51:34 +0000 (UTC)
Date:   Wed, 2 Dec 2020 20:51:31 +0100
From:   Borislav Petkov <bp@suse.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Justin Ernst <justin.ernst@hpe.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Steve Wahl <steve.wahl@hpe.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] x86/platform/uv: Fix an error code in uv_hubs_init()
Message-ID: <20201202195131.GD25881@zn.tnic>
References: <X8eoN/jMAJb3H3iv@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <X8eoN/jMAJb3H3iv@mwanda>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Dec 02, 2020 at 05:44:07PM +0300, Dan Carpenter wrote:
> Return -ENOMEM on allocation failure instead of returning success.

s/success/random stack memory contents/

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
