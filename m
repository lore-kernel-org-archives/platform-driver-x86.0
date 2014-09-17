From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 17/22] thinkpad_acpi: Replace strnicmp with strncasecmp
Date: Wed, 17 Sep 2014 10:12:38 +0200
Message-ID: <87d2auis21.fsf@rasmusvillemoes.dk>
References: <1410900696-6481-1-git-send-email-linux@rasmusvillemoes.dk>
	<1410900696-6481-18-git-send-email-linux@rasmusvillemoes.dk>
	<20140916220857.GA12780@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:37281 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751849AbaIQIMl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Sep 2014 04:12:41 -0400
Received: by mail-lb0-f182.google.com with SMTP id u10so1274801lbd.41
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Sep 2014 01:12:40 -0700 (PDT)
In-Reply-To: <20140916220857.GA12780@vmdeb7> (Darren Hart's message of "Tue,
	16 Sep 2014 15:08:57 -0700")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Wed, Sep 17 2014, Darren Hart <dvhart@infradead.org> wrote:

> On Tue, Sep 16, 2014 at 10:51:31PM +0200, Rasmus Villemoes wrote:
>> The kernel used to contain two functions for length-delimited,
>> case-insensitive string comparison, strnicmp with correct semantics
>> and a slightly buggy strncasecmp. The latter is the POSIX name, so
>> strnicmp was renamed to strncasecmp, and strnicmp made into a wrapper
>> for the new strncasecmp to avoid breaking existing users.
>
> When was this done? As of this morning I still see them as independent functions
> in lib/string.c.

It will be in 3.18. I thought it had made it to linux-next, but should
have double-checked (and included the 3.18 info in the email); sorry.

http://thread.gmane.org/gmane.linux.kernel/1775150/focus=1775152

Rasmus
