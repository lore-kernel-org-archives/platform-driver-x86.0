From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 2/4] acer-wmi: check the existence of internal 3G device
 when set capability
Date: Mon, 23 May 2011 08:51:12 +0200
Message-ID: <BANLkTik-bHzwPUwFZBsVmygfDCn7njW7aQ@mail.gmail.com>
References: <1306020834-5186-1-git-send-email-jlee@novell.com>
	<BANLkTimLV6kujMT8j5vkhmR0OFKH+q6SMw@mail.gmail.com>
	<4DDA8DC8020000230002CF41@novprvlin0050.provo.novell.com>
	<201105230741.44906.carlos@strangeworlds.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:64958 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752025Ab1EWGvO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 May 2011 02:51:14 -0400
Received: by ewy4 with SMTP id 4so1721421ewy.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 May 2011 23:51:13 -0700 (PDT)
In-Reply-To: <201105230741.44906.carlos@strangeworlds.co.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Joey Lee <jlee@novell.com>, dtor@mail.ru, mjg@redhat.com, trenn@suse.de, platform-driver-x86@vger.kernel.org

On Mon, May 23, 2011 at 8:41 AM, Carlos Corbacho
<carlos@strangeworlds.co.uk> wrote:
> On Monday 23 May 2011 07:39:36 Joey Lee wrote:
>> > I'm not sure you can drop sysfs files like that, as it will break the
>> > ABI.
>>>
>> > Could you document acer-wmi in
>> > Documentation/ABI/testing/sysfs-platform-acer-wmi.txt ?
>> > This allows to check when a sysfs file was added, who use it, etc...
>
> I don't agree, the 3G sysfs interface should just be dropped as it's the only
> remaining sysfs stuff for this driver - it's not worth documenting as it's
> already exposed as an rfkill device, and we've already dropped all the
> remaining sysfs interfaces a long time ago without going through any of this.
>
> Besides, anybody who used it (and I never could find any 3G users of Acer
> laptops on Linux) was never guaranteed it wouldn't break horribly anyway as we
> couldn't properly autodetect 3G in the past or knew much about it other than
> Acer's WMI API suggested it existed.

I asked for documentation because I didn't check if there were other
sysfs files remaining, if it's the last, we don't really care.
I did a quick search, and you're right, this file doesn't seems to
have a lot of user, but it would still break the ABI without any
notice.
I would be more confortable with one or two cycle with this feature
marked as deprecated and scheduled for removal.

-- 
Corentin Chary
http://xf.iksaif.net
