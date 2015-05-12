From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH] x86: wmi: Remove private %pUL implementation
Date: Tue, 12 May 2015 14:06:27 +0200
Message-ID: <87r3qm6lvg.fsf@rasmusvillemoes.dk>
References: <1424787330-26770-1-git-send-email-linux@rasmusvillemoes.dk>
	<20150306175232.GC19001@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:36524 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932553AbbELMGa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 May 2015 08:06:30 -0400
Received: by lbbqq2 with SMTP id qq2so3957690lbb.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2015 05:06:28 -0700 (PDT)
In-Reply-To: <20150306175232.GC19001@vmdeb7> (Darren Hart's message of "Fri, 6
	Mar 2015 09:52:32 -0800")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Mar 06 2015, Darren Hart <dvhart@infradead.org> wrote:

> On Tue, Feb 24, 2015 at 03:15:30PM +0100, Rasmus Villemoes wrote:
>> The work performed by wmi_gtoa is equivalent to simply sprintf(out,
>> "%pUL", in), so one could replace its body by this. However, most
>> users feed the result directly as a %s argument to some other function
>> which also understands the %p extensions (they all ultimately use
>> vsnprintf), so we can eliminate some stack buffers and quite a bit of
>> code by just using %pUL directly.
>> 
>> In wmi_dev_uevent I'm not sure whether there's room for a
>> nul-terminator in env->buf, so I've just replaced wmi_gtoa with the
>> equivalent sprintf call.
>> 
>> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
>
> Nice cleanup, thanks Rasmus. Queued for 4.1.

Hi Darren

This seems to have fallen through the cracks - I don't see it in
4.1-rc3.

Rasmus
