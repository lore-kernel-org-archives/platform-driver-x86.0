From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH 2/3] ideapad: Add nodes in sysfs
Date: Thu, 02 Jun 2011 18:14:53 +0800
Message-ID: <4DE7629D.80205@canonical.com>
References: <1307006553-12667-1-git-send-email-ike.pan@canonical.com>	<1307006645-12702-1-git-send-email-ike.pan@canonical.com> <BANLkTik+-wMXcCgSb8cCWx6wxrT0JgAbpnbGqizCpk+3F6Wx_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:37522 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933310Ab1FBKPA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Jun 2011 06:15:00 -0400
In-Reply-To: <BANLkTik+-wMXcCgSb8cCWx6wxrT0JgAbpnbGqizCpk+3F6Wx_g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>

On 06/02/2011 05:48 PM, Corentin Chary wrote:
> Hi Ike,
> Why do you want to add /sys/devices/platform/ideapad/brightness and
>     /sys/devices/platform/ideapad/backlight ?
> Both of these files should be handled by the generic backlight class
> (using brightness and bl_power).

This is within VPC2004. In DSDT they are different device from generic
backlight.

and I try bl_power but can not turning off power of whole LCD. No idea
how screensaver do it, looks like just cut off video signal.
  
