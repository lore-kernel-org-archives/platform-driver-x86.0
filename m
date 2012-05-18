From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH] asus-wmi: enable resume on lid open
Date: Fri, 18 May 2012 09:41:13 +0200
Message-ID: <CAHR064jQK+1wqyK0iEuvx8=L1J1+7VgoW0mLADox_U6uYCzF4w@mail.gmail.com>
References: <1337233684-9370-1-git-send-email-acelan.kao@canonical.com>
	<CAHR064hLYACoOcguo8pJcOmfXJ37fPcKpZVVk+Xo0p4C7hKC1A@mail.gmail.com>
	<CAMz9Wg8q5c=eroVD7obBaWLES4Cq8mNixLH5wmi16cSpYMxipw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:49111 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759715Ab2ERHlP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 May 2012 03:41:15 -0400
Received: by bkcji2 with SMTP id ji2so2113809bkc.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 May 2012 00:41:13 -0700 (PDT)
In-Reply-To: <CAMz9Wg8q5c=eroVD7obBaWLES4Cq8mNixLH5wmi16cSpYMxipw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

>> I suppose this ASUS WMI spec isn't public at all ?
> Ah, no, it's confidential. but it's in grey area I think :p
>
>>
>>> After discussing with ASUS' BIOS engineer, they say wake on lid open
>>> doesn't have a uniq device ID(0x00120032) in the BIOS. It shares the same
>>> device ID with deep S3(0x00120031), and the deep S3(resume on lid open)
>>> is disable by default.
>>>
>>> It's reasonable to resume the system while opening the lid, so add it
>>> in the asus-wmi driver and tested the code on ASUS X100CH and ASUS 1015CX.y
>>
>> If there there a way to know what the current settings is and if it's
>> available ?
> Yes, there is a way to get the device status, but it do no harm if the
> device ID we queried is not exist.
>
>> If yes, could a sysfs file could be added to configure the behavior ?
> Where is the proper directory to contain it?
> This feature is nice to have, for people will turn it on always.

Somehting like the camera sysfs, but named lid_resume would be great.
This should be documented in
Documentation/ABI/testing/sysfs-platform-asus-wmi. Since it's a
setting, even if enabled by default, it's always better to let the
user override it.

-- 
Corentin Chary
http://xf.iksaif.net
