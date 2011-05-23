From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH 2/4] acer-wmi: check the existence of internal 3G device when set capability
Date: Mon, 23 May 2011 07:41:44 +0100
Message-ID: <201105230741.44906.carlos@strangeworlds.co.uk>
References: <1306020834-5186-1-git-send-email-jlee@novell.com> <BANLkTimLV6kujMT8j5vkhmR0OFKH+q6SMw@mail.gmail.com> <4DDA8DC8020000230002CF41@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:64776 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751934Ab1EWGmP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 May 2011 02:42:15 -0400
Received: by wya21 with SMTP id 21so3953794wya.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 May 2011 23:42:14 -0700 (PDT)
In-Reply-To: <4DDA8DC8020000230002CF41@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: corentin.chary@gmail.com, dtor@mail.ru, mjg@redhat.com, trenn@suse.de, platform-driver-x86@vger.kernel.org

On Monday 23 May 2011 07:39:36 Joey Lee wrote:
> > I'm not sure you can drop sysfs files like that, as it will break the
> > ABI.
>>
> > Could you document acer-wmi in
> > Documentation/ABI/testing/sysfs-platform-acer-wmi.txt ?
> > This allows to check when a sysfs file was added, who use it, etc...

I don't agree, the 3G sysfs interface should just be dropped as it's the only 
remaining sysfs stuff for this driver - it's not worth documenting as it's 
already exposed as an rfkill device, and we've already dropped all the 
remaining sysfs interfaces a long time ago without going through any of this.

Besides, anybody who used it (and I never could find any 3G users of Acer 
laptops on Linux) was never guaranteed it wouldn't break horribly anyway as we 
couldn't properly autodetect 3G in the past or knew much about it other than 
Acer's WMI API suggested it existed.

-Carlos
