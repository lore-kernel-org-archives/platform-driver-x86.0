From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 04+/11] platform/x86: fujitsu-laptop: simplify
 set_lcd_level()
Date: Tue, 4 Apr 2017 08:44:45 -0700
Message-ID: <20170404154445.GB5936@fury>
References: <20170404000102.GD17322@fury>
 <20170404093903.15675-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:40357 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754292AbdDDPos (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2017 11:44:48 -0400
Content-Disposition: inline
In-Reply-To: <20170404093903.15675-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 04, 2017 at 11:39:03AM +0200, Michał Kępień wrote:
> acpi_execute_simple_method() takes a method parameter which tells it to
> look for the given method underneath the given handle, so calling
> acpi_get_handle() beforehand is redundant.  Replace the call to
> acpi_get_handle() with a call to acpi_execute_simple_method(), thus
> eliminating the need for a local variable storing the handle.  Update
> debug message to reflect this change.  Also do not assign a default
> value to status as it has no influence on execution flow.
> 
> Signed-off-by: Michał Kępień <kernel@kempniu.pl>
> ---
> Darren,
> 
> This is patch 04/11 with updated debug and commit messages.  Now that
> you mentioned this issue, I think we should do the same for patch 2/3 in
> the call_fext_func() cleanup series [1].  Would you like me to just send
> an updated version of that specific patch (similarly to what I did in
> this case) or rather send v2 of the entire call_fext_func() cleanup
> series?

Thanks, looks good.

Now that there is more than one cleanup, please do just send a v2 of the entire
series. Less error prone that way.

Thanks,

-- 
Darren Hart
VMware Open Source Technology Center
