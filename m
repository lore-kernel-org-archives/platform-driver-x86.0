From: Daniel Drake <dsd@laptop.org>
Subject: Re: [PATCH] Add OLPC XO-1 rfkill driver
Date: Thu, 14 Oct 2010 20:33:27 +0100
Message-ID: <AANLkTik7iFTCkvoZfw3iy6BamhQG_6FzabpKuu4V0G7A@mail.gmail.com>
References: <20101004171520.4B0189D401B@zog.reactivated.net>
	<20101004172807.GA10189@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:35019 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755693Ab0JNTd2 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Oct 2010 15:33:28 -0400
In-Reply-To: <20101004172807.GA10189@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: dilinger@queued.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Matthew,

On 4 October 2010 18:28, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
>> + =A0 =A0 printk(KERN_INFO "%s: loading\n", pdev->name);
>
> Probably don't need this. Otherwise, looks fine.

Thanks for reviewing.
I posted an updated patch here:
https://patchwork.kernel.org/patch/233031/

The supporting arch/x86 code has now been merged into the x86 tree, so
can the rfkill driver now go into yours?

Thanks,
Daniel
