From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH] acer-wmi: check wireless capability on AMW0_GUID2 machines
Date: Mon, 09 Jan 2012 08:01:25 +0000
Message-ID: <3474148.WRXZ4siLlh@valkyrie>
References: <1326090677-25942-1-git-send-email-jlee@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:52742 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751135Ab2AIIBa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Jan 2012 03:01:30 -0500
Received: by werm1 with SMTP id m1so2397159wer.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Jan 2012 00:01:29 -0800 (PST)
In-Reply-To: <1326090677-25942-1-git-send-email-jlee@suse.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

On Monday 09 Jan 2012 14:31:17 Lee, Chun-Yi wrote:
> From: "Lee, Chun-Yi" <jlee@suse.com>
> 
> Have many non-acer machines have AMW0_GUID2 method in DSDT, in
> original acer-wmi design, driver direct set ACER_CAP_WIRELESS flag
> for those machines but didn't check the functionality for set/get
> wireless state.
> It causes acer-wmi driver create a broken wireless rfkill and it
> already set to soft blocked.
> 
> So, this patch add a wireless capability check before we set
> ACER_CAP_WIRELESS flag to the machines that were included AMW0_GUID2.
> It avoid acer-wmi create a broken wireless rfkill.
> 
> Thank's for Matthew Garrett give the idea.
> 
> Reference: brc#674353
>         https://bugzilla.redhat.com/show_bug.cgi?id=674353
> 
> Tested on Lenovo E520.
> Tested on Acer TravelMate 4750.

Is there really no other way to detect the availability of wireless on 
hardware with that GUID without resorting to poking stuff to see if it sticks?

My assumption has always been that there must be of finding out, but I've never 
had the hardware to check that with.

-Carlos
