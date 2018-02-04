From: Alexander Sergeyev <sergeev917@gmail.com>
Subject: Re: PROBLEM: NULL pointer dereference in dell_set_arguments() in 4.15
Date: Sun, 4 Feb 2018 12:23:33 +0300
Message-ID: <20180204092333.GA2010@localhost.localdomain>
References: <20180203162021.GA4571@localhost.localdomain>
 <e489f5ee-34e5-4777-afe7-38d31d2ad3fd@Dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:35399 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750798AbeBDJTv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 4 Feb 2018 04:19:51 -0500
Content-Disposition: inline
In-Reply-To: <e489f5ee-34e5-4777-afe7-38d31d2ad3fd@Dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, mjg59@srcf.ucam.org, pali.rohar@gmail.com, platform-driver-x86@vger.kernel.org

Mario,

>Would you please try https://patchwork.kernel.org/patch/10194287/
>And see if it cleans up this null pointer dereference?

Yes, it does.

Is there any estimates on when the patch will be merged into mainline? I want 
to put something into my distribution bug tracker, but it's unlikely they will 
use this patch before its stabilization.

>As for your suspend problem did you pick up the new firmware that contained 
>the microcode update for Spectre? Or a microcode update from your 
>distribution?

Yes, around a month ago (the firmware option). Still, there is a time frame 
between the firmware update and the problem surfacing. As I said it was 
eliminated by switching POST/fastboot to the thorough mode. I just have tried 
to reproduce the problem with previous settings, but with no success. So, that 
is (in a way) closed, but I have no idea what it was about.

Thank you.
