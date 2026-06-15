Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CAC2D0C8F;
	Mon, 15 Jun 2026 20:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554937; cv=none; b=bqr9fF8CBRVTu8xW5Ap1ZJYUh99ZTPQU2vdVqcE2Pnmjd2oZBiPIAxu7FPRnMD7ZBU7Dq/e0ohVMmRCZ7U2CL7j4fetrPriMDHTbbvNcLTc9kEo169CtRTydH83d3eiVgbv9b+n3RIK/kIRCcNYxhucunF2jh19mTlI5xvvr+yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554937; c=relaxed/simple;
	bh=kK+Ap+wXSiNvo0cijSa1wwVEGufjon18ITvlnma18Oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YoaHlKSbf8Qp0NaduhKrVohXc9kqZpDBOCAj8JCvBbU+cCrREEcsQ/RbZVJj+niIQtD1rbUAR+wNT2/Sz/6EE9GsvLRfJOKfREWhEqoH/rP306sm+eVdmR+4kDifzN1lPAUqwIMwhKljsD3rZcz/sVaz/voXKZCkTc1EvGkOh9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ZAjNoLN7; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ZAjNoLN7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781554919; x=1782159719; i=w_armin@gmx.de;
	bh=mA4iMH9PYDrALkcvMEZpgdGQR4GsNHs6ITA8hwBqZAE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZAjNoLN7Bi4NYJcjejT25WLDmH9SL3Ff37W4VRMGUNMjr0rmtV9f6h7WAZzcf5De
	 hQmjHujT1dRzgJt5g3/6cKEVOzFvylo5ps9A6PanhIu1n2x7/Cpl+JHQDTh+w6TxL
	 giONVW+8Kg3GTKODZuilkv0FpbfD4a5EQ6jXN6oKeWgPtRjMaytOa+pEHYpMfW7iz
	 ysbyuqJXGcXyzQHyGDYG8VsDrwoeQmjgZpTohYmEULq5VB03XBSYJFvxvHDQbwMJ1
	 BKObJMoKh2qMXuUQO+fIoEMF5VGJHYtsjj55tHdgadLf9UJ5A7FE2YH7FBRgnLIm5
	 iHCYVAG0HvGhaf6INA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvsEn-1xS0Qa1esR-00ta2g; Mon, 15
 Jun 2026 22:21:59 +0200
Message-ID: <5ddd81bd-b7eb-4c3f-b222-4fa3b4768d5b@gmx.de>
Date: Mon, 15 Jun 2026 22:21:57 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] KASAN: slab-use-after-free in _copy_to_user from
 platform/x86/dell-smbios-wmi
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: Shuangpeng Bai <shuangpeng.kernel@gmail.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, Dell.Client.Kernel@dell.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
References: <178144969601.60470.13396800403157907003@gmail.com>
 <543e7c0f-ae4b-49e4-8bdf-6bf7d0dc4775@gmx.de>
 <2026061525-dayroom-backspace-4273@gregkh>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <2026061525-dayroom-backspace-4273@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:oWzJClOsBMoUwIupx7XyAbJrFDByUzaS+DdFHZdkBCs7tsRxdvs
 tWVTjRjsE/eg6eSQQ2jT6LMJyK/T3DFy3jUw2jUvT6tOmi5IFE/lL81OqI2yZ73QtayZtPi
 5vwXuSXNSofLqCXpPz+Q1ypzzBsgr/eHdfKQ3ihljpoe8vqaiadja3k+/h7AaWw4tJIGC+0
 +lS9Wbve973nzeCQVQdSw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mwBHXZH8zf0=;zt9zo9lF1moOOfSkugUkq2zgaOf
 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

Am 15.06.26 um 15:30 schrieb gregkh@linuxfoundation.org:

> On Mon, Jun 15, 2026 at 02:19:16PM +0200, Armin Wolf wrote:
>> Am 14.06.26 um 21:15 schrieb Shuangpeng Bai:
>>
>>> Hi Kernel Maintainers,
>>>
>>> I hit the following report while testing current upstream kernel:
>>>
>>> KASAN: slab-use-after-free in _copy_to_user from platform/x86/dell-smbios-wmi
>>>
>>> on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)
>>>
>>> The reproducer and .config files are here.
>>> https://gist.github.com/shuangpengbai/f5b15c099e80897486b4238ddb91df79
>>>
>>> I'm happy to test debug patches or provide additional information.
>> It seems that unbinding the dell-smbios-wmi driver races with any outstanding
>> file operations on the misc device, causing them to access memory already freed
>> by the unbound driver.
> How can that happen if the module reference count is properly
> incremented when the file is open?  Perhaps the driver isn't doing that
> correctly?
>
>> I do not know if the misc device synchronizes file operations against removal,
>> but i do not think that this is the case. I added the maintains of the char drivers
>> to the discussion, maybe they know this.
> Wait, is this a module unload, or a manual "unbind" operation from
> sysfs?  Either way, this something that only root does, and is not part
> of any normal operation that a user can trigger, or should ever be
> doing, so it's kind of "best effort" if it works at all :)
>
> thanks,
>
> greg k-h

Its a "unbind" operation, either from sysfs or started by the WMI driver core.

I do not think that this has something to do with the module reference counter,
because the UAF is triggered by the device state container being freed:

1. devm_kzalloc() + misc_register()
2. open(), uses data previously allocated with devm_kzalloc()
3. unbind, misc_unregister() + freeing of state container data.
4. read(), access to already freed state container data.

I assume that misc_unregister() does not prevent read(), write() and ioctl()
on already opened file descriptors? If yes then i think a RW-lock inside the
driver would be necessary to synchronize the removal of the misc device with
any outstanding read()/ioctl() operations.

Thanks,
Armin Wolf

