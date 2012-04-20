From: Akio Idehara <zbe64533@gmail.com>
Subject: Re: [PATCH] toshiba_acpi: Only register backlight device when interface
 is read/write
Date: Sat, 21 Apr 2012 00:40:42 +0900
Message-ID: <4F91837A.4070509@gmail.com>
References: <1334852630-8829-1-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:47209 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932715Ab2DTPkq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Apr 2012 11:40:46 -0400
Received: by dake40 with SMTP id e40so13173816dak.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Apr 2012 08:40:46 -0700 (PDT)
In-Reply-To: <1334852630-8829-1-git-send-email-seth.forshee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: seth.forshee@canonical.com
Cc: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

Seth Forshee wrote:

> Currently the backlight device is registered unconditionally, but many
> (probably most) Toshibas either don't support HCI_LCD_BRIGHTNESS or only
> support reading from it. This patch adds a test of HCI_LCD_BRIGHTNESS
> during initialization and only registers the backlight device if this
> interface supports both reads and writes.
> 
> Cc: Akio Idehara <zbe64533@gmail.com>
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
> ---
> Matthew,
> 
> Please consider applying this as a fix for 3.4.
> 
> This is certainly going to conflict with Akio's tr_backlight patch, but
> I made no attempt at merging the two since the tr_backlight patch is not
> applied yet and is probably 3.5 material anyway. I'm more than happy to
> work with Akio to fix up the conflicts.


This is working fine for me. Thank you!

I'll try to merge my tr_backlight patch after this patch is applied.


Tested-by: Akio Idehara <zbe64533@gmail.com>
