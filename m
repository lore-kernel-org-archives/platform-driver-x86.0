Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BFCC4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Aug 2021 12:31:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F57060E76
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Aug 2021 12:31:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhHQMbl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Aug 2021 08:31:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55710 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230354AbhHQMbj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Aug 2021 08:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629203465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=l9WuU7cYAYKJNJSQJYvnJwi7OnY5SKMEuReQStHmD5c=;
        b=g2cSRWpJNVeIT+hmrieNoOq9CZMqq63vhDA23/Z1mhYJlfCi0jnbnkJ1+5Bz35mVTRfk+x
        hxvyqlirIs56tqsAk1HIDedpt2/GPJdrzxSTZh+if2wUclCqiVNuTW3NIuHyWnoT1QMHcx
        9f326Wd2ztfjkhbYRor84s0lzp5KzPA=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-8ZE7PzFfNdu1wPRqGNd4lw-1; Tue, 17 Aug 2021 08:31:04 -0400
X-MC-Unique: 8ZE7PzFfNdu1wPRqGNd4lw-1
Received: by mail-lj1-f198.google.com with SMTP id u3-20020a2e9b030000b02901b787d7d260so7300662lji.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Aug 2021 05:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l9WuU7cYAYKJNJSQJYvnJwi7OnY5SKMEuReQStHmD5c=;
        b=gc9TjDgvkRG+j4JUu5FmjpKZFzQyJCPwUrG3KBo0U0SGlrXxJwtOMnt6XAM0lR/vDB
         L2TwvsAoTY94eYWlPFN5ZGTqfvI84rBvdOqlPSctLnNK1by5PDn2VpACUIEjzW0Q3dkg
         exwH6nHMTDrP+lOzR7oGEIqsBlHvnsPMsIVj1lrCwVrPQXGKUr4GzS1pb+CL+F73RaIk
         4gfJgkciTX5oIeXvptFvPXZgWW9W+CKjp3jmxhVveH1gadux6TTTnr4FZnZCM8RiVoMn
         kmU8LD+XksqeAoXZ1iRydxJInq/uSSJwNsYcLNxTJVW/dN/MZ0NtCoAkOdgXs49p5jJ6
         UF/w==
X-Gm-Message-State: AOAM533h16JKekulvJMNRltukkQbq4GdX2EgZ+I3I/dJyOHVajEg/6wR
        Fov6yw52PrK0TK3gFYDTuLmTz9iTPtDFPzW/q5+XtDJA4l47GrKm6XRzjJONd5IKAgtLddBED2x
        Kj5Wy7s62hROvPsOFX0fBX6lHFS2qMGESzbCQMAjho8vSJ2lXOg==
X-Received: by 2002:a05:6512:3f08:: with SMTP id y8mr2061041lfa.221.1629203462738;
        Tue, 17 Aug 2021 05:31:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybPSuwd/cHGg1jI+YCben7Tu95Hhn1Pf3wlgLk+sravd7yNqCyi9y75i+PPeb4osilTXEvMDNRNSkEayvjHTM=
X-Received: by 2002:a05:6512:3f08:: with SMTP id y8mr2061030lfa.221.1629203462497;
 Tue, 17 Aug 2021 05:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210816105119.704302-1-hpa@redhat.com> <20210816105119.704302-7-hpa@redhat.com>
 <YRt+Tnt4tvULM4MP@lahna>
In-Reply-To: <YRt+Tnt4tvULM4MP@lahna>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Tue, 17 Aug 2021 20:30:51 +0800
Message-ID: <CAEth8oH=kEb76CP578A7YnS3CN28aSDgUSjgNeGQgUnCTMXPWQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/20] platform/x86: intel_scu: Move to intel sub-directory
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Alex Hung <alex.hung@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        Sujith Thomas <sujith.thomas@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Zha Qipeng <qipeng.zha@intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Aug 17, 2021 at 5:16 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Mon, Aug 16, 2021 at 06:51:05PM +0800, Kate Hsuan wrote:
> > Move intel_scu to intel sub-directory to improve readability.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>

I'll add this to the commit message.
Thanks

-- 
BR,
Kate

