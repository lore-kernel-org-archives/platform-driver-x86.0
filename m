From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] eeepc-wmi: Add support for T101MT "Express Gate" key
Date: Thu, 24 Mar 2011 13:26:00 +0000
Message-ID: <AANLkTinpKXM+gjJS9zVJNzkH+gTrzTNxz-C=CTXqKnN1@mail.gmail.com>
References: <1300909189-4135-1-git-send-email-seth.forshee@canonical.com>
	<AANLkTinZpt8qmHzhe4WyteMt-C-nkVNwEGQVvq3Nk9Lx@mail.gmail.com>
	<20110324131414.GA20612@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:41223 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756909Ab1CXN0C (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Mar 2011 09:26:02 -0400
In-Reply-To: <20110324131414.GA20612@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Seth Forshee <seth.forshee@canonical.com>

>> Also, it would be great to preserve key up and key down informations
>> (sparse keymap have an "autorelease" parameter to control that).
>
> Okay, I'll add some special casing for this key to support that.

You may have to add an optional callback for that in asus-wmi's driver
model because it's used by both asus-nb-wmi and eeepc-wmi, and we only
want this behavior for eeepc-wmi.

> Do you suggest ignoring the 0xea scan codes?

Yep, 0xea means "The key is still pressed", but it's useless if we
already repport key down and key up events correctly.
You'll have to ignore this scan code explicitly to remove traces in
dmesg (use KEY_IGNORE).

-- 
Corentin Chary
http://xf.iksaif.net
