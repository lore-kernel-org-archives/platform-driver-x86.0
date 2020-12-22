Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AC3C433E0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Dec 2020 22:22:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C83C323103
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Dec 2020 22:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgLVWWA convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Dec 2020 17:22:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:48946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbgLVWWA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Dec 2020 17:22:00 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C06AC22D57;
        Tue, 22 Dec 2020 22:21:18 +0000 (UTC)
Date:   Tue, 22 Dec 2020 17:21:17 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>,
        =?UTF-8?B?Qmxhxb4=?= Hrastnik <blaz@mxxn.io>,
        Dorian Stoll <dorian.stoll@tmsp.io>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 4/9] platform/surface: aggregator: Add trace points
Message-ID: <20201222172117.6272a880@gandalf.local.home>
In-Reply-To: <20201221183959.1186143-5-luzmaximilian@gmail.com>
References: <20201221183959.1186143-1-luzmaximilian@gmail.com>
        <20201221183959.1186143-5-luzmaximilian@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 21 Dec 2020 19:39:54 +0100
Maximilian Luz <luzmaximilian@gmail.com> wrote:

> Add trace points to the Surface Aggregator subsystem core. These trace
> points can be used to track packets, requests, and allocations. They are
> further intended for debugging and testing/validation, specifically in
> combination with the error injection capabilities introduced in the
> subsequent commit.
> 
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> 
> Changes in v1 (from RFC):
>  - add copyright line
>  - change SPDX identifier to GPL-2.0+ (was GPL-2.0-or-later)
>  - pack tracing structs
> 
> Changes in v2:
>  - add compiletime check on SSAM_PTR_UID_LEN
>  - fix ssam_trace_get_command_field_u8() macro
>  - use dedicated trace event class for timeout reaper
>  - use printk specifier for hex prefix instead of hard-coding it
>  - unify comment style
>  - run checkpatch --strict, fix warnings and style issues
> 
> 

From a tracing point of view:

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve
