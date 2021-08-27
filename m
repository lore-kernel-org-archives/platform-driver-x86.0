Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58303C432BE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Aug 2021 03:19:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FDF060E99
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Aug 2021 03:19:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244110AbhH0DUh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 Aug 2021 23:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243896AbhH0DUh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Aug 2021 23:20:37 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E35EC061757
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2021 20:19:49 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id j2so3083891pll.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2021 20:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fgRr1n2bWwmrlGdoVERJOZuCIy6uB+l74pomUxYfsJU=;
        b=h5S2TIXKgWFLVaI2gkK5xK1CH+IAORW2mf82fQZkLkUgD3fdZi2JrUPJB4MXEhK+dO
         X5IkY9TB0rsupYN+qE5hUZdBNqi7ON1au0etojyeReRGpEfqr1nA2x1fNi+/BpH68Dof
         PGICX0Pju4KlOXj6EXmtpiSWjaFfPN72GPITc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fgRr1n2bWwmrlGdoVERJOZuCIy6uB+l74pomUxYfsJU=;
        b=XFEQIp4PPynywp8m8GD6wwOtl45jasaJaoP7PvRnw/pYN7lsVOw04glOSlEfi42wC4
         MdNGxA5RmJ6MJLs38hdOf72rs5Zb5/jIKsk6HwboM0xb9iApm9cNBu/1ZppTmJaBvLAQ
         Xm7YF6qgx8fvaiwbsQxdQoVkFpb7Jw96ZCRQ/CBvlU4mL49euL5BIJWKaQra0xt8Xm6J
         cG0JY5tMTeQkskdYJWquwvFH6hshBaP3g9LNEzottEjKOBtmVnbjeY+v8lSADDVyWA85
         uSjdA+NzA2jYgeNKjWUA/INONk2Orj2Iz6vairu2agq/taCxxqgun2viEcPcMy8dhf6H
         Zs0A==
X-Gm-Message-State: AOAM5308A5twe5wkZ4Ibw9TeOrTInXNjlEJlgLhFo3TUAk4eCTWNXYZk
        grfaBAo4N/1H0JV43hG3XQzW8w==
X-Google-Smtp-Source: ABdhPJzZzzT0FSpA4AHwwsM0/9b1hfhSBcyloo8xsNWIjNLiTJTZ/9AUpRF9qUjLU8P8Bt43sBGdog==
X-Received: by 2002:a17:90a:2e88:: with SMTP id r8mr20307820pjd.169.1630034388566;
        Thu, 26 Aug 2021 20:19:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h4sm3389144pjs.2.2021.08.26.20.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 20:19:48 -0700 (PDT)
Date:   Thu, 26 Aug 2021 20:19:47 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: dell-smbios-wmi: Add missing kfree in
 error-exit from run_smbios_call
Message-ID: <202108262019.F3C9681F91@keescook>
References: <20210826140822.71198-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826140822.71198-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Aug 26, 2021 at 04:08:22PM +0200, Hans de Goede wrote:
> As pointed out be Kees Cook if we return -EIO because the
> obj->type != ACPI_TYPE_BUFFER, then we must kfree the
> output buffer before the return.
> 
> Fixes: 1a258e670434 ("platform/x86: dell-smbios-wmi: Add new WMI dispatcher driver")
> Reported-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Excellent! Thanks for doing this. :)

-Kees

-- 
Kees Cook
