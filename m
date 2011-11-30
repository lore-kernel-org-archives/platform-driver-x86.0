From: John Hughes <john@Calva.COM>
Subject: Re: drivers/platform/x86/sony-laptop.c: fix scancodes
Date: Wed, 30 Nov 2011 14:22:42 +0100
Message-ID: <4ED62E22.60307@Calva.COM>
References: <20111130125545.GA5815@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from oceanic.CalvaEDI.COM ([89.202.194.168]:51159 "EHLO
	oceanic.CalvaEDI.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752709Ab1K3NWu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 30 Nov 2011 08:22:50 -0500
In-Reply-To: <20111130125545.GA5815@elgon.mountain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: platform-driver-x86@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On 30/11/11 13:55, Dan Carpenter wrote:
> Hi John,
>
> Commit 04840b50f395 "drivers/platform/x86/sony-laptop.c: fix scancode=
s"
> introduces a gcc warning:
>
> drivers/platform/x86/sony-laptop.c:395:14: warning:
> 	=E2=80=98scancode=E2=80=99 may be used uninitialized in this functio=
n [-Wuninitialized]

Ok, that's a dumb bug on my part.

I'll make a better patch this evening.
