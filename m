Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E46C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Jun 2022 20:29:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbiFUU27 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Jun 2022 16:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbiFUU26 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Jun 2022 16:28:58 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7031145D
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jun 2022 13:28:56 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 82DBF21A83;
        Tue, 21 Jun 2022 20:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1655843335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IuzW1JewuqLmTuzHCiMtbFollz7qxFt/ZOTK0UZDSIw=;
        b=w/N9GWf0NDylY75hfFlayv+qeRstaKs8QIqFXr7ztEvEP4TE7NhmN2hqYRJHStx6r6Rs6V
        Y0JlnrjzmFeprbL0cqCM2wBeBPMSgsb6iqdjwFp8Rgs7+JgZeFWacjeF9QSGJG0HGv9Z5g
        /2J72GEFAT8DDsVyPXEYnCm6yA3YoOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1655843335;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IuzW1JewuqLmTuzHCiMtbFollz7qxFt/ZOTK0UZDSIw=;
        b=GWSplYK/G0nNOfxhxt0CuPoDHHHO7M1P+sE3qwsywvAGSdCeQzSFYfFFH1zNi6GTBg0jju
        bSNe7vRs7ctlaABg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4567113A88;
        Tue, 21 Jun 2022 20:28:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id pZcbDwcqsmKNcAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 21 Jun 2022 20:28:55 +0000
Date:   Tue, 21 Jun 2022 22:28:54 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix a memory leak of EFCH
 MMIO resource
Message-ID: <20220621222854.3f38369b@endymion.delvare>
In-Reply-To: <MN0PR12MB61010927D68C8BF95697BB92E2B39@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20220621155511.5b266395@endymion.delvare>
        <MN0PR12MB61010927D68C8BF95697BB92E2B39@MN0PR12MB6101.namprd12.prod.outlook.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 21 Jun 2022 17:54:59 +0000, Limonciello, Mario wrote:
> > Unlike release_mem_region(), a call to release_resource() does not
> > free the resource, so it has to be freed explicitly to avoid a memory
> > leak.
> 
> Thanks for finding and fixing this.

To be honest, credits should go to Yi Zhang at Red Hat. He reported the
bug in another driver, all I did was checking if other drivers might
suffer from the same issue.

> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks!

-- 
Jean Delvare
SUSE L3 Support
