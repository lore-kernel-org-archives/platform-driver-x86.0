Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAECBC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 10:24:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9783F610CB
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 10:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242688AbhKIK1C (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Nov 2021 05:27:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:41838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239354AbhKIK1B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Nov 2021 05:27:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72711610CB;
        Tue,  9 Nov 2021 10:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1636453455;
        bh=60uPayEtjyZJw8AKZ51+m6bWW29iC4q20xUNOlTuWNc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1cjKdoVDhRjDbQLAHePL/JZSwXR8KpaRYufzt9KciC2y24Lg6eHJ9JyYOu1G+FJuV
         TIrTZs+Me1iIwM9EmcyHFmAV0kFmytc79t5BofC3O4HK7qyrpqf18qwpQby0TdXLtP
         49p9ySzsMAzGuL7DaSCFrglb4f54UZiS9scPr0Ag=
Date:   Tue, 9 Nov 2021 11:24:13 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Philipp Deppenwiese <philipp.deppenwiese@immu.ne>
Cc:     Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mauro.lima@eclypsium.com" <mauro.lima@eclypsium.com>,
        "hughsient@gmail.com" <hughsient@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH] firmware: export x86_64 platform flash bios region via
 sysfs
Message-ID: <YYpMTVP/dWsyxMSt@kroah.com>
References: <YYoSPjF3M05dR0PX@kroah.com>
 <E1CBFD23-AC3B-43BF-BF0A-158844486BA9@getmailspring.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1CBFD23-AC3B-43BF-BF0A-158844486BA9@getmailspring.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Nov 09, 2021 at 11:06:07AM +0100, Philipp Deppenwiese wrote:
> Hi Greg,

<snip>

Sorry, html email is rejected by the mailing lists.  Please fix your
email client to send text-only email and I will be glad to respond.

thanks,

greg k-h
