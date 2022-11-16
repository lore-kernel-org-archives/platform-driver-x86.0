Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCE4C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Nov 2022 18:55:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233528AbiKPSzW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Nov 2022 13:55:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239294AbiKPSzB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Nov 2022 13:55:01 -0500
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEEAC63CFB;
        Wed, 16 Nov 2022 10:53:52 -0800 (PST)
Received: from zn.tnic (p200300ea9733e74b329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e74b:329c:23ff:fea6:a903])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 927B01EC0138;
        Wed, 16 Nov 2022 19:53:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1668624831;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=MSdPW6OrtrtBqmP5DI/tn3YS/Mof56eQgXuX0RIR0II=;
        b=AXwVzczv8jCLT57tq15qcizFkAwpVgR727jL/HviHxFKq2d/qJ9n6TUrxsFAxFyL+V2Tlw
        cyD09oGY1/TEQda3C/1nJ675FwSATONGyWGFg2MgFecZJWR9TqbCVK+K88AYsD4DWif8Ed
        3080BBVVOSXzif9Y008DbeGWLQmmQyE=
Date:   Wed, 16 Nov 2022 19:53:48 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Tony Luck <tony.luck@intel.com>
Cc:     Jithu Joseph <jithu.joseph@intel.com>, hdegoede@redhat.com,
        markgross@kernel.org, tglx@linutronix.de, mingo@redhat.com,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        gregkh@linuxfoundation.org, ashok.raj@intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@lists.linux.dev, ravi.v.shankar@intel.com,
        thiago.macieira@intel.com, athenas.jimenez.gonzalez@intel.com,
        sohil.mehta@intel.com
Subject: Re: [PATCH v2 09/14] platform/x86/intel/ifs: Use generic microcode
 headers and functions
Message-ID: <Y3UxvAD+rKKQBsYs@zn.tnic>
References: <20221021203413.1220137-1-jithu.joseph@intel.com>
 <20221107225323.2733518-1-jithu.joseph@intel.com>
 <20221107225323.2733518-10-jithu.joseph@intel.com>
 <Y253FKtLnmV3r7Kj@zn.tnic>
 <Y3UdO8/oaEnlEk7s@agluck-desk3.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y3UdO8/oaEnlEk7s@agluck-desk3.sc.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Nov 16, 2022 at 09:26:19AM -0800, Tony Luck wrote:
> But seems a bit hacky.  Other ideas?

Yeah, that looks not too optimal.

How about you still allocate but at driver init time, ifs_init() or so?

And deallocate it at driver removal so that its always present during
the driver's lifetime and can be reused each time the sanity check is
called.

And you call ifs_load_firmware() under the ifs_sem so you already got
sync too.

Hmmm.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
